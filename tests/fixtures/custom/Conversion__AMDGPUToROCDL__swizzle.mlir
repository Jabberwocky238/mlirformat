module {
  func.func @test_swizzle_i32(%arg0: i32) -> i32 {
    %0 = amdgpu.swizzle_bitmode %arg0 1 2 4 : i32
    return %0 : i32
  }
  func.func @test_swizzle_f32(%arg0: f32) -> f32 {
    %0 = amdgpu.swizzle_bitmode %arg0 1 2 4 : f32
    return %0 : f32
  }
  func.func @test_swizzle_f16(%arg0: f16) -> f16 {
    %0 = amdgpu.swizzle_bitmode %arg0 1 2 4 : f16
    return %0 : f16
  }
  func.func @test_swizzle_2xi32(%arg0: vector<2xi32>) -> vector<2xi32> {
    %0 = amdgpu.swizzle_bitmode %arg0 1 2 4 : vector<2xi32>
    return %0 : vector<2xi32>
  }
  func.func @test_swizzle_4xf16(%arg0: vector<4xf16>) -> vector<4xf16> {
    %0 = amdgpu.swizzle_bitmode %arg0 1 2 4 : vector<4xf16>
    return %0 : vector<4xf16>
  }
}

