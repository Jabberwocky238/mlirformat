//! A dialect defined outside `mlirformat`: structs with `#[mlir::op]`, an enum with
//! `#[mlir::dialect]` struct, then `MlirOpt::load(SampleDialect)`. It covers every role: operands
//! (single, variadic, several variadic groups), type variables (spelled, inferred), properties
//! (number, enum, unit, optional, dense array, attr-dict), regions, successors, a hand-written
//! op and a type-parameter hook.

use core::fmt::{self, Write};

use mlirformat::{Attribute, Content, Op, Parse, Parser, Print, Printer, R, Region, Str, SymKind, Type, Value, mlir};
use serde::{Deserialize, Serialize};

/// `sample.add %a, %b : T`
#[mlir::op("sample.add", format = "$lhs `,` $rhs attr-dict `:` type($result)", results(result))]
pub struct Add<'a> {
    #[slot(result)]
    pub lhs: Value<'a>,
    #[slot(result)]
    pub rhs: Value<'a>,
    pub result: Type<'a>,
}

/// `sample.scale %x {factor = 3 : i64} : T`: a property the format does not spell goes
/// through `attr-dict`.
#[mlir::op("sample.scale", format = "$input attr-dict `:` type($result)", results(result))]
pub struct Scale<'a> {
    #[slot(result)]
    pub input: Value<'a>,
    pub factor: i64,
    pub result: Type<'a>,
}

/// Rounding modes: case value 0 / 1 in generic form, the keyword in custom form.
#[derive(Debug, Clone, Copy, PartialEq, Eq, Serialize, Deserialize)]
#[serde(rename_all = "lowercase")]
pub enum Mode {
    Nearest,
    Zero,
}

/// `sample.round zero %x : f32 -> i32`
#[mlir::op("sample.round", format = "$mode $input attr-dict `:` type($input) `->` type($result)", results(result))]
pub struct Round<'a> {
    pub mode: Mode,
    #[slot(in_ty)]
    pub input: Value<'a>,
    pub in_ty: Type<'a>,
    pub result: Type<'a>,
}

/// `sample.tag %x unit_flag? note "..." : T`: optional groups anchored on a unit property and
/// an optional string.
#[mlir::op("sample.tag", format = "$input (`checked` $checked^)? (`note` $note^)? attr-dict `:` type($input)")]
pub struct Tag<'a> {
    #[slot(ty)]
    pub input: Value<'a>,
    pub checked: bool,
    pub note: Option<Attribute<'a>>,
    pub ty: Type<'a>,
}

/// `sample.loop %lo to %hi { ... } : index`: a region.
#[mlir::op("sample.loop", format = "$lower `to` $upper $body attr-dict `:` type($lower)")]
pub struct Loop<'a> {
    #[slot(ty)]
    pub lower: Value<'a>,
    #[slot(ty)]
    pub upper: Value<'a>,
    pub body: Region<'a>,
    pub ty: Type<'a>,
}

/// `sample.jump ^bb1(%x : i32)`: a successor with its operands.
#[mlir::op("sample.jump", format = "$dest (`(` $args^ `:` type($args) `)`)? attr-dict")]
pub struct Jump<'a> {
    #[successor]
    pub dest: Str<'a>,
    #[slot(arg_types)]
    pub args: Vec<Value<'a>>,
    pub arg_types: Vec<Type<'a>>,
}

/// `sample.pack lhs(%a) rhs(%b, %c) : (i32) (f32, f32)`: two variadic groups
/// (`operandSegmentSizes` in generic form).
#[mlir::op("sample.pack", format = "`lhs` `(` $lhs `)` `rhs` `(` $rhs `)` attr-dict `:` `(` type($lhs) `)` `(` type($rhs) `)`")]
pub struct Pack<'a> {
    #[slot(lhs_types)]
    pub lhs: Vec<Value<'a>>,
    #[slot(rhs_types)]
    pub rhs: Vec<Value<'a>>,
    pub lhs_types: Vec<Type<'a>>,
    pub rhs_types: Vec<Type<'a>>,
}

/// `sample.weights %x [1, 2, 3] : i32`: a `Vec<i64>` property is a dense array.
#[mlir::op("sample.weights", format = "$input $weights attr-dict `:` type($input)")]
pub struct Weights<'a> {
    #[slot(ty)]
    pub input: Value<'a>,
    pub weights: Vec<i64>,
    pub ty: Type<'a>,
}

/// `sample.comment "text"`: hand-written syntax (`custom`), no lifetime.
#[mlir::op("sample.comment", custom)]
pub struct Comment {
    pub text: String,
}

impl Print for Comment {
    fn print(&self, p: &mut Printer<'_, '_>) -> fmt::Result {
        p.op_name(<Self as Op>::NAME)?;
        write!(p, " {}", Attribute::str(&self.text))?;
        p.attr_dict("", &self.attrs, &[])?;
        p.loc(&self.loc)
    }
}

