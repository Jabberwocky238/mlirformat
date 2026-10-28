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
use crate::common::{Attribute, Extended, NamedAttr, Op, Operation, Parse, Print, Region, Str, Type, Value};
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
        Self::owned(op, p)
    }
}

/// `linalg.yield %a, %b : f32, f32`（`YieldOp::print`：值、属性字典、冒号与类型；没有值就只剩名字）。
#[mlir::op("linalg.yield", custom)]
pub struct Yield<'a> {
    #[slot(values_ty, name = "values")]
    pub values: Vec<Value<'a>>,
    #[dtype(name = "values_ty")]
    pub values_ty: Vec<Type<'a>>,
}

impl Print for Yield<'_> {
    fn print(&self, p: &mut Printer<'_, '_>) -> fmt::Result {
        p.op_name(Self::NAME)?;
        if !self.values.is_empty() {
            write!(p, " {}", Sep(&self.values, ", "))?;
        }
        p.attr_dict("", &self.attrs, &[])?;
        if !self.values.is_empty() {
            write!(p, " : {}", Sep(&self.values_ty, ", "))?;
        }
        p.loc(&self.loc)
    }
}

impl Parse for Yield<'_> {
    fn parse(p: &mut Parser<'_, '_>) -> R<Self> {
        let mut values = Vec::new();
        if p.at(b'%') {
            values.push(p.value()?);
            while p.eat(",") {
                values.push(p.value()?);
            }
        }
        let attrs = p.opt_dict()?;
        let values_ty = if values.is_empty() { Vec::new() } else {
            p.expect(":")?;
            let mut ts = alloc::vec![p.ty()?];
            while p.eat(",") {
                ts.push(p.ty()?);
            }
            ts
        };
        let op = Yield { values, values_ty, attrs, loc: p.opt_loc()? };
        Self::owned(op, p)
    }
}

// ---- 命名的结构化 op（OpDSL：`LinalgNamedStructuredOps.yaml`）--------------------------------
//
// 自定义形式里没有区域（`mlir-opt` 不印），读的时候照 op 的 `regionBuilder` 造回来：块参数是各操作数的
// 元素类型（标量原样），体是 OpDSL 赋值的标量表达式（scripts/linalg_named.py 生成，`linalg_named.gen.rs`），
// 造法照 `RegionBuilderHelper`；造出来的 op 带上 ODS 的缺省属性，通用形式与 `mlir-opt` 印的逐字相同。

