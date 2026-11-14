use std::fs;
use std::path::Path;
use std::sync::atomic::{AtomicUsize, Ordering};

mod common;

use common::Fixtures;
use mlirformat::*;

const STACK: usize = 64 << 20;

fn each_chunk(dir: &str, check: impl Fn(&str) -> Result<(), String> + Sync) {
    each_chunk_at(dir, |_, _, chunk| check(chunk));
}

fn each_chunk_at(dir: &str, check: impl Fn(&Path, usize, &str) -> Result<(), String> + Sync) {
    let dir = Path::new(env!("CARGO_MANIFEST_DIR")).join("tests/fixtures").join(dir);
    let files = Fixtures::sample(&dir);
    let next = AtomicUsize::new(0);
    let threads = std::thread::available_parallelism().map_or(4, |n| n.get());
    let (total, mut failures) = std::thread::scope(|s| {
        let workers: Vec<_> = (0..threads)
            .map(|_| {
                std::thread::Builder::new().stack_size(STACK).spawn_scoped(s, || {
                    let (mut total, mut failures) = (0, Vec::new());
                    while let Some(path) = files.get(next.fetch_add(1, Ordering::Relaxed)) {
                        let src = fs::read_to_string(path).unwrap();
                        for (i, chunk) in src.split("// -----").enumerate() {
                            total += 1;
                            if let Err(e) = check(path, i, chunk.trim_start_matches('-')) {
                                failures.push(format!("{}#{i}: {e}", path.file_name().unwrap().to_string_lossy()));
                            }
                        }
                    }
                    (total, failures)
                })
                .unwrap()
            })
            .collect();
        workers.into_iter().map(|w| w.join().unwrap()).fold((0, Vec::new()), |(t, mut f), (n, more)| {
            f.extend(more);
            (t + n, f)
        })
    });
    failures.sort();
    assert!(failures.is_empty(), "{}/{total} chunks failed:\n{}", failures.len(), failures.join("\n"));
}

fn roundtrip(src: &str, opt: &MlirOpt) -> Result<(), String> {
    let m = opt.parse(src).map_err(|e| e.to_string())?;
    let text = opt.show(&m).to_string();
    let mut again = opt.parse(&text).map_err(|e| format!("reparse: {e}\n{text}"))?;
    let mut first = m.clone();
    for m in [&mut first, &mut again] {
        common::Elided::module(m);
        for i in &mut m.items {
            if let Item::Op(op) = i {
                common::Elided::optional_defaults(opt, op);
            }
        }
    }
    (again == first).then_some(()).ok_or_else(|| format!("print/parse mismatch:\n{text}"))?;
    let json = serde_json::to_string(&m).unwrap();
    let mut de = serde_json::Deserializer::from_str(&json);
    de.disable_recursion_limit();
    let back: Module<'_> = serde::Deserialize::deserialize(&mut de).map_err(|e| e.to_string())?;
    (back == m).then_some(()).ok_or_else(|| "json mismatch".into())
}

fn raw_ops(ops: &[Operation<'_>]) -> usize {
    ops.iter().map(|op| if op.raw.is_some() { 1 } else { op.regions.iter().flat_map(|r| &r.blocks).map(|b| raw_ops(&b.ops)).sum() }).sum()
}

#[test]
fn generic_form_is_fully_structured() {
    each_chunk("generic", |src| {
        let m = Module::try_from(src).map_err(|e| e.to_string())?;
        let ops: Vec<_> = m.items.into_iter().filter_map(|i| if let Item::Op(op) = i { Some(op) } else { None }).collect();
        match raw_ops(&ops) {
            0 => roundtrip(src, &MlirOpt::new()),
            n => Err(format!("{n} ops left unstructured")),
        }
    });
}

#[test]
fn custom_form_roundtrips() {
    each_chunk("custom", |src| roundtrip(src, &MlirOpt::new()));
}

fn rejected(path: &Path, i: usize) -> Option<Rejected> {
    let list = fs::read_to_string(Fixtures::dir().join("rejected").join(path.with_extension("txt").file_name()?)).ok()?;
    list.lines().find_map(|l| {
        let mut f = l.splitn(3, '\t');
        (f.next()?.parse::<usize>().ok()? == i).then(|| Rejected::try_from(f.next()?).ok()).flatten()
    })
}

#[derive(Clone, Copy, PartialEq, Eq)]
enum Rejected {
    Parse,
    Verify,
}

impl TryFrom<&str> for Rejected {
    type Error = ();
    fn try_from(s: &str) -> Result<Self, ()> {
        match s {
            "parse" => Ok(Self::Parse),
            "verify" => Ok(Self::Verify),
            _ => Err(()),
        }
    }
}

#[test]
fn upstream_sources_roundtrip() {
    let opt = MlirOpt::upstream();
    each_chunk_at("upstream", |path, i, src| match rejected(path, i) {
        Some(_) => Ok(()),
        None => {
            roundtrip(src, &MlirOpt::new())?;
            let m = opt.parse(src).map_err(|e| e.to_string())?;
            opt.verify(&m).map_err(|e| format!("mlir-opt reads it, verify refuses: {e}"))
        }
    });
}

#[test]
fn upstream_rejections_match_mlir_opt() {
    let opt = MlirOpt::upstream();
    let accepted_invalid = AtomicUsize::new(0);
    each_chunk_at("upstream", |path, i, src| match rejected(path, i) {
        Some(Rejected::Parse) => match opt.parse(src) {
            Err(_) => Ok(()),
            Ok(m) if opt.verify(&m).is_err() => Ok(()),
            Ok(_) => Err("mlir-opt does not read it, this crate does".into()),
        },
        Some(Rejected::Verify) => {
            if opt.parse(src).is_ok_and(|m| opt.verify(&m).is_ok()) {
                accepted_invalid.fetch_add(1, Ordering::Relaxed);
            }
            Ok(())
        }
        None => Ok(()),
    });
    println!("read although mlir-opt's verifier rejects them (not verified here): {} chunks", accepted_invalid.into_inner());
}

#[test]
fn generic_form_roundtrips_through_upstream_dialects() {
    let opt = MlirOpt::upstream();
    each_chunk("generic", |src| roundtrip(src, &opt));
}

#[test]
fn custom_form_roundtrips_through_upstream_dialects() {
    let opt = MlirOpt::upstream();
    each_chunk("custom", |src| roundtrip(src, &opt));
}
