#![allow(non_camel_case_types, unused_imports, clippy::all, rustdoc::all)]

use mlirformat::{mlir, Attribute, Region, Str, Type, Value, __Vec as Vec};

#[derive(Debug, Clone, Copy, PartialEq, Eq, mlirformat::__serde::Serialize, mlirformat::__serde::Deserialize, mlir::Cases)]
#[serde(crate = "mlirformat::__serde")]
pub enum CmpFPredicate {
    #[serde(rename = "false")]
    False,
    #[serde(rename = "oeq")]
    Oeq,
    #[serde(rename = "ogt")]
    Ogt,
    #[serde(rename = "oge")]
    Oge,
    #[serde(rename = "olt")]
    Olt,
    #[serde(rename = "ole")]
    Ole,
    #[serde(rename = "one")]
    One,
    #[serde(rename = "ord")]
    Ord,
    #[serde(rename = "ueq")]
    Ueq,
    #[serde(rename = "ugt")]
    Ugt,
    #[serde(rename = "uge")]
    Uge,
    #[serde(rename = "ult")]
    Ult,
    #[serde(rename = "ule")]
    Ule,
    #[serde(rename = "une")]
    Une,
    #[serde(rename = "uno")]
    Uno,
    #[serde(rename = "true")]
    True,
}

#[derive(Debug, Clone, Copy, PartialEq, Eq, mlirformat::__serde::Serialize, mlirformat::__serde::Deserialize, mlir::Cases)]
#[serde(crate = "mlirformat::__serde")]
pub enum CmpIPredicate {
    #[serde(rename = "eq")]
    Eq,
    #[serde(rename = "ne")]
    Ne,
    #[serde(rename = "slt")]
    Slt,
    #[serde(rename = "sle")]
    Sle,
    #[serde(rename = "sgt")]
    Sgt,
    #[serde(rename = "sge")]
    Sge,
    #[serde(rename = "ult")]
    Ult,
    #[serde(rename = "ule")]
    Ule,
    #[serde(rename = "ugt")]
    Ugt,
    #[serde(rename = "uge")]
    Uge,
}

#[derive(Debug, Clone, Copy, PartialEq, Eq, mlirformat::__serde::Serialize, mlirformat::__serde::Deserialize, mlir::Cases)]
#[serde(crate = "mlirformat::__serde")]
pub enum RoundingMode {
    #[serde(rename = "to_nearest_even")]
    ToNearestEven,
    #[serde(rename = "downward")]
    Downward,
    #[serde(rename = "upward")]
    Upward,
    #[serde(rename = "toward_zero")]
    TowardZero,
    #[serde(rename = "to_nearest_away")]
    ToNearestAway,
}

#[mlir::op("arith.addf", format = "$lhs `,` $rhs ($roundingmode^)? (`fastmath` `` $fastmath^)? attr-dict `:` type($result)", results(result))]
pub struct AddFOp<'a> {
    #[slot(result)]
    pub lhs: Value<'a>,
    #[slot(result)]
    pub rhs: Value<'a>,
    #[attr(dialect = "arith.fastmath", default = "<none>")]
    pub fastmath: Option<Attribute<'a>>,
    #[attr(int = "i32")]
    pub roundingmode: Option<RoundingMode>,
    pub result: Type<'a>,
}

#[mlir::op("arith.addi", format = "$lhs `,` $rhs (`overflow` `` $overflowFlags^)? attr-dict `:` type($result)", results(result))]
pub struct AddIOp<'a> {
    #[slot(result)]
    pub lhs: Value<'a>,
    #[slot(result)]
    pub rhs: Value<'a>,
    #[attr(name = "overflowFlags", dialect = "arith.overflow", default = "<none>")]
    pub overflow_flags: Option<Attribute<'a>>,
    pub result: Type<'a>,
}

