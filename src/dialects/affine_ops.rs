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
use crate::common::{Attribute, Content, Extended, Op, Operation, Shaped, Str, Type, Value};
use crate::generator::Printer;
use crate::parser::{Parser, R};
use alloc::string::String;
use alloc::format;
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

/// The index list of an `affine` memory op: the map's results written against the operands,
/// `%A[%i + 1, 0]`. Read back, each `%value` becomes a dimension in the order it first appears.
mod indices {
    use super::{Attribute, Extended, Map, Str, Value, format};
    use alloc::string::String;
    use alloc::vec::Vec;

    /// `%i + 1, 0` ⇒ the map it stands for and the values it names, dimensions in first-seen
    /// order. Symbols are never produced: which operands are symbols is not in the text at all
    /// (MLIR decides it from where each value comes from), so an op whose map has symbols keeps
    /// the generic form instead — see the module's documentation.
    pub fn read(text: &str) -> Option<(String, Vec<String>)> {
        let (mut names, mut out) = (Vec::new(), String::new());
        let b = text.as_bytes();
        let mut i = 0;
        while i < b.len() {
            if b[i] != b'%' {
                out.push(char::from(b[i]));
                i += 1;
                continue;
            }
            let start = i;
            i += 1;
            while i < b.len() && (b[i].is_ascii_alphanumeric() || matches!(b[i], b'_' | b'$' | b'.' | b'#')) {
                i += 1;
            }
            let name = &text[start..i];
            let at = names.iter().position(|n| n == name).unwrap_or_else(|| {
                names.push(String::from(name));
                names.len() - 1
            });
            out.push_str(&format!("d{at}"));
        }
        let dims = (0..names.len()).map(|k| format!("d{k}")).collect::<Vec<_>>().join(", ");
        let body = format!("({dims}) -> ({out})");
        Map::try_from(body.as_str()).ok()?;
        Some((body, names))
    }

    /// The attribute for a map body: the alias that already spells it, else the map written out.
    pub fn attr<'a>(body: &str, named: Option<String>) -> Attribute<'a> {
        match named {
            Some(name) => Attribute::Extended { ext: Extended { name: Str::Owned(name), body: None, params: Vec::new() }, ty: None },
            None => Attribute::Builtin { name: Str::Borrowed("affine_map"), body: Str::Owned(format!("<{body}>")), ty: None },
        }
    }

    /// `d0` ⇒ the operand it stands for, as [`Map`] substitution wants it.
    pub fn args<'t>(map: &'t Map<'t>, values: &'t [String]) -> Vec<(&'t str, &'t str)> {
        map.dims.iter().chain(map.syms.iter().flatten()).zip(values).map(|(name, v)| (*name, &**v)).collect()
    }

    /// The index list as it is printed: the map's results against the operands.
    pub fn write(map: &Map<'_>, values: &[String]) -> String {
        let args = args(map, values);
        map.results.iter().map(|e| format!("{}", e.show(&args))).collect::<Vec<_>>().join(", ")
    }

    /// Every operand's text, for [`args`].
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
/// have leaves its flat operand list with no way to split.
macro_rules! memory_ops {
    ($($ty:ident = $name:literal, $doc:literal, $($value:ident)?;)*) => {$(
        #[doc = $doc]
        #[mlir::op($name, custom, results(result))]
        pub struct $ty<'a> {
            $(#[slot(result, name = "value")]
            pub $value: Value<'a>,)?
            #[slot(memref_ty, name = "memref")]
            pub memref: Value<'a>,
            #[slot(indices_ty, name = "indices")]
            pub indices: Vec<Value<'a>>,
            #[attr(name = "map")]
            pub map: Attribute<'a>,
            #[dtype(name = "memref_ty")]
            pub memref_ty: Type<'a>,
            #[dtype(name = "indices_ty", is = index)]
            pub indices_ty: Type<'a>,
            #[dtype(name = "result", el = memref_ty)]
            pub result: Type<'a>,
        }

        impl Op for $ty<'_> {
            const NAME: &'static str = $name;
            const FORMAT: &'static str = "";

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
                    return p.generic(&Operation::of_op(self).map_err(|_| fmt::Error)?);
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
                    return p.generic(&Operation::of_op(self).map_err(|_| fmt::Error)?);
                }
                p.op_name(Self::NAME)?;
                p.write_char(' ')?;
                $(write!(p, "{}, ", self.$value)?;)?
                write!(p, "{}[{list}]", self.memref)?;
                p.attr_dict("", &self.attrs, &[])?;
                write!(p, " : {}", self.memref_ty)
            }

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
                Content::convert(&op).or_else(|e| p.err(e.0))
            }
        }
    )*};
}

memory_ops! {
    Load = "affine.load", "`affine.load %A[%i + 1]`: the map's results against the operands.",;
    Store = "affine.store", "`affine.store %v, %A[%i + 1]`: the value stored where the map says.", value;
}
