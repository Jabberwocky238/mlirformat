module {
  func.func @test_dpp(%arg0: i32, %arg1: i32) -> i32 {
    %0 = amdgpu.dpp %arg0 %arg1  row_shl(1 : i32) {row_mask = 10 : i32} : i32
    return %0 : i32
  }
  func.func @quad_dpp(%arg0: i32, %arg1: i32) -> i32 {
    %0 = amdgpu.dpp %arg0 %arg1  quad_perm([1, 0, 1, 2]) {bank_mask = 1 : i32, bound_ctrl = true, row_mask = 1 : i32} : i32
    return %0 : i32
  }
  func.func @wave_shr_dpp(%arg0: i32, %arg1: i32) -> i32 {
    %0 = amdgpu.dpp %arg0 %arg1  wave_shr {bank_mask = 1 : i32, bound_ctrl = true, row_mask = 10 : i32} : i32
    return %0 : i32
  }
  func.func @row_half_mirror_update_dpp(%arg0: i32, %arg1: i32) -> i32 {
    %0 = amdgpu.dpp %arg0 %arg1  row_half_mirror {bank_mask = 1 : i32} : i32
    return %0 : i32
  }
  func.func @wave_rol_update_dpp(%arg0: i32, %arg1: i32) -> i32 {
    %0 = amdgpu.dpp %arg0 %arg1  wave_rol {bank_mask = 1 : i32, row_mask = 10 : i32} : i32
    return %0 : i32
  }
  func.func @row_bcast_dpp_f32(%arg0: f32, %arg1: f32) -> f32 {
    %0 = amdgpu.dpp %arg0 %arg1  row_bcast_15 {bound_ctrl = true} : f32
    return %0 : f32
  }
  func.func @test_dpp_f32(%arg0: f32, %arg1: f32) -> f32 {
    %0 = amdgpu.dpp %arg0 %arg1  row_mirror {bank_mask = 4 : i32, bound_ctrl = true, row_mask = 1 : i32} : f32
    return %0 : f32
  }
  func.func @quad_perm_update_dpp_f32(%arg0: f32, %arg1: f32) -> f32 {
    %0 = amdgpu.dpp %arg0 %arg1  quad_perm([0, 2, 1, 1]) {bank_mask = 1 : i32} : f32
    return %0 : f32
  }
  func.func @quad_perm_dpp(%arg0: i64, %arg1: i64) -> i64 {
    %0 = amdgpu.dpp %arg0 %arg1  quad_perm([0, 2, 1, 1]) : i64
    return %0 : i64
  }
  func.func @row_bcast_dpp(%arg0: f64, %arg1: f64) -> f64 {
    %0 = amdgpu.dpp %arg0 %arg1  row_bcast_31 {bank_mask = 1 : i32, row_mask = 4 : i32} : f64
    return %0 : f64
  }
  func.func @test_dpp_f16(%arg0: f16, %arg1: f16) -> f16 {
    %0 = amdgpu.dpp %arg0 %arg1  row_shr(1 : i32) {bank_mask = 3 : i32} : f16
    return %0 : f16
  }
  func.func @row_shl_dpp_i16(%arg0: i16, %arg1: i16) -> i16 {
    %0 = amdgpu.dpp %arg0 %arg1  row_ror(10 : i32) {bank_mask = 1 : i32, row_mask = 10 : i32} : i16
    return %0 : i16
  }
  func.func @row_bcast_update_dpp_f16(%arg0: f16, %arg1: f16) -> f16 {
    %0 = amdgpu.dpp %arg0 %arg1  row_bcast_15 {bound_ctrl = true} : f16
    return %0 : f16
  }
}