#[mlir::op("arith.addui_extended", format = "$lhs `,` $rhs attr-dict `:` type($sum) `,` type($overflow)", results(sum, overflow))]
pub struct AddUIExtendedOp<'a> {
    #[slot(sum)]
    pub lhs: Value<'a>,
    #[slot(sum)]
    pub rhs: Value<'a>,
    pub sum: Type<'a>,
    pub overflow: Type<'a>,
}

#[mlir::op("arith.andi", format = "$lhs `,` $rhs attr-dict `:` type($result)", results(result))]
pub struct AndIOp<'a> {
    #[slot(result)]
    pub lhs: Value<'a>,
    #[slot(result)]
    pub rhs: Value<'a>,
    pub result: Type<'a>,
}

#[mlir::op("arith.bitcast", format = "$in attr-dict `:` type($in) `to` type($out)", results(out))]
pub struct BitcastOp<'a> {
    #[slot(in_ty, name = "in")]
    pub in_: Value<'a>,
    pub in_ty: Type<'a>,
    pub out: Type<'a>,
}

#[mlir::op("arith.ceildivsi", format = "$lhs `,` $rhs attr-dict `:` type($result)", results(result))]
pub struct CeilDivSIOp<'a> {
    #[slot(result)]
    pub lhs: Value<'a>,
    #[slot(result)]
    pub rhs: Value<'a>,
    pub result: Type<'a>,
}

#[mlir::op("arith.ceildivui", format = "$lhs `,` $rhs attr-dict `:` type($result)", results(result))]
pub struct CeilDivUIOp<'a> {
    #[slot(result)]
    pub lhs: Value<'a>,
    #[slot(result)]
    pub rhs: Value<'a>,
    pub result: Type<'a>,
}

#[mlir::op("arith.cmpf", format = "$predicate `,` $lhs `,` $rhs (`fastmath` `` $fastmath^)? attr-dict `:` type($lhs)", results(result))]
pub struct CmpFOp<'a> {
    #[slot(lhs_ty)]
    pub lhs: Value<'a>,
    #[slot(lhs_ty)]
    pub rhs: Value<'a>,
    #[attr(int = "i64")]
    pub predicate: CmpFPredicate,
    #[attr(dialect = "arith.fastmath", default = "<none>")]
    pub fastmath: Option<Attribute<'a>>,
    pub lhs_ty: Type<'a>,
    #[dtype(i1 = lhs_ty)]
    pub result: Type<'a>,
}

#[mlir::op("arith.cmpi", format = "$predicate `,` $lhs `,` $rhs attr-dict `:` type($lhs)", results(result))]
pub struct CmpIOp<'a> {
    #[slot(lhs_ty)]
    pub lhs: Value<'a>,
    #[slot(lhs_ty)]
    pub rhs: Value<'a>,
    #[attr(int = "i64")]
    pub predicate: CmpIPredicate,
    pub lhs_ty: Type<'a>,
    #[dtype(i1 = lhs_ty)]
    pub result: Type<'a>,
}

#[mlir::op("arith.constant", results(result))]
pub struct ConstantOp<'a> {
    pub value: Attribute<'a>,
    pub result: Type<'a>,
}

#[mlir::op("arith.convertf", format = "$in ($roundingmode^)? (`fastmath` `` $fastmath^)? attr-dict `:` type($in) `to` type($out)", results(out))]
pub struct ConvertFOp<'a> {
    #[slot(in_ty, name = "in")]
    pub in_: Value<'a>,
    #[attr(int = "i32")]
    pub roundingmode: Option<RoundingMode>,
    #[attr(dialect = "arith.fastmath")]
    pub fastmath: Option<Attribute<'a>>,
    pub in_ty: Type<'a>,
    pub out: Type<'a>,
}

#[mlir::op("arith.divf", format = "$lhs `,` $rhs ($roundingmode^)? (`fastmath` `` $fastmath^)? attr-dict `:` type($result)", results(result))]
pub struct DivFOp<'a> {
    #[slot(result)]
    pub lhs: Value<'a>,
    #[slot(result)]
    pub rhs: Value<'a>,
    #[attr(dialect = "arith.fastmath", default = "<none>")]
    pub fastmath: Option<Attribute<'a>>,
    #[attr(int = "i32")]
    pub roundingmode: Option<RoundingMode>,
    pub result: Type<'a>,
}