/// OpDSL 赋值里的一个标量表达式（`ScalarExpression`）。
pub enum Scalar<'s> {
    /// 第几个块参数（操作数的次序）。
    Arg(usize),
    /// `scalar_const`：属性的文本（`'12345 : i64'`）。
    Const(&'s str),
    /// `scalar_index`：第几维的迭代号（`linalg.index`）。
    Index(i64),
    Unary(&'s str, &'s Scalar<'s>),
    Binary(&'s str, &'s Scalar<'s>, &'s Scalar<'s>),
    Ternary(&'s str, &'s Scalar<'s>, &'s Scalar<'s>, &'s Scalar<'s>),
    /// 类型函数：转成那个类型。
    Cast(Cast<'s>, Ty<'s>, &'s Scalar<'s>),
}

/// 类型函数：`cast_signed` / `cast_unsigned`，或由 op 的属性选（`#linalg.type_fn<..>`，没写取缺省）。
pub enum Cast<'s> {
    Signed,
    Unsigned,
    Attr(&'s str),
}

/// 类型变量：第几个块参数的类型，或预定义的类型（`i32` / `i64` / `f32` / `f64`）。
pub enum Ty<'s> {
    Arg(usize),
    Named(&'s str),
}

/// 一个值与它的类型。
type Typed<'a> = (Value<'a>, Type<'a>);

/// ⭐ 造区域体（`RegionBuilderHelper`）：一个块，造出来的 op 依次排在里面。
struct RegionBuilder<'o, 'a> {
    opt: &'o crate::MlirOpt,
    /// op 的属性（类型函数属性在这里找）。
    attrs: &'o [NamedAttr<'a>],
    /// 类型函数属性的缺省（`cast` ⇒ `cast_signed`）。
    fns: &'o [(&'o str, &'o str)],
    args: Vec<Typed<'a>>,
    ops: Vec<Operation<'a>>,
}

impl<'o, 'a> RegionBuilder<'o, 'a> {
    /// 块参数：输入、输出各自的元素类型（`fillStructuredOpRegion`）。
    fn new(opt: &'o crate::MlirOpt, attrs: &'o [NamedAttr<'a>], fns: &'o [(&'o str, &'o str)], operands: &[Type<'a>]) -> Self {
        // memref / 张量取元素类型，别的（标量、vector）原样（`isa<MemRefType, RankedTensorType>`）
        let elem = |t: &Type<'a>| match t {
            Type::Shaped(s) if matches!(s.kind, crate::common::ShapedKind::MemRef | crate::common::ShapedKind::Tensor) => (*s.elem).clone(),
            t => t.clone(),
        };
        let args = operands.iter().enumerate().map(|(i, t)| (Value { name: Str::Owned(alloc::format!("__a{i}")), index: None }, elem(t))).collect();
        RegionBuilder { opt, attrs, fns, args, ops: Vec::new() }
    }

    /// 造一条 op：ODS 的缺省属性先放，`given` 盖上去，按名字排（属性字典的次序）；ODS 声明的进
    /// `<{..}>`，别的进 `{..}`。
    fn emit(&mut self, name: &str, operands: &[&Typed<'a>], result: Option<Type<'a>>, given: Vec<NamedAttr<'a>>) -> Typed<'a> {
        let inherent = self.opt.op_info(name).map_or(&[][..], |i| i.inherent);
        let (props, mut attributes): (Vec<_>, Vec<_>) = given.into_iter().partition(|a| inherent.contains(&&*a.name));
        let mut all: Vec<NamedAttr<'a>> = self.opt.defaults(name).into_iter().filter(|d| !props.iter().any(|p| p.name == d.name)).collect();
        all.extend(props);
        all.sort_by(|x, y| x.name.cmp(&y.name));
        attributes.sort_by(|x, y| x.name.cmp(&y.name));
        let v = Value { name: Str::Owned(alloc::format!("__v{}", self.ops.len())), index: None };
        self.ops.push(Operation {
            results: result.iter().map(|_| crate::common::ResultDef { name: v.name.clone(), count: None }).collect(),
            name: Str::Owned(String::from(name)),
            operands: operands.iter().map(|o| o.0.clone()).collect(),
            properties: (!all.is_empty()).then_some(Attribute::Dict(all)),
            attributes,
            ty: crate::common::FunctionType { inputs: operands.iter().map(|o| o.1.clone()).collect(), results: result.iter().cloned().collect() },
            ..Operation::default()
        });
        (v, result.unwrap_or(Type::NoneType))
    }

    fn float(t: &Type<'_>) -> bool {
        matches!(t, Type::Float(_))
    }

    fn integer(t: &Type<'_>) -> bool {
        matches!(t, Type::Integer { .. })
    }

    /// `convertScalarToDtype`：一样就不造；整数 ⇄ 浮点、宽窄、index ⇒ 整数各有一条；转不了原样返回（`mlir-opt` 只警告）。
    fn cast(&mut self, v: Typed<'a>, to: &Type<'a>, unsigned: bool) -> Typed<'a> {
        let from = v.1.clone();
        if from == *to {
            return v;
        }
        let width = |t: &Type<'_>| t.bit_width().unwrap_or(0);
        if let Type::Complex(te) = to {
            return self.to_complex(v, te, unsigned);
        }
        let op = match (&from, to) {
            (f, Type::Integer { .. }) if Self::float(f) => if unsigned { "arith.fptoui" } else { "arith.fptosi" },
            (Type::Index, Type::Integer { .. }) => "arith.index_cast",
            (f, t) if Self::integer(f) && Self::integer(t) && width(t) > width(f) => if unsigned { "arith.extui" } else { "arith.extsi" },
            (f, t) if Self::integer(f) && Self::integer(t) && width(t) < width(f) => "arith.trunci",
            (f, t) if Self::integer(f) && Self::float(t) => if unsigned { "arith.uitofp" } else { "arith.sitofp" },
            (f, t) if Self::float(f) && Self::float(t) && width(t) > width(f) => "arith.extf",
            (f, t) if Self::float(f) && Self::float(t) && width(t) < width(f) => "arith.truncf",
            _ => return v,
        };
        self.emit(op, &[&v], Some(to.clone()), Vec::new())
    }

    /// `convertScalarToComplexDtype`：复数 ⇒ 复数逐分量加宽 / 截短，实数（浮点、整数）⇒ 实部、虚部 0。
    fn to_complex(&mut self, v: Typed<'a>, te: &Type<'a>, unsigned: bool) -> Typed<'a> {
        let to = Type::Complex(alloc::boxed::Box::new(te.clone()));
        let width = |t: &Type<'_>| t.bit_width().unwrap_or(0);
        match v.1.clone() {
            Type::Complex(fe) if Self::float(&fe) && Self::float(te) => {
                let re = self.emit("complex.re", &[&v], Some((*fe).clone()), Vec::new());
                let im = self.emit("complex.im", &[&v], Some((*fe).clone()), Vec::new());
                let op = if width(te) < width(&fe) { "arith.truncf" } else { "arith.extf" };
                let re = self.emit(op, &[&re], Some(te.clone()), Vec::new());
                let im = self.emit(op, &[&im], Some(te.clone()), Vec::new());
                self.emit("complex.create", &[&re, &im], Some(to), Vec::new())
            }
            t if Self::float(&t) || Self::integer(&t) => {
                let mut from = v;
                if Self::integer(&t) {
                    from = self.emit(if unsigned { "arith.uitofp" } else { "arith.sitofp" }, &[&from], Some(te.clone()), Vec::new());
                } else if width(&t) < width(te) {
                    from = self.emit("arith.extf", &[&from], Some(te.clone()), Vec::new());
                } else if width(&t) > width(te) {
                    from = self.emit("arith.truncf", &[&from], Some(te.clone()), Vec::new());
                }
                let zero = Attribute::Float { lit: Str::Borrowed("0.000000e+00"), ty: Some(te.clone()) };
                let zero = self.emit("arith.constant", &[], Some(te.clone()), alloc::vec![NamedAttr { name: Str::Borrowed("value"), value: Some(zero) }]);
                self.emit("complex.create", &[&from, &zero], Some(to), Vec::new())
            }
            _ => v,
        }
    }

    /// `buildUnaryFn`：只收浮点。
    fn unary(&mut self, f: &str, a: Typed<'a>) -> Option<Typed<'a>> {
        if !Self::float(&a.1) {
            return None;
        }
        let ty = a.1.clone();
        let name = match f {
            "exp" => "math.exp",
            "log" => "math.log",
            "abs" => "math.absf",
            "ceil" => "math.ceil",
            "floor" => "math.floor",
            "negf" => "arith.negf",
            "round" => "math.round",
            "sqrt" => "math.sqrt",
            "rsqrt" => "math.rsqrt",
            "tanh" => "math.tanh",
            "erf" => "math.erf",
            "square" => return Some(self.emit("arith.mulf", &[&a, &a], Some(ty), Vec::new())),
            "reciprocal" => {
                let one = Attribute::Float { lit: Str::Borrowed("1.000000e+00"), ty: Some(ty.clone()) };
                let one = self.emit("arith.constant", &[], Some(ty.clone()), alloc::vec![NamedAttr { name: Str::Borrowed("value"), value: Some(one) }]);
                return Some(self.emit("arith.divf", &[&one, &a], Some(ty), Vec::new()));
            }
            _ => return None,
        };
        Some(self.emit(name, &[&a], Some(ty), Vec::new()))
    }

    /// `buildBinaryFn`：全复数、全浮点、全整数（i1 的加乘是或与）。
    fn binary(&mut self, f: &str, a: Typed<'a>, b: Typed<'a>) -> Option<Typed<'a>> {
        let complex = matches!(a.1, Type::Complex(_)) && matches!(b.1, Type::Complex(_));
        if complex {
            let name = match f {
                "add" => "complex.add",
                "sub" => "complex.sub",
                "mul" => "complex.mul",
                "div" => "complex.div",
                _ => return None,
            };
            let ty = a.1.clone();
            return Some(self.emit(name, &[&a, &b], Some(ty), Vec::new()));
        }
        let (fp, int) = (Self::float(&a.1) && Self::float(&b.1), Self::integer(&a.1) && Self::integer(&b.1));
        let boolean = int && a.1 == Type::I1 && b.1 == Type::I1;
        let name = match (f, fp, int) {
            ("add", true, _) => "arith.addf",
            ("add", _, true) => if boolean { "arith.ori" } else { "arith.addi" },
            ("sub", true, _) => "arith.subf",
            ("sub", _, true) if !boolean => "arith.subi",
            ("mul", true, _) => "arith.mulf",
            ("mul", _, true) => if boolean { "arith.andi" } else { "arith.muli" },
            ("div", true, _) => "arith.divf",
            ("div", _, true) if !boolean => "arith.divsi",
            ("div_unsigned", _, true) if !boolean => "arith.divui",
            ("max_signed", true, _) => "arith.maximumf",
            ("max_signed", _, true) => "arith.maxsi",
            ("min_signed", true, _) => "arith.minimumf",
            ("min_signed", _, true) => "arith.minsi",
            ("max_unsigned", _, true) if !boolean => "arith.maxui",
            ("min_unsigned", _, true) if !boolean => "arith.minui",
            ("powf", true, _) => "math.powf",
            _ => return None,
        };
        let ty = a.1.clone();
        Some(self.emit(name, &[&a, &b], Some(ty), Vec::new()))
    }

    /// 类型函数选哪个：属性写了就照它，否则取缺省。
    fn unsigned(&self, c: &Cast<'_>) -> bool {
        match c {
            Cast::Signed => false,
            Cast::Unsigned => true,
            Cast::Attr(name) => {
                let set = self.attrs.iter().find(|a| a.name == *name).and_then(|a| a.value.as_ref()).map(|v| alloc::format!("{v}"));
                let default = self.fns.iter().find(|(n, _)| n == name).map(|(_, d)| *d);
                set.as_deref().map_or(default == Some("cast_unsigned"), |s| s.contains("cast_unsigned"))
            }
        }
    }

    /// 一个标量表达式：操作数从左往右先造，再造它自己（生成的 `regionBuilder` 的次序）。
    fn eval(&mut self, e: &Scalar<'_>) -> Option<Typed<'a>> {
        Some(match e {
            Scalar::Arg(i) => self.args.get(*i)?.clone(),
            Scalar::Const(text) => {
                let value = Attribute::try_from(*text).ok()?.owned();
                let ty = match &value {
                    Attribute::Int { ty: Some(t), .. } | Attribute::Float { ty: Some(t), .. } => t.clone(),
                    _ => return None,
                };
                self.emit("arith.constant", &[], Some(ty), alloc::vec![NamedAttr { name: Str::Borrowed("value"), value: Some(value) }])
            }
            Scalar::Index(d) => {
                let dim = Attribute::Int { lit: Str::Owned(alloc::format!("{d}")), ty: Some(Type::int(64)) };
                self.emit("linalg.index", &[], Some(Type::Index), alloc::vec![NamedAttr { name: Str::Borrowed("dim"), value: Some(dim) }])
            }
            Scalar::Unary(f, a) => {
                let a = self.eval(a)?;
                self.unary(f, a)?
            }
            Scalar::Binary(f, a, b) => {
                let (a, b) = (self.eval(a)?, self.eval(b)?);
                self.binary(f, a, b)?
            }
            Scalar::Ternary(_, c, a, b) => {
                let (c, a, b) = (self.eval(c)?, self.eval(a)?, self.eval(b)?);
                let ty = a.1.clone();
                self.emit("arith.select", &[&c, &a, &b], Some(ty), Vec::new())
            }
            Scalar::Cast(c, ty, a) => {
                let to = match ty {
                    Ty::Arg(i) => self.args.get(*i)?.1.clone(),
                    Ty::Named(n) => Type::try_from(*n).ok()?.owned(),
                };
                let unsigned = self.unsigned(c);
                let a = self.eval(a)?;
                self.cast(a, &to, unsigned)
            }
        })
    }

    /// 体：各个输出的表达式依次造、`linalg.yield` 收尾（`yieldOutputs`）。
    fn region(mut self, yields: &[Scalar<'_>]) -> Option<Region<'a>> {
        let mut values = Vec::new();
        for y in yields {
            values.push(self.eval(y)?);
        }
        self.emit("linalg.yield", &values.iter().collect::<Vec<_>>(), None, Vec::new());
        let args = self.args.into_iter().map(|(v, ty)| crate::common::BlockArg { name: v.name, ty, loc: None }).collect();
        Some(Region { blocks: alloc::vec![crate::common::Block { label: Some(Str::Borrowed("bb0")), args, ops: self.ops }] })
    }
}

/// 命名结构化 op 共用的写法（`printNamedStructuredOp` / `parseNamedStructuredOp`）：
/// `{属性} ins(..) outs(..) {属性} -> 结果`，区域不写。
pub struct Named<'a> {
    pub inputs: Vec<Value<'a>>,
    pub inputs_ty: Vec<Type<'a>>,
    pub outputs: Vec<Value<'a>>,
    pub outputs_ty: Vec<Type<'a>>,
    /// 属性字典里的全部（固有的、可丢的混在一起，读出来再按名字分开）。
    pub attrs: Vec<NamedAttr<'a>>,
    pub results: Vec<Type<'a>>,
}

impl<'a> Named<'a> {
    /// 名字之后的部分：固有属性与可丢属性并成一个字典、按名字排，`elide` 的不写。
    pub fn print(p: &mut Printer<'_, '_>, props: &[(&str, Option<&Attribute<'_>>)], attrs: &[NamedAttr<'_>], inputs: (&[Value<'_>], &[Type<'_>]), outputs: (&[Value<'_>], &[Type<'_>]), results: &[Type<'_>], elide: &[&str]) -> fmt::Result {
        let mut all: Vec<NamedAttr<'_>> = props.iter().filter_map(|(n, v)| v.map(|v| NamedAttr { name: Str::Borrowed(n), value: Some(v.clone()) })).collect();
        all.extend(attrs.iter().cloned());
        all.sort_by(|x, y| x.name.cmp(&y.name));
        let mut skip = alloc::vec!["operandSegmentSizes", "linalg.memoized_indexing_maps"];
        skip.extend_from_slice(elide);
        p.attr_dict("", &all, &skip)?;
        if !inputs.0.is_empty() {
            write!(p, " ins({} : {})", Sep(inputs.0, ", "), Sep(inputs.1, ", "))?;
        }
        if !outputs.0.is_empty() {
            write!(p, " outs({} : {})", Sep(outputs.0, ", "), Sep(outputs.1, ", "))?;
        }
        match results {
            [] => Ok(()),
            [t] => write!(p, " -> {t}"),
            ts => write!(p, " -> ({})", Sep(ts, ", ")),
        }
    }

    /// 读进来：属性字典、`ins` / `outs`、又一个属性字典、`-> 结果`。
    pub fn parse(p: &mut Parser<'a, '_>) -> R<Self> {
        let mut attrs = p.opt_dict()?;
        let (inputs, inputs_ty) = if p.eat_kw("ins") { Generic::operands(p)? } else { (Vec::new(), Vec::new()) };
        let (outputs, outputs_ty) = if p.eat_kw("outs") { Generic::operands(p)? } else { (Vec::new(), Vec::new()) };
        attrs.extend(p.opt_dict()?);
        let results = if p.eat("->") { p.results_ty()? } else { Vec::new() };
        Ok(Named { inputs, inputs_ty, outputs, outputs_ty, attrs, results })
    }

    /// 固有属性 `name` 从字典里拿走。
    pub fn take(&mut self, name: &str) -> Option<Attribute<'a>> {
        let at = self.attrs.iter().position(|a| a.name == name)?;
        self.attrs.remove(at).value
    }

    /// 照 `yields` 造区域（`fns`：类型函数属性的缺省）。
    pub fn region(&self, opt: &crate::MlirOpt, props: &[NamedAttr<'a>], fns: &[(&str, &str)], yields: &[Scalar<'_>]) -> Option<Region<'a>> {
        let types: Vec<Type<'a>> = self.inputs_ty.iter().chain(&self.outputs_ty).cloned().collect();
        RegionBuilder::new(opt, props, fns, &types).region(yields)
    }
}

/// 一条 OpDSL op：与生成的同名结构体同样的字段，只是写法自己来（注入时盖过生成的）。
macro_rules! named_ops {
    ($($ty:ident = $name:literal { $($attr:ident = $aname:literal),* } [$(($fname:literal, $fdefault:literal)),*] [$($yield:expr),*];)*) => {
        /// 全部 OpDSL op 的模板（`MlirOpt::upstream` 注入，盖过生成的）。
        pub fn named_templates() -> Vec<crate::Template> {
            alloc::vec![$($ty::template()),*]
        }
        $(
        #[doc = concat!("`", $name, "`（OpDSL）。")]
        #[mlir::op($name, custom, results(result_tensors))]
        pub struct $ty<'a> {
            #[slot(inputs_ty, name = "inputs")]
            pub inputs: Vec<Value<'a>>,
            #[slot(outputs_ty, name = "outputs")]
            pub outputs: Vec<Value<'a>>,
            $(#[attr(name = $aname)]
            pub $attr: Option<Attribute<'a>>,)*
            #[region(name = "region")]
            pub region: Region<'a>,
            #[dtype(name = "inputs_ty")]
            pub inputs_ty: Vec<Type<'a>>,
            #[dtype(name = "outputs_ty")]
            pub outputs_ty: Vec<Type<'a>>,
            #[dtype(name = "result_tensors")]
            pub result_tensors: Vec<Type<'a>>,
        }

        impl Print for $ty<'_> {
            fn print(&self, p: &mut Printer<'_, '_>) -> fmt::Result {
                p.op_name(Self::NAME)?;
                Named::print(p, &[$(($aname, self.$attr.as_ref())),*], &self.attrs, (&self.inputs, &self.inputs_ty), (&self.outputs, &self.outputs_ty), &self.result_tensors, &[])?;
                p.loc(&self.loc)
            }
        }

        impl Parse for $ty<'_> {
            fn parse(p: &mut Parser<'_, '_>) -> R<Self> {
                #[allow(unused_mut, reason = "没有固有属性的 op 不从字典里拿")]
                let mut n = Named::parse(p)?;
                let all = n.attrs.clone();
                $(let $attr = n.take($aname);)*
                let Some(region) = n.region(p.opt(), &all, &[$(($fname, $fdefault)),*], &[$($yield),*]) else {
                    return p.err(concat!($name, ": the region builder cannot build a body for these types"));
                };
                let op = $ty { inputs: n.inputs, outputs: n.outputs, $($attr,)* region, inputs_ty: n.inputs_ty, outputs_ty: n.outputs_ty, result_tensors: n.results, attrs: n.attrs, loc: p.opt_loc()? };
                Self::owned(op, p)
            }
        }
    )*};
}

include!("linalg_named.gen.rs");

// ---- 乘加类（ODS：matmul / batch_matmul / batch_reduce_matmul / contract）--------------------
//
// 体都是 `out + cast(a) * cast(b)`（`regionBuilder`）；`indexing_maps` 是固有属性，自定义形式里写在最前面：
// matmul、batch_matmul 不是缺省的才写（`indexing_maps = [..]`），batch_reduce_matmul 不是缺省的才写、
// ⚠ 且不带 `indexing_maps = [` 前后缀（`BatchReduceMatmulOp::print` 就是这么印的），contract 总写。

/// `indexing_maps` 在自定义形式里怎么写。
#[derive(Clone, Copy, PartialEq, Eq)]
pub enum Maps {
    /// 不是缺省的才写 `indexing_maps = [..]`。
    Keyword,
    /// 不是缺省的才写，逗号隔开、没有前后缀。
    Bare,
    /// 总写 `indexing_maps = [..]`。
    Always,
}

/// 乘加类的公共部分。
struct Contraction;

impl Contraction {
    /// 缺省的映射：`(d0, d1, d2) -> (d0, d2)` 之类的体，拼成数组属性。
    fn defaults(maps: &[&str]) -> Option<Attribute<'static>> {
        let text = alloc::format!("[{}]", maps.iter().map(|m| alloc::format!("affine_map<{m}>")).collect::<Vec<_>>().join(", "));
        Attribute::try_from(text.as_str()).ok().map(|a| a.owned())
    }

    /// `maps` 是不是缺省的那几个（别名先展开，空白不计）。
    fn is_default(p: &Printer<'_, '_>, maps: &Attribute<'_>, defaults: &[&str]) -> bool {
        let Attribute::Array(xs) = maps else { return false };
        let squash = |s: &str| s.chars().filter(|c| !c.is_whitespace()).collect::<String>();
        let alias = |n: &str| p.alias(n).map(String::from);
        xs.len() == defaults.len() && xs.iter().zip(defaults).all(|(x, d)| super::affine_ops::map_body(x, &alias).is_some_and(|b| squash(&b) == squash(d)))
    }

    /// 体：`out + cast(a) * cast(b)`；`signed_only`：不看 `cast` 属性（batch_reduce_matmul）。
    fn body(cast: bool) -> [Scalar<'static>; 1] {
        const A: Scalar<'static> = Scalar::Arg(0);
        const B: Scalar<'static> = Scalar::Arg(1);
        const OUT: Scalar<'static> = Scalar::Arg(2);
        if cast {
            [Scalar::Binary("add", &OUT, &Scalar::Binary("mul", &Scalar::Cast(Cast::Attr("cast"), Ty::Arg(2), &A), &Scalar::Cast(Cast::Attr("cast"), Ty::Arg(2), &B)))]
        } else {
            [Scalar::Binary("add", &OUT, &Scalar::Binary("mul", &Scalar::Cast(Cast::Signed, Ty::Arg(2), &A), &Scalar::Cast(Cast::Signed, Ty::Arg(2), &B)))]
        }
    }
}

macro_rules! contraction_ops {
    ($($ty:ident = $name:literal, $style:ident, [$($map:literal),*], $cast:literal, [$($elide:literal),*];)*) => {
        /// 乘加类的模板（`MlirOpt::upstream` 注入，盖过生成的）。
        pub fn contraction_templates() -> Vec<crate::Template> {
            alloc::vec![$($ty::template()),*]
        }
        $(
        #[doc = concat!("`", $name, "`。")]
        #[mlir::op($name, custom, results(result_tensors))]
        pub struct $ty<'a> {
            #[slot(inputs_ty, name = "inputs")]
            pub inputs: Vec<Value<'a>>,
            #[slot(outputs_ty, name = "outputs")]
            pub outputs: Vec<Value<'a>>,
            #[attr(name = "indexing_maps")]
            pub indexing_maps: Option<Attribute<'a>>,
            #[attr(name = "cast")]
            pub cast: Option<Attribute<'a>>,
            #[region(name = "region")]
            pub region: Region<'a>,
            #[dtype(name = "inputs_ty")]
            pub inputs_ty: Vec<Type<'a>>,
            #[dtype(name = "outputs_ty")]
            pub outputs_ty: Vec<Type<'a>>,
            #[dtype(name = "result_tensors")]
            pub result_tensors: Vec<Type<'a>>,
        }

        impl Print for $ty<'_> {
            fn print(&self, p: &mut Printer<'_, '_>) -> fmt::Result {
                let Some(maps) = &self.indexing_maps else { return self.print_generic(p) };
                let shown = Maps::$style == Maps::Always || !Contraction::is_default(p, maps, &[$($map),*]);
                p.op_name(Self::NAME)?;
                match (shown, Maps::$style, maps) {
                    (false, ..) => {}
                    (true, Maps::Bare, Attribute::Array(xs)) => write!(p, "{}", Sep(xs, ", "))?,
                    _ => write!(p, " indexing_maps = {maps}")?,
                }
                Named::print(p, &[("cast", self.cast.as_ref())], &self.attrs, (&self.inputs, &self.inputs_ty), (&self.outputs, &self.outputs_ty), &self.result_tensors, &[$($elide),*])?;
                p.loc(&self.loc)
            }
        }

        impl Parse for $ty<'_> {
            fn parse(p: &mut Parser<'_, '_>) -> R<Self> {
                let given = if p.eat_kw("indexing_maps") {
                    p.expect("=")?;
                    Some(p.attr()?)
                } else {
                    None
                };
                let Some(indexing_maps) = given.or_else(|| Contraction::defaults(&[$($map),*])) else {
                    return p.err(concat!($name, ": expected 'indexing_maps' attribute"));
                };
                let mut n = Named::parse(p)?;
                let all = n.attrs.clone();
                let cast = n.take("cast");
                let Some(region) = n.region(p.opt(), &all, &[("cast", "cast_signed")], &Contraction::body($cast)) else {
                    return p.err(concat!($name, ": the region builder cannot build a body for these types"));
                };
                let op = $ty { inputs: n.inputs, outputs: n.outputs, indexing_maps: Some(indexing_maps), cast, region, inputs_ty: n.inputs_ty, outputs_ty: n.outputs_ty, result_tensors: n.results, attrs: n.attrs, loc: p.opt_loc()? };
                Self::owned(op, p)
            }
        }
    )*};
}

