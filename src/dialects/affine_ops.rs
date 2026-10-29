//! The `affine` ops whose syntax ODS does not describe, written by hand and injected over the
//! generated templates (`MlirOpt::upstream`), so `affine.gen.rs` stays as `mlirformat tblgen`
//! wrote it.
//!
//! Upstream prints these from C++ for a reason: an op's operands are one flat list, and only its
//! map says where the dimensions end and the symbols begin. The map usually arrives as an alias
//! (`map = #map`), so printing needs the module's alias table — see [`Printer::alias`].
//! Without it, or with a map we cannot read, the op prints generic, which is still valid MLIR.

use crate::affine_expr::{Map, Set};
use crate::mlir;
use crate::common::{Attribute, Block, BlockArg, Content, Dim, Extended, Op, Parse, Print, Operation, Region, Shaped, ShapedKind, Signedness, Str, Type, Value};
use crate::generator::{Printer, Sep};
use crate::parser::{Parser, R};
use alloc::string::String;
use alloc::format;
use alloc::vec::Vec;
use core::fmt::{self, Write};

/// The body of the `kind<...>` an attribute stands for, written inline or behind an alias.
fn body_of(attr: &Attribute<'_>, kind: &str, alias: &dyn Fn(&str) -> Option<String>) -> Option<String> {
    let text = match attr {
        Attribute::Builtin { name, body, .. } if name == kind => String::from(&**body),
        Attribute::Extended { ext, .. } if ext.body.is_none() && ext.params.is_empty() => alias(&ext.name)?.strip_prefix(kind).map(String::from)?,
        _ => return None,
    };
    Some(String::from(text.strip_prefix('<')?.strip_suffix('>')?))
}

/// The body of the `affine_map<...>` an attribute stands for.
#[inline]
pub(crate) fn map_body(attr: &Attribute<'_>, alias: &dyn Fn(&str) -> Option<String>) -> Option<String> {
    body_of(attr, "affine_map", alias)
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
            pub map: Attribute<'a>,
            #[dtype(name = "mapOperands_ty", is = index)]
            pub operands_ty: Type<'a>,
            #[dtype(is = index)]
            pub result: Type<'a>,
        }


        impl Print for $ty<'_> {
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
                    None => self.print_generic(p),
                }
            }
        }

        impl Parse for $ty<'_> {
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
                Self::owned(op, p)
            }
        }
    )*};
}

call_ops! {
    Apply = "affine.apply", "`affine.apply #map(%i)[%n]`: the map applied to its operands.";
    Min = "affine.min", "`affine.min #map(%i)[%n]`: the least of the map's results.";
    Max = "affine.max", "`affine.max #map(%i)[%n]`: the greatest of the map's results.";
}

/// The index list of an `affine` memory op: the map's results written against the operands,
/// `%A[%i + 1, 0]`. Read back, each `%value` becomes a dimension in the order it first appears.
mod indices {
    use super::{Attribute, Extended, Map, Str, Value, format};
    use alloc::string::String;
    use alloc::vec::Vec;

    /// `%i + symbol(%n), 0` ⇒ the map it stands for and the values it names: dimensions (bare
    /// `%x`) then symbols (`symbol(%x)`, as MLIR prints and parses them), each in first-seen order.
    pub fn read(text: &str) -> Option<(String, Vec<String>)> {
        let (mut dims, mut syms, mut out) = (Vec::<String>::new(), Vec::<String>::new(), String::new());
        let b = text.as_bytes();
        let mut i = 0;
        let slot = |list: &mut Vec<String>, name: &str| {
            list.iter().position(|n| n == name).unwrap_or_else(|| {
                list.push(String::from(name));
                list.len() - 1
            })
        };
        while i < b.len() {
            let symbol = text[i..].starts_with("symbol(%");
            if b[i] != b'%' && !symbol {
                out.push(char::from(b[i]));
                i += 1;
                continue;
            }
            if symbol {
                i += "symbol(".len();
            }
            let start = i;
            i += 1;
            while i < b.len() && (b[i].is_ascii_alphanumeric() || matches!(b[i], b'_' | b'$' | b'.' | b'#')) {
                i += 1;
            }
            let name = &text[start..i];
            if symbol {
                if b.get(i) != Some(&b')') {
                    return None;
                }
                i += 1;
                out.push_str(&format!("s{}", slot(&mut syms, name)));
            } else {
                out.push_str(&format!("d{}", slot(&mut dims, name)));
            }
        }
        let names = |list: &[String], c: char| (0..list.len()).map(|k| format!("{c}{k}")).collect::<Vec<_>>().join(", ");
        let body = match syms.is_empty() {
            true => format!("({}) -> ({out})", names(&dims, 'd')),
            false => format!("({})[{}] -> ({out})", names(&dims, 'd'), names(&syms, 's')),
        };
        Map::try_from(body.as_str()).ok()?;
        dims.extend(syms);
        Some((body, dims))
    }

