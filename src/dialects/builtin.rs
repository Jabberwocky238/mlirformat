//! `builtin` ops.

use alloc::string::String;
use alloc::vec::Vec;
use core::fmt::{self, Write};

use crate::{Block, Content, NamedAttr, Op, Parse, Print, Parser, Printer, R, Region, Type, Value, mlir};

/// `module @name attributes {...} { ... }`: hand-written syntax.
#[mlir::op("builtin.module", custom)]
pub struct ModuleOp<'a> {
    #[attr(name = "sym_name")]
    pub sym_name: Option<String>,
    #[attr(name = "sym_visibility")]
    pub sym_visibility: Option<String>,
    #[region]
    pub body: Region<'a>,
}

impl Op for ModuleOp<'_> {
    const NAME: &'static str = "builtin.module";
    const FORMAT: &'static str = "";
}

impl Print for ModuleOp<'_> {
    fn print(&self, p: &mut Printer<'_, '_>) -> fmt::Result {
        p.op_name(Self::NAME)?;
        if let Some(v) = &self.sym_visibility {
            write!(p, " {v}")?;
        }
        if let Some(name) = &self.sym_name {
            p.write_char(' ')?;
            p.sym_name(name)?;
        }
        p.attr_dict("attributes ", &self.attrs, &[])?;
        p.write_char(' ')?;
        p.region_in(Some("builtin"), &self.body, false)?;
        p.loc(&self.loc)
    }
}

impl Parse for ModuleOp<'_> {
    fn parse(p: &mut Parser<'_, '_>) -> R<Self> {
        let sym_visibility = ["private", "public", "nested"].into_iter().find(|v| p.eat_kw(v)).map(String::from);
        let sym_name = if p.at(b'@') { Some(p.sym_name()?) } else { None };
        let attrs: Vec<NamedAttr<'_>> = if p.eat_kw("attributes") { p.dict()? } else { Vec::new() };
        let mut body = p.region_in(Some("builtin"))?;
        // The body is one block, even an empty one (`^bb0:` in generic form).
        if body.blocks.is_empty() {
            body.blocks.push(Block { label: Some("bb0".into()), args: Vec::new(), ops: Vec::new() });
        }
        let loc = p.opt_loc()?;
        Content::convert(&ModuleOp { sym_name, sym_visibility, body, attrs, loc }).or_else(|e| p.err(e.0))
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
    #[dtype]
    pub input_types: Vec<Type<'a>>,
    #[dtype]
    pub outputs: Vec<Type<'a>>,
}

/// The `builtin` dialect.
#[mlir::dialect("builtin")]
pub enum Builtin<'a> {
    Module(ModuleOp<'a>),
    UnrealizedConversionCast(UnrealizedConversionCast<'a>),
}
