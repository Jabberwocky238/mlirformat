module {
  func.func @test_permlane_var_i32(%arg0: i32, %arg1: i32) -> i32 {
    %0 = amdgpu.permlane_var %arg0, %arg1 : i32
    return %0 : i32
  }
  func.func @test_permlane_var_cross_i32(%arg0: i32, %arg1: i32) -> i32 {
    %0 = amdgpu.permlane_var %arg0, %arg1 {cross = true} : i32
    return %0 : i32
  }
  func.func @test_permlane_var_f32(%arg0: f32, %arg1: i32) -> f32 {
    %0 = amdgpu.permlane_var %arg0, %arg1 : f32
    return %0 : f32
  }
  func.func @test_permlane_var_f16(%arg0: f16, %arg1: i32) -> f16 {
    %0 = amdgpu.permlane_var %arg0, %arg1 : f16
    return %0 : f16
  }
  func.func @test_permlane_var_cross_f16(%arg0: f16, %arg1: i32) -> f16 {
    %0 = amdgpu.permlane_var %arg0, %arg1 {cross = true} : f16
    return %0 : f16
  }
  func.func @test_permlane_var_4xf16(%arg0: vector<4xf16>, %arg1: i32) -> vector<4xf16> {
    %0 = amdgpu.permlane_var %arg0, %arg1 : vector<4xf16>
    return %0 : vector<4xf16>
  }
  func.func @test_permlane_var_attrs(%arg0: i32, %arg1: i32) -> i32 {
    %0 = amdgpu.permlane_var %arg0, %arg1 {bound_ctrl = true, cross = true, fetch_inactive = true} : i32
    return %0 : i32
  }
}

