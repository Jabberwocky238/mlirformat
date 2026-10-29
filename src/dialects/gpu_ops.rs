//! `gpu` 里 ODS 没描述语法的 op，手写后注入（`MlirOpt::upstream`），`gpu.gen.rs` 不动。
//!
//! - `gpu.func`：C++ 手写的语法（`GPUFuncOp::print` / `parse`），同 `func.func`，多出 `workgroup(...)` /
//!   `private(...)` 两组归属（入口块在函数形参之后的参数）与 `kernel` 关键字。
//! - `gpu.launch_func`：ODS 有格式，但用了三条 C++ 指令（`AsyncDependencies`、`LaunchDimType`、
//!   `LaunchFuncOperands`）；空格照 ODS 生成的打印器：每个元素前一个空格（`<` 前没有），空的指令照样占一个。
use crate::common::{Attribute, BlockArg, FunctionType, NamedAttr, Op, Parse, Print, Region, Str, Type, Value};
use crate::generator::{Printer, Sep};
use crate::mlir;
use crate::parser::{Parser, R};
use alloc::vec;
use alloc::vec::Vec;
use core::fmt::{self, Write};

/// `gpu.func @name(%a: T, ...) [-> R] [workgroup(%w : T, ...)] [private(%p : T, ...)] [kernel] [attributes {...}] { body }`。
///
/// `sym_name`、`gpu.kernel`、`workgroup_attributions` 是可丢弃属性（`mlir-opt` 的通用形式把它们写在 `{...}` 里），
/// 自定义形式把它们拆进头部；形参的 `{attrs}` 走 `arg_attrs` / `res_attrs`。
#[mlir::op("gpu.func", custom)]
pub struct Func<'a> {
    #[attr]
    pub function_type: Type<'a>,
    #[attr]
    pub arg_attrs: Option<Attribute<'a>>,
    #[attr]
    pub res_attrs: Option<Attribute<'a>>,
    #[attr]
    pub workgroup_attrib_attrs: Option<Attribute<'a>>,
    #[attr]
    pub private_attrib_attrs: Option<Attribute<'a>>,
    #[attr]
    pub known_block_size: Option<Attribute<'a>>,
    #[attr]
    pub known_grid_size: Option<Attribute<'a>>,
    #[attr]
    pub known_cluster_size: Option<Attribute<'a>>,
    #[region]
    pub body: Region<'a>,
}

/// 头部拆出去的三个可丢弃属性。
const HEAD: [&str; 3] = ["sym_name", "gpu.kernel", "workgroup_attributions"];

impl<'a> Func<'a> {
    /// 可丢弃属性 `name`。
    fn attr(&self, name: &str) -> Option<&Option<Attribute<'a>>> {
        self.attrs.iter().find(|a| a.name == name).map(|a| &a.value)
    }

    /// `workgroup_attributions` 的个数（没有 ⇒ 0）。
    fn workgroups(&self) -> Option<usize> {
        match self.attr("workgroup_attributions") {
            None => Some(0),
            Some(Some(Attribute::Int { lit, .. })) => lit.parse().ok(),
            Some(_) => None,
        }
    }

    /// `i` 号形参 / 结果的非空字典。
    fn nth<'x>(attrs: &'x Option<Attribute<'a>>, i: usize) -> Option<&'x Attribute<'a>> {
        match attrs {
            Some(Attribute::Array(ds)) => ds.get(i).filter(|d| !matches!(d, Attribute::Dict(xs) if xs.is_empty())),
            _ => None,
        }
    }

    /// `Some([dicts])`，除非每个字典都是空的。
    fn dicts(ds: Vec<Vec<NamedAttr<'a>>>) -> Option<Attribute<'a>> {
        ds.iter().any(|d| !d.is_empty()).then(|| Attribute::Array(ds.into_iter().map(Attribute::Dict).collect()))
    }

    /// `workgroup(%w : T, ...)`：一组归属（空的不印）。
    fn attributions(p: &mut Printer<'_, '_>, keyword: &str, args: &[BlockArg<'_>]) -> fmt::Result {
        if args.is_empty() {
            return Ok(());
        }
        write!(p, " {keyword}(")?;
        for (i, a) in args.iter().enumerate() {
            write!(p, "{}%{} : {}", if i > 0 { ", " } else { "" }, a.name, a.ty)?;
        }
        p.write_char(')')
    }

    /// 读一组归属：`(%w : T, ...)`。
    fn parse_attributions(p: &mut Parser<'a, '_>, keyword: &str) -> R<Vec<BlockArg<'a>>> {
        if !p.eat_kw(keyword) {
            return Ok(Vec::new());
        }
        p.expect("(")?;
        p.list(")", |p| {
            let name = p.sigil('%')?.into();
            p.expect(":")?;
            Ok(BlockArg { name, ty: p.ty()?, loc: None })
        })
    }
}

