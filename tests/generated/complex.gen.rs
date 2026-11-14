#![allow(non_camel_case_types, unused_imports, clippy::all, rustdoc::all)]

use mlirformat::{mlir, Attribute, Region, Str, Type, Value, __Vec as Vec};

#[mlir::op("complex.abs", format = "$complex (`fastmath` `` $fastmath^)? attr-dict `:` type($complex)", results(result))]
pub struct AbsOp<'a> {
    #[slot(complex_ty)]
    pub complex: Value<'a>,
    #[attr(dialect = "arith.fastmath", default = "<none>")]
    pub fastmath: Option<Attribute<'a>>,
    pub complex_ty: Type<'a>,
    #[dtype(el = complex_ty)]
    pub result: Type<'a>,
}

#[mlir::op("complex.add", format = "$lhs `,` $rhs (`fastmath` `` $fastmath^)? attr-dict `:` type($result)", results(result))]
pub struct AddOp<'a> {
    #[slot(result)]
    pub lhs: Value<'a>,
    #[slot(result)]
    pub rhs: Value<'a>,
    #[attr(dialect = "arith.fastmath", default = "<none>")]
    pub fastmath: Option<Attribute<'a>>,
    pub result: Type<'a>,
}

#[mlir::op("complex.angle", format = "$complex (`fastmath` `` $fastmath^)? attr-dict `:` type($complex)", results(result))]
pub struct AngleOp<'a> {
    #[slot(complex_ty)]
    pub complex: Value<'a>,
    #[attr(dialect = "arith.fastmath", default = "<none>")]
    pub fastmath: Option<Attribute<'a>>,
    pub complex_ty: Type<'a>,
    #[dtype(el = complex_ty)]
    pub result: Type<'a>,
}

#[mlir::op("complex.atan2", format = "$lhs `,` $rhs (`fastmath` `` $fastmath^)? attr-dict `:` type($result)", results(result))]
pub struct Atan2Op<'a> {
    #[slot(result)]
    pub lhs: Value<'a>,
    #[slot(result)]
    pub rhs: Value<'a>,
    #[attr(dialect = "arith.fastmath", default = "<none>")]
    pub fastmath: Option<Attribute<'a>>,
    pub result: Type<'a>,
}

#[mlir::op("complex.bitcast", format = "$operand attr-dict `:` type($operand) `to` type($result)", results(result))]
pub struct BitcastOp<'a> {
    #[slot(operand_ty)]
    pub operand: Value<'a>,
    pub operand_ty: Type<'a>,
    pub result: Type<'a>,
}

#[mlir::op("complex.conj", format = "$complex (`fastmath` `` $fastmath^)? attr-dict `:` type($complex)", results(result))]
pub struct ConjOp<'a> {
    #[slot(result)]
    pub complex: Value<'a>,
    #[attr(dialect = "arith.fastmath", default = "<none>")]
    pub fastmath: Option<Attribute<'a>>,
    pub result: Type<'a>,
}

#[mlir::op("complex.constant", format = "$value attr-dict `:` type($complex)", results(complex))]
pub struct ConstantOp<'a> {
    pub value: Attribute<'a>,
    pub complex: Type<'a>,
}

#[mlir::op("complex.cos", format = "$complex (`fastmath` `` $fastmath^)? attr-dict `:` type($complex)", results(result))]
pub struct CosOp<'a> {
    #[slot(result)]
    pub complex: Value<'a>,
    #[attr(dialect = "arith.fastmath", default = "<none>")]
    pub fastmath: Option<Attribute<'a>>,
    pub result: Type<'a>,
}

#[mlir::op("complex.create", format = "$real `,` $imaginary attr-dict `:` type($complex)", results(complex))]
pub struct CreateOp<'a> {
    #[slot(real_ty)]
    pub real: Value<'a>,
    #[slot(real_ty)]
    pub imaginary: Value<'a>,
    #[dtype(el = complex)]
    pub real_ty: Type<'a>,
    pub complex: Type<'a>,
}

#[mlir::op("complex.div", format = "$lhs `,` $rhs (`fastmath` `` $fastmath^)? attr-dict `:` type($result)", results(result))]
pub struct DivOp<'a> {
    #[slot(result)]
    pub lhs: Value<'a>,
    #[slot(result)]
    pub rhs: Value<'a>,
    #[attr(dialect = "arith.fastmath", default = "<none>")]
    pub fastmath: Option<Attribute<'a>>,
    pub result: Type<'a>,
}

