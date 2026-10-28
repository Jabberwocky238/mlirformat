//! `linalg` 里 ODS 没描述语法的 op，手写后注入（`MlirOpt::upstream`），`linalg.gen.rs` 不动。
//!
//! 照 `LinalgOps.cpp` 的 `GenericOp::print / parse`：
//!
//! ```text
//! linalg.generic {indexing_maps = [..], iterator_types = ["parallel", ..]}
//!     ins(%a, %b : T, U) outs(%c : V) attrs =  {extra} {
//! ^bb0(%x: f32, ..):
//!   ...
//! } -> tensor<..>
//! ```
//!
//! 前面的字典只放 linalg 的特征属性（doc / indexing_maps / iterator_types / library_call，按名字排）；
//! iterator_types 在 IR 里是 `#linalg.iterator_type<parallel>`，写出来是字符串。别的属性写在 `attrs =` 后面
//! （两个空格：一个是 `attrs = ` 自带的，一个是 `printOptionalAttrDict` 的）。
use crate::common::{Attribute, Extended, NamedAttr, Op, Parse, Print, Region, Str, Type, Value};
use crate::generator::{Printer, Sep};
use crate::mlir;
use crate::parser::{Parser, R};
use alloc::string::String;
use alloc::vec::Vec;
use core::fmt::{self, Write};

/// `linalg.generic`。
#[mlir::op("linalg.generic", custom, results(result_tensors))]
pub struct Generic<'a> {
    #[slot(inputs_ty, name = "inputs")]
    pub inputs: Vec<Value<'a>>,
    #[slot(outputs_ty, name = "outputs")]
    pub outputs: Vec<Value<'a>>,
    #[attr(name = "indexing_maps")]
    pub indexing_maps: Attribute<'a>,
    #[attr(name = "iterator_types")]
    pub iterator_types: Attribute<'a>,
    #[attr(name = "doc")]
    pub doc: Option<Attribute<'a>>,
    #[attr(name = "library_call")]
    pub library_call: Option<Attribute<'a>>,
    #[region(name = "region")]
    pub region: Region<'a>,
    #[dtype(name = "inputs_ty")]
    pub inputs_ty: Vec<Type<'a>>,
    #[dtype(name = "outputs_ty")]
    pub outputs_ty: Vec<Type<'a>>,
    #[dtype(name = "result_tensors")]
    pub result_tensors: Vec<Type<'a>>,
}

impl<'a> Generic<'a> {
    /// `#linalg.iterator_type<parallel>` ⇒ `"parallel"`（写出来的样子）；不是这个形状的 ⇒ `None`。
    fn iterator_names(types: &Attribute<'_>) -> Option<Vec<String>> {
        let Attribute::Array(xs) = types else { return None };
        xs.iter()
            .map(|x| match x {
                Attribute::Extended { ext: Extended { name, body: Some(b), .. }, .. } if name == "linalg.iterator_type" => {
                    b.strip_prefix('<').and_then(|b| b.strip_suffix('>')).map(String::from)
                }
                _ => None,
            })
            .collect()
    }

    /// `"parallel"` ⇒ `#linalg.iterator_type<parallel>`（读进来的样子）。
    fn iterator_types(names: &Attribute<'a>) -> Option<Attribute<'a>> {
        let Attribute::Array(xs) = names else { return None };
        let types = xs.iter().map(|x| match x {
            Attribute::Str { lit, ty: None } => Some(Attribute::Extended { ext: Extended { name: Str::Borrowed("linalg.iterator_type"), body: Some(Str::Owned(alloc::format!("<{lit}>"))), params: Vec::new() }, ty: None }),
            _ => None,
        });
        types.collect::<Option<_>>().map(Attribute::Array)
    }

    /// `ins(%a, %b : T, U)` 之类：值、冒号、类型。
    fn operands(p: &mut Parser<'a, '_>) -> R<(Vec<Value<'a>>, Vec<Type<'a>>)> {
        p.expect("(")?;
        let mut values = alloc::vec![p.value()?];
        while p.eat(",") {
            values.push(p.value()?);
        }
        p.expect(":")?;
        let types = p.list(")", |p| p.ty())?;
        Ok((values, types))
    }
}

impl Print for Generic<'_> {
    fn print(&self, p: &mut Printer<'_, '_>) -> fmt::Result {
        let Some(names) = Self::iterator_names(&self.iterator_types) else { return self.print_generic(p) };
        p.op_name(Self::NAME)?;
        p.write_str(" {")?;
        if let Some(d) = &self.doc {
            write!(p, "doc = {d}, ")?;
        }
        write!(p, "indexing_maps = {}, iterator_types = [", self.indexing_maps)?;
        for (i, n) in names.iter().enumerate() {
            write!(p, "{}\"{n}\"", if i > 0 { ", " } else { "" })?;
        }
        p.write_char(']')?;
        if let Some(l) = &self.library_call {
            write!(p, ", library_call = {l}")?;
        }
        p.write_char('}')?;
        if !self.inputs.is_empty() {
            write!(p, " ins({} : {})", Sep(&self.inputs, ", "), Sep(&self.inputs_ty, ", "))?;
        }
        if !self.outputs.is_empty() {
            write!(p, " outs({} : {})", Sep(&self.outputs, ", "), Sep(&self.outputs_ty, ", "))?;
        }
        p.attr_dict("attrs =  ", &self.attrs, &[])?;
        if !self.region.blocks.is_empty() {
            p.write_char(' ')?;
            p.region(&self.region, true)?;
        }
        match &self.result_tensors[..] {
            [] => {}
            [t] => write!(p, " -> {t}")?,
            ts => write!(p, " -> ({})", Sep(ts, ", "))?,
        }
        p.loc(&self.loc)
    }
}

impl Parse for Generic<'_> {
    fn parse(p: &mut Parser<'_, '_>) -> R<Self> {
        let (mut indexing_maps, mut iterator_types, mut doc, mut library_call, mut attrs) = (None, None, None, None, Vec::new());
        for a in p.dict()? {
            match (&*a.name, a.value) {
                ("indexing_maps", Some(v)) => indexing_maps = Some(v),
                ("iterator_types", Some(v)) => iterator_types = Generic::iterator_types(&v),
                ("doc", Some(v)) => doc = Some(v),
                ("library_call", Some(v)) => library_call = Some(v),
                (name, value) => attrs.push(NamedAttr { name: Str::Owned(String::from(name)), value }),
            }
        }
        let (Some(indexing_maps), Some(iterator_types)) = (indexing_maps, iterator_types) else {
            return p.err("linalg.generic: indexing_maps and iterator_types (strings)");
        };
        attrs.extend(p.opt_dict()?);
        let (inputs, inputs_ty) = if p.eat_kw("ins") { Generic::operands(p)? } else { (Vec::new(), Vec::new()) };
        let (outputs, outputs_ty) = if p.eat_kw("outs") { Generic::operands(p)? } else { (Vec::new(), Vec::new()) };
        if p.eat_kw("attrs") {
            p.expect("=")?;
            attrs.extend(p.opt_dict()?);
        }
        let region = p.region()?;
        let result_tensors = if p.eat("->") { p.results_ty()? } else { Vec::new() };
        let op = Generic { inputs, outputs, indexing_maps, iterator_types, doc, library_call, region, inputs_ty, outputs_ty, result_tensors, attrs, loc: p.opt_loc()? };
        Self::owned(&op, p)
    }
}
