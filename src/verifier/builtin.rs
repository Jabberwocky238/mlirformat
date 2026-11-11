//! The builtin types and attributes as `mlir-opt` reads them (`AsmParser`): affine maps and
//! sets, hex `dense` data, vector element types.

use alloc::string::{String, ToString};
use alloc::vec::Vec;

use super::{DialectRules, Invalid, Verifier};
use crate::affine_expr::{Map, Set};
use crate::{AffineMap, Attribute, IntegerSet, Parser, ShapedKind, Type};

/// The builtin dialect's rules.
pub(super) struct Builtin;

/// The kinds of literal in a `dense<..>` body.
#[derive(Clone, Copy, Default)]
struct Literals {
    /// `1.5`, `2e3`.
    float: bool,
    /// `4`, `-4`: decimal, not `0x..` bits.
    int: bool,
    /// `true`, `false`.
    bool: bool,
}

impl core::ops::BitOr for Literals {
    type Output = Self;
    #[inline]
    fn bitor(self, o: Self) -> Self {
        Self { float: self.float | o.float, int: self.int | o.int, bool: self.bool | o.bool }
    }
}

keywords! {
    /// The builtin keyword attributes whose body is checked.
    enum Keyword {
        AffineMap = "affine_map",
        AffineSet = "affine_set",
        Dense = "dense",
    }
}

impl Keyword {
    /// `dense<"0x..."> : T`: hex digits after `0x`, as many bytes as one element (a splat) or
    /// all of them (`DenseElementsAttr::isValidRawBuffer`). An `i1` (bit-packed) is not checked.
    fn dense_hex(hex: &str, ty: Option<&Type<'_>>) -> bool {
        let Some(digits) = hex.strip_prefix("0x").filter(|d| !d.is_empty() && d.len() % 2 == 0 && d.bytes().all(|c| c.is_ascii_hexdigit())) else { return false };
        let bytes = match ty.map(Type::element_type) {
            Some(Type::Complex(t)) => t.bit_width().map(|w| 2 * w.div_ceil(8)),
            Some(t) => t.bit_width().filter(|w| *w > 1).map(|w| w.div_ceil(8)),
            None => None,
        };
        match (bytes, ty.and_then(Type::element_count)) {
            (Some(b), Some(n)) => [b as usize, b as usize * n].contains(&(digits.len() / 2)),
            _ => true,
        }
    }

    /// The shape of a `dense` literal (`[[1, 2], [3, 4]]` ⇒ `[2, 2]`, a scalar ⇒ `None`: a
    /// splat), and what kinds of literal are in it; `Err` for lists of uneven shapes.
    fn literal(text: &str) -> Result<(Option<Vec<usize>>, Literals), ()> {
        let text = text.trim();
        let Some(inner) = text.strip_prefix('[').and_then(|t| t.strip_suffix(']')) else {
            // A scalar: a number, `true` / `false`, a `(re, im)` pair, a string.
            if let Some(pair) = text.strip_prefix('(').and_then(|t| t.strip_suffix(')')) {
                return Ok((None, pair.split(',').try_fold(Literals::default(), |acc, x| Self::literal(x).map(|(_, l)| acc | l))?));
            }
            let digits = text.strip_prefix('-').unwrap_or(text);
            let number = digits.starts_with(|c: char| c.is_ascii_digit()) && !digits.starts_with("0x");
            let float = number && digits.contains(['.', 'e', 'E']);
            return Ok((None, Literals { float, int: number && !float, bool: matches!(text, "true" | "false") }));
        };
        let mut items = Vec::new();
        let (mut depth, mut start, mut quoted) = (0i32, 0, false);
        for (i, c) in inner.char_indices() {
            match c {
                '"' => quoted = !quoted,
                _ if quoted => {}
                '[' | '(' => depth += 1,
                ']' | ')' => depth -= 1,
                ',' if depth == 0 => {
                    items.push(&inner[start..i]);
                    start = i + 1;
                }
                _ => {}
            }
        }
        if !inner.trim().is_empty() {
            items.push(&inner[start..]);
        }
        let mut shape: Option<Option<Vec<usize>>> = None;
        let mut kinds = Literals::default();
        for item in &items {
            let (s, l) = Self::literal(item)?;
            kinds = kinds | l;
            match &shape {
                Some(prev) if *prev != s => return Err(()),
                Some(_) => {}
                None => shape = Some(s),
            }
        }
        let mut out = alloc::vec![items.len()];
        out.extend(shape.flatten().unwrap_or_default());
        Ok((Some(out), kinds))
    }

