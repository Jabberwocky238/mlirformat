//! ⭐ Constant attributes as numbers: `IntegerAttr`, `FloatAttr`, `BoolAttr` and
//! `DenseElementsAttr` (splat or not) ⇄ [`Const`], printed back exactly as MLIR prints them.

use alloc::borrow::Cow;
use alloc::format;
use alloc::string::String;
use alloc::vec;
use alloc::vec::Vec;

use crate::{ApFloat, ApInt, Attribute, Dim, FloatKind, Shaped, Signedness, Type, WideFloat};

/// The widest integer parsed and printed through `i128` / `u128`.
const NARROW_INT: u32 = 128;

/// One element.
#[derive(Debug, Clone, Copy, PartialEq, Eq)]
pub enum Scalar {
    Int(ApInt),
    Float(ApFloat),
    /// A `complex<iN>` element: the real and the imaginary part.
    Complex(ApInt, ApInt),
    /// A `complex<fN>` element.
    ComplexFloat(ApFloat, ApFloat),
    /// An `f80` / `f128` element that is exactly an `f64` (no arithmetic on it).
    Wide(WideFloat),
}

impl Scalar {
    pub fn int(self) -> Option<ApInt> {
        match self {
            Scalar::Int(i) => Some(i),
            _ => None,
        }
    }

    pub fn float(self) -> Option<ApFloat> {
        match self {
            Scalar::Float(f) => Some(f),
            _ => None,
        }
    }

    /// A complex element of the two parts, both integers or both floats.
    pub fn complex(re: Scalar, im: Scalar) -> Option<Self> {
        match (re, im) {
            (Scalar::Int(a), Scalar::Int(b)) => Some(Scalar::Complex(a, b)),
            (Scalar::Float(a), Scalar::Float(b)) => Some(Scalar::ComplexFloat(a, b)),
            _ => None,
        }
    }

    /// A complex element's real and imaginary parts.
    pub fn parts(self) -> Option<[Scalar; 2]> {
        match self {
            Scalar::Complex(a, b) => Some([Scalar::Int(a), Scalar::Int(b)]),
            Scalar::ComplexFloat(a, b) => Some([Scalar::Float(a), Scalar::Float(b)]),
            _ => None,
        }
    }

    /// `self` as a float of `kind`, when nothing is lost (`f80` / `f128` included).
    pub fn convert_float(self, kind: FloatKind) -> Option<Self> {
        let value = match self {
            Scalar::Float(f) => f.to_f64(),
            Scalar::Wide(w) => w.value,
            _ => return None,
        };
        if WideFloat::wide(kind) {
            return WideFloat::of(kind, value).map(Scalar::Wide);
        }
        let f = ApFloat::from_f64(kind, value)?;
        (f.to_f64().to_bits() == value.to_bits()).then_some(Scalar::Float(f))
    }

    /// The zero of element type `ty` (`(0, 0)` for a complex one).
    pub fn zero(ty: &Type<'_>) -> Option<Self> {
        match ty {
            Type::Complex(part) => Self::complex(Self::zero(part)?, Self::zero(part)?),
            Type::Float(k) if WideFloat::wide(*k) => WideFloat::of(*k, 0.0).map(Scalar::Wide),
            Type::Float(k) => ApFloat::from_f64(*k, 0.0).map(Scalar::Float),
            t => t.int_width().map(|(w, _)| Scalar::Int(ApInt::zero(w))),
        }
    }
}

/// A constant: `values` (one per element; one for a scalar or a splat) of type `ty`.
#[derive(Debug, Clone, PartialEq)]
pub struct Const<'a> {
    pub ty: Type<'a>,
    pub values: Vec<Scalar>,
    /// A `DenseElementsAttr` (`ty` is shaped), as opposed to a scalar attribute.
    pub elements: bool,
}

