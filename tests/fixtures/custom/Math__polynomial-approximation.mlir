module {
  func.func @erf_scalar(%arg0: f32) -> f32 {
    %0 = math.erf %arg0 : f32
    return %0 : f32
  }
  func.func @erfc_scalar(%arg0: f32) -> f32 {
    %0 = math.erfc %arg0 : f32
    return %0 : f32
  }
  func.func @erf_vector(%arg0: vector<8xf32>) -> vector<8xf32> {
    %0 = math.erf %arg0 : vector<8xf32>
    return %0 : vector<8xf32>
  }
  func.func @erf_scalable_vector(%arg0: vector<[8]xf32>) -> vector<[8]xf32> {
    %0 = math.erf %arg0 : vector<[8]xf32>
    return %0 : vector<[8]xf32>
  }
  func.func @exp_scalar(%arg0: f32) -> f32 {
    %0 = math.exp %arg0 : f32
    return %0 : f32
  }
  func.func @exp_vector(%arg0: vector<8xf32>) -> vector<8xf32> {
    %0 = math.exp %arg0 : vector<8xf32>
    return %0 : vector<8xf32>
  }
  func.func @exp_scalable_vector(%arg0: vector<[8]xf32>) -> vector<[8]xf32> {
    %0 = math.exp %arg0 : vector<[8]xf32>
    return %0 : vector<[8]xf32>
  }
  func.func @expm1_scalar(%arg0: f32) -> f32 {
    %0 = math.expm1 %arg0 : f32
    return %0 : f32
  }
  func.func @expm1_vector(%arg0: vector<8x8xf32>) -> vector<8x8xf32> {
    %0 = math.expm1 %arg0 : vector<8x8xf32>
    return %0 : vector<8x8xf32>
  }
  func.func @expm1_scalable_vector(%arg0: vector<8x[8]xf32>) -> vector<8x[8]xf32> {
    %0 = math.expm1 %arg0 : vector<8x[8]xf32>
    return %0 : vector<8x[8]xf32>
  }
  func.func @log_scalar(%arg0: f32) -> f32 {
    %0 = math.log %arg0 : f32
    return %0 : f32
  }
  func.func @log_vector(%arg0: vector<8xf32>) -> vector<8xf32> {
    %0 = math.log %arg0 : vector<8xf32>
    return %0 : vector<8xf32>
  }
  func.func @log_scalable_vector(%arg0: vector<[8]xf32>) -> vector<[8]xf32> {
    %0 = math.log %arg0 : vector<[8]xf32>
    return %0 : vector<[8]xf32>
  }
  func.func @log2_scalar(%arg0: f32) -> f32 {
    %0 = math.log2 %arg0 : f32
    return %0 : f32
  }
  func.func @log2_vector(%arg0: vector<8xf32>) -> vector<8xf32> {
    %0 = math.log2 %arg0 : vector<8xf32>
    return %0 : vector<8xf32>
  }
  func.func @log2_scalable_vector(%arg0: vector<[8]xf32>) -> vector<[8]xf32> {
    %0 = math.log2 %arg0 : vector<[8]xf32>
    return %0 : vector<[8]xf32>
  }
  func.func @log1p_scalar(%arg0: f32) -> f32 {
    %0 = math.log1p %arg0 : f32
    return %0 : f32
  }
  func.func @log1p_vector(%arg0: vector<8xf32>) -> vector<8xf32> {
    %0 = math.log1p %arg0 : vector<8xf32>
    return %0 : vector<8xf32>
  }
  func.func @log1p_scalable_vector(%arg0: vector<[8]xf32>) -> vector<[8]xf32> {
    %0 = math.log1p %arg0 : vector<[8]xf32>
    return %0 : vector<[8]xf32>
  }
  func.func @tanh_scalar(%arg0: f32) -> f32 {
    %0 = math.tanh %arg0 : f32
    return %0 : f32
  }
  func.func @tanh_vector(%arg0: vector<8xf32>) -> vector<8xf32> {
    %0 = math.tanh %arg0 : vector<8xf32>
    return %0 : vector<8xf32>
  }
  func.func @tanh_scalable_vector(%arg0: vector<[8]xf32>) -> vector<[8]xf32> {
    %0 = math.tanh %arg0 : vector<[8]xf32>
    return %0 : vector<[8]xf32>
  }
  func.func @rsqrt_scalar(%arg0: f32) -> f32 {
    %0 = math.rsqrt %arg0 : f32
    return %0 : f32
  }
  func.func @rsqrt_vector_8xf32(%arg0: vector<8xf32>) -> vector<8xf32> {
    %0 = math.rsqrt %arg0 : vector<8xf32>
    return %0 : vector<8xf32>
  }
  func.func @rsqrt_vector_5xf32(%arg0: vector<5xf32>) -> vector<5xf32> {
    %0 = math.rsqrt %arg0 : vector<5xf32>
    return %0 : vector<5xf32>
  }
  func.func @rsqrt_vector_16xf32(%arg0: vector<16xf32>) -> vector<16xf32> {
    %0 = math.rsqrt %arg0 : vector<16xf32>
    return %0 : vector<16xf32>
  }
  func.func @rsqrt_vector_2x8xf32(%arg0: vector<2x8xf32>) -> vector<2x8xf32> {
    %0 = math.rsqrt %arg0 : vector<2x8xf32>
    return %0 : vector<2x8xf32>
  }
  func.func @rsqrt_vector_2x16xf32(%arg0: vector<2x16xf32>) -> vector<2x16xf32> {
    %0 = math.rsqrt %arg0 : vector<2x16xf32>
    return %0 : vector<2x16xf32>
  }
  func.func @atan_scalar(%arg0: f32) -> f32 {
    %0 = math.atan %arg0 : f32
    return %0 : f32
  }
  func.func @atan2_scalar(%arg0: f16, %arg1: f16) -> f16 {
    %0 = math.atan2 %arg0, %arg1 : f16
    return %0 : f16
  }
  func.func @cbrt_vector(%arg0: vector<4xf32>) -> vector<4xf32> {
    %0 = math.cbrt %arg0 : vector<4xf32>
    return %0 : vector<4xf32>
  }
  func.func @math_f16(%arg0: vector<4xf16>) -> vector<4xf16> {
    %0 = math.atan %arg0 : vector<4xf16>
    %1 = math.atan2 %0, %arg0 : vector<4xf16>
    %2 = math.tanh %1 : vector<4xf16>
    %3 = math.log %2 : vector<4xf16>
    %4 = math.log2 %3 : vector<4xf16>
    %5 = math.log1p %4 : vector<4xf16>
    %6 = math.erf %5 : vector<4xf16>
    %7 = math.exp %6 : vector<4xf16>
    %8 = math.expm1 %7 : vector<4xf16>
    %9 = math.cbrt %8 : vector<4xf16>
    %10 = math.sin %9 : vector<4xf16>
    %11 = math.cos %10 : vector<4xf16>
    return %11 : vector<4xf16>
  }
  func.func @math_zero_rank(%arg0: vector<f16>) -> vector<f16> {
    %0 = math.atan %arg0 : vector<f16>
    %1 = math.atan2 %0, %arg0 : vector<f16>
    %2 = math.tanh %1 : vector<f16>
    %3 = math.log %2 : vector<f16>
    %4 = math.log2 %3 : vector<f16>
    %5 = math.log1p %4 : vector<f16>
    %6 = math.erf %5 : vector<f16>
    %7 = math.exp %6 : vector<f16>
    %8 = math.expm1 %7 : vector<f16>
    %9 = math.cbrt %8 : vector<f16>
    %10 = math.sin %9 : vector<f16>
    %11 = math.cos %10 : vector<f16>
    return %11 : vector<f16>
  }
  func.func @rsqrt_f16(%arg0: vector<2x8xf16>) -> vector<2x8xf16> {
    %0 = math.rsqrt %arg0 : vector<2x8xf16>
    return %0 : vector<2x8xf16>
  }
}

