//! Typed ops against the paired `mlir-opt` fixtures: every op of the generic output that the
//! upstream op table knows prints exactly as `mlir-opt` prints its custom form, and parses back
//! to the same op.

mod common;

use std::collections::BTreeMap;

use common::{Fixtures, Verdict};
use mlirformat::*;

#[test]
fn upstream_ops_match_mlir_opt() {
    let opt = MlirOpt::upstream();
    let (mut hits, mut declined, mut failures) = (BTreeMap::<String, usize>::new(), Vec::new(), Vec::new());
    let verdicts = Fixtures::map(|path, op, visible, custom, aliases| Some((path.display().to_string(), op.name.to_string(), op.to_string(), Fixtures::judge(&opt, op, visible, custom, aliases))));
    for (path, name, text, verdict) in verdicts {
        match verdict {
            Verdict::Unknown => {}
            Verdict::Generic => declined.push(text),
            Verdict::Matched | Verdict::Reparsed => *hits.entry(name).or_default() += 1,
            Verdict::Mismatch(text) => failures.push(format!("{path}: `{text}` not in mlir-opt custom output")),
            Verdict::Broken(why) => failures.push(format!("{path}: {why}")),
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
