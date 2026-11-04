module {
  func.func @create_complex(%arg0: f32, %arg1: f32) -> complex<f32> {
    %0 = complex.create %arg0, %arg1 : complex<f32>
    return %0 : complex<f32>
  }
}

// -----
module {
  func.func @real_number(%arg0: complex<f32>) -> f32 {
    %0 = complex.re %arg0 : complex<f32>
    return %0 : f32
  }
}

// -----
module {
  func.func @imaginary_number(%arg0: complex<f32>) -> f32 {
    %0 = complex.im %arg0 : complex<f32>
    return %0 : f32
  }
}

// -----
module {
  func.func @complex_const() -> complex<f32> {
    %cst = complex.constant [0x7FC00000 : f32, 0.000000e+00 : f32] : complex<f32>
    return %cst : complex<f32>
  }
}

