//! `scf` 里 ODS 没描述语法的 op，手写后注入（`MlirOpt::upstream`），`scf.gen.rs` 不动。
//!
//! 和 `affine` 那边同一套路：归纳变量与迭代参数是区域入口块的参数，写在头部而不是
//! `^bb0(...)`；收尾的 `scf.yield` 不带操作数时不印（⛔ `scf.while` 的会印，那是另一个 op）。
use crate::common::{Block, BlockArg, Op, Operation, Parse, Print, Region, Str, Type, Value};
use crate::generator::{Printer, Sep};
use crate::mlir;
use crate::parser::{Parser, R};
use alloc::string::String;
use alloc::vec::Vec;
use core::fmt::{self, Write};

/// 把区域的自定义形式省掉的东西放回去：只剩终结符时连块都没有，终结符不带东西时不印。
fn close_region(r: &mut Region<'_>, terminator: &str) {
    if r.blocks.is_empty() {
        r.blocks.push(Block { label: None, args: Vec::new(), ops: Vec::new() });
    }
    if let Some(b) = r.blocks.last_mut()
        && !b.ops.last().is_some_and(|op| op.name == terminator)
    {
        // The parser left `ops` exactly full: a plain push would double it.
        b.ops.reserve_exact(1);
        b.ops.push(Operation { name: Str::Owned(String::from(terminator)), ..Operation::default() });
    }
}

/// `scf.for %i = %lb to %ub step %s iter_args(%a = %init) -> (T)  : i32 { ... }`。
///
/// 边界就是三个普通 SSA 值（⛔ 不像 `affine.for` 那样是映射）。归纳变量不是 `index`
/// 时末尾补 `  : 类型` —— 两个空格，`mlir-opt` 就是这么印的。
#[mlir::op("scf.for", custom, results(results))]
pub struct For<'a> {
    #[slot(lower_bound_ty, name = "lowerBound")]
    pub lower_bound: Value<'a>,
    #[slot(lower_bound_ty, name = "upperBound")]
    pub upper_bound: Value<'a>,
    #[slot(lower_bound_ty)]
    pub step: Value<'a>,
    #[slot(results, name = "initArgs")]
    pub init_args: Vec<Value<'a>>,
    #[attr(name = "unsignedCmp")]
    pub unsigned_cmp: bool,
    pub region: Region<'a>,
    #[dtype(name = "lowerBound_ty")]
    pub lower_bound_ty: Type<'a>,
    pub results: Vec<Type<'a>>,
}


impl Print for For<'_> {
    fn print(&self, p: &mut Printer<'_, '_>) -> fmt::Result {
        let entry = self.region.blocks.first();
        let shaped = entry.filter(|b| b.args.len() == 1 + self.init_args.len() && self.results.len() == self.init_args.len());
        let Some(entry) = shaped else {
            return self.print_generic(p);
        };
        p.op_name(Self::NAME)?;
        // `ForOp::print`: `unsigned` first, and left out of the dictionary.
        if self.unsigned_cmp {
            p.write_str(" unsigned")?;
        }
        write!(p, " %{} = {} to {} step {}", entry.args[0].name, self.lower_bound, self.upper_bound, self.step)?;
        if !self.init_args.is_empty() {
            p.write_str(" iter_args(")?;
            for (i, (a, v)) in entry.args[1..].iter().zip(&self.init_args).enumerate() {
                write!(p, "{}%{} = {v}", if i > 0 { ", " } else { "" }, a.name)?;
            }
            write!(p, ") -> ({})", Sep(&self.results, ", "))?;
        }
        // ⛔ 次序照 mlir-opt：可选的 `: 类型` 在区域**之前**，属性字典在区域**之后**。
        // 字典若排在区域前面，紧跟的 `{` 会被 `opt_dict` 当成空字典吃掉，区域就没了。
        // 那两个空格也不是空字典印的，是一个无条件空格加 `" : "`。
        p.write_char(' ')?;
        if self.lower_bound_ty != Type::Index {
            write!(p, " : {} ", self.lower_bound_ty)?;
        }
        p.region_body(&self.region, "scf.yield")?;
        p.attr_dict("", &self.attrs, &[])
    }
}

