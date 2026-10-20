//! ⭐ The records behind `mlirformat tblgen`: MLIR ODS (`.td`) → `<dialect>.gen.rs`, one `#[mlir::op]` struct per op and a
//! `#[mlir::dialect]` enum. TableGen itself resolves the records (`--dump-json`, classes,
//! `let`s and multiclasses included); this file only reads them.
//!
//! ```text
//! operands     #[slot(T)]; Variadic / Optional ⇒ Vec
//! results      #[dtype], in order (`results(...)`)
//! type vars    one per class of SameOperandsAndResultType / SameTypeOperands / AllTypesMatch /
//!              TypesMatchWith; unspelled ones inferred: i1 like (`getI1SameShape`), element type,
//!              a buildable type (`I1`, `Index`, …)
//! properties   UnitAttr ⇒ bool; integer enums ⇒ a Rust enum; dialect enum attrs (`#arith.overflow<…>`)
//!              ⇒ #[attr(dialect, default)]; the rest ⇒ Attribute (Option when optional)
//! regions / successors   #[region] / #[successor], variadic ⇒ Vec
//! assemblyFormat         kept as is; C++ syntax or unsupported directives ⇒ `generic`
//! ```

use std::collections::{BTreeMap, BTreeSet};
use std::fmt::Write as _;
use std::path::{Path, PathBuf};

use serde_json::{Map, Value as Json};

/// Why records could not be read.
#[derive(Debug)]
pub enum TdError {
    Tblgen(String),
    Json(String),
}

impl std::fmt::Display for TdError {
    fn fmt(&self, f: &mut std::fmt::Formatter<'_>) -> std::fmt::Result {
        match self {
            Self::Tblgen(why) => write!(f, "{why}"),
            Self::Json(why) => write!(f, "records: {why}"),
        }
    }
}

/// ⭐ The resolved TableGen records of one `.td` file (`llvm-tblgen --dump-json`).
pub struct Records {
    all: Map<String, Json>,
    /// The `.td` file's name: ops defined in it are the ones generated.
    file: String,
}

/// One dialect to generate.
pub struct GenDialect {
    /// Namespace (`arith`).
    pub name: String,
    pub ops: Vec<GenOp>,
    /// Integer enums the ops use: name ⇒ cases `(keyword, value)`.
    pub enums: BTreeMap<String, Vec<(String, i64)>>,
}

/// One op to generate.
pub struct GenOp {
    /// Rust struct name (`AddIOp`).
    pub rust: String,
    /// Full op name (`arith.addi`).
    pub name: String,
    pub summary: String,
    /// `None` ⇒ generic form only.
    pub format: Option<String>,
    /// Why there is no custom form (for the doc comment).
    pub generic_why: Option<String>,
    pub results: Vec<String>,
    pub fields: Vec<GenField>,
}

/// One struct field: marker attribute, Rust name and type.
pub struct GenField {
    pub marker: String,
    pub ident: String,
    pub ty: String,
}

/// An operand / result group or a type variable class member.
struct Group {
    name: String,
    variadic: bool,
    result: bool,
    /// MLIR type of a buildable constraint (`i1`, `index`).
    fixed: Option<String>,
    /// One dialect type (`EmitC_LValueType` ⇒ `emitc.lvalue`): `type($x)` prints it stripped.
    strip: Option<String>,
}

const KEYWORDS: &[&str] = &[
    "as", "break", "const", "continue", "crate", "else", "enum", "extern", "false", "fn", "for", "if", "impl", "in", "let", "loop", "match", "mod",
    "move", "mut", "pub", "ref", "return", "self", "Self", "static", "struct", "super", "trait", "true", "type", "unsafe", "use", "where", "while",
    "async", "await", "dyn", "abstract", "become", "box", "do", "final", "macro", "override", "priv", "typeof", "unsized", "virtual", "yield", "try",
    "gen", "attrs", "loc",
];

impl Records {
    /// Parses `td` with the include directories (the in-process TableGen front end, [`super::td`]).
    pub fn parse(td: &Path, includes: &[PathBuf]) -> Result<Self, TdError> {
        let json = super::td::dump_json(td, includes).map_err(|e| TdError::Tblgen(e.to_string()))?;
        Self::from_json(&json, td)
    }

    /// Records already dumped (`llvm-tblgen --dump-json` output) for `td`.
    pub fn from_json(text: &str, td: &Path) -> Result<Self, TdError> {
        let Json::Object(all) = serde_json::from_str(text).map_err(|e| TdError::Json(e.to_string()))? else { return Err(TdError::Json("not an object".into())) };
        Ok(Self { all, file: td.file_name().map_or_else(String::new, |f| f.to_string_lossy().into_owned()) })
    }

    fn rec(&self, name: &str) -> Option<&Map<String, Json>> {
        self.all.get(name)?.as_object()
    }

