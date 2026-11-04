module {
  func.func @complex_div(%arg0: complex<f32>, %arg1: complex<f32>) -> complex<f32> {
    %0 = complex.div %arg0, %arg1 : complex<f32>
    return %0 : complex<f32>
  }
  func.func @complex_mul(%arg0: complex<f32>, %arg1: complex<f32>) -> complex<f32> {
    %0 = complex.mul %arg0, %arg1 : complex<f32>
    return %0 : complex<f32>
  }
  func.func @complex_abs(%arg0: complex<f32>) -> f32 {
    %0 = complex.abs %arg0 : complex<f32>
    return %0 : f32
  }
}