contraction_ops! {
    Matmul = "linalg.matmul", Keyword, ["(d0, d1, d2) -> (d0, d2)", "(d0, d1, d2) -> (d2, d1)", "(d0, d1, d2) -> (d0, d1)"], true, ["indexing_maps"];
    BatchMatmul = "linalg.batch_matmul", Keyword, ["(d0, d1, d2, d3) -> (d0, d1, d3)", "(d0, d1, d2, d3) -> (d0, d3, d2)", "(d0, d1, d2, d3) -> (d0, d1, d2)"], true, ["indexing_maps"];
    BatchReduceMatmul = "linalg.batch_reduce_matmul", Bare, ["(d0, d1, d2, d3) -> (d0, d1, d3)", "(d0, d1, d2, d3) -> (d0, d3, d2)", "(d0, d1, d2, d3) -> (d1, d2)"], false, ["indexing_maps"];
    Contract = "linalg.contract", Always, [], true, ["indexing_maps"];
}

// ---- 目标式的 op（ODS：transpose / broadcast / map / reduce / elementwise）-------------------

impl<'o, 'a> RegionBuilder<'o, 'a> {
    /// `buildIdentityRegion`：交出第一个块参数。
    fn identity(mut self) -> Region<'a> {
        let first = self.args.first().cloned();
        self.emit("linalg.yield", &first.iter().collect::<Vec<_>>(), None, Vec::new());
        self.finish()
    }

    /// `addBodyWithPayloadOp`：一条 `payload`（结果是最后一个操作数的元素类型）再 yield 它；
    /// `init_first`：init 放在最前面；`map_init`：init 也是 payload 的操作数。
    fn payload(mut self, name: &str, attrs: Vec<NamedAttr<'a>>, init_first: bool, map_init: bool) -> Region<'a> {
        let n = self.args.len();
        let operands: Vec<Typed<'a>> = if init_first {
            let mut ops: Vec<Typed<'a>> = if map_init { self.args.last().cloned().into_iter().collect() } else { Vec::new() };
            ops.extend(self.args[..n.saturating_sub(1)].iter().cloned());
            ops
        } else {
            self.args[..n - usize::from(!map_init)].to_vec()
        };
        let ty = self.args.last().map(|a| a.1.clone());
        let v = self.emit(name, &operands.iter().collect::<Vec<_>>(), ty, attrs);
        self.emit("linalg.yield", &[&v], None, Vec::new());
        self.finish()
    }

    /// 一个块：参数、造好的 op。
    fn finish(self) -> Region<'a> {
        let args = self.args.into_iter().map(|(v, ty)| crate::common::BlockArg { name: v.name, ty, loc: None }).collect();
        Region { blocks: alloc::vec![crate::common::Block { label: Some(Str::Borrowed("bb0")), args, ops: self.ops }] }
    }
}

