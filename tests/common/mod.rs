#![allow(dead_code)]

use std::collections::BTreeMap;
use std::fs;
use std::path::{Path, PathBuf};
use std::sync::atomic::{AtomicUsize, Ordering};

use mlirformat::{Attribute, Item, MlirOpt, Module, Operation, Role};

pub struct Fixtures;

#[derive(Debug, Clone, PartialEq, Eq)]
pub enum Verdict {
    Unknown,
    Generic,
    Matched,
    Reparsed,
    Mismatch(String),
    Broken(String),
}

impl Fixtures {
    pub fn dir() -> PathBuf {
        Path::new(env!("CARGO_MANIFEST_DIR")).join("tests/fixtures")
    }

    pub fn anon(s: &str) -> String {
        let name = |c: &char| c.is_ascii_alphanumeric() || matches!(c, '_' | '$' | '.' | '-' | '#');
        let mut out = String::new();
        let mut it = s.chars().peekable();
        while let Some(c) = it.next() {
            out.push(c);
            if matches!(c, '%' | '^') {
                out.push('_');
                while it.peek().is_some_and(name) {
                    it.next();
                }
            }
            if out.ends_with("#map") {
                while it.peek().is_some_and(char::is_ascii_digit) {
                    it.next();
                }
            }
        }
        out
    }

