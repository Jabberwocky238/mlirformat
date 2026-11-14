use std::collections::{BTreeMap, BTreeSet};
use std::fmt::Write as _;
use std::path::{Path, PathBuf};

use serde_json::{Map, Value as Json};

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

pub struct Records {
    all: Map<String, Json>,
    file: String,
}

pub struct GenDialect {
    pub name: String,
    pub ops: Vec<GenOp>,
    pub enums: BTreeMap<String, Vec<(String, i64)>>,
    pub dependents: Vec<String>,
    pub materializer: bool,
    pub canonicalizer: bool,
}

pub struct GenOp {
    pub rust: String,
    pub name: String,
    pub summary: String,
    pub description: String,
    pub format: Option<String>,
    pub generic_why: Option<String>,
    pub results: Vec<String>,
    pub fields: Vec<GenField>,
}

impl GenOp {
    fn dedent(text: &str) -> String {
        let text = text.trim_start_matches(['\n', '\r']);
        let mut lines: Vec<&str> = text.lines().map(str::trim_end).collect();
        let indent = lines.iter().skip(1).filter(|l| !l.is_empty()).map(|l| l.len() - l.trim_start().len()).min().unwrap_or(0);
        for l in lines.iter_mut().skip(1) {
            *l = l.get(indent..).unwrap_or("");
        }
        if let Some(first) = lines.first_mut() {
            *first = first.trim_start();
        }
        lines.join("\n").trim_matches('\n').to_string()
    }

    fn doc(&self) -> Vec<String> {
        if self.description.is_empty() {
            return Vec::new();
        }
        let mut out = vec![String::new()];
        let (mut fenced, mut indented, mut blank) = (false, false, true);
        for line in self.description.lines() {
            let fence = line.trim_start().starts_with("```");
            if indented && !line.is_empty() && !line.starts_with("    ") {
                Self::close(&mut out);
                out.push(String::new());
                indented = false;
            }
            if fence {
                let lang = line.trim_start()[3..].trim();
                out.push(if !fenced && (lang.is_empty() || lang.starts_with('{')) { "```text".into() } else { line.trim_start().to_string() });
                fenced = !fenced;
            } else if !fenced && !indented && blank && line.starts_with("    ") {
                out.push("```text".into());
                indented = true;
                out.push(line[4..].to_string());
            } else if indented {
                out.push(line.get(4..).unwrap_or("").to_string());
            } else {
                out.push(line.to_string());
            }
            blank = line.is_empty();
        }
        if indented || fenced {
            Self::close(&mut out);
        }
        out
    }

    fn close(out: &mut Vec<String>) {
        while out.last().is_some_and(String::is_empty) {
            out.pop();
        }
        out.push("```".into());
    }
}

pub struct GenField {
    pub marker: String,
    pub ident: String,
    pub ty: String,
}

impl GenField {
    fn shown(&self, format: Option<&str>) -> String {
        let named = self.marker.split("name = \"").nth(1).and_then(|n| n.split('"').next()).unwrap_or_default();
        let spelled = format.is_some_and(|f| f.match_indices(&format!("${named}")).any(|(i, m)| !f[i + m.len()..].starts_with(|c: char| c.is_ascii_alphanumeric() || c == '_')));
        let own = if self.marker.starts_with("#[dtype(") && !spelled { format!("name = {named:?}") } else { format!("name = {:?}", self.ident) };
        let m = &self.marker;
        if let Some(i) = m.find(&format!("({own})")) {
            format!("{}{}", &m[..i], &m[i + own.len() + 2..])
        } else if m.contains(&format!("({own}, ")) {
            m.replacen(&format!("{own}, "), "", 1)
        } else {
            m.replacen(&format!(", {own}"), "", 1)
        }
    }
}

struct Group {
    name: String,
    variadic: bool,
    result: bool,
    fixed: Option<String>,
    strip: Option<String>,
}

const KEYWORDS: &[&str] = &[
    "as", "break", "const", "continue", "crate", "else", "enum", "extern", "false", "fn", "for", "if", "impl", "in", "let", "loop", "match", "mod",
    "move", "mut", "pub", "ref", "return", "self", "Self", "static", "struct", "super", "trait", "true", "type", "unsafe", "use", "where", "while",
    "async", "await", "dyn", "abstract", "become", "box", "do", "final", "macro", "override", "priv", "typeof", "unsized", "virtual", "yield", "try",
    "gen", "attrs", "loc",
];

impl Records {
    pub fn parse(tds: &[PathBuf], includes: &[PathBuf]) -> Result<Self, TdError> {
        let json = super::td::dump_json(tds, includes).map_err(|e| TdError::Tblgen(e.to_string()))?;
        Self::from_json(&json, &tds[0])
    }

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