/// 目标式 op 共用的几样（`parseDstStyleOp`、`printDenseI64ArrayAttr`、短形式）。
struct Dst;

impl Dst {
    /// ` name = [1, 0] `（末尾那个空格 `mlir-opt` 就是这么印的）。
    fn print_dense(p: &mut Printer<'_, '_>, name: &str, a: &Attribute<'_>) -> fmt::Result {
        match a {
            Attribute::DenseArray { values, .. } => write!(p, " {name} = [{}] ", Sep(values, ", ")),
            _ => Err(fmt::Error),
        }
    }

    /// `name = [1, 0]` ⇒ `array<i64: 1, 0>`。
    fn parse_dense<'a>(p: &mut Parser<'a, '_>, name: &str) -> R<Attribute<'a>> {
        if !p.eat_kw(name) {
            return p.err(alloc::format!("expected `{name}`"));
        }
        p.expect("=")?;
        p.expect("[")?;
        let values = p.list("]", |p| {
            let neg = p.eat("-");
            let n: u64 = p.number()?;
            Ok(Str::Owned(if neg { alloc::format!("-{n}") } else { alloc::format!("{n}") }))
        })?;
        Ok(Attribute::DenseArray { ty: Type::int(64), values })
    }

    /// 结果：outs 里的张量（`parseDstStyleOp`）。
    fn results<'a>(outs: &[Type<'a>]) -> Vec<Type<'a>> {
        outs.iter().filter(|t| matches!(t, Type::Shaped(s) if s.kind == crate::common::ShapedKind::Tensor)).cloned().collect()
    }

    /// `canUseShortForm`：体只有一条 payload 加 yield，payload 的操作数正是块参数（次序见那两个开关），yield 交出它。
    fn short<'r, 'a>(r: &'r Region<'a>, init_first: bool, map_init: bool) -> Option<&'r Operation<'a>> {
        if init_first && !map_init {
            return None;
        }
        let [b] = &r.blocks[..] else { return None };
        let [payload, y] = &b.ops[..] else { return None };
        let names: Vec<&str> = b.args.iter().map(|a| &*a.name).collect();
        let ops: Vec<&str> = payload.operands.iter().filter(|v| v.index.is_none()).map(|v| &*v.name).collect();
        if ops.is_empty() || ops.len() != payload.operands.len() || ops.len() + usize::from(!map_init) != names.len() {
            return None;
        }
        let fits = if init_first {
            ops.last() == names.first() && ops.iter().zip(&names[1..]).all(|(o, a)| o == a)
        } else {
            ops.iter().zip(&names[..names.len() - usize::from(!map_init)]).all(|(o, a)| o == a)
        };
        let yields = y.name == "linalg.yield" && y.operands.len() == 1 && payload.results.len() == 1 && y.operands[0].name == payload.results[0].name;
        (fits && yields).then_some(payload)
    }

    /// ` { arith.addf }`：payload 的属性（固有的与可丢的并成字典，`fastmath = none` 那一个不写）。
    fn print_short(p: &mut Printer<'_, '_>, payload: &Operation<'_>) -> fmt::Result {
        let mut all: Vec<NamedAttr<'_>> = match &payload.properties {
            Some(Attribute::Dict(xs)) => xs.clone(),
            _ => Vec::new(),
        };
        all.extend(payload.attributes.iter().cloned());
        all.sort_by(|x, y| x.name.cmp(&y.name));
        let none = all.iter().find(|a| a.value.as_ref().is_some_and(|v| alloc::format!("{v}") == "#arith.fastmath<none>")).map(|a| String::from(&*a.name));
        write!(p, " {{ {}", payload.name)?;
        p.attr_dict("", &all, &none.as_deref().into_iter().collect::<Vec<_>>())?;
        p.write_str(" }")
    }

    /// `{ arith.addf {..} }`：payload 的名字与属性。
    fn parse_short<'a>(p: &mut Parser<'a, '_>) -> R<Option<(String, Vec<NamedAttr<'a>>)>> {
        if !p.eat("{") {
            return Ok(None);
        }
        let name = String::from(p.ident()?);
        let attrs = p.opt_dict()?;
        p.expect("}")?;
        Ok(Some((name, attrs)))
    }

    /// 长形式：换行、`(%in: f32, %init: f32) ` 再接区域（入口块不写标号）。
    fn print_long(p: &mut Printer<'_, '_>, r: &Region<'_>) -> fmt::Result {
        let Some(b) = r.blocks.first() else { return Ok(()) };
        p.nested(|p| {
            p.nl()?;
            p.write_char('(')?;
            for (i, a) in b.args.iter().enumerate() {
                write!(p, "{}%{}: {}", if i > 0 { ", " } else { "" }, a.name, a.ty)?;
            }
            p.write_str(") ")?;
            p.region(r, false)
        })
    }

    /// 长形式：`(%in: f32, ..)` 再接区域，参数放进入口块。
    fn parse_long<'a>(p: &mut Parser<'a, '_>) -> R<Region<'a>> {
        p.expect("(")?;
        let args = p.list(")", |p| {
            let name = Str::Borrowed(p.sigil('%')?);
            p.expect(":")?;
            Ok(crate::common::BlockArg { name, ty: p.ty()?, loc: None })
        })?;
        let mut region = p.region()?;
        if let Some(b) = region.blocks.first_mut() {
            b.label.get_or_insert(Str::Borrowed("bb0"));
            b.args = args;
        }
        Ok(region)
    }
}