    fn field<'x>(&'x self, name: &str, key: &str) -> Option<&'x Json> {
        self.rec(name)?.get(key)
    }

    fn text(&self, name: &str, key: &str) -> Option<&str> {
        self.field(name, key)?.as_str()
    }

    /// The def a field points to (`{"def": …}`).
    fn def_of(value: &Json) -> Option<&str> {
        value.get("def")?.as_str()
    }

    fn is_a(&self, name: &str, class: &str) -> bool {
        name == class || self.field(name, "!superclasses").and_then(Json::as_array).is_some_and(|s| s.iter().any(|c| c == class))
    }

    /// `Arg<constraint, …>` ⇒ `constraint`.
    fn unwrap_arg<'x>(&'x self, name: &'x str) -> &'x str {
        if self.is_a(name, "OpVariable") { self.field(name, "constraint").and_then(Self::def_of).unwrap_or(name) } else { name }
    }

    /// `(constraint, name)` pairs of a dag field (`arguments`, `results`, `regions`, `successors`).
    fn dag<'x>(&'x self, op: &str, key: &str) -> Vec<(&'x str, &'x str)> {
        let args = self.field(op, key).and_then(|d| d.get("args")).and_then(Json::as_array);
        args.into_iter().flatten().filter_map(|a| Some((self.unwrap_arg(Self::def_of(a.get(0)?)?), a.get(1)?.as_str()?))).collect()
    }

    /// The MLIR spelling of a buildable type (`$_builder.getIntegerType(32)` ⇒ `i32`，
    /// `$_builder.getType<::mlir::pdl::TypeType>()` ⇒ `!pdl.type`)。
    ///
    /// ⭐ 这决定了一个结果类型能不能写进**描述**里。写不进去，解析时就填不出结果类型，
    /// 整条退回原文 —— pdl 整个方言的 `matched` 为 0 就是这么来的。
    fn buildable(&self, constraint: &str) -> Option<String> {
        let call = self.text(constraint, "builderCall").filter(|c| !c.is_empty())?;
        let inner = |p: &str| call.split_once(p).and_then(|(_, r)| r.split_once(')')).map(|(n, _)| n.trim());
        Some(match () {
            _ if call.contains("getIndexType") => "index".into(),
            _ if call.contains("getNoneType") => "none".into(),
            _ if call.contains("getIntegerType(") => format!("i{}", inner("getIntegerType(")?),
            _ if call.contains("getF16Type") || call.contains("Float16Type>") => "f16".into(),
            _ if call.contains("getF32Type") || call.contains("Float32Type>") => "f32".into(),
            _ if call.contains("getF64Type") || call.contains("Float64Type>") => "f64".into(),
            _ if call.contains("getBF16Type") || call.contains("BFloat16Type>") => "bf16".into(),
            // LLVM's opaque pointer in address space 0, and its token.
            _ if call.contains("LLVMPointerType>(0)") => "!llvm.ptr".into(),
            _ if call.contains("LLVMTokenType::get(") => "!llvm.token".into(),
            // 方言自己的类型：记录里直接有方言与助记符（`PDL_Type` ⇒ `!pdl.type`）。
            // ⛔ 只认 `getType<…>()` 这种**无参**构造 —— 带参数的类型光靠助记符拼不出写法
            // （`!pdl.range<T>` 还要那个 T）。
            _ if call.trim_end().ends_with(">()") => {
                let mnemonic = self.text(constraint, "mnemonic").filter(|m| !m.is_empty())?;
                let dialect = self.field(constraint, "dialect").and_then(Self::def_of)?;
                format!("!{}.{mnemonic}", self.text(dialect, "name")?)
            }
            _ => return None,
        })
    }

    /// ⭐ The dialects with ops defined in this file.
    /// `only`: that dialect, with its ops from every file (a wrapper `.td` that includes them).
    pub fn dialects(&self, only: Option<&str>) -> Vec<GenDialect> {
        let ops: Vec<&str> = self.all.get("!instanceof").and_then(|i| i.get("Op")).and_then(Json::as_array).into_iter().flatten().filter_map(Json::as_str).collect();
        let here = |op: &&str| self.field(op, "!locs").and_then(Json::as_array).and_then(|l| l.first()).and_then(Json::as_str).is_some_and(|l| l.starts_with(&format!("{}:", self.file)));
        let ns = |op: &str| self.field(op, "opDialect").and_then(Self::def_of).and_then(|d| self.text(d, "name"));
        // A dialect with ops in `td` takes its ops from every file `td` includes too
        // (`TosaOps.td` includes `TosaShapeOps.td` and `TosaUtilOps.td`).
        let mut by_dialect: BTreeMap<String, Vec<&str>> = match only {
            Some(n) => [(n.into(), Vec::new())].into(),
            None => ops.iter().copied().filter(here).filter_map(ns).map(|n| (n.into(), Vec::new())).collect(),
        };
        for op in ops {
            if let Some(list) = ns(op).and_then(|n| by_dialect.get_mut(n)) {
                list.push(op);
            }
        }
        by_dialect
            .into_iter()
            .map(|(name, ops)| {
                let mut d = GenDialect { name, ops: Vec::new(), enums: BTreeMap::new() };
                for op in ops {
                    let one = self.op(op, &mut d);
                    d.ops.push(one);
                }
                d
            })
            .collect()
    }

    /// `snake_case` Rust identifier of an ODS name.
    fn ident(name: &str) -> String {
        let mut out = String::new();
        for (i, c) in name.chars().enumerate() {
            if c.is_ascii_uppercase() {
                if i > 0 && !out.ends_with('_') {
                    out.push('_');
                }
                out.push(c.to_ascii_lowercase());
            } else {
                out.push(if c.is_ascii_alphanumeric() { c } else { '_' });
            }
        }
        if KEYWORDS.contains(&out.as_str()) || out.starts_with(|c: char| c.is_ascii_digit()) {
            out.push('_');
        }
        out
    }

    /// `UpperCamelCase` of a keyword (`to_nearest_even` ⇒ `ToNearestEven`).
    fn camel(word: &str) -> String {
        let mut out: String = word.split(|c: char| !c.is_ascii_alphanumeric()).filter(|w| !w.is_empty()).map(|w| w[..1].to_ascii_uppercase() + &w[1..]).collect();
        if out.is_empty() || out.starts_with(|c: char| c.is_ascii_digit()) {
            out.insert(0, 'V');
        }
        out
    }

    /// An integer enum attribute's cases `(keyword, value)` if their values ascend from 0 (a gap
    /// becomes a hidden variant: a variant's index is its value).
    fn int_enum(&self, attr: &str) -> Option<(String, Vec<(String, i64)>, u64)> {
        if !self.is_a(attr, "IntEnumAttr") && !self.is_a(attr, "IntEnumAttrInfo") {
            return None;
        }
        let cases: Vec<(String, i64)> = self
            .field(attr, "enumerants")?
            .as_array()?
            .iter()
            .map(|c| {
                let c = Self::def_of(c)?;
                Some((self.text(c, "str")?.to_string(), self.field(c, "value")?.as_i64()?))
            })
            .collect::<Option<_>>()?;
        let ascending = cases.first().is_some_and(|(_, v)| *v >= 0) && cases.windows(2).all(|w| w[0].1 < w[1].1) && cases.last().is_some_and(|(_, v)| *v < 256);
        ascending.then(|| (self.text(attr, "className").unwrap_or(attr).to_string(), cases, self.field(attr, "bitwidth").and_then(Json::as_u64).unwrap_or(64)))
    }

    /// A bit enum property stored as its integer (`EnumProp<GEPNoWrapFlags>`,
    /// `NamedEnumPropWithAttrForm<IntegerOverflowFlags, "overflow", ..>`) ⇒ (`mnemonic/sep/case=v;..`,
    /// width, default value).
    fn bit_enum_prop(&self, prop: &str) -> Option<(String, u64, Option<i64>)> {
        let wrapped = self.field(prop, "baseProperty").and_then(Self::def_of);
        let prop = wrapped.filter(|_| !self.is_a(prop, "EnumProp")).unwrap_or(prop);
        if !self.is_a(prop, "EnumProp") || self.field(prop, "storeInCustomAttribute").and_then(Json::as_i64) == Some(1) {
            return None;
        }
        let info = self.field(prop, "enum").and_then(Self::def_of)?;
        if !self.is_a(info, "BitEnumBase") {
            return None;
        }
        let cases: Vec<String> = self.field(info, "enumerants")?.as_array()?.iter().filter_map(|c| {
            let c = Self::def_of(c)?;
            Some(format!("{}={}", self.text(c, "str")?, self.field(c, "value")?.as_i64()?))
        }).collect();
        let (mnemonic, sep) = (self.text(prop, "mnemonic").unwrap_or(""), self.text(info, "separator").unwrap_or("|"));
        let default = self.text(prop, "defaultValue").and_then(|v| self.case_value(info, v.rsplit("::").next()?));
        Some((format!("{mnemonic}/{sep}/{}", cases.join(";")), self.field(info, "bitwidth").and_then(Json::as_u64).unwrap_or(32), default))
    }

    /// The dialect type a type constraint is exactly (`Arg<EmitC_LValueType, ..>` ⇒ `emitc.lvalue`),
    /// when it is written `<...>`.
    fn type_def(&self, constraint: &str) -> Option<String> {
        let c = self.field(constraint, "constraint").and_then(Self::def_of).unwrap_or(constraint);
        let c = self.field(c, "baseType").and_then(Self::def_of).unwrap_or(c);
        (self.is_a(c, "TypeDef") && self.text(c, "assemblyFormat").is_some_and(|f| f.trim_start().starts_with("`<`"))).then(|| self.text(c, "typeName").map(String::from)).flatten()
    }

    /// The value of an integer enum's case `symbol`.
    fn case_value(&self, attr: &str, symbol: &str) -> Option<i64> {
        let cases = self.field(attr, "enumerants")?.as_array()?;
        cases.iter().filter_map(|c| Self::def_of(c)).find(|c| self.text(c, "symbol") == Some(symbol)).and_then(|c| self.field(c, "value")?.as_i64())
    }

    /// A dialect enum attribute spelled `#ns.mnemonic<case>` ⇒ (`ns.mnemonic`, its enum's cases by symbol).
    fn dialect_enum(&self, attr: &str) -> Option<(String, BTreeMap<String, String>)> {
        (self.is_a(attr, "EnumAttr") && self.text(attr, "assemblyFormat").is_some_and(|f| f.split_whitespace().collect::<String>() == "`<`$value`>`")).then_some(())?;
        let name = self.text(attr, "attrName")?.to_string();
        let info = self.field(attr, "enum").and_then(Self::def_of)?;
        let cases = self.field(info, "enumerants").and_then(Json::as_array).into_iter().flatten().filter_map(|c| {
            let c = Self::def_of(c)?;
            Some((self.text(c, "symbol")?.to_string(), self.text(c, "str")?.to_string()))
        });
        Some((name, cases.collect()))
    }

    /// A C++ attribute wrapping one enum, spelled by its `AttrDef` as `#ns.mnemonic<case>`
    /// (`Linkage` ⇒ `LinkageAttr` ⇒ `#llvm.linkage<external>`) ⇒ like [`Self::dialect_enum`].
    fn wrapped_enum(&self, attr: &str) -> Option<(String, BTreeMap<String, String>)> {
        (self.is_a(attr, "DialectAttr") && !self.is_a(attr, "AttrDef")).then_some(())?;
        let def = self.text(attr, "storageType")?.rsplit("::").next()?;
        (self.is_a(def, "AttrDef") && self.text(def, "assemblyFormat").is_some_and(|f| f.split_whitespace().count() == 3 && f.starts_with("`<` $"))).then_some(())?;
        let enum_name = self.text(attr, "returnType")?.rsplit("::").next()?;
        let infos = self.all.get("!instanceof").and_then(|i| i.get("EnumInfo")).and_then(Json::as_array)?;
        let info = infos.iter().filter_map(Json::as_str).find(|e| self.text(e, "className") == Some(enum_name))?;
        let cases = self.field(info, "enumerants").and_then(Json::as_array).into_iter().flatten().filter_map(|c| {
            let c = Self::def_of(c)?;
            Some((self.text(c, "symbol")?.to_string(), self.text(c, "str")?.to_string()))
        });
        Some((self.text(def, "attrName")?.to_string(), cases.collect()))
    }

    /// A property field: (marker, Rust type).
    fn property(&self, constraint: &str, ods: &str, dialect: &mut GenDialect) -> (String, String) {
        let unit = |c: &str| self.is_a(c, "UnitAttr") || self.is_a(c, "UnitProp");
        let base = self.field(constraint, "baseAttr").and_then(Self::def_of).unwrap_or(constraint);
        // The constraint and what it wraps (`DefaultValuedAttr<ConfinedAttr<I32Attr, ..>, "0">`).
        let chain: Vec<&str> = core::iter::successors(Some(constraint), |c| self.field(c, "baseAttr").and_then(Self::def_of)).collect();
        let optional = self.field(constraint, "isOptional").and_then(Json::as_i64) == Some(1) || self.is_a(constraint, "OptionalAttr");
        let defaulted = self.is_a(constraint, "DefaultValuedAttr") || self.is_a(constraint, "DefaultValuedOptionalAttr");
        // Only a `DefaultValuedAttr` is filled in when absent; a `DefaultValuedOptionalAttr`'s
        // default is for its getter alone (`memref.load` parses without `nontemporal`).
        let filled = defaulted && !self.is_a(constraint, "DefaultValuedOptionalAttr");
        let name = format!("name = {ods:?}");
        if unit(constraint) || unit(base) {
            return (format!("#[attr({name})]"), "bool".into());
        }
        if let Some((bits, width, default)) = self.bit_enum_prop(constraint) {
            return match default {
                Some(v) => (format!("#[attr({name}, int = \"i{width}\", default = \"{v}\", bits = {bits:?})]"), "Attribute<'a>".into()),
                None => (format!("#[attr({name}, int = \"i{width}\", bits = {bits:?})]"), "Attribute<'a>".into()),
            };
        }
        if let Some((rust, cases, width)) = self.int_enum(base) {
            dialect.enums.insert(rust.clone(), cases);
            // `DefaultValuedAttr<AtomicOrdering, "AtomicOrdering::not_atomic">`: the case's value.
            let default = filled.then(|| self.text(constraint, "defaultValue")).flatten().and_then(|v| self.case_value(base, v.rsplit("::").next()?));
            return match default {
                Some(v) => (format!("#[attr({name}, int = \"i{width}\", default = \"{v}\")]"), rust),
                None if optional || defaulted => (format!("#[attr({name}, int = \"i{width}\")]"), format!("Option<{rust}>")),
                None => (format!("#[attr({name}, int = \"i{width}\")]"), rust),
            };
        }
        if let Some((attr, cases)) = self.dialect_enum(base).or_else(|| self.wrapped_enum(base)) {
            let default = filled
                .then(|| self.text(constraint, "defaultValue"))
                .flatten()
                .and_then(|v| v.rsplit("::").next())
                // `{}`: a bit enum with nothing set, its `none` case.
                .and_then(|symbol| if symbol == "{}" { cases.values().find(|c| *c == "none") } else { cases.get(symbol) })
                .map(|case| format!(", default = \"<{case}>\""));
            return match default {
                Some(default) => (format!("#[attr({name}, dialect = {attr:?}{default})]"), "Attribute<'a>".into()),
                None if optional || defaulted => (format!("#[attr({name}, dialect = {attr:?})]"), "Option<Attribute<'a>>".into()),
                None => (format!("#[attr({name}, dialect = {attr:?})]"), "Attribute<'a>".into()),
            };
        }
        let ty = if optional || defaulted { "Option<Attribute<'a>>" } else { "Attribute<'a>" };
        // An attribute of one `AttrDef`: ODS prints it stripped (`<function = @f, tag = <id = 1>>`).
        if self.is_a(base, "AttrDef") && self.text(base, "assemblyFormat").is_some_and(|f| f.trim_start().starts_with("`<`")) && let Some(attr) = self.text(base, "attrName") {
            return (format!("#[attr({name}, dialect = {attr:?})]"), ty.into());
        }
        if let Some(el) = Self::dense_array(base).or_else(|| Self::dense_array(constraint)) {
            return (format!("#[attr({name}, dense = {el:?})]"), ty.into());
        }
        let default = filled.then(|| self.text(constraint, "defaultValue")).flatten();
        // `I64Attr`: the custom form leaves the integer's type out (`linalg.index 0`).
        if let Some(width) = chain.iter().find_map(|c| Self::int_attr(c)) {
            return match default.filter(|v| v.parse::<i64>().is_ok()) {
                Some(v) => (format!("#[attr({name}, int = \"i{width}\", default = \"{v}\")]"), "Attribute<'a>".into()),
                None => (format!("#[attr({name}, int = \"i{width}\")]"), ty.into()),
            };
        }
        // `DefaultValuedAttr<BoolAttr, "false">`.
        if chain.iter().any(|c| self.is_a(c, "BoolAttr")) && let Some(v) = default.filter(|v| matches!(*v, "true" | "false")) {
            return (format!("#[attr({name}, default = \"{v}\")]"), "Attribute<'a>".into());
        }
        // A `SymbolNameAttr` prints as `@name`, a `StrAttr` as `"name"`.
        if self.is_a(base, "SymbolNameAttr") || self.is_a(constraint, "SymbolNameAttr") {
            return (format!("#[attr({name}, symbol)]"), ty.into());
        }
        (format!("#[attr({name})]"), ty.into())
    }

    /// `I64Attr` ⇒ 64: a signless integer attribute of a fixed width.
    fn int_attr(def: &str) -> Option<u32> {
        def.strip_prefix('I')?.strip_suffix("Attr")?.parse().ok().filter(|w| [1, 8, 16, 32, 64].contains(w))
    }

    /// `DenseI64ArrayAttr` ⇒ `i64`. The custom form prints such an attribute as a bare list, so
    /// its element type only survives a round trip if the declaration carries it.
    fn dense_array(def: &str) -> Option<&'static str> {
        let el = def.strip_prefix("Dense")?.strip_suffix("ArrayAttr")?;
        Some(match el {
            "Bool" => "i1",
            "I8" => "i8",
            "I16" => "i16",
            "I32" => "i32",
            "I64" => "i64",
            "F32" => "f32",
            "F64" => "f64",
            _ => return None,
        })
    }

    /// ⭐ One op.
    #[allow(clippy::too_many_lines)] // one pass over the op's record, in field order
    fn op(&self, op: &str, dialect: &mut GenDialect) -> GenOp {
        let rust = op.split_once('_').map_or(op, |(_, r)| r).to_string();
        let name = format!("{}.{}", dialect.name, self.text(op, "opName").unwrap_or(""));
        let summary = self.text(op, "summary").unwrap_or("").trim().to_string();
        let mut groups: Vec<Group> = Vec::new();
        let mut props: Vec<GenField> = Vec::new();
        let mut operand_names = Vec::new();
        for (constraint, ods) in self.dag(op, "arguments") {
            if self.is_a(constraint, "TypeConstraint") {
                let variadic = self.is_a(constraint, "Variadic") || self.is_a(constraint, "Optional") || self.is_a(constraint, "VariadicOfVariadic");
                let base = self.field(constraint, "baseType").and_then(Self::def_of).unwrap_or(constraint);
                groups.push(Group { name: ods.into(), variadic, result: false, fixed: self.buildable(base), strip: self.type_def(constraint) });
                operand_names.push(ods);
            } else {
                let (marker, ty) = self.property(constraint, ods, dialect);
                props.push(GenField { marker, ident: Self::ident(ods), ty });
            }
        }
        let mut results = Vec::new();
        for (constraint, ods) in self.dag(op, "results") {
            let variadic = self.is_a(constraint, "Variadic") || self.is_a(constraint, "Optional");
            let base = self.field(constraint, "baseType").and_then(Self::def_of).unwrap_or(constraint);
            groups.push(Group { name: ods.into(), variadic, result: true, fixed: self.buildable(base), strip: self.type_def(constraint) });
            results.push(ods);
        }
        // Type variable classes (union-find over the groups).
        let mut parent: Vec<usize> = (0..groups.len()).collect();
        fn find(parent: &mut [usize], i: usize) -> usize {
            let mut r = i;
            while parent[r] != r {
                r = parent[r];
            }
            parent[i] = r;
            r
        }
        let index = |n: &str| groups.iter().position(|g| g.name == n);
        let unite = |parent: &mut Vec<usize>, a: usize, b: usize| {
            let (a, b) = (find(parent, a), find(parent, b));
            if a != b {
                parent[a.max(b)] = a.min(b);
            }
        };
        let mut infer: BTreeMap<usize, String> = BTreeMap::new();
        let traits: Vec<&str> = self.field(op, "traits").and_then(Json::as_array).into_iter().flatten().filter_map(Self::def_of).collect();
        for t in traits {
            let members: Vec<usize> = match t {
                "SameOperandsAndResultType" => (0..groups.len()).collect(),
                "SameTypeOperands" => (0..groups.len()).filter(|&i| !groups[i].result).collect(),
                _ if self.is_a(t, "AllTypesMatch") => self.field(t, "values").and_then(Json::as_array).into_iter().flatten().filter_map(|v| index(v.as_str()?)).collect(),
                // `vector.from_elements`：各操作数的类型就是那个形状类型的元素类型。
                // ⛔ 它派生自 `PredOpTrait` 而不是 `TypesMatchWith`，所以要单独认。
                _ if self.is_a(t, "ShapedTypeMatchesElementCountAndTypes") => {
                    if let (Some(shaped), Some(elements)) = (self.text(t, "shaped").and_then(index), self.text(t, "elements").and_then(index)) {
                        infer.insert(elements, format!("el = {}", groups[shaped].name));
                    }
                    Vec::new()
                }
                _ if self.is_a(t, "TypesMatchWith") => {
                    let (Some(lhs), Some(rhs)) = (self.text(t, "lhs").and_then(index), self.text(t, "rhs").and_then(index)) else { continue };
                    let transformer = self.text(t, "transformer").unwrap_or("");
                    // `::llvm::cast<Type>($_self)` 就是恒等（`OptionalTypesMatchWith` 这么写）。
                    let plain = transformer.trim().strip_prefix("::llvm::cast<Type>(").and_then(|r| r.strip_suffix(')')).unwrap_or(transformer).trim();
                    match () {
                        _ if plain == "$_self" => vec![lhs, rhs],
                        _ if transformer.contains("getI1SameShape") => {
                            infer.insert(rhs, format!("i1 = {}", groups[lhs].name));
                            Vec::new()
                        }
                        _ if transformer.contains("getElementType()") && !groups[lhs].variadic => {
                            infer.insert(rhs, format!("el = {}", groups[lhs].name));
                            Vec::new()
                        }
                        _ => Vec::new(),
                    }
                }
                _ => Vec::new(),
            };
            for w in members.windows(2) {
                unite(&mut parent, w[0], w[1]);
            }
        }
        let classes: Vec<usize> = (0..groups.len()).map(|i| find(&mut parent, i)).collect();
        // Each class's variable: its first result, else `<first operand>_ty`.
        let mut var_of: BTreeMap<usize, (String, String)> = BTreeMap::new(); // class ⇒ (rust ident, MLIR name)
        for (i, g) in groups.iter().enumerate().filter(|(_, g)| g.result) {
            var_of.entry(classes[i]).or_insert((Self::ident(&g.name), g.name.clone()));
        }
        for (i, g) in groups.iter().enumerate().filter(|(_, g)| !g.result) {
            var_of.entry(classes[i]).or_insert_with(|| (Self::ident(&format!("{}_ty", g.name)), format!("{}_ty", g.name)));
        }
        let class_variadic = |c: usize| groups.iter().enumerate().filter(|(i, _)| classes[*i] == c).all(|(_, g)| g.variadic && g.fixed.is_none());
        let class_strip = |c: usize| {
            let mut members = groups.iter().enumerate().filter(|(i, _)| classes[*i] == c).map(|(_, g)| g.strip.as_deref());
            let first = members.next().flatten();
            match first {
                Some(d) if members.all(|s| s == Some(d)) => format!(", strip = {d:?}"),
                _ => String::new(),
            }
        };
        let class_fixed = |c: usize| groups.iter().enumerate().filter(|(i, _)| classes[*i] == c).find_map(|(_, g)| g.fixed.clone());
        // Names the inference rules point at are groups; they mean those groups' variables.
        let var_name = |n: &str| index(n).map(|i| var_of[&classes[i]].1.clone()).unwrap_or_default();
        let class_infer = |c: usize| {
            let rule = infer.iter().find(|(i, _)| classes[**i] == c).map(|(_, r)| {
                let (kind, target) = r.split_once(" = ").unwrap_or((r, ""));
                format!("{kind} = {}", Self::ident(&var_name(target)))
            });
            // 方言类型（`!pdl.type`）不是合法的 Rust 标识符，加引号走字符串那条路。
            rule.or_else(|| class_fixed(c).map(|t| if t.starts_with('!') { format!("is = {t:?}") } else { format!("is = {t}") }))
        };
        let mut fields = Vec::new();
        for (i, g) in groups.iter().enumerate().filter(|(_, g)| !g.result) {
            let (var, _) = &var_of[&classes[i]];
            let ty = if g.variadic { "Vec<Value<'a>>" } else { "Value<'a>" };
            fields.push(GenField { marker: format!("#[slot({var}, name = {:?})]", g.name), ident: Self::ident(&g.name), ty: ty.into() });
        }
        fields.extend(props);
        for (key, marker) in [("regions", "region"), ("successors", "successor")] {
            for (constraint, ods_name) in self.dag(op, key) {
                let variadic = self.is_a(constraint, "VariadicRegion") || self.is_a(constraint, "VariadicSuccessor");
                let ty = match (marker, variadic) {
                    ("region", false) => "Region<'a>",
                    ("region", true) => "Vec<Region<'a>>",
                    (_, false) => "Str<'a>",
                    (_, true) => "Vec<Str<'a>>",
                };
                fields.push(GenField { marker: format!("#[{marker}(name = {ods_name:?})]"), ident: Self::ident(ods_name), ty: ty.into() });
            }
        }
        // Type variables: operand-only classes, then results (each result its own field).
        let mut emitted = BTreeSet::new();
        for (i, g) in groups.iter().enumerate() {
            let c = classes[i];
            let (var, ods) = var_of[&c].clone();
            if g.result {
                let (marker, ty) = if var == Self::ident(&g.name) {
                    emitted.insert(c);
                    let infer = class_infer(c).map_or_else(String::new, |r| format!(", {r}")) + &class_strip(c);
                    (format!("#[dtype(name = {:?}{infer})]", g.name), if class_variadic(c) { "Vec<Type<'a>>" } else { "Type<'a>" })
                } else {
                    (format!("#[dtype(name = {:?}, eq = {var})]", g.name), if g.variadic { "Vec<Type<'a>>" } else { "Type<'a>" })
                };
                fields.push(GenField { marker, ident: Self::ident(&g.name), ty: ty.into() });
            } else if !groups.iter().enumerate().any(|(j, h)| h.result && classes[j] == c) && emitted.insert(c) {
                let infer = class_infer(c).map_or_else(String::new, |r| format!(", {r}")) + &class_strip(c);
                let ty = if class_variadic(c) { "Vec<Type<'a>>" } else { "Type<'a>" };
                fields.push(GenField { marker: format!("#[dtype(name = {ods:?}{infer})]"), ident: var, ty: ty.into() });
            }
        }
        let (format, generic_why) = self.format(op, &fields, &results);
        GenOp { rust, name, summary, format, generic_why, results: results.iter().map(|r| Self::ident(r)).collect(), fields }
    }

    /// The assembly format if the runtime format engine can read it, else why not.
    fn format(&self, op: &str, fields: &[GenField], results: &[&str]) -> (Option<String>, Option<String>) {
        if self.field(op, "hasCustomAssemblyFormat").and_then(Json::as_i64) == Some(1) {
            return (None, Some("custom C++ syntax".into()));
        }
        let Some(raw) = self.text(op, "assemblyFormat").filter(|f| !f.trim().is_empty()) else { return (None, Some("no assembly format".into())) };
        let format = raw.split_whitespace().collect::<Vec<_>>().join(" ");
        // Outside literals, only `$name`, type(), functional-type(), qualified(), attr-dict and groups.
        let mut rest = format.as_str();
        let known: BTreeSet<String> = fields.iter().filter_map(|f| f.marker.split("name = \"").nth(1).and_then(|n| n.split('"').next()).map(String::from)).collect();
        while let Some(c) = rest.chars().next() {
            rest = match c {
                '`' => match rest[1..].find('`') {
                    Some(end) if !rest[1..=end].contains('\\') => &rest[end + 2..],
                    _ => return (None, Some("an escaped literal".into())),
                },
                '$' => {
                    let end = rest[1..].find(|c: char| !(c.is_ascii_alphanumeric() || c == '_')).map_or(rest.len(), |e| e + 1);
                    if !known.contains(&rest[1..end]) {
                        return (None, Some(format!("`{}` is not a field", &rest[..end])));
                    }
                    &rest[end..]
                }
                ' ' | '(' | ')' | '?' | '^' | ',' => &rest[1..],
                // A directive we have a rule for: step over the name so its arguments are
                // still checked as fields; `Elem::check` below settles the argument count.
                _ if rest.starts_with("custom<") => {
                    let after = &rest["custom<".len()..];
                    match after.split_once('>') {
                        Some((name, tail)) if mlirformat::syntax::known(name) => tail,
                        Some((name, _)) => return (None, Some(format!("directive `custom<{name}>`"))),
                        None => return (None, Some("`custom<` without its `>`".into())),
                    }
                }
                _ => match ["type(", "functional-type(", "qualified(", "attr-dict"].iter().find(|w| rest.starts_with(**w) && !rest.starts_with("attr-dict-with-keyword")) {
                    Some(w) => &rest[w.len()..],
                    None => return (None, Some(format!("directive `{}`", rest.split([' ', '(']).next().unwrap_or(rest)))),
                },
            };
        }
        // A result type the format neither spells nor infers comes from C++ (`inferReturnTypes`:
        // `llvm.cmpxchg`'s `!llvm.struct<(T, i1)>`).
        for r in results {
            // Its own variable with no rule (`strip` decides only how it prints).
            let own = format!("#[dtype(name = {r:?}");
            let ruleless = |m: &str| m.strip_prefix(&own).is_some_and(|rest| rest == ")]" || (rest.starts_with(", strip = ") && rest.matches(" = ").count() == 1));
            // An operand sharing the variable may spell it: `vector.fma ... : type($lhs)`.
            let slot = format!("#[slot({}, name = \"", Self::ident(r));
            let shared = fields.iter().filter_map(|f| f.marker.strip_prefix(&slot)?.split('"').next()).any(|o| format.contains(&format!("type(${o})")));
            if fields.iter().any(|f| ruleless(&f.marker)) && !shared && !format.contains(&format!("${r}")) && !format.contains("results") {
                return (None, Some(format!("result type `{r}` inferred in C++")));
            }
        }
        match mlirformat::Elem::check(&format, op) {
            Ok(()) => (Some(format), None),
            Err(e) => (None, Some(e.to_string())),
        }
    }
}

