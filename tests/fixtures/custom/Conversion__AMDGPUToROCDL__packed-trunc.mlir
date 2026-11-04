module {
  func.func @packed_scaled_trunc_f8e4m3_f32(%arg0: vector<2xf32>, %arg1: f32) -> vector<4xf8E4M3FN> {
    %0 = amdgpu.packed_scaled_trunc %arg0 into undef[0], %arg1 : vector<2xf32> to vector<4xf8E4M3FN>
    return %0 : vector<4xf8E4M3FN>
  }
  func.func @packed_scaled_trunc_f8e4m3_f32_vec1(%arg0: vector<1xf32>, %arg1: f32) -> vector<4xf8E4M3FN> {
    %0 = amdgpu.packed_scaled_trunc %arg0 into undef[0], %arg1 : vector<1xf32> to vector<4xf8E4M3FN>
    return %0 : vector<4xf8E4M3FN>
  }
  func.func @packed_scaled_trunc_into_f8e4m3_f32(%arg0: vector<2xf32>, %arg1: vector<4xf8E4M3FN>, %arg2: f32) -> vector<4xf8E4M3FN> {
    %0 = amdgpu.packed_scaled_trunc %arg0 into %arg1[0], %arg2 : vector<2xf32> to vector<4xf8E4M3FN> into vector<4xf8E4M3FN>
    return %0 : vector<4xf8E4M3FN>
  }
  func.func @packed_scaled_trunc_into_f8e4m3_f32_vec1(%arg0: vector<1xf32>, %arg1: vector<4xf8E4M3FN>, %arg2: f32) -> vector<4xf8E4M3FN> {
    %0 = amdgpu.packed_scaled_trunc %arg0 into %arg1[0], %arg2 : vector<1xf32> to vector<4xf8E4M3FN> into vector<4xf8E4M3FN>
    return %0 : vector<4xf8E4M3FN>
  }
  func.func @packed_scaled_trunc_f8e4m3_f16(%arg0: vector<2xf16>, %arg1: f32) -> vector<4xf8E4M3FN> {
    %0 = amdgpu.packed_scaled_trunc %arg0 into undef[0], %arg1 : vector<2xf16> to vector<4xf8E4M3FN>
    return %0 : vector<4xf8E4M3FN>
  }
  func.func @packed_scaled_trunc_f8e4m3_f16_vec1(%arg0: vector<1xf16>, %arg1: f32) -> vector<4xf8E4M3FN> {
    %0 = amdgpu.packed_scaled_trunc %arg0 into undef[0], %arg1 : vector<1xf16> to vector<4xf8E4M3FN>
    return %0 : vector<4xf8E4M3FN>
  }
  func.func @packed_scaled_trunc_into_f8e4m3_f16(%arg0: vector<2xf16>, %arg1: vector<4xf8E4M3FN>, %arg2: f32) -> vector<4xf8E4M3FN> {
    %0 = amdgpu.packed_scaled_trunc %arg0 into %arg1[0], %arg2 : vector<2xf16> to vector<4xf8E4M3FN> into vector<4xf8E4M3FN>
    return %0 : vector<4xf8E4M3FN>
  }
  func.func @packed_scaled_trunc_into_f8e4m3_f16_vec1(%arg0: vector<1xf16>, %arg1: vector<4xf8E4M3FN>, %arg2: f32) -> vector<4xf8E4M3FN> {
    %0 = amdgpu.packed_scaled_trunc %arg0 into %arg1[0], %arg2 : vector<1xf16> to vector<4xf8E4M3FN> into vector<4xf8E4M3FN>
    return %0 : vector<4xf8E4M3FN>
  }
  func.func @packed_scaled_trunc_f8e4m3_bf16(%arg0: vector<2xbf16>, %arg1: f32) -> vector<4xf8E4M3FN> {
    %0 = amdgpu.packed_scaled_trunc %arg0 into undef[0], %arg1 : vector<2xbf16> to vector<4xf8E4M3FN>
    return %0 : vector<4xf8E4M3FN>
  }
  func.func @packed_scaled_trunc_f8e4m3_bf16_vec1(%arg0: vector<1xbf16>, %arg1: f32) -> vector<4xf8E4M3FN> {
    %0 = amdgpu.packed_scaled_trunc %arg0 into undef[0], %arg1 : vector<1xbf16> to vector<4xf8E4M3FN>
    return %0 : vector<4xf8E4M3FN>
  }
  func.func @packed_scaled_trunc_into_f8e4m3_bf16(%arg0: vector<2xbf16>, %arg1: vector<4xf8E4M3FN>, %arg2: f32) -> vector<4xf8E4M3FN> {
    %0 = amdgpu.packed_scaled_trunc %arg0 into %arg1[0], %arg2 : vector<2xbf16> to vector<4xf8E4M3FN> into vector<4xf8E4M3FN>
    return %0 : vector<4xf8E4M3FN>
  }
  func.func @packed_scaled_trunc_into_f8e4m3_bf16_vec1(%arg0: vector<1xbf16>, %arg1: vector<4xf8E4M3FN>, %arg2: f32) -> vector<4xf8E4M3FN> {
    %0 = amdgpu.packed_scaled_trunc %arg0 into %arg1[0], %arg2 : vector<1xbf16> to vector<4xf8E4M3FN> into vector<4xf8E4M3FN>
    return %0 : vector<4xf8E4M3FN>
  }
  func.func @packed_scaled_trunc_f8e5m2_f32(%arg0: vector<2xf32>, %arg1: f32) -> vector<4xf8E5M2> {
    %0 = amdgpu.packed_scaled_trunc %arg0 into undef[0], %arg1 : vector<2xf32> to vector<4xf8E5M2>
    return %0 : vector<4xf8E5M2>
  }
  func.func @packed_scaled_trunc_f8e5m2_f32_vec1(%arg0: vector<1xf32>, %arg1: f32) -> vector<4xf8E5M2> {
    %0 = amdgpu.packed_scaled_trunc %arg0 into undef[0], %arg1 : vector<1xf32> to vector<4xf8E5M2>
    return %0 : vector<4xf8E5M2>
  }
  func.func @packed_scaled_trunc_into_f8e5m2_f32(%arg0: vector<2xf32>, %arg1: vector<4xf8E5M2>, %arg2: f32) -> vector<4xf8E5M2> {
    %0 = amdgpu.packed_scaled_trunc %arg0 into %arg1[0], %arg2 : vector<2xf32> to vector<4xf8E5M2> into vector<4xf8E5M2>
    return %0 : vector<4xf8E5M2>
  }
  func.func @packed_scaled_trunc_into_f8e5m2_f32_vec1(%arg0: vector<1xf32>, %arg1: vector<4xf8E5M2>, %arg2: f32) -> vector<4xf8E5M2> {
    %0 = amdgpu.packed_scaled_trunc %arg0 into %arg1[0], %arg2 : vector<1xf32> to vector<4xf8E5M2> into vector<4xf8E5M2>
    return %0 : vector<4xf8E5M2>
  }
  func.func @packed_scaled_trunc_f8e5m2_f16(%arg0: vector<2xf16>, %arg1: f32) -> vector<4xf8E5M2> {
    %0 = amdgpu.packed_scaled_trunc %arg0 into undef[0], %arg1 : vector<2xf16> to vector<4xf8E5M2>
    return %0 : vector<4xf8E5M2>
  }
  func.func @packed_scaled_trunc_f8e5m2_f16_vec1(%arg0: vector<1xf16>, %arg1: f32) -> vector<4xf8E5M2> {
    %0 = amdgpu.packed_scaled_trunc %arg0 into undef[0], %arg1 : vector<1xf16> to vector<4xf8E5M2>
    return %0 : vector<4xf8E5M2>
  }
  func.func @packed_scaled_trunc_into_f8e5m2_f16(%arg0: vector<2xf16>, %arg1: vector<4xf8E5M2>, %arg2: f32) -> vector<4xf8E5M2> {
    %0 = amdgpu.packed_scaled_trunc %arg0 into %arg1[0], %arg2 : vector<2xf16> to vector<4xf8E5M2> into vector<4xf8E5M2>
    return %0 : vector<4xf8E5M2>
  }
  func.func @packed_scaled_trunc_into_f8e5m2_f16_vec1(%arg0: vector<1xf16>, %arg1: vector<4xf8E5M2>, %arg2: f32) -> vector<4xf8E5M2> {
    %0 = amdgpu.packed_scaled_trunc %arg0 into %arg1[0], %arg2 : vector<1xf16> to vector<4xf8E5M2> into vector<4xf8E5M2>
    return %0 : vector<4xf8E5M2>
  }
  func.func @packed_scaled_trunc_f8e5m2_bf16(%arg0: vector<2xbf16>, %arg1: f32) -> vector<4xf8E5M2> {
    %0 = amdgpu.packed_scaled_trunc %arg0 into undef[0], %arg1 : vector<2xbf16> to vector<4xf8E5M2>
    return %0 : vector<4xf8E5M2>
  }
  func.func @packed_scaled_trunc_f8e5m2_bf16_vec1(%arg0: vector<1xbf16>, %arg1: f32) -> vector<4xf8E5M2> {
    %0 = amdgpu.packed_scaled_trunc %arg0 into undef[0], %arg1 : vector<1xbf16> to vector<4xf8E5M2>
    return %0 : vector<4xf8E5M2>
  }
  func.func @packed_scaled_trunc_into_f8e5m2_bf16(%arg0: vector<2xbf16>, %arg1: vector<4xf8E5M2>, %arg2: f32) -> vector<4xf8E5M2> {
    %0 = amdgpu.packed_scaled_trunc %arg0 into %arg1[0], %arg2 : vector<2xbf16> to vector<4xf8E5M2> into vector<4xf8E5M2>
    return %0 : vector<4xf8E5M2>
  }
  func.func @packed_scaled_trunc_into_f8e5m2_bf16_vec1(%arg0: vector<1xbf16>, %arg1: vector<4xf8E5M2>, %arg2: f32) -> vector<4xf8E5M2> {
    %0 = amdgpu.packed_scaled_trunc %arg0 into %arg1[0], %arg2 : vector<1xbf16> to vector<4xf8E5M2> into vector<4xf8E5M2>
    return %0 : vector<4xf8E5M2>
  }
  func.func @packed_scaled_trunc_f4e2m1_f32(%arg0: vector<2xf32>, %arg1: f32) -> vector<8xf4E2M1FN> {
    %0 = amdgpu.packed_scaled_trunc %arg0 into undef[0], %arg1 : vector<2xf32> to vector<8xf4E2M1FN>
    return %0 : vector<8xf4E2M1FN>
  }
  func.func @packed_scaled_trunc_f4e2m1_f32_vec1(%arg0: vector<1xf32>, %arg1: f32) -> vector<8xf4E2M1FN> {
    %0 = amdgpu.packed_scaled_trunc %arg0 into undef[0], %arg1 : vector<1xf32> to vector<8xf4E2M1FN>
    return %0 : vector<8xf4E2M1FN>
  }
  func.func @packed_scaled_trunc_into_f4e2m1_f32(%arg0: vector<2xf32>, %arg1: vector<8xf4E2M1FN>, %arg2: f32) -> vector<8xf4E2M1FN> {
    %0 = amdgpu.packed_scaled_trunc %arg0 into %arg1[0], %arg2 : vector<2xf32> to vector<8xf4E2M1FN> into vector<8xf4E2M1FN>
    return %0 : vector<8xf4E2M1FN>
  }
  func.func @packed_scaled_trunc_into_f4e2m1_f32_vec1(%arg0: vector<1xf32>, %arg1: vector<8xf4E2M1FN>, %arg2: f32) -> vector<8xf4E2M1FN> {
    %0 = amdgpu.packed_scaled_trunc %arg0 into %arg1[0], %arg2 : vector<1xf32> to vector<8xf4E2M1FN> into vector<8xf4E2M1FN>
    return %0 : vector<8xf4E2M1FN>
  }
  func.func @packed_scaled_trunc_f4e2m1_f16(%arg0: vector<2xf16>, %arg1: f32) -> vector<8xf4E2M1FN> {
    %0 = amdgpu.packed_scaled_trunc %arg0 into undef[0], %arg1 : vector<2xf16> to vector<8xf4E2M1FN>
    return %0 : vector<8xf4E2M1FN>
  }
  func.func @packed_scaled_trunc_f4e2m1_f16_vec1(%arg0: vector<1xf16>, %arg1: f32) -> vector<8xf4E2M1FN> {
    %0 = amdgpu.packed_scaled_trunc %arg0 into undef[0], %arg1 : vector<1xf16> to vector<8xf4E2M1FN>
    return %0 : vector<8xf4E2M1FN>
  }
  func.func @packed_scaled_trunc_into_f4e2m1_f16(%arg0: vector<2xf16>, %arg1: vector<8xf4E2M1FN>, %arg2: f32) -> vector<8xf4E2M1FN> {
    %0 = amdgpu.packed_scaled_trunc %arg0 into %arg1[0], %arg2 : vector<2xf16> to vector<8xf4E2M1FN> into vector<8xf4E2M1FN>
    return %0 : vector<8xf4E2M1FN>
  }
  func.func @packed_scaled_trunc_into_f4e2m1_f16_vec1(%arg0: vector<1xf16>, %arg1: vector<8xf4E2M1FN>, %arg2: f32) -> vector<8xf4E2M1FN> {
    %0 = amdgpu.packed_scaled_trunc %arg0 into %arg1[0], %arg2 : vector<1xf16> to vector<8xf4E2M1FN> into vector<8xf4E2M1FN>
    return %0 : vector<8xf4E2M1FN>
  }
  func.func @packed_scaled_trunc_f4e2m1_bf16(%arg0: vector<2xbf16>, %arg1: f32) -> vector<8xf4E2M1FN> {
    %0 = amdgpu.packed_scaled_trunc %arg0 into undef[0], %arg1 : vector<2xbf16> to vector<8xf4E2M1FN>
    return %0 : vector<8xf4E2M1FN>
  }
  func.func @packed_scaled_trunc_f4e2m1_bf16_vec1(%arg0: vector<1xbf16>, %arg1: f32) -> vector<8xf4E2M1FN> {
    %0 = amdgpu.packed_scaled_trunc %arg0 into undef[0], %arg1 : vector<1xbf16> to vector<8xf4E2M1FN>
    return %0 : vector<8xf4E2M1FN>
  }
  func.func @packed_scaled_trunc_into_f4e2m1_bf16(%arg0: vector<2xbf16>, %arg1: vector<8xf4E2M1FN>, %arg2: f32) -> vector<8xf4E2M1FN> {
    %0 = amdgpu.packed_scaled_trunc %arg0 into %arg1[0], %arg2 : vector<2xbf16> to vector<8xf4E2M1FN> into vector<8xf4E2M1FN>
    return %0 : vector<8xf4E2M1FN>
  }
  func.func @packed_scaled_trunc_into_f4e2m1_bf16_vec1(%arg0: vector<1xbf16>, %arg1: vector<8xf4E2M1FN>, %arg2: f32) -> vector<8xf4E2M1FN> {
    %0 = amdgpu.packed_scaled_trunc %arg0 into %arg1[0], %arg2 : vector<1xbf16> to vector<8xf4E2M1FN> into vector<8xf4E2M1FN>
    return %0 : vector<8xf4E2M1FN>
  }
}

