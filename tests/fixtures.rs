//! Fixtures copied from llvm-project 22.1.8 (`mlir/test`), plus `mlir-opt` 22.1.8 output for
//! each file in custom (default) and generic (`--mlir-print-op-generic`) form.

use std::fs;
use std::path::Path;

use mlirformat::*;

/// Runs `check` on every `// -----` chunk of every file in `dir`, collecting failures.
fn each_chunk(dir: &str, mut check: impl FnMut(&str) -> Result<(), String>) {
    let dir = Path::new(env!("CARGO_MANIFEST_DIR")).join("tests/fixtures").join(dir);
    let mut files: Vec<_> = fs::read_dir(&dir).unwrap().map(|e| e.unwrap().path()).collect();
    files.sort();
    let (mut total, mut failures) = (0, Vec::new());
    for path in &files {
        let src = fs::read_to_string(path).unwrap();
        for (i, chunk) in src.split("// -----").enumerate() {
            total += 1;
            if let Err(e) = check(chunk.trim_start_matches('-')) {
                failures.push(format!("{}#{i}: {e}", path.file_name().unwrap().to_string_lossy()));
            }
        }
    }
    assert!(failures.is_empty(), "{}/{total} chunks failed:\n{}", failures.len(), failures.join("\n"));
}

/// print → parse → equal, and JSON → equal.
fn roundtrip(m: &Module<'_>, dialects: Dialects<'_>) -> Result<(), String> {
    let text = m.display(dialects).to_string();
    let again = Module::parse(&text, dialects).map_err(|e| format!("reparse: {e}\n{text}"))?;
    (again == *m).then_some(()).ok_or_else(|| format!("print/parse mismatch:\n{text}"))?;
    let json = serde_json::to_string(m).unwrap();
    let back: Module<'_> = serde_json::from_str(&json).map_err(|e| e.to_string())?;
    (back == *m).then_some(()).ok_or_else(|| "json mismatch".into())
}

fn custom_ops(ops: &[Operation<'_>]) -> usize {
    ops.iter()
        .map(|op| match &op.body {
            OpBody::Custom(_) => 1,
            OpBody::Generic(g) => g.regions.iter().flat_map(|r| &r.blocks).map(|b| custom_ops(&b.ops)).sum(),
        })
        .sum()
}

fn top_ops<'x, 'a>(m: &'x Module<'a>) -> Vec<Operation<'a>> {
    m.items.iter().filter_map(|i| if let Item::Op(op) = i { Some(op.clone()) } else { None }).collect()
}

#[test]
fn generic_form_is_fully_structured() {
    each_chunk("generic", |src| {
        let m = Module::try_from(src).map_err(|e| e.to_string())?;
        match custom_ops(&top_ops(&m)) {
            0 => roundtrip(&m, &[]),
            n => Err(format!("{n} ops left unstructured")),
        }
    });
}

#[test]
fn custom_form_roundtrips() {
    each_chunk("custom", |src| roundtrip(&Module::try_from(src).map_err(|e| e.to_string())?, &[]));
}

#[test]
fn upstream_sources_roundtrip() {
    each_chunk("upstream", |src| roundtrip(&Module::try_from(src).map_err(|e| e.to_string())?, &[]));
}