#[mlir::op("complex.eq", format = "$lhs `,` $rhs attr-dict `:` type($lhs)", results(result))]
pub struct EqualOp<'a> {
    #[slot(lhs_ty)]
    pub lhs: Value<'a>,
    #[slot(lhs_ty)]
    pub rhs: Value<'a>,
    pub lhs_ty: Type<'a>,
    #[dtype(is = i1)]
    pub result: Type<'a>,
}

#[mlir::op("complex.exp", format = "$complex (`fastmath` `` $fastmath^)? attr-dict `:` type($complex)", results(result))]
pub struct ExpOp<'a> {
    #[slot(result)]
    pub complex: Value<'a>,
    #[attr(dialect = "arith.fastmath", default = "<none>")]
    pub fastmath: Option<Attribute<'a>>,
    pub result: Type<'a>,
}

#[mlir::op("complex.expm1", format = "$complex (`fastmath` `` $fastmath^)? attr-dict `:` type($complex)", results(result))]
pub struct Expm1Op<'a> {
    #[slot(result)]
    pub complex: Value<'a>,
    #[attr(dialect = "arith.fastmath", default = "<none>")]
    pub fastmath: Option<Attribute<'a>>,
    pub result: Type<'a>,
}

#[mlir::op("complex.im", format = "$complex (`fastmath` `` $fastmath^)? attr-dict `:` type($complex)", results(imaginary))]
pub struct ImOp<'a> {
    #[slot(complex_ty)]
    pub complex: Value<'a>,
    #[attr(dialect = "arith.fastmath", default = "<none>")]
    pub fastmath: Option<Attribute<'a>>,
    pub complex_ty: Type<'a>,
    #[dtype(el = complex_ty)]
    pub imaginary: Type<'a>,
}

#[mlir::op("complex.log1p", format = "$complex (`fastmath` `` $fastmath^)? attr-dict `:` type($complex)", results(result))]
pub struct Log1pOp<'a> {
    #[slot(result)]
    pub complex: Value<'a>,
    #[attr(dialect = "arith.fastmath", default = "<none>")]
    pub fastmath: Option<Attribute<'a>>,
    pub result: Type<'a>,
}

#[mlir::op("complex.log", format = "$complex (`fastmath` `` $fastmath^)? attr-dict `:` type($complex)", results(result))]
pub struct LogOp<'a> {
    #[slot(result)]
    pub complex: Value<'a>,
    #[attr(dialect = "arith.fastmath", default = "<none>")]
    pub fastmath: Option<Attribute<'a>>,
    pub result: Type<'a>,
}

#[mlir::op("complex.mul", format = "$lhs `,` $rhs (`fastmath` `` $fastmath^)? attr-dict `:` type($result)", results(result))]
pub struct MulOp<'a> {
    #[slot(result)]
    pub lhs: Value<'a>,
    #[slot(result)]
    pub rhs: Value<'a>,
    #[attr(dialect = "arith.fastmath", default = "<none>")]
    pub fastmath: Option<Attribute<'a>>,
    pub result: Type<'a>,
}

#[mlir::op("complex.neg", format = "$complex (`fastmath` `` $fastmath^)? attr-dict `:` type($complex)", results(result))]
pub struct NegOp<'a> {
    #[slot(result)]
    pub complex: Value<'a>,
    #[attr(dialect = "arith.fastmath", default = "<none>")]
    pub fastmath: Option<Attribute<'a>>,
    pub result: Type<'a>,
}

#[mlir::op("complex.neq", format = "$lhs `,` $rhs attr-dict `:` type($lhs)", results(result))]
pub struct NotEqualOp<'a> {
    #[slot(lhs_ty)]
    pub lhs: Value<'a>,
    #[slot(lhs_ty)]
    pub rhs: Value<'a>,
    pub lhs_ty: Type<'a>,
    #[dtype(is = i1)]
    pub result: Type<'a>,
}

#[mlir::op("complex.pow", format = "$lhs `,` $rhs (`fastmath` `` $fastmath^)? attr-dict `:` type($result)", results(result))]
pub struct PowOp<'a> {
    #[slot(result)]
    pub lhs: Value<'a>,
    #[slot(result)]
    pub rhs: Value<'a>,
    #[attr(dialect = "arith.fastmath", default = "<none>")]
    pub fastmath: Option<Attribute<'a>>,
    pub result: Type<'a>,
}