#[mlir::op("arith.divsi", format = "$lhs `,` $rhs (`exact` $isExact^)? attr-dict `:` type($result)", results(result))]
pub struct DivSIOp<'a> {
    #[slot(result)]
    pub lhs: Value<'a>,
    #[slot(result)]
    pub rhs: Value<'a>,
    #[attr(name = "isExact")]
    pub is_exact: bool,
    pub result: Type<'a>,
}

#[mlir::op("arith.divui", format = "$lhs `,` $rhs (`exact` $isExact^)? attr-dict `:` type($result)", results(result))]
pub struct DivUIOp<'a> {
    #[slot(result)]
    pub lhs: Value<'a>,
    #[slot(result)]
    pub rhs: Value<'a>,
    #[attr(name = "isExact")]
    pub is_exact: bool,
    pub result: Type<'a>,
}

#[mlir::op("arith.extf", format = "$in (`fastmath` `` $fastmath^)? attr-dict `:` type($in) `to` type($out)", results(out))]
pub struct ExtFOp<'a> {
    #[slot(in_ty, name = "in")]
    pub in_: Value<'a>,
    #[attr(dialect = "arith.fastmath")]
    pub fastmath: Option<Attribute<'a>>,
    pub in_ty: Type<'a>,
    pub out: Type<'a>,
}

#[mlir::op("arith.extsi", format = "$in attr-dict `:` type($in) `to` type($out)", results(out))]
pub struct ExtSIOp<'a> {
    #[slot(in_ty, name = "in")]
    pub in_: Value<'a>,
    pub in_ty: Type<'a>,
    pub out: Type<'a>,
}

#[mlir::op("arith.extui", format = "$in (`nneg` $nonNeg^)? attr-dict `:` type($in) `to` type($out)", results(out))]
pub struct ExtUIOp<'a> {
    #[slot(in_ty, name = "in")]
    pub in_: Value<'a>,
    #[attr(name = "nonNeg")]
    pub non_neg: bool,
    pub in_ty: Type<'a>,
    pub out: Type<'a>,
}

#[mlir::op("arith.fptosi", format = "$in attr-dict `:` type($in) `to` type($out)", results(out))]
pub struct FPToSIOp<'a> {
    #[slot(in_ty, name = "in")]
    pub in_: Value<'a>,
    pub in_ty: Type<'a>,
    pub out: Type<'a>,
}

#[mlir::op("arith.fptoui", format = "$in attr-dict `:` type($in) `to` type($out)", results(out))]
pub struct FPToUIOp<'a> {
    #[slot(in_ty, name = "in")]
    pub in_: Value<'a>,
    pub in_ty: Type<'a>,
    pub out: Type<'a>,
}

#[mlir::op("arith.floordivsi", format = "$lhs `,` $rhs attr-dict `:` type($result)", results(result))]
pub struct FloorDivSIOp<'a> {
    #[slot(result)]
    pub lhs: Value<'a>,
    #[slot(result)]
    pub rhs: Value<'a>,
    pub result: Type<'a>,
}

#[mlir::op("arith.flush_denormals", format = "$operand (`fastmath` `` $fastmath^)? attr-dict `:` type($result)", results(result))]
pub struct FlushDenormalsOp<'a> {
    #[slot(result)]
    pub operand: Value<'a>,
    #[attr(dialect = "arith.fastmath", default = "<none>")]
    pub fastmath: Option<Attribute<'a>>,
    pub result: Type<'a>,
}

#[mlir::op("arith.index_cast", format = "$in attr-dict `:` type($in) `to` type($out)", results(out))]
pub struct IndexCastOp<'a> {
    #[slot(in_ty, name = "in")]
    pub in_: Value<'a>,
    pub in_ty: Type<'a>,
    pub out: Type<'a>,
}

