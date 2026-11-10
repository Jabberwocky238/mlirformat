module {
}

// -----
module {
}

// -----
module {
  func.func @tanh_f32(%arg0: f32) {
    %0 = math.tanh %arg0 : f32
    vector.print %0 : f32
    return
  }
  func.func @tanh_4xf32(%arg0: vector<4xf32>) {
    %0 = math.tanh %arg0 : vector<4xf32>
    vector.print %0 : vector<4xf32>
    return
  }
  func.func @tanh_8xf32(%arg0: vector<8xf32>) {
    %0 = math.tanh %arg0 : vector<8xf32>
    vector.print %0 : vector<8xf32>
    return
  }
  func.func @tanh() {
    %cst = arith.constant 1.250000e+00 : f32
    call @tanh_f32(%cst) : (f32) -> ()
    %cst_0 = arith.constant dense<[2.500000e-01, 7.500000e-01, 1.000000e+00, 1.250000e+00]> : vector<4xf32>
    call @tanh_4xf32(%cst_0) : (vector<4xf32>) -> ()
    %cst_1 = arith.constant dense<[1.000000e-01, 2.000000e-01, 3.000000e-01, 4.000000e-01, 5.000000e-01, 6.000000e-01, 0.699999988, 8.000000e-01]> : vector<8xf32>
    call @tanh_8xf32(%cst_1) : (vector<8xf32>) -> ()
    %cst_2 = arith.constant 0x7FC00000 : f32
    call @tanh_f32(%cst_2) : (f32) -> ()
    return
  }
}

// -----
module {
}

