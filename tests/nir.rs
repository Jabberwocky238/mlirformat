//! The nir dialect (generated from Mesa's nir_opcodes.py) reads and prints its ops as written

use mlirformat::MlirOpt;
use mlirformat::nir::NirDialect;

#[test]
fn nir_round_trips() {
    let src = r#"func.func @f(%a: f32, %b: f32, %c: vector<3xf32>, %d: vector<3xf32>) -> f32 {
  %0 = nir.fadd %a, %b : (f32, f32) -> f32
  %1 = nir.ffma %a, %b, %0 {exact} : (f32, f32, f32) -> f32
  %2 = nir.fdot3 %c, %d : (vector<3xf32>, vector<3xf32>) -> f32
  %3 = nir.flt %1, %2 : (f32, f32) -> i1
  %4 = nir.b2f32 %3 : (i1) -> f32
  %5 = nir.fsat %4 : (f32) -> f32
  return %5 : f32
}"#;
    let mut opt = MlirOpt::upstream();
    opt.load(NirDialect);
    let m = opt.parse(src).unwrap();
    assert_eq!(opt.show(&m).to_string().trim(), src);
}
