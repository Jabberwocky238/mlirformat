module attributes {spirv.target_env = #spirv.target_env<#spirv.vce<v1.0, [Shader], []>, #spirv.resource_limits<>>} {
  func.func @fpclassify(%arg0: f32, %arg1: vector<4xf32>) {
    %0 = math.isfinite %arg0 : f32
    %1 = math.isfinite %arg1 : vector<4xf32>
    %2 = math.isnan %arg0 : f32
    %3 = math.isnan %arg1 : vector<4xf32>
    %4 = math.isinf %arg0 : f32
    %5 = math.isinf %arg1 : vector<4xf32>
    %6 = math.isnormal %arg0 : f32
    %7 = math.isnormal %arg1 : vector<4xf32>
    return
  }
  func.func @ctpop(%arg0: i32, %arg1: vector<4xi32>) {
    %0 = math.ctpop %arg0 : i32
    %1 = math.ctpop %arg1 : vector<4xi32>
    return
  }
}

