//! Methods on types and attributes, named as MLIR names them: what a shaped type holds, and
//! the builtin types and attributes built from values.

use alloc::vec::Vec;

use crate::{Attribute, Dim, Extended, FloatKind, Shaped, ShapedKind, Signedness, Type};

impl<'a> Type<'a> {
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

impl Attribute<'_> {
    /// `#ub.poison`.
    pub fn is_poison(&self) -> bool {
        matches!(self, Attribute::Extended { ext: Extended { name, .. }, .. } if name == "ub.poison")
    }
}
