#![allow(non_camel_case_types, unused_imports, clippy::all, rustdoc::all)]

use mlirformat::{mlir, Attribute, Region, Str, Type, Value, __Vec as Vec};

#[mlir::op("arm_neon.intr.bfmmla", format = "$acc `,` $src1 `,` $src2 attr-dict `:` type($src1) `to` type($res)", results(res))]
pub struct BfmmlaOp<'a> {
    #[slot(res)]
    pub acc: Value<'a>,
    #[slot(src1_ty)]
    pub src1: Value<'a>,
    #[slot(src1_ty)]
    pub src2: Value<'a>,
    pub src1_ty: Type<'a>,
    pub res: Type<'a>,
}

#[mlir::op("arm_neon.intr.smull", format = "$a `,` $b attr-dict `:` type($a) `to` type($res)", results(res))]
pub struct SMullOp<'a> {
    #[slot(a_ty)]
    pub a: Value<'a>,
    #[slot(a_ty)]
    pub b: Value<'a>,
    pub a_ty: Type<'a>,
    pub res: Type<'a>,
}

#[mlir::op("arm_neon.2d.sdot", format = "$a `,` $b `,` $c attr-dict `:` type($b) `,` type($c) `to` type($res)", results(res))]
pub struct Sdot2dOp<'a> {
    #[slot(res)]
    pub a: Value<'a>,
    #[slot(b_ty)]
    pub b: Value<'a>,
    #[slot(b_ty)]
    pub c: Value<'a>,
    pub b_ty: Type<'a>,
    pub res: Type<'a>,
}

#[mlir::op("arm_neon.intr.sdot", format = "$a `,` $b `,` $c attr-dict `:` type($b) `,` type($c) `to` type($res)", results(res))]
pub struct SdotOp<'a> {
    #[slot(res)]
    pub a: Value<'a>,
    #[slot(b_ty)]
    pub b: Value<'a>,
    #[slot(b_ty)]
    pub c: Value<'a>,
    pub b_ty: Type<'a>,
    pub res: Type<'a>,
}

#[mlir::op("arm_neon.intr.smmla", format = "$acc `,` $src1 `,` $src2 attr-dict `:` type($src1) `to` type($res)", results(res))]
pub struct SmmlaOp<'a> {
    #[slot(res)]
    pub acc: Value<'a>,
    #[slot(src1_ty)]
    pub src1: Value<'a>,
    #[slot(src1_ty)]
    pub src2: Value<'a>,
    pub src1_ty: Type<'a>,
    pub res: Type<'a>,
}

#[mlir::op("arm_neon.intr.ummla", format = "$acc `,` $src1 `,` $src2 attr-dict `:` type($src1) `to` type($res)", results(res))]
pub struct UmmlaOp<'a> {
    #[slot(res)]
    pub acc: Value<'a>,
    #[slot(src1_ty)]
    pub src1: Value<'a>,
    #[slot(src1_ty)]
    pub src2: Value<'a>,
    pub src1_ty: Type<'a>,
    pub res: Type<'a>,
}

#[mlir::op("arm_neon.intr.usmmla", format = "$acc `,` $src1 `,` $src2 attr-dict `:` type($src1) `to` type($res)", results(res))]
pub struct UsmmlaOp<'a> {
    #[slot(res)]
    pub acc: Value<'a>,
    #[slot(src1_ty)]
    pub src1: Value<'a>,
    #[slot(src1_ty)]
    pub src2: Value<'a>,
    pub src1_ty: Type<'a>,
    pub res: Type<'a>,
}

#[mlir::dialect(
    "arm_neon",
    ops = [BfmmlaOp, SMullOp, Sdot2dOp, SdotOp, SmmlaOp, UmmlaOp, UsmmlaOp]
)]
pub struct ArmNeonDialect;
