//! `math` (formats from `MathOps.td`, checked against `mlir-opt` 22.1.8 output).

use crate::{Attribute, Type, Value, mlir};

/// `operand [fastmath<…>] : T` float ops.
macro_rules! unary_f {
    ($($ty:ident = $name:literal),* $(,)?) => {$(
        #[mlir::op($name, format = "$operand (`fastmath` `` $fastmath^)? attr-dict `:` type($result)", results(result))]
        pub struct $ty<'a> {
            #[slot(result)]
            pub operand: Value<'a>,
            #[attr(dialect = "arith.fastmath", default = "<none>")]
            pub fastmath: Attribute<'a>,
            #[dtype]
            pub result: Type<'a>,
        }
    )*};
}

/// `lhs, rhs [fastmath<…>] : T` float ops.
macro_rules! binary_f {
    ($($ty:ident = $name:literal),* $(,)?) => {$(
        #[mlir::op($name, format = "$lhs `,` $rhs (`fastmath` `` $fastmath^)? attr-dict `:` type($result)", results(result))]
        pub struct $ty<'a> {
            #[slot(result)]
            pub lhs: Value<'a>,
            #[slot(result)]
            pub rhs: Value<'a>,
            #[attr(dialect = "arith.fastmath", default = "<none>")]
            pub fastmath: Attribute<'a>,
            #[dtype]
            pub result: Type<'a>,
        }
    )*};
}

/// `operand : T` integer ops.
macro_rules! unary_i {
    ($($ty:ident = $name:literal),* $(,)?) => {$(
        #[mlir::op($name, format = "$operand attr-dict `:` type($result)", results(result))]
        pub struct $ty<'a> {
            #[slot(result)]
            pub operand: Value<'a>,
            #[dtype]
            pub result: Type<'a>,
        }
    )*};
}

/// `operand [fastmath<…>] : T` ⇒ `i1` (shaped like `T`) classification ops.
macro_rules! classify {
    ($($ty:ident = $name:literal),* $(,)?) => {$(
        #[mlir::op($name, format = "$operand (`fastmath` `` $fastmath^)? attr-dict `:` type($operand)", results(result))]
        pub struct $ty<'a> {
            #[slot(ty)]
            pub operand: Value<'a>,
            #[attr(dialect = "arith.fastmath", default = "<none>")]
            pub fastmath: Attribute<'a>,
            #[dtype]
            pub ty: Type<'a>,
            #[dtype(i1 = ty)]
            pub result: Type<'a>,
        }
    )*};
}

unary_f! {
    AbsF = "math.absf", AcosOp = "math.acos", AcoshOp = "math.acosh", AsinOp = "math.asin", AsinhOp = "math.asinh",
    AtanOp = "math.atan", AtanhOp = "math.atanh", CbrtOp = "math.cbrt", CeilOp = "math.ceil", CosOp = "math.cos",
    CoshOp = "math.cosh", ErfOp = "math.erf", ErfcOp = "math.erfc", ExpOp = "math.exp", Exp2Op = "math.exp2",
    ExpM1Op = "math.expm1", FloorOp = "math.floor", LogOp = "math.log", Log10Op = "math.log10", Log1pOp = "math.log1p",
    Log2Op = "math.log2", RoundOp = "math.round", RoundEvenOp = "math.roundeven", RsqrtOp = "math.rsqrt", SinOp = "math.sin",
    SinhOp = "math.sinh", SqrtOp = "math.sqrt", TanOp = "math.tan", TanhOp = "math.tanh", TruncOp = "math.trunc",
}

binary_f! { Atan2Op = "math.atan2", CopySignOp = "math.copysign", PowFOp = "math.powf" }

unary_i! { AbsIOp = "math.absi", CountLeadingZerosOp = "math.ctlz", CountTrailingZerosOp = "math.cttz", CtPopOp = "math.ctpop" }

classify! { IsFiniteOp = "math.isfinite", IsInfOp = "math.isinf", IsNaNOp = "math.isnan", IsNormalOp = "math.isnormal" }

#[mlir::op("math.ipowi", format = "$lhs `,` $rhs attr-dict `:` type($result)", results(result))]
pub struct IPowIOp<'a> {
    #[slot(result)]
    pub lhs: Value<'a>,
    #[slot(result)]
    pub rhs: Value<'a>,
    #[dtype]
    pub result: Type<'a>,
}

