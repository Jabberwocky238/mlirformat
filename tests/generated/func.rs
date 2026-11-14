#[path = "../common/mod.rs"]
mod common;
#[path = "func.gen.rs"]
mod func;

#[test]
fn func_matches_mlir_opt() {
    let mut opt = mlirformat::MlirOpt::new();
    opt.load(func::FuncDialect);
    common::Fixtures::check_dialect(&opt, "func");
}
