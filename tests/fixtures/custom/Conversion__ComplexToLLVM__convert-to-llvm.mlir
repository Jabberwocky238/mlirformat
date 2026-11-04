module {
  func.func @complex_create(%arg0: f32, %arg1: f32) -> complex<f32> {
    %0 = complex.create %arg0, %arg1 : complex<f32>
    return %0 : complex<f32>
  }
  func.func @complex_constant() -> complex<f64> {
    %cst = complex.constant [1.000000e+00, 2.000000e+00] : complex<f64>
    return %cst : complex<f64>
  }
  func.func @complex_extract(%arg0: complex<f32>) {
    %0 = complex.re %arg0 : complex<f32>
    %1 = complex.im %arg0 : complex<f32>
    return
  }
  func.func @complex_addition() {
    %cst = arith.constant 1.200000e+00 : f64
    %cst_0 = arith.constant 3.400000e+00 : f64
    %0 = complex.create %cst, %cst_0 : complex<f64>
    %cst_1 = arith.constant 5.600000e+00 : f64
    %cst_2 = arith.constant 7.7999999999999998 : f64
    %1 = complex.create %cst_1, %cst_2 : complex<f64>
    %2 = complex.add %0, %1 : complex<f64>
    return
  }
  func.func @complex_substraction() {
    %cst = arith.constant 1.200000e+00 : f64
    %cst_0 = arith.constant 3.400000e+00 : f64
    %0 = complex.create %cst, %cst_0 : complex<f64>
    %cst_1 = arith.constant 5.600000e+00 : f64
    %cst_2 = arith.constant 7.7999999999999998 : f64
    %1 = complex.create %cst_1, %cst_2 : complex<f64>
    %2 = complex.sub %0, %1 : complex<f64>
    return
  }
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
  func.func @complex_addition_with_fmf() {
    %cst = arith.constant 1.200000e+00 : f64
    %cst_0 = arith.constant 3.400000e+00 : f64
    %0 = complex.create %cst, %cst_0 : complex<f64>
    %cst_1 = arith.constant 5.600000e+00 : f64
    %cst_2 = arith.constant 7.7999999999999998 : f64
    %1 = complex.create %cst_1, %cst_2 : complex<f64>
    %2 = complex.add %0, %1 fastmath<reassoc> : complex<f64>
    return
  }
  func.func @complex_substraction_with_fmf() {
    %cst = arith.constant 1.200000e+00 : f64
    %cst_0 = arith.constant 3.400000e+00 : f64
    %0 = complex.create %cst, %cst_0 : complex<f64>
    %cst_1 = arith.constant 5.600000e+00 : f64
    %cst_2 = arith.constant 7.7999999999999998 : f64
    %1 = complex.create %cst_1, %cst_2 : complex<f64>
    %2 = complex.sub %0, %1 fastmath<nnan,ninf> : complex<f64>
    return
  }
  func.func @complex_div_with_fmf(%arg0: complex<f32>, %arg1: complex<f32>) -> complex<f32> {
    %0 = complex.div %arg0, %arg1 fastmath<nsz,arcp> : complex<f32>
    return %0 : complex<f32>
  }
  func.func @complex_mul_with_fmf(%arg0: complex<f32>, %arg1: complex<f32>) -> complex<f32> {
    %0 = complex.mul %arg0, %arg1 fastmath<contract,afn> : complex<f32>
    return %0 : complex<f32>
  }
  func.func @complex_abs_with_fmf(%arg0: complex<f32>) -> f32 {
    %0 = complex.abs %arg0 fastmath<contract> : complex<f32>
    return %0 : f32
  }
}