impl Parse for For<'_> {
    fn parse(p: &mut Parser<'_, '_>) -> R<Self> {
        let unsigned_cmp = p.eat_kw("unsigned");
        let iv = String::from(p.sigil('%')?);
        p.expect("=")?;
        let lower_bound = p.value()?;
        p.expect_lit("to")?;
        let upper_bound = p.value()?;
        p.expect_lit("step")?;
        let step = p.value()?;
        let (mut names, mut init_args) = (Vec::new(), Vec::new());
        if p.eat_kw("iter_args") {
            p.expect("(")?;
            while !p.eat(")") {
                names.push(String::from(p.sigil('%')?));
                p.expect("=")?;
                init_args.push(p.value()?);
                p.eat(",");
            }
        }
        let results = match p.eat("->") {
            true => p.results_ty()?,
            false => Vec::new(),
        };
        let lower_bound_ty = match p.eat(":") {
            true => p.ty()?,
            false => Type::Index,
        };
        let mut region = p.region()?;
        let attrs = p.opt_dict()?;
        close_region(&mut region, "scf.yield");
        if let Some(b) = region.blocks.first_mut() {
            // 头部点了名，所以通用形式里这个块是有标号的。
            b.label.get_or_insert(Str::Borrowed("bb0"));
            let mut args = alloc::vec![BlockArg { name: Str::Owned(iv), ty: lower_bound_ty.clone(), loc: None }];
            for (name, ty) in names.iter().zip(&results) {
                args.push(BlockArg { name: Str::Owned(name.clone()), ty: ty.clone(), loc: None });
            }
            b.args = args;
        }
        let region = p.lend(region);
        let op = For { lower_bound, upper_bound, step, init_args, unsigned_cmp, region, lower_bound_ty, results, attrs, loc: p.opt_loc()? };
        Self::owned(op, p)
    }
}

/// `scf.if %c -> (T) { ... } else { ... } {attrs}`。
///
/// 结果类型带括号（`-> (f32)`，`mlir-opt` 就这么印）。没有结果时，两边收尾的 `scf.yield`
/// 都不印；else 区域没有块就整个不写。
#[mlir::op("scf.if", custom, results(results))]
pub struct If<'a> {
    #[slot(condition_ty)]
    pub condition: Value<'a>,
    #[region(name = "thenRegion")]
    pub then_region: Region<'a>,
    #[region(name = "elseRegion")]
    pub else_region: Region<'a>,
    #[dtype(is = i1)]
    pub condition_ty: Type<'a>,
    pub results: Vec<Type<'a>>,
}

impl Print for If<'_> {
    fn print(&self, p: &mut Printer<'_, '_>) -> fmt::Result {
        // 区域里只有一个块、⛔ 块参数：别的形状自定义形式写不出来
        let plain = |r: &Region<'_>| r.blocks.len() <= 1 && r.blocks.iter().all(|b| b.args.is_empty());
        if !plain(&self.then_region) || self.then_region.blocks.is_empty() || !plain(&self.else_region) {
            return self.print_generic(p);
        }
        p.op_name(Self::NAME)?;
        write!(p, " {}", self.condition)?;
        if !self.results.is_empty() {
            write!(p, " -> ({})", Sep(&self.results, ", "))?;
        }
        p.write_char(' ')?;
        p.region_body(&self.then_region, "scf.yield")?;
        if !self.else_region.blocks.is_empty() {
            p.write_str(" else ")?;
            p.region_body(&self.else_region, "scf.yield")?;
        }
        p.attr_dict("", &self.attrs, &[])
    }
}

impl Parse for If<'_> {
    fn parse(p: &mut Parser<'_, '_>) -> R<Self> {
        let condition = p.value()?;
        let results = match p.eat("->") {
            true => p.results_ty()?,
            false => Vec::new(),
        };
        let mut then_region = p.region()?;
        close_region(&mut then_region, "scf.yield");
        let else_region = match p.eat_kw("else") {
            true => {
                let mut r = p.region()?;
                close_region(&mut r, "scf.yield");
                r
            }
            false => Region { blocks: Vec::new() },
        };
        let (then_region, else_region) = (p.lend(then_region), p.lend(else_region));
        let op = If { condition, then_region, else_region, condition_ty: Type::I1, results, attrs: p.opt_dict()?, loc: p.opt_loc()? };
        Self::owned(op, p)
    }
}

