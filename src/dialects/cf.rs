//! `cf` (subset).

use alloc::borrow::Cow;
use alloc::format;
use alloc::string::String;
use alloc::vec;
use alloc::vec::Vec;
use core::fmt::{self, Write};

use crate::{Attribute, Dim, Op, Parse, Print, Parser, Printer, R, Shaped, ShapedKind, Str, Type, Value, mlir};

#[mlir::op("cf.br", format = "$dest (`(` $destOperands^ `:` type($destOperands) `)`)? attr-dict")]
pub struct Br<'a> {
    #[successor]
    pub dest: Str<'a>,
    #[slot(dest_types, name = "destOperands")]
    pub dest_operands: Vec<Value<'a>>,
    pub dest_types: Vec<Type<'a>>,
}

#[mlir::op(
    "cf.cond_br",
    format = "$condition (`weights` `(` $branch_weights^ `)`)? `,` $trueDest (`(` $trueDestOperands^ `:` type($trueDestOperands) `)`)? `,` $falseDest (`(` $falseDestOperands^ `:` type($falseDestOperands) `)`)? attr-dict"
)]
pub struct CondBr<'a> {
    #[slot(condition_ty)]
    pub condition: Value<'a>,
    pub branch_weights: Option<Vec<i32>>,
    #[successor(name = "trueDest")]
    pub true_dest: Str<'a>,
    #[slot(true_types, name = "trueDestOperands")]
    pub true_dest_operands: Vec<Value<'a>>,
    #[successor(name = "falseDest")]
    pub false_dest: Str<'a>,
    #[slot(false_types, name = "falseDestOperands")]
    pub false_dest_operands: Vec<Value<'a>>,
    #[dtype(i1)]
    pub condition_ty: Type<'a>,
    pub true_types: Vec<Type<'a>>,
    pub false_types: Vec<Type<'a>>,
}

#[mlir::op("cf.assert", format = "$arg `,` $msg attr-dict")]
pub struct Assert<'a> {
    #[slot(arg_ty)]
    pub arg: Value<'a>,
    pub msg: String,
    #[dtype(i1)]
    pub arg_ty: Type<'a>,
}

/// ```mlir
/// cf.switch %flag : i32, [
///   default: ^bb1(%a : f32),
///   42: ^bb2(%b, %c : f32, f32),
///   43: ^bb3
/// ]
/// ```
/// Hand-written syntax: one case per line, case values printed unsigned (`-1 : i32` ⇒ `4294967295`).
#[mlir::op("cf.switch", custom)]
pub struct Switch<'a> {
    #[slot(flag_ty)]
    pub flag: Value<'a>,
    #[slot(default_types, name = "defaultOperands")]
    pub default_operands: Vec<Value<'a>>,
    #[slot(case_types, name = "caseOperands")]
    pub case_operands: Vec<Value<'a>>,
    #[successor(name = "defaultDestination")]
    pub default_destination: Str<'a>,
    #[successor(name = "caseDestinations")]
    pub case_destinations: Vec<Str<'a>>,
    /// `dense<[v, …]> : vector<NxT>` (absent without cases).
    pub case_values: Option<Attribute<'a>>,
    /// `array<i32: n, …>`: operands per case.
    pub case_operand_segments: Attribute<'a>,
    pub flag_ty: Type<'a>,
    pub default_types: Vec<Type<'a>>,
    pub case_types: Vec<Type<'a>>,
}