#[mlir::op("arith.index_castui", format = "$in (`nneg` $nonNeg^)? attr-dict `:` type($in) `to` type($out)", results(out))]
pub struct IndexCastUIOp<'a> {
    #[slot(in_ty, name = "in")]
    pub in_: Value<'a>,
    #[attr(name = "nonNeg")]
    pub non_neg: bool,
    pub in_ty: Type<'a>,
    pub out: Type<'a>,
}

#[mlir::op("arith.maxnumf", format = "$lhs `,` $rhs (`fastmath` `` $fastmath^)? attr-dict `:` type($result)", results(result))]
pub struct MaxNumFOp<'a> {
    #[slot(result)]
    pub lhs: Value<'a>,
    #[slot(result)]
    pub rhs: Value<'a>,
    #[attr(dialect = "arith.fastmath", default = "<none>")]
    pub fastmath: Option<Attribute<'a>>,
    pub result: Type<'a>,
}

#[mlir::op("arith.maxsi", format = "$lhs `,` $rhs attr-dict `:` type($result)", results(result))]
pub struct MaxSIOp<'a> {
    #[slot(result)]
    pub lhs: Value<'a>,
    #[slot(result)]
    pub rhs: Value<'a>,
    pub result: Type<'a>,
}

#[mlir::op("arith.maxui", format = "$lhs `,` $rhs attr-dict `:` type($result)", results(result))]
pub struct MaxUIOp<'a> {
    #[slot(result)]
    pub lhs: Value<'a>,
    #[slot(result)]
    pub rhs: Value<'a>,
    pub result: Type<'a>,
}

#[mlir::op("arith.maximumf", format = "$lhs `,` $rhs (`fastmath` `` $fastmath^)? attr-dict `:` type($result)", results(result))]
pub struct MaximumFOp<'a> {
    #[slot(result)]
    pub lhs: Value<'a>,
    #[slot(result)]
    pub rhs: Value<'a>,
    #[attr(dialect = "arith.fastmath", default = "<none>")]
    pub fastmath: Option<Attribute<'a>>,
    pub result: Type<'a>,
}

#[mlir::op("arith.minnumf", format = "$lhs `,` $rhs (`fastmath` `` $fastmath^)? attr-dict `:` type($result)", results(result))]
pub struct MinNumFOp<'a> {
    #[slot(result)]
    pub lhs: Value<'a>,
    #[slot(result)]
    pub rhs: Value<'a>,
    #[attr(dialect = "arith.fastmath", default = "<none>")]
    pub fastmath: Option<Attribute<'a>>,
    pub result: Type<'a>,
}

#[mlir::op("arith.minsi", format = "$lhs `,` $rhs attr-dict `:` type($result)", results(result))]
pub struct MinSIOp<'a> {
    #[slot(result)]
    pub lhs: Value<'a>,
    #[slot(result)]
    pub rhs: Value<'a>,
    pub result: Type<'a>,
}

#[mlir::op("arith.minui", format = "$lhs `,` $rhs attr-dict `:` type($result)", results(result))]
pub struct MinUIOp<'a> {
    #[slot(result)]
    pub lhs: Value<'a>,
    #[slot(result)]
    pub rhs: Value<'a>,
    pub result: Type<'a>,
}

#[mlir::op("arith.minimumf", format = "$lhs `,` $rhs (`fastmath` `` $fastmath^)? attr-dict `:` type($result)", results(result))]
pub struct MinimumFOp<'a> {
    #[slot(result)]
    pub lhs: Value<'a>,
    #[slot(result)]
    pub rhs: Value<'a>,
    #[attr(dialect = "arith.fastmath", default = "<none>")]
    pub fastmath: Option<Attribute<'a>>,
    pub result: Type<'a>,
}