    /// The attribute for a map body: the alias that already spells it, else the map written out.
    pub fn attr<'a>(body: &str, named: Option<String>) -> Attribute<'a> {
        match named {
            Some(name) => Attribute::Extended { ext: Extended { name: Str::Owned(name), body: None, params: Vec::new() }, ty: None },
            None => Attribute::Builtin { name: Str::Borrowed("affine_map"), body: Str::Owned(format!("<{body}>")), ty: None },
        }
    }

    /// `d0` ⇒ the operand it stands for, as [`Map`] substitution wants it; a symbol operand is
    /// written `symbol(%x)`.
    #[inline]
    pub fn args(map: &Map<'_>, values: &[String]) -> Vec<(String, String)> {
        let dims = map.dims.iter().map(|d| (String::from(*d), false));
        let syms = map.syms.iter().flatten().map(|s| (String::from(*s), true));
        dims.chain(syms).zip(values).map(|((name, symbol), v)| (name, if symbol { format!("symbol({v})") } else { v.clone() })).collect()
    }

    /// The index list as it is printed: the map's results against the operands.
    #[inline]
    pub fn write(map: &Map<'_>, values: &[String]) -> String {
        let args = args(map, values);
        let args: Vec<(&str, &str)> = args.iter().map(|(n, v)| (n.as_str(), v.as_str())).collect();
        map.results.iter().map(|e| format!("{}", e.show(&args))).collect::<Vec<_>>().join(", ")
    }

    /// Every operand's text, for [`args`].
    #[inline]
    pub fn texts(values: &[Value<'_>]) -> Vec<String> {
        values.iter().map(|v| format!("{v}")).collect()
    }
}

/// `%name` / `%name#k` as written back into an operand.
fn value_of(text: &str) -> Option<Value<'static>> {
    let bare = text.strip_prefix('%')?;
    Some(match bare.split_once('#') {
        Some((name, k)) => Value { name: Str::Owned(String::from(name)), index: Some(k.parse().ok()?) },
        None => Value { name: Str::Owned(String::from(bare)), index: None },
    })
}

