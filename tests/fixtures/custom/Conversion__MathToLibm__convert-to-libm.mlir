module {
  func.func @absf_caller(%arg0: f32, %arg1: f64) -> (f32, f64) {
    %0 = math.absf %arg0 : f32
    %1 = math.absf %arg1 : f64
    return %0, %1 : f32, f64
  }
  func.func @absf_vec_caller(%arg0: vector<2xf32>, %arg1: vector<2xf64>) -> (vector<2xf32>, vector<2xf64>) {
    %0 = math.absf %arg0 : vector<2xf32>
    %1 = math.absf %arg1 : vector<2xf64>
    return %0, %1 : vector<2xf32>, vector<2xf64>
  }
  func.func @acos_caller(%arg0: f32, %arg1: f64) -> (f32, f64) {
    %0 = math.acos %arg0 : f32
    %1 = math.acos %arg1 : f64
    return %0, %1 : f32, f64
  }
  func.func @acos_vec_caller(%arg0: vector<2xf32>, %arg1: vector<2xf64>) -> (vector<2xf32>, vector<2xf64>) {
    %0 = math.acos %arg0 : vector<2xf32>
    %1 = math.acos %arg1 : vector<2xf64>
    return %0, %1 : vector<2xf32>, vector<2xf64>
  }
  func.func @acosh_caller(%arg0: f32, %arg1: f64) -> (f32, f64) {
    %0 = math.acosh %arg0 : f32
    %1 = math.acosh %arg1 : f64
    return %0, %1 : f32, f64
  }
  func.func @acosh_vec_caller(%arg0: vector<2xf32>, %arg1: vector<2xf64>) -> (vector<2xf32>, vector<2xf64>) {
    %0 = math.acosh %arg0 : vector<2xf32>
    %1 = math.acosh %arg1 : vector<2xf64>
    return %0, %1 : vector<2xf32>, vector<2xf64>
  }
  func.func @asin_caller(%arg0: f32, %arg1: f64) -> (f32, f64) {
    %0 = math.asin %arg0 : f32
    %1 = math.asin %arg1 : f64
    return %0, %1 : f32, f64
  }
  func.func @asin_vec_caller(%arg0: vector<2xf32>, %arg1: vector<2xf64>) -> (vector<2xf32>, vector<2xf64>) {
    %0 = math.asin %arg0 : vector<2xf32>
    %1 = math.asin %arg1 : vector<2xf64>
    return %0, %1 : vector<2xf32>, vector<2xf64>
  }
  func.func @asinh_caller(%arg0: f32, %arg1: f64) -> (f32, f64) {
    %0 = math.asinh %arg0 : f32
    %1 = math.asinh %arg1 : f64
    return %0, %1 : f32, f64
  }
  func.func @asinh_vec_caller(%arg0: vector<2xf32>, %arg1: vector<2xf64>) -> (vector<2xf32>, vector<2xf64>) {
    %0 = math.asinh %arg0 : vector<2xf32>
    %1 = math.asinh %arg1 : vector<2xf64>
    return %0, %1 : vector<2xf32>, vector<2xf64>
  }
  func.func @atan_caller(%arg0: f32, %arg1: f64, %arg2: f16, %arg3: bf16) -> (f32, f64, f16, bf16) {
    %0 = math.atan %arg0 : f32
    %1 = math.atan %arg1 : f64
    %2 = math.atan %arg2 : f16
    %3 = math.atan %arg3 : bf16
    return %0, %1, %2, %3 : f32, f64, f16, bf16
  }
  func.func @atan_vec_caller(%arg0: vector<2xf32>, %arg1: vector<2xf64>) -> (vector<2xf32>, vector<2xf64>) {
    %0 = math.atan %arg0 : vector<2xf32>
    %1 = math.atan %arg1 : vector<2xf64>
    return %0, %1 : vector<2xf32>, vector<2xf64>
  }
  func.func @atanh_caller(%arg0: f32, %arg1: f64, %arg2: f16, %arg3: bf16) -> (f32, f64, f16, bf16) {
    %0 = math.atanh %arg0 : f32
    %1 = math.atanh %arg1 : f64
    %2 = math.atanh %arg2 : f16
    %3 = math.atanh %arg3 : bf16
    return %0, %1, %2, %3 : f32, f64, f16, bf16
  }
  func.func @atanh_vec_caller(%arg0: vector<2xf32>, %arg1: vector<2xf64>) -> (vector<2xf32>, vector<2xf64>) {
    %0 = math.atanh %arg0 : vector<2xf32>
    %1 = math.atanh %arg1 : vector<2xf64>
    return %0, %1 : vector<2xf32>, vector<2xf64>
  }
  func.func @tanh_caller(%arg0: f32, %arg1: f64) -> (f32, f64) {
    %0 = math.tanh %arg0 : f32
    %1 = math.tanh %arg1 : f64
    return %0, %1 : f32, f64
  }
  func.func @cosh_caller(%arg0: f32, %arg1: f64) -> (f32, f64) {
    %0 = math.cosh %arg0 : f32
    %1 = math.cosh %arg1 : f64
    return %0, %1 : f32, f64
  }
  func.func @sinh_caller(%arg0: f32, %arg1: f64) -> (f32, f64) {
    %0 = math.sinh %arg0 : f32
    %1 = math.sinh %arg1 : f64
    return %0, %1 : f32, f64
  }
  func.func @atan2_caller(%arg0: f32, %arg1: f64, %arg2: f16, %arg3: bf16) -> (f32, f64, f16, bf16) {
    %0 = math.atan2 %arg0, %arg0 : f32
    %1 = math.atan2 %arg1, %arg1 : f64
    %2 = math.atan2 %arg2, %arg2 : f16
    %3 = math.atan2 %arg3, %arg3 : bf16
    return %0, %1, %2, %3 : f32, f64, f16, bf16
  }
  func.func @erf_caller(%arg0: f32, %arg1: f64) -> (f32, f64) {
    %0 = math.erf %arg0 : f32
    %1 = math.erf %arg1 : f64
    return %0, %1 : f32, f64
  }
  func.func @erf_vec_caller(%arg0: vector<2xf32>, %arg1: vector<2xf64>) -> (vector<2xf32>, vector<2xf64>) {
    %0 = math.erf %arg0 : vector<2xf32>
    %1 = math.erf %arg1 : vector<2xf64>
    return %0, %1 : vector<2xf32>, vector<2xf64>
  }
  func.func @exp_caller(%arg0: f32, %arg1: f64) -> (f32, f64) {
    %0 = math.exp %arg0 : f32
    %1 = math.exp %arg1 : f64
    return %0, %1 : f32, f64
  }
  func.func @exp_vec_caller(%arg0: vector<2xf32>, %arg1: vector<2xf64>) -> (vector<2xf32>, vector<2xf64>) {
    %0 = math.exp %arg0 : vector<2xf32>
    %1 = math.exp %arg1 : vector<2xf64>
    return %0, %1 : vector<2xf32>, vector<2xf64>
  }
  func.func @exp2_caller(%arg0: f32, %arg1: f64) -> (f32, f64) {
    %0 = math.exp2 %arg0 : f32
    %1 = math.exp2 %arg1 : f64
    return %0, %1 : f32, f64
  }
  func.func @exp2_vec_caller(%arg0: vector<2xf32>, %arg1: vector<2xf64>) -> (vector<2xf32>, vector<2xf64>) {
    %0 = math.exp2 %arg0 : vector<2xf32>
    %1 = math.exp2 %arg1 : vector<2xf64>
    return %0, %1 : vector<2xf32>, vector<2xf64>
  }
  func.func @log_caller(%arg0: f32, %arg1: f64) -> (f32, f64) {
    %0 = math.log %arg0 : f32
    %1 = math.log %arg1 : f64
    return %0, %1 : f32, f64
  }
  func.func @log_vec_caller(%arg0: vector<2xf32>, %arg1: vector<2xf64>) -> (vector<2xf32>, vector<2xf64>) {
    %0 = math.log %arg0 : vector<2xf32>
    %1 = math.log %arg1 : vector<2xf64>
    return %0, %1 : vector<2xf32>, vector<2xf64>
  }
  func.func @log2_caller(%arg0: f32, %arg1: f64) -> (f32, f64) {
    %0 = math.log2 %arg0 : f32
    %1 = math.log2 %arg1 : f64
    return %0, %1 : f32, f64
  }
  func.func @log2_vec_caller(%arg0: vector<2xf32>, %arg1: vector<2xf64>) -> (vector<2xf32>, vector<2xf64>) {
    %0 = math.log2 %arg0 : vector<2xf32>
    %1 = math.log2 %arg1 : vector<2xf64>
    return %0, %1 : vector<2xf32>, vector<2xf64>
  }
  func.func @log10_caller(%arg0: f32, %arg1: f64) -> (f32, f64) {
    %0 = math.log10 %arg0 : f32
    %1 = math.log10 %arg1 : f64
    return %0, %1 : f32, f64
  }
  func.func @log10_vec_caller(%arg0: vector<2xf32>, %arg1: vector<2xf64>) -> (vector<2xf32>, vector<2xf64>) {
    %0 = math.log10 %arg0 : vector<2xf32>
    %1 = math.log10 %arg1 : vector<2xf64>
    return %0, %1 : vector<2xf32>, vector<2xf64>
  }
  func.func @expm1_caller(%arg0: f32, %arg1: f64) -> (f32, f64) {
    %0 = math.expm1 %arg0 : f32
    %1 = math.expm1 %arg1 : f64
    return %0, %1 : f32, f64
  }
  func.func @expm1_vec_caller(%arg0: vector<2xf32>, %arg1: vector<2xf64>) -> (vector<2xf32>, vector<2xf64>) {
    %0 = math.expm1 %arg0 : vector<2xf32>
    %1 = math.expm1 %arg1 : vector<2xf64>
    return %0, %1 : vector<2xf32>, vector<2xf64>
  }
  func.func @expm1_multidim_vec_caller(%arg0: vector<2x2xf32>) -> vector<2x2xf32> {
    %0 = math.expm1 %arg0 : vector<2x2xf32>
    return %0 : vector<2x2xf32>
  }
  func.func @fma_caller(%arg0: f32, %arg1: f32, %arg2: f32, %arg3: f64, %arg4: f64, %arg5: f64) -> (f32, f64) {
    %0 = math.fma %arg0, %arg1, %arg2 : f32
    %1 = math.fma %arg3, %arg4, %arg5 : f64
    return %0, %1 : f32, f64
  }
  func.func @fma_vec_caller(%arg0: vector<2xf32>, %arg1: vector<2xf32>, %arg2: vector<2xf32>, %arg3: vector<2xf64>, %arg4: vector<2xf64>, %arg5: vector<2xf64>) -> (vector<2xf32>, vector<2xf64>) {
    %0 = math.fma %arg0, %arg1, %arg2 : vector<2xf32>
    %1 = math.fma %arg3, %arg4, %arg5 : vector<2xf64>
    return %0, %1 : vector<2xf32>, vector<2xf64>
  }
  func.func @round_caller(%arg0: f32, %arg1: f64) -> (f32, f64) {
    %0 = math.round %arg0 : f32
    %1 = math.round %arg1 : f64
    return %0, %1 : f32, f64
  }
  func.func @roundeven_caller(%arg0: f32, %arg1: f64) -> (f32, f64) {
    %0 = math.roundeven %arg0 : f32
    %1 = math.roundeven %arg1 : f64
    return %0, %1 : f32, f64
  }
  func.func @trunc_caller(%arg0: f32, %arg1: f64) -> (f32, f64) {
    %0 = math.trunc %arg0 : f32
    %1 = math.trunc %arg1 : f64
    return %0, %1 : f32, f64
  }
  func.func @cbrt_caller(%arg0: f32, %arg1: f64, %arg2: f16, %arg3: bf16, %arg4: vector<2xf32>) -> (f32, f64, f16, bf16, vector<2xf32>) {
    %0 = math.cbrt %arg0 : f32
    %1 = math.cbrt %arg1 : f64
    %2 = math.cbrt %arg2 : f16
    %3 = math.cbrt %arg3 : bf16
    %4 = math.cbrt %arg4 : vector<2xf32>
    return %0, %1, %2, %3, %4 : f32, f64, f16, bf16, vector<2xf32>
  }
  func.func @cos_caller(%arg0: f32, %arg1: f64) -> (f32, f64) {
    %0 = math.cos %arg0 : f32
    %1 = math.cos %arg1 : f64
    return %0, %1 : f32, f64
  }
  func.func @sin_caller(%arg0: f32, %arg1: f64) -> (f32, f64) {
    %0 = math.sin %arg0 : f32
    %1 = math.sin %arg1 : f64
    return %0, %1 : f32, f64
  }
  func.func @round_vec_caller(%arg0: vector<2xf32>, %arg1: vector<2xf64>) -> (vector<2xf32>, vector<2xf64>) {
    %0 = math.round %arg0 : vector<2xf32>
    %1 = math.round %arg1 : vector<2xf64>
    return %0, %1 : vector<2xf32>, vector<2xf64>
  }
  func.func @roundeven_vec_caller(%arg0: vector<2xf32>, %arg1: vector<2xf64>) -> (vector<2xf32>, vector<2xf64>) {
    %0 = math.roundeven %arg0 : vector<2xf32>
    %1 = math.roundeven %arg1 : vector<2xf64>
    return %0, %1 : vector<2xf32>, vector<2xf64>
  }
  func.func @trunc_vec_caller(%arg0: vector<2xf32>, %arg1: vector<2xf64>) -> (vector<2xf32>, vector<2xf64>) {
    %0 = math.trunc %arg0 : vector<2xf32>
    %1 = math.trunc %arg1 : vector<2xf64>
    return %0, %1 : vector<2xf32>, vector<2xf64>
  }
  func.func @tan_caller(%arg0: f32, %arg1: f64, %arg2: f16, %arg3: bf16) -> (f32, f64, f16, bf16) {
    %0 = math.tan %arg0 : f32
    %1 = math.tan %arg1 : f64
    %2 = math.tan %arg2 : f16
    %3 = math.tan %arg3 : bf16
    return %0, %1, %2, %3 : f32, f64, f16, bf16
  }
  func.func @tan_vec_caller(%arg0: vector<2xf32>, %arg1: vector<2xf64>) -> (vector<2xf32>, vector<2xf64>) {
    %0 = math.tan %arg0 : vector<2xf32>
    %1 = math.tan %arg1 : vector<2xf64>
    return %0, %1 : vector<2xf32>, vector<2xf64>
  }
  func.func @log1p_caller(%arg0: f32, %arg1: f64) -> (f32, f64) {
    %0 = math.log1p %arg0 : f32
    %1 = math.log1p %arg1 : f64
    return %0, %1 : f32, f64
  }
  func.func @floor_caller(%arg0: f32, %arg1: f64) -> (f32, f64) {
    %0 = math.floor %arg0 : f32
    %1 = math.floor %arg1 : f64
    return %0, %1 : f32, f64
  }
  func.func @ceil_caller(%arg0: f32, %arg1: f64) -> (f32, f64) {
    %0 = math.ceil %arg0 : f32
    %1 = math.ceil %arg1 : f64
    return %0, %1 : f32, f64
  }
  func.func @sqrt_caller(%arg0: f32, %arg1: f64) -> (f32, f64) {
    %0 = math.sqrt %arg0 : f32
    %1 = math.sqrt %arg1 : f64
    return %0, %1 : f32, f64
  }
  func.func @sqrt_vec_caller(%arg0: vector<2xf32>, %arg1: vector<2xf64>) -> (vector<2xf32>, vector<2xf64>) {
    %0 = math.sqrt %arg0 : vector<2xf32>
    %1 = math.sqrt %arg1 : vector<2xf64>
    return %0, %1 : vector<2xf32>, vector<2xf64>
  }
  func.func @rsqrt_caller(%arg0: f32, %arg1: f64) -> (f32, f64) {
    %0 = math.rsqrt %arg0 : f32
    %1 = math.rsqrt %arg1 : f64
    return %0, %1 : f32, f64
  }
  func.func @rsqrt_vec_caller(%arg0: vector<2xf32>, %arg1: vector<2xf64>) -> (vector<2xf32>, vector<2xf64>) {
    %0 = math.rsqrt %arg0 : vector<2xf32>
    %1 = math.rsqrt %arg1 : vector<2xf64>
    return %0, %1 : vector<2xf32>, vector<2xf64>
  }
  func.func @powf_caller(%arg0: f32, %arg1: f32, %arg2: f64, %arg3: f64) -> (f32, f64) {
    %0 = math.powf %arg0, %arg1 : f32
    %1 = math.powf %arg2, %arg3 : f64
    return %0, %1 : f32, f64
  }
  func.func @powf_vec_caller(%arg0: vector<2xf32>, %arg1: vector<2xf32>, %arg2: vector<2xf64>, %arg3: vector<2xf64>) -> (vector<2xf32>, vector<2xf64>) {
    %0 = math.powf %arg0, %arg1 : vector<2xf32>
    %1 = math.powf %arg2, %arg3 : vector<2xf64>
    return %0, %1 : vector<2xf32>, vector<2xf64>
  }
}

