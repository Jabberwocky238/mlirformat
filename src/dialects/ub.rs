use crate::{Attribute, Type, mlir};

#[mlir::op("ub.poison", format = "attr-dict (`<` $value^ `>`)? `:` type($result)", results(result))]
pub struct PoisonOp<'a> {
    #[attr(dialect = "ub.poison", default = "")]
    pub value: Option<Attribute<'a>>,
    pub result: Type<'a>,
}

#[mlir::op("ub.unreachable", format = "attr-dict")]
pub struct UnreachableOp {}

#[mlir::dialect(
    "ub",
    ops = [PoisonOp, UnreachableOp],
    materializer
)]
pub struct UbDialect;