impl Print for Func<'_> {
    fn print(&self, p: &mut Printer<'_, '_>) -> fmt::Result {
        // ⛔ 没有 workgroup_attributions 的（通用形式写进来的）：自定义形式读回去总会补上它，往返不一致 ⇒ 走通用形式。
        let (Type::Function(ty), Some(Some(Attribute::Str { lit: name, .. })), Some(_), Some(workgroups)) = (&self.function_type, self.attr("sym_name"), self.attr("workgroup_attributions"), self.workgroups()) else {
            return self.print_generic(p);
        };
        let entry = self.body.blocks.first();
        let args = entry.map_or(&[][..], |b| b.args.as_slice());
        // ⛔ 归属的字典、known_* 的写法没核过：有就走通用形式，不猜。
        let odd = self.workgroup_attrib_attrs.is_some() || self.private_attrib_attrs.is_some() || self.known_block_size.is_some() || self.known_grid_size.is_some() || self.known_cluster_size.is_some();
        if odd || args.len() < ty.inputs.len() + workgroups {
            return self.print_generic(p);
        }
        p.op_name(Self::NAME)?;
        p.write_char(' ')?;
        p.sym_name(name)?;
        p.write_char('(')?;
        for (i, t) in ty.inputs.iter().enumerate() {
            p.write_str(if i > 0 { ", " } else { "" })?;
            match args.get(i) {
                Some(a) => write!(p, "%{}: {t}", a.name)?,
                None => write!(p, "{t}")?,
            }
            if let Some(d) = Self::nth(&self.arg_attrs, i) {
                write!(p, " {d}")?;
            }
            p.loc(&args.get(i).and_then(|a| a.loc.clone()))?;
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
        let extra = &args[ty.inputs.len()..];
        let (workgroup, private) = extra.split_at(workgroups);
        Self::attributions(p, "workgroup", workgroup)?;
        Self::attributions(p, "private", private)?;
        if self.attr("gpu.kernel").is_some() {
            p.write_str(" kernel")?;
        }
        p.attr_dict("attributes ", &self.attrs, &HEAD)?;
        p.write_char(' ')?;
        p.region(&self.body, false)?;
        p.loc(&self.loc)
    }
}

impl Parse for Func<'_> {
    fn parse(p: &mut Parser<'_, '_>) -> R<Self> {
        let sym_name = p.sym_name()?;
        p.expect("(")?;
        let entries = p.list(")", |p| {
            let name = p.sigil('%')?.into();
            p.expect(":")?;
            let ty = p.ty()?;
            let attrs = p.opt_dict()?;
            let loc = p.opt_loc()?;
            Ok((BlockArg { name, ty: ty.clone(), loc }, ty, attrs))
        })?;
        let results = if !p.eat("->") {
            Vec::new()
        } else if p.eat("(") {
            p.list(")", |p| Ok((p.ty()?, p.opt_dict()?)))?
        } else {
            vec![(p.ty()?, Vec::new())]
        };
        let workgroup = Func::parse_attributions(p, "workgroup")?;
        let private = Func::parse_attributions(p, "private")?;
        let kernel = p.eat_kw("kernel");
        let mut attrs = if p.eat_kw("attributes") { p.dict()? } else { Vec::new() };
        let mut body = p.region()?;
        let (mut args, mut inputs, mut arg_dicts) = (Vec::new(), Vec::new(), Vec::new());
        for (arg, ty, d) in entries {
            args.push(arg);
            inputs.push(ty);
            arg_dicts.push(d);
        }
        attrs.push(NamedAttr { name: "sym_name".into(), value: Some(Attribute::Str { lit: Str::Owned(sym_name), ty: None }) });
        if kernel {
            attrs.push(NamedAttr { name: "gpu.kernel".into(), value: None });
        }
        attrs.push(NamedAttr { name: "workgroup_attributions".into(), value: Some(Attribute::Int { lit: Str::Owned(alloc::format!("{}", workgroup.len())), ty: Some(Type::int(64)) }) });
        attrs.sort_by(|a, b| a.name.cmp(&b.name));
        args.extend(workgroup);
        args.extend(private);
        if let Some(b) = body.blocks.first_mut() {
            b.label = (!args.is_empty()).then(|| "bb0".into());
            b.args = args;
        }
        let (results, res_dicts): (Vec<_>, Vec<_>) = results.into_iter().unzip();
        let op = Func {
            function_type: Type::Function(FunctionType { inputs, results }),
            arg_attrs: Func::dicts(arg_dicts),
            res_attrs: Func::dicts(res_dicts),
            workgroup_attrib_attrs: None,
            private_attrib_attrs: None,
            known_block_size: None,
            known_grid_size: None,
            known_cluster_size: None,
            body,
            attrs,
            loc: p.opt_loc()?,
        };
        Self::owned(op, p)
    }
}

