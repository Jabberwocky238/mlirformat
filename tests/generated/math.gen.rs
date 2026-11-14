#![allow(non_camel_case_types, unused_imports, clippy::all, rustdoc::all)]

use mlirformat::{mlir, Attribute, Region, Str, Type, Value, __Vec as Vec};

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

#[mlir::op("math.absf", format = "$operand (`fastmath` `` $fastmath^)? attr-dict `:` type($result)", results(result))]
pub struct AbsFOp<'a> {
    #[slot(result)]
    pub operand: Value<'a>,
    #[attr(dialect = "arith.fastmath", default = "<none>")]
    pub fastmath: Option<Attribute<'a>>,
    pub result: Type<'a>,
}

#[mlir::op("math.absi", format = "$operand attr-dict `:` type($result)", results(result))]
pub struct AbsIOp<'a> {
    #[slot(result)]
    pub operand: Value<'a>,
    pub result: Type<'a>,
}

#[mlir::op("math.acos", format = "$operand (`fastmath` `` $fastmath^)? attr-dict `:` type($result)", results(result))]
pub struct AcosOp<'a> {
    #[slot(result)]
    pub operand: Value<'a>,
    #[attr(dialect = "arith.fastmath", default = "<none>")]
    pub fastmath: Option<Attribute<'a>>,
    pub result: Type<'a>,
}

#[mlir::op("math.acosh", format = "$operand (`fastmath` `` $fastmath^)? attr-dict `:` type($result)", results(result))]
pub struct AcoshOp<'a> {
    #[slot(result)]
    pub operand: Value<'a>,
    #[attr(dialect = "arith.fastmath", default = "<none>")]
    pub fastmath: Option<Attribute<'a>>,
    pub result: Type<'a>,
}

#[mlir::op("math.asin", format = "$operand (`fastmath` `` $fastmath^)? attr-dict `:` type($result)", results(result))]
pub struct AsinOp<'a> {
    #[slot(result)]
    pub operand: Value<'a>,
    #[attr(dialect = "arith.fastmath", default = "<none>")]
    pub fastmath: Option<Attribute<'a>>,
    pub result: Type<'a>,
}

#[mlir::op("math.asinh", format = "$operand (`fastmath` `` $fastmath^)? attr-dict `:` type($result)", results(result))]
pub struct AsinhOp<'a> {
    #[slot(result)]
    pub operand: Value<'a>,
    #[attr(dialect = "arith.fastmath", default = "<none>")]
    pub fastmath: Option<Attribute<'a>>,
    pub result: Type<'a>,
}

#[mlir::op("math.atan2", format = "$lhs `,` $rhs (`fastmath` `` $fastmath^)? attr-dict `:` type($result)", results(result))]
pub struct Atan2Op<'a> {
    #[slot(result)]
    pub lhs: Value<'a>,
    #[slot(result)]
    pub rhs: Value<'a>,
    #[attr(dialect = "arith.fastmath", default = "<none>")]
    pub fastmath: Option<Attribute<'a>>,
    pub result: Type<'a>,
}

#[mlir::op("math.atan", format = "$operand (`fastmath` `` $fastmath^)? attr-dict `:` type($result)", results(result))]
pub struct AtanOp<'a> {
    #[slot(result)]
    pub operand: Value<'a>,
    #[attr(dialect = "arith.fastmath", default = "<none>")]
    pub fastmath: Option<Attribute<'a>>,
    pub result: Type<'a>,
}

#[mlir::op("math.atanh", format = "$operand (`fastmath` `` $fastmath^)? attr-dict `:` type($result)", results(result))]
pub struct AtanhOp<'a> {
    #[slot(result)]
    pub operand: Value<'a>,
    #[attr(dialect = "arith.fastmath", default = "<none>")]
    pub fastmath: Option<Attribute<'a>>,
    pub result: Type<'a>,
}