    fn walk<'x, 'a>(ops: &'x [Operation<'a>], parent: Option<&'x Operation<'a>>, visible: bool, f: &mut impl FnMut(&'x Operation<'a>, Option<&'x Operation<'a>>, bool)) {
        for op in ops {
            f(op, parent, visible);
            let inner = visible && !op.name.starts_with("linalg.");
            op.regions.iter().flat_map(|r| &r.blocks).for_each(|b| Self::walk(&b.ops, Some(op), inner, f));
        }
    }

    fn first_diff(a: &Operation<'_>, b: &Operation<'_>) -> String {
        if b.raw.is_some() && a.raw.is_none() {
            return format!("{} 的自定义形式解析不回去（退回原文）", a.name);
        }
        let (x, y) = (format!("{a:#?}"), format!("{b:#?}"));
        let mut field = String::from("?");
        for (p, q) in x.lines().zip(y.lines()) {
            if let Some((name, _)) = p.trim().split_once(": ")
                && !name.is_empty()
                && name.chars().all(|c| c.is_ascii_alphanumeric() || c == '_')
            {
                field = String::from(name);
            }
            if p != q {
                return format!("{field} | 原 {} | 回 {}", p.trim(), q.trim());
            }
        }
        format!("{field} | 行数不同 {} vs {}", x.lines().count(), y.lines().count())
    }

    fn bare(op: &Operation<'_>) -> bool {
        op.operands.is_empty() && op.results.is_empty() && op.attributes.is_empty() && op.regions.is_empty()
    }

    fn generic_only(opt: &MlirOpt, op: &Operation<'_>) -> bool {
        let text = opt.show(op).to_string();
        let body = if op.results.is_empty() { text.as_str() } else { text.split_once(" = ").map_or(text.as_str(), |(_, b)| b) };
        body.starts_with('"')
    }

    pub fn sample(dir: &Path) -> Vec<PathBuf> {
        let mut files: Vec<PathBuf> = fs::read_dir(dir).unwrap().map(|e| e.unwrap().path()).filter(|p| p.extension().is_some_and(|e| e == "mlir")).collect();
        files.sort();
        if !cfg!(feature = "more") {
            files = files.into_iter().step_by(10).collect();
        }
        files
    }

    pub fn files() -> Vec<PathBuf> {
        Self::sample(&Self::dir().join("generic"))
    }

    pub fn map<T: Send>(f: impl Fn(&Path, &Operation<'_>, Option<&Operation<'_>>, bool, &str, &[(String, String)]) -> Option<T> + Sync) -> Vec<T> {
        let files = Self::files();
        let next = AtomicUsize::new(0);
        let threads = std::thread::available_parallelism().map_or(4, |n| n.get());
        let mut per_file: Vec<(usize, Vec<T>)> = std::thread::scope(|s| {
            let workers: Vec<_> = (0..threads)
                .map(|_| {
                    s.spawn(|| {
                        let mut done = Vec::new();
                        loop {
                            let i = next.fetch_add(1, Ordering::Relaxed);
                            let Some(path) = files.get(i) else { break };
                            let src = fs::read_to_string(path).unwrap();
                            let custom = Self::anon(&fs::read_to_string(Self::dir().join("custom").join(path.file_name().unwrap())).unwrap());
                            let mut out = Vec::new();
                            for chunk in src.split("// -----") {
                                let m = Module::try_from(chunk.trim_start_matches('-')).unwrap();
                                let aliases = m.aliases();
                                let ops: Vec<_> = m.items.into_iter().filter_map(|i| if let Item::Op(op) = i { Some(op) } else { None }).collect();
                                Self::walk(&ops, None, true, &mut |op, parent, visible| out.extend(f(path, op, parent, visible, &custom, &aliases)));
                            }
                            done.push((i, out));
                        }
                        done
                    })
                })
                .collect();
            workers.into_iter().flat_map(|w| w.join().unwrap()).collect()
        });
        per_file.sort_by_key(|(i, _)| *i);
        per_file.into_iter().flat_map(|(_, out)| out).collect()
    }

    pub fn each(mut f: impl FnMut(&Path, &Operation<'_>, bool, &str)) {
        for path in Self::files() {
            let src = fs::read_to_string(&path).unwrap();
            let custom = Self::anon(&fs::read_to_string(Self::dir().join("custom").join(path.file_name().unwrap())).unwrap());
            for chunk in src.split("// -----") {
                let m = Module::try_from(chunk.trim_start_matches('-')).unwrap();
                let ops: Vec<_> = m.items.into_iter().filter_map(|i| if let Item::Op(op) = i { Some(op) } else { None }).collect();
                Self::walk(&ops, None, true, &mut |op, _, visible| f(&path, op, visible, &custom));
            }
        }
    }

    pub fn check_dialect(opt: &MlirOpt, ns: &str) {
        let verdicts = Self::map(|path, op, parent, visible, custom, aliases| {
            (op.name.split_once('.').map(|(n, _)| n) == Some(ns)).then(|| (path.file_name().unwrap().to_string_lossy().into_owned(), Self::judge(opt, op, parent, visible, custom, aliases)))
        });
        let mut tally: BTreeMap<&str, usize> = BTreeMap::new();
        let mut failures = Vec::new();
        for (file, v) in &verdicts {
            let kind = match v {
                Verdict::Unknown => "unknown",
                Verdict::Generic => "generic",
                Verdict::Matched => "matched",
                Verdict::Reparsed => "reparsed",
                Verdict::Mismatch(text) => {
                    failures.push(format!("{file}: not mlir-opt's: {text}"));
                    "mismatch"
                }
                Verdict::Broken(why) => {
                    failures.push(format!("{file}: {why}"));
                    "broken"
                }
            };
            *tally.entry(kind).or_default() += 1;
        }
        println!("{ns}: {} ops {tally:?}", verdicts.len());
        assert!(failures.is_empty(), "{} failures:\n{}", failures.len(), failures.join("\n"));
    }

    pub fn judge(opt: &MlirOpt, op: &Operation<'_>, parent: Option<&Operation<'_>>, visible: bool, custom: &str, aliases: &[(String, String)]) -> Verdict {
        if opt.template(&op.name).is_none() {
            return Verdict::Unknown;
        }
        let text = opt.show_in(aliases, op).to_string();
        let body = if op.results.is_empty() { text.as_str() } else { text.split_once(" = ").map_or(text.as_str(), |(_, b)| b) };
        if body.starts_with('"') {
            return Verdict::Generic;
        }
        let mut plain = op.clone();
        Elided::optional_defaults(opt, &mut plain);
        match opt.parse_op_in(aliases, &text) {
            Ok(back) if back == plain || Elided::same(&plain, &back, aliases) => {}
            Ok(back) => return Verdict::Broken(format!("往返不一致 [{}]: {text}", Self::first_diff(&plain, &back))),
            Err(e) => return Verdict::Broken(format!("{e}: {text}")),
        }
        if !visible || text.contains('\n') {
            return Verdict::Reparsed;
        }
        if Self::bare(op) && parent.is_some_and(|par| !opt.show_in(aliases, par).to_string().contains(&*op.name)) {
            return Verdict::Reparsed;
        }
        let last = |par: &Operation<'_>| par.regions.iter().flat_map(|r| &r.blocks).any(|b| b.ops.last().is_some_and(|l| core::ptr::eq(l, op)));
        if !op.attributes.is_empty() && Self::bare(&Operation { attributes: Vec::new(), ..op.clone() }) && parent.is_some_and(last) {
            return Verdict::Reparsed;
        }
        if parent.is_some_and(|par| Self::generic_only(opt, par) && par.regions.iter().flat_map(|r| &r.blocks).any(|b| b.ops.last().is_some_and(|l| core::ptr::eq(l, op)))) {
            return Verdict::Reparsed;
        }
        if parent.is_some_and(|par| par.name == "spirv.SpecConstantOperation") {
            return Verdict::Reparsed;
        }
        let (full, short) = (&*op.name, op.name.split_once('.').map_or(&*op.name, |(_, n)| n));
        let long = if body.starts_with(full) { body.to_string() } else { body.replacen(short, full, 1) };
        let brief = long.replacen(full, short, 1);
        if custom.contains(&Self::anon(&long)) || custom.contains(&Self::anon(&brief)) { Verdict::Matched } else { Verdict::Mismatch(text) }
    }
}