    /// `dense<literal> : T`: the literal's shape is `T`'s (or it is one splat value), an integer
    /// `T` has no float literal, a float `T` no decimal integer or `true` (`TensorLiteralParser`
    /// in `AttributeParser.cpp`). A dialect shaped type (`!spirv.coopmatrix<16x16xf32, ..>`)
    /// has its element type checked only.
    fn dense_literal(body: &str, ty: Option<&Type<'_>>) -> bool {
        // A literal over several lines may carry `//` comments.
        let body: String = body.lines().map(|l| l.split_once("//").map_or(l, |(code, _)| code)).collect::<Vec<_>>().join("\n");
        let Ok((shape, kinds)) = Self::literal(&body) else { return false };
        let elem = match ty {
            Some(Type::Extended(e)) => e.shaped_elem(),
            Some(t) => Some(t.element_type().owned()),
            None => None,
        };
        let float_elem = match &elem {
            Some(Type::Complex(t)) => matches!(**t, Type::Float(_)),
            Some(t) => matches!(t, Type::Float(_)),
            None => false,
        };
        if float_elem && (kinds.int || kinds.bool) || kinds.float && matches!(elem, Some(Type::Integer { .. } | Type::Index)) {
            return false;
        }
        let Some(Type::Shaped(s)) = ty else { return true };
        let Some(dims) = s.shape.as_ref().and_then(|d| d.iter().map(|d| if let crate::Dim::Static(n) = d { usize::try_from(*n).ok() } else { None }).collect::<Option<Vec<usize>>>()) else { return true };
        shape.is_none_or(|sh| sh == dims || (dims.is_empty() && sh.is_empty()))
    }

    /// Does a `dense` of type `ty` hold numbers (integers, floats, `index`, complex numbers),
    /// a dialect shaped type's too?
    fn numeric(ty: Option<&Type<'_>>) -> bool {
        let elem = match ty {
            Some(Type::Extended(e)) if e.name.contains('.') => e.shaped_elem(),
            Some(t) => Some(t.element_type().owned()),
            None => None,
        };
        matches!(elem, Some(Type::Integer { .. } | Type::Float(_) | Type::Index | Type::Complex(_)))
    }

    /// `dense<T : [..]>` (type-first, `parseDenseElementsAttrTyped`): `T` a statically shaped
    /// type, elements nested as its shape (or one splat), each converting to its element type
    /// (`DenseElementTypeInterface::convertFromAttribute`). `None`: not that form (it starts
    /// with no type), or holds an element type not known here; `Some(false)`: `mlir-opt`
    /// rejects it.
    fn dense_typed(inner: &str) -> Option<bool> {
        let opt = crate::MlirOpt::new();
        let mut p = Parser::new(inner, &opt);
        p.ws();
        if p.rest().starts_with('(') {
            return None;
        }
        let save = p.pos();
        let Ok(ty) = p.ty() else {
            p.seek(save);
            return None;
        };
        let Type::Shaped(s) = &ty else { return Some(false) };
        let Some(dims) = s.shape.as_ref().and_then(|d| d.iter().map(|d| if let crate::Dim::Static(n) = d { Some(*n) } else { None }).collect::<Option<Vec<i64>>>()) else {
            return Some(false);
        };
        let ok = (|| {
            p.expect(":")?;
            let mut elems = Vec::new();
            p.ws();
            if p.rest().starts_with('[') && !dims.is_empty() {
                Self::dense_elements(&mut p, &dims, &mut elems)?;
            } else {
                elems.push(p.attr()?);
            }
            p.ws();
            if p.rest().is_empty() { Ok(elems) } else { p.err("expected '>' to close dense attribute") }
        })();
        let Ok(elems) = ok else { return Some(false) };
        elems.iter().map(|a| Self::converts(&s.elem, a)).collect::<Option<Vec<bool>>>().map(|ok| ok.into_iter().all(|x| x))
    }

