#![allow(non_camel_case_types, unused_imports, clippy::all, rustdoc::all)]

use mlirformat::{mlir, Attribute, Region, Str, Type, Value, __Vec as Vec};

#[mlir::op("index.add", format = "$lhs `,` $rhs attr-dict", results(result))]
pub struct AddOp<'a> {
    #[slot(lhs_ty)]
    pub lhs: Value<'a>,
    #[slot(rhs_ty)]
    pub rhs: Value<'a>,
    #[dtype(is = index)]
    pub lhs_ty: Type<'a>,
    #[dtype(is = index)]
    pub rhs_ty: Type<'a>,
    #[dtype(is = index)]
    pub result: Type<'a>,
}

#[mlir::op("index.and", format = "$lhs `,` $rhs attr-dict", results(result))]
pub struct AndOp<'a> {
    #[slot(lhs_ty)]
    pub lhs: Value<'a>,
    #[slot(rhs_ty)]
    pub rhs: Value<'a>,
    #[dtype(is = index)]
    pub lhs_ty: Type<'a>,
    #[dtype(is = index)]
    pub rhs_ty: Type<'a>,
    #[dtype(is = index)]
    pub result: Type<'a>,
}

#[mlir::op("index.bool.constant", format = "attr-dict $value", results(result))]
pub struct BoolConstantOp<'a> {
    pub value: Attribute<'a>,
    #[dtype(is = i1)]
    pub result: Type<'a>,
}

#[mlir::op("index.casts", format = "$input attr-dict `:` type($input) `to` type($output)", results(output))]
pub struct CastSOp<'a> {
    #[slot(input_ty)]
    pub input: Value<'a>,
    pub input_ty: Type<'a>,
    pub output: Type<'a>,
}

#[mlir::op("index.castu", format = "$input attr-dict `:` type($input) `to` type($output)", results(output))]
pub struct CastUOp<'a> {
    #[slot(input_ty)]
    pub input: Value<'a>,
    pub input_ty: Type<'a>,
    pub output: Type<'a>,
}

#[mlir::op("index.ceildivs", format = "$lhs `,` $rhs attr-dict", results(result))]
pub struct CeilDivSOp<'a> {
    #[slot(lhs_ty)]
    pub lhs: Value<'a>,
    #[slot(rhs_ty)]
    pub rhs: Value<'a>,
    #[dtype(is = index)]
    pub lhs_ty: Type<'a>,
    #[dtype(is = index)]
    pub rhs_ty: Type<'a>,
    #[dtype(is = index)]
    pub result: Type<'a>,
}

#[mlir::op("index.ceildivu", format = "$lhs `,` $rhs attr-dict", results(result))]
pub struct CeilDivUOp<'a> {
    #[slot(lhs_ty)]
    pub lhs: Value<'a>,
    #[slot(rhs_ty)]
    pub rhs: Value<'a>,
    #[dtype(is = index)]
    pub lhs_ty: Type<'a>,
    #[dtype(is = index)]
    pub rhs_ty: Type<'a>,
    #[dtype(is = index)]
    pub result: Type<'a>,
}

#[mlir::op("index.cmp", format = "$pred `(` $lhs `,` $rhs `)` attr-dict", results(result))]
pub struct CmpOp<'a> {
    #[slot(lhs_ty)]
    pub lhs: Value<'a>,
    #[slot(rhs_ty)]
    pub rhs: Value<'a>,
    #[attr(dialect = "index<cmp_predicate")]
    pub pred: Attribute<'a>,
    #[dtype(is = index)]
    pub lhs_ty: Type<'a>,
    #[dtype(is = index)]
    pub rhs_ty: Type<'a>,
    #[dtype(is = i1)]
    pub result: Type<'a>,
}

#[mlir::op("index.constant", format = "attr-dict $value", results(result))]
pub struct ConstantOp<'a> {
    #[attr(int = "index")]
    pub value: Attribute<'a>,
    #[dtype(is = index)]
    pub result: Type<'a>,
}

#[mlir::op("index.divs", format = "$lhs `,` $rhs attr-dict", results(result))]
pub struct DivSOp<'a> {
    #[slot(lhs_ty)]
    pub lhs: Value<'a>,
    #[slot(rhs_ty)]
    pub rhs: Value<'a>,
    #[dtype(is = index)]
    pub lhs_ty: Type<'a>,
    #[dtype(is = index)]
    pub rhs_ty: Type<'a>,
    #[dtype(is = index)]
    pub result: Type<'a>,
}

