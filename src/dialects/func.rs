//! `func`.

use alloc::string::String;
use alloc::vec;
use alloc::vec::Vec;
use core::fmt::{self, Write};

use crate::{Attribute, BlockArg, FunctionType, NamedAttr, Op, Parse, Print, Parser, Printer, R, Region, Type, Value, mlir};

#[mlir::op("func.return", format = "attr-dict ($operands^ `:` type($operands))?")]
pub struct Return<'a> {
    #[slot(types)]
    pub operands: Vec<Value<'a>>,
    pub types: Vec<Type<'a>>,
}

#[mlir::op("func.call", format = "$callee `(` $operands `)` attr-dict `:` functional-type($operands, $results)", results(results))]
pub struct Call<'a> {
    pub callee: Attribute<'a>,
    #[slot(arg_types)]
    pub operands: Vec<Value<'a>>,
    pub arg_types: Vec<Type<'a>>,
    pub results: Vec<Type<'a>>,
}

/// `func.func [visibility] @name(%arg: T {attrs}, ...) -> (R {attrs}, ...) attributes {...} { body }`:
/// hand-written syntax. The entry block's arguments are the signature's named arguments.
#[mlir::op("func.func", custom)]
pub struct FuncOp<'a> {
    pub sym_name: String,
    #[attr]
    pub function_type: Type<'a>,
    pub sym_visibility: Option<String>,
    /// One dictionary per argument.
    pub arg_attrs: Option<Attribute<'a>>,
    /// One dictionary per result.
    pub res_attrs: Option<Attribute<'a>>,
    pub body: Region<'a>,
}

impl<'a> FuncOp<'a> {
    /// The `i`th non-empty dictionary of `arg_attrs` / `res_attrs`.
    fn nth<'x>(attrs: &'x Option<Attribute<'a>>, i: usize) -> Option<&'x Attribute<'a>> {
        match attrs {
            Some(Attribute::Array(ds)) => ds.get(i).filter(|d| !matches!(d, Attribute::Dict(xs) if xs.is_empty())),
            _ => None,
        }
    }

    /// `Some([dicts])` unless every dictionary is empty.
    fn dicts(ds: Vec<Vec<NamedAttr<'a>>>) -> Option<Attribute<'a>> {
        ds.iter().any(|d| !d.is_empty()).then(|| Attribute::Array(ds.into_iter().map(Attribute::Dict).collect()))
    }
}


impl Print for FuncOp<'_> {
    fn print(&self, p: &mut Printer<'_, '_>) -> fmt::Result {
        let Type::Function(ty) = &self.function_type else { return Err(fmt::Error) };
        p.op_name(Self::NAME)?;
        if let Some(v) = &self.sym_visibility {
            write!(p, " {v}")?;
        }
        p.write_char(' ')?;
        p.sym_name(&self.sym_name)?;
        p.write_char('(')?;
        let entry = self.body.blocks.first();
        for (i, t) in ty.inputs.iter().enumerate() {
            p.write_str(if i > 0 { ", " } else { "" })?;
            let arg = entry.and_then(|b| b.args.get(i));
            match arg {
                Some(a) => write!(p, "%{}: {t}", a.name)?,
                None => write!(p, "{t}")?,
            }
            if let Some(d) = Self::nth(&self.arg_attrs, i) {
                write!(p, " {d}")?;
            }
            p.loc(&arg.and_then(|a| a.loc.clone()))?;
        }
        p.write_char(')')?;
        match ty.results.as_slice() {
            [] => {}
            [t] if Self::nth(&self.res_attrs, 0).is_none() && !matches!(t, Type::Function(_)) => write!(p, " -> {t}")?,
            ts => {
                p.write_str(" -> (")?;
                for (i, t) in ts.iter().enumerate() {
                    write!(p, "{}{t}", if i > 0 { ", " } else { "" })?;
                    if let Some(d) = Self::nth(&self.res_attrs, i) {
                        write!(p, " {d}")?;
                    }
                }
                p.write_char(')')?;
            }
        }
        p.attr_dict("attributes ", &self.attrs, &[])?;
        if !self.body.blocks.is_empty() {
            p.write_char(' ')?;
            p.region_in(Some("func"), &self.body, false)?;
        }
        p.loc(&self.loc)
    }
}