// -----
module {
  func.func @log_f32(%arg0: f32) {
    %0 = math.log %arg0 : f32
    vector.print %0 : f32
    return
  }
  func.func @log_4xf32(%arg0: vector<4xf32>) {
    %0 = math.log %arg0 : vector<4xf32>
    vector.print %0 : vector<4xf32>
    return
  }
  func.func @log_8xf32(%arg0: vector<8xf32>) {
    %0 = math.log %arg0 : vector<8xf32>
    vector.print %0 : vector<8xf32>
    return
  }
  func.func @log() {
    %cst = arith.constant 14.1122332 : f32
    call @log_f32(%cst) : (f32) -> ()
    %cst_0 = arith.constant dense<[2.500000e-01, 7.500000e-01, 1.000000e+00, 1.250000e+00]> : vector<4xf32>
    call @log_4xf32(%cst_0) : (vector<4xf32>) -> ()
    %cst_1 = arith.constant dense<[1.000000e-01, 2.000000e-01, 3.000000e-01, 4.000000e-01, 5.000000e-01, 6.000000e-01, 0.699999988, 8.000000e-01]> : vector<8xf32>
    call @log_8xf32(%cst_1) : (vector<8xf32>) -> ()
    %cst_2 = arith.constant 0.000000e+00 : f32
    call @log_f32(%cst_2) : (f32) -> ()
    %cst_3 = arith.constant 0x7FC00000 : f32
    call @log_f32(%cst_3) : (f32) -> ()
    %cst_4 = arith.constant 0x7F800000 : f32
    call @log_f32(%cst_4) : (f32) -> ()
    %cst_5 = arith.constant dense<[0.000000e+00, -1.000000e+00, 0x7F800000, 2.000000e+00]> : vector<4xf32>
    call @log_4xf32(%cst_5) : (vector<4xf32>) -> ()
    return
  }
  func.func @log2_f32(%arg0: f32) {
    %0 = math.log2 %arg0 : f32
    vector.print %0 : f32
    return
  }
  func.func @log2_4xf32(%arg0: vector<4xf32>) {
    %0 = math.log2 %arg0 : vector<4xf32>
    vector.print %0 : vector<4xf32>
    return
  }
  func.func @log2_8xf32(%arg0: vector<8xf32>) {
    %0 = math.log2 %arg0 : vector<8xf32>
    vector.print %0 : vector<8xf32>
    return
  }
  func.func @log2() {
    %cst = arith.constant 14.1122332 : f32
    call @log2_f32(%cst) : (f32) -> ()
    %cst_0 = arith.constant dense<[2.500000e-01, 7.500000e-01, 1.000000e+00, 1.250000e+00]> : vector<4xf32>
    call @log2_4xf32(%cst_0) : (vector<4xf32>) -> ()
    %cst_1 = arith.constant dense<[1.000000e-01, 2.000000e-01, 3.000000e-01, 4.000000e-01, 5.000000e-01, 6.000000e-01, 0.699999988, 8.000000e-01]> : vector<8xf32>
    call @log2_8xf32(%cst_1) : (vector<8xf32>) -> ()
    %cst_2 = arith.constant 0.000000e+00 : f32
    call @log2_f32(%cst_2) : (f32) -> ()
    %cst_3 = arith.constant -1.000000e+00 : f32
    call @log2_f32(%cst_3) : (f32) -> ()
    %cst_4 = arith.constant 0x7F800000 : f32
    call @log2_f32(%cst_4) : (f32) -> ()
    %cst_5 = arith.constant dense<[0.000000e+00, -1.000000e+00, 0x7F800000, 3.000000e+00]> : vector<4xf32>
    call @log2_4xf32(%cst_5) : (vector<4xf32>) -> ()
    return
  }
  func.func @log1p_f32(%arg0: f32) {
    %0 = math.log1p %arg0 : f32
    vector.print %0 : f32
    return
  }
  func.func @log1p_4xf32(%arg0: vector<4xf32>) {
    %0 = math.log1p %arg0 : vector<4xf32>
    vector.print %0 : vector<4xf32>
    return
  }
  func.func @log1p_8xf32(%arg0: vector<8xf32>) {
    %0 = math.log1p %arg0 : vector<8xf32>
    vector.print %0 : vector<8xf32>
    return
  }
  func.func @log1p() {
    %cst = arith.constant 0.00999999977 : f32
    call @log1p_f32(%cst) : (f32) -> ()
    %cst_0 = arith.constant dense<[-9.900000e-01, -5.000000e-01, 0.000000e+00, 3.000000e+00]> : vector<4xf32>
    call @log1p_4xf32(%cst_0) : (vector<4xf32>) -> ()
    %cst_1 = arith.constant dense<[1.000000e-01, 2.000000e-01, 3.000000e-01, 4.000000e-01, 5.000000e-01, 6.000000e-01, 0.699999988, 8.000000e-01]> : vector<8xf32>
    call @log1p_8xf32(%cst_1) : (vector<8xf32>) -> ()
    %cst_2 = arith.constant -1.000000e+00 : f32
    call @log1p_f32(%cst_2) : (f32) -> ()
    %cst_3 = arith.constant -2.000000e+00 : f32
    call @log1p_f32(%cst_3) : (f32) -> ()
    %cst_4 = arith.constant 0x7F800000 : f32
    call @log1p_f32(%cst_4) : (f32) -> ()
    %cst_5 = arith.constant dense<[-1.000000e+00, -1.100000e+00, 0x7F800000, 9.99999974E-6]> : vector<4xf32>
    call @log1p_4xf32(%cst_5) : (vector<4xf32>) -> ()
    return
  }
}

// -----
module {
}

// -----
module {
  func.func @erf_f32(%arg0: f32) {
    %0 = math.erf %arg0 : f32
    vector.print %0 : f32
    return
  }
  func.func @erf_4xf32(%arg0: vector<4xf32>) {
    %0 = math.erf %arg0 : vector<4xf32>
    vector.print %0 : vector<4xf32>
    return
  }
  func.func @erf() {
    %cst = arith.constant -2.43186398E-4 : f32
    call @erf_f32(%cst) : (f32) -> ()
    %cst_0 = arith.constant 0.799989998 : f32
    call @erf_f32(%cst_0) : (f32) -> ()
    %cst_1 = arith.constant 8.000000e-01 : f32
    call @erf_f32(%cst_1) : (f32) -> ()
    %cst_2 = arith.constant 1.999990e+00 : f32
    call @erf_f32(%cst_2) : (f32) -> ()
    %cst_3 = arith.constant 2.000000e+00 : f32
    call @erf_f32(%cst_3) : (f32) -> ()
    %cst_4 = arith.constant 3.749990e+00 : f32
    call @erf_f32(%cst_4) : (f32) -> ()
    %cst_5 = arith.constant 3.750000e+00 : f32
    call @erf_f32(%cst_5) : (f32) -> ()
    %cst_6 = arith.constant 0xFF800000 : f32
    call @erf_f32(%cst_6) : (f32) -> ()
    %cst_7 = arith.constant dense<[-3.40282347E+38, -4.543180e+00, -1.213090e+00, -7.823420e-01]> : vector<4xf32>
    call @erf_4xf32(%cst_7) : (vector<4xf32>) -> ()
    %cst_8 = arith.constant dense<[-1.17549435E-38, 0.000000e+00, 1.17549435E-38, 0.107934102]> : vector<4xf32>
    call @erf_4xf32(%cst_8) : (vector<4xf32>) -> ()
    %cst_9 = arith.constant dense<[1.235780e+00, 2.340930e+00, 3.823420e+00, 3.40282347E+38]> : vector<4xf32>
    call @erf_4xf32(%cst_9) : (vector<4xf32>) -> ()
    %cst_10 = arith.constant 0x7F800000 : f32
    call @erf_f32(%cst_10) : (f32) -> ()
    %cst_11 = arith.constant 0x7FC00000 : f32
    call @erf_f32(%cst_11) : (f32) -> ()
    return
  }
}