#[mlir::op("math.cbrt", format = "$operand (`fastmath` `` $fastmath^)? attr-dict `:` type($result)", results(result))]
pub struct CbrtOp<'a> {
    #[slot(result)]
    pub operand: Value<'a>,
    #[attr(dialect = "arith.fastmath", default = "<none>")]
    pub fastmath: Option<Attribute<'a>>,
    pub result: Type<'a>,
}

#[mlir::op("math.ceil", format = "$operand (`fastmath` `` $fastmath^)? attr-dict `:` type($result)", results(result))]
pub struct CeilOp<'a> {
    #[slot(result)]
    pub operand: Value<'a>,
    #[attr(dialect = "arith.fastmath", default = "<none>")]
    pub fastmath: Option<Attribute<'a>>,
    pub result: Type<'a>,
}

#[mlir::op("math.clampf", format = "$value `to` ` ` `[` $min `,` $max `]` (`fastmath` `` $fastmath^)? attr-dict `:` type($result)", results(result))]
pub struct ClampFOp<'a> {
    #[slot(result)]
    pub value: Value<'a>,
    #[slot(result)]
    pub min: Value<'a>,
    #[slot(result)]
    pub max: Value<'a>,
    #[attr(dialect = "arith.fastmath", default = "<none>")]
    pub fastmath: Option<Attribute<'a>>,
    pub result: Type<'a>,
}

#[mlir::op("math.copysign", format = "$lhs `,` $rhs (`fastmath` `` $fastmath^)? attr-dict `:` type($result)", results(result))]
pub struct CopySignOp<'a> {
    #[slot(result)]
    pub lhs: Value<'a>,
    #[slot(result)]
    pub rhs: Value<'a>,
    #[attr(dialect = "arith.fastmath", default = "<none>")]
    pub fastmath: Option<Attribute<'a>>,
    pub result: Type<'a>,
}

#[mlir::op("math.cos", format = "$operand (`fastmath` `` $fastmath^)? attr-dict `:` type($result)", results(result))]
pub struct CosOp<'a> {
    #[slot(result)]
    pub operand: Value<'a>,
    #[attr(dialect = "arith.fastmath", default = "<none>")]
    pub fastmath: Option<Attribute<'a>>,
    pub result: Type<'a>,
}

#[mlir::op("math.cosh", format = "$operand (`fastmath` `` $fastmath^)? attr-dict `:` type($result)", results(result))]
pub struct CoshOp<'a> {
    #[slot(result)]
    pub operand: Value<'a>,
    #[attr(dialect = "arith.fastmath", default = "<none>")]
    pub fastmath: Option<Attribute<'a>>,
    pub result: Type<'a>,
}

#[mlir::op("math.ctlz", format = "$operand attr-dict `:` type($result)", results(result))]
pub struct CountLeadingZerosOp<'a> {
    #[slot(result)]
    pub operand: Value<'a>,
    pub result: Type<'a>,
}

#[mlir::op("math.cttz", format = "$operand attr-dict `:` type($result)", results(result))]
pub struct CountTrailingZerosOp<'a> {
    #[slot(result)]
    pub operand: Value<'a>,
    pub result: Type<'a>,
}

#[mlir::op("math.ctpop", format = "$operand attr-dict `:` type($result)", results(result))]
pub struct CtPopOp<'a> {
    #[slot(result)]
    pub operand: Value<'a>,
    pub result: Type<'a>,
}

#[mlir::op("math.erf", format = "$operand (`fastmath` `` $fastmath^)? attr-dict `:` type($result)", results(result))]
pub struct ErfOp<'a> {
    #[slot(result)]
    pub operand: Value<'a>,
    #[attr(dialect = "arith.fastmath", default = "<none>")]
    pub fastmath: Option<Attribute<'a>>,
    pub result: Type<'a>,
}

#[mlir::op("math.erfc", format = "$operand (`fastmath` `` $fastmath^)? attr-dict `:` type($result)", results(result))]
pub struct ErfcOp<'a> {
    #[slot(result)]
    pub operand: Value<'a>,
    #[attr(dialect = "arith.fastmath", default = "<none>")]
    pub fastmath: Option<Attribute<'a>>,
    pub result: Type<'a>,
}

