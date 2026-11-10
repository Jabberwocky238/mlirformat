module {
  func.func @dot_fp8_fp8(%arg0: vector<4xf8E4M3FN>, %arg1: vector<4xf8E4M3FN>, %arg2: f32) -> f32 {
    %0 = amdgpu.dot %arg0 * %arg1 + %arg2 : vector<4xf8E4M3FN>, vector<4xf8E4M3FN>, f32
    return %0 : f32
  }
  func.func @dot_fp8_bf8(%arg0: vector<4xf8E4M3FN>, %arg1: vector<4xf8E5M2>, %arg2: f32) -> f32 {
    %0 = amdgpu.dot %arg0 * %arg1 + %arg2 : vector<4xf8E4M3FN>, vector<4xf8E5M2>, f32
    return %0 : f32
  }
  func.func @dot_bf8_fp8(%arg0: vector<4xf8E5M2>, %arg1: vector<4xf8E4M3FN>, %arg2: f32) -> f32 {
    %0 = amdgpu.dot %arg0 * %arg1 + %arg2 : vector<4xf8E5M2>, vector<4xf8E4M3FN>, f32
    return %0 : f32
  }
  func.func @dot_bf8_bf8(%arg0: vector<4xf8E5M2>, %arg1: vector<4xf8E5M2>, %arg2: f32) -> f32 {
    %0 = amdgpu.dot %arg0 * %arg1 + %arg2 : vector<4xf8E5M2>, vector<4xf8E5M2>, f32
    return %0 : f32
  }
}

