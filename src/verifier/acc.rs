//! `acc` as `mlir-opt` reads it, the little this crate checks of a dialect it does not describe:
//! `#acc<par_dims[..]>`'s GPU processors (`parseProcessorValue`, `OpenACCCG.cpp`) and the
//! reduction operator of `acc.reduction_accumulate(_array)` (`OpenACC_ReductionOperatorAttr`).

use alloc::string::{String, ToString};

use super::{DialectRules, Invalid, Verifier};
use crate::{Attribute, Operation, Piece};

keywords! {
    /// `gpu::Processor`'s names.
    enum Processor {
        BlockX = "block_x",
        BlockY = "block_y",
        BlockZ = "block_z",
        ThreadX = "thread_x",
        ThreadY = "thread_y",
        ThreadZ = "thread_z",
        Sequential = "sequential",
    }
}

keywords! {
    /// `acc::ReductionOperator`'s names.
    enum ReductionOperator {
        None = "none",
        Add = "add",
        Mul = "mul",
        Max = "max",
        Min = "min",
        Iand = "iand",
        Ior = "ior",
        Xor = "xor",
        Eqv = "eqv",
        Neqv = "neqv",
        Land = "land",
        Lor = "lor",
        Maximumf = "maximumf",
        Minimumf = "minimumf",
        Maxnumf = "maxnumf",
        Minnumf = "minnumf",
    }
}

/// The `acc` dialect's rules.
pub(super) struct Acc;

impl DialectRules for Acc {
    #[inline]
    fn namespace(&self) -> &'static str {
        "acc"
    }

    fn attr(&self, _v: &Verifier<'_>, a: &Attribute<'_>) -> Result<(), Invalid> {
        let Attribute::Extended { ext, .. } = a else { return Ok(()) };
        let Some(dims) = ext.body.as_deref().and_then(|b| b.trim().strip_prefix('<')?.trim_start().strip_prefix("par_dims")?.trim().strip_prefix('[')?.strip_suffix(">")?.trim_end().strip_suffix(']')) else {
            return Ok(());
        };
        match dims.split(',').map(|d| d.trim().trim_matches('"')).find(|d| Processor::try_from(*d).is_err()) {
            Some(_) => Err(Invalid::DialectAttr { attr: a.to_string(), why: "expected one of ::mlir::gpu::Processor enum names".into() }),
            None => Ok(()),
        }
    }

    fn op(&self, _v: &Verifier<'_>, op: &Operation<'_>) -> Result<(), Invalid> {
        let (Some(raw), true) = (&op.raw, matches!(&*op.name, "acc.reduction_accumulate" | "acc.reduction_accumulate_array")) else { return Ok(()) };
        let text: String = raw.iter().map_while(|p| if let Piece::Text(t) = p { Some(&**t) } else { None }).collect();
        // `$reductionOperator` is `<name>` before the `:`.
        let head = text.split(':').next().unwrap_or("");
        let Some(name) = head.rsplit_once('<').and_then(|(_, r)| r.split_once('>')).map(|(n, _)| n.trim()) else { return Ok(()) };
        match ReductionOperator::try_from(name) {
            Ok(_) => Ok(()),
            Err(()) => Err(Invalid::DialectOp {
                op: op.name.to_string(),
                why: "expected ::mlir::acc::ReductionOperator to be one of: none, add, mul, max, min, iand, ior, xor, eqv, neqv, land, lor, maximumf, minimumf, maxnumf, minnumf".into(),
            }),
        }
    }
}