// -----
module {
}

// -----
module {
  func.func @erfc_f32(%arg0: f32) {
    %0 = math.erfc %arg0 : f32
    vector.print %0 : f32
    return
  }
  func.func @erfc_4xf32(%arg0: vector<4xf32>) {
    %0 = math.erfc %arg0 : vector<4xf32>
    vector.print %0 : vector<4xf32>
    return
  }
  func.func @erfc() {
    %cst = arith.constant -2.43186398E-4 : f32
    call @erfc_f32(%cst) : (f32) -> ()
    %cst_0 = arith.constant 0.799989998 : f32
    call @erfc_f32(%cst_0) : (f32) -> ()
    %cst_1 = arith.constant 8.000000e-01 : f32
    call @erfc_f32(%cst_1) : (f32) -> ()
    %cst_2 = arith.constant 1.999990e+00 : f32
    call @erfc_f32(%cst_2) : (f32) -> ()
    %cst_3 = arith.constant 2.000000e+00 : f32
    call @erfc_f32(%cst_3) : (f32) -> ()
    %cst_4 = arith.constant 3.749990e+00 : f32
    call @erfc_f32(%cst_4) : (f32) -> ()
    %cst_5 = arith.constant 3.750000e+00 : f32
    call @erfc_f32(%cst_5) : (f32) -> ()
    %cst_6 = arith.constant 0xFF800000 : f32
    call @erfc_f32(%cst_6) : (f32) -> ()
    %cst_7 = arith.constant dense<[-3.40282347E+38, -4.543180e+00, -1.213090e+00, -7.823420e-01]> : vector<4xf32>
    call @erfc_4xf32(%cst_7) : (vector<4xf32>) -> ()
    %cst_8 = arith.constant dense<[-1.17549435E-38, 0.000000e+00, 1.17549435E-38, 0.107934102]> : vector<4xf32>
    call @erfc_4xf32(%cst_8) : (vector<4xf32>) -> ()
    %cst_9 = arith.constant dense<[1.235780e+00, 2.340930e+00, 3.823420e+00, 3.40282347E+38]> : vector<4xf32>
    call @erfc_4xf32(%cst_9) : (vector<4xf32>) -> ()
    %cst_10 = arith.constant 0x7F800000 : f32
    call @erfc_f32(%cst_10) : (f32) -> ()
    %cst_11 = arith.constant 0x7FC00000 : f32
    call @erfc_f32(%cst_11) : (f32) -> ()
    return
  }
}

// -----
module {
}

