//! `llvm` 里 ODS 把语法交给 C++ 的 op，手写读写后注入（`MlirOpt::upstream`），`llvm.gen.rs` 不动。
//!
//! 照 LLVM 23.1.5 `LLVMDialect.cpp` 的 `print` / `parse` 写，直接在通用的 [`Operation`] 上读写（这几个 op 的固有属性多，
//! `llvm.func` 有六十多个），类型化读取照用生成的结构体（`llvm::LLVMFuncOp` 等）：
//!
//! - `llvm.func`：`llvm.func [linkage] [hidden|protected] [(local_)unnamed_addr] [cconv] @f(%a: T {attrs}, ...) [-> R]
//!   [comdat(@c)] [attributes {...}] [{ body }]`；声明（没有函数体）的形参只写类型，可变参数写 `...`
//! - `llvm.call`：`llvm.call [cconv] [tail|musttail|notail] @f(%a, ...) [vararg(!llvm.func<..>)] {attrs} : (T {attrs}, ...) -> R`；
//!   间接调用 `llvm.call %fp(...) : !llvm.ptr, (...) -> R`
//! - `llvm.icmp` / `llvm.fcmp`：`llvm.icmp "slt" %a, %b {attrs} : T`（结果是 `i1` 或同形的 `i1` 向量）
//! - `llvm.getelementptr`：`llvm.getelementptr [inbounds|nusw|nuw] %p[%i, 1] {attrs} : (T, ...) -> R, E`
//!
//! 打不出来的情形（`vscale_range`、调用的 op bundle 等少见写法）印通用形式；读不懂的写法交回原样文本。
use crate::common::{Attribute, BlockArg, Extended, FunctionType, NamedAttr, Operation, Region, ShapedKind, Str, Template, Type};
use crate::generator::Printer;
use crate::llvm::{CallOp, FCmpOp, GEPOp, ICmpOp, LLVMFuncOp};
use crate::llvm_types::LlvmType;
use crate::parser::{Parser, R};
use crate::Op;
use alloc::boxed::Box;
use alloc::format;
use alloc::string::String;
use alloc::vec;
use alloc::vec::Vec;
use core::fmt::{self, Write};

/// `llvm` 手写的读写。
pub struct LlvmHand;

/// `ICmpPredicate` 按编号的名字
const ICMP: [&str; 10] = ["eq", "ne", "slt", "sle", "sgt", "sge", "ult", "ule", "ugt", "uge"];
/// `FCmpPredicate` 按编号的名字
const FCMP: [&str; 16] = ["_false", "oeq", "ogt", "oge", "olt", "ole", "one", "ord", "ueq", "ugt", "uge", "ult", "ule", "une", "uno", "_true"];
/// 链接方式的关键字（`#llvm.linkage<…>` 的内容）
const LINKAGES: [&str; 11] = ["private", "internal", "available_externally", "linkonce", "weak", "common", "appending", "extern_weak", "linkonce_odr", "weak_odr", "external"];
/// `visibility_` 按编号的关键字（0 不写）
const VISIBILITIES: [&str; 3] = ["", "hidden", "protected"];
/// `unnamed_addr` 按编号的关键字（0 不写）
const UNNAMED_ADDRS: [&str; 3] = ["", "local_unnamed_addr", "unnamed_addr"];
/// 尾调用方式的关键字（`#llvm.tailcallkind<…>` 的内容）
const TAIL_KINDS: [&str; 4] = ["none", "tail", "musttail", "notail"];
/// `rawConstantIndices` 里「这一项是下一个动态下标」的标记（`GEPOp::kDynamicIndex`）
const DYNAMIC_INDEX: i64 = i32::MIN as i64;
/// `noWrapFlags` 的位：`inbounds_flag` / `nusw` / `nuw`；`inbounds` = 前两个
const GEP_INBOUNDS_FLAG: i64 = 1;
const GEP_NUSW: i64 = 2;
const GEP_NUW: i64 = 4;