impl Parse for FuncOp<'_> {
    fn parse(p: &mut Parser<'_, '_>) -> R<Self> {
        let sym_visibility = ["private", "public", "nested"].into_iter().find(|v| p.eat_kw(v)).map(String::from);
        let sym_name = p.sym_name()?;
        p.expect("(")?;
        let entries = p.list(")", |p| {
            let named = if p.at(b'%') {
                let name = p.sigil('%')?.into();
                p.expect(":")?;
                Some(name)
            } else {
                None
            };
            let ty = p.ty()?;
            let attrs = p.opt_dict()?;
            let loc = p.opt_loc()?;
            Ok((named.map(|name| BlockArg { name, ty: ty.clone(), loc }), ty, attrs))
        })?;
        let results = if !p.eat("->") {
            Vec::new()
        } else if p.eat("(") {
            p.list(")", |p| Ok((p.ty()?, p.opt_dict()?)))?
        } else {
            vec![(p.ty()?, Vec::new())]
        };
        let attrs = if p.eat_kw("attributes") { p.dict()? } else { Vec::new() };
        let mut body = if p.at(b'{') { p.region_in(Some("func"))? } else { Region { blocks: Vec::new() } };
        let mut args = Vec::new();
        let (mut inputs, mut arg_dicts) = (Vec::new(), Vec::new());
        for (arg, ty, d) in entries {
            args.extend(arg);
            inputs.push(ty);
            arg_dicts.push(d);
        }
        if let Some(b) = body.blocks.first_mut() {
            b.label = (!args.is_empty()).then(|| "bb0".into());
            b.args = args;
        }
        let (results, res_dicts): (Vec<_>, Vec<_>) = results.into_iter().unzip();
        let op = FuncOp {
            sym_name,
            function_type: Type::Function(FunctionType { inputs, results }),
            sym_visibility,
            arg_attrs: FuncOp::dicts(arg_dicts),
            res_attrs: FuncOp::dicts(res_dicts),
            body,
            attrs,
            loc: p.opt_loc()?,
        };
        Self::owned(op, p)
    }
}

/// `%f = constant @symbol : (T) -> U`.
#[mlir::op("func.constant", format = "$value attr-dict `:` type($result)", results(result))]
pub struct Constant<'a> {
    pub value: Attribute<'a>,
    pub result: Type<'a>,
}

/// `call_indirect %f(%args) : (T) -> U`: the callee's function type gives every other type.
#[mlir::op("func.call_indirect", custom, results(results))]
pub struct CallIndirect<'a> {
    #[slot(callee_ty)]
    pub callee: Value<'a>,
    #[slot(arg_types, name = "calleeOperands")]
    pub callee_operands: Vec<Value<'a>>,
    pub callee_ty: Type<'a>,
    pub arg_types: Vec<Type<'a>>,
    pub results: Vec<Type<'a>>,
}


impl Print for CallIndirect<'_> {
    fn print(&self, p: &mut Printer<'_, '_>) -> fmt::Result {
        p.op_name(Self::NAME)?;
        write!(p, " {}(", self.callee)?;
        for (i, v) in self.callee_operands.iter().enumerate() {
            write!(p, "{}{v}", if i > 0 { ", " } else { "" })?;
        }
        p.write_char(')')?;
        p.attr_dict("", &self.attrs, &[])?;
        write!(p, " : {}", self.callee_ty)?;
        p.loc(&self.loc)
    }
}

impl Parse for CallIndirect<'_> {
    fn parse(p: &mut Parser<'_, '_>) -> R<Self> {
        let callee = p.value()?;
        p.expect("(")?;
        let callee_operands = p.list(")", Parser::value)?;
        let attrs = p.opt_dict()?;
        p.expect(":")?;
        let ty = p.fn_ty()?;
        let (arg_types, results) = (ty.inputs.clone(), ty.results.clone());
        let op = CallIndirect { callee, callee_operands, callee_ty: Type::Function(ty), arg_types, results, attrs, loc: p.opt_loc()? };
        Self::owned(op, p)
    }
}

/// The `func` dialect.
#[mlir::dialect(
    "func",
    ops = [FuncOp, Return, Call, Constant, CallIndirect],
    materializer
)]
pub struct FuncDialect;
