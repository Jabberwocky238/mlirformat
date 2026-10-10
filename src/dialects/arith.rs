//! `arith` (subset; formats from `ArithOps.td`, checked against `mlir-opt` 22.1.8 output).

use serde::{Deserialize, Serialize};

use crate::{Attribute, Type, Value, mlir};

/// `lhs, rhs : T` binary ops without properties.
macro_rules! binops {
    ($($ty:ident = $name:literal),* $(,)?) => {$(
        #[mlir::op($name, format = "$lhs `,` $rhs attr-dict `:` type($result)", results(result))]
        pub struct $ty<'a> {
            #[slot(result)]
            pub lhs: Value<'a>,
            #[slot(result)]
            pub rhs: Value<'a>,
            #[dtype]
            pub result: Type<'a>,
        }
    )*};
}

/// `lhs, rhs <kw><flags> : T` binary ops with a defaulted dialect-attribute property.
macro_rules! flagged {
    ($format:literal, $field:ident, $attr:literal: $($ty:ident = $name:literal),* $(,)?) => {$(
        #[mlir::op($name, format = $format, results(result))]
        pub struct $ty<'a> {
            #[slot(result)]
            pub lhs: Value<'a>,
            #[slot(result)]
            pub rhs: Value<'a>,
            #[attr(dialect = $attr, default = "<none>")]
            pub $field: Attribute<'a>,
            #[dtype]
            pub result: Type<'a>,
        }
    )*};
}

/// `lhs, rhs exact : T` binary ops with a unit `isExact` property.
macro_rules! exact {
    ($($ty:ident = $name:literal),* $(,)?) => {$(
        #[mlir::op($name, format = "$lhs `,` $rhs (`exact` $isExact^)? attr-dict `:` type($result)", results(result))]
        pub struct $ty<'a> {
            #[slot(result)]
            pub lhs: Value<'a>,
            #[slot(result)]
            pub rhs: Value<'a>,
            #[attr]
            pub is_exact: bool,
            #[dtype]
            pub result: Type<'a>,
        }
    )*};
}

/// `in : A to B` casts.
macro_rules! casts {
    ($($ty:ident = $name:literal),* $(,)?) => {$(
        #[mlir::op($name, format = "$in attr-dict `:` type($in) `to` type($out)", results(out))]
        pub struct $ty<'a> {
            #[slot(in_ty, name = "in")]
            pub input: Value<'a>,
            #[dtype]
            pub in_ty: Type<'a>,
            #[dtype]
            pub out: Type<'a>,
        }
    )*};
}

