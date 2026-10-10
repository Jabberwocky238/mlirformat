//! `complex` (formats from `ComplexOps.td`, checked against `mlir-opt` 22.1.8 output).

use crate::{Attribute, Type, Value, mlir};

/// `complex [fastmath<…>] : complex<T>` ⇒ `complex<T>`.
macro_rules! unary {
    ($($ty:ident = $name:literal),* $(,)?) => {$(
        #[mlir::op($name, format = "$complex (`fastmath` `` $fastmath^)? attr-dict `:` type($complex)", results(ty))]
        pub struct $ty<'a> {
            #[slot(ty)]
            pub complex: Value<'a>,
            #[attr(dialect = "arith.fastmath", default = "<none>")]
            pub fastmath: Attribute<'a>,
            #[dtype]
            pub ty: Type<'a>,
        }
    )*};
}

/// `complex [fastmath<…>] : complex<T>` ⇒ `T`.
macro_rules! part {
    ($($ty:ident = $name:literal),* $(,)?) => {$(
        #[mlir::op($name, format = "$complex (`fastmath` `` $fastmath^)? attr-dict `:` type($complex)", results(result))]
        pub struct $ty<'a> {
            #[slot(ty)]
            pub complex: Value<'a>,
            #[attr(dialect = "arith.fastmath", default = "<none>")]
            pub fastmath: Attribute<'a>,
            #[dtype]
            pub ty: Type<'a>,
            #[dtype(el = ty)]
            pub result: Type<'a>,
        }
    )*};
}

/// `lhs, rhs [fastmath<…>] : complex<T>`.
macro_rules! binary {
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

/// `lhs, rhs : complex<T>` ⇒ `i1`.
macro_rules! compare {
    ($($ty:ident = $name:literal),* $(,)?) => {$(
        #[mlir::op($name, format = "$lhs `,` $rhs attr-dict `:` type($lhs)", results(result))]
        pub struct $ty<'a> {
            #[slot(ty)]
            pub lhs: Value<'a>,
            #[slot(ty)]
            pub rhs: Value<'a>,
            #[dtype]
            pub ty: Type<'a>,
            #[dtype(is = i1)]
            pub result: Type<'a>,
        }
    )*};
}

unary! {
    ConjOp = "complex.conj", CosOp = "complex.cos", ExpOp = "complex.exp", Expm1Op = "complex.expm1", LogOp = "complex.log",
    Log1pOp = "complex.log1p", NegOp = "complex.neg", RsqrtOp = "complex.rsqrt", SignOp = "complex.sign", SinOp = "complex.sin",
    SqrtOp = "complex.sqrt", TanOp = "complex.tan", TanhOp = "complex.tanh",
}

part! { ReOp = "complex.re", ImOp = "complex.im", AbsOp = "complex.abs", AngleOp = "complex.angle" }

binary! {
    AddOp = "complex.add", SubOp = "complex.sub", MulOp = "complex.mul", DivOp = "complex.div", PowOp = "complex.pow",
    Atan2Op = "complex.atan2",
}

compare! { EqualOp = "complex.eq", NotEqualOp = "complex.neq" }

/// `complex.constant [re, im] : complex<T>`.
#[mlir::op("complex.constant", format = "$value attr-dict `:` type($complex)", results(complex))]
pub struct ConstantOp<'a> {
    #[attr]
    pub value: Attribute<'a>,
    #[dtype]
    pub complex: Type<'a>,
}

/// `complex.create %re, %im : complex<T>`.
#[mlir::op("complex.create", format = "$real `,` $imaginary attr-dict `:` type($complex)", results(complex))]
pub struct CreateOp<'a> {
    #[slot(elem)]
    pub real: Value<'a>,
    #[slot(elem)]
    pub imaginary: Value<'a>,
    #[dtype(el = complex)]
    pub elem: Type<'a>,
    #[dtype]
    pub complex: Type<'a>,
}

#[mlir::op("complex.bitcast", format = "$operand attr-dict `:` type($operand) `to` type($result)", results(result))]
pub struct BitcastOp<'a> {
    #[slot(in_ty)]
    pub operand: Value<'a>,
    #[dtype]
    pub in_ty: Type<'a>,
    #[dtype]
    pub result: Type<'a>,
}

/// `complex.powi %z, %n : complex<T>, iN`.
#[mlir::op("complex.powi", format = "$lhs `,` $rhs (`fastmath` `` $fastmath^)? attr-dict `:` type($result) `,` type($rhs)", results(result))]
pub struct PowiOp<'a> {
    #[slot(result)]
    pub lhs: Value<'a>,
    #[slot(rhs_ty)]
    pub rhs: Value<'a>,
    #[attr(dialect = "arith.fastmath")]
    pub fastmath: Option<Attribute<'a>>,
    #[dtype]
    pub result: Type<'a>,
    #[dtype]
    pub rhs_ty: Type<'a>,
}

/// The `complex` dialect.
#[mlir::dialect("complex")]
pub enum Complex<'a> {
    Conj(ConjOp<'a>), Cos(CosOp<'a>), Exp(ExpOp<'a>), Expm1(Expm1Op<'a>), Log(LogOp<'a>), Log1p(Log1pOp<'a>),
    Neg(NegOp<'a>), Rsqrt(RsqrtOp<'a>), Sign(SignOp<'a>), Sin(SinOp<'a>), Sqrt(SqrtOp<'a>), Tan(TanOp<'a>),
    Tanh(TanhOp<'a>), Re(ReOp<'a>), Im(ImOp<'a>), Abs(AbsOp<'a>), Angle(AngleOp<'a>), Add(AddOp<'a>), Sub(SubOp<'a>),
    Mul(MulOp<'a>), Div(DivOp<'a>), Pow(PowOp<'a>), Atan2(Atan2Op<'a>), Equal(EqualOp<'a>), NotEqual(NotEqualOp<'a>),
    Constant(ConstantOp<'a>), Create(CreateOp<'a>), Bitcast(BitcastOp<'a>), Powi(PowiOp<'a>),
}
