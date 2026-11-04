//! The builtin types and attributes as `mlir-opt` reads them (`AsmParser`): affine maps and
//! sets, hex `dense` data, vector element types.

use alloc::string::{String, ToString};
use alloc::vec::Vec;

use super::{DialectRules, Invalid, Verifier};
use crate::affine_expr::{Map, Set};
use crate::{AffineMap, Attribute, IntegerSet, ShapedKind, Type};

/// The builtin dialect's rules.
pub(super) struct Builtin;

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
                _ => Ok(()),
            },
        }
    }
}

impl Builtin {
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
                let shaped = Type::Shaped(crate::Shaped { extras: Vec::new(), ..s.clone() }).to_string();
                let head = shaped.strip_suffix('>').unwrap_or(&shaped);
                alloc::format!("{head}{}>", extras.iter().map(|e| alloc::format!(",{e}")).collect::<String>())
            }
            t => t.to_string(),
        };
        text.chars().filter(|c| !c.is_whitespace()).collect::<String>().replace(",offset:0>", ">")
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
            Type::Shaped(s) if s.kind == ShapedKind::Vector && matches!(*s.elem, Type::Shaped(_) | Type::Function(_) | Type::Tuple(_) | Type::NoneType | Type::Complex(_)) => Err(Invalid::VectorElement(s.elem.to_string())),
            _ => Ok(()),
        }
    }

    fn attr(&self, _v: &Verifier<'_>, a: &Attribute<'_>) -> Result<(), Invalid> {
        match a {
            Attribute::Builtin { name, body, ty } => Keyword::try_from(&**name).map_or(Ok(()), |k| k.verify(body, ty.as_ref())),
            _ => Ok(()),
        }
    }
}