#[mlir::op("index.divu", format = "$lhs `,` $rhs attr-dict", results(result))]
pub struct DivUOp<'a> {
    #[slot(lhs_ty)]
    pub lhs: Value<'a>,
    #[slot(rhs_ty)]
    pub rhs: Value<'a>,
    #[dtype(is = index)]
    pub lhs_ty: Type<'a>,
    #[dtype(is = index)]
    pub rhs_ty: Type<'a>,
    #[dtype(is = index)]
    pub result: Type<'a>,
}

#[mlir::op("index.floordivs", format = "$lhs `,` $rhs attr-dict", results(result))]
pub struct FloorDivSOp<'a> {
    #[slot(lhs_ty)]
    pub lhs: Value<'a>,
    #[slot(rhs_ty)]
    pub rhs: Value<'a>,
    #[dtype(is = index)]
    pub lhs_ty: Type<'a>,
    #[dtype(is = index)]
    pub rhs_ty: Type<'a>,
    #[dtype(is = index)]
    pub result: Type<'a>,
}

#[mlir::op("index.maxs", format = "$lhs `,` $rhs attr-dict", results(result))]
pub struct MaxSOp<'a> {
    #[slot(lhs_ty)]
    pub lhs: Value<'a>,
    #[slot(rhs_ty)]
    pub rhs: Value<'a>,
    #[dtype(is = index)]
    pub lhs_ty: Type<'a>,
    #[dtype(is = index)]
    pub rhs_ty: Type<'a>,
    #[dtype(is = index)]
    pub result: Type<'a>,
}

#[mlir::op("index.maxu", format = "$lhs `,` $rhs attr-dict", results(result))]
pub struct MaxUOp<'a> {
    #[slot(lhs_ty)]
    pub lhs: Value<'a>,
    #[slot(rhs_ty)]
    pub rhs: Value<'a>,
    #[dtype(is = index)]
    pub lhs_ty: Type<'a>,
    #[dtype(is = index)]
    pub rhs_ty: Type<'a>,
    #[dtype(is = index)]
    pub result: Type<'a>,
}

#[mlir::op("index.mins", format = "$lhs `,` $rhs attr-dict", results(result))]
pub struct MinSOp<'a> {
    #[slot(lhs_ty)]
    pub lhs: Value<'a>,
    #[slot(rhs_ty)]
    pub rhs: Value<'a>,
    #[dtype(is = index)]
    pub lhs_ty: Type<'a>,
    #[dtype(is = index)]
    pub rhs_ty: Type<'a>,
    #[dtype(is = index)]
    pub result: Type<'a>,
}

#[mlir::op("index.minu", format = "$lhs `,` $rhs attr-dict", results(result))]
pub struct MinUOp<'a> {
    #[slot(lhs_ty)]
    pub lhs: Value<'a>,
    #[slot(rhs_ty)]
    pub rhs: Value<'a>,
    #[dtype(is = index)]
    pub lhs_ty: Type<'a>,
    #[dtype(is = index)]
    pub rhs_ty: Type<'a>,
    #[dtype(is = index)]
    pub result: Type<'a>,
}

#[mlir::op("index.mul", format = "$lhs `,` $rhs attr-dict", results(result))]
pub struct MulOp<'a> {
    #[slot(lhs_ty)]
    pub lhs: Value<'a>,
    #[slot(rhs_ty)]
    pub rhs: Value<'a>,
    #[dtype(is = index)]
    pub lhs_ty: Type<'a>,
    #[dtype(is = index)]
    pub rhs_ty: Type<'a>,
    #[dtype(is = index)]
    pub result: Type<'a>,
}

#[mlir::op("index.or", format = "$lhs `,` $rhs attr-dict", results(result))]
pub struct OrOp<'a> {
    #[slot(lhs_ty)]
    pub lhs: Value<'a>,
    #[slot(rhs_ty)]
    pub rhs: Value<'a>,
    #[dtype(is = index)]
    pub lhs_ty: Type<'a>,
    #[dtype(is = index)]
    pub rhs_ty: Type<'a>,
    #[dtype(is = index)]
    pub result: Type<'a>,
}