impl LlvmHand {
    /// 注入 `MlirOpt` 的五个模板（缺省属性照用生成的）。
    pub fn templates() -> [Template; 5] {
        let hand = |generated: Template, parse: for<'a> fn(&mut Parser<'a, '_>) -> R<Operation<'a>>, print: fn(&Operation<'_>, &mut Printer<'_, '_>) -> Option<fmt::Result>| Template { custom: true, parse, print, format: || None, ..generated };
        [
            hand(LLVMFuncOp::template(), Self::parse_func, Self::print_func),
            hand(CallOp::template(), Self::parse_call, Self::print_call),
            hand(ICmpOp::template(), Self::parse_icmp, Self::print_icmp),
            hand(FCmpOp::template(), Self::parse_fcmp, Self::print_fcmp),
            hand(GEPOp::template(), Self::parse_gep, Self::print_gep),
        ]
    }

    // ---- 公用 ------------------------------------------------------------------------

    /// 固有属性 `name`（`<{...}>` 里的）
    fn prop<'o, 'a>(op: &'o Operation<'a>, name: &str) -> Option<&'o Attribute<'a>> {
        match &op.properties {
            Some(Attribute::Dict(d)) => d.iter().find(|a| a.name == name).and_then(|a| a.value.as_ref()),
            _ => None,
        }
    }

    /// 整数属性的值
    fn int(a: Option<&Attribute<'_>>) -> Option<i64> {
        match a {
            Some(Attribute::Int { lit, .. }) => lit.parse().ok(),
            _ => None,
        }
    }

    /// `#dialect.name<body>` 的 body（不带尖括号）
    fn enum_body<'o>(a: Option<&'o Attribute<'_>>, name: &str) -> Option<&'o str> {
        match a {
            Some(Attribute::Extended { ext, .. }) if ext.name == name => ext.body.as_deref()?.strip_prefix('<')?.strip_suffix('>'),
            _ => None,
        }
    }

    /// `#dialect.name<body>`
    fn enum_attr<'a>(name: &str, body: &str) -> Attribute<'a> {
        Attribute::Extended { ext: Box::new(Extended { name: Str::Owned(name.into()), body: Some(Str::Owned(format!("<{body}>"))), params: Vec::new() }), ty: None }
    }

    fn i64_attr<'a>(v: i64) -> Attribute<'a> {
        Attribute::Int { lit: Str::Owned(format!("{v}")), ty: Some(Type::int(64)) }
    }

    fn i32_array<'a>(v: &[i64]) -> Attribute<'a> {
        Attribute::DenseArray { ty: Type::int(32), values: v.iter().map(|x| Str::Owned(format!("{x}"))).collect() }
    }

    /// `array<i32: …>` 的各项
    fn i32s(a: Option<&Attribute<'_>>) -> Option<Vec<i64>> {
        match a {
            Some(Attribute::DenseArray { values, .. }) => values.iter().map(|v| v.parse().ok()).collect(),
            _ => None,
        }
    }

    /// 固有属性与可丢弃属性合在一起按名字排好（C++ `getAttrs()`），去掉 `elide` 里的
    fn visible<'a>(op: &Operation<'a>, elide: &[&str]) -> Vec<NamedAttr<'a>> {
        let props = match &op.properties {
            Some(Attribute::Dict(d)) => d.as_slice(),
            _ => &[],
        };
        let mut all: Vec<NamedAttr<'a>> = props.iter().chain(&op.attributes).filter(|a| !elide.contains(&&*a.name)).cloned().collect();
        all.sort_by(|a, b| a.name.cmp(&b.name));
        all
    }

    /// `fastmathFlags` 是 `none` 就不印（`processFMFAttr`）
    fn fastmath_elided(op: &Operation<'_>) -> bool {
        Self::enum_body(Self::prop(op, "fastmathFlags"), "llvm.fastmath") == Some("none")
    }

    /// 读到的属性字典按 ODS 分成固有属性（`props` 里，按名字排好）与可丢弃属性
    fn split<'a>(p: &Parser<'a, '_>, name: &str, mut props: Vec<NamedAttr<'a>>, dict: Vec<NamedAttr<'a>>) -> (Option<Attribute<'a>>, Vec<NamedAttr<'a>>) {
        let inherent = p.opt().op_info(name).map_or(&[][..], |i| i.inherent);
        let mut attrs = Vec::new();
        for a in dict {
            if inherent.contains(&&*a.name) { props.push(a) } else { attrs.push(a) }
        }
        props.sort_by(|a, b| a.name.cmp(&b.name));
        ((!props.is_empty()).then_some(Attribute::Dict(props)), attrs)
    }

    fn named<'a>(name: &str, value: Attribute<'a>) -> NamedAttr<'a> {
        NamedAttr { name: Str::Owned(name.into()), value: Some(value) }
    }

    /// `i` 号的非空字典（`arg_attrs` / `res_attrs`）
    fn nth<'o, 'a>(attrs: Option<&'o Attribute<'a>>, i: usize) -> Option<&'o Attribute<'a>> {
        match attrs {
            Some(Attribute::Array(ds)) => ds.get(i).filter(|d| !matches!(d, Attribute::Dict(xs) if xs.is_empty())),
            _ => None,
        }
    }

    /// 各字典，除非全是空的
    fn dicts<'a>(ds: Vec<Vec<NamedAttr<'a>>>) -> Option<Attribute<'a>> {
        ds.iter().any(|d| !d.is_empty()).then(|| Attribute::Array(ds.into_iter().map(Attribute::Dict).collect()))
    }

    /// `(T {attrs}, ...)`
    fn types_with_attrs(p: &mut Printer<'_, '_>, types: &[Type<'_>], attrs: Option<&Attribute<'_>>) -> fmt::Result {
        p.write_char('(')?;
        for (i, t) in types.iter().enumerate() {
            write!(p, "{}{t}", if i > 0 { ", " } else { "" })?;
            if let Some(d) = Self::nth(attrs, i) {
                write!(p, " {d}")?;
            }
        }
        p.write_char(')')
    }

    /// `(T {attrs}, ...)`，读回各类型与字典
    fn parse_types_with_attrs<'a>(p: &mut Parser<'a, '_>) -> R<(Vec<Type<'a>>, Vec<Vec<NamedAttr<'a>>>)> {
        p.expect("(")?;
        let items = p.list(")", |p| Ok((p.ty()?, p.opt_dict()?)))?;
        Ok(items.into_iter().unzip())
    }

    // ---- llvm.icmp / llvm.fcmp ---------------------------------------------------------

    fn print_icmp(op: &Operation<'_>, p: &mut Printer<'_, '_>) -> Option<fmt::Result> {
        Self::print_cmp(op, p, &ICMP)
    }

    fn print_fcmp(op: &Operation<'_>, p: &mut Printer<'_, '_>) -> Option<fmt::Result> {
        Self::print_cmp(op, p, &FCMP)
    }

    /// `llvm.icmp "slt" %a, %b {attrs} : T`
    fn print_cmp(op: &Operation<'_>, p: &mut Printer<'_, '_>, names: &[&str]) -> Option<fmt::Result> {
        let pred = names.get(usize::try_from(Self::int(Self::prop(op, "predicate"))?).ok()?)?;
        let ([a, b], [t, _]) = (op.operands.as_slice(), op.ty.inputs.as_slice()) else { return None };
        let mut elide = vec!["predicate"];
        if Self::fastmath_elided(op) {
            elide.push("fastmathFlags");
        }
        let attrs = Self::visible(op, &elide);
        Some((|| {
            p.op_name(&op.name)?;
            write!(p, " \"{pred}\" {a}, {b}")?;
            p.attr_dict("", &attrs, &[])?;
            write!(p, " : {t}")?;
            p.loc(&op.loc)
        })())
    }

    fn parse_icmp<'a>(p: &mut Parser<'a, '_>) -> R<Operation<'a>> {
        Self::parse_cmp(p, "llvm.icmp", &ICMP)
    }

    fn parse_fcmp<'a>(p: &mut Parser<'a, '_>) -> R<Operation<'a>> {
        Self::parse_cmp(p, "llvm.fcmp", &FCMP)
    }

    fn parse_cmp<'a>(p: &mut Parser<'a, '_>, name: &'static str, names: &[&str]) -> R<Operation<'a>> {
        let pred = p.string()?;
        let Some(index) = names.iter().position(|n| *n == pred) else { return p.err(format!("'{pred}' is an incorrect value of the 'predicate' attribute")) };
        let a = p.value()?;
        p.expect(",")?;
        let b = p.value()?;
        let dict = p.opt_dict()?;
        p.expect(":")?;
        let t = p.ty()?;
        // `getI1SameShape`：向量就是同形的 `i1` 向量
        let res = match &t {
            Type::Shaped(s) if s.kind == ShapedKind::Vector => Type::Shaped(Box::new(crate::common::Shaped { elem: Box::new(Type::I1), ..(**s).clone() })),
            _ => Type::I1,
        };
        let mut props = vec![Self::named("predicate", Self::i64_attr(i64::try_from(index).unwrap_or(0)))];
        // C++ 的 parse 给 fcmp 写上缺省的 fastmath
        if name == "llvm.fcmp" && !dict.iter().any(|a| a.name == "fastmathFlags") {
            props.push(Self::named("fastmathFlags", Self::enum_attr("llvm.fastmath", "none")));
        }
        let (properties, attributes) = Self::split(p, name, props, dict);
        let loc = p.opt_loc()?;
        Ok(Operation { name: name.into(), operands: vec![a, b], properties, attributes, ty: FunctionType { inputs: vec![t.clone(), t], results: vec![res] }, loc, ..Operation::default() })
    }

    // ---- llvm.getelementptr ------------------------------------------------------------

    /// `noWrapFlags` 的写法（`stringifyGEPNoWrapFlags`）：0 不写
    fn gep_flags(v: i64) -> String {
        let mut parts = Vec::new();
        match v & (GEP_INBOUNDS_FLAG | GEP_NUSW) {
            3 => parts.push("inbounds"),
            GEP_NUSW => parts.push("nusw"),
            GEP_INBOUNDS_FLAG => parts.push("inbounds_flag"),
            _ => {}
        }
        if v & GEP_NUW != 0 {
            parts.push("nuw");
        }
        parts.join("|")
    }

    fn print_gep(op: &Operation<'_>, p: &mut Printer<'_, '_>) -> Option<fmt::Result> {
        let raw = Self::i32s(Self::prop(op, "rawConstantIndices"))?;
        let Some(Attribute::Type(elem)) = Self::prop(op, "elem_type") else { return None };
        let flags = Self::gep_flags(Self::int(Self::prop(op, "noWrapFlags")).unwrap_or(0));
        let (base, dynamic) = op.operands.split_first()?;
        if raw.iter().filter(|&&i| i == DYNAMIC_INDEX).count() != dynamic.len() || op.ty.results.len() != 1 {
            return None;
        }
        let attrs = Self::visible(op, &["elem_type", "noWrapFlags", "rawConstantIndices"]);
        Some((|| {
            p.op_name(&op.name)?;
            p.write_char(' ')?;
            if !flags.is_empty() {
                write!(p, "{flags} ")?;
            }
            write!(p, "{base}[")?;
            let mut next = dynamic.iter();
            for (i, &k) in raw.iter().enumerate() {
                p.write_str(if i > 0 { ", " } else { "" })?;
                match (k, next.clone().next()) {
                    (DYNAMIC_INDEX, Some(v)) => {
                        next.next();
                        write!(p, "{v}")?;
                    }
                    _ => write!(p, "{k}")?,
                }
            }
            p.write_char(']')?;
            p.attr_dict("", &attrs, &[])?;
            p.write_str(" : (")?;
            for (i, t) in op.ty.inputs.iter().enumerate() {
                write!(p, "{}{t}", if i > 0 { ", " } else { "" })?;
            }
            write!(p, ") -> {}, {elem}", op.ty.results[0])?;
            p.loc(&op.loc)
        })())
    }

    fn parse_gep<'a>(p: &mut Parser<'a, '_>) -> R<Operation<'a>> {
        let mut flags = 0i64;
        while p.peek_ws() != Some(b'%') {
            flags |= match p.ident()? {
                "inbounds" => GEP_INBOUNDS_FLAG | GEP_NUSW,
                "inbounds_flag" => GEP_INBOUNDS_FLAG,
                "nusw" => GEP_NUSW,
                "nuw" => GEP_NUW,
                "none" => 0,
                other => return p.err(format!("unknown getelementptr flag {other}")),
            };
            p.eat("|");
        }
        let base = p.value()?;
        p.expect("[")?;
        let items = p.list("]", |p| {
            if p.peek_ws() == Some(b'%') {
                return Ok(Err(p.value()?));
            }
            let neg = p.eat("-");
            let v: i64 = p.number()?;
            Ok(Ok(if neg { -v } else { v }))
        })?;
        let dict = p.opt_dict()?;
        p.expect(":")?;
        let ty = p.fn_ty()?;
        p.expect(",")?;
        let elem = p.ty()?;
        let mut operands = vec![base];
        let mut raw = Vec::new();
        for item in items {
            match item {
                Ok(k) => raw.push(k),
                Err(v) => {
                    raw.push(DYNAMIC_INDEX);
                    operands.push(v);
                }
            }
        }
        let mut props = vec![Self::named("elem_type", Attribute::Type(elem)), Self::named("rawConstantIndices", Self::i32_array(&raw))];
        props.push(Self::named("noWrapFlags", Attribute::Int { lit: Str::Owned(format!("{flags}")), ty: Some(Type::int(32)) }));
        let (properties, attributes) = Self::split(p, "llvm.getelementptr", props, dict);
        let loc = p.opt_loc()?;
        Ok(Operation { name: "llvm.getelementptr".into(), operands, properties, attributes, ty, loc, ..Operation::default() })
    }

    // ---- llvm.call ---------------------------------------------------------------------

    fn print_call(op: &Operation<'_>, p: &mut Printer<'_, '_>) -> Option<fmt::Result> {
        let sizes = Self::i32s(Self::prop(op, "operandSegmentSizes"))?;
        let [callee_n, bundle_n] = sizes[..] else { return None };
        let (callee_n, bundle_n) = (usize::try_from(callee_n).ok()?, usize::try_from(bundle_n).ok()?);
        let bundle_sizes = Self::i32s(Self::prop(op, "op_bundle_sizes"))?;
        let tags: Vec<&str> = match Self::prop(op, "op_bundle_tags") {
            Some(Attribute::Array(ts)) => ts.iter().map(|t| if let Attribute::Str { lit, .. } = t { Some(&**lit) } else { None }).collect::<Option<_>>()?,
            None => Vec::new(),
            Some(_) => return None,
        };
        if tags.len() != bundle_sizes.len() || bundle_sizes.iter().sum::<i64>() != i64::try_from(bundle_n).ok()? || op.operands.len() != callee_n + bundle_n || op.ty.inputs.len() != callee_n + bundle_n {
            return None;
        }
        let callee_operands = op.operands.get(..callee_n)?;
        let callee = Self::prop(op, "callee");
        let (indirect, args) = match callee {
            Some(_) => (None, callee_operands),
            None => {
                let (f, rest) = callee_operands.split_first()?;
                (Some(f), rest)
            }
        };
        let arg_types = op.ty.inputs.get(callee_n - args.len()..callee_n)?;
        let (bundle_values, bundle_types) = (&op.operands[callee_n..], &op.ty.inputs[callee_n..]);
        let cconv = Self::enum_body(Self::prop(op, "CConv"), "llvm.cconv").filter(|c| *c != "ccc");
        let tail = Self::enum_body(Self::prop(op, "TailCallKind"), "llvm.tailcallkind").filter(|t| *t != "none");
        let mut elide = vec!["callee", "TailCallKind", "var_callee_type", "CConv", "operandSegmentSizes", "op_bundle_sizes", "op_bundle_tags", "arg_attrs", "res_attrs"];
        if Self::fastmath_elided(op) {
            elide.push("fastmathFlags");
        }
        let attrs = Self::visible(op, &elide);
        Some((|| {
            p.op_name(&op.name)?;
            p.write_char(' ')?;
            if let Some(c) = cconv {
                write!(p, "{c} ")?;
            }
            if let Some(t) = tail {
                write!(p, "{t} ")?;
            }
            match (callee, indirect) {
                (Some(c), _) => write!(p, "{c}")?,
                (None, Some(f)) => write!(p, "{f}")?,
                (None, None) => {}
            }
            p.write_char('(')?;
            for (i, a) in args.iter().enumerate() {
                write!(p, "{}{a}", if i > 0 { ", " } else { "" })?;
            }
            p.write_char(')')?;
            if let Some(Attribute::Type(t)) = Self::prop(op, "var_callee_type") {
                write!(p, " vararg({t})")?;
            }
            // `printOpBundles`：`["tag"(%a, %b : T, T), "tag2"()]`
            if !tags.is_empty() {
                p.write_str(" [")?;
                let mut at = 0;
                for (i, (tag, &n)) in tags.iter().zip(&bundle_sizes).enumerate() {
                    let n = usize::try_from(n).unwrap_or(0);
                    write!(p, "{}\"{tag}\"(", if i > 0 { ", " } else { "" })?;
                    if n > 0 {
                        for (j, v) in bundle_values[at..at + n].iter().enumerate() {
                            write!(p, "{}{v}", if j > 0 { ", " } else { "" })?;
                        }
                        p.write_str(" : ")?;
                        for (j, t) in bundle_types[at..at + n].iter().enumerate() {
                            write!(p, "{}{t}", if j > 0 { ", " } else { "" })?;
                        }
                    }
                    p.write_char(')')?;
                    at += n;
                }
                p.write_char(']')?;
            }
            p.attr_dict("", &attrs, &[])?;
            p.write_str(" : ")?;
            if indirect.is_some() {
                write!(p, "{}, ", op.ty.inputs[0])?;
            }
            Self::types_with_attrs(p, arg_types, Self::prop(op, "arg_attrs"))?;
            p.write_str(" -> ")?;
            let res_attrs = Self::prop(op, "res_attrs");
            match op.ty.results.as_slice() {
                [t] if Self::nth(res_attrs, 0).is_none() && !matches!(t, Type::Function(_)) => write!(p, "{t}")?,
                ts => Self::types_with_attrs(p, ts, res_attrs)?,
            }
            p.loc(&op.loc)
        })())
    }

    fn parse_call<'a>(p: &mut Parser<'a, '_>) -> R<Operation<'a>> {
        let (mut cconv, mut tail) = (None, None);
        while p.peek_ws().is_some_and(|c| c.is_ascii_alphabetic() || c == b'_') {
            let kw = p.ident()?;
            if TAIL_KINDS.contains(&kw) { tail = Some(kw) } else { cconv = Some(kw) }
        }
        let mut operands = Vec::new();
        let callee = if p.peek_ws() == Some(b'@') {
            Some(p.symbol()?)
        } else {
            operands.push(p.value()?);
            None
        };
        p.expect("(")?;
        operands.extend(p.list(")", Parser::value)?);
        let var_callee_type = if p.eat_kw("vararg") {
            p.expect("(")?;
            let t = p.ty()?;
            p.expect(")")?;
            Some(t)
        } else {
            None
        };
        // `parseOpBundles`：`["tag"(%a : T), ...]`
        let (mut bundle_values, mut bundle_types, mut bundle_sizes, mut tags) = (Vec::new(), Vec::new(), Vec::new(), Vec::new());
        let bundled = p.eat("[");
        if bundled {
            let bundles = p.list("]", |p| {
                let tag = p.string()?;
                p.expect("(")?;
                let (values, types) = if p.eat(")") {
                    (Vec::new(), Vec::new())
                } else {
                    let mut values = vec![p.value()?];
                    while p.eat(",") {
                        values.push(p.value()?);
                    }
                    p.expect(":")?;
                    let mut types = vec![p.ty()?];
                    while p.eat(",") {
                        types.push(p.ty()?);
                    }
                    p.expect(")")?;
                    (values, types)
                };
                if values.len() != types.len() {
                    return p.err("operand bundle: as many types as operands");
                }
                Ok((tag, values, types))
            })?;
            for (tag, values, types) in bundles {
                bundle_sizes.push(i64::try_from(values.len()).unwrap_or(0));
                tags.push(Attribute::Str { lit: tag.into(), ty: None });
                bundle_values.extend(values);
                bundle_types.extend(types);
            }
        }
        let dict = p.opt_dict()?;
        p.expect(":")?;
        let mut inputs = Vec::new();
        if callee.is_none() {
            inputs.push(p.ty()?);
            p.expect(",")?;
        }
        let (arg_types, arg_dicts) = Self::parse_types_with_attrs(p)?;
        inputs.extend(arg_types);
        p.expect("->")?;
        let (results, res_dicts) = if p.peek_ws() == Some(b'(') { Self::parse_types_with_attrs(p)? } else { (vec![p.ty()?], vec![Vec::new()]) };
        let n = i64::try_from(operands.len()).unwrap_or(0);
        let bundle_n = i64::try_from(bundle_values.len()).unwrap_or(0);
        operands.extend(bundle_values);
        inputs.extend(bundle_types);
        let mut props = vec![Self::named("op_bundle_sizes", Self::i32_array(&bundle_sizes)), Self::named("operandSegmentSizes", Self::i32_array(&[n, bundle_n]))];
        if bundled && !tags.is_empty() {
            props.push(Self::named("op_bundle_tags", Attribute::Array(tags)));
        }
        if let Some(c) = callee {
            props.push(Self::named("callee", Attribute::SymbolRef(vec![c.into()])));
        }
        // C++ 的 parse 总把这几个写上（缺省值也写）
        props.push(Self::named("CConv", Self::enum_attr("llvm.cconv", cconv.unwrap_or("ccc"))));
        props.push(Self::named("TailCallKind", Self::enum_attr("llvm.tailcallkind", tail.unwrap_or("none"))));
        if !dict.iter().any(|a| a.name == "fastmathFlags") {
            props.push(Self::named("fastmathFlags", Self::enum_attr("llvm.fastmath", "none")));
        }
        if let Some(t) = var_callee_type {
            props.push(Self::named("var_callee_type", Attribute::Type(t)));
        }
        if let Some(a) = Self::dicts(arg_dicts) {
            props.push(Self::named("arg_attrs", a));
        }
        if let Some(a) = Self::dicts(res_dicts) {
            props.push(Self::named("res_attrs", a));
        }
        let (properties, attributes) = Self::split(p, "llvm.call", props, dict);
        let loc = p.opt_loc()?;
        Ok(Operation { name: "llvm.call".into(), operands, properties, attributes, ty: FunctionType { inputs, results }, loc, ..Operation::default() })
    }

    // ---- llvm.func ---------------------------------------------------------------------

    /// `LLVM::isCompatibleType` 拒收的内建类型（tensor / memref、index、tuple、函数类型……）之外都收；
    /// 方言类型（`!llvm.*`、ptr 方言的 `!ptr.ptr<…>`）收
    fn compatible(t: &Type<'_>) -> bool {
        match t {
            Type::Integer { .. } | Type::Float(_) | Type::Extended(_) => true,
            Type::Shaped(s) => s.kind == ShapedKind::Vector && Self::compatible(&s.elem),
            _ => false,
        }
    }

    fn print_func(op: &Operation<'_>, p: &mut Printer<'_, '_>) -> Option<fmt::Result> {
        let Some(Attribute::Str { lit: name, .. }) = Self::prop(op, "sym_name") else { return None };
        let Some(Attribute::Type(fty)) = Self::prop(op, "function_type") else { return None };
        let Ok(LlvmType::Func { ret, params, vararg }) = LlvmType::try_from(fty) else { return None };
        // 读回去重建的函数类型要和原来一字不差；`unnamed_addr` 读回去总有（C++ 的 parse 总写上），原来没有就不印成自定义形式
        let rebuilt: Type<'_> = LlvmType::Func { ret: ret.clone(), params: params.clone(), vararg }.into();
        if Self::prop(op, "vscale_range").is_some() || rebuilt != *fty || Self::prop(op, "unnamed_addr").is_none() {
            return None;
        }
        let linkage = Self::enum_body(Self::prop(op, "linkage"), "llvm.linkage").filter(|l| *l != "external");
        let visibility = VISIBILITIES.get(usize::try_from(Self::int(Self::prop(op, "visibility_")).unwrap_or(0)).ok()?)?;
        let unnamed = UNNAMED_ADDRS.get(usize::try_from(Self::int(Self::prop(op, "unnamed_addr")).unwrap_or(0)).ok()?)?;
        let cconv = Self::enum_body(Self::prop(op, "CConv"), "llvm.cconv").filter(|c| *c != "ccc");
        let body = op.regions.first().filter(|r| !r.blocks.is_empty());
        let args = body.and_then(|r| r.blocks.first()).map_or(&[][..], |b| b.args.as_slice());
        if body.is_some() && args.len() != params.len() {
            return None;
        }
        let void = matches!(LlvmType::try_from(&*ret), Ok(LlvmType::Void));
        let (arg_attrs, res_attrs) = (Self::prop(op, "arg_attrs"), Self::prop(op, "res_attrs"));
        let attrs = Self::visible(op, &["sym_name", "function_type", "arg_attrs", "res_attrs", "linkage", "CConv", "visibility_", "comdat", "unnamed_addr", "vscale_range"]);
        Some((|| {
            p.op_name(&op.name)?;
            p.write_char(' ')?;
            for kw in [linkage, Some(*visibility).filter(|v| !v.is_empty()), Some(*unnamed).filter(|u| !u.is_empty()), cconv].into_iter().flatten() {
                write!(p, "{kw} ")?;
            }
            p.sym_name(name)?;
            p.write_char('(')?;
            for (i, t) in params.iter().enumerate() {
                p.write_str(if i > 0 { ", " } else { "" })?;
                match args.get(i) {
                    Some(a) => write!(p, "%{}: {t}", a.name)?,
                    None => write!(p, "{t}")?,
                }
                if let Some(d) = Self::nth(arg_attrs, i) {
                    write!(p, " {d}")?;
                }
                if let Some(a) = args.get(i) {
                    p.loc(&a.loc)?;
                }
            }
            if vararg {
                p.write_str(if params.is_empty() { "..." } else { ", ..." })?;
            }
            p.write_char(')')?;
            if !void {
                match Self::nth(res_attrs, 0) {
                    None if !matches!(&*ret, Type::Function(_)) => write!(p, " -> {ret}")?,
                    _ => {
                        p.write_str(" -> ")?;
                        Self::types_with_attrs(p, core::slice::from_ref(&*ret), res_attrs)?;
                    }
                }
            }
            if let Some(c) = Self::prop(op, "comdat") {
                write!(p, " comdat({c})")?;
            }
            p.attr_dict("attributes ", &attrs, &[])?;
            if let Some(r) = body {
                p.write_char(' ')?;
                p.region(r, false)?;
            }
            p.loc(&op.loc)
        })())
    }

    fn parse_func<'a>(p: &mut Parser<'a, '_>) -> R<Operation<'a>> {
        let (mut linkage, mut visibility, mut unnamed, mut cconv) = (None, 0i64, 0i64, None);
        while p.peek_ws().is_some_and(|c| c.is_ascii_alphabetic() || c == b'_') {
            let kw = p.ident()?;
            if let Some(i) = VISIBILITIES.iter().position(|v| *v == kw).filter(|&i| i > 0) {
                visibility = i64::try_from(i).unwrap_or(0);
            } else if let Some(i) = UNNAMED_ADDRS.iter().position(|v| *v == kw).filter(|&i| i > 0) {
                unnamed = i64::try_from(i).unwrap_or(0);
            } else if LINKAGES.contains(&kw) {
                linkage = Some(kw);
            } else {
                cconv = Some(kw);
            }
        }
        let sym_name = p.sym_name()?;
        p.expect("(")?;
        let mut vararg = false;
        let entries = p.list(")", |p| {
            if p.eat("...") {
                vararg = true;
                return Ok(None);
            }
            let start = p.here();
            let named = p.peek_ws() == Some(b'%');
            let name = if named {
                let n = p.sigil('%')?;
                p.expect(":")?;
                Some(n)
            } else {
                None
            };
            let ty = p.ty()?;
            let dict = p.opt_dict()?;
            let loc = if named { p.opt_loc()? } else { None };
            let loc = if named { p.loc_or_file(loc, start) } else { None };
            Ok(Some((name.map(|n| BlockArg { name: n.into(), ty: ty.clone(), loc }), ty, dict)))
        })?;
        let (results, res_dicts) = if !p.eat("->") {
            (Vec::new(), Vec::new())
        } else if p.peek_ws() == Some(b'(') {
            Self::parse_types_with_attrs(p)?
        } else {
            (vec![p.ty()?], vec![Vec::new()])
        };
        let comdat = if p.eat_kw("comdat") {
            p.expect("(")?;
            let c = p.attr()?;
            p.expect(")")?;
            Some(c)
        } else {
            None
        };
        let dict = if p.eat_kw("attributes") { p.dict()? } else { Vec::new() };
        let mut body = if p.peek_ws() == Some(b'{') { Some(p.region()?) } else { None };
        // 可变参数只能在最后；形参与返回值都要是 LLVM 兼容的类型（C++ `buildLLVMFunctionType`）
        if entries.iter().rev().skip(1).any(Option::is_none) {
            return p.err("variadic arguments must be in the end of the argument list");
        }
        if !entries.iter().flatten().all(|(_, t, _)| Self::compatible(t)) || !results.iter().all(Self::compatible) {
            return p.err("failed to construct function type: expected LLVM types");
        }
        let (mut args, mut params, mut arg_dicts) = (Vec::new(), Vec::new(), Vec::new());
        for (arg, ty, d) in entries.into_iter().flatten() {
            args.extend(arg);
            params.push(ty);
            arg_dicts.push(d);
        }
        if let Some(b) = body.as_mut().and_then(|r| r.blocks.first_mut()) {
            b.label = (!args.is_empty()).then(|| "bb0".into());
            b.args = args;
        }
        let ret = match results.as_slice() {
            [] => LlvmType::Void.into(),
            [t] => t.clone(),
            _ => return p.err("llvm.func returns at most one value"),
        };
        let function_type: Type<'a> = LlvmType::Func { ret: Box::new(ret), params, vararg }.into();
        let mut props = vec![
            Self::named("sym_name", Attribute::Str { lit: Str::Owned(sym_name), ty: None }),
            Self::named("function_type", Attribute::Type(function_type)),
            Self::named("unnamed_addr", Self::i64_attr(unnamed)),
        ];
        // C++ 的 parse 总把这几个写上（缺省值也写）
        props.push(Self::named("linkage", Self::enum_attr("llvm.linkage", linkage.unwrap_or("external"))));
        props.push(Self::named("visibility_", Self::i64_attr(visibility)));
        props.push(Self::named("CConv", Self::enum_attr("llvm.cconv", cconv.unwrap_or("ccc"))));
        if let Some(c) = comdat {
            props.push(Self::named("comdat", c));
        }
        if let Some(a) = Self::dicts(arg_dicts) {
            props.push(Self::named("arg_attrs", a));
        }
        if let Some(a) = Self::dicts(res_dicts) {
            props.push(Self::named("res_attrs", a));
        }
        let (properties, attributes) = Self::split(p, "llvm.func", props, dict);
        let regions = vec![body.unwrap_or(Region { blocks: Vec::new() })];
        let loc = p.opt_loc()?;
        Ok(Operation { name: "llvm.func".into(), properties, attributes, regions, loc, ..Operation::default() })
    }
}

/// 跳过空白看下一个字节
trait PeekWs {
    fn peek_ws(&mut self) -> Option<u8>;
}

impl PeekWs for Parser<'_, '_> {
    fn peek_ws(&mut self) -> Option<u8> {
        self.here();
        self.peek()
    }
}

