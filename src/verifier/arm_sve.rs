use alloc::string::ToString;

use super::{DialectRules, Invalid, Verifier};
use crate::{Dim, Operation, ShapedKind, Signedness, Type};

pub(super) struct ArmSve;

impl ArmSve {
    fn mask(t: &Type<'_>, sizes: &[i64]) -> bool {
        let Type::Shaped(s) = t else { return false };
        let Some((last, lead)) = s.shape.as_deref().and_then(<[Dim]>::split_last) else { return false };
        s.kind == ShapedKind::Vector
            && matches!(*s.elem, Type::Integer { signedness: Signedness::Signless, width: 1 })
            && matches!(last, Dim::Scalable(n) if sizes.contains(n))
            && lead.iter().all(|d| matches!(d, Dim::Static(_)))
    }
}

impl DialectRules for ArmSve {
    #[inline]
    fn namespace(&self) -> &'static str {
        "arm_sve"
    }

    fn op(&self, _v: &Verifier<'_>, op: &Operation<'_>) -> Result<(), Invalid> {
        const SVBOOL: &[i64] = &[16];
        const PREDICATE: &[i64] = &[16, 8, 4, 2, 1];
        let (source, result) = match &*op.name {
            "arm_sve.convert_from_svbool" => (SVBOOL, PREDICATE),
            "arm_sve.convert_to_svbool" => (PREDICATE, SVBOOL),
            _ => return Ok(()),
        };
        let bad = op.ty.inputs.first().filter(|t| !Self::mask(t, source)).or_else(|| op.ty.results.first().filter(|t| !Self::mask(t, result)));
        match bad {
            Some(t) => Err(Invalid::DialectOp { op: op.name.to_string(), why: alloc::format!("'{t}' is not a mask of the op's sizes") }),
            None => Ok(()),
        }
    }
}
