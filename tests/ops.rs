//! Typed ops against the paired `mlir-opt` fixtures: every op of the generic output that the
//! upstream op table knows prints exactly as `mlir-opt` prints its custom form, and parses back
//! to the same op.

use std::fs;
use std::path::Path;

use mlirformat::*;

/// Replaces SSA names (`%arg0`, `%c1_i64`, ...), block names and alias numbers (`#map3`) by `_`,
/// so the two outputs are comparable.
fn anon(s: &str) -> String {
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

/// Visits ops with whether they are visible in custom form: `mlir-opt` elides the bodies of
/// linalg named ops there.
fn walk<'x, 'a>(ops: &'x [Operation<'a>], visible: bool, f: &mut impl FnMut(&'x Operation<'a>, bool)) {
    for op in ops {
        f(op, visible);
        let inner = visible && !op.name.starts_with("linalg.");
        op.regions.iter().flat_map(|r| &r.blocks).for_each(|b| walk(&b.ops, inner, f));
    }
}

#[test]
fn upstream_ops_match_mlir_opt() {
    let opt = MlirOpt::upstream();
    let dir = Path::new(env!("CARGO_MANIFEST_DIR")).join("tests/fixtures");
    let (mut hits, mut declined, mut failures) = (std::collections::BTreeMap::<String, usize>::new(), Vec::new(), Vec::new());
    for entry in fs::read_dir(dir.join("generic")).unwrap() {
        let path = entry.unwrap().path();
        let src = fs::read_to_string(&path).unwrap();
        let custom = anon(&fs::read_to_string(dir.join("custom").join(path.file_name().unwrap())).unwrap());
        for chunk in src.split("// -----") {
            let m = Module::try_from(chunk.trim_start_matches('-')).unwrap();
            let ops: Vec<_> = m.items.into_iter().filter_map(|i| if let Item::Op(op) = i { Some(op) } else { None }).collect();
            walk(&ops, true, &mut |op, visible| {
                if opt.template(&op.name).is_none() {
                    return;
                }
                let text = opt.show(op).to_string();
                if text.starts_with(&format!("{} = \"", op.results.iter().map(|r| format!("%{}", r.name)).collect::<Vec<_>>().join(", "))) || text.starts_with('"') {
                    declined.push(text);
                    return;
                }
                let one_line = !text.contains('\n');
                // Inside its own dialect's regions an op prints without its prefix (`return`).
                let (full, short) = (&*op.name, op.name.split_once('.').map_or(&*op.name, |(_, n)| n));
                let long = if text.contains(full) { text.clone() } else { text.replacen(short, full, 1) };
                let brief = long.replacen(full, short, 1);
                if visible && one_line && !custom.contains(&anon(&long)) && !custom.contains(&anon(&brief)) {
                    failures.push(format!("{}: `{text}` not in mlir-opt custom output", path.display()));
                }
                match opt.parse_op(&text) {
                    Ok(back) if back == *op => *hits.entry(op.name.to_string()).or_default() += 1,
                    Ok(back) => failures.push(format!("{}: reparse mismatch: {text}\n{back:?}\n{op:?}", path.display())),
                    Err(e) => failures.push(format!("{}: reparse: {e}: {text}", path.display())),
                }
            });
        }
    }
    println!("checked: {hits:?}\n{} declined:\n{}", declined.len(), declined.join("\n"));
    assert!(failures.is_empty(), "{} failures:\n{}", failures.len(), failures.iter().take(40).cloned().collect::<Vec<_>>().join("\n"));
    assert!(hits.len() > 20);
}

/// A user-defined op: a struct and `#[mlir::op]` are all it takes.
#[mlir::op("arith.maxsi", format = "$lhs `,` $rhs attr-dict `:` type($result)", results(result))]
pub struct ArithMax<'a> {
    #[slot(result)]
    pub lhs: Value<'a>,
    #[slot(result)]
    pub rhs: Value<'a>,
    #[dtype]
    pub result: Type<'a>,
}

#[test]
fn user_op_converts_both_ways() {
    let max = ArithMax::try_from("arith.maxsi %a, %b {tag} : i32").unwrap();
    assert_eq!(max.to_string(), "arith.maxsi %a, %b {tag} : i32");
    let op = Operation::try_from(&max).unwrap();
    assert_eq!(op.to_string(), r#""arith.maxsi"(%a, %b) {tag} : (i32, i32) -> i32"#);
    assert_eq!(ArithMax::try_from(&op).unwrap(), max);

    let mut opt = MlirOpt::new();
    opt.inject(ArithMax::template());
    let m = opt.parse(r#"%0 = "arith.maxsi"(%a, %b) : (i32, i32) -> i32"#).unwrap();
    assert_eq!(opt.show(&m).to_string(), "%0 = arith.maxsi %a, %b : i32\n");
    assert_eq!(opt.eject("arith.maxsi").map(|t| t.name), Some("arith.maxsi"));
    assert_eq!(opt.show(&m).to_string(), "%0 = \"arith.maxsi\"(%a, %b) : (i32, i32) -> i32\n");
}

#[test]
fn dialects_register_and_unregister() {
    let mut opt = MlirOpt::upstream();
    let src = "%0 = arith.addi %a, %b overflow<nsw> : i64";
    let op = &opt.parse_op(src).unwrap();
    assert_eq!(op.to_string(), r#"%0 = "arith.addi"(%a, %b) <{overflowFlags = #arith.overflow<nsw>}> : (i64, i64) -> i64"#);
    assert!(matches!(arith::Arith::try_from(op), Ok(arith::Arith::AddI(_))));
    assert!(opt.unregister("arith"));
    assert!(opt.parse_op(src).unwrap().raw.is_some());
    assert!(opt.namespaces().all(|ns| ns != "arith"));
}
