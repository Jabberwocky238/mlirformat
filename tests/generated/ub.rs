#[path = "../common/mod.rs"]
mod common;
#[path = "ub.gen.rs"]
mod ub;

#[test]
fn ub_matches_mlir_opt() {
    let mut opt = mlirformat::MlirOpt::new();
    opt.load(ub::UbDialect);
    common::Fixtures::check_dialect(&opt, "ub");
}
