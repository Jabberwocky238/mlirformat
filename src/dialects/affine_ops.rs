//! The `affine` ops whose syntax ODS does not describe, written by hand and injected over the
//! generated templates (`MlirOpt::upstream`), so `affine.gen.rs` stays as `mlirformat tblgen`
//! wrote it.
//!
//! Upstream prints these from C++ for a reason: an op's operands are one flat list, and only its
//! map says where the dimensions end and the symbols begin. The map usually arrives as an alias
//! (`map = #map`), so printing needs the module's alias table — see [`Printer::alias`].
//! Without it, or with a map we cannot read, the op prints generic, which is still valid MLIR.

use crate::affine_expr::Map;
use crate::mlir;
use crate::common::{Attribute, Content, Op, Operation, Type, Value};
use crate::generator::Printer;
use crate::parser::{Parser, R};
use alloc::string::String;
use alloc::vec::Vec;
use core::fmt::{self, Write};

/// The body of an `affine_map<...>` the attribute stands for, written inline or behind an alias.
fn map_body(attr: &Attribute<'_>, alias: &dyn Fn(&str) -> Option<String>) -> Option<String> {
    let text = match attr {
        Attribute::Builtin { name, body, .. } if name == "affine_map" => String::from(&**body),
        Attribute::Extended { ext, .. } if ext.body.is_none() && ext.params.is_empty() => alias(&ext.name)?.strip_prefix("affine_map").map(String::from)?,
        _ => return None,
    };
    Some(String::from(text.strip_prefix('<')?.strip_suffix('>')?))
}

/// How many of the op's operands the map takes as dimensions; the rest are its symbols.
fn dims_of(attr: &Attribute<'_>, alias: &dyn Fn(&str) -> Option<String>, operands: usize) -> Option<usize> {
    let body = map_body(attr, alias)?;
    let map = Map::try_from(body.as_str()).ok()?;
    let syms = map.syms.as_ref().map_or(0, Vec::len);
    (map.dims.len() + syms == operands).then_some(map.dims.len())
}

/// `#map(%a, %b)[%s]`: the map, its dimension operands, and its symbols when it has any.
fn write_call(p: &mut Printer<'_, '_>, map: &Attribute<'_>, operands: &[Value<'_>], dims: usize) -> fmt::Result {
    write!(p, " {map}(")?;
    for (i, v) in operands[..dims].iter().enumerate() {
        write!(p, "{}{v}", if i > 0 { ", " } else { "" })?;
    }
    p.write_char(')')?;
    let syms = &operands[dims..];
    if syms.is_empty() {
        return Ok(());
    }
    p.write_char('[')?;
    for (i, v) in syms.iter().enumerate() {
        write!(p, "{}{v}", if i > 0 { ", " } else { "" })?;
    }
    p.write_char(']')
}

/// The operands of `(%a, %b)[%s]`, dimensions then symbols, as one list.
fn read_call<'a>(p: &mut Parser<'a, '_>) -> R<Vec<Value<'a>>> {
    let mut out = Vec::new();
    p.expect("(")?;
    while !p.eat(")") {
        out.push(p.value()?);
        p.eat(",");
    }
    if p.eat("[") {
        while !p.eat("]") {
            out.push(p.value()?);
            p.eat(",");
        }
    }
    Ok(out)
}

/// Declares one `#map(dims)[syms]` op: they differ only in their name and result.
macro_rules! call_ops {
    ($($ty:ident = $name:literal, $doc:literal;)*) => {$(
        #[doc = $doc]
        #[mlir::op($name, custom, results(result))]
        pub struct $ty<'a> {
            #[slot(operands_ty, name = "mapOperands")]
            pub map_operands: Vec<Value<'a>>,
            #[attr(name = "map")]
            pub map: Attribute<'a>,
            #[dtype(name = "mapOperands_ty", is = index)]
            pub operands_ty: Type<'a>,
            #[dtype(name = "result", is = index)]
            pub result: Type<'a>,
        }

        impl Op for $ty<'_> {
            const NAME: &'static str = $name;
            const FORMAT: &'static str = "";

            fn print(&self, p: &mut Printer<'_, '_>) -> fmt::Result {
                let alias = |n: &str| p.alias(n).map(String::from);
                match dims_of(&self.map, &alias, self.map_operands.len()) {
                    Some(dims) => {
                        p.op_name(Self::NAME)?;
                        write_call(p, &self.map, &self.map_operands, dims)?;
                        // The op's own discardable attributes still have to be written.
                        p.attr_dict("", &self.attrs, &[])
                    }
                    // No readable map: the generic form says the same thing and always works.
                    None => p.generic(&Operation::of_op(self).map_err(|_| fmt::Error)?),
                }
            }

            fn parse(p: &mut Parser<'_, '_>) -> R<Self> {
                let map = p.attr()?;
                let map_operands = read_call(p)?;
                let op = $ty {
                    map_operands,
                    map,
                    operands_ty: Type::Index,
                    result: Type::Index,
                    attrs: p.opt_dict()?,
                    loc: p.opt_loc()?,
                };
                // The struct borrows the parser's text; hand back one that owns it.
                Content::convert(&op).or_else(|e| p.err(e.0))
            }
        }
    )*};
}

call_ops! {
    Apply = "affine.apply", "`affine.apply #map(%i)[%n]`: the map applied to its operands.";
    Min = "affine.min", "`affine.min #map(%i)[%n]`: the least of the map's results.";
    Max = "affine.max", "`affine.max #map(%i)[%n]`: the greatest of the map's results.";
}
