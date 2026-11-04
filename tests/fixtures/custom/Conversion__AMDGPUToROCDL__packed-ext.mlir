module {
  func.func @scaled_ext_full_f8e4m3_f32(%arg0: vector<4xf8E4M3FN>, %arg1: f32) -> vector<2xf32> {
    %0 = amdgpu.scaled_ext_packed %arg0[0], %arg1 : vector<4xf8E4M3FN> to vector<2xf32>
    return %0 : vector<2xf32>
  }
  func.func @scaled_ext_full_f8e4m3_f16(%arg0: vector<4xf8E4M3FN>, %arg1: f32) -> vector<2xf16> {
    %0 = amdgpu.scaled_ext_packed %arg0[0], %arg1 : vector<4xf8E4M3FN> to vector<2xf16>
    return %0 : vector<2xf16>
  }
  func.func @scaled_ext_full_f8e4m3_bf16(%arg0: vector<4xf8E4M3FN>, %arg1: f32) -> vector<2xbf16> {
    %0 = amdgpu.scaled_ext_packed %arg0[0], %arg1 : vector<4xf8E4M3FN> to vector<2xbf16>
    return %0 : vector<2xbf16>
  }
  func.func @scaled_ext_half_f8e4m3_f32(%arg0: vector<2xf8E4M3FN>, %arg1: f32) -> vector<2xf32> {
    %0 = amdgpu.scaled_ext_packed %arg0[0], %arg1 : vector<2xf8E4M3FN> to vector<2xf32>
    return %0 : vector<2xf32>
  }
  func.func @scaled_ext_half_f8e4m3_f16(%arg0: vector<2xf8E4M3FN>, %arg1: f32) -> vector<2xf16> {
    %0 = amdgpu.scaled_ext_packed %arg0[0], %arg1 : vector<2xf8E4M3FN> to vector<2xf16>
    return %0 : vector<2xf16>
  }
  func.func @scaled_ext_half_f8e4m3_bf16(%arg0: vector<2xf8E4M3FN>, %arg1: f32) -> vector<2xbf16> {
    %0 = amdgpu.scaled_ext_packed %arg0[0], %arg1 : vector<2xf8E4M3FN> to vector<2xbf16>
    return %0 : vector<2xbf16>
  }
  func.func @scaled_ext_scalar_f8e4m3_f32(%arg0: vector<2xf8E4M3FN>, %arg1: f32) -> vector<2xf32> {
    %0 = amdgpu.scaled_ext_packed %arg0[0], %arg1 : vector<2xf8E4M3FN> to vector<2xf32>
    return %0 : vector<2xf32>
  }
  func.func @scaled_ext_scalar_f8e4m3_f16(%arg0: vector<2xf8E4M3FN>, %arg1: f32) -> vector<2xf16> {
    %0 = amdgpu.scaled_ext_packed %arg0[0], %arg1 : vector<2xf8E4M3FN> to vector<2xf16>
    return %0 : vector<2xf16>
  }
  func.func @scaled_ext_scalar_f8e4m3_bf16(%arg0: vector<2xf8E4M3FN>, %arg1: f32) -> vector<2xbf16> {
    %0 = amdgpu.scaled_ext_packed %arg0[0], %arg1 : vector<2xf8E4M3FN> to vector<2xbf16>
    return %0 : vector<2xbf16>
  }
  func.func @scaled_ext_full_f8e5m2_f32(%arg0: vector<4xf8E5M2>, %arg1: f32) -> vector<2xf32> {
    %0 = amdgpu.scaled_ext_packed %arg0[0], %arg1 : vector<4xf8E5M2> to vector<2xf32>
    return %0 : vector<2xf32>
  }
  func.func @scaled_ext_full_f8e5m2_f16(%arg0: vector<4xf8E5M2>, %arg1: f32) -> vector<2xf16> {
    %0 = amdgpu.scaled_ext_packed %arg0[0], %arg1 : vector<4xf8E5M2> to vector<2xf16>
    return %0 : vector<2xf16>
  }
  func.func @scaled_ext_full_f8e5m2_bf16(%arg0: vector<4xf8E5M2>, %arg1: f32) -> vector<2xbf16> {
    %0 = amdgpu.scaled_ext_packed %arg0[0], %arg1 : vector<4xf8E5M2> to vector<2xbf16>
    return %0 : vector<2xbf16>
  }
  func.func @scaled_ext_half_f8e5m2_f32(%arg0: vector<2xf8E5M2>, %arg1: f32) -> vector<2xf32> {
    %0 = amdgpu.scaled_ext_packed %arg0[0], %arg1 : vector<2xf8E5M2> to vector<2xf32>
    return %0 : vector<2xf32>
  }
  func.func @scaled_ext_half_f8e5m2_f16(%arg0: vector<2xf8E5M2>, %arg1: f32) -> vector<2xf16> {
    %0 = amdgpu.scaled_ext_packed %arg0[0], %arg1 : vector<2xf8E5M2> to vector<2xf16>
    return %0 : vector<2xf16>
  }
  func.func @scaled_ext_half_f8e5m2_bf16(%arg0: vector<2xf8E5M2>, %arg1: f32) -> vector<2xbf16> {
    %0 = amdgpu.scaled_ext_packed %arg0[0], %arg1 : vector<2xf8E5M2> to vector<2xbf16>
    return %0 : vector<2xbf16>
  }
  func.func @scaled_ext_scalar_f8e5m2_f32(%arg0: vector<2xf8E5M2>, %arg1: f32) -> vector<2xf32> {
    %0 = amdgpu.scaled_ext_packed %arg0[0], %arg1 : vector<2xf8E5M2> to vector<2xf32>
    return %0 : vector<2xf32>
  }
  func.func @scaled_ext_scalar_f8e5m2_f16(%arg0: vector<2xf8E5M2>, %arg1: f32) -> vector<2xf16> {
    %0 = amdgpu.scaled_ext_packed %arg0[0], %arg1 : vector<2xf8E5M2> to vector<2xf16>
    return %0 : vector<2xf16>
  }
  func.func @scaled_ext_scalar_f8e5m2_bf16(%arg0: vector<2xf8E5M2>, %arg1: f32) -> vector<2xbf16> {
    %0 = amdgpu.scaled_ext_packed %arg0[0], %arg1 : vector<2xf8E5M2> to vector<2xbf16>
    return %0 : vector<2xbf16>
  }
  func.func @scaled_ext_full_f4e2m1_f32(%arg0: vector<8xf4E2M1FN>, %arg1: f32) -> vector<2xf32> {
    %0 = amdgpu.scaled_ext_packed %arg0[0], %arg1 : vector<8xf4E2M1FN> to vector<2xf32>
    return %0 : vector<2xf32>
  }
  func.func @scaled_ext_full_f4e2m1_f16(%arg0: vector<8xf4E2M1FN>, %arg1: f32) -> vector<2xf16> {
    %0 = amdgpu.scaled_ext_packed %arg0[0], %arg1 : vector<8xf4E2M1FN> to vector<2xf16>
    return %0 : vector<2xf16>
  }
  func.func @scaled_ext_full_f4e2m1_bf16(%arg0: vector<8xf4E2M1FN>, %arg1: f32) -> vector<2xbf16> {
    %0 = amdgpu.scaled_ext_packed %arg0[0], %arg1 : vector<8xf4E2M1FN> to vector<2xbf16>
    return %0 : vector<2xbf16>
  }
  func.func @scaled_ext_half_f4e2m1_f32(%arg0: vector<8xf4E2M1FN>, %arg1: f32) -> vector<2xf32> {
    %0 = amdgpu.scaled_ext_packed %arg0[0], %arg1 : vector<8xf4E2M1FN> to vector<2xf32>
    return %0 : vector<2xf32>
  }
  func.func @scaled_ext_half_f4e2m1_f16(%arg0: vector<4xf4E2M1FN>, %arg1: f32) -> vector<2xf16> {
    %0 = amdgpu.scaled_ext_packed %arg0[0], %arg1 : vector<4xf4E2M1FN> to vector<2xf16>
    return %0 : vector<2xf16>
  }
  func.func @scaled_ext_half_f4e2m1_bf16(%arg0: vector<4xf4E2M1FN>, %arg1: f32) -> vector<2xbf16> {
    %0 = amdgpu.scaled_ext_packed %arg0[0], %arg1 : vector<4xf4E2M1FN> to vector<2xbf16>
    return %0 : vector<2xbf16>
  }
  func.func @scaled_ext_scalar_f4e2m1_f32(%arg0: vector<2xf4E2M1FN>, %arg1: f32) -> vector<2xf32> {
    %0 = amdgpu.scaled_ext_packed %arg0[0], %arg1 : vector<2xf4E2M1FN> to vector<2xf32>
    return %0 : vector<2xf32>
  }
  func.func @scaled_ext_scalar_f4e2m1_f16(%arg0: vector<2xf4E2M1FN>, %arg1: f32) -> vector<2xf16> {
    %0 = amdgpu.scaled_ext_packed %arg0[0], %arg1 : vector<2xf4E2M1FN> to vector<2xf16>
    return %0 : vector<2xf16>
  }
  func.func @scaled_ext_scalar_f4e2m1_bf16(%arg0: vector<2xf4E2M1FN>, %arg1: f32) -> vector<2xbf16> {
    %0 = amdgpu.scaled_ext_packed %arg0[0], %arg1 : vector<2xf4E2M1FN> to vector<2xbf16>
    return %0 : vector<2xbf16>
  }
  func.func @scaled_ext_one_f8e4m3_f32(%arg0: vector<1xf8E4M3FN>, %arg1: f32) -> vector<2xf32> {
    %0 = amdgpu.scaled_ext_packed %arg0[0], %arg1 : vector<1xf8E4M3FN> to vector<2xf32>
    return %0 : vector<2xf32>
  }
  func.func @scaled_ext_one_f8e4m3_f16(%arg0: vector<1xf8E4M3FN>, %arg1: f32) -> vector<2xf16> {
    %0 = amdgpu.scaled_ext_packed %arg0[0], %arg1 : vector<1xf8E4M3FN> to vector<2xf16>
    return %0 : vector<2xf16>
  }
  func.func @scaled_ext_one_f8e4m3_bf16(%arg0: vector<1xf8E4M3FN>, %arg1: f32) -> vector<2xbf16> {
    %0 = amdgpu.scaled_ext_packed %arg0[0], %arg1 : vector<1xf8E4M3FN> to vector<2xbf16>
    return %0 : vector<2xbf16>
  }
  func.func @scaled_ext_one_f8e5m2_f32(%arg0: vector<1xf8E5M2>, %arg1: f32) -> vector<2xf32> {
    %0 = amdgpu.scaled_ext_packed %arg0[0], %arg1 : vector<1xf8E5M2> to vector<2xf32>
    return %0 : vector<2xf32>
  }
  func.func @scaled_ext_one_f8e5m2_f16(%arg0: vector<1xf8E5M2>, %arg1: f32) -> vector<2xf16> {
    %0 = amdgpu.scaled_ext_packed %arg0[0], %arg1 : vector<1xf8E5M2> to vector<2xf16>
    return %0 : vector<2xf16>
  }
  func.func @scaled_ext_one_f8e5m2_bf16(%arg0: vector<1xf8E5M2>, %arg1: f32) -> vector<2xbf16> {
    %0 = amdgpu.scaled_ext_packed %arg0[0], %arg1 : vector<1xf8E5M2> to vector<2xbf16>
    return %0 : vector<2xbf16>
  }
  func.func @scaled_ext_one_f4e2m1_f32(%arg0: vector<1xf4E2M1FN>, %arg1: f32) -> vector<2xf32> {
    %0 = amdgpu.scaled_ext_packed %arg0[0], %arg1 : vector<1xf4E2M1FN> to vector<2xf32>
    return %0 : vector<2xf32>
  }
  func.func @scaled_ext_one_f4e2m1_f16(%arg0: vector<1xf4E2M1FN>, %arg1: f32) -> vector<2xf16> {
    %0 = amdgpu.scaled_ext_packed %arg0[0], %arg1 : vector<1xf4E2M1FN> to vector<2xf16>
    return %0 : vector<2xf16>
  }
  func.func @scaled_ext_one_f4e2m1_bf16(%arg0: vector<1xf4E2M1FN>, %arg1: f32) -> vector<2xbf16> {
    %0 = amdgpu.scaled_ext_packed %arg0[0], %arg1 : vector<1xf4E2M1FN> to vector<2xbf16>
    return %0 : vector<2xbf16>
  }
}

