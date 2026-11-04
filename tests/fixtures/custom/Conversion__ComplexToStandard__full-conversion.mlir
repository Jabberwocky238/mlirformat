module {
  func.func @complex_abs(%arg0: complex<f32>) -> f32 {
    %0 = complex.abs %arg0 : complex<f32>
    return %0 : f32
  }
  func.func @complex_eq(%arg0: complex<f32>, %arg1: complex<f32>) -> i1 {
    %0 = complex.eq %arg0, %arg1 : complex<f32>
    return %0 : i1
  }
  func.func @complex_neq(%arg0: complex<f32>, %arg1: complex<f32>) -> i1 {
    %0 = complex.neq %arg0, %arg1 : complex<f32>
    return %0 : i1
  }
}

