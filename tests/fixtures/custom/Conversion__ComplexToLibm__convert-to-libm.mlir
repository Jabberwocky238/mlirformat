module {
  func.func @cpow_caller(%arg0: complex<f32>, %arg1: complex<f64>) -> (complex<f32>, complex<f64>) {
    %0 = complex.pow %arg0, %arg0 : complex<f32>
    %1 = complex.pow %arg1, %arg1 : complex<f64>
    return %0, %1 : complex<f32>, complex<f64>
  }
  func.func @csqrt_caller(%arg0: complex<f32>, %arg1: complex<f64>) -> (complex<f32>, complex<f64>) {
    %0 = complex.sqrt %arg0 : complex<f32>
    %1 = complex.sqrt %arg1 : complex<f64>
    return %0, %1 : complex<f32>, complex<f64>
  }
  func.func @ctanh_caller(%arg0: complex<f32>, %arg1: complex<f64>) -> (complex<f32>, complex<f64>) {
    %0 = complex.tanh %arg0 : complex<f32>
    %1 = complex.tanh %arg1 : complex<f64>
    return %0, %1 : complex<f32>, complex<f64>
  }
  func.func @ccos_caller(%arg0: complex<f32>, %arg1: complex<f64>) -> (complex<f32>, complex<f64>) {
    %0 = complex.cos %arg0 : complex<f32>
    %1 = complex.cos %arg1 : complex<f64>
    return %0, %1 : complex<f32>, complex<f64>
  }
  func.func @csin_caller(%arg0: complex<f32>, %arg1: complex<f64>) -> (complex<f32>, complex<f64>) {
    %0 = complex.sin %arg0 : complex<f32>
    %1 = complex.sin %arg1 : complex<f64>
    return %0, %1 : complex<f32>, complex<f64>
  }
  func.func @conj_caller(%arg0: complex<f32>, %arg1: complex<f64>) -> (complex<f32>, complex<f64>) {
    %0 = complex.conj %arg0 : complex<f32>
    %1 = complex.conj %arg1 : complex<f64>
    return %0, %1 : complex<f32>, complex<f64>
  }
  func.func @cabs_caller(%arg0: complex<f32>, %arg1: complex<f64>) -> (f32, f64) {
    %0 = complex.abs %arg0 : complex<f32>
    %1 = complex.abs %arg1 : complex<f64>
    return %0, %1 : f32, f64
  }
  func.func @carg_caller(%arg0: complex<f32>, %arg1: complex<f64>) -> (f32, f64) {
    %0 = complex.angle %arg0 : complex<f32>
    %1 = complex.angle %arg1 : complex<f64>
    return %0, %1 : f32, f64
  }
  func.func @clog_caller(%arg0: complex<f32>, %arg1: complex<f64>) -> (complex<f32>, complex<f64>) {
    %0 = complex.log %arg0 : complex<f32>
    %1 = complex.log %arg1 : complex<f64>
    return %0, %1 : complex<f32>, complex<f64>
  }
  func.func @ctan_caller(%arg0: complex<f32>, %arg1: complex<f64>) -> (complex<f32>, complex<f64>) {
    %0 = complex.tan %arg0 : complex<f32>
    %1 = complex.tan %arg1 : complex<f64>
    return %0, %1 : complex<f32>, complex<f64>
  }
}