/// `scf.index_switch %arg {attrs} -> T, U` 换行 `case N { ... }`（每个 case 一行起头）换行 `default { ... }`。
///
/// ODS 把 case 交给 C++ 的 `custom<SwitchCases>`：每个 case 前换行、`case 值 ` 再接区域，区域里的 `scf.yield` 总是印出来；
/// `default` 区域是 ODS 的普通区域，不带东西的 `scf.yield` 省掉（隐式终结符）。`%arg` 与类型之间那个空格之后紧跟换行，
/// `mlir-opt` 就是这么印的。
#[mlir::op("scf.index_switch", custom, results(results))]
pub struct IndexSwitch<'a> {
    #[slot(arg_ty)]
    pub arg: Value<'a>,
    #[attr(dense = "i64")]
    pub cases: crate::common::Attribute<'a>,
    #[region(name = "defaultRegion")]
    pub default_region: Region<'a>,
    #[region(name = "caseRegions")]
    pub case_regions: Vec<Region<'a>>,
    #[dtype(is = index)]
    pub arg_ty: Type<'a>,
    pub results: Vec<Type<'a>>,
}

impl Print for IndexSwitch<'_> {
    fn print(&self, p: &mut Printer<'_, '_>) -> fmt::Result {
        let values = self.cases.dense_values().unwrap_or_default();
        let plain = |r: &Region<'_>| r.blocks.len() == 1 && r.blocks[0].args.is_empty();
        if values.len() != self.case_regions.len() || !self.case_regions.iter().all(plain) || !plain(&self.default_region) {
            return self.print_generic(p);
        }
        p.op_name(Self::NAME)?;
        write!(p, " {}", self.arg)?;
        p.attr_dict("", &self.attrs, &[])?;
        if !self.results.is_empty() {
            write!(p, " -> {}", Sep(&self.results, ", "))?;
        }
        p.write_char(' ')?;
        for (v, r) in values.iter().zip(&self.case_regions) {
            p.nl()?;
            write!(p, "case {v} ")?;
            p.region(r, false)?;
        }
        p.nl()?;
        p.write_str("default ")?;
        p.region_body(&self.default_region, "scf.yield")
    }
}

impl Parse for IndexSwitch<'_> {
    fn parse(p: &mut Parser<'_, '_>) -> R<Self> {
        let arg = p.value()?;
        let attrs = p.opt_dict()?;
        let results = match p.eat("->") {
            true => {
                let mut tys = alloc::vec![p.ty()?];
                while p.eat(",") {
                    tys.push(p.ty()?);
                }
                tys
            }
            false => Vec::new(),
        };
        let (mut values, mut case_regions) = (Vec::new(), Vec::new());
        while p.eat_kw("case") {
            let negative = p.eat("-");
            let v: i64 = p.number()?;
            values.push(if negative { -v } else { v });
            let mut r = p.region()?;
            close_region(&mut r, "scf.yield");
            case_regions.push(p.lend(r));
        }
        p.expect_lit("default")?;
        let mut default_region = p.region()?;
        close_region(&mut default_region, "scf.yield");
        let default_region = p.lend(default_region);
        let op = IndexSwitch { arg, cases: crate::common::Attribute::dense_i64(&values), default_region, case_regions, arg_ty: Type::Index, results, attrs, loc: p.opt_loc()? };
        Self::owned(op, p)
    }
}

/// `scf.execute_region -> T no_inline { ... } {attrs}`（`ExecuteRegionOp::print`：可选的 `-> 类型`，`no_inline`，区域里的终结符总是印）。
#[mlir::op("scf.execute_region", custom, results(result))]
pub struct ExecuteRegion<'a> {
    pub no_inline: bool,
    pub region: Region<'a>,
    pub result: Vec<Type<'a>>,
}

impl Print for ExecuteRegion<'_> {
    fn print(&self, p: &mut Printer<'_, '_>) -> fmt::Result {
        p.op_name(Self::NAME)?;
        match self.result.as_slice() {
            [] => {}
            [one] if !matches!(one, Type::Function(_)) => write!(p, " -> {one}")?,
            many => write!(p, " -> ({})", Sep(many, ", "))?,
        }
        p.write_char(' ')?;
        if self.no_inline {
            p.write_str("no_inline ")?;
        }
        p.region(&self.region, false)?;
        p.attr_dict("", &self.attrs, &[])
    }
}

impl Parse for ExecuteRegion<'_> {
    fn parse(p: &mut Parser<'_, '_>) -> R<Self> {
        let result = match p.eat("->") {
            true => p.results_ty()?,
            false => Vec::new(),
        };
        let no_inline = p.eat_kw("no_inline");
        let region = p.region()?;
        let region = p.lend(region);
        let op = ExecuteRegion { no_inline, region, result, attrs: p.opt_dict()?, loc: p.opt_loc()? };
        Self::owned(op, p)
    }
}