/// `linalg.transpose` / `linalg.broadcast`：`ins(..) outs(..) 属性 = [..] {..}`，体是交出输入。
macro_rules! identity_ops {
    ($($ty:ident = $name:literal, $attr:ident = $aname:literal;)*) => {$(
        #[doc = concat!("`", $name, "`。")]
        #[mlir::op($name, custom, results(result))]
        pub struct $ty<'a> {
            #[slot(input_ty, name = "input")]
            pub input: Value<'a>,
            #[slot(init_ty, name = "init")]
            pub init: Value<'a>,
            #[attr(name = $aname)]
            pub $attr: Attribute<'a>,
            #[region(name = "region")]
            pub region: Region<'a>,
            #[dtype(name = "input_ty")]
            pub input_ty: Type<'a>,
            #[dtype(name = "init_ty")]
            pub init_ty: Type<'a>,
            #[dtype(name = "result")]
            pub result: Vec<Type<'a>>,
        }

        impl Print for $ty<'_> {
            fn print(&self, p: &mut Printer<'_, '_>) -> fmt::Result {
                p.op_name(Self::NAME)?;
                write!(p, " ins({} : {}) outs({} : {})", self.input, self.input_ty, self.init, self.init_ty)?;
                Dst::print_dense(p, $aname, &self.$attr)?;
                p.attr_dict("", &self.attrs, &[])?;
                p.loc(&self.loc)
            }
        }

        impl Parse for $ty<'_> {
            fn parse(p: &mut Parser<'_, '_>) -> R<Self> {
                let (Some((ins, ins_ty)), Some((outs, outs_ty))) = (p.eat_kw("ins").then(|| Generic::operands(p)).transpose()?, p.eat_kw("outs").then(|| Generic::operands(p)).transpose()?) else {
                    return p.err(concat!($name, ": ins(..) outs(..)"));
                };
                let ([input], [input_ty], [init], [init_ty]) = (&ins[..], &ins_ty[..], &outs[..], &outs_ty[..]) else {
                    return p.err(concat!($name, ": one input, one init"));
                };
                let $attr = Dst::parse_dense(p, $aname)?;
                let attrs = p.opt_dict()?;
                let region = RegionBuilder::new(p.opt(), &[], &[], &[input_ty.clone(), init_ty.clone()]).identity();
                let op = $ty { input: input.clone(), init: init.clone(), $attr, region, input_ty: input_ty.clone(), init_ty: init_ty.clone(), result: Dst::results(&outs_ty), attrs, loc: p.opt_loc()? };
                Self::owned(op, p)
            }
        }
    )*};
}