/// `gpu.launch_func [async] [[%deps]] [<%obj : T>] @m::@k [clusters in (x, y, z)] blocks in (x, y, z)
/// threads in (x, y, z) [: T] [dynamic_shared_memory_size %s] [args(%a : T, ...)] {attrs}`。
#[mlir::op("gpu.launch_func", custom, results(async_token))]
pub struct LaunchFunc<'a> {
    #[slot(async_dependencies_ty, name = "asyncDependencies")]
    pub async_dependencies: Vec<Value<'a>>,
    #[slot(grid_size_x_ty, name = "gridSizeX")]
    pub grid_size_x: Value<'a>,
    #[slot(grid_size_x_ty, name = "gridSizeY")]
    pub grid_size_y: Value<'a>,
    #[slot(grid_size_x_ty, name = "gridSizeZ")]
    pub grid_size_z: Value<'a>,
    #[slot(grid_size_x_ty, name = "blockSizeX")]
    pub block_size_x: Value<'a>,
    #[slot(grid_size_x_ty, name = "blockSizeY")]
    pub block_size_y: Value<'a>,
    #[slot(grid_size_x_ty, name = "blockSizeZ")]
    pub block_size_z: Value<'a>,
    #[slot(cluster_size_x_ty, name = "clusterSizeX")]
    pub cluster_size_x: Vec<Value<'a>>,
    #[slot(cluster_size_y_ty, name = "clusterSizeY")]
    pub cluster_size_y: Vec<Value<'a>>,
    #[slot(cluster_size_z_ty, name = "clusterSizeZ")]
    pub cluster_size_z: Vec<Value<'a>>,
    #[slot(dynamic_shared_memory_size_ty, name = "dynamicSharedMemorySize")]
    pub dynamic_shared_memory_size: Vec<Value<'a>>,
    #[slot(kernel_operands_ty, name = "kernelOperands")]
    pub kernel_operands: Vec<Value<'a>>,
    #[slot(async_object_ty, name = "asyncObject")]
    pub async_object: Vec<Value<'a>>,
    #[attr]
    pub kernel: Attribute<'a>,
    #[dtype(name = "asyncDependencies_ty")]
    pub async_dependencies_ty: Vec<Type<'a>>,
    #[dtype(name = "gridSizeX_ty")]
    pub grid_size_x_ty: Type<'a>,
    #[dtype(name = "clusterSizeX_ty")]
    pub cluster_size_x_ty: Vec<Type<'a>>,
    #[dtype(name = "clusterSizeY_ty")]
    pub cluster_size_y_ty: Vec<Type<'a>>,
    #[dtype(name = "clusterSizeZ_ty")]
    pub cluster_size_z_ty: Vec<Type<'a>>,
    #[dtype(name = "dynamicSharedMemorySize_ty", is = i32)]
    pub dynamic_shared_memory_size_ty: Type<'a>,
    #[dtype(name = "kernelOperands_ty")]
    pub kernel_operands_ty: Vec<Type<'a>>,
    #[dtype(name = "asyncObject_ty")]
    pub async_object_ty: Vec<Type<'a>>,
    #[dtype(name = "asyncToken")]
    pub async_token: Vec<Type<'a>>,
}

impl<'a> LaunchFunc<'a> {
    /// `!gpu.async.token`。
    fn token() -> Type<'a> {
        Type::Extended(crate::common::Extended { name: "gpu.async.token".into(), body: None, params: Vec::new() })
    }

    /// `(%x, %y, %z)`。
    fn triple(p: &mut Parser<'a, '_>) -> R<[Value<'a>; 3]> {
        p.expect("(")?;
        let x = p.value()?;
        p.expect(",")?;
        let y = p.value()?;
        p.expect(",")?;
        let z = p.value()?;
        p.expect(")")?;
        Ok([x, y, z])
    }
}

