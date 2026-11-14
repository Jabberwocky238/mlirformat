#[path = "../common/mod.rs"]
mod common;
#[path = "index.gen.rs"]
mod index;

#[test]
fn index_matches_mlir_opt() {
    let mut opt = mlirformat::MlirOpt::new();
    opt.load(index::IndexDialect);
    common::Fixtures::check_dialect(&opt, "index");
}
