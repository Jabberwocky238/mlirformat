module attributes {spirv.target_env = #spirv.target_env<#spirv.vce<v1.0, [Kernel], []>, #spirv.resource_limits<>>} {
  func.func @float32_unary_scalar(%arg0: f32) {
    %0 = math.atan %arg0 : f32
    %1 = math.cos %arg0 : f32
    %2 = math.exp %arg0 : f32
    %3 = math.expm1 %arg0 : f32
    %4 = math.log %arg0 : f32
    %5 = math.log1p %arg0 : f32
    %6 = math.log2 %arg0 : f32
    %7 = math.log10 %arg0 : f32
    %8 = math.roundeven %arg0 : f32
    %9 = math.rsqrt %arg0 : f32
    %10 = math.sqrt %arg0 : f32
    %11 = math.tanh %arg0 : f32
    %12 = math.sin %arg0 : f32
    %13 = math.absf %arg0 : f32
    %14 = math.ceil %arg0 : f32
    %15 = math.floor %arg0 : f32
    %16 = math.erf %arg0 : f32
    %17 = math.round %arg0 : f32
    %18 = math.tan %arg0 : f32
    %19 = math.asin %arg0 : f32
    %20 = math.acos %arg0 : f32
    %21 = math.sinh %arg0 : f32
    %22 = math.cosh %arg0 : f32
    %23 = math.asinh %arg0 : f32
    %24 = math.acosh %arg0 : f32
    %25 = math.atanh %arg0 : f32
    return
  }
  func.func @float32_unary_vector(%arg0: vector<3xf32>) {
    %0 = math.atan %arg0 : vector<3xf32>
    %1 = math.cos %arg0 : vector<3xf32>
    %2 = math.exp %arg0 : vector<3xf32>
    %3 = math.expm1 %arg0 : vector<3xf32>
    %4 = math.log %arg0 : vector<3xf32>
    %5 = math.log1p %arg0 : vector<3xf32>
    %6 = math.log2 %arg0 : vector<3xf32>
    %7 = math.log10 %arg0 : vector<3xf32>
    %8 = math.roundeven %arg0 : vector<3xf32>
    %9 = math.rsqrt %arg0 : vector<3xf32>
    %10 = math.sqrt %arg0 : vector<3xf32>
    %11 = math.tanh %arg0 : vector<3xf32>
    %12 = math.sin %arg0 : vector<3xf32>
    %13 = math.tan %arg0 : vector<3xf32>
    %14 = math.asin %arg0 : vector<3xf32>
    %15 = math.acos %arg0 : vector<3xf32>
    %16 = math.sinh %arg0 : vector<3xf32>
    %17 = math.cosh %arg0 : vector<3xf32>
    %18 = math.asinh %arg0 : vector<3xf32>
    %19 = math.acosh %arg0 : vector<3xf32>
    %20 = math.atanh %arg0 : vector<3xf32>
    return
  }
  func.func @float32_binary_scalar(%arg0: f32, %arg1: f32) {
    %0 = math.atan2 %arg0, %arg1 : f32
    %1 = math.powf %arg0, %arg1 : f32
    return
  }
  func.func @float32_binary_vector(%arg0: vector<4xf32>, %arg1: vector<4xf32>) {
    %0 = math.atan2 %arg0, %arg1 : vector<4xf32>
    %1 = math.powf %arg0, %arg1 : vector<4xf32>
    return
  }
  func.func @float32_ternary_scalar(%arg0: f32, %arg1: f32, %arg2: f32) {
    %0 = math.fma %arg0, %arg1, %arg2 : f32
    return
  }
  func.func @float32_ternary_vector(%arg0: vector<4xf32>, %arg1: vector<4xf32>, %arg2: vector<4xf32>) {
    %0 = math.fma %arg0, %arg1, %arg2 : vector<4xf32>
    return
  }
  func.func @int_unary(%arg0: i32) {
    %0 = math.absi %arg0 : i32
    return
  }
}

// -----
module attributes {spirv.target_env = #spirv.target_env<#spirv.vce<v1.0, [Shader], []>, #spirv.resource_limits<>>} {
  func.func @vector_2d(%arg0: vector<2x2xf32>) {
    %0 = math.atan %arg0 : vector<2x2xf32>
    %1 = math.cos %arg0 : vector<2x2xf32>
    %2 = math.exp %arg0 : vector<2x2xf32>
    %3 = math.absf %arg0 : vector<2x2xf32>
    %4 = math.ceil %arg0 : vector<2x2xf32>
    %5 = math.floor %arg0 : vector<2x2xf32>
    %6 = math.powf %arg0, %arg0 : vector<2x2xf32>
    return
  }
  func.func @tensor_1d(%arg0: tensor<2xf32>) {
    %0 = math.atan %arg0 : tensor<2xf32>
    %1 = math.cos %arg0 : tensor<2xf32>
    %2 = math.exp %arg0 : tensor<2xf32>
    %3 = math.absf %arg0 : tensor<2xf32>
    %4 = math.ceil %arg0 : tensor<2xf32>
    %5 = math.floor %arg0 : tensor<2xf32>
    %6 = math.powf %arg0, %arg0 : tensor<2xf32>
    return
  }
}