#[mlir::op("arith.mulf", format = "$lhs `,` $rhs ($roundingmode^)? (`fastmath` `` $fastmath^)? attr-dict `:` type($result)", results(result))]
pub struct MulFOp<'a> {
    #[slot(result)]
    pub lhs: Value<'a>,
    #[slot(result)]
    pub rhs: Value<'a>,
    #[attr(dialect = "arith.fastmath", default = "<none>")]
    pub fastmath: Option<Attribute<'a>>,
    #[attr(int = "i32")]
    pub roundingmode: Option<RoundingMode>,
    pub result: Type<'a>,
}

#[mlir::op("arith.muli", format = "$lhs `,` $rhs (`overflow` `` $overflowFlags^)? attr-dict `:` type($result)", results(result))]
pub struct MulIOp<'a> {
    #[slot(result)]
    pub lhs: Value<'a>,
    #[slot(result)]
    pub rhs: Value<'a>,
    #[attr(name = "overflowFlags", dialect = "arith.overflow", default = "<none>")]
    pub overflow_flags: Option<Attribute<'a>>,
    pub result: Type<'a>,
}

#[mlir::op("arith.mulsi_extended", format = "$lhs `,` $rhs attr-dict `:` type($lhs)", results(low, high))]
pub struct MulSIExtendedOp<'a> {
    #[slot(low)]
    pub lhs: Value<'a>,
    #[slot(low)]
    pub rhs: Value<'a>,
    pub low: Type<'a>,
    #[dtype(eq = low)]
    pub high: Type<'a>,
}

#[mlir::op("arith.mului_extended", format = "$lhs `,` $rhs attr-dict `:` type($lhs)", results(low, high))]
pub struct MulUIExtendedOp<'a> {
    #[slot(low)]
    pub lhs: Value<'a>,
    #[slot(low)]
    pub rhs: Value<'a>,
    pub low: Type<'a>,
    #[dtype(eq = low)]
    pub high: Type<'a>,
}

#[mlir::op("arith.negf", format = "$operand (`fastmath` `` $fastmath^)? attr-dict `:` type($result)", results(result))]
pub struct NegFOp<'a> {
    #[slot(result)]
    pub operand: Value<'a>,
    #[attr(dialect = "arith.fastmath", default = "<none>")]
    pub fastmath: Option<Attribute<'a>>,
    pub result: Type<'a>,
}

#[mlir::op("arith.ori", format = "$lhs `,` $rhs attr-dict `:` type($result)", results(result))]
pub struct OrIOp<'a> {
    #[slot(result)]
    pub lhs: Value<'a>,
    #[slot(result)]
    pub rhs: Value<'a>,
    pub result: Type<'a>,
}

#[mlir::op("arith.remf", format = "$lhs `,` $rhs (`fastmath` `` $fastmath^)? attr-dict `:` type($result)", results(result))]
pub struct RemFOp<'a> {
    #[slot(result)]
    pub lhs: Value<'a>,
    #[slot(result)]
    pub rhs: Value<'a>,
    #[attr(dialect = "arith.fastmath", default = "<none>")]
    pub fastmath: Option<Attribute<'a>>,
    pub result: Type<'a>,
}

#[mlir::op("arith.remsi", format = "$lhs `,` $rhs attr-dict `:` type($result)", results(result))]
pub struct RemSIOp<'a> {
    #[slot(result)]
    pub lhs: Value<'a>,
    #[slot(result)]
    pub rhs: Value<'a>,
    pub result: Type<'a>,
}

#[mlir::op("arith.remui", format = "$lhs `,` $rhs attr-dict `:` type($result)", results(result))]
pub struct RemUIOp<'a> {
    #[slot(result)]
    pub lhs: Value<'a>,
    #[slot(result)]
    pub rhs: Value<'a>,
    pub result: Type<'a>,
}

