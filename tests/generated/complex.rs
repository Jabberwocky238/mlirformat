#[path = "../common/mod.rs"]
mod common;
#[path = "complex.gen.rs"]
mod complex;

#[test]
fn complex_matches_mlir_opt() {
    let mut opt = mlirformat::MlirOpt::new();
    opt.load(complex::ComplexDialect);
    common::Fixtures::check_dialect(&opt, "complex");
}