identity_ops! {
    Transpose = "linalg.transpose", permutation = "permutation";
    Broadcast = "linalg.broadcast", dimensions = "dimensions";
}

/// `linalg.map`：`{ payload }`（短形式）或换行后 `(参数) { 体 }`（长形式）；init 也是块参数，不进 payload。
#[mlir::op("linalg.map", custom, results(result))]
pub struct Map<'a> {
    #[slot(inputs_ty, name = "inputs")]
    pub inputs: Vec<Value<'a>>,
    #[slot(init_ty, name = "init")]
    pub init: Value<'a>,
    #[region(name = "mapper")]
    pub mapper: Region<'a>,
    #[dtype(name = "inputs_ty")]
    pub inputs_ty: Vec<Type<'a>>,
    #[dtype(name = "init_ty")]
    pub init_ty: Type<'a>,
    #[dtype(name = "result")]
    pub result: Vec<Type<'a>>,
}

impl Print for Map<'_> {
    fn print(&self, p: &mut Printer<'_, '_>) -> fmt::Result {
        p.op_name(Self::NAME)?;
        let short = Dst::short(&self.mapper, false, false);
        if let Some(payload) = short {
            Dst::print_short(p, payload)?;
        }
        if !self.inputs.is_empty() {
            write!(p, " ins({} : {})", Sep(&self.inputs, ", "), Sep(&self.inputs_ty, ", "))?;
        }
        write!(p, " outs({} : {})", self.init, self.init_ty)?;
        p.attr_dict("", &self.attrs, &[])?;
        if short.is_none() {
            Dst::print_long(p, &self.mapper)?;
        }
        p.loc(&self.loc)
    }
}