#[mlir::op("math.exp2", format = "$operand (`fastmath` `` $fastmath^)? attr-dict `:` type($result)", results(result))]
pub struct Exp2Op<'a> {
    #[slot(result)]
    pub operand: Value<'a>,
    #[attr(dialect = "arith.fastmath", default = "<none>")]
    pub fastmath: Option<Attribute<'a>>,
    pub result: Type<'a>,
}

#[mlir::op("math.expm1", format = "$operand (`fastmath` `` $fastmath^)? attr-dict `:` type($result)", results(result))]
pub struct ExpM1Op<'a> {
    #[slot(result)]
    pub operand: Value<'a>,
    #[attr(dialect = "arith.fastmath", default = "<none>")]
    pub fastmath: Option<Attribute<'a>>,
    pub result: Type<'a>,
}

#[mlir::op("math.exp", format = "$operand (`fastmath` `` $fastmath^)? attr-dict `:` type($result)", results(result))]
pub struct ExpOp<'a> {
    #[slot(result)]
    pub operand: Value<'a>,
    #[attr(dialect = "arith.fastmath", default = "<none>")]
    pub fastmath: Option<Attribute<'a>>,
    pub result: Type<'a>,
}

#[mlir::op("math.fpowi", format = "$lhs `,` $rhs (`fastmath` `` $fastmath^)? attr-dict `:` type($lhs) `,` type($rhs)", results(result))]
pub struct FPowIOp<'a> {
    #[slot(result)]
    pub lhs: Value<'a>,
    #[slot(rhs_ty)]
    pub rhs: Value<'a>,
    #[attr(dialect = "arith.fastmath", default = "<none>")]
    pub fastmath: Option<Attribute<'a>>,
    pub rhs_ty: Type<'a>,
    pub result: Type<'a>,
}

#[mlir::op("math.floor", format = "$operand (`fastmath` `` $fastmath^)? attr-dict `:` type($result)", results(result))]
pub struct FloorOp<'a> {
    #[slot(result)]
    pub operand: Value<'a>,
    #[attr(dialect = "arith.fastmath", default = "<none>")]
    pub fastmath: Option<Attribute<'a>>,
    pub result: Type<'a>,
}

#[mlir::op("math.fma", format = "$a `,` $b `,` $c ($roundingmode^)? (`fastmath` `` $fastmath^)? attr-dict `:` type($result)", results(result))]
pub struct FmaOp<'a> {
    #[slot(result)]
    pub a: Value<'a>,
    #[slot(result)]
    pub b: Value<'a>,
    #[slot(result)]
    pub c: Value<'a>,
    #[attr(dialect = "arith.fastmath", default = "<none>")]
    pub fastmath: Option<Attribute<'a>>,
    #[attr(int = "i32")]
    pub roundingmode: Option<RoundingMode>,
    pub result: Type<'a>,
}

#[mlir::op("math.ipowi", format = "$lhs `,` $rhs attr-dict `:` type($result)", results(result))]
pub struct IPowIOp<'a> {
    #[slot(result)]
    pub lhs: Value<'a>,
    #[slot(result)]
    pub rhs: Value<'a>,
    pub result: Type<'a>,
}

#[mlir::op("math.isfinite", format = "$operand attr-dict `:` type($operand)", results(result))]
pub struct IsFiniteOp<'a> {
    #[slot(operand_ty)]
    pub operand: Value<'a>,
    #[attr(dialect = "arith.fastmath", default = "<none>")]
    pub fastmath: Option<Attribute<'a>>,
    pub operand_ty: Type<'a>,
    #[dtype(i1 = operand_ty)]
    pub result: Type<'a>,
}

#[mlir::op("math.isinf", format = "$operand attr-dict `:` type($operand)", results(result))]
pub struct IsInfOp<'a> {
    #[slot(operand_ty)]
    pub operand: Value<'a>,
    #[attr(dialect = "arith.fastmath", default = "<none>")]
    pub fastmath: Option<Attribute<'a>>,
    pub operand_ty: Type<'a>,
    #[dtype(i1 = operand_ty)]
    pub result: Type<'a>,
}

