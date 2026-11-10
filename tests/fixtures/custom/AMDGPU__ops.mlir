module {
  func.func @ext_packed_fp8_s(%arg0: vector<4xf8E4M3FNUZ>) -> f32 {
    %0 = amdgpu.ext_packed_fp8 %arg0[0] : vector<4xf8E4M3FNUZ> to f32
    return %0 : f32
  }
  func.func @ext_packed_fp8_v(%arg0: vector<4xf8E4M3FNUZ>) -> vector<2xf32> {
    %0 = amdgpu.ext_packed_fp8 %arg0[0] : vector<4xf8E4M3FNUZ> to vector<2xf32>
    return %0 : vector<2xf32>
  }
  func.func @packed_trunc_2xfp8(%arg0: f32, %arg1: f32, %arg2: vector<4xf8E5M2FNUZ>, %arg3: i32) -> vector<4xf8E5M2FNUZ> {
    %0 = amdgpu.packed_trunc_2xfp8 %arg0, %arg1 into %arg2[word 1] : f32 to vector<4xf8E5M2FNUZ> into vector<4xf8E5M2FNUZ>
    return %0 : vector<4xf8E5M2FNUZ>
  }
  func.func @packed_stoch_round_fp8(%arg0: f32, %arg1: i32, %arg2: vector<4xf8E5M2FNUZ>) -> vector<4xf8E5M2FNUZ> {
    %0 = amdgpu.packed_stoch_round_fp8 %arg0 + %arg1 into %arg2[2] : f32 to vector<4xf8E5M2FNUZ> into vector<4xf8E5M2FNUZ>
    return %0 : vector<4xf8E5M2FNUZ>
  }
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
  func.func @scaled_ext_packed_matrix_fp4(%arg0: vector<8xf4E2M1FN>, %arg1: vector<4xf8E8M0FNU>) -> (vector<8xf16>, vector<8xbf16>, vector<8xf32>) {
    %0 = amdgpu.scaled_ext_packed_matrix %arg0 scale(%arg1) blockSize(32) firstScaleLane(0) firstScaleByte(0) : vector<8xf4E2M1FN>, vector<4xf8E8M0FNU> -> vector<8xf16>
    %1 = amdgpu.scaled_ext_packed_matrix %arg0 scale(%arg1) blockSize(32) firstScaleLane(0) firstScaleByte(0) : vector<8xf4E2M1FN>, vector<4xf8E8M0FNU> -> vector<8xbf16>
    %2 = amdgpu.scaled_ext_packed_matrix %arg0 scale(%arg1) blockSize(32) firstScaleLane(0) firstScaleByte(0) : vector<8xf4E2M1FN>, vector<4xf8E8M0FNU> -> vector<8xf32>
    return %0, %1, %2 : vector<8xf16>, vector<8xbf16>, vector<8xf32>
  }
  func.func @scaled_ext_packed_matrix_fp8(%arg0: vector<8xf8E4M3FN>, %arg1: vector<4xf8E8M0FNU>) -> (vector<8xf16>, vector<8xbf16>, vector<8xf32>) {
    %0 = amdgpu.scaled_ext_packed_matrix %arg0 scale(%arg1) blockSize(32) firstScaleLane(0) firstScaleByte(0) : vector<8xf8E4M3FN>, vector<4xf8E8M0FNU> -> vector<8xf16>
    %1 = amdgpu.scaled_ext_packed_matrix %arg0 scale(%arg1) blockSize(32) firstScaleLane(0) firstScaleByte(0) : vector<8xf8E4M3FN>, vector<4xf8E8M0FNU> -> vector<8xbf16>
    %2 = amdgpu.scaled_ext_packed_matrix %arg0 scale(%arg1) blockSize(32) firstScaleLane(0) firstScaleByte(0) : vector<8xf8E4M3FN>, vector<4xf8E8M0FNU> -> vector<8xf32>
    return %0, %1, %2 : vector<8xf16>, vector<8xbf16>, vector<8xf32>
  }
  func.func @scaled_ext_packed_matrix_bf8(%arg0: vector<8xf8E5M2>, %arg1: vector<4xf8E8M0FNU>) -> (vector<8xf16>, vector<8xbf16>, vector<8xf32>) {
    %0 = amdgpu.scaled_ext_packed_matrix %arg0 scale(%arg1) blockSize(32) firstScaleLane(0) firstScaleByte(0) : vector<8xf8E5M2>, vector<4xf8E8M0FNU> -> vector<8xf16>
    %1 = amdgpu.scaled_ext_packed_matrix %arg0 scale(%arg1) blockSize(32) firstScaleLane(0) firstScaleByte(0) : vector<8xf8E5M2>, vector<4xf8E8M0FNU> -> vector<8xbf16>
    %2 = amdgpu.scaled_ext_packed_matrix %arg0 scale(%arg1) blockSize(32) firstScaleLane(0) firstScaleByte(0) : vector<8xf8E5M2>, vector<4xf8E8M0FNU> -> vector<8xf32>
    return %0, %1, %2 : vector<8xf16>, vector<8xbf16>, vector<8xf32>
  }
  func.func @scaled_ext_packed_matrix_fp6(%arg0: vector<16xf6E2M3FN>, %arg1: vector<4xf8E8M0FNU>) -> (vector<16xf16>, vector<16xbf16>, vector<16xf32>) {
    %0 = amdgpu.scaled_ext_packed_matrix %arg0 scale(%arg1) blockSize(32) firstScaleLane(0) firstScaleByte(0) : vector<16xf6E2M3FN>, vector<4xf8E8M0FNU> -> vector<16xf16>
    %1 = amdgpu.scaled_ext_packed_matrix %arg0 scale(%arg1) blockSize(32) firstScaleLane(0) firstScaleByte(0) : vector<16xf6E2M3FN>, vector<4xf8E8M0FNU> -> vector<16xbf16>
    %2 = amdgpu.scaled_ext_packed_matrix %arg0 scale(%arg1) blockSize(32) firstScaleLane(0) firstScaleByte(0) : vector<16xf6E2M3FN>, vector<4xf8E8M0FNU> -> vector<16xf32>
    return %0, %1, %2 : vector<16xf16>, vector<16xbf16>, vector<16xf32>
  }
  func.func @scaled_ext_packed_matrix_bf6(%arg0: vector<16xf6E3M2FN>, %arg1: vector<4xf8E8M0FNU>) -> (vector<16xf16>, vector<16xbf16>, vector<16xf32>) {
    %0 = amdgpu.scaled_ext_packed_matrix %arg0 scale(%arg1) blockSize(32) firstScaleLane(0) firstScaleByte(0) : vector<16xf6E3M2FN>, vector<4xf8E8M0FNU> -> vector<16xf16>
    %1 = amdgpu.scaled_ext_packed_matrix %arg0 scale(%arg1) blockSize(32) firstScaleLane(0) firstScaleByte(0) : vector<16xf6E3M2FN>, vector<4xf8E8M0FNU> -> vector<16xbf16>
    %2 = amdgpu.scaled_ext_packed_matrix %arg0 scale(%arg1) blockSize(32) firstScaleLane(0) firstScaleByte(0) : vector<16xf6E3M2FN>, vector<4xf8E8M0FNU> -> vector<16xf32>
    return %0, %1, %2 : vector<16xf16>, vector<16xbf16>, vector<16xf32>
  }
  func.func @packed_scaled_trunc_f8e4m3_f32(%arg0: vector<2xf32>, %arg1: f32) -> vector<4xf8E4M3FN> {
    %0 = amdgpu.packed_scaled_trunc %arg0 into undef[0], %arg1 : vector<2xf32> to vector<4xf8E4M3FN>
    return %0 : vector<4xf8E4M3FN>
  }
  func.func @packed_scaled_trunc_into_f8e4m3_f32(%arg0: vector<2xf32>, %arg1: vector<4xf8E4M3FN>, %arg2: f32) -> vector<4xf8E4M3FN> {
    %0 = amdgpu.packed_scaled_trunc %arg0 into %arg1[0], %arg2 : vector<2xf32> to vector<4xf8E4M3FN> into vector<4xf8E4M3FN>
    return %0 : vector<4xf8E4M3FN>
  }
  func.func @packed_scaled_trunc_f8e4m3_f16(%arg0: vector<2xf16>, %arg1: f32) -> vector<4xf8E4M3FN> {
    %0 = amdgpu.packed_scaled_trunc %arg0 into undef[0], %arg1 : vector<2xf16> to vector<4xf8E4M3FN>
    return %0 : vector<4xf8E4M3FN>
  }
  func.func @packed_scaled_trunc_into_f8e4m3_f16(%arg0: vector<2xf16>, %arg1: vector<4xf8E4M3FN>, %arg2: f32) -> vector<4xf8E4M3FN> {
    %0 = amdgpu.packed_scaled_trunc %arg0 into %arg1[0], %arg2 : vector<2xf16> to vector<4xf8E4M3FN> into vector<4xf8E4M3FN>
    return %0 : vector<4xf8E4M3FN>
  }
  func.func @packed_scaled_trunc_f8e4m3_bf16(%arg0: vector<2xbf16>, %arg1: f32) -> vector<4xf8E4M3FN> {
    %0 = amdgpu.packed_scaled_trunc %arg0 into undef[0], %arg1 : vector<2xbf16> to vector<4xf8E4M3FN>
    return %0 : vector<4xf8E4M3FN>
  }
  func.func @packed_scaled_trunc_into_f8e4m3_bf16(%arg0: vector<2xbf16>, %arg1: vector<4xf8E4M3FN>, %arg2: f32) -> vector<4xf8E4M3FN> {
    %0 = amdgpu.packed_scaled_trunc %arg0 into %arg1[0], %arg2 : vector<2xbf16> to vector<4xf8E4M3FN> into vector<4xf8E4M3FN>
    return %0 : vector<4xf8E4M3FN>
  }
  func.func @packed_scaled_trunc_f8e5m2_f32(%arg0: vector<2xf32>, %arg1: f32) -> vector<4xf8E5M2> {
    %0 = amdgpu.packed_scaled_trunc %arg0 into undef[0], %arg1 : vector<2xf32> to vector<4xf8E5M2>
    return %0 : vector<4xf8E5M2>
  }
  func.func @packed_scaled_trunc_into_f8e5m2_f32(%arg0: vector<2xf32>, %arg1: vector<4xf8E5M2>, %arg2: f32) -> vector<4xf8E5M2> {
    %0 = amdgpu.packed_scaled_trunc %arg0 into %arg1[0], %arg2 : vector<2xf32> to vector<4xf8E5M2> into vector<4xf8E5M2>
    return %0 : vector<4xf8E5M2>
  }
  func.func @packed_scaled_trunc_f8e5m2_f16(%arg0: vector<2xf16>, %arg1: f32) -> vector<4xf8E5M2> {
    %0 = amdgpu.packed_scaled_trunc %arg0 into undef[0], %arg1 : vector<2xf16> to vector<4xf8E5M2>
    return %0 : vector<4xf8E5M2>
  }
  func.func @packed_scaled_trunc_into_f8e5m2_f16(%arg0: vector<2xf16>, %arg1: vector<4xf8E5M2>, %arg2: f32) -> vector<4xf8E5M2> {
    %0 = amdgpu.packed_scaled_trunc %arg0 into %arg1[0], %arg2 : vector<2xf16> to vector<4xf8E5M2> into vector<4xf8E5M2>
    return %0 : vector<4xf8E5M2>
  }
  func.func @packed_scaled_trunc_f8e5m2_bf16(%arg0: vector<2xbf16>, %arg1: f32) -> vector<4xf8E5M2> {
    %0 = amdgpu.packed_scaled_trunc %arg0 into undef[0], %arg1 : vector<2xbf16> to vector<4xf8E5M2>
    return %0 : vector<4xf8E5M2>
  }
  func.func @packed_scaled_trunc_into_f8e5m2_bf16(%arg0: vector<2xbf16>, %arg1: vector<4xf8E5M2>, %arg2: f32) -> vector<4xf8E5M2> {
    %0 = amdgpu.packed_scaled_trunc %arg0 into %arg1[0], %arg2 : vector<2xbf16> to vector<4xf8E5M2> into vector<4xf8E5M2>
    return %0 : vector<4xf8E5M2>
  }
  func.func @packed_scaled_trunc_f4e2m1_f32(%arg0: vector<2xf32>, %arg1: f32) -> vector<8xf4E2M1FN> {
    %0 = amdgpu.packed_scaled_trunc %arg0 into undef[0], %arg1 : vector<2xf32> to vector<8xf4E2M1FN>
    return %0 : vector<8xf4E2M1FN>
  }
  func.func @packed_scaled_trunc_into_f4e2m1_f32(%arg0: vector<2xf32>, %arg1: vector<8xf4E2M1FN>, %arg2: f32) -> vector<8xf4E2M1FN> {
    %0 = amdgpu.packed_scaled_trunc %arg0 into %arg1[0], %arg2 : vector<2xf32> to vector<8xf4E2M1FN> into vector<8xf4E2M1FN>
    return %0 : vector<8xf4E2M1FN>
  }
  func.func @packed_scaled_trunc_f4e2m1_f16(%arg0: vector<2xf16>, %arg1: f32) -> vector<8xf4E2M1FN> {
    %0 = amdgpu.packed_scaled_trunc %arg0 into undef[0], %arg1 : vector<2xf16> to vector<8xf4E2M1FN>
    return %0 : vector<8xf4E2M1FN>
  }
  func.func @packed_scaled_trunc_into_f4e2m1_f16(%arg0: vector<2xf16>, %arg1: vector<8xf4E2M1FN>, %arg2: f32) -> vector<8xf4E2M1FN> {
    %0 = amdgpu.packed_scaled_trunc %arg0 into %arg1[0], %arg2 : vector<2xf16> to vector<8xf4E2M1FN> into vector<8xf4E2M1FN>
    return %0 : vector<8xf4E2M1FN>
  }
  func.func @packed_scaled_trunc_f4e2m1_bf16(%arg0: vector<2xbf16>, %arg1: f32) -> vector<8xf4E2M1FN> {
    %0 = amdgpu.packed_scaled_trunc %arg0 into undef[0], %arg1 : vector<2xbf16> to vector<8xf4E2M1FN>
    return %0 : vector<8xf4E2M1FN>
  }
  func.func @packed_scaled_trunc_into_f4e2m1_bf16(%arg0: vector<2xbf16>, %arg1: vector<8xf4E2M1FN>, %arg2: f32) -> vector<8xf4E2M1FN> {
    %0 = amdgpu.packed_scaled_trunc %arg0 into %arg1[0], %arg2 : vector<2xbf16> to vector<8xf4E2M1FN> into vector<8xf4E2M1FN>
    return %0 : vector<8xf4E2M1FN>
  }
  func.func @fat_raw_buffer_cast_easy(%arg0: memref<8xi32>) -> memref<8xi32, #amdgpu.address_space<fat_raw_buffer>> {
    %0 = amdgpu.fat_raw_buffer_cast %arg0 : memref<8xi32> to memref<8xi32, #amdgpu.address_space<fat_raw_buffer>>
    return %0 : memref<8xi32, #amdgpu.address_space<fat_raw_buffer>>
  }
  func.func @fat_raw_buffer_cast(%arg0: memref<8xi32, strided<[1], offset: ?>>, %arg1: i64, %arg2: i14) -> memref<8xi32, #amdgpu.address_space<fat_raw_buffer>> {
    %0 = amdgpu.fat_raw_buffer_cast %arg0 validBytes(%arg1) cacheSwizzleStride(%arg2) boundsCheck(false) resetOffset : memref<8xi32, strided<[1], offset: ?>> to memref<8xi32, #amdgpu.address_space<fat_raw_buffer>>
    return %0 : memref<8xi32, #amdgpu.address_space<fat_raw_buffer>>
  }
  func.func @fat_raw_buffer_cast_dynamic_1d_reset_offset(%arg0: memref<?xi32, strided<[1], offset: ?>>) -> memref<?xi32, #amdgpu.address_space<fat_raw_buffer>> {
    %0 = amdgpu.fat_raw_buffer_cast %arg0 resetOffset : memref<?xi32, strided<[1], offset: ?>> to memref<?xi32, #amdgpu.address_space<fat_raw_buffer>>
    return %0 : memref<?xi32, #amdgpu.address_space<fat_raw_buffer>>
  }
  func.func @fat_raw_buffer_cast_dynamic_0d_reset_offset(%arg0: memref<i32, strided<[], offset: ?>>) -> memref<i32, #amdgpu.address_space<fat_raw_buffer>> {
    %0 = amdgpu.fat_raw_buffer_cast %arg0 resetOffset : memref<i32, strided<[], offset: ?>> to memref<i32, #amdgpu.address_space<fat_raw_buffer>>
    return %0 : memref<i32, #amdgpu.address_space<fat_raw_buffer>>
  }
  func.func @fat_raw_buffer_cast_static_shape_2d_reset_offset(%arg0: memref<4x4xi32, strided<[4, 1], offset: ?>>) -> memref<4x4xi32, #amdgpu.address_space<fat_raw_buffer>> {
    %0 = amdgpu.fat_raw_buffer_cast %arg0 resetOffset : memref<4x4xi32, strided<[4, 1], offset: ?>> to memref<4x4xi32, #amdgpu.address_space<fat_raw_buffer>>
    return %0 : memref<4x4xi32, #amdgpu.address_space<fat_raw_buffer>>
  }
  func.func @fat_raw_buffer_cast_dynamic_2d_reset_offset(%arg0: memref<?x?xi32, strided<[?, 1], offset: ?>>) -> memref<?x?xi32, strided<[?, 1]>, #amdgpu.address_space<fat_raw_buffer>> {
    %0 = amdgpu.fat_raw_buffer_cast %arg0 resetOffset : memref<?x?xi32, strided<[?, 1], offset: ?>> to memref<?x?xi32, strided<[?, 1]>, #amdgpu.address_space<fat_raw_buffer>>
    return %0 : memref<?x?xi32, strided<[?, 1]>, #amdgpu.address_space<fat_raw_buffer>>
  }
  func.func @fat_raw_buffer_cast_noncontiguous_2d_reset_offset(%arg0: memref<4x4xi32, strided<[8, 1], offset: ?>>) -> memref<4x4xi32, strided<[8, 1]>, #amdgpu.address_space<fat_raw_buffer>> {
    %0 = amdgpu.fat_raw_buffer_cast %arg0 resetOffset : memref<4x4xi32, strided<[8, 1], offset: ?>> to memref<4x4xi32, strided<[8, 1]>, #amdgpu.address_space<fat_raw_buffer>>
    return %0 : memref<4x4xi32, strided<[8, 1]>, #amdgpu.address_space<fat_raw_buffer>>
  }
  func.func @raw_buffer_load_f32_from_rank_1(%arg0: memref<128xf32>, %arg1: i32, %arg2: i32) -> f32 {
    %0 = amdgpu.raw_buffer_load {indexOffset = 1 : i32} %arg0[%arg2] sgprOffset %arg1 : memref<128xf32>, i32 -> f32
    return %0 : f32
  }
  func.func @raw_buffer_load_f32_from_rank_4(%arg0: memref<128x64x32x16xf32>, %arg1: i32, %arg2: i32, %arg3: i32, %arg4: i32, %arg5: i32) -> f32 {
    %0 = amdgpu.raw_buffer_load {indexOffset = 1 : i32} %arg0[%arg2, %arg3, %arg4, %arg5] sgprOffset %arg1 : memref<128x64x32x16xf32>, i32, i32, i32, i32 -> f32
    return %0 : f32
  }
  func.func @raw_buffer_load_scalar(%arg0: memref<f32>) -> f32 {
    %0 = amdgpu.raw_buffer_load {indexOffset = 1 : i32} %arg0[] : memref<f32> -> f32
    return %0 : f32
  }
  func.func @raw_buffer_load_4xf32_from_rank_4(%arg0: memref<128x64x32x16xf32>, %arg1: i32, %arg2: i32, %arg3: i32, %arg4: i32, %arg5: i32) -> vector<4xf32> {
    %0 = amdgpu.raw_buffer_load {indexOffset = 1 : i32} %arg0[%arg2, %arg3, %arg4, %arg5] sgprOffset %arg1 : memref<128x64x32x16xf32>, i32, i32, i32, i32 -> vector<4xf32>
    return %0 : vector<4xf32>
  }
  func.func @raw_buffer_store_f32_to_rank_1(%arg0: f32, %arg1: memref<128xf32>, %arg2: i32, %arg3: i32) {
    amdgpu.raw_buffer_store {indexOffset = 1 : i32} %arg0 -> %arg1[%arg3] sgprOffset %arg2 : f32 -> memref<128xf32>, i32
    return
  }
  func.func @raw_buffer_store_f32_to_rank_4(%arg0: f32, %arg1: memref<128x64x32x16xf32>, %arg2: i32, %arg3: i32, %arg4: i32, %arg5: i32, %arg6: i32) {
    amdgpu.raw_buffer_store {indexOffset = 1 : i32} %arg0 -> %arg1[%arg3, %arg4, %arg5, %arg6] sgprOffset %arg2 : f32 -> memref<128x64x32x16xf32>, i32, i32, i32, i32
    return
  }
  func.func @raw_buffer_store_4xf32_to_rank_4(%arg0: vector<4xf32>, %arg1: memref<128x64x32x16xf32>, %arg2: i32, %arg3: i32, %arg4: i32, %arg5: i32, %arg6: i32) {
    amdgpu.raw_buffer_store {indexOffset = 1 : i32} %arg0 -> %arg1[%arg3, %arg4, %arg5, %arg6] sgprOffset %arg2 : vector<4xf32> -> memref<128x64x32x16xf32>, i32, i32, i32, i32
    return
  }
  func.func @raw_buffer_store_scalar(%arg0: f32, %arg1: memref<f32>) {
    amdgpu.raw_buffer_store {indexOffset = 1 : i32} %arg0 -> %arg1[] : f32 -> memref<f32>
    return
  }
  func.func @raw_buffer_atomic_fadd_f32_to_rank_1(%arg0: f32, %arg1: memref<128xf32>, %arg2: i32, %arg3: i32) {
    %0 = amdgpu.raw_buffer_atomic_fadd {indexOffset = 1 : i32} %arg0 -> %arg1[%arg3] sgprOffset %arg2 : f32 -> memref<128xf32>, i32
    return
  }
  func.func @raw_buffer_atomic_fadd_f32_to_rank_4(%arg0: f32, %arg1: memref<128x64x32x16xf32>, %arg2: i32, %arg3: i32, %arg4: i32, %arg5: i32, %arg6: i32) {
    %0 = amdgpu.raw_buffer_atomic_fadd {indexOffset = 1 : i32} %arg0 -> %arg1[%arg3, %arg4, %arg5, %arg6] sgprOffset %arg2 : f32 -> memref<128x64x32x16xf32>, i32, i32, i32, i32
    return
  }
  func.func @raw_buffer_atomic_cmpswap_f32(%arg0: f32, %arg1: f32, %arg2: memref<128x64x32x16xf32>, %arg3: i32, %arg4: i32, %arg5: i32, %arg6: i32, %arg7: i32) {
    %0 = amdgpu.raw_buffer_atomic_cmpswap {indexOffset = 1 : i32} %arg0, %arg1 -> %arg2[%arg4, %arg5, %arg6, %arg7] sgprOffset %arg3 : f32 -> memref<128x64x32x16xf32>, i32, i32, i32, i32
    return
  }
  func.func @lds_barrier() {
    amdgpu.lds_barrier
    return
  }
  func.func @sched_barrier() {
    amdgpu.sched_barrier allow = none
    amdgpu.sched_barrier allow = valu|all_vmem
    amdgpu.sched_barrier allow = all
    return
  }
  func.func @mfma(%arg0: vector<4xf16>, %arg1: vector<4xf32>) -> vector<4xf32> {
    %0 = amdgpu.mfma 16x16x16 %arg0 * %arg0 + %arg1 blgp = none : vector<4xf16>, vector<4xf16>, vector<4xf32>
    return %0 : vector<4xf32>
  }
  func.func @mfma_with_blocks(%arg0: f32, %arg1: vector<32xf32>) -> vector<32xf32> {
    %0 = amdgpu.mfma 32x32x1 %arg0 * %arg0 + %arg1 {abid = 1 : i32, blocks = 2 : i32, cbsz = 1 : i32} blgp = bcast_second_32 : f32, f32, vector<32xf32>
    return %0 : vector<32xf32>
  }
  func.func @wmma_f16_16x16x16_f16(%arg0: vector<16xf16>, %arg1: vector<8xf16>) -> vector<8xf16> {
    %0 = amdgpu.wmma 16x16x16 %arg0 * %arg0 + %arg1 : vector<16xf16>, vector<16xf16>, vector<8xf16>
    return %0 : vector<8xf16>
  }
  func.func @wmma_i32_16x16x32_i4(%arg0: vector<16xi4>, %arg1: vector<8xi32>) -> vector<8xi32> {
    %0 = amdgpu.wmma 16x16x32 %arg0 * %arg0 + %arg1 : vector<16xi4>, vector<16xi4>, vector<8xi32>
    return %0 : vector<8xi32>
  }
  func.func @wmma_f32_16x16x4_f32(%arg0: vector<2xf32>, %arg1: vector<8xf32>) -> vector<8xf32> {
    %0 = amdgpu.wmma 16x16x4 %arg0 * %arg0 + %arg1 : vector<2xf32>, vector<2xf32>, vector<8xf32>
    return %0 : vector<8xf32>
  }
  func.func @wmma_f32_16x16x64_f8(%arg0: vector<32xf8E4M3FN>, %arg1: vector<8xf32>) -> vector<8xf32> {
    %0 = amdgpu.wmma 16x16x64 %arg0 * %arg0 + %arg1 : vector<32xf8E4M3FN>, vector<32xf8E4M3FN>, vector<8xf32>
    return %0 : vector<8xf32>
  }
  func.func @wmma_f32_16x16x64_bf8(%arg0: vector<32xf8E5M2>, %arg1: vector<8xf32>) -> vector<8xf32> {
    %0 = amdgpu.wmma 16x16x64 %arg0 * %arg0 + %arg1 : vector<32xf8E5M2>, vector<32xf8E5M2>, vector<8xf32>
    return %0 : vector<8xf32>
  }
  func.func @wmma_f16_16x16x64_bf8(%arg0: vector<32xf8E5M2>, %arg1: vector<8xf16>) -> vector<8xf16> {
    %0 = amdgpu.wmma 16x16x64 %arg0 * %arg0 + %arg1 : vector<32xf8E5M2>, vector<32xf8E5M2>, vector<8xf16>
    return %0 : vector<8xf16>
  }
  func.func @wmma_f16_16x16x64_f8(%arg0: vector<32xf8E4M3FN>, %arg1: vector<8xf16>) -> vector<8xf16> {
    %0 = amdgpu.wmma 16x16x64 %arg0 * %arg0 + %arg1 : vector<32xf8E4M3FN>, vector<32xf8E4M3FN>, vector<8xf16>
    return %0 : vector<8xf16>
  }
  func.func @swizzle_bitmode(%arg0: f32) -> f32 {
    %0 = amdgpu.swizzle_bitmode %arg0 1 2 4 : f32
    return %0 : f32
  }
  func.func @permlane16_swap(%arg0: f32) -> f32 {
    %0 = amdgpu.permlane_swap %arg0 16 : f32
    return %0 : f32
  }
  func.func @permlane32_swap(%arg0: f32) -> f32 {
    %0 = amdgpu.permlane_swap %arg0 32 : f32
    return %0 : f32
  }
  func.func @scaled_mfma(%arg0: f8E8M0FNU, %arg1: vector<32xf6E2M3FN>, %arg2: vector<16xf32>) -> vector<16xf32> {
    %0 = amdgpu.scaled_mfma 32x32x64 (%arg0[0] * %arg1) * (%arg0[1] * %arg1) + %arg2 : f8E8M0FNU, vector<32xf6E2M3FN>, f8E8M0FNU, vector<32xf6E2M3FN>, vector<16xf32>
    return %0 : vector<16xf32>
  }
  func.func @sparse_mfma(%arg0: vector<4xf16>, %arg1: vector<8xf16>, %arg2: vector<8xf16>, %arg3: vector<16xf16>, %arg4: vector<8xi8>, %arg5: vector<16xi8>, %arg6: vector<16xi8>, %arg7: vector<32xi8>, %arg8: vector<4xf32>, %arg9: vector<4xi32>, %arg10: vector<4xi8>, %arg11: vector<2xi16>, %arg12: i32) {
    %0 = amdgpu.sparse_mfma 16x16x32 %arg0 * %arg1 + %arg8 sparse(%arg10 : vector<4xi8>) {abid = 3 : i32} : vector<4xf16>, vector<8xf16>, vector<4xf32>
    %1 = amdgpu.sparse_mfma 16x16x64 %arg4 * %arg5 + %arg9 sparse(%arg11 : vector<2xi16>) {abid = 1 : i32} : vector<8xi8>, vector<16xi8>, vector<4xi32>
    %2 = amdgpu.sparse_mfma 16x16x64 %arg2 * %arg3 + %arg8 sparse(%arg11 : vector<2xi16>) {abid = 1 : i32} : vector<8xf16>, vector<16xf16>, vector<4xf32>
    %3 = amdgpu.sparse_mfma 16x16x128 %arg6 * %arg7 + %arg9 sparse(%arg12 : i32) : vector<16xi8>, vector<32xi8>, vector<4xi32>
    return
  }
  func.func @transpose_load(%arg0: index, %arg1: index, %arg2: memref<128x32xf16, 3>) -> vector<4xf16> {
    %0 = amdgpu.transpose_load %arg2[%arg0, %arg1] : memref<128x32xf16, 3> -> vector<4xf16>
    return %0 : vector<4xf16>
  }
  func.func @global_transpose_load(%arg0: index, %arg1: index, %arg2: memref<128x256xf16, #gpu.address_space<global>>) -> vector<8xf16> {
    %0 = amdgpu.global_transpose_load %arg2[%arg0, %arg1] : memref<128x256xf16, #gpu.address_space<global>> -> vector<8xf16>
    return %0 : vector<8xf16>
  }
  func.func @gather_to_lds(%arg0: index, %arg1: index, %arg2: memref<32xf16>, %arg3: memref<32x32xf16>, %arg4: memref<32xf16, #gpu.address_space<workgroup>>, %arg5: memref<32x32xf16, #gpu.address_space<workgroup>>, %arg6: memref<?x?xf16, strided<[?, 1]>, #gpu.address_space<workgroup>>) {
    amdgpu.gather_to_lds async %arg3[%arg0, %arg1], %arg5[%arg0, %arg1] : vector<2xf16>, memref<32x32xf16>, memref<32x32xf16, #gpu.address_space<workgroup>>
    amdgpu.gather_to_lds async %arg2[%arg0], %arg5[%arg0, %arg1] : vector<2xf16>, memref<32xf16>, memref<32x32xf16, #gpu.address_space<workgroup>>
    rocdl.asyncmark
    amdgpu.gather_to_lds %arg3[%arg0, %arg1], %arg4[%arg0] : vector<2xf16>, memref<32x32xf16>, memref<32xf16, #gpu.address_space<workgroup>>
    amdgpu.gather_to_lds %arg2[%arg0], %arg6[%arg0, %arg1] : vector<2xf16>, memref<32xf16>, memref<?x?xf16, strided<[?, 1]>, #gpu.address_space<workgroup>>
    rocdl.wait.asyncmark 0
    return
  }
  func.func @gather_to_lds_integer_fat_raw_buffer_address_space(%arg0: index, %arg1: memref<32xf16, 7>, %arg2: memref<32xf16, #gpu.address_space<workgroup>>) {
    amdgpu.gather_to_lds %arg1[%arg0], %arg2[%arg0] : vector<2xf16>, memref<32xf16, 7>, memref<32xf16, #gpu.address_space<workgroup>>
    return
  }
  func.func @gather_to_lds_0d(%arg0: memref<f16>, %arg1: memref<f16, #gpu.address_space<workgroup>>) {
    amdgpu.gather_to_lds async %arg0[], %arg1[] : vector<2xf16>, memref<f16>, memref<f16, #gpu.address_space<workgroup>>
    rocdl.asyncmark
    rocdl.wait.asyncmark 0
    return
  }
  func.func @global_load_async_to_lds(%arg0: index, %arg1: index, %arg2: memref<32xf32, #gpu.address_space<global>>, %arg3: memref<32x32xf32, #gpu.address_space<global>>, %arg4: memref<32xf32, #gpu.address_space<workgroup>>, %arg5: memref<32x32xf32, #gpu.address_space<workgroup>>, %arg6: i1) {
    amdgpu.global_load_async_to_lds %arg3[%arg0, %arg1], %arg5[%arg0, %arg1] : f32, memref<32x32xf32, #gpu.address_space<global>>, memref<32x32xf32, #gpu.address_space<workgroup>>
    amdgpu.global_load_async_to_lds %arg2[%arg0], %arg5[%arg0, %arg1] : f32, memref<32xf32, #gpu.address_space<global>>, memref<32x32xf32, #gpu.address_space<workgroup>>
    amdgpu.global_load_async_to_lds %arg3[%arg0, %arg1], %arg5[%arg0, %arg1] : vector<2xf32>, memref<32x32xf32, #gpu.address_space<global>>, memref<32x32xf32, #gpu.address_space<workgroup>>
    amdgpu.global_load_async_to_lds %arg3[%arg0, %arg1], %arg5[%arg0, %arg1], %arg6 : f32, memref<32x32xf32, #gpu.address_space<global>>, memref<32x32xf32, #gpu.address_space<workgroup>>
    return
  }
  func.func @global_load_async_to_lds_0d(%arg0: memref<f32, #gpu.address_space<global>>, %arg1: memref<f32, #gpu.address_space<workgroup>>) {
    amdgpu.global_load_async_to_lds %arg0[], %arg1[] : f32, memref<f32, #gpu.address_space<global>>, memref<f32, #gpu.address_space<workgroup>>
    return
  }
  func.func @memory_counter_wait() {
    amdgpu.memory_counter_wait load(1) store(2) ds(3) exp(4) tensor(5)
    amdgpu.memory_counter_wait load(4) store(2) ds(3) exp(1) tensor(0)
    amdgpu.memory_counter_wait load(1)
    amdgpu.memory_counter_wait store(2)
    amdgpu.memory_counter_wait ds(3)
    amdgpu.memory_counter_wait exp(4)
    amdgpu.memory_counter_wait tensor(5)
    return
  }
  func.func @make_dma_base(%arg0: index, %arg1: memref<8xi32, #gpu.address_space<global>>, %arg2: memref<8xi32, #gpu.address_space<workgroup>>) {
    %0 = amdgpu.make_dma_base %arg1[%arg0], %arg2[%arg0] : memref<8xi32, #gpu.address_space<global>>, memref<8xi32, #gpu.address_space<workgroup>> -> !amdgpu.tdm_base<i32>
    return
  }
  func.func @make_dma_descriptor(%arg0: !amdgpu.tdm_base<i32>, %arg1: vector<16xi1>, %arg2: i1, %arg3: memref<2x!amdgpu.ds_barrier_state, #gpu.address_space<workgroup>>, %arg4: index, %arg5: i32) {
    %0 = amdgpu.make_dma_descriptor %arg0 globalSize [64, 64] globalStride [64, 1] sharedSize [64, 64] : !amdgpu.tdm_base<i32> -> !amdgpu.tdm_descriptor
    %1 = amdgpu.make_dma_descriptor %arg0 globalSize [64, 64] globalStride [64, 1] sharedSize [64, 64] padShared(%arg5 every %arg5) : !amdgpu.tdm_base<i32> -> !amdgpu.tdm_descriptor
    %2 = amdgpu.make_dma_descriptor %arg0 globalSize [64, 64] globalStride [64, 1] sharedSize [64, 64] workgroupMask %arg1 : !amdgpu.tdm_base<i32> -> !amdgpu.tdm_descriptor
    %3 = amdgpu.make_dma_descriptor %arg0 globalSize [64, 64] globalStride [64, 1] sharedSize [64, 64] workgroupMask %arg1 earlyTimeout %arg2 : !amdgpu.tdm_base<i32> -> !amdgpu.tdm_descriptor
    %4 = amdgpu.make_dma_descriptor %arg0 globalSize [64, 64] globalStride [64, 1] sharedSize [64, 64] atomicBarrier(%arg3[%arg4] : memref<2x!amdgpu.ds_barrier_state, #gpu.address_space<workgroup>>) : !amdgpu.tdm_base<i32> -> !amdgpu.tdm_descriptor
    %5 = amdgpu.make_dma_descriptor %arg0 globalSize [64, 64] globalStride [64, 1] sharedSize [64, 64] iterate %arg4, %arg5, %arg4 : !amdgpu.tdm_base<i32> -> !amdgpu.tdm_descriptor
    return
  }
  func.func @wmma_scale(%arg0: vector<64xf8E4M3FN>, %arg1: vector<64xf6E3M2FN>, %arg2: vector<64xf6E2M3FN>, %arg3: vector<128xf4E2M1FN>, %arg4: vector<64xf4E2M1FN>, %arg5: vector<8xf32>, %arg6: vector<16xf32>, %arg7: vector<4xf8E8M0FNU>, %arg8: vector<8xf8E8M0FNU>, %arg9: vector<4xf8E4M3FN>) {
    %0 = amdgpu.scaled_wmma 16x16x128 (%arg7 * %arg0) * (%arg7 * %arg0) + %arg5 {a_first_scale_lane = 0 : i32, b_first_scale_lane = 0 : i32} : vector<4xf8E8M0FNU>, vector<64xf8E4M3FN>, vector<4xf8E8M0FNU>, vector<64xf8E4M3FN>, vector<8xf32>
    %1 = amdgpu.scaled_wmma 16x16x128 (%arg7 * %arg1) * (%arg7 * %arg1) + %arg5 {a_first_scale_lane = 0 : i32, b_first_scale_lane = 0 : i32} : vector<4xf8E8M0FNU>, vector<64xf6E3M2FN>, vector<4xf8E8M0FNU>, vector<64xf6E3M2FN>, vector<8xf32>
    %2 = amdgpu.scaled_wmma 16x16x128 (%arg7 * %arg2) * (%arg7 * %arg2) + %arg5 {a_first_scale_lane = 0 : i32, b_first_scale_lane = 0 : i32} : vector<4xf8E8M0FNU>, vector<64xf6E2M3FN>, vector<4xf8E8M0FNU>, vector<64xf6E2M3FN>, vector<8xf32>
    %3 = amdgpu.scaled_wmma 16x16x128 (%arg9 * %arg4) * (%arg7 * %arg2) + %arg5 {a_first_scale_lane = 0 : i32, b_first_scale_lane = 0 : i32} : vector<4xf8E4M3FN>, vector<64xf4E2M1FN>, vector<4xf8E8M0FNU>, vector<64xf6E2M3FN>, vector<8xf32>
    %4 = amdgpu.scaled_wmma 16x16x128 (%arg8 * %arg0) * (%arg8 * %arg0) + %arg5 {a_first_scale_lane = 0 : i32, b_first_scale_lane = 0 : i32} : vector<8xf8E8M0FNU>, vector<64xf8E4M3FN>, vector<8xf8E8M0FNU>, vector<64xf8E4M3FN>, vector<8xf32>
    %5 = amdgpu.scaled_wmma 32x16x128 (%arg9 * %arg3) * (%arg9 * %arg4) + %arg6 {a_first_scale_lane = 0 : i32, b_first_scale_lane = 0 : i32} : vector<4xf8E4M3FN>, vector<128xf4E2M1FN>, vector<4xf8E4M3FN>, vector<64xf4E2M1FN>, vector<16xf32>
    return
  }
  func.func @dpp_vector_src_does_not_assert(%arg0: vector<256xi8>, %arg1: vector<256xi8>) {
    %0 = amdgpu.dpp %arg1 %arg0 row_shl(1 : i32) : vector<256xi8>
    return
  }
  func.func @ds_barrier_ops(%arg0: memref<!amdgpu.ds_barrier_state, #gpu.address_space<workgroup>>, %arg1: i64, %arg2: i32) {
    amdgpu.ds_barrier_init %arg0[], %arg2 : memref<!amdgpu.ds_barrier_state, #gpu.address_space<workgroup>>, i32
    %0 = amdgpu.ds_barrier_poll_state %arg0[] : memref<!amdgpu.ds_barrier_state, #gpu.address_space<workgroup>> -> !amdgpu.ds_barrier_state
    amdgpu.ds_async_barrier_arrive %arg0[] : memref<!amdgpu.ds_barrier_state, #gpu.address_space<workgroup>>
    %1 = amdgpu.ds_barrier_arrive %arg0[], %arg1 : memref<!amdgpu.ds_barrier_state, #gpu.address_space<workgroup>>, i64 -> !amdgpu.ds_barrier_state
    %2 = amdgpu.ds_barrier_state_phase %0 : !amdgpu.ds_barrier_state -> i32
    %3 = amdgpu.ds_barrier_state_pending_count %0 : !amdgpu.ds_barrier_state -> i32
    %4 = amdgpu.ds_barrier_state_init_count %0 : !amdgpu.ds_barrier_state -> i32
    %5 = amdgpu.ds_barrier_state_phase_parity %0 : !amdgpu.ds_barrier_state -> i1
    return
  }
  func.func @dot_f16_f32(%arg0: vector<2xf16>, %arg1: vector<2xf16>, %arg2: f32) -> f32 {
    %0 = amdgpu.dot %arg0 * %arg1 + %arg2 : vector<2xf16>, vector<2xf16>, f32
    %1 = amdgpu.dot %arg0 * %arg1 + %arg2 {clamp} : vector<2xf16>, vector<2xf16>, f32
    return %0 : f32
  }
  func.func @dot_f16_f16(%arg0: vector<2xf16>, %arg1: vector<2xf16>, %arg2: f16) -> f16 {
    %0 = amdgpu.dot %arg0 * %arg1 + %arg2 : vector<2xf16>, vector<2xf16>, f16
    return %0 : f16
  }
  func.func @dot_bf16(%arg0: vector<2xbf16>, %arg1: vector<2xbf16>, %arg2: f32, %arg3: bf16) {
    %0 = amdgpu.dot %arg0 * %arg1 + %arg2 {clamp} : vector<2xbf16>, vector<2xbf16>, f32
    %1 = amdgpu.dot %arg0 * %arg1 + %arg3 : vector<2xbf16>, vector<2xbf16>, bf16
    return
  }
  func.func @dot_i16(%arg0: vector<2xi16>, %arg1: vector<2xi16>, %arg2: i32) -> i32 {
    %0 = amdgpu.dot %arg0 * %arg1 + %arg2 : vector<2xi16>, vector<2xi16>, i32
    %1 = amdgpu.dot %arg0 * %arg1 + %arg2 {clamp} : vector<2xi16>, vector<2xi16>, i32
    %2 = amdgpu.dot %arg0 * %arg1 + %arg2 {unsignedA, unsignedB} : vector<2xi16>, vector<2xi16>, i32
    return %0 : i32
  }
  func.func @dot_i8(%arg0: vector<4xi8>, %arg1: vector<4xi8>, %arg2: i32) -> i32 {
    %0 = amdgpu.dot %arg0 * %arg1 + %arg2 : vector<4xi8>, vector<4xi8>, i32
    %1 = amdgpu.dot %arg0 * %arg1 + %arg2 {clamp, unsignedA, unsignedB} : vector<4xi8>, vector<4xi8>, i32
    %2 = amdgpu.dot %arg0 * %arg1 + %arg2 {unsignedB} : vector<4xi8>, vector<4xi8>, i32
    %3 = amdgpu.dot %arg0 * %arg1 + %arg2 {unsignedA} : vector<4xi8>, vector<4xi8>, i32
    return %0 : i32
  }
  func.func @dot_i4(%arg0: vector<8xi4>, %arg1: vector<8xi4>, %arg2: i32) -> i32 {
    %0 = amdgpu.dot %arg0 * %arg1 + %arg2 : vector<8xi4>, vector<8xi4>, i32
    %1 = amdgpu.dot %arg0 * %arg1 + %arg2 {clamp, unsignedA, unsignedB} : vector<8xi4>, vector<8xi4>, i32
    %2 = amdgpu.dot %arg0 * %arg1 + %arg2 {unsignedA} : vector<8xi4>, vector<8xi4>, i32
    return %0 : i32
  }
  func.func @dot_fp8(%arg0: vector<4xf8E4M3FN>, %arg1: vector<4xf8E4M3FN>, %arg2: vector<4xf8E5M2>, %arg3: f32) -> f32 {
    %0 = amdgpu.dot %arg0 * %arg0 + %arg3 : vector<4xf8E4M3FN>, vector<4xf8E4M3FN>, f32
    %1 = amdgpu.dot %arg0 * %arg2 + %arg3 : vector<4xf8E4M3FN>, vector<4xf8E5M2>, f32
    %2 = amdgpu.dot %arg2 * %arg0 + %arg3 : vector<4xf8E5M2>, vector<4xf8E4M3FN>, f32
    %3 = amdgpu.dot %arg2 * %arg2 + %arg3 : vector<4xf8E5M2>, vector<4xf8E5M2>, f32
    return %0 : f32
  }
}