impl Parse for Map<'_> {
    fn parse(p: &mut Parser<'_, '_>) -> R<Self> {
        let short = Dst::parse_short(p)?;
        let (inputs, inputs_ty) = if p.eat_kw("ins") { Generic::operands(p)? } else { (Vec::new(), Vec::new()) };
        let Some((outs, outs_ty)) = p.eat_kw("outs").then(|| Generic::operands(p)).transpose()? else { return p.err("linalg.map: outs(..)") };
        let ([init], [init_ty]) = (&outs[..], &outs_ty[..]) else { return p.err("linalg.map: one init") };
        let attrs = p.opt_dict()?;
        let mapper = match short {
            Some((name, given)) => {
                let types: Vec<Type<'_>> = inputs_ty.iter().chain([init_ty]).cloned().collect();
                RegionBuilder::new(p.opt(), &[], &[], &types).payload(&name, given, false, false)
            }
            None => Dst::parse_long(p)?,
        };
        let op = Map { inputs, init: init.clone(), mapper, inputs_ty, init_ty: init_ty.clone(), result: Dst::results(&outs_ty), attrs, loc: p.opt_loc()? };
        Self::owned(op, p)
    }
}

/// `linalg.reduce`：同 map，多一个 ` dimensions = [..] `；短形式的 payload 是 `(init, 输入..)`。
/// 输入与 init 个数相同（`SameVariadicOperandSize`，通用形式里没有 operandSegmentSizes）：并成一组，写的时候对半分。
#[mlir::op("linalg.reduce", custom, results(result))]
pub struct Reduce<'a> {
    #[slot(operands_ty, name = "operands")]
    pub operands: Vec<Value<'a>>,
    #[attr(name = "dimensions")]
    pub dimensions: Attribute<'a>,
    #[region(name = "combiner")]
    pub combiner: Region<'a>,
    #[dtype(name = "operands_ty")]
    pub operands_ty: Vec<Type<'a>>,
    #[dtype(name = "result")]
    pub result: Vec<Type<'a>>,
}

impl Print for Reduce<'_> {
    fn print(&self, p: &mut Printer<'_, '_>) -> fmt::Result {
        let half = self.operands.len() / 2;
        p.op_name(Self::NAME)?;
        let short = Dst::short(&self.combiner, true, true);
        if let Some(payload) = short {
            Dst::print_short(p, payload)?;
        }
        let (ins, outs) = self.operands.split_at(half);
        let (ins_ty, outs_ty) = self.operands_ty.split_at(half);
        write!(p, " ins({} : {}) outs({} : {})", Sep(ins, ", "), Sep(ins_ty, ", "), Sep(outs, ", "), Sep(outs_ty, ", "))?;
        Dst::print_dense(p, "dimensions", &self.dimensions)?;
        p.attr_dict("", &self.attrs, &[])?;
        if short.is_none() {
            Dst::print_long(p, &self.combiner)?;
        }
        p.loc(&self.loc)
    }
}

