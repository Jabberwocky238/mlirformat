module {
  func.func @wmma_k4(%arg0: vector<2xf32>, %arg1: vector<8xf32>) {
    %0 = amdgpu.wmma 16x16x4 %arg0 * %arg0 + %arg1 : vector<2xf32>, vector<2xf32>, vector<8xf32>
    return
  }
  func.func @wmma_k32(%arg0: vector<16xf16>, %arg1: vector<16xbf16>, %arg2: vector<8xf32>, %arg3: vector<8xf16>, %arg4: vector<8xbf16>) {
    %0 = amdgpu.wmma 16x16x32 %arg0 * %arg0 + %arg2 : vector<16xf16>, vector<16xf16>, vector<8xf32>
    %1 = amdgpu.wmma 16x16x32 %arg0 * %arg0 + %arg3 : vector<16xf16>, vector<16xf16>, vector<8xf16>
    %2 = amdgpu.wmma 16x16x32 %arg1 * %arg1 + %arg2 : vector<16xbf16>, vector<16xbf16>, vector<8xf32>
    %3 = amdgpu.wmma 16x16x32 %arg1 * %arg1 + %arg4 : vector<16xbf16>, vector<16xbf16>, vector<8xbf16>
    return
  }
  func.func @wmma_k64(%arg0: vector<32xi8>, %arg1: vector<32xf8E4M3FN>, %arg2: vector<32xf8E5M2>, %arg3: vector<8xi32>, %arg4: vector<8xf32>, %arg5: vector<8xf16>) {
    %0 = amdgpu.wmma 16x16x64 %arg0 * %arg0 + %arg3 {clamp} : vector<32xi8>, vector<32xi8>, vector<8xi32>
    %1 = amdgpu.wmma 16x16x64 %arg1 * %arg1 + %arg4 : vector<32xf8E4M3FN>, vector<32xf8E4M3FN>, vector<8xf32>
    %2 = amdgpu.wmma 16x16x64 %arg1 * %arg1 + %arg5 : vector<32xf8E4M3FN>, vector<32xf8E4M3FN>, vector<8xf16>
    %3 = amdgpu.wmma 16x16x64 %arg1 * %arg2 + %arg4 : vector<32xf8E4M3FN>, vector<32xf8E5M2>, vector<8xf32>
    %4 = amdgpu.wmma 16x16x64 %arg1 * %arg2 + %arg5 : vector<32xf8E4M3FN>, vector<32xf8E5M2>, vector<8xf16>
    %5 = amdgpu.wmma 16x16x64 %arg2 * %arg2 + %arg4 : vector<32xf8E5M2>, vector<32xf8E5M2>, vector<8xf32>
    %6 = amdgpu.wmma 16x16x64 %arg2 * %arg2 + %arg5 : vector<32xf8E5M2>, vector<32xf8E5M2>, vector<8xf16>
    %7 = amdgpu.wmma 16x16x64 %arg2 * %arg1 + %arg4 : vector<32xf8E5M2>, vector<32xf8E4M3FN>, vector<8xf32>
    %8 = amdgpu.wmma 16x16x64 %arg2 * %arg1 + %arg5 : vector<32xf8E5M2>, vector<32xf8E4M3FN>, vector<8xf16>
    return
  }
  func.func @wmma_k128(%arg0: vector<64xf8E4M3FN>, %arg1: vector<64xf8E5M2>, %arg2: vector<8xf32>, %arg3: vector<8xf16>) {
    %0 = amdgpu.wmma 16x16x128 %arg0 * %arg0 + %arg2 : vector<64xf8E4M3FN>, vector<64xf8E4M3FN>, vector<8xf32>
    %1 = amdgpu.wmma 16x16x128 %arg0 * %arg0 + %arg3 : vector<64xf8E4M3FN>, vector<64xf8E4M3FN>, vector<8xf16>
    %2 = amdgpu.wmma 16x16x128 %arg0 * %arg1 + %arg2 : vector<64xf8E4M3FN>, vector<64xf8E5M2>, vector<8xf32>
    %3 = amdgpu.wmma 16x16x128 %arg0 * %arg1 + %arg3 : vector<64xf8E4M3FN>, vector<64xf8E5M2>, vector<8xf16>
    %4 = amdgpu.wmma 16x16x128 %arg1 * %arg1 + %arg2 : vector<64xf8E5M2>, vector<64xf8E5M2>, vector<8xf32>
    %5 = amdgpu.wmma 16x16x128 %arg1 * %arg1 + %arg3 : vector<64xf8E5M2>, vector<64xf8E5M2>, vector<8xf16>
    %6 = amdgpu.wmma 16x16x128 %arg1 * %arg0 + %arg2 : vector<64xf8E5M2>, vector<64xf8E4M3FN>, vector<8xf32>
    %7 = amdgpu.wmma 16x16x128 %arg1 * %arg0 + %arg3 : vector<64xf8E5M2>, vector<64xf8E4M3FN>, vector<8xf16>
    return
  }
  func.func @wmma_scale_16x16x128_fp8(%arg0: vector<64xf8E4M3FN>, %arg1: vector<64xf6E2M3FN>, %arg2: vector<8xf32>, %arg3: vector<4xf8E8M0FNU>) {
    %0 = amdgpu.scaled_wmma 16x16x128 (%arg3 * %arg0) * (%arg3 * %arg0) + %arg2 {a_first_scale_lane = 0 : i32, b_first_scale_lane = 0 : i32} : vector<4xf8E8M0FNU>, vector<64xf8E4M3FN>, vector<4xf8E8M0FNU>, vector<64xf8E4M3FN>, vector<8xf32>
    %1 = amdgpu.scaled_wmma 16x16x128 (%arg3 * %arg1) * (%arg3 * %arg1) + %arg2 {a_first_scale_lane = 16 : i32, b_first_scale_lane = 0 : i32} : vector<4xf8E8M0FNU>, vector<64xf6E2M3FN>, vector<4xf8E8M0FNU>, vector<64xf6E2M3FN>, vector<8xf32>
    return
  }
  func.func @wmma_scale_16x16x128_fp6(%arg0: vector<64xf6E2M3FN>, %arg1: vector<64xf6E3M2FN>, %arg2: vector<8xf32>, %arg3: vector<4xf8E8M0FNU>) {
    %0 = amdgpu.scaled_wmma 16x16x128 (%arg3 * %arg0) * (%arg3 * %arg0) + %arg2 {a_first_scale_lane = 0 : i32, b_first_scale_lane = 0 : i32} : vector<4xf8E8M0FNU>, vector<64xf6E2M3FN>, vector<4xf8E8M0FNU>, vector<64xf6E2M3FN>, vector<8xf32>
    %1 = amdgpu.scaled_wmma 16x16x128 (%arg3 * %arg1) * (%arg3 * %arg1) + %arg2 {a_first_scale_lane = 0 : i32, b_first_scale_lane = 0 : i32} : vector<4xf8E8M0FNU>, vector<64xf6E3M2FN>, vector<4xf8E8M0FNU>, vector<64xf6E3M2FN>, vector<8xf32>
    return
  }
  func.func @wmma_scale_16x16x128_mixed(%arg0: vector<64xf8E4M3FN>, %arg1: vector<64xf6E2M3FN>, %arg2: vector<64xf4E2M1FN>, %arg3: vector<8xf32>, %arg4: vector<4xf8E8M0FNU>, %arg5: vector<4xf8E4M3FN>) {
    %0 = amdgpu.scaled_wmma 16x16x128 (%arg4 * %arg0) * (%arg5 * %arg2) + %arg3 {a_first_scale_lane = 0 : i32, b_first_scale_lane = 0 : i32} : vector<4xf8E8M0FNU>, vector<64xf8E4M3FN>, vector<4xf8E4M3FN>, vector<64xf4E2M1FN>, vector<8xf32>
    %1 = amdgpu.scaled_wmma 16x16x128 (%arg4 * %arg1) * (%arg5 * %arg2) + %arg3 {a_first_scale_lane = 0 : i32, b_first_scale_lane = 0 : i32} : vector<4xf8E8M0FNU>, vector<64xf6E2M3FN>, vector<4xf8E4M3FN>, vector<64xf4E2M1FN>, vector<8xf32>
    return
  }
  func.func @wmma_scale16_16x16x128_fp8(%arg0: vector<64xf8E4M3FN>, %arg1: vector<64xf6E3M2FN>, %arg2: vector<8xf32>, %arg3: vector<8xf8E8M0FNU>) {
    %0 = amdgpu.scaled_wmma 16x16x128 (%arg3 * %arg0) * (%arg3 * %arg0) + %arg2 {a_first_scale_lane = 0 : i32, b_first_scale_lane = 0 : i32} : vector<8xf8E8M0FNU>, vector<64xf8E4M3FN>, vector<8xf8E8M0FNU>, vector<64xf8E4M3FN>, vector<8xf32>
    %1 = amdgpu.scaled_wmma 16x16x128 (%arg3 * %arg1) * (%arg3 * %arg1) + %arg2 {a_first_scale_lane = 16 : i32, b_first_scale_lane = 0 : i32} : vector<8xf8E8M0FNU>, vector<64xf6E3M2FN>, vector<8xf8E8M0FNU>, vector<64xf6E3M2FN>, vector<8xf32>
    return
  }
  func.func @wmma_scale_32x16x128_fp4(%arg0: vector<128xf4E2M1FN>, %arg1: vector<64xf4E2M1FN>, %arg2: vector<16xf32>, %arg3: vector<4xf8E4M3FN>) {
    %0 = amdgpu.scaled_wmma 32x16x128 (%arg3 * %arg0) * (%arg3 * %arg1) + %arg2 {a_first_scale_lane = 0 : i32, b_first_scale_lane = 0 : i32} : vector<4xf8E4M3FN>, vector<128xf4E2M1FN>, vector<4xf8E4M3FN>, vector<64xf4E2M1FN>, vector<16xf32>
    return
  }
  func.func @wmma_scale16_32x16x128_fp4(%arg0: vector<128xf4E2M1FN>, %arg1: vector<64xf4E2M1FN>, %arg2: vector<16xf32>, %arg3: vector<8xf8E4M3FN>) {
    %0 = amdgpu.scaled_wmma 32x16x128 (%arg3 * %arg0) * (%arg3 * %arg1) + %arg2 {a_first_scale_lane = 0 : i32, b_first_scale_lane = 0 : i32} : vector<8xf8E4M3FN>, vector<128xf4E2M1FN>, vector<8xf8E4M3FN>, vector<64xf4E2M1FN>, vector<16xf32>
    return
  }
}

