//! Shared by the integration tests: the paired `mlir-opt` fixtures and how one op is judged
//! against them.

#![allow(dead_code)]

use std::collections::BTreeMap;
use std::fs;
use std::path::{Path, PathBuf};
use std::sync::atomic::{AtomicUsize, Ordering};

use mlirformat::{Item, MlirOpt, Module, Operation};

/// The `mlir-opt` 22.1.8 output for llvm-project's `mlir/test` files, generic and custom form.
pub struct Fixtures;

/// How one op fares against `mlir-opt`.
#[derive(Debug, Clone, PartialEq, Eq)]
pub enum Verdict {
    /// No op of this name in the op table.
    Unknown,
    /// Printed generic: the typed op declines it, or has no custom form.
    Generic,
    /// Custom form printed exactly as `mlir-opt` prints it, and reparsed to the same op.
    Matched,
    /// Reparsed to the same op; `mlir-opt`'s text not comparable (multi-line, or elided there).
    Reparsed,
    /// Custom form that `mlir-opt` does not print.
    Mismatch(String),
    /// Custom form that does not parse back to the same op.
    Broken(String),
}

impl Fixtures {
    pub fn dir() -> PathBuf {
        Path::new(env!("CARGO_MANIFEST_DIR")).join("tests/fixtures")
    }

    /// Replaces SSA names (`%arg0`, `%c1_i64`, ...), block names and alias numbers (`#map3`) by
    /// `_`, so the two outputs are comparable.
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

    /// Ops with whether they are visible in custom form: `mlir-opt` elides linalg named ops' bodies.
    fn walk<'x, 'a>(ops: &'x [Operation<'a>], parent: Option<&'x Operation<'a>>, visible: bool, f: &mut impl FnMut(&'x Operation<'a>, Option<&'x Operation<'a>>, bool)) {
        for op in ops {
            f(op, parent, visible);
            let inner = visible && !op.name.starts_with("linalg.");
            op.regions.iter().flat_map(|r| &r.blocks).for_each(|b| Self::walk(&b.ops, Some(op), inner, f));
        }
    }

    /// 两个 op 的调试写法里第一处不同，连同它所在的字段名 —— 失败归类就靠它。
    fn first_diff(a: &Operation<'_>, b: &Operation<'_>) -> String {
        // 回读成了原文 ⇒ 印得出、却解析不回去。这是和「某个字段算错」完全不同的毛病，
        // 单列出来，别混在字段差异里。
        if b.raw.is_some() && a.raw.is_none() {
            return format!("{} 的自定义形式解析不回去（退回原文）", a.name);
        }
        let (x, y) = (format!("{a:#?}"), format!("{b:#?}"));
        let mut field = String::from("?");
        for (p, q) in x.lines().zip(y.lines()) {
            // 记住最近一个 `名字: ` 开头的行，作为差异所在的字段。
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

    /// Does `op` say nothing beyond being there? Whether such a terminator is written at all is
    /// its parent's choice, so its own text says nothing about matching `mlir-opt`.
    fn bare(op: &Operation<'_>) -> bool {
        op.operands.is_empty() && op.results.is_empty() && op.attributes.is_empty() && op.regions.is_empty()
    }

    /// The generic fixture files, sorted.
    pub fn files() -> Vec<PathBuf> {
        let mut files: Vec<PathBuf> = fs::read_dir(Self::dir().join("generic")).unwrap().map(|e| e.unwrap().path()).collect();
        files.sort();
        files
    }

    /// ⭐ Every op of every generic fixture (nested ones too), on all cores: `f(file, op, visible,
    /// anonymized custom output)`; the `Some`s are collected (order: by file, then by op).
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
                                // An op's custom form may have to look inside an alias the module
                                // defines (an `affine` memory op and its `#map`), so judging it
                                // one op at a time still needs the module's table.
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

    /// Every op of every generic fixture, in order (single-threaded callers with state).
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

    /// ⭐ One generated dialect (`opt` registers it alone) against `mlir-opt`: prints its tally,
    /// fails on a custom form that `mlir-opt` does not print or that does not parse back.
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
        assert!(failures.is_empty(), "{} failures:\n{}", failures.len(), failures.iter().take(60).cloned().collect::<Vec<_>>().join("\n"));
    }

    /// ⭐ Judges `op` printed with `opt` against `mlir-opt`'s custom output of its file.
    pub fn judge(opt: &MlirOpt, op: &Operation<'_>, parent: Option<&Operation<'_>>, visible: bool, custom: &str, aliases: &[(String, String)]) -> Verdict {
        if opt.template(&op.name).is_none() {
            return Verdict::Unknown;
        }
        let text = opt.show_in(aliases, op).to_string();
        // Result names are mlir-opt's choice (`%low, %high` vs `%36:2`): compare from the op name on.
        let body = if op.results.is_empty() { text.as_str() } else { text.split_once(" = ").map_or(text.as_str(), |(_, b)| b) };
        if body.starts_with('"') {
            return Verdict::Generic;
        }
        match opt.parse_op_in(aliases, &text) {
            Ok(back) if back == *op => {}
            // ⭐ 报出**第一处不同的字段**，不是光说「往返不一致」—— 这样几百条失败能按
            // 字段归类，一眼看出是同一个毛病还是几种。
            Ok(back) => return Verdict::Broken(format!("往返不一致 [{}]: {text}", Self::first_diff(op, &back))),
            Err(e) => return Verdict::Broken(format!("{e}: {text}")),
        }
        if !visible || text.contains('\n') {
            return Verdict::Reparsed;
        }
        // A bare terminator its parent writes nothing for is not rendered on its own, here or by
        // mlir-opt; judging its text against the file would only ever report the omission.
        if Self::bare(op) && parent.is_some_and(|par| !opt.show_in(aliases, par).to_string().contains(&*op.name)) {
            return Verdict::Reparsed;
        }
        // Inside its own dialect's regions an op prints without its prefix (`return`).
        let (full, short) = (&*op.name, op.name.split_once('.').map_or(&*op.name, |(_, n)| n));
        let long = if body.starts_with(full) { body.to_string() } else { body.replacen(short, full, 1) };
        let brief = long.replacen(full, short, 1);
        if custom.contains(&Self::anon(&long)) || custom.contains(&Self::anon(&brief)) { Verdict::Matched } else { Verdict::Mismatch(text) }
    }
}
