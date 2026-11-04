module {
  func.func @ext_scalar(%arg0: f8E5M2FNUZ) -> f32 {
    %0 = amdgpu.ext_packed_fp8 %arg0[0] : f8E5M2FNUZ to f32
    return %0 : f32
  }
  func.func @ext_short_vec(%arg0: vector<2xf8E4M3FNUZ>) -> f32 {
    %0 = amdgpu.ext_packed_fp8 %arg0[1] : vector<2xf8E4M3FNUZ> to f32
    return %0 : f32
  }
  func.func @ext_full_vec(%arg0: vector<4xf8E4M3FNUZ>) -> f32 {
    %0 = amdgpu.ext_packed_fp8 %arg0[3] : vector<4xf8E4M3FNUZ> to f32
    return %0 : f32
  }
  func.func @ext_packed_2xfp8(%arg0: vector<2xf8E4M3FNUZ>) -> vector<2xf32> {
    %0 = amdgpu.ext_packed_fp8 %arg0[0] : vector<2xf8E4M3FNUZ> to vector<2xf32>
    return %0 : vector<2xf32>
  }
  func.func @ext_packed_4xfp8(%arg0: vector<4xf8E4M3FNUZ>) -> vector<2xf32> {
    %0 = amdgpu.ext_packed_fp8 %arg0[1] : vector<4xf8E4M3FNUZ> to vector<2xf32>
    return %0 : vector<2xf32>
  }
  func.func @packed_trunc(%arg0: f32) -> vector<4xf8E4M3FNUZ> {
    %0 = amdgpu.packed_trunc_2xfp8 %arg0, undef into undef[word 0] : f32 to vector<4xf8E4M3FNUZ>
    return %0 : vector<4xf8E4M3FNUZ>
  }
  func.func @packed_truncx2(%arg0: f32, %arg1: f32) -> vector<4xf8E4M3FNUZ> {
    %0 = amdgpu.packed_trunc_2xfp8 %arg0, %arg1 into undef[word 0] : f32 to vector<4xf8E4M3FNUZ>
    return %0 : vector<4xf8E4M3FNUZ>
  }
  func.func @packed_truncx2_into(%arg0: f32, %arg1: f32, %arg2: vector<4xf8E5M2FNUZ>) -> vector<4xf8E5M2FNUZ> {
    %0 = amdgpu.packed_trunc_2xfp8 %arg0, %arg1 into %arg2[word 1] : f32 to vector<4xf8E5M2FNUZ> into vector<4xf8E5M2FNUZ>
    return %0 : vector<4xf8E5M2FNUZ>
  }
  func.func @packed_stoch_round(%arg0: f32, %arg1: i32) -> vector<4xf8E4M3FNUZ> {
    %0 = amdgpu.packed_stoch_round_fp8 %arg0 + %arg1 into undef[0] : f32 to vector<4xf8E4M3FNUZ>
    return %0 : vector<4xf8E4M3FNUZ>
  }
  func.func @packed_stoch_round_into(%arg0: f32, %arg1: i32, %arg2: vector<4xf8E5M2FNUZ>) -> vector<4xf8E5M2FNUZ> {
    %0 = amdgpu.packed_stoch_round_fp8 %arg0 + %arg1 into %arg2[1] : f32 to vector<4xf8E5M2FNUZ> into vector<4xf8E5M2FNUZ>
    return %0 : vector<4xf8E5M2FNUZ>
  }
}

