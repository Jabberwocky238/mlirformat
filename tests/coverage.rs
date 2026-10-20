//! Op coverage over the `mlir-opt` fixtures: per dialect, how many op occurrences (and distinct ops)
//! the upstream op table knows and converts to a typed op. Run with `--nocapture` for the table.
//!
//! Locked in: every registered dialect covers every one of its ops that the fixtures use, except
//! the ops upstream defines in C++ instead of ODS (`NOT_IN_ODS`). An op whose typed op is
//! generic-only (`#[mlir::op(..., generic)]`: ODS syntax the format engine cannot express) prints
//! generic by design and is counted as such, not as a decline.
//!
//! A decline (an op with a custom form that its typed op cannot print) fails for the hand-written
//! dialects, where every op was written against `mlir-opt`'s output. For the dialects generated
//! from ODS (`GENERATED`) it is only counted: they fall back to the generic form, which is valid
//! MLIR, and `tests/dialects.rs` checks every custom form they do print against `mlir-opt`.

mod common;

use std::collections::BTreeMap;

use common::Fixtures;
use mlirformat::{MlirOpt, Printer};

/// One dialect's tally.
#[derive(Default)]
struct Tally {
    /// Occurrences of each op name.
    ops: BTreeMap<String, usize>,
    /// Occurrences the op table knows / converts.
    known: usize,
    converted: usize,
    /// Distinct op names the op table does not know.
    missing: BTreeMap<String, usize>,
    /// Occurrences of ops whose typed op is generic-only.
    generic: usize,
    /// Known ops with a custom form left generic.
    declined: Vec<String>,
}

impl Tally {
    fn total(&self) -> usize {
        self.ops.values().sum()
    }
}

/// What the op table makes of one op.
enum Seen {
    Missing,
    Converted,
    /// The typed op is generic-only: it prints generic by design.
    Generic,
    Declined(String),
}

/// Ops that upstream defines in C++ rather than in ODS, so `mlirformat tblgen` cannot see them:
/// `affine.dma_start` / `affine.dma_wait` are `AffineDmaStartOp` / `AffineDmaWaitOp` in
/// `mlir/Dialect/Affine/IR/AffineOps.h` (LLVM 22.1.8).
const NOT_IN_ODS: &[&str] = &["affine.dma_start", "affine.dma_wait"];

/// The built-in dialects that come from `mlirformat tblgen` (`src/dialects/*.gen.rs`).
const GENERATED: &[&str] = &["affine", "async", "bufferization", "gpu", "linalg", "llvm", "memref", "pdl", "scf", "shape", "tensor", "tosa", "vector"];

fn percent(part: usize, whole: usize) -> f64 {
    if whole == 0 { 100.0 } else { part as f64 * 100.0 / whole as f64 }
}

#[test]
fn op_coverage() {
    let opt = MlirOpt::upstream();
    let seen = Fixtures::map(|_, op, _, _, _, _| {
        let seen = match opt.template(&op.name) {
            None => Seen::Missing,
            Some(template) => {
                let mut text = String::new();
                match (template.print)(op, &mut Printer::new(&mut text, &opt)) {
                    Some(Ok(())) => Seen::Converted,
                    _ if !template.custom => Seen::Generic,
                    _ => Seen::Declined(op.to_string()),
                }
            }
        };
        Some((op.name.to_string(), seen))
    });
    let mut dialects: BTreeMap<String, Tally> = BTreeMap::new();
    for (name, seen) in seen {
        let ns = name.split_once('.').map_or("", |(ns, _)| ns);
        let tally = dialects.entry(ns.into()).or_default();
        *tally.ops.entry(name.clone()).or_default() += 1;
        match seen {
            Seen::Missing => *tally.missing.entry(name).or_default() += 1,
            Seen::Converted => {
                tally.known += 1;
                tally.converted += 1;
            }
            Seen::Generic => {
                tally.known += 1;
                tally.generic += 1;
            }
            Seen::Declined(text) => {
                tally.known += 1;
                tally.declined.push(text);
            }
        }
    }
    let registered: Vec<&str> = opt.namespaces().collect();
    let (mut total, mut known, mut converted, mut distinct, mut distinct_known) = (0, 0, 0, 0, 0);
    let mut rows: Vec<(&String, &Tally)> = dialects.iter().collect();
    rows.sort_by_key(|(_, t)| std::cmp::Reverse(t.total()));
    println!("{:<16} {:>8} {:>8} {:>8} {:>8}  {:>12}  registered", "dialect", "ops", "known", "custom", "generic", "distinct ops");
    let mut declines: Vec<(&str, usize)> = Vec::new();
    for (ns, t) in &rows {
        let names = t.ops.len();
        let names_known = names - t.missing.len();
        println!(
            "{:<16} {:>8} {:>8} {:>7.1}% {:>8}  {:>5}/{:<6}  {}",
            if ns.is_empty() { "(no dialect)" } else { ns.as_str() },
            t.total(),
            t.known,
            percent(t.converted, t.total()),
            t.generic,
            names_known,
            names,
            if registered.contains(&ns.as_str()) { "yes" } else { "" }
        );
        if !t.declined.is_empty() {
            declines.push((ns.as_str(), t.declined.len()));
        }
        (total, known, converted, distinct, distinct_known) = (total + t.total(), known + t.known, converted + t.converted, distinct + names, distinct_known + names_known);
    }
    println!(
        "{:<16} {total:>8} {known:>8} {:>7.1}%  {distinct_known:>5}/{distinct:<6}",
        "all",
        percent(converted, total)
    );

    if !declines.is_empty() {
        println!("declined (printed generic instead of their custom form): {declines:?}");
    }

    let mut failures = Vec::new();
    for ns in &registered {
        let Some(t) = dialects.get(*ns) else { continue };
        let missing: BTreeMap<&String, &usize> = t.missing.iter().filter(|(name, _)| !NOT_IN_ODS.contains(&name.as_str())).collect();
        if !missing.is_empty() {
            failures.push(format!("`{ns}` is registered but misses {missing:?}"));
        }
        if !t.declined.is_empty() && !GENERATED.contains(ns) {
            failures.push(format!("`{ns}`: {} ops declined, e.g. {}", t.declined.len(), t.declined[0]));
        }
    }
    assert!(failures.is_empty(), "{}", failures.join("\n"));
}