pub struct Elided;

impl Elided {
    pub fn normalize(op: &mut Operation<'_>, aliases: &[(String, String)]) {
        if let Some(Attribute::Dict(props)) = &mut op.properties {
            props.retain(|a| !(matches!(&*a.name, "arg_attrs" | "res_attrs") && matches!(&a.value, Some(Attribute::Array(xs)) if xs.is_empty())));
        }
        if op.name == "gpu.func" && let Some(i) = op.attributes.iter().position(|a| a.name == "gpu.kernel") {
            op.attributes.remove(i);
            let props = op.properties.get_or_insert_with(|| Attribute::Dict(Vec::new()));
            if let Attribute::Dict(props) = props
                && !props.iter().any(|a| a.name == "kernel")
            {
                props.push(mlirformat::NamedAttr { name: "kernel".into(), value: None });
                props.sort_by(|a, b| a.name.cmp(&b.name));
            }
        }
        if op.name.starts_with("linalg.") {
            Self::rename(op);
            Self::expand(op, aliases);
            op.attributes.retain(|a| a.name != "linalg.memoized_indexing_maps");
        }
        for r in &mut op.regions {
            for b in &mut r.blocks {
                for o in &mut b.ops {
                    Self::normalize(o, aliases);
                }
            }
        }
    }

    pub fn optional_defaults(opt: &MlirOpt, op: &mut Operation<'_>) {
        if let Some(f) = opt.template(&op.name).and_then(|t| (t.format)())
            && let Some(Attribute::Dict(props)) = &mut op.properties
        {
            props.retain(|a| !f.schema.field(&a.name).is_some_and(|fd| matches!(fd.role, Role::Prop { optional: true, .. }) && a.value.as_ref() == fd.default_attr().as_ref()));
            if props.is_empty() {
                op.properties = None;
            }
        }
        for r in &mut op.regions {
            for b in &mut r.blocks {
                for o in &mut b.ops {
                    Self::optional_defaults(opt, o);
                }
            }
        }
    }

    pub fn module(m: &mut Module<'_>) {
        let aliases = m.aliases();
        for i in &mut m.items {
            if let Item::Op(op) = i {
                Self::normalize(op, &aliases);
            }
        }
    }

    fn rename(op: &mut Operation<'_>) {
        let mut names: BTreeMap<String, String> = BTreeMap::new();
        for r in &op.regions {
            for b in &r.blocks {
                for (i, a) in b.args.iter().enumerate() {
                    names.insert(a.name.to_string(), format!("__a{i}"));
                }
                for (k, o) in b.ops.iter().enumerate() {
                    for res in &o.results {
                        names.insert(res.name.to_string(), format!("__v{k}"));
                    }
                }
            }
        }
        for r in &mut op.regions {
            for b in &mut r.blocks {
                for a in &mut b.args {
                    a.name = names[&*a.name].clone().into();
                    a.loc = None;
                }
                for o in &mut b.ops {
                    Self::rename_uses(o, &names);
                    for res in &mut o.results {
                        res.name = names[&*res.name].clone().into();
                    }
                }
            }
        }
    }

    fn rename_uses(op: &mut Operation<'_>, names: &BTreeMap<String, String>) {
        for v in &mut op.operands {
            if let Some(n) = names.get(&*v.name) {
                v.name = n.clone().into();
            }
        }
        op.loc = None;
        for r in &mut op.regions {
            for b in &mut r.blocks {
                for o in &mut b.ops {
                    Self::rename_uses(o, names);
                }
            }
        }
    }

    fn expand(op: &mut Operation<'_>, aliases: &[(String, String)]) {
        let Some(mlirformat::Attribute::Dict(props)) = &mut op.properties else { return };
        for p in props.iter_mut().filter(|p| p.name == "indexing_maps") {
            let Some(mlirformat::Attribute::Array(maps)) = &mut p.value else { continue };
            for m in maps.iter_mut() {
                let text = match &*m {
                    mlirformat::Attribute::Extended { ext, .. } if ext.body.is_none() => aliases.iter().find(|(n, _)| *n == *ext.name).map(|(_, t)| t.clone()),
                    _ => None,
                };
                if let Some(attr) = text.and_then(|t| mlirformat::Attribute::try_from(t.as_str()).ok().map(|a| a.owned())) {
                    *m = attr;
                }
            }
        }
    }

    pub fn same(a: &Operation<'_>, b: &Operation<'_>, aliases: &[(String, String)]) -> bool {
        let (mut a, mut b) = (a.clone(), b.clone());
        Self::normalize(&mut a, aliases);
        Self::normalize(&mut b, aliases);
        a == b
    }
}
