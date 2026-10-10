//! Shared by the integration tests: the paired `mlir-opt` fixtures and how one op is judged
//! against them.

#![allow(dead_code)]

use std::fs;
use std::path::{Path, PathBuf};

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
    fn walk<'x, 'a>(ops: &'x [Operation<'a>], visible: bool, f: &mut impl FnMut(&'x Operation<'a>, bool)) {
        for op in ops {
            f(op, visible);
            let inner = visible && !op.name.starts_with("linalg.");
            op.regions.iter().flat_map(|r| &r.blocks).for_each(|b| Self::walk(&b.ops, inner, f));
        }
    }

    /// ⭐ Every op of every generic fixture (nested ones too): `f(file, op, visible, anonymized custom output)`.
    pub fn each(mut f: impl FnMut(&Path, &Operation<'_>, bool, &str)) {
        for entry in fs::read_dir(Self::dir().join("generic")).unwrap() {
            let path = entry.unwrap().path();
            let src = fs::read_to_string(&path).unwrap();
            let custom = Self::anon(&fs::read_to_string(Self::dir().join("custom").join(path.file_name().unwrap())).unwrap());
            for chunk in src.split("// -----") {
                let m = Module::try_from(chunk.trim_start_matches('-')).unwrap();
                let ops: Vec<_> = m.items.into_iter().filter_map(|i| if let Item::Op(op) = i { Some(op) } else { None }).collect();
                Self::walk(&ops, true, &mut |op, visible| f(&path, op, visible, &custom));
            }
        }
    }

    /// ⭐ Judges `op` printed with `opt` against `mlir-opt`'s custom output of its file.
    pub fn judge(opt: &MlirOpt, op: &Operation<'_>, visible: bool, custom: &str) -> Verdict {
        if opt.template(&op.name).is_none() {
            return Verdict::Unknown;
        }
        let text = opt.show(op).to_string();
        // Result names are mlir-opt's choice (`%low, %high` vs `%36:2`): compare from the op name on.
        let body = if op.results.is_empty() { text.as_str() } else { text.split_once(" = ").map_or(text.as_str(), |(_, b)| b) };
        if body.starts_with('"') {
            return Verdict::Generic;
        }
        match opt.parse_op(&text) {
            Ok(back) if back == *op => {}
            Ok(_) => return Verdict::Broken(format!("reparses differently: {text}")),
            Err(e) => return Verdict::Broken(format!("{e}: {text}")),
        }
        if !visible || text.contains('\n') {
            return Verdict::Reparsed;
        }
        // Inside its own dialect's regions an op prints without its prefix (`return`).
        let (full, short) = (&*op.name, op.name.split_once('.').map_or(&*op.name, |(_, n)| n));
        let long = if body.starts_with(full) { body.to_string() } else { body.replacen(short, full, 1) };
        let brief = long.replacen(full, short, 1);
        if custom.contains(&Self::anon(&long)) || custom.contains(&Self::anon(&brief)) { Verdict::Matched } else { Verdict::Mismatch(text) }
    }
}