    /// A type-first `dense`'s elements: `[..]` lists nested as `dims`, each list as long as its
    /// dimension.
    fn dense_elements<'a>(p: &mut Parser<'a, '_>, dims: &[i64], out: &mut Vec<Attribute<'a>>) -> crate::R<()> {
        let Some((&n, inner)) = dims.split_first() else {
            out.push(p.attr()?);
            return Ok(());
        };
        p.expect("[")?;
        let mut count = 0;
        if !p.eat("]") {
            loop {
                Self::dense_elements(p, inner, out)?;
                count += 1;
                if !p.eat(",") {
                    break;
                }
            }
            p.expect("]")?;
        }
        if count != n {
            return p.err(alloc::format!("expected {n} elements in dimension, got {count}"));
        }
        Ok(())
    }

    /// `convertFromAttribute` of element type `elem`: an integer (`index`) of exactly that type,
    /// a float of that type, a complex number as `[re, im]`, a tosa type's, `!test.dense_element`'s
    /// (any 32-bit integer). `None`: an element type not known here.
    fn converts(elem: &Type<'_>, a: &Attribute<'_>) -> Option<bool> {
        Some(match elem {
            Type::Integer { .. } | Type::Index => matches!(a, Attribute::Int { ty: Some(t), .. } if t == elem),
            Type::Float(_) => matches!(a, Attribute::Float { ty: Some(t), .. } if t == elem),
            Type::Complex(e) => match a {
                Attribute::Array(xs) if xs.len() == 2 => xs.iter().all(|x| Self::converts(e, x) == Some(true)),
                _ => false,
            },
            Type::Extended(e) if e.name == "test.dense_element" => matches!(a, Attribute::Int { ty: Some(t), .. } if t.bit_width() == Some(32)),
            t => return super::tosa::Tosa::dense_element(t, a),
        })
    }

    /// Its raw body (`<(d0) -> (d0)>`) as `mlir-opt` would read it.
    fn verify(self, body: &str, ty: Option<&Type<'_>>) -> Result<(), Invalid> {
        let inner = body.trim().strip_prefix('<').and_then(|b| b.strip_suffix('>')).unwrap_or(body);
        match self {
            Keyword::AffineMap => Map::try_from(inner).ok().filter(|m| m.check().is_ok() && AffineMap::try_from(m).is_ok()).map(drop).ok_or_else(|| Invalid::AffineMap(body.into())),
            Keyword::AffineSet => Set::try_from(inner).ok().filter(|s| s.check().is_ok() && IntegerSet::try_from(s).is_ok()).map(drop).ok_or_else(|| Invalid::AffineSet(body.into())),
            // Only the hex form: a quoted body of numbers (of anything else, a dialect string
            // type, it is strings).
            Keyword::Dense => match inner.trim().strip_prefix('"').and_then(|h| h.strip_suffix('"')) {
                Some(hex) if ty.map(Type::element_type).is_some_and(|t| matches!(t, Type::Integer { .. } | Type::Float(_) | Type::Index | Type::Complex(_))) && !Self::dense_hex(hex, ty) => Err(Invalid::DenseHex(body.into())),
                Some(_) => Ok(()),
                // Type-first: what the element type's `convertFromAttribute` takes.
                None if Self::dense_typed(inner) == Some(false) => Err(Invalid::DenseLiteral(body.into())),
                // A literal of numbers.
                None if !inner.trim().is_empty() && Self::numeric(ty) && !Self::dense_literal(inner, ty) => Err(Invalid::DenseLiteral(body.into())),
                None => Ok(()),
            },
        }
    }
}

impl Builtin {
    /// Does integer literal `lit` fit a `width`-bit integer (`IntegerAttr` parsing)? Signed:
    /// `[-2^(w-1), 2^(w-1))`; unsigned: `[0, 2^w)`; signless: either.
    fn fits(lit: &str, s: crate::Signedness, width: u32) -> bool {
        let (neg, digits) = lit.strip_prefix('-').map_or((false, lit), |d| (true, d));
        let Some(v) = (match digits.strip_prefix("0x") {
            Some(h) => u128::from_str_radix(h, 16).ok(),
            None => digits.parse::<u128>().ok(),
        }) else {
            return width >= 128;
        };
        if width >= 127 {
            return true;
        }
        let (umax, smax) = ((1u128 << width) - 1, if width == 0 { 0 } else { (1u128 << (width - 1)) - 1 });
        let smin = if width == 0 { 0 } else { 1u128 << (width - 1) };
        match (s, neg) {
            (crate::Signedness::Unsigned, true) => v == 0,
            (crate::Signedness::Unsigned, false) => v <= umax,
            (crate::Signedness::Signed, true) => v <= smin,
            (crate::Signedness::Signed, false) => v <= smax,
            (crate::Signedness::Signless, true) => v <= smin,
            (crate::Signedness::Signless, false) => v <= umax,
        }
    }