/// Declares one `%memref[<map results>] : <memref type>` op. `affine.store` writes the stored
/// value first; the two cannot share one struct, because an operand group that an op does not
/// have leaves its flat operand list with no way to split. Both have the element type `result`
/// (the store types its value by it), but only `affine.load` has it as a result.
macro_rules! memory_ops {
    ($($ty:ident = $name:literal, $doc:literal, ($($res:ident)?), $($value:ident)?;)*) => {$(
        #[doc = $doc]
        #[mlir::op($name, custom, results($($res)?))]
        pub struct $ty<'a> {
            $(#[slot(result, name = "value")]
            pub $value: Value<'a>,)?
            #[slot(memref_ty)]
            pub memref: Value<'a>,
            #[slot(indices_ty)]
            pub indices: Vec<Value<'a>>,
            pub map: Attribute<'a>,
            pub memref_ty: Type<'a>,
            #[dtype(is = index)]
            pub indices_ty: Type<'a>,
            #[dtype(el = memref_ty)]
            pub result: Type<'a>,
        }


        impl Print for $ty<'_> {
            fn print(&self, p: &mut Printer<'_, '_>) -> fmt::Result {
                let body = {
                    let alias = |n: &str| p.alias(n).map(String::from);
                    map_body(&self.map, &alias)
                };
                // Which operands are symbols is not in the printed text, so a map that has any
                // could not be read back: leave those on the generic form.
                let shown = body
                    .as_deref()
                    .and_then(|b| Map::try_from(b).ok())
                    .filter(|m| m.syms.as_ref().is_none_or(Vec::is_empty) && m.dims.len() == self.indices.len());
                let Some(map) = shown else {
                    return self.print_generic(p);
                };
                let texts = indices::texts(&self.indices);
                let list = indices::write(&map, &texts);
                // The index list alone does not say how the map and the operands were paired:
                // `(d0, d1) -> (d1, d0)` over `[%i, %j]` prints exactly as `(d0, d1) -> (d0, d1)`
                // over `[%j, %i]` does. Print the custom form only where reading it back gives
                // this op again, and leave the rest on the generic form. The comparison is
                // against the map's text as the op holds it, not its tidied form: a body written
                // `(d0-1)` has to come back spelled that way or the attribute is not the same.
                if indices::read(&list) != Some((body.clone().unwrap_or_default(), texts)) {
                    return self.print_generic(p);
                }
                p.op_name(Self::NAME)?;
                p.write_char(' ')?;
                $(write!(p, "{}, ", self.$value)?;)?
                write!(p, "{}[{list}]", self.memref)?;
                p.attr_dict("", &self.attrs, &[])?;
                write!(p, " : {}", self.memref_ty)
            }
        }

        impl Parse for $ty<'_> {
            fn parse(p: &mut Parser<'_, '_>) -> R<Self> {
                $(let $value = {
                    let v = p.value()?;
                    p.expect(",")?;
                    v
                };)?
                let memref = p.value()?;
                let list = p.group()?;
                let inner = list.get(1..list.len() - 1).unwrap_or_default();
                let Some((body, names)) = indices::read(inner) else { return p.err("affine index list") };
                let named = p.alias_named(&format!("affine_map<{body}>")).map(String::from);
                let map = indices::attr(&body, named);
                let attrs = p.opt_dict()?;
                p.expect(":")?;
                let memref_ty = p.ty()?;
                let Type::Shaped(Shaped { elem, .. }) = &memref_ty else { return p.err("affine memory op: a memref type") };
                let result = (**elem).clone();
                let mut indices = Vec::new();
                for n in &names {
                    match value_of(n) {
                        Some(v) => indices.push(v),
                        None => return p.err("affine index list: an operand"),
                    }
                }
                let op = $ty { $($value,)? memref, indices, map, memref_ty: memref_ty.clone(), indices_ty: Type::Index, result, attrs, loc: p.opt_loc()? };
                Self::owned(op, p)
            }
        }
    )*};
}

memory_ops! {
    Load = "affine.load", "`affine.load %A[%i + 1]`: the map's results against the operands.", (result),;
    Store = "affine.store", "`affine.store %v, %A[%i + 1]`: the value stored where the map says.", (), value;
}

/// A loop bound: a constant, a single operand, or the map applied to its operands, which
/// `max` / `min` prefixes when the map has more than one result to choose between.
mod bound {
    use super::{indices, map_body, Attribute, Map, Printer, Value};
    use crate::affine_expr::Expr;
    use alloc::format;
    use alloc::string::String;
    use alloc::vec::Vec;
    use core::fmt::Write;

    /// `0`, `%n`, `#map(%i)` or `min #map(%i)[%n]` — `None` when the map cannot be read.
    pub fn write(map: &Attribute<'_>, operands: &[Value<'_>], pick: &str, alias: &dyn Fn(&str) -> Option<String>) -> Option<String> {
        let body = map_body(map, alias)?;
        let m = Map::try_from(body.as_str()).ok()?;
        let syms = m.syms.as_ref().map_or(0, Vec::len);
        if m.dims.len() + syms != operands.len() {
            return None;
        }
        match (&*m.results, m.dims.len(), syms) {
            ([Expr::Const(c)], 0, 0) => Some(format!("{c}")),
            ([Expr::Id(d)], 1, 0) if *d == m.dims[0] => Some(format!("{}", operands[0])),
            (results, dims, _) => {
                let mut out = String::new();
                if results.len() > 1 {
                    let _ = write!(out, "{pick} ");
                }
                let _ = write!(out, "{map}");
                let _ = write!(out, "({})", list(&operands[..dims]));
                if syms > 0 {
                    let _ = write!(out, "[{}]", list(&operands[dims..]));
                }
                Some(out)
            }
        }
    }

    #[inline]
    fn list(vs: &[Value<'_>]) -> String {
        vs.iter().map(|v| format!("{v}")).collect::<Vec<_>>().join(", ")
    }

    /// Writes what [`write`] produced.
    #[inline]
    pub fn put(p: &mut Printer<'_, '_>, text: &str) -> core::fmt::Result {
        p.write_str(text)
    }

    /// The attribute and operands a bound stands for, given what was read.
    #[inline]
    pub fn of_constant<'a>(c: i64, named: &dyn Fn(&str) -> Option<String>) -> Attribute<'a> {
        let body = format!("() -> ({c})");
        indices::attr(&body, named(&format!("affine_map<{body}>")))
    }

    /// `(d0) -> (d0)`, the map a bare operand stands for.
    #[inline]
    pub fn of_operand<'a>(named: &dyn Fn(&str) -> Option<String>) -> Attribute<'a> {
        let body = String::from("(d0) -> (d0)");
        indices::attr(&body, named(&format!("affine_map<{body}>")))
    }
}

