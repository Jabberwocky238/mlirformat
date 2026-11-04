module {
  func.func @ops(%arg0: f32, %arg1: f32, %arg2: i32, %arg3: i32, %arg4: f64) {
    %0 = math.exp %arg0 : f32
    %1 = math.exp2 %arg0 : f32
    %2 = math.sqrt %arg0 : f32
    %3 = math.sqrt %arg4 : f64
    return
  }
}

// -----
module {
  func.func @absi(%arg0: i32) -> i32 {
    %0 = math.absi %arg0 : i32
    return %0 : i32
  }
}

// -----
module {
  func.func @absi_0dvector(%arg0: vector<i32>) {
    %0 = math.absi %arg0 : vector<i32>
    return
  }
}

// -----
module {
  func.func @log1p(%arg0: f32) {
    %0 = math.log1p %arg0 : f32
    return
  }
}

// -----
module {
  func.func @log1p_fmf(%arg0: f32) {
    %0 = math.log1p %arg0 fastmath<fast> : f32
    return
  }
}

// -----
module {
  func.func @log1p_2dvector(%arg0: vector<4x3xf32>) {
    %0 = math.log1p %arg0 : vector<4x3xf32>
    return
  }
}

// -----
module {
  func.func @log1p_2dvector_fmf(%arg0: vector<4x3xf32>) {
    %0 = math.log1p %arg0 fastmath<fast> : vector<4x3xf32>
    return
  }
}

// -----
module {
  func.func @log1p_scalable_vector(%arg0: vector<[4]xf32>) -> vector<[4]xf32> {
    %0 = math.log1p %arg0 : vector<[4]xf32>
    return %0 : vector<[4]xf32>
  }
}

// -----
module {
  func.func @log1p_0dvector(%arg0: vector<f32>) {
    %0 = math.log1p %arg0 : vector<f32>
    return
  }
}

// -----
module {
  func.func @expm1(%arg0: f32) {
    %0 = math.expm1 %arg0 : f32
    return
  }
}

// -----
module {
  func.func @expm1_fmf(%arg0: f32) {
    %0 = math.expm1 %arg0 fastmath<fast> : f32
    return
  }
}

// -----
module {
  func.func @expm1_vector(%arg0: vector<4xf32>) {
    %0 = math.expm1 %arg0 : vector<4xf32>
    return
  }
}

// -----
module {
  func.func @expm1_scalable_vector(%arg0: vector<[4]xf32>) -> vector<[4]xf32> {
    %0 = math.expm1 %arg0 : vector<[4]xf32>
    return %0 : vector<[4]xf32>
  }
}

// -----
module {
  func.func @expm1_vector_fmf(%arg0: vector<4xf32>) {
    %0 = math.expm1 %arg0 fastmath<fast> : vector<4xf32>
    return
  }
}

// -----
module {
  func.func @expm1_0dvector(%arg0: vector<f32>) {
    %0 = math.expm1 %arg0 : vector<f32>
    return
  }
}

// -----
module {
  func.func @rsqrt(%arg0: f32) {
    %0 = math.rsqrt %arg0 : f32
    return
  }
}

// -----
module {
  func.func @rsqrt_0dvector(%arg0: vector<f32>) {
    %0 = math.rsqrt %arg0 : vector<f32>
    return
  }
}

// -----
module {
  func.func @trigonometrics(%arg0: f32) {
    %0 = math.sin %arg0 : f32
    %1 = math.cos %arg0 : f32
    %2 = math.tan %arg0 : f32
    return
  }
}

// -----
module {
  func.func @sincos(%arg0: f32) {
    %sin, %cos = math.sincos %arg0 : f32
    return
  }
}

// -----
module {
  func.func @inverse_trigonometrics(%arg0: f32) {
    %0 = math.asin %arg0 : f32
    %1 = math.acos %arg0 : f32
    %2 = math.atan %arg0 : f32
    return
  }
}

// -----
module {
  func.func @atan2(%arg0: f32, %arg1: f32) {
    %0 = math.atan2 %arg0, %arg1 : f32
    return
  }
}

// -----
module {
  func.func @inverse_trigonometrics_vector(%arg0: vector<4xf32>) {
    %0 = math.asin %arg0 : vector<4xf32>
    %1 = math.acos %arg0 : vector<4xf32>
    %2 = math.atan %arg0 : vector<4xf32>
    return
  }
}

// -----
module {
  func.func @atan2_vector(%arg0: vector<4xf32>, %arg1: vector<4xf32>) {
    %0 = math.atan2 %arg0, %arg1 : vector<4xf32>
    return
  }
}

// -----
module {
  func.func @inverse_trigonometrics_fmf(%arg0: f32) {
    %0 = math.asin %arg0 fastmath<fast> : f32
    %1 = math.acos %arg0 fastmath<fast> : f32
    %2 = math.atan %arg0 fastmath<fast> : f32
    return
  }
}

// -----
module {
  func.func @atan2_fmf(%arg0: f32, %arg1: f32) {
    %0 = math.atan2 %arg0, %arg1 fastmath<fast> : f32
    return
  }
}

// -----
module {
  func.func @hyperbolics(%arg0: f32) {
    %0 = math.sinh %arg0 : f32
    %1 = math.cosh %arg0 : f32
    %2 = math.tanh %arg0 : f32
    return
  }
}

