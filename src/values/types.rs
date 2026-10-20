//! Methods on types and attributes, named as MLIR names them: what a shaped type holds, and
//! the builtin types and attributes built from values.

use alloc::borrow::Cow;
use alloc::format;
use alloc::vec::Vec;

use crate::{Attribute, Dim, Extended, FloatKind, Shaped, ShapedKind, Signedness, Type};

impl Dim {
    /// `ShapedType::kDynamic`: a `?` dim as an integer.
    pub const DYNAMIC: i64 = i64::MIN;
}

impl From<i64> for Dim {
    /// [`Dim::DYNAMIC`] is `?`.
    fn from(n: i64) -> Self {
        if n == Dim::DYNAMIC { Dim::Dynamic } else { Dim::Static(n) }
    }
}

impl From<&Dim> for i64 {
    /// `?` is [`Dim::DYNAMIC`]; a scalable dim is its base size.
    fn from(d: &Dim) -> Self {
        match d {
            Dim::Static(n) | Dim::Scalable(n) => *n,
            Dim::Dynamic => Dim::DYNAMIC,
        }
    }
}

impl<'a> Type<'a> {
    /// `RankedTensorType::get(dims, elem)` ([`Dim::DYNAMIC`] is `?`).
    pub fn tensor(dims: &[i64], elem: Type<'a>) -> Type<'a> {
        Type::Shaped(Shaped { kind: ShapedKind::Tensor, shape: Some(dims.iter().map(|d| Dim::from(*d)).collect()), elem: elem.into(), extras: Vec::new() })
    }

    /// `VectorType::get(shape, elem, scalable)`; `scalable` may be shorter than `shape`.
    pub fn vector(shape: &[i64], scalable: &[bool], elem: Type<'a>) -> Type<'a> {
        let dims = shape.iter().zip(scalable.iter().chain(core::iter::repeat(&false))).map(|(n, s)| if *s { Dim::Scalable(*n) } else { Dim::Static(*n) }).collect();
        Type::Shaped(Shaped { kind: ShapedKind::Vector, shape: Some(dims), elem: elem.into(), extras: Vec::new() })
    }

    /// `getShape` of a ranked shaped type ([`Dim::DYNAMIC`] for `?`).
    pub fn dims(&self) -> Option<Vec<i64>> {
        match self {
            Type::Shaped(s) => s.dims(),
            _ => None,
        }
    }

    /// `getElementTypeOrSelf`: the element type of a shaped type, or the type itself.
    pub fn element_type(&self) -> &Type<'a> {
        match self {
            Type::Shaped(s) => &s.elem,
            t => t,
        }
    }

    /// `getNumElements` of a static shape (1 for a scalar); `None` when dynamic or unranked.
    pub fn element_count(&self) -> Option<usize> {
        let Type::Shaped(s) = self else { return Some(1) };
        s.shape.as_ref()?.iter().try_fold(1usize, |n, d| match d {
            Dim::Static(k) | Dim::Scalable(k) => Some(n * *k as usize),
            Dim::Dynamic => None,
        })
    }

    /// A ranked shaped type's dims.
    pub fn shape(&self) -> Option<&[Dim]> {
        match self {
            Type::Shaped(s) => s.shape.as_deref(),
            _ => None,
        }
    }

    /// `cloneWith`: the type with element type `elem` (a scalar type is replaced outright).
    pub fn with_element(&self, elem: Type<'a>) -> Type<'a> {
        match self {
            Type::Shaped(s) => Type::Shaped(Shaped { kind: s.kind, shape: s.shape.clone(), elem: elem.into(), extras: if s.kind == ShapedKind::Vector { Vec::new() } else { s.extras.clone() } }),
            _ => elem,
        }
    }

    /// What an integer type means for its values: width and signedness (`index` is
    /// `IndexType::kInternalStorageBitWidth` wide).
    pub fn int_width(&self) -> Option<(u32, Signedness)> {
        match self {
            Type::Integer { signedness, width } => Some((*width, *signedness)),
            Type::Index => Some((64, Signedness::Signless)),
            _ => None,
        }
    }

    /// `getIntOrFloatBitWidth` of the element type (`index` is 64 wide).
    pub fn bit_width(&self) -> Option<u32> {
        match self.element_type() {
            Type::Integer { width, .. } => Some(*width),
            Type::Index => Some(64),
            Type::Float(k) => Some(match k {
                FloatKind::F16 | FloatKind::BF16 => 16,
                FloatKind::TF32 => 19,
                FloatKind::F32 => 32,
                FloatKind::F64 => 64,
                FloatKind::F80 => 80,
                FloatKind::F128 => 128,
                FloatKind::F4E2M1FN => 4,
                FloatKind::F6E2M3FN | FloatKind::F6E3M2FN => 6,
                _ => 8,
            }),
            _ => None,
        }
    }
}

impl Shaped<'_> {
    /// `getShape` when ranked ([`Dim::DYNAMIC`] for `?`).
    pub fn dims(&self) -> Option<Vec<i64>> {
        Some(self.shape.as_ref()?.iter().map(i64::from).collect())
    }
}

impl<'a> Attribute<'a> {
    /// `#ub.poison`.
    pub fn is_poison(&self) -> bool {
        matches!(self, Attribute::Extended { ext: Extended { name, .. }, .. } if name == "ub.poison")
    }

    /// `IntegerAttr::get(ty, v)`; for `i1`, a `BoolAttr`.
    pub fn integer(v: i128, ty: Type<'a>) -> Attribute<'a> {
        match ty {
            Type::Integer { width: 1, .. } => Attribute::Bool(v != 0),
            _ => Attribute::Int { lit: Cow::Owned(format!("{v}")), ty: Some(ty) },
        }
    }

    /// `getIndexAttr(v)`: `v : index`.
    pub fn index(v: i64) -> Attribute<'a> {
        Attribute::Int { lit: Cow::Owned(format!("{v}")), ty: Some(Type::Index) }
    }

    /// `getDenseI64ArrayAttr`: `array<i64: ...>`.
    pub fn dense_i64(v: &[i64]) -> Attribute<'a> {
        Attribute::DenseArray { ty: Type::int(64), values: v.iter().map(|x| Cow::Owned(format!("{x}"))).collect() }
    }

    /// `getDenseI32ArrayAttr`: `array<i32: ...>` (of sizes or counts as well).
    pub fn dense_i32<T: core::fmt::Display>(v: &[T]) -> Attribute<'a> {
        Attribute::DenseArray { ty: Type::int(32), values: v.iter().map(|x| Cow::Owned(format!("{x}"))).collect() }
    }

    /// `DenseI64ArrayAttr::asArrayRef` (any integer `array<..>`); `None` for another attribute.
    pub fn dense_values(&self) -> Option<Vec<i64>> {
        match self {
            Attribute::DenseArray { values, .. } => Some(values.iter().map(|v| v.parse().unwrap_or(0)).collect()),
            _ => None,
        }
    }
}
