#[path = "../common/mod.rs"]
mod common;
#[path = "cf.gen.rs"]
mod cf;

#[test]
fn cf_matches_mlir_opt() {
    let mut opt = mlirformat::MlirOpt::new();
    opt.load(cf::CfDialect);
    common::Fixtures::check_dialect(&opt, "cf");
}
