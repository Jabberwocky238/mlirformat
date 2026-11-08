//! `llvm` ops whose result type upstream builds in C++ (`llvm.cmpxchg`'s `!llvm.struct<(T, i1)>`, the field type
//! `custom<InsertExtractValueElementType>` reads): their custom forms parse into ops (not raw text), with that type,
//! and print back to themselves.

use mlirformat::{Item, MlirOpt, Operation};

/// Every op under `ops` (not raw), with its result types as written.
fn walk<'a>(ops: &'a [Operation<'a>], out: &mut Vec<(String, Vec<String>)>) {
    for op in ops {
        assert!(op.raw.is_none(), "`{}` stayed raw text", op.name);
        out.push((op.name.to_string(), op.ty.results.iter().map(|t| t.to_string()).collect()));
        for b in op.regions.iter().flat_map(|r| &r.blocks) {
            walk(&b.ops, out);
        }
    }
}

fn read(src: &str) -> Vec<(String, Vec<String>)> {
    let opt = MlirOpt::upstream();
    let m = opt.parse(src).unwrap_or_else(|e| panic!("{src}\n{e}"));
    let printed = opt.show(&m).to_string();
    assert_eq!(printed.trim(), src.trim(), "printed back");
    let mut out = Vec::new();
    for item in &m.items {
        if let Item::Op(op) = item {
            walk(core::slice::from_ref(op), &mut out);
        }
    }
    out
}

fn result_of(ops: &[(String, Vec<String>)], name: &str) -> Vec<String> {
    ops.iter().filter(|(n, _)| n == name).map(|(_, r)| r.join(", ")).collect()
}

#[test]
fn cmpxchg_is_a_pair_of_the_value_and_i1() {
    let ops = read("func.func @f(%arg0: !llvm.ptr<1>, %arg1: i32, %arg2: i32) {\n  %0 = llvm.cmpxchg %arg0, %arg1, %arg2 monotonic monotonic : !llvm.ptr<1>, i32\n  %1 = llvm.cmpxchg weak %arg0, %arg1, %arg2 acq_rel monotonic : !llvm.ptr<1>, i32\n  return\n}");
    assert_eq!(result_of(&ops, "llvm.cmpxchg"), ["!llvm.struct<(i32, i1)>", "!llvm.struct<(i32, i1)>"]);
}

#[test]
fn extractvalue_is_the_field_and_insertvalue_takes_it() {
    let ops = read("func.func @f(%arg0: !llvm.struct<(i32, array<2 x f32>)>, %arg1: f32) {\n  %0 = llvm.extractvalue %arg0[0] : !llvm.struct<(i32, array<2 x f32>)>\n  %1 = llvm.extractvalue %arg0[1, 1] : !llvm.struct<(i32, array<2 x f32>)>\n  %2 = llvm.insertvalue %arg1, %arg0[1, 0] : !llvm.struct<(i32, array<2 x f32>)>\n  return\n}");
    assert_eq!(result_of(&ops, "llvm.extractvalue"), ["i32", "f32"]);
    assert_eq!(result_of(&ops, "llvm.insertvalue"), ["!llvm.struct<(i32, array<2 x f32>)>"]);
}