#[mlir::op("math.isnan", format = "$operand attr-dict `:` type($operand)", results(result))]
pub struct IsNaNOp<'a> {
    #[slot(operand_ty)]
    pub operand: Value<'a>,
    #[attr(dialect = "arith.fastmath", default = "<none>")]
    pub fastmath: Option<Attribute<'a>>,
    pub operand_ty: Type<'a>,
    #[dtype(i1 = operand_ty)]
    pub result: Type<'a>,
}

#[mlir::op("math.isnormal", format = "$operand attr-dict `:` type($operand)", results(result))]
pub struct IsNormalOp<'a> {
    #[slot(operand_ty)]
    pub operand: Value<'a>,
    #[attr(dialect = "arith.fastmath", default = "<none>")]
    pub fastmath: Option<Attribute<'a>>,
    pub operand_ty: Type<'a>,
    #[dtype(i1 = operand_ty)]
    pub result: Type<'a>,
}

#[mlir::op("math.log10", format = "$operand (`fastmath` `` $fastmath^)? attr-dict `:` type($result)", results(result))]
pub struct Log10Op<'a> {
    #[slot(result)]
    pub operand: Value<'a>,
    #[attr(dialect = "arith.fastmath", default = "<none>")]
    pub fastmath: Option<Attribute<'a>>,
    pub result: Type<'a>,
}

#[mlir::op("math.log1p", format = "$operand (`fastmath` `` $fastmath^)? attr-dict `:` type($result)", results(result))]
pub struct Log1pOp<'a> {
    #[slot(result)]
    pub operand: Value<'a>,
    #[attr(dialect = "arith.fastmath", default = "<none>")]
    pub fastmath: Option<Attribute<'a>>,
    pub result: Type<'a>,
}

#[mlir::op("math.log2", format = "$operand (`fastmath` `` $fastmath^)? attr-dict `:` type($result)", results(result))]
pub struct Log2Op<'a> {
    #[slot(result)]
    pub operand: Value<'a>,
    #[attr(dialect = "arith.fastmath", default = "<none>")]
    pub fastmath: Option<Attribute<'a>>,
    pub result: Type<'a>,
}

#[mlir::op("math.log", format = "$operand (`fastmath` `` $fastmath^)? attr-dict `:` type($result)", results(result))]
pub struct LogOp<'a> {
    #[slot(result)]
    pub operand: Value<'a>,
    #[attr(dialect = "arith.fastmath", default = "<none>")]
    pub fastmath: Option<Attribute<'a>>,
    pub result: Type<'a>,
}

#[mlir::op("math.powf", format = "$lhs `,` $rhs (`fastmath` `` $fastmath^)? attr-dict `:` type($result)", results(result))]
pub struct PowFOp<'a> {
    #[slot(result)]
    pub lhs: Value<'a>,
    #[slot(result)]
    pub rhs: Value<'a>,
    #[attr(dialect = "arith.fastmath", default = "<none>")]
    pub fastmath: Option<Attribute<'a>>,
    pub result: Type<'a>,
}

#[mlir::op("math.roundeven", format = "$operand (`fastmath` `` $fastmath^)? attr-dict `:` type($result)", results(result))]
pub struct RoundEvenOp<'a> {
    #[slot(result)]
    pub operand: Value<'a>,
    #[attr(dialect = "arith.fastmath", default = "<none>")]
    pub fastmath: Option<Attribute<'a>>,
    pub result: Type<'a>,
}

#[mlir::op("math.round", format = "$operand (`fastmath` `` $fastmath^)? attr-dict `:` type($result)", results(result))]
pub struct RoundOp<'a> {
    #[slot(result)]
    pub operand: Value<'a>,
    #[attr(dialect = "arith.fastmath", default = "<none>")]
    pub fastmath: Option<Attribute<'a>>,
    pub result: Type<'a>,
}

