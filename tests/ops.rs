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
    let verdicts = Fixtures::map(|path, op, parent, visible, custom, aliases| Some((path.display().to_string(), op.name.to_string(), op.to_string(), Fixtures::judge(&opt, op, parent, visible, custom, aliases))));
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
    assert!(failures.is_empty(), "{} failures:\n{}", failures.len(), failures.join("\n"));
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

/// An optional operand whose value and type sit in two optional groups (as `mlirformat tblgen`
/// writes `Optional<…>` / `Variadic<…>` operands of an ODS format such as CalVX's `vec.compact`).
#[mlir::op("test.compact", format = "$input (`,` $mask^)? attr-dict `:` type($input) (`,` type($mask)^)? `->` type($result)", results(result))]
pub struct Compact<'a> {
    #[slot(input_ty)]
    pub input: Value<'a>,
    #[slot(mask_ty)]
    pub mask: Vec<Value<'a>>,
    #[dtype]
    pub input_ty: Type<'a>,
    #[dtype]
    pub mask_ty: Vec<Type<'a>>,
    #[dtype]
    pub result: Type<'a>,
}

#[test]
fn absent_optional_groups_sharing_an_operand_parse() {
    for text in ["test.compact %k : tensor<16xi32> -> tensor<16xi32>", "test.compact %k, %m : tensor<16xi32>, tensor<16xi1> -> tensor<16xi32>"] {
        let op = Compact::try_from(text).unwrap_or_else(|e| panic!("{text}: {e}"));
        assert_eq!(op.to_string(), text);
        assert_eq!(Compact::try_from(&Operation::try_from(&op).unwrap()).unwrap(), op);
    }
}

#[test]
fn dialects_register_and_unregister() {
    let mut opt = MlirOpt::upstream();
    let src = "%0 = arith.addi %a, %b overflow<nsw> : i64";
    let op = &opt.parse_op(src).unwrap();
    assert_eq!(op.to_string(), r#"%0 = "arith.addi"(%a, %b) <{overflowFlags = #arith.overflow<nsw>}> : (i64, i64) -> i64"#);
    assert!(arith::AddI::try_from(op).is_ok());
    assert!(opt.unregister("arith"));
    assert!(opt.parse_op(src).unwrap().raw.is_some());
    assert!(opt.namespaces().all(|ns| ns != "arith"));
}

/// Typed ops through any self-describing format and back: `#[mlir::op]`'s `Deserialize` goes
/// through `Content`, enums (`Type`, `Attribute`, a predicate) and absent defaults included.
#[test]
fn ops_round_trip_through_serde() {
    macro_rules! round_trip {
        ($($ty:ty: $src:literal),* $(,)?) => {$({
            let op = <$ty>::try_from($src).unwrap();
            let json = serde_json::to_string(&op).unwrap();
            assert_eq!(serde_json::from_str::<$ty>(&json).unwrap(), op, "{json}");
            assert_eq!(Content::of(&op).unwrap().to::<$ty>().unwrap(), op, "{}", $src);
        })*};
    }
    round_trip! {
        arith::CmpI: "arith.cmpi slt, %a, %b : i32",
        arith::Constant: "arith.constant {tag} dense<[1, 2]> : tensor<2xi32>",
        arith::TruncI: "arith.trunci %a overflow<nsw> : i64 to i32 loc(\"x.mlir\":1:2)",
        arith::TruncI: "arith.trunci %a : i64 to i32",
        func::Call: "func.call @f(%a, %b) : (i32, f32) -> (i1, index)",
        memref::SubViewOp: "memref.subview %m[%i, 4] [2, 2] [1, 1] : memref<8x8xf32> to memref<2x2xf32, strided<[8, 1], offset: ?>>",
        ArithMax: "arith.maxsi %a, %b {tag, n = 3 : i64} : vector<4xi8>",
    }
}