// -----
module {
  func.func @exp_f32(%arg0: f32) {
    %0 = math.exp %arg0 : f32
    vector.print %0 : f32
    return
  }
  func.func @exp_4xf32(%arg0: vector<4xf32>) {
    %0 = math.exp %arg0 : vector<4xf32>
    vector.print %0 : vector<4xf32>
    return
  }
  func.func @exp() {
    %cst = arith.constant 1.000000e+00 : f32
    call @exp_f32(%cst) : (f32) -> ()
    %cst_0 = arith.constant dense<[-2.500000e-01, 7.500000e-01, 1.000000e+00, 1.350000e+00]> : vector<4xf32>
    call @exp_4xf32(%cst_0) : (vector<4xf32>) -> ()
    %cst_1 = arith.constant 0.000000e+00 : f32
    call @exp_f32(%cst_1) : (f32) -> ()
    %cst_2 = arith.constant dense<[-8.900000e+01, -2.500000e+01, 2.500000e+01, 8.900000e+01]> : vector<4xf32>
    call @exp_4xf32(%cst_2) : (vector<4xf32>) -> ()
    %cst_3 = arith.constant 0x7F800000 : f32
    call @exp_f32(%cst_3) : (f32) -> ()
    %cst_4 = arith.constant 0xFF800000 : f32
    call @exp_f32(%cst_4) : (f32) -> ()
    %cst_5 = arith.constant 0x7FC00000 : f32
    call @exp_f32(%cst_5) : (f32) -> ()
    return
  }
  func.func @expm1_f32(%arg0: f32) {
    %0 = math.expm1 %arg0 : f32
    vector.print %0 : f32
    return
  }
  func.func @expm1_3xf32(%arg0: vector<3xf32>) {
    %0 = math.expm1 %arg0 : vector<3xf32>
    vector.print %0 : vector<3xf32>
    return
  }
  func.func @expm1_4xf32(%arg0: vector<4xf32>) {
    %0 = math.expm1 %arg0 : vector<4xf32>
    vector.print %0 : vector<4xf32>
    return
  }
  func.func @expm1_8xf32(%arg0: vector<8xf32>) {
    %0 = math.expm1 %arg0 : vector<8xf32>
    vector.print %0 : vector<8xf32>
    return
  }
  func.func @expm1() {
    %cst = arith.constant 1.000000e-10 : f32
    call @expm1_f32(%cst) : (f32) -> ()
    %cst_0 = arith.constant dense<[-0.00999999977, 0.00999999977, 5.000000e-01, 2.000000e+00]> : vector<4xf32>
    call @expm1_4xf32(%cst_0) : (vector<4xf32>) -> ()
    %cst_1 = arith.constant dense<[-2.000000e-01, 0.000000e+00, 2.000000e-01, 4.000000e-01, 6.000000e-01, 8.000000e-01, 1.000000e+00, 1.200000e+00]> : vector<8xf32>
    call @expm1_8xf32(%cst_1) : (vector<8xf32>) -> ()
    %cst_2 = arith.constant 0xFF800000 : f32
    call @expm1_f32(%cst_2) : (f32) -> ()
    %cst_3 = arith.constant 0x7F800000 : f32
    call @expm1_f32(%cst_3) : (f32) -> ()
    %cst_4 = arith.constant dense<[0xFF800000, 0x7F800000, 1.000000e-10]> : vector<3xf32>
    call @expm1_3xf32(%cst_4) : (vector<3xf32>) -> ()
    %cst_5 = arith.constant 0x7FC00000 : f32
    call @expm1_f32(%cst_5) : (f32) -> ()
    return
  }
}

// -----
module {
}

// -----
module {
  func.func @sin_f32(%arg0: f32) {
    %0 = math.sin %arg0 : f32
    vector.print %0 : f32
    return
  }
  func.func @sin_3xf32(%arg0: vector<3xf32>) {
    %0 = math.sin %arg0 : vector<3xf32>
    vector.print %0 : vector<3xf32>
    return
  }
  func.func @sin() {
    %cst = arith.constant 0.000000e+00 : f32
    call @sin_f32(%cst) : (f32) -> ()
    %cst_0 = arith.constant 0.785398185 : f32
    call @sin_f32(%cst_0) : (f32) -> ()
    %cst_1 = arith.constant 1.57079637 : f32
    call @sin_f32(%cst_1) : (f32) -> ()
    %cst_2 = arith.constant 3.14159274 : f32
    call @sin_f32(%cst_2) : (f32) -> ()
    %cst_3 = arith.constant 4.71238899 : f32
    call @sin_f32(%cst_3) : (f32) -> ()
    %cst_4 = arith.constant dense<[9.42477798, 2.09439516, -1.57079637]> : vector<3xf32>
    call @sin_3xf32(%cst_4) : (vector<3xf32>) -> ()
    return
  }
}

// -----
module {
}