/// `affine.for %i = 0 to 100 step 2 iter_args(%a = %init) -> (index) { ... }`.
///
/// The induction variable and the iteration arguments are the body's entry block arguments,
/// spelled in the header instead of as `^bb0(...)`; the `affine.yield` that closes the body is
/// left out when it carries nothing. Both are put back when reading.
#[mlir::op("affine.for", custom, results(results))]
pub struct For<'a> {
    #[slot(lower_bound_operands_ty, name = "lowerBoundOperands")]
    pub lower_bound_operands: Vec<Value<'a>>,
    #[slot(upper_bound_operands_ty, name = "upperBoundOperands")]
    pub upper_bound_operands: Vec<Value<'a>>,
    #[slot(results)]
    pub inits: Vec<Value<'a>>,
    #[attr(name = "lowerBoundMap")]
    pub lower_bound_map: Attribute<'a>,
    #[attr(name = "upperBoundMap")]
    pub upper_bound_map: Attribute<'a>,
    pub step: Attribute<'a>,
    pub region: Region<'a>,
    #[dtype(name = "lowerBoundOperands_ty", is = index)]
    pub lower_bound_operands_ty: Type<'a>,
    #[dtype(name = "upperBoundOperands_ty", is = index)]
    pub upper_bound_operands_ty: Type<'a>,
    pub results: Vec<Type<'a>>,
}

impl For<'_> {
    /// The loop's step, which the custom form leaves out when it is 1.
    fn step_of(&self) -> Option<i64> {
        match &self.step {
            Attribute::Int { lit, .. } => lit.parse().ok(),
            _ => None,
        }
    }
}


impl Print for For<'_> {
    fn print(&self, p: &mut Printer<'_, '_>) -> fmt::Result {
        let bounds = {
            let alias = |n: &str| p.alias(n).map(String::from);
            let lo = bound::write(&self.lower_bound_map, &self.lower_bound_operands, "max", &alias);
            let hi = bound::write(&self.upper_bound_map, &self.upper_bound_operands, "min", &alias);
            lo.zip(hi)
        };
        let entry = self.region.blocks.first();
        let shaped = entry.filter(|b| b.args.len() == 1 + self.inits.len() && self.results.len() == self.inits.len());
        let (Some((lo, hi)), Some(entry), Some(step)) = (bounds, shaped, self.step_of()) else {
            return self.print_generic(p);
        };
        p.op_name(Self::NAME)?;
        write!(p, " %{} = ", entry.args[0].name)?;
        bound::put(p, &lo)?;
        p.write_str(" to ")?;
        bound::put(p, &hi)?;
        if step != 1 {
            write!(p, " step {step}")?;
        }
        if !self.inits.is_empty() {
            p.write_str(" iter_args(")?;
            for (i, (a, v)) in entry.args[1..].iter().zip(&self.inits).enumerate() {
                write!(p, "{}%{} = {v}", if i > 0 { ", " } else { "" }, a.name)?;
            }
            write!(p, ") -> ({})", Sep(&self.results, ", "))?;
        }
        p.write_char(' ')?;
        // The body comes before the attributes: `{` right after the header would be read as an
        // empty attribute dictionary, not as the region (this is the order MLIR prints in).
        p.region_body(&self.region, "affine.yield")?;
        p.attr_dict("", &self.attrs, &[])
    }
}