impl GenDialect {
    /// `arith.gen.rs`.
    pub fn file_name(&self) -> String {
        format!("{}.gen.rs", self.name.replace('.', "_"))
    }

    /// ⭐ The generated Rust module.
    /// `params`: the dialect's `Dialect::parse_params` hook (a path), if any.
    pub fn render(&self, source: &str, params: Option<&str>) -> String {
        let mut out = String::new();
        let _ = writeln!(out, "//! `{}` dialect: generated by `mlirformat tblgen` from `{source}`. Do not edit.", self.name);
        let _ = writeln!(out, "#![allow(non_camel_case_types, unused_imports, clippy::all)]\n");
        // `__Vec as Vec`: the file also compiles in `no_std` crates (no `Vec` in their prelude).
        let _ = writeln!(out, "use mlirformat::{{mlir, Attribute, Region, Str, Type, Value, __Vec as Vec}};\n");
        for (name, cases) in &self.enums {
            let _ = writeln!(out, "#[derive(Debug, Clone, Copy, PartialEq, Eq, mlirformat::__serde::Serialize, mlirformat::__serde::Deserialize)]");
            let _ = writeln!(out, "#[serde(crate = \"mlirformat::__serde\")]\npub enum {name} {{");
            let mut next = 0;
            for (keyword, value) in cases {
                for gap in next..*value {
                    let _ = writeln!(out, "    #[doc(hidden)]\n    #[serde(rename = \"__{gap}\")]\n    __{gap},");
                }
                let _ = writeln!(out, "    #[serde(rename = {keyword:?})]\n    {},", Records::camel(keyword));
                next = value + 1;
            }
            let _ = writeln!(out, "}}\n");
        }
        for op in &self.ops {
            if !op.summary.is_empty() {
                let _ = writeln!(out, "/// `{}`: {}", op.name, op.summary.replace('\n', " "));
            }
            if let Some(why) = &op.generic_why {
                let _ = writeln!(out, "///\n/// Generic form only ({why}).");
            }
            let results = if op.results.is_empty() { String::new() } else { format!(", results({})", op.results.join(", ")) };
            let syntax = op.format.as_ref().map_or_else(|| ", generic".to_string(), |f| format!(", format = {f:?}"));
            let _ = writeln!(out, "#[mlir::op({:?}{syntax}{results})]", op.name);
            let _ = writeln!(out, "pub struct {}<'a> {{", op.rust);
            for f in &op.fields {
                let _ = writeln!(out, "    {}\n    pub {}: {},", f.marker, f.ident, f.ty);
            }
            let _ = writeln!(out, "}}\n");
        }
        let params = params.map_or_else(String::new, |path| format!(", params = {path}"));
        let _ = writeln!(out, "/// The `{}` dialect.\n#[mlir::dialect({:?}{params})]\npub enum {}<'a> {{", self.name, self.name, Records::camel(&self.name));
        for op in &self.ops {
            let _ = writeln!(out, "    {}({}<'a>),", op.rust.strip_suffix("Op").filter(|v| !v.is_empty()).unwrap_or(&op.rust), op.rust);
        }
        let _ = writeln!(out, "}}");
        out
    }
}