#[mlir::op("arith.sitofp", format = "$in attr-dict `:` type($in) `to` type($out)", results(out))]
pub struct SIToFPOp<'a> {
    #[slot(in_ty, name = "in")]
    pub in_: Value<'a>,
    pub in_ty: Type<'a>,
    pub out: Type<'a>,
}

#[mlir::op("arith.scaling_extf", format = "$in `,` $scale (`fastmath` `` $fastmath^)? attr-dict `:` type($in) `,` type($scale) `to` type($out)", results(out))]
pub struct ScalingExtFOp<'a> {
    #[slot(in_ty, name = "in")]
    pub in_: Value<'a>,
    #[slot(scale_ty)]
    pub scale: Value<'a>,
    #[attr(dialect = "arith.fastmath")]
    pub fastmath: Option<Attribute<'a>>,
    pub in_ty: Type<'a>,
    pub scale_ty: Type<'a>,
    pub out: Type<'a>,
}

#[mlir::op("arith.scaling_truncf", format = "$in `,` $scale ($roundingmode^)? (`fastmath` `` $fastmath^)? attr-dict `:` type($in) `,` type($scale) `to` type($out)", results(out))]
pub struct ScalingTruncFOp<'a> {
    #[slot(in_ty, name = "in")]
    pub in_: Value<'a>,
    #[slot(scale_ty)]
    pub scale: Value<'a>,
    #[attr(int = "i32")]
    pub roundingmode: Option<RoundingMode>,
    #[attr(dialect = "arith.fastmath")]
    pub fastmath: Option<Attribute<'a>>,
    pub in_ty: Type<'a>,
    pub scale_ty: Type<'a>,
    pub out: Type<'a>,
}

#[mlir::op("arith.shli", format = "$lhs `,` $rhs (`overflow` `` $overflowFlags^)? attr-dict `:` type($result)", results(result))]
pub struct ShLIOp<'a> {
    #[slot(result)]
    pub lhs: Value<'a>,
    #[slot(result)]
    pub rhs: Value<'a>,
    #[attr(name = "overflowFlags", dialect = "arith.overflow", default = "<none>")]
    pub overflow_flags: Option<Attribute<'a>>,
    pub result: Type<'a>,
}

#[mlir::op("arith.shrsi", format = "$lhs `,` $rhs (`exact` $isExact^)? attr-dict `:` type($result)", results(result))]
pub struct ShRSIOp<'a> {
    #[slot(result)]
    pub lhs: Value<'a>,
    #[slot(result)]
    pub rhs: Value<'a>,
    #[attr(name = "isExact")]
    pub is_exact: bool,
    pub result: Type<'a>,
}

#[mlir::op("arith.shrui", format = "$lhs `,` $rhs (`exact` $isExact^)? attr-dict `:` type($result)", results(result))]
pub struct ShRUIOp<'a> {
    #[slot(result)]
    pub lhs: Value<'a>,
    #[slot(result)]
    pub rhs: Value<'a>,
    #[attr(name = "isExact")]
    pub is_exact: bool,
    pub result: Type<'a>,
}

#[mlir::op("arith.subf", format = "$lhs `,` $rhs ($roundingmode^)? (`fastmath` `` $fastmath^)? attr-dict `:` type($result)", results(result))]
pub struct SubFOp<'a> {
    #[slot(result)]
    pub lhs: Value<'a>,
    #[slot(result)]
    pub rhs: Value<'a>,
    #[attr(dialect = "arith.fastmath", default = "<none>")]
    pub fastmath: Option<Attribute<'a>>,
    #[attr(int = "i32")]
    pub roundingmode: Option<RoundingMode>,
    pub result: Type<'a>,
}

#[mlir::op("arith.subi", format = "$lhs `,` $rhs (`overflow` `` $overflowFlags^)? attr-dict `:` type($result)", results(result))]
pub struct SubIOp<'a> {
    #[slot(result)]
    pub lhs: Value<'a>,
    #[slot(result)]
    pub rhs: Value<'a>,
    #[attr(name = "overflowFlags", dialect = "arith.overflow", default = "<none>")]
    pub overflow_flags: Option<Attribute<'a>>,
    pub result: Type<'a>,
}

