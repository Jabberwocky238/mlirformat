#[path = "../common/mod.rs"]
mod common;
#[path = "math.gen.rs"]
mod math;

#[test]
fn math_matches_mlir_opt() {
    let mut opt = mlirformat::MlirOpt::new();
    opt.load(math::MathDialect);
    common::Fixtures::check_dialect(&opt, "math");
}