/// Enum properties: an MLIR integer case value (declaration order) or the case keyword.
macro_rules! predicates {
    ($($(#[$m:meta])* $ty:ident { $($case:ident $(= $kw:literal)?),* $(,)? })*) => {$(
        $(#[$m])*
        #[derive(Debug, Clone, Copy, PartialEq, Eq, Serialize, Deserialize)]
        #[allow(non_camel_case_types)]
        pub enum $ty { $($(#[serde(rename = $kw)])? $case),* }
    )*};
}

binops! {
    AndI = "arith.andi", OrI = "arith.ori", XOrI = "arith.xori",
    MaxSI = "arith.maxsi", MaxUI = "arith.maxui", MinSI = "arith.minsi", MinUI = "arith.minui",
    RemSI = "arith.remsi", RemUI = "arith.remui",
    CeilDivSI = "arith.ceildivsi", CeilDivUI = "arith.ceildivui", FloorDivSI = "arith.floordivsi",
}

exact! {
    DivSI = "arith.divsi", DivUI = "arith.divui", ShRSI = "arith.shrsi", ShRUI = "arith.shrui",
}

flagged! { "$lhs `,` $rhs (`overflow` `` $overflowFlags^)? attr-dict `:` type($result)", overflow_flags, "arith.overflow":
    AddI = "arith.addi", SubI = "arith.subi", MulI = "arith.muli", ShLI = "arith.shli",
}

flagged! { "$lhs `,` $rhs (`fastmath` `` $fastmath^)? attr-dict `:` type($result)", fastmath, "arith.fastmath":
    AddF = "arith.addf", SubF = "arith.subf", MulF = "arith.mulf", DivF = "arith.divf", RemF = "arith.remf",
    MaximumF = "arith.maximumf", MinimumF = "arith.minimumf", MaxNumF = "arith.maxnumf", MinNumF = "arith.minnumf",
}

casts! {
    IndexCast = "arith.index_cast", IndexCastUI = "arith.index_castui", ExtSI = "arith.extsi", ExtUI = "arith.extui",
    SIToFP = "arith.sitofp", UIToFP = "arith.uitofp", FPToSI = "arith.fptosi", FPToUI = "arith.fptoui", Bitcast = "arith.bitcast",
}

predicates! {
    /// `arith.cmpi` predicates.
    CmpIPredicate { eq, ne, slt, sle, sgt, sge, ult, ule, ugt, uge }
    /// `arith.cmpf` predicates.
    CmpFPredicate {
        AlwaysFalse = "false", oeq, ogt, oge, olt, ole, one, ord, ueq, ugt, uge, ult, ule, une, uno, AlwaysTrue = "true",
    }
}

#[mlir::op("arith.negf", format = "$operand (`fastmath` `` $fastmath^)? attr-dict `:` type($result)", results(result))]
pub struct NegF<'a> {
    #[slot(result)]
    pub operand: Value<'a>,
    #[attr(dialect = "arith.fastmath", default = "<none>")]
    pub fastmath: Attribute<'a>,
    #[dtype]
    pub result: Type<'a>,
}

#[mlir::op("arith.cmpi", format = "$predicate `,` $lhs `,` $rhs attr-dict `:` type($lhs)", results(result))]
pub struct CmpI<'a> {
    #[attr]
    pub predicate: CmpIPredicate,
    #[slot(ty)]
    pub lhs: Value<'a>,
    #[slot(ty)]
    pub rhs: Value<'a>,
    #[dtype]
    pub ty: Type<'a>,
    #[dtype(i1 = ty)]
    pub result: Type<'a>,
}

#[mlir::op("arith.cmpf", format = "$predicate `,` $lhs `,` $rhs (`fastmath` `` $fastmath^)? attr-dict `:` type($lhs)", results(result))]
pub struct CmpF<'a> {
    #[attr]
    pub predicate: CmpFPredicate,
    #[slot(ty)]
    pub lhs: Value<'a>,
    #[slot(ty)]
    pub rhs: Value<'a>,
    #[attr(dialect = "arith.fastmath", default = "<none>")]
    pub fastmath: Attribute<'a>,
    #[dtype]
    pub ty: Type<'a>,
    #[dtype(i1 = ty)]
    pub result: Type<'a>,
}

#[mlir::op("arith.constant", format = "attr-dict $value", results(result))]
pub struct Constant<'a> {
    #[attr]
    pub value: Attribute<'a>,
    #[dtype(of = value)]
    pub result: Type<'a>,
}

/// The `arith` dialect.
#[mlir::dialect("arith")]
pub enum Arith<'a> {
    AndI(AndI<'a>), OrI(OrI<'a>), XOrI(XOrI<'a>),
    MaxSI(MaxSI<'a>), MaxUI(MaxUI<'a>), MinSI(MinSI<'a>), MinUI(MinUI<'a>),
    DivSI(DivSI<'a>), DivUI(DivUI<'a>), RemSI(RemSI<'a>), RemUI(RemUI<'a>),
    CeilDivSI(CeilDivSI<'a>), CeilDivUI(CeilDivUI<'a>), FloorDivSI(FloorDivSI<'a>), ShRSI(ShRSI<'a>), ShRUI(ShRUI<'a>),
    AddI(AddI<'a>), SubI(SubI<'a>), MulI(MulI<'a>), ShLI(ShLI<'a>),
    AddF(AddF<'a>), SubF(SubF<'a>), MulF(MulF<'a>), DivF(DivF<'a>), RemF(RemF<'a>),
    MaximumF(MaximumF<'a>), MinimumF(MinimumF<'a>), MaxNumF(MaxNumF<'a>), MinNumF(MinNumF<'a>),
    IndexCast(IndexCast<'a>), IndexCastUI(IndexCastUI<'a>), ExtSI(ExtSI<'a>), ExtUI(ExtUI<'a>),
    SIToFP(SIToFP<'a>), UIToFP(UIToFP<'a>), FPToSI(FPToSI<'a>), FPToUI(FPToUI<'a>), Bitcast(Bitcast<'a>),
    NegF(NegF<'a>), CmpI(CmpI<'a>), CmpF(CmpF<'a>), Constant(Constant<'a>),
}
