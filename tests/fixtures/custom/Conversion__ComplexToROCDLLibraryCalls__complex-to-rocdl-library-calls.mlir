module {
  func.func @abs_caller(%arg0: complex<f32>, %arg1: complex<f64>) -> (f32, f64) {
    %0 = complex.abs %arg0 : complex<f32>
    %1 = complex.abs %arg1 : complex<f64>
    return %0, %1 : f32, f64
  }
  func.func @cos_caller(%arg0: complex<f32>, %arg1: complex<f64>) -> (complex<f32>, complex<f64>) {
    %0 = complex.cos %arg0 : complex<f32>
    %1 = complex.cos %arg1 : complex<f64>
    return %0, %1 : complex<f32>, complex<f64>
  }
  func.func @exp_caller(%arg0: complex<f32>, %arg1: complex<f64>) -> (complex<f32>, complex<f64>) {
    %0 = complex.exp %arg0 : complex<f32>
    %1 = complex.exp %arg1 : complex<f64>
    return %0, %1 : complex<f32>, complex<f64>
  }
  func.func @log_caller(%arg0: complex<f32>, %arg1: complex<f64>) -> (complex<f32>, complex<f64>) {
    %0 = complex.log %arg0 : complex<f32>
    %1 = complex.log %arg1 : complex<f64>
    return %0, %1 : complex<f32>, complex<f64>
  }
  func.func @pow_caller(%arg0: complex<f32>, %arg1: complex<f32>) -> complex<f32> {
    %0 = complex.pow %arg0, %arg1 : complex<f32>
    return %0 : complex<f32>
  }
  func.func @powi_caller(%arg0: complex<f32>, %arg1: i32) -> complex<f32> {
    %0 = complex.powi %arg0, %arg1 : complex<f32>, i32
    return %0 : complex<f32>
  }
  func.func @sin_caller(%arg0: complex<f32>, %arg1: complex<f64>) -> (complex<f32>, complex<f64>) {
    %0 = complex.sin %arg0 : complex<f32>
    %1 = complex.sin %arg1 : complex<f64>
    return %0, %1 : complex<f32>, complex<f64>
  }
  func.func @sqrt_caller(%arg0: complex<f32>, %arg1: complex<f64>) -> (complex<f32>, complex<f64>) {
    %0 = complex.sqrt %arg0 : complex<f32>
    %1 = complex.sqrt %arg1 : complex<f64>
    return %0, %1 : complex<f32>, complex<f64>
  }
  func.func @tan_caller(%arg0: complex<f32>, %arg1: complex<f64>) -> (complex<f32>, complex<f64>) {
    %0 = complex.tan %arg0 : complex<f32>
    %1 = complex.tan %arg1 : complex<f64>
    return %0, %1 : complex<f32>, complex<f64>
  }
  func.func @tanh_caller(%arg0: complex<f32>, %arg1: complex<f64>) -> (complex<f32>, complex<f64>) {
    %0 = complex.tanh %arg0 : complex<f32>
    %1 = complex.tanh %arg1 : complex<f64>
    return %0, %1 : complex<f32>, complex<f64>
  }
}