impl Parse for For<'_> {
    fn parse(p: &mut Parser<'_, '_>) -> R<Self> {
        let iv = String::from(p.sigil('%')?);
        p.expect("=")?;
        let (lower_bound_map, lower_bound_operands) = read_bound(p)?;
        p.expect_lit("to")?;
        let (upper_bound_map, upper_bound_operands) = read_bound(p)?;
        // The step is written bare, but the op holds it as `N : index`.
        let step = match p.eat_kw("step") {
            true => {
                let n = p.attr()?.int().or_else(|e| p.err(e.0))?;
                Attribute::Int { lit: Str::Owned(format!("{n}")), ty: Some(Type::Index) }
            }
            false => Attribute::Int { lit: Str::Borrowed("1"), ty: Some(Type::Index) },
        };
        let (mut names, mut inits) = (Vec::new(), Vec::new());
        if p.eat_kw("iter_args") {
            p.expect("(")?;
            while !p.eat(")") {
                names.push(String::from(p.sigil('%')?));
                p.expect("=")?;
                inits.push(p.value()?);
                p.eat(",");
            }
        }
        let results = match p.eat("->") {
            true => p.results_ty()?,
            false => Vec::new(),
        };
        let mut region = p.region()?;
        let attrs = p.opt_dict()?;
        // The header named the body's entry block arguments and may have left its terminator
        // out; the op itself holds both.
        // A body holding nothing but the elided terminator prints as `{ }`, which reads back
        // as no block at all.
        if region.blocks.is_empty() {
            region.blocks.push(Block { label: None, args: Vec::new(), ops: Vec::new() });
        }
        let Some(entry) = region.blocks.first_mut() else { return p.err("affine.for: a body") };
        entry.label.get_or_insert(Str::Borrowed("bb0"));
        let mut args = alloc::vec![BlockArg { name: Str::Owned(iv), ty: Type::Index, loc: None }];
        for (name, ty) in names.iter().zip(&results) {
            args.push(BlockArg { name: Str::Owned(name.clone()), ty: ty.clone(), loc: None });
        }
        entry.args = args;
        if !entry.ops.last().is_some_and(|op| op.name == "affine.yield") {
            entry.ops.push(Operation { name: Str::Borrowed("affine.yield"), ..Operation::default() });
        }
        let op = For {
            lower_bound_operands,
            upper_bound_operands,
            inits,
            lower_bound_map,
            upper_bound_map,
            step,
            region,
            lower_bound_operands_ty: Type::Index,
            upper_bound_operands_ty: Type::Index,
            results,
            attrs,
            loc: p.opt_loc()?,
        };
        Self::owned(op, p)
    }
}

/// One loop bound: `0`, `%n`, `#map(%i)[%s]`, or either of the last two behind `max` / `min`.
fn read_bound<'a>(p: &mut Parser<'a, '_>) -> R<(Attribute<'static>, Vec<Value<'a>>)> {
    let _ = p.eat_kw("max") || p.eat_kw("min");
    if p.at(b'%') {
        let v = p.value()?;
        let named = |t: &str| p.alias_named(t).map(String::from);
        return Ok((bound::of_operand(&named), alloc::vec![v]));
    }
    if p.at(b'#') || p.rest().starts_with("affine_map") {
        let map = p.attr()?;
        let operands = if p.rest().starts_with('(') { read_call(p)? } else { Vec::new() };
        return Ok((Content::convert(&map).or_else(|e| p.err(e.0))?, operands));
    }
    let c = p.attr()?.int().or_else(|e| p.err(e.0))?;
    let named = |t: &str| p.alias_named(t).map(String::from);
    Ok((bound::of_constant(i64::try_from(c).unwrap_or_default(), &named), Vec::new()))
}


/// `affine.if #set(%i)[%n] -> types { then } else { else }`.
///
/// The condition is an integer set, applied to the operands exactly as a map is in
/// `affine.apply`; both regions leave out their `affine.yield` when it carries nothing, and an
/// absent `else` is a region with no block at all.
#[mlir::op("affine.if", custom, results(results))]
pub struct If<'a> {
    #[slot(args_ty)]
    pub args: Vec<Value<'a>>,
    pub condition: Attribute<'a>,
    #[region(name = "thenRegion")]
    pub then_region: Region<'a>,
    #[region(name = "elseRegion")]
    pub else_region: Region<'a>,
    #[dtype(is = index)]
    pub args_ty: Type<'a>,
    pub results: Vec<Type<'a>>,
}

/// Puts back what a region's custom form leaves out: the block itself when the body held nothing
/// but the terminator, and the terminator when it carried nothing.
fn close_region(r: &mut Region<'_>) {
    if r.blocks.is_empty() {
        r.blocks.push(Block { label: None, args: Vec::new(), ops: Vec::new() });
    }
    if let Some(b) = r.blocks.last_mut()
        && !b.ops.last().is_some_and(|op| op.name == "affine.yield")
    {
        b.ops.push(Operation { name: Str::Borrowed("affine.yield"), ..Operation::default() });
    }
}