    fn def_of(value: &Json) -> Option<&str> {
        value.get("def")?.as_str()
    }

    fn is_a(&self, name: &str, class: &str) -> bool {
        name == class || self.field(name, "!superclasses").and_then(Json::as_array).is_some_and(|s| s.iter().any(|c| c == class))
    }

    fn unwrap_arg<'x>(&'x self, name: &'x str) -> &'x str {
        if self.is_a(name, "OpVariable") { self.field(name, "constraint").and_then(Self::def_of).unwrap_or(name) } else { name }
    }

    fn dag<'x>(&'x self, op: &str, key: &str) -> Vec<(&'x str, &'x str)> {
        let args = self.field(op, key).and_then(|d| d.get("args")).and_then(Json::as_array);
        args.into_iter().flatten().filter_map(|a| Some((self.unwrap_arg(Self::def_of(a.get(0)?)?), a.get(1).and_then(Json::as_str).unwrap_or("")))).collect()
    }

    fn buildable(&self, constraint: &str) -> Option<String> {
        self.buildable_call(self.text(constraint, "builderCall").filter(|c| !c.is_empty())?, Some(constraint))
    }

    fn buildable_call(&self, call: &str, constraint: Option<&str>) -> Option<String> {
        let inner = |p: &str| call.split_once(p).and_then(|(_, r)| r.split_once(')')).map(|(n, _)| n.trim());
        let packed = call.split_whitespace().collect::<String>();
        Some(match () {
            _ if let Some((dims, elem)) = packed.strip_prefix("::mlir::VectorType::get({").and_then(|r| r.strip_suffix(')')).and_then(|r| r.split_once("},")) => {
                format!("vector<{}x{}>", dims.replace(',', "x"), self.buildable_call(elem, None)?)
            }
            _ if call.contains("getIndexType") => "index".into(),
            _ if call.contains("getNoneType") => "none".into(),
            _ if call.contains("getIntegerType(") => format!("i{}", inner("getIntegerType(")?),
            _ if let Some(w) = packed.split_once(".getI").and_then(|(_, r)| r.strip_suffix("Type()")).filter(|w| w.parse::<u32>().is_ok()) => format!("i{w}"),
            _ if call.contains("getBF16Type") || call.contains("BFloat16Type>") => "bf16".into(),
            _ if call.contains("getF16Type") || call.contains("Float16Type>") => "f16".into(),
            _ if call.contains("getF32Type") || call.contains("Float32Type>") => "f32".into(),
            _ if call.contains("getF64Type") || call.contains("Float64Type>") => "f64".into(),
            _ if call.contains("::mlir::TokenType>") => "token".into(),
            _ if let Some(space) = packed.split_once("LLVMPointerType>(").and_then(|(_, r)| r.strip_suffix(')')).filter(|n| n.parse::<u32>().is_ok()) => {
                if space == "0" { "!llvm.ptr".into() } else { format!("!llvm.ptr<{space}>") }
            }
            _ if call.trim_end().ends_with(">()") && let Some(c) = constraint && let Some(m) = self.text(c, "mnemonic").filter(|m| !m.is_empty()) => {
                let dialect = self.field(c, "dialect").and_then(Self::def_of)?;
                format!("!{}.{m}", self.text(dialect, "name")?)
            }
            _ => return self.spell(call.trim()),
        })
    }

    fn spell(&self, call: &str) -> Option<String> {
        if let Some(cpp) = call.strip_suffix(">()").and_then(|c| c.rsplit_once("getType<")).map(|(_, t)| t) {
            let (dialect, mnemonic) = self.type_def_by_cpp(cpp)?;
            return Some(format!("!{dialect}.{mnemonic}"));
        }
        let (outer, args) = call.strip_suffix(')')?.split_once("::get(")?;
        let (dialect, mnemonic) = self.type_def_by_cpp(outer)?;
        let inner = self.spell(args.trim())?;
        let inner = inner.strip_prefix(&format!("!{dialect}.")).map_or(inner.clone(), String::from);
        Some(format!("!{dialect}.{mnemonic}<{inner}>"))
    }

    fn type_def_by_cpp(&self, cpp: &str) -> Option<(String, String)> {
        let def = self.type_def_of_cpp(cpp)?;
        let mnemonic = self.text(def, "mnemonic").filter(|m| !m.is_empty())?;
        let dialect = self.field(def, "dialect").and_then(Self::def_of)?;
        Some((self.text(dialect, "name")?.into(), mnemonic.into()))
    }

    fn bare_attr_def(&self, cpp: &str) -> Option<String> {
        let defs = self.all.get("!instanceof").and_then(|i| i.get("AttrDef")).and_then(Json::as_array)?;
        let def = defs.iter().filter_map(Json::as_str).find(|d| self.text(d, "cppType") == Some(cpp))?;
        let params = self.field(def, "parameters").and_then(|p| p.get("args")).and_then(Json::as_array)?;
        params.is_empty().then(|| self.text(def, "attrName").map(String::from)).flatten()
    }

    pub fn dialects(&self, only: Option<&str>) -> Vec<GenDialect> {
        let ops: Vec<&str> = self.all.get("!instanceof").and_then(|i| i.get("Op")).and_then(Json::as_array).into_iter().flatten().filter_map(Json::as_str).collect();
        let here = |op: &&str| self.field(op, "!locs").and_then(Json::as_array).and_then(|l| l.first()).and_then(Json::as_str).is_some_and(|l| l.starts_with(&format!("{}:", self.file)));
        let ns = |op: &str| self.field(op, "opDialect").and_then(Self::def_of).and_then(|d| self.text(d, "name"));
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
                let record = ops.first().and_then(|op| self.field(op, "opDialect")).and_then(Self::def_of);
                let flag = |f: &str| record.and_then(|r| self.field(r, f)).and_then(Json::as_i64) == Some(1);
                let dependents = record
                    .and_then(|r| self.field(r, "dependentDialects"))
                    .and_then(Json::as_array)
                    .into_iter()
                    .flatten()
                    .filter_map(|d| {
                        let path = d.as_str()?.trim_start_matches("::");
                        Some(path.strip_prefix("mlir::").unwrap_or(path).split("::").next()?.to_ascii_lowercase())
                    })
                    .collect();
                let (materializer, canonicalizer) = (flag("hasConstantMaterializer"), flag("hasCanonicalizer"));
                let mut d = GenDialect { name, ops: Vec::new(), enums: BTreeMap::new(), dependents, materializer, canonicalizer };
                for op in ops {
                    let one = self.op(op, &mut d);
                    d.ops.push(one);
                }
                d
            })
            .collect()
    }

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

    fn camel(word: &str) -> String {
        let mut out: String = word.split(|c: char| !c.is_ascii_alphanumeric()).filter(|w| !w.is_empty()).map(|w| w[..1].to_ascii_uppercase() + &w[1..]).collect();
        if out.is_empty() || out.starts_with(|c: char| c.is_ascii_digit()) {
            out.insert(0, 'V');
        }
        out
    }

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
            .collect::<Option<Vec<_>>>()?
            .into_iter()
            .filter(|(_, v)| *v >= 0)
            .collect();
        let ascending = cases.first().is_some_and(|(_, v)| *v >= 0) && cases.windows(2).all(|w| w[0].1 < w[1].1) && cases.last().is_some_and(|(_, v)| *v < 256);
        ascending.then(|| (self.text(attr, "className").unwrap_or(attr).to_string(), cases, self.field(attr, "bitwidth").and_then(Json::as_u64).unwrap_or(64)))
    }

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

    fn type_def(&self, constraint: &str) -> Option<String> {
        let c = self.field(constraint, "constraint").and_then(Self::def_of).unwrap_or(constraint);
        let c = self.field(c, "baseType").and_then(Self::def_of).unwrap_or(c);
        let def = if self.is_a(c, "TypeDef") { c } else { self.type_def_of_cpp(self.text(c, "cppType")?)? };
        let custom = self.field(def, "hasCustomAssemblyFormat").and_then(Json::as_i64) == Some(1) && self.text(def, "mnemonic").is_some_and(|m| !m.is_empty());
        let angled = self.text(def, "assemblyFormat").map(str::trim_start).is_some_and(|f| f.starts_with("`<`") || f.starts_with("(`<`"));
        (custom || angled).then(|| self.text(def, "typeName").map(String::from)).flatten()
    }

    fn type_def_of_cpp(&self, cpp: &str) -> Option<&str> {
        let defs = self.all.get("!instanceof").and_then(|i| i.get("TypeDef")).and_then(Json::as_array)?;
        defs.iter().filter_map(Json::as_str).find(|d| self.text(d, "cppType") == Some(cpp))
    }

    fn case_value(&self, attr: &str, symbol: &str) -> Option<i64> {
        let cases = self.field(attr, "enumerants")?.as_array()?;
        cases.iter().filter_map(|c| Self::def_of(c)).find(|c| self.text(c, "symbol") == Some(symbol)).and_then(|c| self.field(c, "value")?.as_i64())
    }

    fn dialect_enum(&self, attr: &str) -> Option<(String, BTreeMap<String, String>)> {
        let format = self.text(attr, "assemblyFormat").map(|f| f.split_whitespace().collect::<String>());
        (self.is_a(attr, "EnumAttr") && matches!(format.as_deref(), Some("`<`$value`>`" | "$value"))).then_some(())?;
        let name = self.text(attr, "attrName")?.to_string();
        let name = if format.as_deref() == Some("$value") { name.replacen('.', "<", 1) } else { name };
        let info = self.field(attr, "enum").and_then(Self::def_of)?;
        let cases = self.field(info, "enumerants").and_then(Json::as_array).into_iter().flatten().filter_map(|c| {
            let c = Self::def_of(c)?;
            Some((self.text(c, "symbol")?.to_string(), self.text(c, "str")?.to_string()))
        });
        Some((name, cases.collect()))
    }

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

    fn property(&self, constraint: &str, ods: &str, dialect: &mut GenDialect) -> (String, String) {
        let (marker, ty) = self.property_of(constraint, ods, dialect);
        let optional = self.field(constraint, "isOptional").and_then(Json::as_i64) == Some(1) || self.is_a(constraint, "OptionalAttr");
        match marker.strip_suffix(")]") {
            Some(head) if optional && head.contains(", default = ") => (format!("{head}, optional)]"), ty),
            _ => (marker, ty),
        }
    }

    fn property_of(&self, constraint: &str, ods: &str, dialect: &mut GenDialect) -> (String, String) {
        let unit = |c: &str| self.is_a(c, "UnitAttr") || self.is_a(c, "UnitProp");
        let base = self.field(constraint, "baseAttr").and_then(Self::def_of).unwrap_or(constraint);
        let chain: Vec<&str> = core::iter::successors(Some(constraint), |c| self.field(c, "baseAttr").and_then(Self::def_of)).collect();
        let optional = self.field(constraint, "isOptional").and_then(Json::as_i64) == Some(1) || self.is_a(constraint, "OptionalAttr");
        let defaulted = self.text(constraint, "defaultValue").is_some_and(|v| !v.is_empty());
        let filled = defaulted;
        let name = format!("name = {ods:?}");
        if unit(constraint) || unit(base) {
            return (format!("#[attr({name})]"), "bool".into());
        }
        if let Some((bits, width, default)) = self.bit_enum_prop(constraint) {
            return match default {
                Some(v) => (format!("#[attr({name}, int = \"i{width}\", default = \"{v}\", bits = {bits:?})]"), "Option<Attribute<'a>>".into()),
                None => (format!("#[attr({name}, int = \"i{width}\", bits = {bits:?})]"), "Attribute<'a>".into()),
            };
        }
        if let Some((enum_rec, (rust, cases, width))) = core::iter::once(base).chain(chain.iter().skip(2).copied()).find_map(|c| Some((c, self.int_enum(c)?))) {
            dialect.enums.insert(rust.clone(), cases);
            let default = filled.then(|| chain.iter().find_map(|c| self.text(c, "defaultValue").filter(|v| !v.is_empty()))).flatten().and_then(|v| self.case_value(enum_rec, v.rsplit("::").next()?));
            return match default {
                Some(v) => (format!("#[attr({name}, int = \"i{width}\", default = \"{v}\")]"), format!("Option<{rust}>")),
                None if optional || defaulted => (format!("#[attr({name}, int = \"i{width}\")]"), format!("Option<{rust}>")),
                None => (format!("#[attr({name}, int = \"i{width}\")]"), rust),
            };
        }
        if let Some((attr, cases)) = core::iter::once(base).chain(chain.iter().skip(2).copied()).find_map(|c| self.dialect_enum(c).or_else(|| self.wrapped_enum(c))) {
            let default = filled
                .then(|| self.text(constraint, "defaultValue"))
                .flatten()
                .and_then(|v| v.rsplit("::").next())
                .and_then(|symbol| if symbol == "{}" { cases.values().find(|c| *c == "none") } else { cases.get(symbol) })
                .map(|case| if attr.contains('<') { format!(", default = {case:?}") } else { format!(", default = \"<{case}>\"") });
            return match default {
                Some(default) => (format!("#[attr({name}, dialect = {attr:?}{default})]"), "Option<Attribute<'a>>".into()),
                None if optional || defaulted => (format!("#[attr({name}, dialect = {attr:?})]"), "Option<Attribute<'a>>".into()),
                None => (format!("#[attr({name}, dialect = {attr:?})]"), "Attribute<'a>".into()),
            };
        }
        if filled && let Some(attr) = chain.iter().find_map(|c| self.text(c, "constBuilderCall")?.strip_suffix("::get($_builder.getContext())").and_then(|cpp| self.bare_attr_def(cpp))) {
            return (format!("#[attr({name}, dialect = {attr:?}, default = \"\")]"), "Option<Attribute<'a>>".into());
        }
        let ty = if optional || defaulted { "Option<Attribute<'a>>" } else { "Attribute<'a>" };
        if self.is_a(base, "AttrDef")
            && let (Some(attr), Some(f)) = (self.text(base, "attrName"), self.text(base, "assemblyFormat"))
            && let [kw, eq, param] = f.split_whitespace().collect::<Vec<_>>()[..]
            && kw.len() > 2 && kw.starts_with('`') && kw.ends_with('`') && eq == "`=`" && param.starts_with('$')
        {
            return (format!("#[attr({name}, dialect = {:?})]", attr.replacen('.', "<", 1)), ty.into());
        }
        let custom = self.field(base, "hasCustomAssemblyFormat").and_then(Json::as_i64) == Some(1) && self.text(base, "mnemonic").is_some_and(|m| !m.is_empty());
        if self.is_a(base, "AttrDef") && (custom || self.text(base, "assemblyFormat").is_some_and(|f| f.trim_start().starts_with("`<`"))) && let Some(attr) = self.text(base, "attrName") {
            return (format!("#[attr({name}, dialect = {attr:?})]"), ty.into());
        }
        if let Some(el) = Self::dense_array(base).or_else(|| Self::dense_array(constraint)) {
            return (format!("#[attr({name}, dense = {el:?})]"), ty.into());
        }
        let default = filled.then(|| self.text(constraint, "defaultValue")).flatten();
        if let Some(int) = chain.iter().find_map(|c| Self::int_attr(c)) {
            let number = default.and_then(|v| v.parse::<i64>().ok().or_else(|| i64::from_str_radix(v.strip_prefix("0x")?, 16).ok()));
            return match number {
                Some(v) => (format!("#[attr({name}, int = \"{int}\", default = \"{v}\")]"), "Option<Attribute<'a>>".into()),
                None => (format!("#[attr({name}, int = \"{int}\")]"), ty.into()),
            };
        }
        if chain.iter().any(|c| self.is_a(c, "BoolAttr")) && let Some(v) = default.filter(|v| matches!(*v, "true" | "false")) {
            return (format!("#[attr({name}, default = \"{v}\")]"), "Option<Attribute<'a>>".into());
        }
        if self.is_a(base, "SymbolNameAttr") || self.is_a(constraint, "SymbolNameAttr") {
            return (format!("#[attr({name}, symbol)]"), ty.into());
        }
        (format!("#[attr({name})]"), ty.into())
    }

    fn int_attr(def: &str) -> Option<String> {
        match def {
            "IndexAttr" => return Some("index".into()),
            "F16Attr" | "F32Attr" | "F64Attr" => return Some(def[..3].to_lowercase()),
            _ => {}
        }
        def.strip_prefix('I')?.strip_suffix("Attr")?.parse::<u32>().ok().filter(|w| [1, 8, 16, 32, 64].contains(w)).map(|w| format!("i{w}"))
    }

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

    #[allow(clippy::too_many_lines)]
    fn op(&self, op: &str, dialect: &mut GenDialect) -> GenOp {
        let rust = op.split_once('_').map_or(op, |(_, r)| r).to_string();
        let name = format!("{}.{}", dialect.name, self.text(op, "opName").unwrap_or(""));
        let summary = self.text(op, "summary").unwrap_or("").trim().to_string();
        let description = GenOp::dedent(self.text(op, "description").unwrap_or(""));
        let mut groups: Vec<Group> = Vec::new();
        let mut props: Vec<GenField> = Vec::new();
        let mut operand_names = Vec::new();
        let ins = self.dag(op, "arguments");
        let unnamed_ins = ins.iter().filter(|(_, n)| n.is_empty()).count();
        let named: Vec<String> = ins.iter().enumerate().map(|(k, (_, n))| match *n {
            "" if unnamed_ins == 1 => String::from("operand"),
            "" => format!("operand{k}"),
            n => String::from(n),
        }).collect();
        for ((constraint, _), ods) in ins.into_iter().zip(&named) {
            let ods = ods.as_str();
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
        let mut results: Vec<String> = Vec::new();
        let outs = self.dag(op, "results");
        let unnamed = outs.len();
        for (k, (constraint, ods)) in outs.into_iter().enumerate() {
            let ods = match ods {
                "" if unnamed == 1 => String::from("result"),
                "" => format!("result{k}"),
                n => String::from(n),
            };
            let variadic = self.is_a(constraint, "Variadic") || self.is_a(constraint, "Optional");
            let base = self.field(constraint, "baseType").and_then(Self::def_of).unwrap_or(constraint);
            groups.push(Group { name: ods.clone(), variadic, result: true, fixed: self.buildable(base), strip: self.type_def(constraint) });
            results.push(ods);
        }
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
                _ if self.is_a(t, "ShapedTypeMatchesElementCountAndTypes") => {
                    if let (Some(shaped), Some(elements)) = (self.text(t, "shaped").and_then(index), self.text(t, "elements").and_then(index)) {
                        infer.insert(elements, format!("el = {}", groups[shaped].name));
                    }
                    Vec::new()
                }
                _ if self.is_a(t, "TypesMatchWith") => {
                    let (Some(lhs), Some(rhs)) = (self.text(t, "lhs").and_then(index), self.text(t, "rhs").and_then(index)) else { continue };
                    let transformer = self.text(t, "transformer").unwrap_or("");
                    let plain = transformer.trim().strip_prefix("::llvm::cast<Type>(").and_then(|r| r.strip_suffix(')')).unwrap_or(transformer).trim();
                    match () {
                        _ if plain == "$_self" => vec![lhs, rhs],
                        _ if transformer.contains("getI1SameShape") || plain.split_whitespace().collect::<String>() == "VectorType::get({::llvm::cast<VectorType>($_self).getShape()[0]},IntegerType::get($_self.getContext(),1))" => {
                            infer.insert(rhs, format!("i1 = {}", groups[lhs].name));
                            Vec::new()
                        }
                        _ if plain == "getMatchingBoolType($_self)" => {
                            infer.insert(rhs, format!("i1 = {}", groups[lhs].name));
                            Vec::new()
                        }
                        _ if plain.split_whitespace().collect::<String>().ends_with("($_self).cloneWith({},IntegerType::get($_ctxt,1))") => {
                            infer.insert(rhs, format!("i1 = {}", groups[lhs].name));
                            Vec::new()
                        }
                        _ if plain.split_whitespace().collect::<String>() == "VectorType(VectorType::Builder(::llvm::cast<VectorType>($_self)).setDim(::llvm::cast<VectorType>($_self).getRank()-1,16))" => {
                            infer.insert(rhs, format!("svbool = {}", groups[lhs].name));
                            Vec::new()
                        }
                        _ if plain.split_whitespace().collect::<String>() == "IntegerType::get($_self.getContext(),(::llvm::cast<VectorType>($_self).getShape()[0]))" => {
                            infer.insert(rhs, format!("width = {}", groups[lhs].name));
                            Vec::new()
                        }
                        _ if plain.split_whitespace().collect::<String>().contains("returnVectorType::get({size,size},vectorType.getElementType(),{true,true});") => {
                            infer.insert(rhs, format!("outer = {}", groups[lhs].name));
                            Vec::new()
                        }
                        _ if !plain.contains("VectorType::get") && (transformer.contains("getElementType()") || (plain.contains("cast<") && [">($_self).getValueType()", ">($_self).getPointeeType()", ">($_self).getImageType()"].iter().any(|g| plain.ends_with(g)))) && !groups[lhs].variadic => {
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
        if op == "LLVM_AtomicCmpXchgOp"
            && let (Some(res), Some(_)) = (index("res"), index("val"))
        {
            infer.insert(res, String::from("pair = val"));
        }
        if let Some(args) = self.text(op, "assemblyFormat").and_then(|f| f.split("custom<InsertExtractValueElementType>(").nth(1)) {
            let names: Vec<&str> = args.split('$').skip(1).filter_map(|a| a.split(|c: char| !(c.is_ascii_alphanumeric() || c == '_')).next()).collect();
            if let [x, container, ..] = names[..]
                && let (Some(x), Some(_)) = (index(x), index(container))
            {
                infer.insert(x, format!("field = {container}"));
            }
        }
        let classes: Vec<usize> = (0..groups.len()).map(|i| find(&mut parent, i)).collect();
        let mut var_of: BTreeMap<usize, (String, String)> = BTreeMap::new();
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
        let var_name = |n: &str| index(n).map(|i| var_of[&classes[i]].1.clone()).unwrap_or_default();
        let class_infer = |c: usize| {
            let rule = infer.iter().find(|(i, _)| classes[**i] == c).map(|(_, r)| {
                let (kind, target) = r.split_once(" = ").unwrap_or((r, ""));
                format!("{kind} = {}", Self::ident(&var_name(target)))
            });
            rule.or_else(|| class_fixed(c).map(|t| if t.contains(['!', '<']) { format!("is = {t:?}") } else { format!("is = {t}") }))
        };
        let mut fields = Vec::new();
        for (i, g) in groups.iter().enumerate().filter(|(_, g)| !g.result) {
            let (var, _) = &var_of[&classes[i]];
            let ty = if g.variadic { "Vec<Value<'a>>" } else { "Value<'a>" };
            fields.push(GenField { marker: format!("#[slot({var}, name = {:?})]", g.name), ident: Self::ident(&g.name), ty: ty.into() });
        }
        fields.extend(props);
        for (key, marker) in [("regions", "region"), ("successors", "successor")] {
            let entries = self.dag(op, key);
            let count = entries.len();
            for (k, (constraint, ods_name)) in entries.into_iter().enumerate() {
                let ods_name = &*match ods_name {
                    "" if count == 1 => String::from(marker),
                    "" => format!("{marker}{k}"),
                    n => String::from(n),
                };
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
        let variadic: Vec<bool> = groups.iter().filter(|g| g.result).map(|g| g.variadic).collect();
        let (format, generic_why) = self.format(op, &fields, &results, &variadic);
        GenOp { rust, name, summary, description, format, generic_why, results: results.iter().map(|r| Self::ident(r)).collect(), fields }
    }

    fn spell_groups(format: &str, fields: &[GenField], results: &[String], variadic: &[bool]) -> String {
        let name_of = |f: &GenField| f.marker.split("name = \"").nth(1).and_then(|n| n.split('"').next()).map(String::from);
        let operands: Vec<(String, bool)> = fields.iter().filter(|f| f.marker.starts_with("#[slot(")).filter_map(|f| Some((name_of(f)?, f.ty.starts_with("Vec<")))).collect();
        let results: Vec<(String, bool)> = results.iter().cloned().zip(variadic.iter().copied()).collect();
        let spelled = |groups: &[(String, bool)], typed: bool| -> Option<String> {
            if groups.len() > 1 && groups.iter().any(|(_, v)| *v) {
                return None;
            }
            let one = |(n, _): &(String, bool)| if typed { format!("qualified(type(${n}))") } else { format!("${n}") };
            Some(groups.iter().map(one).collect::<Vec<_>>().join(" `,` "))
        };
        let (mut out, mut rest) = (String::new(), format);
        while !rest.is_empty() {
            if let Some(lit) = rest.strip_prefix('`') {
                let end = lit.find('`').map_or(rest.len(), |e| e + 2);
                out.push_str(&rest[..end]);
                rest = &rest[end..];
                continue;
            }
            let word_start = !out.ends_with(|c: char| c.is_ascii_alphanumeric() || matches!(c, '_' | '$' | '-'));
            let directive = [("type(operands)", &operands, true), ("type(results)", &results, true), ("operands", &operands, false), ("results", &results, false)]
                .into_iter()
                .find(|(w, _, _)| word_start && rest.starts_with(w) && !rest[w.len()..].starts_with(|c: char| c.is_ascii_alphanumeric() || c == '_'));
            let in_fn = out.trim_end().ends_with("functional-type(") || (out.trim_end().ends_with(',') && out.contains("functional-type(") && !out.rsplit("functional-type(").next().is_some_and(|t| t.contains(')')));
            let listed = |g: &[(String, bool)]| (g.iter().filter(|(_, v)| *v).count() <= 1 && !g.is_empty()).then(|| g.iter().map(|(n, _)| format!("${n}")).collect::<Vec<_>>().join(" "));
            match directive {
                Some((w, g, false)) if in_fn && let Some(s) = listed(g) => {
                    out.push_str(&s);
                    rest = &rest[w.len()..];
                    continue;
                }
                _ => {}
            }
            match directive.and_then(|(w, g, typed)| Some((w, spelled(g, typed)?))) {
                Some((w, s)) if !in_fn && !out.trim_end().ends_with(',') || w.starts_with("type(") => {
                    out.push_str(&s);
                    rest = &rest[w.len()..];
                }
                _ => {
                    let c = rest.chars().next().unwrap_or(' ');
                    out.push(c);
                    rest = &rest[c.len_utf8()..];
                }
            }
        }
        out
    }

    fn format(&self, op: &str, fields: &[GenField], results: &[String], variadic: &[bool]) -> (Option<String>, Option<String>) {
        let Some(raw) = self.text(op, "assemblyFormat").filter(|f| !f.trim().is_empty()) else {
            let why = if self.field(op, "hasCustomAssemblyFormat").and_then(Json::as_i64) == Some(1) { "custom C++ syntax" } else { "no assembly format" };
            return (None, Some(why.into()));
        };
        let raw = match raw.split_once("custom<InsertExtractValueElementType>(") {
            Some((head, tail)) => {
                let mut depth = 1;
                let end = tail.char_indices().find(|(_, c)| {
                    depth += match c {
                        '(' => 1,
                        ')' => -1,
                        _ => 0,
                    };
                    depth == 0
                });
                format!("{head}{}", end.map_or("", |(i, _)| &tail[i + 1..]))
            }
            None => String::from(raw),
        };
        let format = Self::spell_groups(&raw.split_whitespace().collect::<Vec<_>>().join(" "), fields, results, variadic);
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
                ' ' | '(' | ')' | '?' | '^' | ',' | '|' => &rest[1..],
                _ if rest.starts_with("custom<") => {
                    let after = &rest["custom<".len()..];
                    match after.split_once('>') {
                        Some((name, tail)) if mlirformat::syntax::known(name) => tail,
                        Some((name, _)) => return (None, Some(format!("directive `custom<{name}>`"))),
                        None => return (None, Some("`custom<` without its `>`".into())),
                    }
                }
                _ => match ["type(", "functional-type(", "qualified(", "attr-dict-with-keyword", "attr-dict", "oilist("].iter().find(|w| rest.starts_with(**w)) {
                    Some(w) => &rest[w.len()..],
                    None => return (None, Some(format!("directive `{}`", rest.split([' ', '(']).next().unwrap_or(rest)))),
                },
            };
        }
        for r in results {
            let own = format!("#[dtype(name = {r:?}");
            let ruleless = |m: &str| m.strip_prefix(&own).is_some_and(|rest| rest == ")]" || (rest.starts_with(", strip = ") && rest.matches(" = ").count() == 1));
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
    pub fn file_name(&self) -> String {
        format!("{}.gen.rs", self.name.replace('.', "_"))
    }

    pub fn render(&self, source: &str, params: Option<&str>) -> String {
        let mut out = String::new();
        let _ = writeln!(out, "//! `{}` dialect: generated by `mlirformat tblgen` from `{source}`. Do not edit.", self.name);
        let _ = writeln!(out, "#![allow(non_camel_case_types, unused_imports, clippy::all, rustdoc::all)]\n");
        let _ = writeln!(out, "use mlirformat::{{mlir, Attribute, Region, Str, Type, Value, __Vec as Vec}};\n");
        for (name, cases) in &self.enums {
            let _ = writeln!(out, "#[derive(Debug, Clone, Copy, PartialEq, Eq, mlirformat::__serde::Serialize, mlirformat::__serde::Deserialize, mlir::Cases)]");
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
            for line in op.doc() {
                let _ = writeln!(out, "///{}{line}", if line.is_empty() { "" } else { " " });
            }
            if let Some(why) = &op.generic_why {
                let _ = writeln!(out, "///\n/// Generic form only ({why}).");
            }
            let results = if op.results.is_empty() { String::new() } else { format!(", results({})", op.results.join(", ")) };
            let syntax = op.format.as_ref().map_or_else(String::new, |f| format!(", format = {f:?}"));
            let _ = writeln!(out, "#[mlir::op({:?}{syntax}{results})]", op.name);
            let _ = writeln!(out, "pub struct {}<'a> {{", op.rust);
            for f in &op.fields {
                let marker = f.shown(op.format.as_deref());
                let typed = ["Type<", "Region<", "Value<"].iter().any(|t| f.ty.contains(t));
                if matches!(marker.as_str(), "#[dtype]" | "#[region]") || marker == "#[attr]" && !typed {
                    let _ = writeln!(out, "    pub {}: {},", f.ident, f.ty);
                } else {
                    let _ = writeln!(out, "    {marker}\n    pub {}: {},", f.ident, f.ty);
                }
            }
            let _ = writeln!(out, "}}\n");
        }
        let mut args = format!("{:?}", self.name);
        let ops: Vec<&str> = self.ops.iter().map(|o| o.rust.as_str()).collect();
        let _ = write!(args, ",\n    ops = [{}]", ops.join(", "));
        if let Some(path) = params {
            let _ = write!(args, ",\n    params = {path}");
        }
        if !self.dependents.is_empty() {
            let deps: Vec<String> = self.dependents.iter().map(|d| format!("{d:?}")).collect();
            let _ = write!(args, ",\n    dependents = [{}]", deps.join(", "));
        }
        if self.materializer {
            args.push_str(",\n    materializer");
        }
        if self.canonicalizer {
            args.push_str(",\n    canonicalizer");
        }
        let _ = writeln!(out, "/// The `{}` dialect.\n#[mlir::dialect(\n    {args}\n)]\npub struct {}Dialect;", self.name, Records::camel(&self.name));
        out
    }
}