#[mlir::op("index.rems", format = "$lhs `,` $rhs attr-dict", results(result))]
pub struct RemSOp<'a> {
    #[slot(lhs_ty)]
    pub lhs: Value<'a>,
    #[slot(rhs_ty)]
    pub rhs: Value<'a>,
    #[dtype(is = index)]
    pub lhs_ty: Type<'a>,
    #[dtype(is = index)]
    pub rhs_ty: Type<'a>,
    #[dtype(is = index)]
    pub result: Type<'a>,
}

#[mlir::op("index.remu", format = "$lhs `,` $rhs attr-dict", results(result))]
pub struct RemUOp<'a> {
    #[slot(lhs_ty)]
    pub lhs: Value<'a>,
    #[slot(rhs_ty)]
    pub rhs: Value<'a>,
    #[dtype(is = index)]
    pub lhs_ty: Type<'a>,
    #[dtype(is = index)]
    pub rhs_ty: Type<'a>,
    #[dtype(is = index)]
    pub result: Type<'a>,
}

#[mlir::op("index.shl", format = "$lhs `,` $rhs attr-dict", results(result))]
pub struct ShlOp<'a> {
    #[slot(lhs_ty)]
    pub lhs: Value<'a>,
    #[slot(rhs_ty)]
    pub rhs: Value<'a>,
    #[dtype(is = index)]
    pub lhs_ty: Type<'a>,
    #[dtype(is = index)]
    pub rhs_ty: Type<'a>,
    #[dtype(is = index)]
    pub result: Type<'a>,
}

#[mlir::op("index.shrs", format = "$lhs `,` $rhs attr-dict", results(result))]
pub struct ShrSOp<'a> {
    #[slot(lhs_ty)]
    pub lhs: Value<'a>,
    #[slot(rhs_ty)]
    pub rhs: Value<'a>,
    #[dtype(is = index)]
    pub lhs_ty: Type<'a>,
    #[dtype(is = index)]
    pub rhs_ty: Type<'a>,
    #[dtype(is = index)]
    pub result: Type<'a>,
}

#[mlir::op("index.shru", format = "$lhs `,` $rhs attr-dict", results(result))]
pub struct ShrUOp<'a> {
    #[slot(lhs_ty)]
    pub lhs: Value<'a>,
    #[slot(rhs_ty)]
    pub rhs: Value<'a>,
    #[dtype(is = index)]
    pub lhs_ty: Type<'a>,
    #[dtype(is = index)]
    pub rhs_ty: Type<'a>,
    #[dtype(is = index)]
    pub result: Type<'a>,
}

#[mlir::op("index.sizeof", format = "attr-dict", results(result))]
pub struct SizeOfOp<'a> {
    #[dtype(is = index)]
    pub result: Type<'a>,
}

#[mlir::op("index.sub", format = "$lhs `,` $rhs attr-dict", results(result))]
pub struct SubOp<'a> {
    #[slot(lhs_ty)]
    pub lhs: Value<'a>,
    #[slot(rhs_ty)]
    pub rhs: Value<'a>,
    #[dtype(is = index)]
    pub lhs_ty: Type<'a>,
    #[dtype(is = index)]
    pub rhs_ty: Type<'a>,
    #[dtype(is = index)]
    pub result: Type<'a>,
}

#[mlir::op("index.xor", format = "$lhs `,` $rhs attr-dict", results(result))]
pub struct XOrOp<'a> {
    #[slot(lhs_ty)]
    pub lhs: Value<'a>,
    #[slot(rhs_ty)]
    pub rhs: Value<'a>,
    #[dtype(is = index)]
    pub lhs_ty: Type<'a>,
    #[dtype(is = index)]
    pub rhs_ty: Type<'a>,
    #[dtype(is = index)]
    pub result: Type<'a>,
}

#[mlir::dialect(
    "index",
    ops = [AddOp, AndOp, BoolConstantOp, CastSOp, CastUOp, CeilDivSOp, CeilDivUOp, CmpOp, ConstantOp, DivSOp, DivUOp, FloorDivSOp, MaxSOp, MaxUOp, MinSOp, MinUOp, MulOp, OrOp, RemSOp, RemUOp, ShlOp, ShrSOp, ShrUOp, SizeOfOp, SubOp, XOrOp],
    materializer
)]
pub struct IndexDialect;