impl Print for LaunchFunc<'_> {
    fn print(&self, p: &mut Printer<'_, '_>) -> fmt::Result {
        let clusters = [&self.cluster_size_x, &self.cluster_size_y, &self.cluster_size_z];
        let regular = clusters.iter().all(|c| c.len() == clusters[0].len() && c.len() <= 1)
            && self.async_object.len() <= 1
            && self.dynamic_shared_memory_size.len() <= 1
            && [&self.cluster_size_x_ty, &self.cluster_size_y_ty, &self.cluster_size_z_ty].iter().all(|t| t.iter().all(|t| *t == self.grid_size_x_ty));
        if !regular {
            return self.print_generic(p);
        }
        p.op_name(Self::NAME)?;
        p.write_char(' ')?;
        // custom<AsyncDependencies>
        if !self.async_token.is_empty() {
            p.write_str("async")?;
        }
        if !self.async_dependencies.is_empty() {
            write!(p, "{}[{}]", if self.async_token.is_empty() { "" } else { " " }, Sep(&self.async_dependencies, ", "))?;
        }
        if let (Some(o), Some(t)) = (self.async_object.first(), self.async_object_ty.first()) {
            write!(p, "<{o} : {t}>")?;
        }
        write!(p, " {}", self.kernel)?;
        if let [x] = self.cluster_size_x.as_slice() {
            write!(p, " clusters in ({x}, {}, {})", self.cluster_size_y[0], self.cluster_size_z[0])?;
        }
        write!(p, " blocks in ({}, {}, {})", self.grid_size_x, self.grid_size_y, self.grid_size_z)?;
        write!(p, " threads in ({}, {}, {})", self.block_size_x, self.block_size_y, self.block_size_z)?;
        // custom<LaunchDimType>
        p.write_char(' ')?;
        if self.grid_size_x_ty != Type::Index {
            write!(p, ": {}", self.grid_size_x_ty)?;
        }
        if let [s] = self.dynamic_shared_memory_size.as_slice() {
            write!(p, " dynamic_shared_memory_size {s}")?;
        }
        // custom<LaunchFuncOperands>
        p.write_char(' ')?;
        if !self.kernel_operands.is_empty() {
            p.write_str("args(")?;
            for (i, (v, t)) in self.kernel_operands.iter().zip(&self.kernel_operands_ty).enumerate() {
                write!(p, "{}{v} : {t}", if i > 0 { ", " } else { "" })?;
            }
            p.write_char(')')?;
        }
        p.attr_dict("", &self.attrs, &[])?;
        p.loc(&self.loc)
    }
}

impl Parse for LaunchFunc<'_> {
    fn parse(p: &mut Parser<'_, '_>) -> R<Self> {
        let async_token = if p.eat_kw("async") { vec![LaunchFunc::token()] } else { Vec::new() };
        let async_dependencies = if p.eat("[") { p.list("]", Parser::value)? } else { Vec::new() };
        let (mut async_object, mut async_object_ty) = (Vec::new(), Vec::new());
        if p.eat("<") {
            async_object.push(p.value()?);
            p.expect(":")?;
            async_object_ty.push(p.ty()?);
            p.expect(">")?;
        }
        let kernel = p.attr()?;
        let clusters = if p.eat_kw("clusters") {
            p.expect_lit("in")?;
            Some(LaunchFunc::triple(p)?)
        } else {
            None
        };
        p.expect_lit("blocks")?;
        p.expect_lit("in")?;
        let [grid_size_x, grid_size_y, grid_size_z] = LaunchFunc::triple(p)?;
        p.expect_lit("threads")?;
        p.expect_lit("in")?;
        let [block_size_x, block_size_y, block_size_z] = LaunchFunc::triple(p)?;
        let grid_size_x_ty = if p.eat(":") { p.ty()? } else { Type::Index };
        let dynamic_shared_memory_size = if p.eat_kw("dynamic_shared_memory_size") { vec![p.value()?] } else { Vec::new() };
        let (mut kernel_operands, mut kernel_operands_ty) = (Vec::new(), Vec::new());
        if p.eat_kw("args") {
            p.expect("(")?;
            for (v, t) in p.list(")", |p| {
                let v = p.value()?;
                p.expect(":")?;
                Ok((v, p.ty()?))
            })? {
                kernel_operands.push(v);
                kernel_operands_ty.push(t);
            }
        }
        let attrs = p.opt_dict()?;
        let cluster_ty = if clusters.is_some() { vec![grid_size_x_ty.clone()] } else { Vec::new() };
        let [cluster_size_x, cluster_size_y, cluster_size_z] = clusters.map_or_else(|| [Vec::new(), Vec::new(), Vec::new()], |c| c.map(|v| vec![v]));
        let op = LaunchFunc {
            async_dependencies_ty: vec![LaunchFunc::token(); async_dependencies.len()],
            async_dependencies,
            grid_size_x,
            grid_size_y,
            grid_size_z,
            block_size_x,
            block_size_y,
            block_size_z,
            cluster_size_x,
            cluster_size_y,
            cluster_size_z,
            dynamic_shared_memory_size,
            kernel_operands,
            async_object,
            kernel,
            grid_size_x_ty,
            cluster_size_x_ty: cluster_ty.clone(),
            cluster_size_y_ty: cluster_ty.clone(),
            cluster_size_z_ty: cluster_ty,
            dynamic_shared_memory_size_ty: Type::int(32),
            kernel_operands_ty,
            async_object_ty,
            async_token,
            attrs,
            loc: p.opt_loc()?,
        };
        Self::owned(op, p)
    }
}
