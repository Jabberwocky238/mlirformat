//! `ub` (formats from `UBOps.td`, checked against `mlir-opt` 22.1.8 output).

use crate::{Attribute, Type, mlir};

/// `ub.poison : T` (`<#attr>` when the value is not plain `#ub.poison`).
#[mlir::op("ub.poison", format = "attr-dict (`<` $value^ `>`)? `:` type($result)", results(result))]
pub struct PoisonOp<'a> {
    #[attr(dialect = "ub.poison", default = "")]
    pub value: Attribute<'a>,
    #[dtype]
    pub result: Type<'a>,
}

#[mlir::op("ub.unreachable", format = "attr-dict")]
pub struct UnreachableOp {}

/// The `ub` dialect.
#[mlir::dialect(
    "ub",
    ops = [PoisonOp, UnreachableOp],
    materializer
)]
pub struct UbDialect;