impl Parse for Comment {
    fn parse(p: &mut Parser<'_, '_>) -> R<Self> {
        let lit = Attribute::Str { lit: p.string()?.into(), ty: None };
        let text = lit.text().or_else(|e| p.err(e.0))?;
        let attrs = Content::convert(&p.opt_dict()?).or_else(|e| p.err(e.0))?;
        let loc = Content::convert(&p.opt_loc()?).or_else(|e| p.err(e.0))?;
        Ok(Comment { text, attrs, loc })
    }
}

/// Structures `!sample.vec<4 x f32>` into `[4 : index, f32]`.
fn params<'a>(kind: SymKind, name: &str, p: &mut Parser<'a, '_>) -> Option<R<Vec<Attribute<'a>>>> {
    (kind == SymKind::Type && name == "sample.vec").then(|| {
        p.expect("<")?;
        let n: i128 = p.number()?;
        p.expect_lit("x")?;
        let elem = p.ty()?;
        p.expect(">")?;
        Ok(vec![Attribute::of_int(n, Type::Index), Attribute::Type(elem)])
    })
}

/// The `sample` dialect.
#[mlir::dialect("sample", ops = [Add, Scale, Round, Tag, Loop, Jump, Pack, Weights, Comment], params = params)]
pub struct SampleDialect;

#[cfg(test)]
mod tests {
    use mlirformat::{Extended, Item, MlirOpt, Operation};

    use super::*;

    const CUSTOM: &str = r#"%0 = sample.add %a, %b : i32
%1 = sample.scale %0 {factor = 3 : i64} : i32
%2 = sample.round zero %x : f32 -> i32
sample.tag %2 checked note "hi" : i32
sample.tag %2 : i32
sample.loop %lo to %hi {
  %3 = sample.add %lo, %hi : index
} : index
sample.jump ^bb1(%2, %0 : i32, i32)
sample.jump ^bb2
sample.pack lhs() rhs(%a, %v) : () (i32, !sample.vec<4 x f32>)
sample.weights %a [1, 2, 3] : i32
sample.comment "say \22hi\22"
"#;

    const GENERIC: &str = r#"%0 = "sample.add"(%a, %b) : (i32, i32) -> i32
%1 = "sample.scale"(%0) <{factor = 3 : i64}> : (i32) -> i32
%2 = "sample.round"(%x) <{mode = 1 : i64}> : (f32) -> i32
"sample.tag"(%2) <{checked, note = "hi"}> : (i32) -> ()
"sample.tag"(%2) : (i32) -> ()
"sample.loop"(%lo, %hi) ({
  %3 = "sample.add"(%lo, %hi) : (index, index) -> index
}) : (index, index) -> ()
"sample.jump"(%2, %0)[^bb1] : (i32, i32) -> ()
"sample.jump"()[^bb2] : () -> ()
"sample.pack"(%a, %v) <{operandSegmentSizes = array<i32: 0, 2>}> : (i32, !sample.vec<4 x f32>) -> ()
"sample.weights"(%a) <{weights = array<i64: 1, 2, 3>}> : (i32) -> ()
"sample.comment"() <{text = "say \22hi\22"}> : () -> ()
"#;

    #[test]
    fn registers_converts_unregisters() {
        let mut opt = MlirOpt::upstream();
        opt.load(SampleDialect);
        let m = opt.parse(CUSTOM).unwrap();
        assert_eq!(m.to_string(), GENERIC);
        assert_eq!(opt.show(&m).to_string(), CUSTOM);
        assert_eq!(opt.show(&opt.parse(GENERIC).unwrap()).to_string(), CUSTOM);

        let ops: Vec<&Operation<'_>> = m.items.iter().filter_map(|i| if let Item::Op(op) = i { Some(op) } else { None }).collect();
        let round = Round::try_from(ops[2]).unwrap();
        assert_eq!(round.mode, Mode::Zero);
        assert_eq!(Operation::try_from(&round).unwrap(), Operation { results: Vec::new(), ..ops[2].clone() });
        assert!(matches!(Loop::try_from(ops[5]), Ok(l) if l.body.blocks[0].ops.len() == 1));
        assert_eq!(Weights::try_from(ops[9]).unwrap().weights, [1, 2, 3]);
        assert_eq!(Comment::try_from(ops[10]).unwrap().text, "say \"hi\"");
        let Ok(pack) = Pack::try_from(ops[8]) else { panic!() };
        let Type::Extended(Extended { params, .. }) = &pack.rhs_types[1] else { panic!() };
        assert_eq!(params[1], Attribute::Type(Type::Float(mlirformat::FloatKind::F32)));

        assert!(opt.unregister("sample"));
        assert_eq!(opt.show(&opt.parse(GENERIC).unwrap()).to_string(), GENERIC);
        assert!(opt.parse(CUSTOM).unwrap().items.iter().all(|i| matches!(i, Item::Op(op) if op.raw.is_some())));
    }
}