// -----
module {
  func.func @cos_f32(%arg0: f32) {
    %0 = math.cos %arg0 : f32
    vector.print %0 : f32
    return
  }
  func.func @cos_3xf32(%arg0: vector<3xf32>) {
    %0 = math.cos %arg0 : vector<3xf32>
    vector.print %0 : vector<3xf32>
    return
  }
  func.func @cos() {
    %cst = arith.constant 0.000000e+00 : f32
    call @cos_f32(%cst) : (f32) -> ()
    %cst_0 = arith.constant 0.785398185 : f32
    call @cos_f32(%cst_0) : (f32) -> ()
    %cst_1 = arith.constant 1.57079637 : f32
    call @cos_f32(%cst_1) : (f32) -> ()
    %cst_2 = arith.constant 3.14159274 : f32
    call @cos_f32(%cst_2) : (f32) -> ()
    %cst_3 = arith.constant 4.71238899 : f32
    call @cos_f32(%cst_3) : (f32) -> ()
    %cst_4 = arith.constant dense<[9.42477798, 2.09439516, -1.57079637]> : vector<3xf32>
    call @cos_3xf32(%cst_4) : (vector<3xf32>) -> ()
    return
  }
}

// -----
module {
}

// -----
module {
  func.func @asin_f32(%arg0: f32) {
    %0 = math.asin %arg0 : f32
    vector.print %0 : f32
    return
  }
  func.func @asin_3xf32(%arg0: vector<3xf32>) {
    %0 = math.asin %arg0 : vector<3xf32>
    vector.print %0 : vector<3xf32>
    return
  }
  func.func @asin() {
    %cst = arith.constant 0.000000e+00 : f32
    call @asin_f32(%cst) : (f32) -> ()
    %cst_0 = arith.constant -5.625000e-01 : f32
    call @asin_f32(%cst_0) : (f32) -> ()
    %cst_1 = arith.constant -3.750000e-01 : f32
    call @asin_f32(%cst_1) : (f32) -> ()
    %cst_2 = arith.constant -2.500000e-01 : f32
    call @asin_f32(%cst_2) : (f32) -> ()
    %cst_3 = arith.constant -0.899999976 : f32
    call @asin_f32(%cst_3) : (f32) -> ()
    %cst_4 = arith.constant dense<[2.500000e-01, 3.750000e-01, 5.625000e-01]> : vector<3xf32>
    call @asin_3xf32(%cst_4) : (vector<3xf32>) -> ()
    return
  }
}

// -----
module {
}

// -----
module {
  func.func @acos_f32(%arg0: f32) {
    %0 = math.acos %arg0 : f32
    vector.print %0 : f32
    return
  }
  func.func @acos_3xf32(%arg0: vector<3xf32>) {
    %0 = math.acos %arg0 : vector<3xf32>
    vector.print %0 : vector<3xf32>
    return
  }
  func.func @acos() {
    %cst = arith.constant 0.000000e+00 : f32
    call @acos_f32(%cst) : (f32) -> ()
    %cst_0 = arith.constant -5.625000e-01 : f32
    call @acos_f32(%cst_0) : (f32) -> ()
    %cst_1 = arith.constant -3.750000e-01 : f32
    call @acos_f32(%cst_1) : (f32) -> ()
    %cst_2 = arith.constant -2.500000e-01 : f32
    call @acos_f32(%cst_2) : (f32) -> ()
    %cst_3 = arith.constant dense<[2.500000e-01, 3.750000e-01, 5.625000e-01]> : vector<3xf32>
    call @acos_3xf32(%cst_3) : (vector<3xf32>) -> ()
    return
  }
}

// -----
module {
}

// -----
module {
  func.func @atan_f32(%arg0: f32) {
    %0 = math.atan %arg0 : f32
    vector.print %0 : f32
    return
  }
  func.func @atan() {
    %cst = arith.constant -1.000000e+00 : f32
    call @atan_f32(%cst) : (f32) -> ()
    %cst_0 = arith.constant 1.000000e+00 : f32
    call @atan_f32(%cst_0) : (f32) -> ()
    %cst_1 = arith.constant -5.000000e-01 : f32
    call @atan_f32(%cst_1) : (f32) -> ()
    %cst_2 = arith.constant 5.000000e-01 : f32
    call @atan_f32(%cst_2) : (f32) -> ()
    %cst_3 = arith.constant 0.000000e+00 : f32
    call @atan_f32(%cst_3) : (f32) -> ()
    %cst_4 = arith.constant -2.000000e+00 : f32
    call @atan_f32(%cst_4) : (f32) -> ()
    %cst_5 = arith.constant 2.000000e+00 : f32
    call @atan_f32(%cst_5) : (f32) -> ()
    return
  }
}

