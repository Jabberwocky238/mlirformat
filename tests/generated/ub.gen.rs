#![allow(non_camel_case_types, unused_imports, clippy::all, rustdoc::all)]

use mlirformat::{mlir, Attribute, Region, Str, Type, Value, __Vec as Vec};

#[mlir::op("ub.poison", format = "attr-dict (`<` $value^ `>`)? `:` type($result)", results(result))]
pub struct PoisonOp<'a> {
    #[attr(dialect = "ub.poison", default = "")]
    pub value: Option<Attribute<'a>>,
    pub result: Type<'a>,
}

#[mlir::op("ub.unreachable", format = "attr-dict")]
pub struct UnreachableOp<'a> {
}

#[mlir::dialect(
    "ub",
    ops = [PoisonOp, UnreachableOp],
    materializer
)]
pub struct UbDialect;