#[mlir::op("complex.powi", format = "$lhs `,` $rhs (`fastmath` `` $fastmath^)? attr-dict `:` type($result) `,` type($rhs)", results(result))]
pub struct PowiOp<'a> {
    #[slot(result)]
    pub lhs: Value<'a>,
    #[slot(rhs_ty)]
    pub rhs: Value<'a>,
    #[attr(dialect = "arith.fastmath")]
    pub fastmath: Option<Attribute<'a>>,
    pub rhs_ty: Type<'a>,
    pub result: Type<'a>,
}

#[mlir::op("complex.re", format = "$complex (`fastmath` `` $fastmath^)? attr-dict `:` type($complex)", results(real))]
pub struct ReOp<'a> {
    #[slot(complex_ty)]
    pub complex: Value<'a>,
    #[attr(dialect = "arith.fastmath", default = "<none>")]
    pub fastmath: Option<Attribute<'a>>,
    pub complex_ty: Type<'a>,
    #[dtype(el = complex_ty)]
    pub real: Type<'a>,
}

#[mlir::op("complex.rsqrt", format = "$complex (`fastmath` `` $fastmath^)? attr-dict `:` type($complex)", results(result))]
pub struct RsqrtOp<'a> {
    #[slot(result)]
    pub complex: Value<'a>,
    #[attr(dialect = "arith.fastmath", default = "<none>")]
    pub fastmath: Option<Attribute<'a>>,
    pub result: Type<'a>,
}

#[mlir::op("complex.sign", format = "$complex (`fastmath` `` $fastmath^)? attr-dict `:` type($complex)", results(result))]
pub struct SignOp<'a> {
    #[slot(result)]
    pub complex: Value<'a>,
    #[attr(dialect = "arith.fastmath", default = "<none>")]
    pub fastmath: Option<Attribute<'a>>,
    pub result: Type<'a>,
}

#[mlir::op("complex.sin", format = "$complex (`fastmath` `` $fastmath^)? attr-dict `:` type($complex)", results(result))]
pub struct SinOp<'a> {
    #[slot(result)]
    pub complex: Value<'a>,
    #[attr(dialect = "arith.fastmath", default = "<none>")]
    pub fastmath: Option<Attribute<'a>>,
    pub result: Type<'a>,
}

#[mlir::op("complex.sqrt", format = "$complex (`fastmath` `` $fastmath^)? attr-dict `:` type($complex)", results(result))]
pub struct SqrtOp<'a> {
    #[slot(result)]
    pub complex: Value<'a>,
    #[attr(dialect = "arith.fastmath", default = "<none>")]
    pub fastmath: Option<Attribute<'a>>,
    pub result: Type<'a>,
}

#[mlir::op("complex.sub", format = "$lhs `,` $rhs (`fastmath` `` $fastmath^)? attr-dict `:` type($result)", results(result))]
pub struct SubOp<'a> {
    #[slot(result)]
    pub lhs: Value<'a>,
    #[slot(result)]
    pub rhs: Value<'a>,
    #[attr(dialect = "arith.fastmath", default = "<none>")]
    pub fastmath: Option<Attribute<'a>>,
    pub result: Type<'a>,
}

#[mlir::op("complex.tan", format = "$complex (`fastmath` `` $fastmath^)? attr-dict `:` type($complex)", results(result))]
pub struct TanOp<'a> {
    #[slot(result)]
    pub complex: Value<'a>,
    #[attr(dialect = "arith.fastmath", default = "<none>")]
    pub fastmath: Option<Attribute<'a>>,
    pub result: Type<'a>,
}

#[mlir::op("complex.tanh", format = "$complex (`fastmath` `` $fastmath^)? attr-dict `:` type($complex)", results(result))]
pub struct TanhOp<'a> {
    #[slot(result)]
    pub complex: Value<'a>,
    #[attr(dialect = "arith.fastmath", default = "<none>")]
    pub fastmath: Option<Attribute<'a>>,
    pub result: Type<'a>,
}

#[mlir::dialect(
    "complex",
    ops = [AbsOp, AddOp, AngleOp, Atan2Op, BitcastOp, ConjOp, ConstantOp, CosOp, CreateOp, DivOp, EqualOp, ExpOp, Expm1Op, ImOp, Log1pOp, LogOp, MulOp, NegOp, NotEqualOp, PowOp, PowiOp, ReOp, RsqrtOp, SignOp, SinOp, SqrtOp, SubOp, TanOp, TanhOp],
    dependents = ["arith"],
    materializer
)]
pub struct ComplexDialect;