#[mlir::op("arith.subui_extended", format = "$lhs `,` $rhs attr-dict `:` type($diff) `,` type($borrow)", results(diff, borrow))]
pub struct SubUIExtendedOp<'a> {
    #[slot(diff)]
    pub lhs: Value<'a>,
    #[slot(diff)]
    pub rhs: Value<'a>,
    pub diff: Type<'a>,
    pub borrow: Type<'a>,
}

#[mlir::op("arith.truncf", format = "$in ($roundingmode^)? (`fastmath` `` $fastmath^)? attr-dict `:` type($in) `to` type($out)", results(out))]
pub struct TruncFOp<'a> {
    #[slot(in_ty, name = "in")]
    pub in_: Value<'a>,
    #[attr(int = "i32")]
    pub roundingmode: Option<RoundingMode>,
    #[attr(dialect = "arith.fastmath")]
    pub fastmath: Option<Attribute<'a>>,
    pub in_ty: Type<'a>,
    pub out: Type<'a>,
}

#[mlir::op("arith.trunci", format = "$in (`overflow` `` $overflowFlags^)? attr-dict `:` type($in) `to` type($out)", results(out))]
pub struct TruncIOp<'a> {
    #[slot(in_ty, name = "in")]
    pub in_: Value<'a>,
    #[attr(name = "overflowFlags", dialect = "arith.overflow", default = "<none>")]
    pub overflow_flags: Option<Attribute<'a>>,
    pub in_ty: Type<'a>,
    pub out: Type<'a>,
}

#[mlir::op("arith.uitofp", format = "$in (`nneg` $nonNeg^)? attr-dict `:` type($in) `to` type($out)", results(out))]
pub struct UIToFPOp<'a> {
    #[slot(in_ty, name = "in")]
    pub in_: Value<'a>,
    #[attr(name = "nonNeg")]
    pub non_neg: bool,
    pub in_ty: Type<'a>,
    pub out: Type<'a>,
}

#[mlir::op("arith.xori", format = "$lhs `,` $rhs attr-dict `:` type($result)", results(result))]
pub struct XOrIOp<'a> {
    #[slot(result)]
    pub lhs: Value<'a>,
    #[slot(result)]
    pub rhs: Value<'a>,
    pub result: Type<'a>,
}

#[mlir::op("arith.select", results(result))]
pub struct SelectOp<'a> {
    #[slot(condition_ty)]
    pub condition: Value<'a>,
    #[slot(result)]
    pub true_value: Value<'a>,
    #[slot(result)]
    pub false_value: Value<'a>,
    pub condition_ty: Type<'a>,
    pub result: Type<'a>,
}

#[mlir::dialect(
    "arith",
    ops = [AddFOp, AddIOp, AddUIExtendedOp, AndIOp, BitcastOp, CeilDivSIOp, CeilDivUIOp, CmpFOp, CmpIOp, ConstantOp, ConvertFOp, DivFOp, DivSIOp, DivUIOp, ExtFOp, ExtSIOp, ExtUIOp, FPToSIOp, FPToUIOp, FloorDivSIOp, FlushDenormalsOp, IndexCastOp, IndexCastUIOp, MaxNumFOp, MaxSIOp, MaxUIOp, MaximumFOp, MinNumFOp, MinSIOp, MinUIOp, MinimumFOp, MulFOp, MulIOp, MulSIExtendedOp, MulUIExtendedOp, NegFOp, OrIOp, RemFOp, RemSIOp, RemUIOp, SIToFPOp, ScalingExtFOp, ScalingTruncFOp, ShLIOp, ShRSIOp, ShRUIOp, SubFOp, SubIOp, SubUIExtendedOp, TruncFOp, TruncIOp, UIToFPOp, XOrIOp, SelectOp],
    materializer
)]
pub struct ArithDialect;
