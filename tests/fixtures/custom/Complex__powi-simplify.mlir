module {
  func.func @pow3(%arg0: complex<f32>) -> complex<f32> {
    %c3_i32 = arith.constant 3 : i32
    %0 = complex.powi %arg0, %c3_i32 : complex<f32>, i32
    return %0 : complex<f32>
  }
  func.func @pow9(%arg0: complex<f32>) -> complex<f32> {
    %c9_i32 = arith.constant 9 : i32
    %0 = complex.powi %arg0, %c9_i32 : complex<f32>, i32
    return %0 : complex<f32>
  }
}