#[mlir::op("math.rsqrt", format = "$operand (`fastmath` `` $fastmath^)? attr-dict `:` type($result)", results(result))]
pub struct RsqrtOp<'a> {
    #[slot(result)]
    pub operand: Value<'a>,
    #[attr(dialect = "arith.fastmath", default = "<none>")]
    pub fastmath: Option<Attribute<'a>>,
    pub result: Type<'a>,
}

#[mlir::op("math.sin", format = "$operand (`fastmath` `` $fastmath^)? attr-dict `:` type($result)", results(result))]
pub struct SinOp<'a> {
    #[slot(result)]
    pub operand: Value<'a>,
    #[attr(dialect = "arith.fastmath", default = "<none>")]
    pub fastmath: Option<Attribute<'a>>,
    pub result: Type<'a>,
}

#[mlir::op("math.sincos", format = "$operand (`fastmath` `` $fastmath^)? attr-dict `:` type($operand)", results(sin, cos))]
pub struct SincosOp<'a> {
    #[slot(sin)]
    pub operand: Value<'a>,
    #[attr(dialect = "arith.fastmath", default = "<none>")]
    pub fastmath: Option<Attribute<'a>>,
    pub sin: Type<'a>,
    #[dtype(eq = sin)]
    pub cos: Type<'a>,
}

#[mlir::op("math.sinh", format = "$operand (`fastmath` `` $fastmath^)? attr-dict `:` type($result)", results(result))]
pub struct SinhOp<'a> {
    #[slot(result)]
    pub operand: Value<'a>,
    #[attr(dialect = "arith.fastmath", default = "<none>")]
    pub fastmath: Option<Attribute<'a>>,
    pub result: Type<'a>,
}

#[mlir::op("math.sqrt", format = "$operand (`fastmath` `` $fastmath^)? attr-dict `:` type($result)", results(result))]
pub struct SqrtOp<'a> {
    #[slot(result)]
    pub operand: Value<'a>,
    #[attr(dialect = "arith.fastmath", default = "<none>")]
    pub fastmath: Option<Attribute<'a>>,
    pub result: Type<'a>,
}

#[mlir::op("math.tan", format = "$operand (`fastmath` `` $fastmath^)? attr-dict `:` type($result)", results(result))]
pub struct TanOp<'a> {
    #[slot(result)]
    pub operand: Value<'a>,
    #[attr(dialect = "arith.fastmath", default = "<none>")]
    pub fastmath: Option<Attribute<'a>>,
    pub result: Type<'a>,
}

#[mlir::op("math.tanh", format = "$operand (`fastmath` `` $fastmath^)? attr-dict `:` type($result)", results(result))]
pub struct TanhOp<'a> {
    #[slot(result)]
    pub operand: Value<'a>,
    #[attr(dialect = "arith.fastmath", default = "<none>")]
    pub fastmath: Option<Attribute<'a>>,
    pub result: Type<'a>,
}

#[mlir::op("math.trunc", format = "$operand (`fastmath` `` $fastmath^)? attr-dict `:` type($result)", results(result))]
pub struct TruncOp<'a> {
    #[slot(result)]
    pub operand: Value<'a>,
    #[attr(dialect = "arith.fastmath", default = "<none>")]
    pub fastmath: Option<Attribute<'a>>,
    pub result: Type<'a>,
}

#[mlir::dialect(
    "math",
    ops = [AbsFOp, AbsIOp, AcosOp, AcoshOp, AsinOp, AsinhOp, Atan2Op, AtanOp, AtanhOp, CbrtOp, CeilOp, ClampFOp, CopySignOp, CosOp, CoshOp, CountLeadingZerosOp, CountTrailingZerosOp, CtPopOp, ErfOp, ErfcOp, Exp2Op, ExpM1Op, ExpOp, FPowIOp, FloorOp, FmaOp, IPowIOp, IsFiniteOp, IsInfOp, IsNaNOp, IsNormalOp, Log10Op, Log1pOp, Log2Op, LogOp, PowFOp, RoundEvenOp, RoundOp, RsqrtOp, SinOp, SincosOp, SinhOp, SqrtOp, TanOp, TanhOp, TruncOp],
    dependents = ["arith"],
    materializer
)]
pub struct MathDialect;
