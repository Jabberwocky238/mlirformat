//! `index` (formats from `IndexOps.td`, checked against `mlir-opt` 22.1.8 output). Everything is
//! `index` unless spelled otherwise.

use core::fmt::{self, Write};

use alloc::borrow::Cow;
use alloc::format;

use crate::{Attribute, Content, Extended, Op, Parser, Printer, R, Type, Value, mlir};

/// `lhs, rhs` on `index`.
macro_rules! binops {
    ($($ty:ident = $name:literal),* $(,)?) => {$(
        #[mlir::op($name, format = "$lhs `,` $rhs attr-dict", results(ty))]
        pub struct $ty<'a> {
            #[slot(ty)]
            pub lhs: Value<'a>,
            #[slot(ty)]
            pub rhs: Value<'a>,
            #[dtype(is = index)]
            pub ty: Type<'a>,
        }
    )*};
}

/// `input : A to B`.
macro_rules! casts {
    ($($ty:ident = $name:literal),* $(,)?) => {$(
        #[mlir::op($name, format = "$input attr-dict `:` type($input) `to` type($output)", results(output))]
        pub struct $ty<'a> {
            #[slot(in_ty)]
            pub input: Value<'a>,
            #[dtype]
            pub in_ty: Type<'a>,
            #[dtype]
            pub output: Type<'a>,
        }
    )*};
}

binops! {
    AddOp = "index.add", SubOp = "index.sub", MulOp = "index.mul", DivSOp = "index.divs", DivUOp = "index.divu",
    CeilDivSOp = "index.ceildivs", CeilDivUOp = "index.ceildivu", FloorDivSOp = "index.floordivs", RemSOp = "index.rems",
    RemUOp = "index.remu", MaxSOp = "index.maxs", MaxUOp = "index.maxu", MinSOp = "index.mins", MinUOp = "index.minu",
    ShlOp = "index.shl", ShrSOp = "index.shrs", ShrUOp = "index.shru", AndOp = "index.and", OrOp = "index.or",
    XOrOp = "index.xor",
}

casts! { CastSOp = "index.casts", CastUOp = "index.castu" }

/// `index.constant 42`.
#[mlir::op("index.constant", format = "attr-dict $value", results(result))]
pub struct ConstantOp<'a> {
    #[attr(int = "index")]
    pub value: i64,
    #[dtype(is = index)]
    pub result: Type<'a>,
}

/// `index.bool.constant true`.
#[mlir::op("index.bool.constant", format = "attr-dict $value", results(result))]
pub struct BoolConstantOp<'a> {
    #[attr]
    pub value: Attribute<'a>,
    #[dtype(is = i1)]
    pub result: Type<'a>,
}

#[mlir::op("index.sizeof", format = "attr-dict", results(result))]
pub struct SizeOfOp<'a> {
    #[dtype(is = index)]
    pub result: Type<'a>,
}

/// `index.cmp slt(%a, %b)`: the predicate is `#index<cmp_predicate slt>`, hand-written syntax.
#[mlir::op("index.cmp", custom, results(result))]
pub struct CmpOp<'a> {
    #[attr]
    pub pred: Attribute<'a>,
    #[slot(ty)]
    pub lhs: Value<'a>,
    #[slot(ty)]
    pub rhs: Value<'a>,
    #[dtype]
    pub ty: Type<'a>,
    #[dtype]
    pub result: Type<'a>,
}

impl CmpOp<'_> {
    /// `slt` of `#index<cmp_predicate slt>`.
    fn predicate(&self) -> Option<&str> {
        let Attribute::Extended { ext: Extended { name, body: Some(body), .. }, ty: None } = &self.pred else { return None };
        (name == "index").then_some(())?;
        body.strip_prefix("<cmp_predicate ")?.strip_suffix('>')
    }
}

impl Op for CmpOp<'_> {
    const NAME: &'static str = "index.cmp";
    const FORMAT: &'static str = "";

    fn print(&self, p: &mut Printer<'_, '_>) -> fmt::Result {
        if self.ty != Type::Index || self.result != Type::I1 {
            return Err(fmt::Error);
        }
        p.op_name(Self::NAME)?;
        write!(p, " {}({}, {})", self.predicate().ok_or(fmt::Error)?, self.lhs, self.rhs)?;
        p.attr_dict("", &self.attrs, &[])?;
        p.loc(&self.loc)
    }

    fn parse(p: &mut Parser<'_, '_>) -> R<Self> {
        let predicate = p.ident()?;
        p.expect("(")?;
        let lhs = p.value()?;
        p.expect(",")?;
        let rhs = p.value()?;
        p.expect(")")?;
        let pred = Attribute::Extended { ext: Extended { name: Cow::Borrowed("index"), body: Some(Cow::Owned(format!("<cmp_predicate {predicate}>"))), params: alloc::vec::Vec::new() }, ty: None };
        let op = CmpOp { pred, lhs, rhs, ty: Type::Index, result: Type::I1, attrs: p.opt_dict()?, loc: p.opt_loc()? };
        Content::convert(&op).or_else(|e| p.err(e.0))
    }
}

/// The `index` dialect.
#[mlir::dialect("index")]
pub enum Index<'a> {
    Add(AddOp<'a>), Sub(SubOp<'a>), Mul(MulOp<'a>), DivS(DivSOp<'a>), DivU(DivUOp<'a>), CeilDivS(CeilDivSOp<'a>),
    CeilDivU(CeilDivUOp<'a>), FloorDivS(FloorDivSOp<'a>), RemS(RemSOp<'a>), RemU(RemUOp<'a>), MaxS(MaxSOp<'a>),
    MaxU(MaxUOp<'a>), MinS(MinSOp<'a>), MinU(MinUOp<'a>), Shl(ShlOp<'a>), ShrS(ShrSOp<'a>), ShrU(ShrUOp<'a>),
    And(AndOp<'a>), Or(OrOp<'a>), XOr(XOrOp<'a>), CastS(CastSOp<'a>), CastU(CastUOp<'a>), Constant(ConstantOp<'a>),
    BoolConstant(BoolConstantOp<'a>), SizeOf(SizeOfOp<'a>), Cmp(CmpOp<'a>),
}
