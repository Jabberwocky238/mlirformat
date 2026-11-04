module {
  func.func @complex_div(%arg0: complex<f32>, %arg1: complex<f32>) -> complex<f32> {
    %0 = complex.div %arg0, %arg1 : complex<f32>
    return %0 : complex<f32>
  }
  func.func @complex_div_with_fmf(%arg0: complex<f32>, %arg1: complex<f32>) -> complex<f32> {
    %0 = complex.div %arg0, %arg1 fastmath<nsz,arcp> : complex<f32>
    return %0 : complex<f32>
  }
}