/// `lhs, rhs : F, I`: float to an integer power.
#[mlir::op("math.fpowi", format = "$lhs `,` $rhs (`fastmath` `` $fastmath^)? attr-dict `:` type($lhs) `,` type($rhs)", results(result))]
pub struct FPowIOp<'a> {
    #[slot(result)]
    pub lhs: Value<'a>,
    #[slot(rhs_ty)]
    pub rhs: Value<'a>,
    #[attr(dialect = "arith.fastmath", default = "<none>")]
    pub fastmath: Attribute<'a>,
    #[dtype]
    pub result: Type<'a>,
    #[dtype]
    pub rhs_ty: Type<'a>,
}

#[mlir::op("math.fma", format = "$a `,` $b `,` $c (`fastmath` `` $fastmath^)? attr-dict `:` type($result)", results(result))]
pub struct FmaOp<'a> {
    #[slot(result)]
    pub a: Value<'a>,
    #[slot(result)]
    pub b: Value<'a>,
    #[slot(result)]
    pub c: Value<'a>,
    #[attr(dialect = "arith.fastmath", default = "<none>")]
    pub fastmath: Attribute<'a>,
    #[dtype]
    pub result: Type<'a>,
}

/// `%sin, %cos = math.sincos %x : T`.
#[mlir::op("math.sincos", format = "$operand (`fastmath` `` $fastmath^)? attr-dict `:` type($operand)", results(sin, cos))]
pub struct SincosOp<'a> {
    #[slot(sin)]
    pub operand: Value<'a>,
    #[attr(dialect = "arith.fastmath", default = "<none>")]
    pub fastmath: Attribute<'a>,
    #[dtype]
    pub sin: Type<'a>,
    #[dtype(eq = sin)]
    pub cos: Type<'a>,
}

/// `math.clampf %x to [%lo, %hi] : T`.
#[mlir::op("math.clampf", format = "$operand `to` ` ` `[` $min `,` $max `]` (`fastmath` `` $fastmath^)? attr-dict `:` type($result)", results(result))]
pub struct ClampFOp<'a> {
    #[slot(result)]
    pub operand: Value<'a>,
    #[slot(result)]
    pub min: Value<'a>,
    #[slot(result)]
    pub max: Value<'a>,
    #[attr(dialect = "arith.fastmath", default = "<none>")]
    pub fastmath: Attribute<'a>,
    #[dtype]
    pub result: Type<'a>,
}

/// The `math` dialect.
#[mlir::dialect("math")]
pub enum Math<'a> {
    AbsF(AbsF<'a>), Acos(AcosOp<'a>), Acosh(AcoshOp<'a>), Asin(AsinOp<'a>), Asinh(AsinhOp<'a>), Atan(AtanOp<'a>),
    Atanh(AtanhOp<'a>), Cbrt(CbrtOp<'a>), Ceil(CeilOp<'a>), Cos(CosOp<'a>), Cosh(CoshOp<'a>), Erf(ErfOp<'a>),
    Erfc(ErfcOp<'a>), Exp(ExpOp<'a>), Exp2(Exp2Op<'a>), ExpM1(ExpM1Op<'a>), Floor(FloorOp<'a>), Log(LogOp<'a>),
    Log10(Log10Op<'a>), Log1p(Log1pOp<'a>), Log2(Log2Op<'a>), Round(RoundOp<'a>), RoundEven(RoundEvenOp<'a>),
    Rsqrt(RsqrtOp<'a>), Sin(SinOp<'a>), Sinh(SinhOp<'a>), Sqrt(SqrtOp<'a>), Tan(TanOp<'a>), Tanh(TanhOp<'a>),
    Trunc(TruncOp<'a>), Atan2(Atan2Op<'a>), CopySign(CopySignOp<'a>), PowF(PowFOp<'a>), AbsI(AbsIOp<'a>),
    Ctlz(CountLeadingZerosOp<'a>), Cttz(CountTrailingZerosOp<'a>), CtPop(CtPopOp<'a>), IsFinite(IsFiniteOp<'a>),
    IsInf(IsInfOp<'a>), IsNaN(IsNaNOp<'a>), IsNormal(IsNormalOp<'a>), IPowI(IPowIOp<'a>), FPowI(FPowIOp<'a>),
    Fma(FmaOp<'a>), Sincos(SincosOp<'a>), ClampF(ClampFOp<'a>),
}
