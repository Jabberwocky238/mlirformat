//! `builtin` ops.

use alloc::string::String;
use alloc::vec::Vec;
use core::fmt::{self, Write};

use crate::{Attribute, Block, NamedAttr, Op, Parse, Print, Parser, Printer, R, Region, Type, Value, mlir};

/// `module @name attributes {...} { ... }`: hand-written syntax.
#[mlir::op("builtin.module", custom)]
pub struct ModuleOp<'a> {
    pub sym_name: Option<String>,
    pub sym_visibility: Option<String>,
    pub body: Region<'a>,
}


impl Print for ModuleOp<'_> {
    fn print(&self, p: &mut Printer<'_, '_>) -> fmt::Result {
        p.op_name(Self::NAME)?;
        if let Some(name) = &self.sym_name {
            p.write_char(' ')?;
            p.sym_name(name)?;
        }
        // `($sym_name^)? attr-dict-with-keyword`: the visibility is not spelled, so it sits in the
        // dictionary among the discardable attributes, sorted by name.
        let mut attrs = self.attrs.clone();
        if let Some(v) = &self.sym_visibility {
            let at = attrs.partition_point(|a| *a.name < *"sym_visibility");
            attrs.insert(at, NamedAttr { name: "sym_visibility".into(), value: Some(Attribute::Str { lit: v.clone().into(), ty: None }) });
        }
        p.attr_dict("attributes ", &attrs, &[])?;
        p.write_char(' ')?;
        p.region_in(Some("builtin"), &self.body, false)?;
        p.loc(&self.loc)
    }
}

impl Parse for ModuleOp<'_> {
    fn parse(p: &mut Parser<'_, '_>) -> R<Self> {
        let sym_name = if p.at(b'@') { Some(p.sym_name()?) } else { None };
        let mut attrs: Vec<NamedAttr<'_>> = if p.eat_kw("attributes") { p.dict()? } else { Vec::new() };
        // An inherent attribute read from the dictionary is the property.
        let sym_visibility = attrs.iter().position(|a| a.name == "sym_visibility").and_then(|i| match attrs.remove(i).value {
            Some(Attribute::Str { lit, .. }) => Some(String::from(&*lit)),
            _ => None,
        });
        let mut body = p.region_in(Some("builtin"))?;
        // The body is one block, even an empty one (`^bb0:` in generic form).
        if body.blocks.is_empty() {
            body.blocks.push(Block { label: Some("bb0".into()), args: Vec::new(), ops: Vec::new() });
        }
        let loc = p.opt_loc()?;
        let body = p.lend(body);
        Self::owned(ModuleOp { sym_name, sym_visibility, body, attrs, loc }, p)
    }
}

#[mlir::op(
    "builtin.unrealized_conversion_cast",
    format = "($inputs^ `:` type($inputs))? `to` type($outputs) attr-dict",
    results(outputs)
)]
pub struct UnrealizedConversionCast<'a> {
    #[slot(input_types)]
    pub inputs: Vec<Value<'a>>,
    pub input_types: Vec<Type<'a>>,
    pub outputs: Vec<Type<'a>>,
}

/// The `builtin` dialect.
#[mlir::dialect(
    "builtin",
    ops = [ModuleOp, UnrealizedConversionCast]
)]
pub struct BuiltinDialect;
