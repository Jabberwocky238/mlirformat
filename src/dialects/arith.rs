//! `arith` (subset; formats from `ArithOps.td`, checked against `mlir-opt` 22.1.8 output).

use core::fmt::{self, Write};

use serde::{Deserialize, Serialize};

use crate::{Attribute, Content, Op, Parser, Printer, R, Type, Value, mlir};

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

/// `arith.truncf` rounding modes (`i32` case values).
#[derive(Debug, Clone, Copy, PartialEq, Eq, Serialize, Deserialize)]
#[allow(non_camel_case_types)]
pub enum RoundingMode {
    to_nearest_even,
    downward,
    upward,
    toward_zero,
    to_nearest_away,
}

#[mlir::op("arith.extf", format = "$in (`fastmath` `` $fastmath^)? attr-dict `:` type($in) `to` type($out)", results(out))]
pub struct ExtF<'a> {
    #[slot(in_ty, name = "in")]
    pub input: Value<'a>,
    #[attr(dialect = "arith.fastmath")]
    pub fastmath: Option<Attribute<'a>>,
    #[dtype]
    pub in_ty: Type<'a>,
    #[dtype]
    pub out: Type<'a>,
}

#[mlir::op(
    "arith.truncf",
    format = "$in ($roundingmode^)? (`fastmath` `` $fastmath^)? attr-dict `:` type($in) `to` type($out)",
    results(out)
)]
pub struct TruncF<'a> {
    #[slot(in_ty, name = "in")]
    pub input: Value<'a>,
    #[attr(int = "i32")]
    pub roundingmode: Option<RoundingMode>,
    #[attr(dialect = "arith.fastmath")]
    pub fastmath: Option<Attribute<'a>>,
    #[dtype]
    pub in_ty: Type<'a>,
    #[dtype]
    pub out: Type<'a>,
}

/// `arith.select %c, %a, %b : T`, or `: C, T` when the condition is a vector / tensor of `i1`:
/// hand-written syntax (the condition's type is spelled only when it is not `i1`).
#[mlir::op("arith.select", custom, results(result))]
pub struct Select<'a> {
    #[slot(condition_ty)]
    pub condition: Value<'a>,
    #[slot(result)]
    pub true_value: Value<'a>,
    #[slot(result)]
    pub false_value: Value<'a>,
    #[dtype]
    pub condition_ty: Type<'a>,
    #[dtype]
    pub result: Type<'a>,
}

impl Op for Select<'_> {
    const NAME: &'static str = "arith.select";
    const FORMAT: &'static str = "";

    fn print(&self, p: &mut Printer<'_, '_>) -> fmt::Result {
        p.op_name(Self::NAME)?;
        write!(p, " {}, {}, {}", self.condition, self.true_value, self.false_value)?;
        p.attr_dict("", &self.attrs, &[])?;
        match self.condition_ty {
            Type::I1 => write!(p, " : {}", self.result)?,
            ref c => write!(p, " : {c}, {}", self.result)?,
        }
        p.loc(&self.loc)
    }

    fn parse(p: &mut Parser<'_, '_>) -> R<Self> {
        let condition = p.value()?;
        p.expect(",")?;
        let true_value = p.value()?;
        p.expect(",")?;
        let false_value = p.value()?;
        let attrs = p.opt_dict()?;
        p.expect(":")?;
        let first = p.ty()?;
        let (condition_ty, result) = if p.eat(",") { (first, p.ty()?) } else { (Type::I1, first) };
        let op = Select { condition, true_value, false_value, condition_ty, result, attrs, loc: p.opt_loc()? };
        Content::convert(&op).or_else(|e| p.err(e.0))
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

#[mlir::op("arith.trunci", format = "$in (`overflow` `` $overflowFlags^)? attr-dict `:` type($in) `to` type($out)", results(out))]
pub struct TruncI<'a> {
    #[slot(in_ty, name = "in")]
    pub input: Value<'a>,
    #[attr(dialect = "arith.overflow", default = "<none>")]
    pub overflow_flags: Attribute<'a>,
    #[dtype]
    pub in_ty: Type<'a>,
    #[dtype]
    pub out: Type<'a>,
}

/// `%low, %high = lhs, rhs : T`: the full product in two halves.
macro_rules! extended_mul {
    ($($ty:ident = $name:literal),* $(,)?) => {$(
        #[mlir::op($name, format = "$lhs `,` $rhs attr-dict `:` type($lhs)", results(low, high))]
        pub struct $ty<'a> {
            #[slot(low)]
            pub lhs: Value<'a>,
            #[slot(low)]
            pub rhs: Value<'a>,
            #[dtype]
            pub low: Type<'a>,
            #[dtype(eq = low)]
            pub high: Type<'a>,
        }
    )*};
}

extended_mul! { MulSIExtended = "arith.mulsi_extended", MulUIExtended = "arith.mului_extended" }

/// `%sum, %overflow = lhs, rhs : T, i1`.
#[mlir::op("arith.addui_extended", format = "$lhs `,` $rhs attr-dict `:` type($sum) `,` type($overflow)", results(sum, overflow))]
pub struct AddUIExtended<'a> {
    #[slot(sum)]
    pub lhs: Value<'a>,
    #[slot(sum)]
    pub rhs: Value<'a>,
    #[dtype]
    pub sum: Type<'a>,
    #[dtype]
    pub overflow: Type<'a>,
}

#[mlir::op(
    "arith.scaling_extf",
    format = "$in `,` $scale (`fastmath` `` $fastmath^)? attr-dict `:` type($in) `,` type($scale) `to` type($out)",
    results(out)
)]
pub struct ScalingExtF<'a> {
    #[slot(in_ty, name = "in")]
    pub input: Value<'a>,
    #[slot(scale_ty)]
    pub scale: Value<'a>,
    #[attr(dialect = "arith.fastmath")]
    pub fastmath: Option<Attribute<'a>>,
    #[dtype]
    pub in_ty: Type<'a>,
    #[dtype]
    pub scale_ty: Type<'a>,
    #[dtype]
    pub out: Type<'a>,
}

#[mlir::op(
    "arith.scaling_truncf",
    format = "$in `,` $scale ($roundingmode^)? (`fastmath` `` $fastmath^)? attr-dict `:` type($in) `,` type($scale) `to` type($out)",
    results(out)
)]
pub struct ScalingTruncF<'a> {
    #[slot(in_ty, name = "in")]
    pub input: Value<'a>,
    #[slot(scale_ty)]
    pub scale: Value<'a>,
    #[attr(int = "i32")]
    pub roundingmode: Option<RoundingMode>,
    #[attr(dialect = "arith.fastmath")]
    pub fastmath: Option<Attribute<'a>>,
    #[dtype]
    pub in_ty: Type<'a>,
    #[dtype]
    pub scale_ty: Type<'a>,
    #[dtype]
    pub out: Type<'a>,
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
    ExtF(ExtF<'a>), TruncF(TruncF<'a>), Select(Select<'a>), TruncI(TruncI<'a>),
    MulSIExtended(MulSIExtended<'a>), MulUIExtended(MulUIExtended<'a>), AddUIExtended(AddUIExtended<'a>),
    ScalingExtF(ScalingExtF<'a>), ScalingTruncF(ScalingTruncF<'a>),
}