/// One destination: `^bb(%a, %b : T, U)` or `^bb`.
struct Dest<'x, 'a>(&'x str, &'x [Value<'a>], &'x [Type<'a>]);

impl fmt::Display for Dest<'_, '_> {
    fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
        write!(f, "^{}", self.0)?;
        if self.1.is_empty() {
            return Ok(());
        }
        let join = |f: &mut fmt::Formatter<'_>, xs: &mut dyn Iterator<Item = String>| xs.enumerate().try_for_each(|(i, x)| write!(f, "{}{x}", if i > 0 { ", " } else { "" }));
        f.write_char('(')?;
        join(f, &mut self.1.iter().map(|v| format!("{v}")))?;
        f.write_str(" : ")?;
        join(f, &mut self.2.iter().map(|t| format!("{t}")))?;
        f.write_char(')')
    }
}

impl<'a> Switch<'a> {
    /// The flag's bit width (`index` counts as 64).
    fn width(&self) -> u32 {
        match self.flag_ty {
            Type::Integer { width, .. } => width,
            _ => 64,
        }
    }

    /// Case values, signed (a splat repeats to the vector's length).
    fn values(&self) -> Option<Vec<i128>> {
        let Some(Attribute::Builtin { name, body, ty: Some(Type::Shaped(Shaped { shape: Some(dims), .. })) }) = &self.case_values else {
            return self.case_values.is_none().then(Vec::new);
        };
        let [Dim::Static(n)] = dims[..] else { return None };
        let body = body.strip_prefix('<')?.strip_suffix('>')?;
        let numbers: Vec<i128> = body.trim_matches(['[', ']']).split(',').map(|v| v.trim().parse().ok()).collect::<Option<_>>()?;
        (name == "dense").then_some(())?;
        match numbers[..] {
            [v] if !body.starts_with('[') => Some(vec![v; usize::try_from(n).ok()?]),
            _ => Some(numbers),
        }
    }

    /// Operands per case.
    fn segments(&self) -> Option<Vec<usize>> {
        let Attribute::DenseArray { values, .. } = &self.case_operand_segments else { return None };
        values.iter().map(|v| v.parse().ok()).collect()
    }

    /// Reads one destination: `^bb(%a, %b : T, U)` or `^bb`.
    #[allow(clippy::type_complexity)]
    fn dest<'s>(p: &mut Parser<'s, '_>) -> R<(Str<'s>, Vec<Value<'s>>, Vec<Type<'s>>)> {
        let name = Cow::Borrowed(p.sigil('^')?);
        let (mut values, mut types) = (Vec::new(), Vec::new());
        if p.eat("(") {
            values.push(p.value()?);
            while p.eat(",") {
                values.push(p.value()?);
            }
            p.expect(":")?;
            types.push(p.ty()?);
            while p.eat(",") {
                types.push(p.ty()?);
            }
            p.expect(")")?;
        }
        Ok((name, values, types))
    }

    /// `dense<…> : vector<NxT>` of these values (a splat when they are all equal).
    fn dense(values: &[i128], flag_ty: &Type<'a>) -> Attribute<'a> {
        let body = match values {
            [first, rest @ ..] if rest.iter().all(|v| v == first) => format!("<{first}>"),
            _ => format!("<[{}]>", values.iter().map(|v| format!("{v}")).collect::<Vec<_>>().join(", ")),
        };
        let n = i64::try_from(values.len()).unwrap_or(i64::MAX);
        let ty = Type::Shaped(Shaped { kind: ShapedKind::Vector, shape: Some(vec![Dim::Static(n)]), elem: alloc::boxed::Box::new(flag_ty.clone()), extras: Vec::new() });
        Attribute::Builtin { name: Cow::Borrowed("dense"), body: Cow::Owned(body), ty: Some(ty) }
    }
}


impl Print for Switch<'_> {
    fn print(&self, p: &mut Printer<'_, '_>) -> fmt::Result {
        let (values, segments) = (self.values().ok_or(fmt::Error)?, self.segments().ok_or(fmt::Error)?);
        if values.len() != segments.len() || values.len() != self.case_destinations.len() {
            return Err(fmt::Error);
        }
        let modulus = 1i128 << self.width();
        p.op_name(Self::NAME)?;
        write!(p, " {} : {}, [", self.flag, self.flag_ty)?;
        p.nested(|p| {
            p.nl()?;
            write!(p, "default: {}", Dest(&self.default_destination, &self.default_operands, &self.default_types))?;
            let mut at = 0;
            for ((value, n), dest) in values.iter().zip(&segments).zip(&self.case_destinations) {
                let ops = self.case_operands.get(at..at + n).ok_or(fmt::Error)?;
                let tys = self.case_types.get(at..at + n).ok_or(fmt::Error)?;
                at += n;
                p.write_char(',')?;
                p.nl()?;
                write!(p, "{}: {}", value.rem_euclid(modulus), Dest(dest, ops, tys))?;
            }
            Ok(())
        })?;
        if !values.is_empty() {
            p.nl()?;
        }
        p.write_char(']')?;
        p.attr_dict("", &self.attrs, &[])?;
        p.loc(&self.loc)
    }
}

impl Parse for Switch<'_> {
    fn parse(p: &mut Parser<'_, '_>) -> R<Self> {
        let flag = p.value()?;
        p.expect(":")?;
        let flag_ty = p.ty()?;
        let width = match flag_ty {
            Type::Integer { width, .. } => width,
            _ => 64,
        };
        p.expect(",")?;
        p.expect("[")?;
        p.expect_lit("default")?;
        p.expect(":")?;
        let (default_destination, default_operands, default_types) = Switch::dest(p)?;
        let (mut values, mut segments, mut case_destinations, mut case_operands, mut case_types) = (Vec::new(), Vec::new(), Vec::new(), Vec::new(), Vec::new());
        while p.eat(",") {
            let raw = p.bare_attr()?.int().or_else(|e| p.err(e.0))?;
            // Printed unsigned: back to the signed value of the flag's width.
            let modulus = 1i128 << width;
            values.push(if raw >= modulus / 2 { raw - modulus } else { raw });
            p.expect(":")?;
            let (name, ops, tys) = Switch::dest(p)?;
            segments.push(Cow::Owned(format!("{}", ops.len())));
            case_destinations.push(name);
            case_operands.extend(ops);
            case_types.extend(tys);
        }
        p.expect("]")?;
        let op = Switch {
            case_values: (!values.is_empty()).then(|| Switch::dense(&values, &flag_ty)),
            case_operand_segments: Attribute::DenseArray { ty: Type::int(32), values: segments },
            flag,
            default_operands,
            case_operands,
            default_destination,
            case_destinations,
            flag_ty,
            default_types,
            case_types,
            attrs: p.opt_dict()?,
            loc: p.opt_loc()?,
        };
        Self::owned(op, p)
    }
}

/// The `cf` dialect.
#[mlir::dialect(
    "cf",
    ops = [Br, CondBr, Assert, Switch],
    dependents = ["arith"]
)]
pub struct CfDialect;