impl Scalar {
    /// An element literal of element type `ty`.
    fn parse(lit: &str, ty: &Type<'_>) -> Option<Self> {
        let lit = lit.trim();
        if let Type::Complex(part) = ty {
            let (re, im) = lit.strip_prefix('(')?.strip_suffix(')')?.split_once(',')?;
            return Self::complex(Self::parse(re, part)?, Self::parse(im, part)?);
        }
        match ty {
            Type::Float(k) if WideFloat::wide(*k) => WideFloat::parse(*k, lit).map(Scalar::Wide),
            Type::Float(k) => {
                // Integer-looking hex is the bits; a decimal integer is the value.
                let f = if lit.starts_with("0x") || lit.contains(['.', 'e', 'E']) || lit.contains("inf") || lit.contains("nan") {
                    ApFloat::parse(*k, lit)?
                } else {
                    ApFloat::from_f64(*k, lit.parse::<f64>().ok()?)?
                };
                Some(Scalar::Float(f))
            }
            t => {
                let (w, sign) = t.int_width()?;
                if w > NARROW_INT {
                    return Some(Scalar::Int(match lit {
                        "true" => ApInt::from_bits(w, 1),
                        "false" => ApInt::zero(w),
                        _ => match lit.strip_prefix("0x") {
                            Some(h) => ApInt::parse_hex(w, h)?,
                            None => ApInt::parse_decimal(w, lit)?,
                        },
                    }));
                }
                let v = match lit {
                    "true" => 1,
                    "false" => 0,
                    _ => match lit.strip_prefix("0x") {
                        Some(h) => u128::from_str_radix(h, 16).ok()? as i128,
                        None if sign == Signedness::Unsigned => lit.parse::<u128>().ok()? as i128,
                        None => lit.parse::<i128>().ok()?,
                    },
                };
                Some(Scalar::Int(ApInt::new(w, v)))
            }
        }
    }

    /// The element as MLIR prints it for element type `ty`.
    fn print(self, ty: &Type<'_>) -> String {
        if let Some([re, im]) = self.parts() {
            let part = if let Type::Complex(p) = ty { &**p } else { ty };
            return format!("({},{})", re.print(part), im.print(part));
        }
        match self {
            Scalar::Float(f) => f.print(),
            Scalar::Wide(w) => w.print(),
            Scalar::Int(i) => match ty.int_width() {
                Some((1, _)) => String::from(if i.is_zero() { "false" } else { "true" }),
                Some((w, sign)) if w > NARROW_INT => i.to_decimal(sign != Signedness::Unsigned),
                Some((_, Signedness::Unsigned)) => format!("{}", i.unsigned()),
                _ => format!("{}", i.signed()),
            },
            Scalar::Complex(..) | Scalar::ComplexFloat(..) => unreachable!("printed by parts"),
        }
    }

    /// The literals of a dense body's elements, in order: split at brackets and commas outside
    /// a complex element's parentheses.
    fn literals(inner: &str) -> Vec<&str> {
        let mut out = Vec::new();
        let (mut depth, mut start) = (0usize, 0);
        for (i, c) in inner.char_indices() {
            match c {
                '(' => depth += 1,
                ')' => depth = depth.saturating_sub(1),
                '[' | ']' | ',' if depth == 0 => {
                    out.push(inner[start..i].trim());
                    start = i + 1;
                }
                _ => {}
            }
        }
        out.push(inner[start..].trim());
        out.retain(|l| !l.is_empty());
        out
    }
}

impl<'a> Const<'a> {
    #[inline]
    pub fn scalar(value: Scalar, ty: Type<'a>) -> Self {
        Self { ty, values: vec![value], elements: false }
    }

    /// A splat of `value` over shaped `ty`.
    #[inline]
    pub fn splat(value: Scalar, ty: Type<'a>) -> Self {
        Self { ty, values: vec![value], elements: true }
    }

    #[inline]
    pub fn int(value: ApInt, ty: Type<'a>) -> Self {
        Self::scalar(Scalar::Int(value), ty)
    }

    #[inline]
    pub fn is_splat(&self) -> bool {
        self.values.len() == 1
    }

    /// The single value of a scalar or a splat.
    #[inline]
    pub fn splat_value(&self) -> Option<Scalar> {
        self.is_splat().then(|| self.values[0])
    }

    /// `m_ConstantInt`: an integer scalar or splat.
    #[inline]
    pub fn as_int(&self) -> Option<ApInt> {
        self.splat_value()?.int()
    }