impl Parse for Reduce<'_> {
    fn parse(p: &mut Parser<'_, '_>) -> R<Self> {
        let short = Dst::parse_short(p)?;
        let (Some((mut operands, mut operands_ty)), Some((inits, inits_ty))) = (p.eat_kw("ins").then(|| Generic::operands(p)).transpose()?, p.eat_kw("outs").then(|| Generic::operands(p)).transpose()?) else {
            return p.err("linalg.reduce: ins(..) outs(..)");
        };
        let dimensions = Dst::parse_dense(p, "dimensions")?;
        let attrs = p.opt_dict()?;
        let result = Dst::results(&inits_ty);
        operands.extend(inits);
        operands_ty.extend(inits_ty);
        let combiner = match short {
            Some((name, given)) => RegionBuilder::new(p.opt(), &[], &[], &operands_ty).payload(&name, given, true, true),
            None => Dst::parse_long(p)?,
        };
        let op = Reduce { operands, dimensions, combiner, operands_ty, result, attrs, loc: p.opt_loc()? };
        Self::owned(op, p)
    }
}

/// `linalg.elementwise kind=#linalg.elementwise_kind<abs> [indexing_maps = [..]] ins(..) outs(..)`：
/// 体按 kind 是一元 / 二元 / 三元函数（`ElementwiseOp::regionBuilder`）；映射缺省是 arity + 1 个恒等。
#[mlir::op("linalg.elementwise", custom, results(result_tensors))]
pub struct Elementwise<'a> {
    #[slot(inputs_ty, name = "inputs")]
    pub inputs: Vec<Value<'a>>,
    #[slot(outputs_ty, name = "outputs")]
    pub outputs: Vec<Value<'a>>,
    #[attr(name = "kind")]
    pub kind: Attribute<'a>,
    #[attr(name = "indexing_maps")]
    pub indexing_maps: Option<Attribute<'a>>,
    #[region(name = "region")]
    pub region: Region<'a>,
    #[dtype(name = "inputs_ty")]
    pub inputs_ty: Vec<Type<'a>>,
    #[dtype(name = "outputs_ty")]
    pub outputs_ty: Vec<Type<'a>>,
    #[dtype(name = "result_tensors")]
    pub result_tensors: Vec<Type<'a>>,
}

impl Elementwise<'_> {
    /// kind 的名字（`#linalg.elementwise_kind<abs>` ⇒ `abs`）与它的元数。
    fn arity(kind: &Attribute<'_>) -> Option<(String, usize)> {
        let Attribute::Extended { ext: Extended { name, body: Some(b), .. }, .. } = kind else { return None };
        let k = b.strip_prefix('<')?.strip_suffix('>')?.trim();
        let n = match k {
            "exp" | "log" | "abs" | "ceil" | "floor" | "negf" | "reciprocal" | "round" | "sqrt" | "rsqrt" | "square" | "tanh" | "erf" => 1,
            "add" | "sub" | "mul" | "div" | "div_unsigned" | "max_signed" | "min_signed" | "max_unsigned" | "min_unsigned" | "powf" => 2,
            "select" => 3,
            _ => return None,
        };
        (name == "linalg.elementwise_kind").then(|| (String::from(k), n))
    }

    /// 缺省映射：arity + 1 个 `rank` 维的恒等。
    fn defaults(arity: usize, rank: usize) -> Vec<String> {
        let dims = (0..rank).map(|d| alloc::format!("d{d}")).collect::<Vec<_>>().join(", ");
        alloc::vec![alloc::format!("({dims}) -> ({dims})"); arity + 1]
    }
}

impl Print for Elementwise<'_> {
    fn print(&self, p: &mut Printer<'_, '_>) -> fmt::Result {
        let (Some((_, arity)), Some(maps), Some(rank)) = (Self::arity(&self.kind), &self.indexing_maps, self.outputs_ty.last().and_then(|t| t.shape().map(|s| s.len()))) else {
            return self.print_generic(p);
        };
        p.op_name(Self::NAME)?;
        write!(p, " kind={}", self.kind)?;
        let defaults = Self::defaults(arity, rank);
        if !Contraction::is_default(p, maps, &defaults.iter().map(String::as_str).collect::<Vec<_>>()) {
            write!(p, " indexing_maps = {maps}")?;
        }
        Named::print(p, &[], &self.attrs, (&self.inputs, &self.inputs_ty), (&self.outputs, &self.outputs_ty), &self.result_tensors, &[])?;
        p.loc(&self.loc)
    }
}

impl Parse for Elementwise<'_> {
    fn parse(p: &mut Parser<'_, '_>) -> R<Self> {
        if !p.eat_kw("kind") {
            return p.err("linalg.elementwise: expected `kind`");
        }
        p.expect("=")?;
        let kind = p.attr()?;
        let Some((k, arity)) = Self::arity(&kind) else { return p.err("expected ElementwiseKind attribute") };
        let given = if p.eat_kw("indexing_maps") {
            p.expect("=")?;
            Some(p.attr()?)
        } else {
            None
        };
        let n = Named::parse(p)?;
        let rank = n.outputs_ty.last().and_then(|t| t.shape().map(|s| s.len())).unwrap_or(0);
        let defaults = Self::defaults(arity, rank);
        let Some(indexing_maps) = given.or_else(|| Contraction::defaults(&defaults.iter().map(String::as_str).collect::<Vec<_>>())) else {
            return p.err("linalg.elementwise: indexing maps");
        };
        let (a0, a1, a2) = (Scalar::Arg(0), Scalar::Arg(1), Scalar::Arg(2));
        let body = match arity {
            1 => Scalar::Unary(&k, &a0),
            2 => Scalar::Binary(&k, &a0, &a1),
            _ => Scalar::Ternary(&k, &a0, &a1, &a2),
        };
        let Some(region) = n.region(p.opt(), &[], &[], core::slice::from_ref(&body)) else {
            return p.err("linalg.elementwise: the region builder cannot build a body for these types");
        };
        let op = Elementwise { inputs: n.inputs, outputs: n.outputs, kind, indexing_maps: Some(indexing_maps), region, inputs_ty: n.inputs_ty, outputs_ty: n.outputs_ty, result_tensors: n.results, attrs: n.attrs, loc: p.opt_loc()? };
        Self::owned(op, p)
    }
}

/// 目标式 op 的模板（`MlirOpt::upstream` 注入，盖过生成的）。
pub fn dst_templates() -> Vec<crate::Template> {
    alloc::vec![Transpose::template(), Broadcast::template(), Map::template(), Reduce::template(), Elementwise::template()]
}