impl Print for If<'_> {
    fn print(&self, p: &mut Printer<'_, '_>) -> fmt::Result {
        let body = {
            let alias = |n: &str| p.alias(n).map(String::from);
            body_of(&self.condition, "affine_set", &alias)
        };
        let shaped = body
            .as_deref()
            .and_then(|b| Set::try_from(b).ok())
            .filter(|s| s.dims.len() + s.syms.as_ref().map_or(0, Vec::len) == self.args.len());
        let Some(set) = shaped else {
            return self.print_generic(p);
        };
        p.op_name(Self::NAME)?;
        write_call(p, &self.condition, &self.args, set.dims.len())?;
        match &*self.results {
            [] => {}
            // One result is written bare, several in parentheses.
            [t] => write!(p, " -> {t}")?,
            ts => write!(p, " -> ({})", Sep(ts, ", "))?,
        }
        p.write_char(' ')?;
        p.region_body(&self.then_region, "affine.yield")?;
        if !self.else_region.blocks.is_empty() {
            p.write_str(" else ")?;
            p.region_body(&self.else_region, "affine.yield")?;
        }
        p.attr_dict("", &self.attrs, &[])
    }
}

impl Parse for If<'_> {
    fn parse(p: &mut Parser<'_, '_>) -> R<Self> {
        let condition = p.attr()?;
        let args = read_call(p)?;
        let results = match p.eat("->") {
            true => p.results_ty()?,
            false => Vec::new(),
        };
        let mut then_region = p.region()?;
        close_region(&mut then_region);
        let else_region = match p.eat_kw("else") {
            true => {
                let mut r = p.region()?;
                close_region(&mut r);
                r
            }
            false => Region { blocks: Vec::new() },
        };
        let op = If {
            args,
            condition,
            then_region,
            else_region,
            args_ty: Type::Index,
            results,
            attrs: p.opt_dict()?,
            loc: p.opt_loc()?,
        };
        Self::owned(op, p)
    }
}

/// `affine.parallel (%i, %j) = (0, 0) to (10, 5) step (3, 2) { ... }`.
///
/// Only the shape `mlir-opt` writes almost everywhere is taken: one map result per induction
/// variable (`lowerBoundsGroups` a splat of 1, so no `max` / `min` to choose between) and no
/// reductions. Anything else keeps the generic form.
#[mlir::op("affine.parallel", custom, results(results))]
pub struct Parallel<'a> {
    #[slot(map_operands_ty, name = "mapOperands")]
    pub map_operands: Vec<Value<'a>>,
    pub reductions: Attribute<'a>,
    #[attr(name = "lowerBoundsMap")]
    pub lower_bounds_map: Attribute<'a>,
    #[attr(name = "lowerBoundsGroups")]
    pub lower_bounds_groups: Attribute<'a>,
    #[attr(name = "upperBoundsMap")]
    pub upper_bounds_map: Attribute<'a>,
    #[attr(name = "upperBoundsGroups")]
    pub upper_bounds_groups: Attribute<'a>,
    pub steps: Attribute<'a>,
    pub region: Region<'a>,
    #[dtype(name = "mapOperands_ty", is = index)]
    pub map_operands_ty: Type<'a>,
    pub results: Vec<Type<'a>>,
}

/// `dense<1> : tensor<Nxi32>`: one map result per induction variable, which is the only grouping
/// this op writes out.
/// `dense<1> : tensor<2xi32>` / `dense<[1, 2]> : tensor<2xi32>` ⇒ how many expressions each of the
/// `n` bounds has.
fn groups_of(attr: &Attribute<'_>, n: usize) -> Option<Vec<usize>> {
    let Attribute::Builtin { name, body, ty: Some(Type::Shaped(Shaped { shape: Some(dims), .. })) } = attr else { return None };
    if name != "dense" || dims.as_slice() != [Dim::Static(i64::try_from(n).ok()?)] {
        return None;
    }
    let inner = body.strip_prefix('<')?.strip_suffix('>')?;
    let groups: Vec<usize> = match inner.strip_prefix('[').and_then(|l| l.strip_suffix(']')) {
        Some(list) => list.split(',').map(|x| x.trim().parse().ok()).collect::<Option<_>>()?,
        None => alloc::vec![inner.trim().parse().ok()?; n],
    };
    (groups.len() == n && groups.iter().all(|&g| g > 0)).then_some(groups)
}

