module {
  func.func @test_permlane16_i32(%arg0: i32) -> i32 {
    %0 = amdgpu.permlane_swap %arg0 16 : i32
    return %0 : i32
  }
  func.func @test_permlane16_i32_optional_attr(%arg0: i32) -> i32 {
    %0 = amdgpu.permlane_swap %arg0 16 {bound_ctrl = true, fetch_inactive = true} : i32
    return %0 : i32
  }
  func.func @test_permlane32_i32(%arg0: i32) -> i32 {
    %0 = amdgpu.permlane_swap %arg0 32 : i32
    return %0 : i32
  }
  func.func @test_permlane16_f32(%arg0: f32) -> f32 {
    %0 = amdgpu.permlane_swap %arg0 16 : f32
    return %0 : f32
  }
  func.func @test_permlane32_f32(%arg0: f32) -> f32 {
    %0 = amdgpu.permlane_swap %arg0 32 : f32
    return %0 : f32
  }
  func.func @test_permlane16_f16(%arg0: f16) -> f16 {
    %0 = amdgpu.permlane_swap %arg0 16 : f16
    return %0 : f16
  }
  func.func @test_permlane32_f16(%arg0: f16) -> f16 {
    %0 = amdgpu.permlane_swap %arg0 32 : f16
    return %0 : f16
  }
  func.func @test_permlane16_2xi32(%arg0: vector<2xi32>) -> vector<2xi32> {
    %0 = amdgpu.permlane_swap %arg0 16 : vector<2xi32>
    return %0 : vector<2xi32>
  }
  func.func @test_permlane32_2xi32(%arg0: vector<2xi32>) -> vector<2xi32> {
    %0 = amdgpu.permlane_swap %arg0 32 : vector<2xi32>
    return %0 : vector<2xi32>
  }
  func.func @test_permlane16_4xf16(%arg0: vector<4xf16>) -> vector<4xf16> {
    %0 = amdgpu.permlane_swap %arg0 16 : vector<4xf16>
    return %0 : vector<4xf16>
  }
  func.func @test_permlane32_4xf16(%arg0: vector<4xf16>) -> vector<4xf16> {
    %0 = amdgpu.permlane_swap %arg0 32 : vector<4xf16>
    return %0 : vector<4xf16>
  }
}

