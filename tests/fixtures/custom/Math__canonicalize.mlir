module {
  func.func @ceil_fold() -> f32 {
    %cst = arith.constant 3.000000e-01 : f32
    %0 = math.ceil %cst : f32
    return %0 : f32
  }
  func.func @ceil_fold2() -> f32 {
    %cst = arith.constant 2.000000e+00 : f32
    %0 = math.ceil %cst : f32
    return %0 : f32
  }
  func.func @log2_fold() -> f32 {
    %cst = arith.constant 4.000000e+00 : f32
    %0 = math.log2 %cst : f32
    return %0 : f32
  }
  func.func @log2_fold2() -> f32 {
    %cst = arith.constant 0.000000e+00 : f32
    %0 = math.log2 %cst : f32
    return %0 : f32
  }
  func.func @log2_nofold2() -> f32 {
    %cst = arith.constant -1.000000e+00 : f32
    %0 = math.log2 %cst : f32
    return %0 : f32
  }
  func.func @log2_fold_64() -> f64 {
    %cst = arith.constant 4.000000e+00 : f64
    %0 = math.log2 %cst : f64
    return %0 : f64
  }
  func.func @log2_fold2_64() -> f64 {
    %cst = arith.constant 0.000000e+00 : f64
    %0 = math.log2 %cst : f64
    return %0 : f64
  }
  func.func @log2_nofold2_64() -> f64 {
    %cst = arith.constant -1.000000e+00 : f64
    %0 = math.log2 %cst : f64
    return %0 : f64
  }
  func.func @log2_fold_vec() -> vector<4xf32> {
    %cst = arith.constant dense<[1.000000e+00, 2.000000e+00, 3.000000e+00, 4.000000e+00]> : vector<4xf32>
    %0 = math.log2 %cst : vector<4xf32>
    return %0 : vector<4xf32>
  }
  func.func @powf_fold() -> f32 {
    %cst = arith.constant 2.000000e+00 : f32
    %0 = math.powf %cst, %cst : f32
    return %0 : f32
  }
  func.func @powf_fold_vec() -> vector<4xf32> {
    %cst = arith.constant dense<[1.000000e+00, 2.000000e+00, 3.000000e+00, 4.000000e+00]> : vector<4xf32>
    %cst_0 = arith.constant dense<2.000000e+00> : vector<4xf32>
    %0 = math.powf %cst, %cst_0 : vector<4xf32>
    return %0 : vector<4xf32>
  }
  func.func @rsqrt_fold() -> f32 {
    %cst = arith.constant 4.000000e+00 : f32
    %0 = math.rsqrt %cst : f32
    return %0 : f32
  }
  func.func @rsqrt_fold_vec() -> vector<2xf32> {
    %cst = arith.constant dense<[1.000000e+00, 4.000000e+00]> : vector<2xf32>
    %0 = math.rsqrt %cst : vector<2xf32>
    return %0 : vector<2xf32>
  }
  func.func @rsqrt_poison() -> f32 {
    %0 = ub.poison : f32
    %1 = math.rsqrt %0 : f32
    return %1 : f32
  }
  func.func @sqrt_fold() -> f32 {
    %cst = arith.constant 4.000000e+00 : f32
    %0 = math.sqrt %cst : f32
    return %0 : f32
  }
  func.func @sqrt_fold_vec() -> vector<4xf32> {
    %cst = arith.constant dense<[1.000000e+00, 2.000000e+00, 3.000000e+00, 4.000000e+00]> : vector<4xf32>
    %0 = math.sqrt %cst : vector<4xf32>
    return %0 : vector<4xf32>
  }
  func.func @abs_fold() -> f32 {
    %cst = arith.constant -4.000000e+00 : f32
    %0 = math.absf %cst : f32
    return %0 : f32
  }
  func.func @copysign_fold() -> f32 {
    %cst = arith.constant 4.000000e+00 : f32
    %cst_0 = arith.constant -9.000000e+00 : f32
    %0 = math.copysign %cst, %cst_0 : f32
    return %0 : f32
  }
  func.func @ctlz_fold1() -> i32 {
    %c1_i32 = arith.constant 1 : i32
    %0 = math.ctlz %c1_i32 : i32
    return %0 : i32
  }
  func.func @ctlz_fold2() -> i8 {
    %c1_i8 = arith.constant 1 : i8
    %0 = math.ctlz %c1_i8 : i8
    return %0 : i8
  }
  func.func @cttz_fold() -> i32 {
    %c256_i32 = arith.constant 256 : i32
    %0 = math.cttz %c256_i32 : i32
    return %0 : i32
  }
  func.func @ctpop_fold() -> i32 {
    %c-16776961_i32 = arith.constant -16776961 : i32
    %0 = math.ctpop %c-16776961_i32 : i32
    return %0 : i32
  }
  func.func @log10_fold() -> f32 {
    %cst = arith.constant 1.000000e+02 : f32
    %0 = math.log10 %cst : f32
    return %0 : f32
  }
  func.func @log10_fold_vec() -> vector<4xf32> {
    %cst = arith.constant dense<[1.000000e+00, 1.000000e+01, 1.000000e+02, 2.000000e+02]> : vector<4xf32>
    %0 = math.log10 %cst : vector<4xf32>
    return %0 : vector<4xf32>
  }
  func.func @log1p_fold() -> f32 {
    %cst = arith.constant 1.700000e+01 : f32
    %0 = math.log1p %cst : f32
    return %0 : f32
  }
  func.func @log1p_fold_vec() -> vector<4xf32> {
    %cst = arith.constant dense<[3.000000e+00, 5.000000e+00, 7.000000e+00, 1.100000e+01]> : vector<4xf32>
    %0 = math.log1p %cst : vector<4xf32>
    return %0 : vector<4xf32>
  }
  func.func @log_fold() -> f32 {
    %cst = arith.constant 2.000000e+00 : f32
    %0 = math.log %cst : f32
    return %0 : f32
  }
  func.func @log_fold_vec() -> vector<4xf32> {
    %cst = arith.constant dense<[1.000000e+00, 2.000000e+00, 3.000000e+00, 4.000000e+00]> : vector<4xf32>
    %0 = math.log %cst : vector<4xf32>
    return %0 : vector<4xf32>
  }
  func.func @exp_fold() -> f32 {
    %cst = arith.constant 2.000000e+00 : f32
    %0 = math.exp %cst : f32
    return %0 : f32
  }
  func.func @exp_fold_vec() -> vector<4xf32> {
    %cst = arith.constant dense<[1.000000e+00, 2.000000e+00, 3.000000e+00, 4.000000e+00]> : vector<4xf32>
    %0 = math.exp %cst : vector<4xf32>
    return %0 : vector<4xf32>
  }
  func.func @exp2_fold() -> f32 {
    %cst = arith.constant 2.000000e+00 : f32
    %0 = math.exp2 %cst : f32
    return %0 : f32
  }
  func.func @exp2_fold_vec() -> vector<4xf32> {
    %cst = arith.constant dense<[1.000000e+00, 2.000000e+00, 3.000000e+00, 4.000000e+00]> : vector<4xf32>
    %0 = math.exp2 %cst : vector<4xf32>
    return %0 : vector<4xf32>
  }
  func.func @expm1_fold() -> f32 {
    %cst = arith.constant 2.000000e+00 : f32
    %0 = math.expm1 %cst : f32
    return %0 : f32
  }
  func.func @expm1_fold_vec() -> vector<4xf32> {
    %cst = arith.constant dense<[0.000000e+00, 1.000000e+00, 0.000000e+00, 1.000000e+00]> : vector<4xf32>
    %0 = math.expm1 %cst : vector<4xf32>
    return %0 : vector<4xf32>
  }
  func.func @tan_fold() -> f32 {
    %cst = arith.constant 1.000000e+00 : f32
    %0 = math.tan %cst : f32
    return %0 : f32
  }
  func.func @tan_fold_vec() -> vector<4xf32> {
    %cst = arith.constant dense<[0.000000e+00, 1.000000e+00, 0.000000e+00, 1.000000e+00]> : vector<4xf32>
    %0 = math.tan %cst : vector<4xf32>
    return %0 : vector<4xf32>
  }
  func.func @tanh_fold() -> f32 {
    %cst = arith.constant 1.000000e+00 : f32
    %0 = math.tanh %cst : f32
    return %0 : f32
  }
  func.func @tanh_fold_vec() -> vector<4xf32> {
    %cst = arith.constant dense<[0.000000e+00, 1.000000e+00, 0.000000e+00, 1.000000e+00]> : vector<4xf32>
    %0 = math.tanh %cst : vector<4xf32>
    return %0 : vector<4xf32>
  }
  func.func @atan_fold() -> f32 {
    %cst = arith.constant 1.000000e+00 : f32
    %0 = math.atan %cst : f32
    return %0 : f32
  }
  func.func @atan_fold_vec() -> vector<4xf32> {
    %cst = arith.constant dense<[0.000000e+00, 1.000000e+00, 0.000000e+00, 1.000000e+00]> : vector<4xf32>
    %0 = math.atan %cst : vector<4xf32>
    return %0 : vector<4xf32>
  }
  func.func @atan2_fold() -> f32 {
    %cst = arith.constant 0.000000e+00 : f32
    %cst_0 = arith.constant 1.000000e+00 : f32
    %0 = math.atan2 %cst, %cst_0 : f32
    return %0 : f32
  }
  func.func @atan2_fold_vec() -> vector<4xf32> {
    %cst = arith.constant dense<[0.000000e+00, 0.000000e+00, 1.000000e+00, 1.000000e+00]> : vector<4xf32>
    %cst_0 = arith.constant dense<[1.000000e+00, 1.000000e+00, 2.000000e+00, 2.000000e+00]> : vector<4xf32>
    %0 = math.atan2 %cst, %cst_0 : vector<4xf32>
    return %0 : vector<4xf32>
  }
  func.func @cos_fold() -> f32 {
    %cst = arith.constant 1.000000e+00 : f32
    %0 = math.cos %cst : f32
    return %0 : f32
  }
  func.func @cos_fold_vec() -> vector<4xf32> {
    %cst = arith.constant dense<[0.000000e+00, 1.000000e+00, 0.000000e+00, 1.000000e+00]> : vector<4xf32>
    %0 = math.cos %cst : vector<4xf32>
    return %0 : vector<4xf32>
  }
  func.func @roundeven_fold() -> f32 {
    %cst = arith.constant 1.500000e+00 : f32
    %0 = math.roundeven %cst : f32
    return %0 : f32
  }
  func.func @roundeven_fold_vec() -> vector<4xf32> {
    %cst = arith.constant dense<[5.000000e-01, -5.000000e-01, 1.500000e+00, -1.500000e+00]> : vector<4xf32>
    %0 = math.roundeven %cst : vector<4xf32>
    return %0 : vector<4xf32>
  }
  func.func @round_fold() -> f32 {
    %cst = arith.constant 1.500000e+00 : f32
    %0 = math.round %cst : f32
    return %0 : f32
  }
  func.func @round_fold_vec() -> vector<4xf32> {
    %cst = arith.constant dense<[5.000000e-01, -5.000000e-01, 1.500000e+00, -1.500000e+00]> : vector<4xf32>
    %0 = math.round %cst : vector<4xf32>
    return %0 : vector<4xf32>
  }
  func.func @floor_fold() -> f32 {
    %cst = arith.constant 3.000000e-01 : f32
    %0 = math.floor %cst : f32
    return %0 : f32
  }
  func.func @floor_fold2() -> f32 {
    %cst = arith.constant 2.000000e+00 : f32
    %0 = math.floor %cst : f32
    return %0 : f32
  }
  func.func @trunc_fold() -> f32 {
    %cst = arith.constant 1.100000e+00 : f32
    %0 = math.trunc %cst : f32
    return %0 : f32
  }
  func.func @trunc_fold_vec() -> vector<4xf32> {
    %cst = arith.constant dense<[5.000000e-01, -5.000000e-01, 1.500000e+00, -1.500000e+00]> : vector<4xf32>
    %0 = math.trunc %cst : vector<4xf32>
    return %0 : vector<4xf32>
  }
  func.func @sin_fold() -> f32 {
    %cst = arith.constant 1.000000e+00 : f32
    %0 = math.sin %cst : f32
    return %0 : f32
  }
  func.func @sin_fold_vec() -> vector<4xf32> {
    %cst = arith.constant dense<[0.000000e+00, 1.000000e+00, 0.000000e+00, 1.000000e+00]> : vector<4xf32>
    %0 = math.sin %cst : vector<4xf32>
    return %0 : vector<4xf32>
  }
  func.func @erf_fold() -> f32 {
    %cst = arith.constant 1.000000e+00 : f32
    %0 = math.erf %cst : f32
    return %0 : f32
  }
  func.func @erf_fold_vec() -> vector<4xf32> {
    %cst = arith.constant dense<[0.000000e+00, 1.000000e+00, 0.000000e+00, 1.000000e+00]> : vector<4xf32>
    %0 = math.erf %cst : vector<4xf32>
    return %0 : vector<4xf32>
  }
  func.func @abs_poison() -> f32 {
    %0 = ub.poison : f32
    %1 = math.absf %0 : f32
    return %1 : f32
  }
  func.func @isfinite_fold() -> i1 {
    %cst = arith.constant 2.000000e+00 : f32
    %0 = math.isfinite %cst : f32
    return %0 : i1
  }
  func.func @isfinite_fold_vec() -> vector<4xi1> {
    %cst = arith.constant dense<2.000000e+00> : vector<4xf32>
    %0 = math.isfinite %cst : vector<4xf32>
    return %0 : vector<4xi1>
  }
  func.func @isinf_fold() -> i1 {
    %cst = arith.constant 2.000000e+00 : f32
    %0 = math.isinf %cst : f32
    return %0 : i1
  }
  func.func @isinf_fold_vec() -> vector<4xi1> {
    %cst = arith.constant dense<2.000000e+00> : vector<4xf32>
    %0 = math.isinf %cst : vector<4xf32>
    return %0 : vector<4xi1>
  }
  func.func @isnan_fold() -> i1 {
    %cst = arith.constant 2.000000e+00 : f32
    %0 = math.isnan %cst : f32
    return %0 : i1
  }
  func.func @isnan_fold_vec() -> vector<4xi1> {
    %cst = arith.constant dense<2.000000e+00> : vector<4xf32>
    %0 = math.isnan %cst : vector<4xf32>
    return %0 : vector<4xi1>
  }
  func.func @isnormal_fold() -> i1 {
    %cst = arith.constant 2.000000e+00 : f32
    %0 = math.isnormal %cst : f32
    return %0 : i1
  }
  func.func @isnormal_fold_vec() -> vector<4xi1> {
    %cst = arith.constant dense<2.000000e+00> : vector<4xf32>
    %0 = math.isnormal %cst : vector<4xf32>
    return %0 : vector<4xi1>
  }
  func.func @ipowi_i1_const_pos_exp() -> i1 {
    %true = arith.constant true
    %false = arith.constant false
    %0 = math.ipowi %true, %false : i1
    return %0 : i1
  }
  func.func @ipowi_i1_const_neg_exp() -> i1 {
    %true = arith.constant true
    %true_0 = arith.constant true
    %0 = math.ipowi %true, %true_0 : i1
    return %0 : i1
  }
  func.func @fpowi_fold() -> (f64, f32) {
    %cst = arith.constant 2.000000e+00 : f64
    %cst_0 = arith.constant 2.000000e+00 : f32
    %c2_i32 = arith.constant 2 : i32
    %0 = math.fpowi %cst, %c2_i32 : f64, i32
    %1 = math.fpowi %cst_0, %c2_i32 : f32, i32
    return %0, %1 : f64, f32
  }
  func.func @fpowi_fold_vec() -> vector<4xf32> {
    %cst = arith.constant dense<[1.000000e+00, 2.000000e+00, 3.000000e+00, 4.000000e+00]> : vector<4xf32>
    %cst_0 = arith.constant dense<[2, 4, 2, 2]> : vector<4xi32>
    %0 = math.fpowi %cst, %cst_0 : vector<4xf32>, vector<4xi32>
    return %0 : vector<4xf32>
  }
  func.func @fpowi_fold_failed() -> f32 {
    %cst = arith.constant 2.000000e+00 : f32
    %c16777217_i32 = arith.constant 16777217 : i32
    %0 = math.fpowi %cst, %c16777217_i32 : f32, i32
    return %0 : f32
  }
  func.func @sincos_fold_f32() -> (f32, f32) {
    %cst = arith.constant 1.000000e+00 : f32
    %sin, %cos = math.sincos %cst : f32
    return %sin, %cos : f32, f32
  }
  func.func @sincos_fold_f64() -> (f64, f64) {
    %cst = arith.constant 1.000000e+00 : f64
    %sin, %cos = math.sincos %cst : f64
    return %sin, %cos : f64, f64
  }
  func.func @sincos_fold_vec() -> (vector<4xf32>, vector<4xf32>) {
    %cst = arith.constant dense<[0.000000e+00, 1.000000e+00, 0.000000e+00, 1.000000e+00]> : vector<4xf32>
    %sin, %cos = math.sincos %cst : vector<4xf32>
    return %sin, %cos : vector<4xf32>, vector<4xf32>
  }
  func.func @cbrt_fold() -> (f64, f32) {
    %cst = arith.constant 8.000000e+00 : f64
    %cst_0 = arith.constant -8.000000e+00 : f32
    %0 = math.cbrt %cst : f64
    %1 = math.cbrt %cst_0 : f32
    return %0, %1 : f64, f32
  }
  func.func @cbrt_fold_vec() -> vector<4xf32> {
    %cst = arith.constant dense<[-1.000000e+00, 0.000000e+00, 1.000000e+00, 8.000000e+00]> : vector<4xf32>
    %0 = math.cbrt %cst : vector<4xf32>
    return %0 : vector<4xf32>
  }
}