    #[inline]
    pub fn as_float(&self) -> Option<ApFloat> {
        self.splat_value()?.float()
    }

    /// The same constant with every element through `f` (result element type `ty`).
    #[inline]
    pub fn map(&self, ty: Type<'a>, f: impl Fn(Scalar) -> Option<Scalar>) -> Option<Self> {
        Some(Self { ty, values: self.values.iter().map(|v| f(*v)).collect::<Option<_>>()?, elements: self.elements })
    }

    /// `getValues<int64_t>`: every element as an integer, a splat repeated over the shape.
    #[inline]
    pub fn ints(&self) -> Option<Vec<i64>> {
        let n = if self.is_splat() { self.ty.element_count()? } else { self.values.len() };
        (0..n).map(|i| self.at(i).int().map(|v| v.signed() as i64)).collect()
    }

    /// Element `i` (a splat repeats).
    #[inline]
    pub fn at(&self, i: usize) -> Scalar {
        if self.is_splat() { self.values[0] } else { self.values[i] }
    }

    fn dense_body(&self) -> String {
        let elem = self.ty.element_type();
        if self.values.len() == 1 || self.values.windows(2).all(|w| w[0] == w[1]) && !self.values.is_empty() {
            return format!("<{}>", self.values[0].print(elem));
        }
        let Type::Shaped(Shaped { shape: Some(shape), .. }) = &self.ty else { return String::from("<>") };
        let dims: Vec<usize> = shape.iter().map(|d| if let Dim::Static(k) | Dim::Scalable(k) = d { *k as usize } else { 0 }).collect();
        if self.values.is_empty() {
            return String::from("<>");
        }
        let mut out = String::from("<");
        self.nest(&dims, 0, &mut 0, elem, &mut out);
        out.push('>');
        out
    }

    fn nest(&self, dims: &[usize], depth: usize, at: &mut usize, elem: &Type<'_>, out: &mut String) {
        if depth == dims.len() {
            out.push_str(&self.values[*at].print(elem));
            *at += 1;
            return;
        }
        out.push('[');
        for i in 0..dims[depth] {
            if i > 0 {
                out.push_str(", ");
            }
            self.nest(dims, depth + 1, at, elem, out);
        }
        out.push(']');
    }
}

impl<'a> From<Const<'a>> for Attribute<'a> {
    fn from(c: Const<'a>) -> Self {
        if c.elements {
            let body = c.dense_body();
            return Attribute::Builtin { name: "dense".into(), body: Cow::Owned(body), ty: Some(c.ty) };
        }
        if let Some(parts) = c.values[0].parts() {
            // `complex.constant`'s `[re, im]`.
            let part = if let Type::Complex(p) = &c.ty { (**p).clone() } else { c.ty.clone() };
            return Attribute::Array(parts.iter().map(|v| Const::scalar(*v, part.clone()).into()).collect());
        }
        match c.values[0] {
            Scalar::Int(i) if matches!(c.ty, Type::Integer { width: 1, .. }) => Attribute::Bool(!i.is_zero()),
            v @ Scalar::Int(_) => Attribute::Int { lit: Cow::Owned(v.print(&c.ty)), ty: Some(c.ty) },
            v @ (Scalar::Float(_) | Scalar::Wide(_)) => {
                let lit = v.print(&c.ty);
                // A float printed as its bits reads back as an integer literal.
                if lit.starts_with("0x") {
                    Attribute::Int { lit: Cow::Owned(lit), ty: Some(c.ty) }
                } else {
                    Attribute::Float { lit: Cow::Owned(lit), ty: Some(c.ty) }
                }
            }
            Scalar::Complex(..) | Scalar::ComplexFloat(..) => unreachable!("built from parts"),
        }
    }
}