    /// Is integer literal `lit` the bits of a `width`-bit float: hex, not negative, no more
    /// active bits than the float has?
    fn float_bits(lit: &str, width: u32) -> bool {
        let Some(hex) = lit.strip_prefix("0x") else { return false };
        let digits = hex.trim_start_matches('0');
        let top = digits.chars().next().and_then(|c| c.to_digit(16)).map_or(0, |d| 32 - d.leading_zeros());
        (digits.len() as u32).saturating_sub(1) * 4 + top <= width
    }

    /// The same type, as MLIR compares the types it built: text kept in a body may be spaced
    /// otherwise (`strided<[?,?]>`), and a memref's default spellings mean nothing
    /// (`MemRefType::get` drops a `0` memory space, an identity map and an `offset: 0`; `1 : i64`
    /// is `1`).
    pub(super) fn same(a: &Type<'_>, b: &Type<'_>) -> bool {
        a == b || Self::canonical(a) == Self::canonical(b)
    }

    /// The text two equal types share.
    fn canonical(t: &Type<'_>) -> String {
        let text = match t {
            Type::Shaped(s) if s.kind == ShapedKind::MemRef => {
                // An identity map layout is no layout either.
                let identity = |a: &Attribute<'_>| AffineMap::try_from(a).is_ok_and(|m| m.syms == 0 && m.is_identity());
                let mut extras: Vec<String> = s.extras.iter().filter(|a| !identity(a)).map(|a| match a {
                    Attribute::Int { lit, ty: None | Some(Type::Integer { width: 64, .. }) } => lit.to_string(),
                    a => a.to_string(),
                }).collect();
                if extras.last().is_some_and(|m| m == "0") {
                    extras.pop();
                }
                let shaped = Type::Shaped(alloc::boxed::Box::new(crate::Shaped { extras: Vec::new(), ..*s.clone() })).to_string();
                let head = shaped.strip_suffix('>').unwrap_or(&shaped);
                alloc::format!("{head}{}>", extras.iter().map(|e| alloc::format!(",{e}")).collect::<String>())
            }
            t => t.to_string(),
        };
        let text = text.chars().filter(|c| !c.is_whitespace()).collect::<String>().replace(",offset:0>", ">");
        super::quant::Quant::canonical(&text)
    }
}

impl DialectRules for Builtin {
    #[inline]
    fn namespace(&self) -> &'static str {
        "builtin"
    }

    /// A vector holds integers, floats, `index` or a dialect's `VectorElementTypeInterface`
    /// type (`!llvm.ptr`); no other builtin type.
    fn ty(&self, _v: &Verifier<'_>, t: &Type<'_>) -> Result<(), Invalid> {
        match t {
            Type::Shaped(s) if s.kind == ShapedKind::Vector && matches!(*s.elem, Type::Shaped(_) | Type::Function(_) | Type::Tuple(_) | Type::NoneType | Type::Token | Type::Complex(_)) => Err(Invalid::VectorElement(s.elem.to_string())),
            _ => Ok(()),
        }
    }

    fn attr(&self, _v: &Verifier<'_>, a: &Attribute<'_>) -> Result<(), Invalid> {
        match a {
            Attribute::Builtin { name, body, ty } => Keyword::try_from(&**name).map_or(Ok(()), |k| k.verify(body, ty.as_ref())),
            // A float is spelled as one, or as hex bits that fit it, unsigned
            // (`Parser::parseFloatFromIntegerLiteral`).
            Attribute::Int { lit, ty: Some(t @ Type::Float(_)) } if !Self::float_bits(lit, t.bit_width().unwrap_or(128)) => Err(Invalid::FloatLiteral(a.to_string())),
            Attribute::Float { ty: Some(t), .. } if !matches!(t, Type::Float(_)) && !matches!(t, Type::Extended(e) if !e.name.contains('.')) => Err(Invalid::FloatType(a.to_string())),
            // An integer fits its type (`-1 : i0` does not): signless takes either reading.
            Attribute::Int { lit, ty: Some(Type::Integer { signedness, width }) } if !Self::fits(lit, *signedness, *width) => Err(Invalid::IntRange(a.to_string())),
            // `DenseArrayAttr`: of integers or floats (`array<index: ..>` is not).
            Attribute::DenseArray { ty, .. } if !matches!(ty, Type::Integer { .. } | Type::Float(_)) => Err(Invalid::DenseArrayType(ty.to_string())),
            // `DenseArrayAttr`: whole bytes per element (`array<tf32: ..>` is not), `i1` aside.
            Attribute::DenseArray { ty, .. } if ty.bit_width().is_some_and(|w| w > 1 && w % 8 != 0) => Err(Invalid::DenseArrayWidth(ty.to_string())),
            _ => Ok(()),
        }
    }
}
