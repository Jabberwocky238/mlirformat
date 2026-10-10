module {
  func.func @atan(%arg0: f32, %arg1: vector<4xf32>, %arg2: tensor<4x4x?xf32>) {
    %0 = math.atan %arg0 : f32
    %1 = math.atan %arg1 : vector<4xf32>
    %2 = math.atan %arg2 : tensor<4x4x?xf32>
    return
  }
  func.func @atan2(%arg0: f32, %arg1: vector<4xf32>, %arg2: tensor<4x4x?xf32>) {
    %0 = math.atan2 %arg0, %arg0 : f32
    %1 = math.atan2 %arg1, %arg1 : vector<4xf32>
    %2 = math.atan2 %arg2, %arg2 : tensor<4x4x?xf32>
    return
  }
  func.func @cbrt(%arg0: f32, %arg1: vector<4xf32>, %arg2: tensor<4x4x?xf32>) {
    %0 = math.cbrt %arg0 : f32
    %1 = math.cbrt %arg1 : vector<4xf32>
    %2 = math.cbrt %arg2 : tensor<4x4x?xf32>
    return
  }
  func.func @cos(%arg0: f32, %arg1: vector<4xf32>, %arg2: tensor<4x4x?xf32>) {
    %0 = math.cos %arg0 : f32
    %1 = math.cos %arg1 : vector<4xf32>
    %2 = math.cos %arg2 : tensor<4x4x?xf32>
    return
  }
  func.func @sin(%arg0: f32, %arg1: vector<4xf32>, %arg2: tensor<4x4x?xf32>) {
    %0 = math.sin %arg0 : f32
    %1 = math.sin %arg1 : vector<4xf32>
    %2 = math.sin %arg2 : tensor<4x4x?xf32>
    return
  }
  func.func @sincos(%arg0: f32, %arg1: vector<4xf32>, %arg2: tensor<4x4x?xf32>) {
    %sin, %cos = math.sincos %arg0 : f32
    %sin_0, %cos_1 = math.sincos %arg1 : vector<4xf32>
    %sin_2, %cos_3 = math.sincos %arg2 : tensor<4x4x?xf32>
    return
  }
  func.func @erf(%arg0: f32, %arg1: vector<4xf32>, %arg2: tensor<4x4x?xf32>) {
    %0 = math.erf %arg0 : f32
    %1 = math.erf %arg1 : vector<4xf32>
    %2 = math.erf %arg2 : tensor<4x4x?xf32>
    return
  }
  func.func @exp(%arg0: f32, %arg1: vector<4xf32>, %arg2: tensor<4x4x?xf32>) {
    %0 = math.exp %arg0 : f32
    %1 = math.exp %arg1 : vector<4xf32>
    %2 = math.exp %arg2 : tensor<4x4x?xf32>
    return
  }
  func.func @exp2(%arg0: f32, %arg1: vector<4xf32>, %arg2: tensor<4x4x?xf32>) {
    %0 = math.exp2 %arg0 : f32
    %1 = math.exp2 %arg1 : vector<4xf32>
    %2 = math.exp2 %arg2 : tensor<4x4x?xf32>
    return
  }
  func.func @expm1(%arg0: f32, %arg1: vector<4xf32>, %arg2: tensor<4x4x?xf32>) {
    %0 = math.expm1 %arg0 : f32
    %1 = math.expm1 %arg1 : vector<4xf32>
    %2 = math.expm1 %arg2 : tensor<4x4x?xf32>
    return
  }
  func.func @log(%arg0: f32, %arg1: vector<4xf32>, %arg2: tensor<4x4x?xf32>) {
    %0 = math.log %arg0 : f32
    %1 = math.log %arg1 : vector<4xf32>
    %2 = math.log %arg2 : tensor<4x4x?xf32>
    return
  }
  func.func @log10(%arg0: f32, %arg1: vector<4xf32>, %arg2: tensor<4x4x?xf32>) {
    %0 = math.log10 %arg0 : f32
    %1 = math.log10 %arg1 : vector<4xf32>
    %2 = math.log10 %arg2 : tensor<4x4x?xf32>
    return
  }
  func.func @log1p(%arg0: f32, %arg1: vector<4xf32>, %arg2: tensor<4x4x?xf32>) {
    %0 = math.log1p %arg0 : f32
    %1 = math.log1p %arg1 : vector<4xf32>
    %2 = math.log1p %arg2 : tensor<4x4x?xf32>
    return
  }
  func.func @log2(%arg0: f32, %arg1: vector<4xf32>, %arg2: tensor<4x4x?xf32>) {
    %0 = math.log2 %arg0 : f32
    %1 = math.log2 %arg1 : vector<4xf32>
    %2 = math.log2 %arg2 : tensor<4x4x?xf32>
    return
  }
  func.func @powf(%arg0: f32, %arg1: vector<4xf32>, %arg2: tensor<4x4x?xf32>) {
    %0 = math.powf %arg0, %arg0 : f32
    %1 = math.powf %arg1, %arg1 : vector<4xf32>
    %2 = math.powf %arg2, %arg2 : tensor<4x4x?xf32>
    return
  }
  func.func @fpowi(%arg0: f32, %arg1: i32, %arg2: vector<4xf64>, %arg3: vector<4xi16>, %arg4: tensor<4x3x?xf16>, %arg5: tensor<4x3x?xi64>) {
    %0 = math.fpowi %arg0, %arg1 : f32, i32
    %1 = math.fpowi %arg2, %arg3 : vector<4xf64>, vector<4xi16>
    %2 = math.fpowi %arg4, %arg5 : tensor<4x3x?xf16>, tensor<4x3x?xi64>
    return
  }
  func.func @rsqrt(%arg0: f32, %arg1: vector<4xf32>, %arg2: tensor<4x4x?xf32>) {
    %0 = math.rsqrt %arg0 : f32
    %1 = math.rsqrt %arg1 : vector<4xf32>
    %2 = math.rsqrt %arg2 : tensor<4x4x?xf32>
    return
  }
  func.func @sqrt(%arg0: f32, %arg1: vector<4xf32>, %arg2: tensor<4x4x?xf32>) {
    %0 = math.sqrt %arg0 : f32
    %1 = math.sqrt %arg1 : vector<4xf32>
    %2 = math.sqrt %arg2 : tensor<4x4x?xf32>
    return
  }
  func.func @tan(%arg0: f32, %arg1: vector<4xf32>, %arg2: tensor<4x4x?xf32>) {
    %0 = math.tan %arg0 : f32
    %1 = math.tan %arg1 : vector<4xf32>
    %2 = math.tan %arg2 : tensor<4x4x?xf32>
    return
  }
  func.func @tanh(%arg0: f32, %arg1: vector<4xf32>, %arg2: tensor<4x4x?xf32>) {
    %0 = math.tanh %arg0 : f32
    %1 = math.tanh %arg1 : vector<4xf32>
    %2 = math.tanh %arg2 : tensor<4x4x?xf32>
    return
  }
  func.func @round(%arg0: f32, %arg1: vector<4xf32>, %arg2: tensor<4x4x?xf32>) {
    %0 = math.round %arg0 : f32
    %1 = math.round %arg1 : vector<4xf32>
    %2 = math.round %arg2 : tensor<4x4x?xf32>
    return
  }
  func.func @roundeven(%arg0: f32, %arg1: vector<4xf32>, %arg2: tensor<4x4x?xf32>) {
    %0 = math.roundeven %arg0 : f32
    %1 = math.roundeven %arg1 : vector<4xf32>
    %2 = math.roundeven %arg2 : tensor<4x4x?xf32>
    return
  }
  func.func @ipowi(%arg0: i32, %arg1: vector<4xi32>, %arg2: tensor<4x4x?xi32>) {
    %0 = math.ipowi %arg0, %arg0 : i32
    %1 = math.ipowi %arg1, %arg1 : vector<4xi32>
    %2 = math.ipowi %arg2, %arg2 : tensor<4x4x?xi32>
    return
  }
  func.func @trunc(%arg0: f32, %arg1: vector<4xf32>, %arg2: tensor<4x4x?xf32>) {
    %0 = math.trunc %arg0 : f32
    %1 = math.trunc %arg1 : vector<4xf32>
    %2 = math.trunc %arg2 : tensor<4x4x?xf32>
    return
  }
  func.func @fastmath(%arg0: f32, %arg1: i32, %arg2: vector<4xf32>, %arg3: tensor<4x4x?xf32>) {
    %0 = math.trunc %arg0 fastmath<fast> : f32
    %1 = math.powf %arg2, %arg2 fastmath<fast> : vector<4xf32>
    %2 = math.fma %arg3, %arg3, %arg3 : tensor<4x4x?xf32>
    %3 = math.absf %arg0 fastmath<ninf> : f32
    %4 = math.fpowi %arg0, %arg1 fastmath<fast> : f32, i32
    return
  }
  func.func @fpclassify(%arg0: f32, %arg1: f64, %arg2: vector<4xf32>, %arg3: tensor<4x?xf32>) {
    %0 = math.isfinite %arg0 : f32
    %1 = math.isfinite %arg1 : f64
    %2 = math.isfinite %arg2 : vector<4xf32>
    %3 = math.isfinite %arg3 : tensor<4x?xf32>
    %4 = math.isinf %arg0 : f32
    %5 = math.isinf %arg1 : f64
    %6 = math.isinf %arg2 : vector<4xf32>
    %7 = math.isinf %arg3 : tensor<4x?xf32>
    %8 = math.isnan %arg0 : f32
    %9 = math.isnan %arg1 : f64
    %10 = math.isnan %arg2 : vector<4xf32>
    %11 = math.isnan %arg3 : tensor<4x?xf32>
    %12 = math.isnormal %arg0 : f32
    %13 = math.isnormal %arg1 : f64
    %14 = math.isnormal %arg2 : vector<4xf32>
    %15 = math.isnormal %arg3 : tensor<4x?xf32>
    return
  }
  func.func @clampf(%arg0: vector<3x4xf32>, %arg1: vector<3x4xf32>, %arg2: vector<3x4xf32>, %arg3: f32, %arg4: f32, %arg5: f32, %arg6: tensor<?xf80>, %arg7: tensor<?xf80>, %arg8: tensor<?xf80>) {
    %0 = math.clampf %arg0 to [%arg1, %arg2] fastmath<fast> : vector<3x4xf32>
    %1 = math.clampf %arg3 to [%arg4, %arg5] : f32
    %2 = math.clampf %arg6 to [%arg7, %arg8] : tensor<?xf80>
    return
  }
}