/// The grouping attribute, written as MLIR prints it (a splat when every bound has as many).
fn groups_attr<'a>(groups: &[usize]) -> Attribute<'a> {
    let shape = alloc::vec![Dim::Static(i64::try_from(groups.len()).unwrap_or_default())];
    let elem = Type::Integer { signedness: Signedness::Signless, width: 32 };
    let ty = Type::Shaped(Shaped { kind: ShapedKind::Tensor, shape: Some(shape), elem: alloc::boxed::Box::new(elem), extras: Vec::new() });
    let body = match groups {
        [first, rest @ ..] if rest.iter().all(|g| g == first) => format!("<{first}>"),
        _ => format!("<[{}]>", groups.iter().map(|g| format!("{g}")).collect::<Vec<_>>().join(", ")),
    };
    Attribute::Builtin { name: Str::Borrowed("dense"), body: Str::Owned(body), ty: Some(ty) }
}

/// `[1, 2]` as the op holds it.
fn ints_attr<'a>(xs: &[i64]) -> Attribute<'a> {
    Attribute::Array(xs.iter().map(|v| Attribute::Int { lit: Str::Owned(format!("{v}")), ty: None }).collect())
}

/// The integers of an `[...]` attribute, or `None` when it is not one.
fn ints_of(attr: &Attribute<'_>) -> Option<Vec<i64>> {
    match attr {
        Attribute::Array(xs) => xs.iter().map(|x| x.clone().int().ok().and_then(|v| i64::try_from(v).ok())).collect(),
        _ => None,
    }
}


impl Print for Parallel<'_> {
    fn print(&self, p: &mut Printer<'_, '_>) -> fmt::Result {
        let (lo, hi) = {
            let alias = |n: &str| p.alias(n).map(String::from);
            (map_body(&self.lower_bounds_map, &alias), map_body(&self.upper_bounds_map, &alias))
        };
        // A `Map` borrows the body it was read from, so the texts have to outlive it.
        let (Some(lo_text), Some(hi_text), Some(steps), Some(entry)) = (lo, hi, ints_of(&self.steps), self.region.blocks.first()) else {
            return self.print_generic(p);
        };
        let (Ok(lm), Ok(hm)) = (Map::try_from(lo_text.as_str()), Map::try_from(hi_text.as_str())) else {
            return self.print_generic(p);
        };
        let ivs = entry.args.len();
        let inputs = |m: &Map<'_>| m.dims.len() + m.syms.as_ref().map_or(0, Vec::len);
        let split = inputs(&lm);
        let (Some(lg), Some(ug)) = (groups_of(&self.lower_bounds_groups, ivs), groups_of(&self.upper_bounds_groups, ivs)) else {
            return self.print_generic(p);
        };
        let shaped = lm.results.len() == lg.iter().sum::<usize>()
            && hm.results.len() == ug.iter().sum::<usize>()
            && steps.len() == ivs
            && self.reductions == Attribute::Array(Vec::new())
            && self.results.is_empty()
            && split + inputs(&hm) == self.map_operands.len();
        if !shaped {
            return self.print_generic(p);
        }
        let (lt, ht) = (indices::texts(&self.map_operands[..split]), indices::texts(&self.map_operands[split..]));
        // As for the memory ops, the printed bounds alone do not say how map and operands were
        // paired; print the custom form only where reading them back gives this op again.
        if indices::read(&indices::write(&lm, &lt)) != Some((lo_text.clone(), lt.clone())) || indices::read(&indices::write(&hm, &ht)) != Some((hi_text.clone(), ht.clone())) {
            return self.print_generic(p);
        }
        // A bound with several expressions is their `max` (lower) / `min` (upper).
        let (lows, highs) = (grouped(&lm, &lt, &lg, "max"), grouped(&hm, &ht, &ug, "min"));
        p.op_name(Self::NAME)?;
        let names = entry.args.iter().map(|x| format!("%{}", x.name)).collect::<Vec<_>>().join(", ");
        write!(p, " ({names}) = ({lows}) to ({highs})")?;
        if steps.iter().any(|s| *s != 1) {
            write!(p, " step ({})", steps.iter().map(|s| format!("{s}")).collect::<Vec<_>>().join(", "))?;
        }
        p.write_char(' ')?;
        p.region_body(&self.region, "affine.yield")?;
        p.attr_dict("", &self.attrs, &[])
    }
}

