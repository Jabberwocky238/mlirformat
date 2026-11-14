#[path = "../common/mod.rs"]
mod common;
#[path = "arith.gen.rs"]
mod arith;

#[test]
fn arith_matches_mlir_opt() {
    let mut opt = mlirformat::MlirOpt::new();
    opt.load(arith::ArithDialect);
    common::Fixtures::check_dialect(&opt, "arith");
}