// -----
module {
}

// -----
module {
  func.func @atan2_f32(%arg0: f32, %arg1: f32) {
    %0 = math.atan2 %arg0, %arg1 : f32
    vector.print %0 : f32
    return
  }
  func.func @atan2() {
    %cst = arith.constant 0.000000e+00 : f32
    %cst_0 = arith.constant 1.000000e+00 : f32
    %cst_1 = arith.constant 2.000000e+00 : f32
    %cst_2 = arith.constant -1.000000e+00 : f32
    %cst_3 = arith.constant -2.000000e+00 : f32
    call @atan2_f32(%cst, %cst_0) : (f32, f32) -> ()
    call @atan2_f32(%cst_0, %cst) : (f32, f32) -> ()
    call @atan2_f32(%cst, %cst_2) : (f32, f32) -> ()
    call @atan2_f32(%cst_2, %cst) : (f32, f32) -> ()
    call @atan2_f32(%cst, %cst) : (f32, f32) -> ()
    call @atan2_f32(%cst_1, %cst_0) : (f32, f32) -> ()
    %cst_4 = arith.constant -1.000000e+00 : f32
    %cst_5 = arith.constant 2.000000e+00 : f32
    call @atan2_f32(%cst_1, %cst_2) : (f32, f32) -> ()
    call @atan2_f32(%cst_3, %cst_2) : (f32, f32) -> ()
    call @atan2_f32(%cst_3, %cst_0) : (f32, f32) -> ()
    call @atan2_f32(%cst_0, %cst_1) : (f32, f32) -> ()
    %cst_6 = arith.constant -2.000000e+00 : f32
    %cst_7 = arith.constant 1.000000e+00 : f32
    call @atan2_f32(%cst_0, %cst_3) : (f32, f32) -> ()
    %cst_8 = arith.constant -2.000000e+00 : f32
    %cst_9 = arith.constant -1.000000e+00 : f32
    call @atan2_f32(%cst_2, %cst_3) : (f32, f32) -> ()
    call @atan2_f32(%cst_2, %cst_1) : (f32, f32) -> ()
    return
  }
}

// -----
module {
}

// -----
module {
  func.func @cbrt_f32(%arg0: f32) {
    %0 = math.cbrt %arg0 : f32
    vector.print %0 : f32
    return
  }
  func.func @cbrt() {
    %cst = arith.constant 1.000000e+00 : f32
    call @cbrt_f32(%cst) : (f32) -> ()
    %cst_0 = arith.constant -1.000000e+00 : f32
    call @cbrt_f32(%cst_0) : (f32) -> ()
    %cst_1 = arith.constant 0.000000e+00 : f32
    call @cbrt_f32(%cst_1) : (f32) -> ()
    %cst_2 = arith.constant -0.000000e+00 : f32
    call @cbrt_f32(%cst_2) : (f32) -> ()
    %cst_3 = arith.constant 1.000000e+03 : f32
    call @cbrt_f32(%cst_3) : (f32) -> ()
    %cst_4 = arith.constant -1.000000e+03 : f32
    call @cbrt_f32(%cst_4) : (f32) -> ()
    %cst_5 = arith.constant 1.700000e+01 : f32
    call @cbrt_f32(%cst_5) : (f32) -> ()
    return
  }
}

// -----
module {
}

// -----
module {
  func.func @func_floorf32(%arg0: f32) {
    %0 = math.floor %arg0 : f32
    vector.print %0 : f32
    return
  }
  func.func @floorf() {
    %cst = arith.constant 3.800000e+00 : f32
    call @func_floorf32(%cst) : (f32) -> ()
    %cst_0 = arith.constant -3.800000e+00 : f32
    call @func_floorf32(%cst_0) : (f32) -> ()
    %cst_1 = arith.constant 0.000000e+00 : f32
    call @func_floorf32(%cst_1) : (f32) -> ()
    %cst_2 = arith.constant -4.200000e+00 : f32
    call @func_floorf32(%cst_2) : (f32) -> ()
    %cst_3 = arith.constant -2.000000e+00 : f32
    call @func_floorf32(%cst_3) : (f32) -> ()
    %cst_4 = arith.constant 2.000000e+00 : f32
    call @func_floorf32(%cst_4) : (f32) -> ()
    return
  }
}

// -----
module {
}