impl<'a> TryFrom<&Attribute<'a>> for Const<'a> {
    type Error = ();

    /// Integer, float and bool attributes, a complex `[re, im]`, and `dense<...>` of int, float
    /// or complex elements.
    fn try_from(a: &Attribute<'a>) -> Result<Self, ()> {
        match a {
            Attribute::Bool(b) => Ok(Const::int(ApInt::new(1, i128::from(*b)), Type::I1)),
            Attribute::Array(xs) => {
                let [re, im] = &xs[..] else { return Err(()) };
                let (re, im) = (Const::try_from(re)?, Const::try_from(im)?);
                if re.elements || im.elements || re.ty != im.ty {
                    return Err(());
                }
                let v = Scalar::complex(re.values[0], im.values[0]).ok_or(())?;
                Ok(Const::scalar(v, Type::Complex(re.ty.into())))
            }
            Attribute::Int { lit, ty: Some(ty) } | Attribute::Float { lit, ty: Some(ty) } => Scalar::parse(lit, ty).map(|v| Const::scalar(v, ty.clone())).ok_or(()),
            Attribute::Builtin { name, body, ty: Some(ty) } if name == "dense" => {
                let elem = ty.element_type();
                let inner = body.strip_prefix('<').and_then(|b| b.strip_suffix('>')).ok_or(())?.trim();
                if inner.starts_with('"') {
                    return Err(());
                }
                let flat = Scalar::literals(inner);
                let values = flat.iter().map(|l| Scalar::parse(l, elem)).collect::<Option<Vec<_>>>().ok_or(())?;
                if !inner.starts_with('[') && values.len() != 1 && ty.element_count() != Some(0) {
                    return Err(());
                }
                if values.len() > 1 && ty.element_count() != Some(values.len()) {
                    return Err(());
                }
                Ok(Const { ty: ty.clone(), values, elements: true })
            }
            _ => Err(()),
        }
    }
}

impl<'a> Const<'a> {
    /// The most elements a `sparse<...>` is expanded to.
    const SPARSE_LIMIT: usize = 1 << 20;

    /// `ElementsAttr`: a `dense<...>` or a `sparse<indices, values>` (expanded, the rest zero).
    /// Only what reads any elements attribute takes a sparse one; folds of dense constants go
    /// through [`TryFrom`].
    pub fn elements_attr(a: &Attribute<'a>) -> Option<Self> {
        let Attribute::Builtin { name, body, ty: Some(ty) } = a else { return None };
        if name != "sparse" {
            return Const::try_from(a).ok().filter(|c| c.elements);
        }
        let rank = ty.dims()?.len();
        let n = ty.element_count().filter(|n| *n <= Self::SPARSE_LIMIT)?;
        let elem = ty.element_type();
        let inner = body.strip_prefix('<')?.strip_suffix('>')?;
        // The indices and the values, split at the comma outside any bracket.
        let mut depth = 0usize;
        let at = inner.char_indices().find_map(|(i, c)| {
            match c {
                '[' | '(' => depth += 1,
                ']' | ')' => depth = depth.saturating_sub(1),
                ',' if depth == 0 => return Some(i),
                _ => {}
            }
            None
        })?;
        let (indices, values) = (inner[..at].trim(), inner[at + 1..].trim());
        if rank == 0 {
            return None;
        }
        // A splat is one index (or one value) for every position.
        let idx: Vec<i64> = Scalar::literals(indices).iter().map(|l| l.parse().ok()).collect::<Option<_>>()?;
        let idx = if indices.starts_with('[') { idx } else { vec![*idx.first()?; rank] };
        let nnz = idx.len() / rank;
        let vals: Vec<Scalar> = Scalar::literals(values).iter().map(|l| Scalar::parse(l, elem)).collect::<Option<_>>()?;
        let vals = if values.starts_with('[') { vals } else { vec![*vals.first()?; nnz] };
        if vals.len() != nnz || idx.len() != nnz * rank {
            return None;
        }
        let dims = ty.dims()?;
        let mut out = vec![Scalar::zero(elem)?; n];
        for (k, v) in vals.into_iter().enumerate() {
            let pos = &idx[k * rank..(k + 1) * rank];
            if pos.iter().zip(&dims).any(|(i, d)| *i < 0 || i >= d) {
                return None;
            }
            let flat = pos.iter().zip(&dims).fold(0i64, |acc, (i, d)| acc * d + i);
            out[flat as usize] = v;
        }
        Some(Const { ty: ty.clone(), values: out, elements: true })
    }
}