// -----
module {
  func.func @ctlz(%arg0: i32) {
    %0 = math.ctlz %arg0 : i32
    return
  }
  func.func @ctlz_0dvector(%arg0: vector<i32>) {
    %0 = math.ctlz %arg0 : vector<i32>
    return
  }
}

// -----
module {
  func.func @cttz(%arg0: i32) {
    %0 = math.cttz %arg0 : i32
    return
  }
}

// -----
module {
  func.func @cttz_0dvector(%arg0: vector<i32>) {
    %0 = math.cttz %arg0 : vector<i32>
    return
  }
}

// -----
module {
  func.func @cttz_vec(%arg0: vector<4xi32>) {
    %0 = math.cttz %arg0 : vector<4xi32>
    return
  }
}

// -----
module {
  func.func @cttz_scalable_vec(%arg0: vector<[4]xi32>) -> vector<[4]xi32> {
    %0 = math.cttz %arg0 : vector<[4]xi32>
    return %0 : vector<[4]xi32>
  }
}

// -----
module {
  func.func @ctpop(%arg0: i32) {
    %0 = math.ctpop %arg0 : i32
    return
  }
}

// -----
module {
  func.func @ctpop_vector(%arg0: vector<3xi32>) {
    %0 = math.ctpop %arg0 : vector<3xi32>
    return
  }
}

// -----
module {
  func.func @ctpop_scalable_vector(%arg0: vector<[4]xi32>) -> vector<[4]xi32> {
    %0 = math.ctpop %arg0 : vector<[4]xi32>
    return %0 : vector<[4]xi32>
  }
}

// -----
module {
  func.func @isnan_double(%arg0: f64) {
    %0 = math.isnan %arg0 : f64
    return
  }
}

// -----
module {
  func.func @isnan_0dvector(%arg0: vector<f32>) {
    %0 = math.isnan %arg0 : vector<f32>
    return
  }
}

// -----
module {
  func.func @isfinite_double(%arg0: f64) {
    %0 = math.isfinite %arg0 : f64
    return
  }
}

// -----
module {
  func.func @isfinite_0dvector(%arg0: vector<f32>) {
    %0 = math.isfinite %arg0 : vector<f32>
    return
  }
}

// -----
module {
  func.func @rsqrt_double(%arg0: f64) {
    %0 = math.rsqrt %arg0 : f64
    return
  }
}

// -----
module {
  func.func @rsqrt_double_fmf(%arg0: f64) {
    %0 = math.rsqrt %arg0 fastmath<fast> : f64
    return
  }
}

// -----
module {
  func.func @rsqrt_vector(%arg0: vector<4xf32>) {
    %0 = math.rsqrt %arg0 : vector<4xf32>
    return
  }
}

// -----
module {
  func.func @rsqrt_scalable_vector(%arg0: vector<[4]xf32>) -> vector<[4]xf32> {
    %0 = math.rsqrt %arg0 : vector<[4]xf32>
    return %0 : vector<[4]xf32>
  }
}

// -----
module {
  func.func @rsqrt_vector_fmf(%arg0: vector<4xf32>) {
    %0 = math.rsqrt %arg0 fastmath<fast> : vector<4xf32>
    return
  }
}

// -----
module {
  func.func @rsqrt_scalable_vector_fmf(%arg0: vector<[4]xf32>) -> vector<[4]xf32> {
    %0 = math.rsqrt %arg0 fastmath<fast> : vector<[4]xf32>
    return %0 : vector<[4]xf32>
  }
}

// -----
module {
  func.func @rsqrt_multidim_vector(%arg0: vector<4x3xf32>) {
    %0 = math.rsqrt %arg0 : vector<4x3xf32>
    return
  }
}

// -----
module {
  func.func @rsqrt_multidim_scalable_vector(%arg0: vector<4x[4]xf32>) -> vector<4x[4]xf32> {
    %0 = math.rsqrt %arg0 : vector<4x[4]xf32>
    return %0 : vector<4x[4]xf32>
  }
}

// -----
module {
  func.func @fpowi(%arg0: f64, %arg1: i32) {
    %0 = math.fpowi %arg0, %arg1 : f64, i32
    return
  }
}

// -----
module {
  func.func @powf(%arg0: f64) {
    %0 = math.powf %arg0, %arg0 : f64
    return
  }
}

// -----
module {
  func.func @round(%arg0: f32) {
    %0 = math.round %arg0 : f32
    return
  }
}

// -----
module {
  func.func @roundeven(%arg0: f32) {
    %0 = math.roundeven %arg0 : f32
    return
  }
}

// -----
module {
  func.func @trunc(%arg0: f32) {
    %0 = math.trunc %arg0 : f32
    return
  }
}

// -----
module {
  func.func @fastmath(%arg0: f32, %arg1: vector<4xf32>) {
    %0 = math.trunc %arg0 fastmath<fast> : f32
    %1 = math.powf %arg0, %arg0 fastmath<afn> : f32
    %2 = math.sqrt %arg0 : f32
    %3 = math.fma %arg0, %arg0, %arg0 fastmath<fast> : f32
    return
  }
}

// -----
module {
  func.func @unsupported_fp_type(%arg0: f4E2M1FN, %arg1: f4E2M1FN, %arg2: f4E2M1FN) {
    %0 = math.absf %arg0 : f4E2M1FN
    %1 = math.cos %arg0 : f4E2M1FN
    %2 = math.fma %arg1, %arg1, %arg2 : f4E2M1FN
    return
  }
}