impl Parse for Parallel<'_> {
    fn parse(p: &mut Parser<'_, '_>) -> R<Self> {
        let ivs = read_names(p)?;
        p.expect("=")?;
        let (lower_bounds_map, lower_ops, lower_groups) = read_bounds(p)?;
        p.expect_lit("to")?;
        let (upper_bounds_map, upper_ops, upper_groups) = read_bounds(p)?;
        let steps = match p.eat_kw("step") {
            true => read_names(p)?.iter().map(|s| s.parse::<i64>().unwrap_or(1)).collect(),
            false => alloc::vec![1; ivs.len()],
        };
        let mut region = p.region()?;
        close_region(&mut region);
        if let Some(b) = region.blocks.first_mut() {
            // The header named these, so the generic form gives the block a label as well.
            b.label.get_or_insert(Str::Borrowed("bb0"));
            b.args = ivs.iter().map(|n| BlockArg { name: Str::Owned(n.clone()), ty: Type::Index, loc: None }).collect();
        }
        let mut map_operands = lower_ops;
        map_operands.extend(upper_ops);
        let op = Parallel {
            map_operands,
            reductions: Attribute::Array(Vec::new()),
            lower_bounds_map,
            lower_bounds_groups: groups_attr(&lower_groups),
            upper_bounds_map,
            upper_bounds_groups: groups_attr(&upper_groups),
            steps: ints_attr(&steps),
            region,
            map_operands_ty: Type::Index,
            results: Vec::new(),
            attrs: p.opt_dict()?,
            loc: p.opt_loc()?,
        };
        Self::owned(op, p)
    }
}

/// `(%i, %j)` or `(3, 2)`: the comma-separated words inside parentheses, sigils stripped.
fn read_names(p: &mut Parser<'_, '_>) -> R<Vec<String>> {
    p.expect("(")?;
    let mut out = Vec::new();
    while !p.eat(")") {
        let word = match p.at(b'%') {
            true => String::from(p.sigil('%')?),
            false => format!("{}", p.attr()?.int().or_else(|e| p.err(e.0))?),
        };
        out.push(word);
        p.eat(",");
    }
    Ok(out)
}

/// `(0, %i + 1)`: one bound per induction variable, as a map and the values it names.
/// `(%i, min(%j + 32, 35))` ⇒ the bounds map, its operands, and how many expressions each bound has.
fn read_bounds<'a>(p: &mut Parser<'a, '_>) -> R<(Attribute<'static>, Vec<Value<'a>>, Vec<usize>)> {
    // `group` starts where the cursor is, so the space before `(` has to go first.
    p.ws();
    let group = p.group()?;
    let inner = group.get(1..group.len() - 1).unwrap_or_default();
    let (mut flat, mut groups) = (Vec::new(), Vec::new());
    for item in top_level(inner) {
        let item = item.trim();
        match item.strip_prefix("min(").or_else(|| item.strip_prefix("max(")).and_then(|r| r.strip_suffix(')')) {
            Some(list) => {
                let exprs = top_level(list);
                groups.push(exprs.len());
                flat.extend(exprs.into_iter().map(str::trim));
            }
            None => {
                groups.push(1);
                flat.push(item);
            }
        }
    }
    let Some((body, names)) = indices::read(&flat.join(", ")) else { return p.err("affine.parallel: a bound list") };
    let named = p.alias_named(&format!("affine_map<{body}>")).map(String::from);
    let mut values = Vec::new();
    for n in &names {
        match value_of(n) {
            Some(v) => values.push(v),
            None => return p.err("affine.parallel: a bound operand"),
        }
    }
    Ok((indices::attr(&body, named), values, groups))
}

/// `text` split at its top-level commas.
fn top_level(text: &str) -> Vec<&str> {
    let (mut parts, mut depth, mut start) = (Vec::new(), 0usize, 0);
    for (i, c) in text.char_indices() {
        match c {
            '(' | '[' => depth += 1,
            ')' | ']' => depth = depth.saturating_sub(1),
            ',' if depth == 0 => {
                parts.push(&text[start..i]);
                start = i + 1;
            }
            _ => {}
        }
    }
    parts.push(&text[start..]);
    parts
}

/// The bounds as printed: one expression as is, several as `word(e1, e2)`.
fn grouped(map: &Map<'_>, values: &[String], groups: &[usize], word: &str) -> String {
    let args = indices::args(map, values);
    let args: Vec<(&str, &str)> = args.iter().map(|(n, v)| (n.as_str(), v.as_str())).collect();
    let mut exprs = map.results.iter().map(|e| format!("{}", e.show(&args)));
    let parts: Vec<String> = groups
        .iter()
        .map(|&n| {
            let these: Vec<String> = exprs.by_ref().take(n).collect();
            if n == 1 { these.concat() } else { format!("{word}({})", these.join(", ")) }
        })
        .collect();
    parts.join(", ")
}
