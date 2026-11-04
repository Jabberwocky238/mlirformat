module {
  func.func @LLVM_x86_avx512_mask_ps_512(%arg0: vector<16xf32>, %arg1: vector<16xf32>, %arg2: vector<16xf32>, %arg3: i16, %arg4: i16) -> vector<16xf32> {
    %c15_i32 = arith.constant 15 : i32
    %c42_i32 = arith.constant 42 : i32
    %0 = x86vector.avx512.mask.rndscale %arg0, %c15_i32, %arg1, %arg3, %c42_i32 : vector<16xf32>
    %1 = x86vector.avx512.mask.scalef %0, %arg1, %arg2, %arg4, %c42_i32 : vector<16xf32>
    return %1 : vector<16xf32>
  }
  func.func @LLVM_x86_avx512_mask_pd_512(%arg0: vector<8xf64>, %arg1: vector<8xf64>, %arg2: vector<8xf64>, %arg3: i8, %arg4: i8) -> vector<8xf64> {
    %c15_i32 = arith.constant 15 : i32
    %c42_i32 = arith.constant 42 : i32
    %0 = x86vector.avx512.mask.rndscale %arg0, %c15_i32, %arg1, %arg3, %c42_i32 : vector<8xf64>
    %1 = x86vector.avx512.mask.scalef %0, %arg1, %arg2, %arg4, %c42_i32 : vector<8xf64>
    return %1 : vector<8xf64>
  }
  func.func @LLVM_x86_mask_compress(%arg0: vector<16xi1>, %arg1: vector<16xf32>) -> vector<16xf32> {
    %0 = x86vector.avx512.mask.compress %arg0, %arg1, %arg1 : vector<16xf32>, vector<16xf32>
    return %0 : vector<16xf32>
  }
  func.func @LLVM_x86_vp2intersect_d_512(%arg0: vector<16xi32>, %arg1: vector<16xi32>) -> (vector<16xi1>, vector<16xi1>) {
    %k1, %k2 = x86vector.avx512.vp2intersect %arg0, %arg1 : vector<16xi32>
    return %k1, %k2 : vector<16xi1>, vector<16xi1>
  }
  func.func @LLVM_x86_vp2intersect_q_512(%arg0: vector<8xi64>, %arg1: vector<8xi64>) -> (vector<8xi1>, vector<8xi1>) {
    %k1, %k2 = x86vector.avx512.vp2intersect %arg0, %arg1 : vector<8xi64>
    return %k1, %k2 : vector<8xi1>, vector<8xi1>
  }
  func.func @LLVM_x86_avx512bf16_dpbf16ps_128(%arg0: vector<4xf32>, %arg1: vector<8xbf16>, %arg2: vector<8xbf16>) -> vector<4xf32> {
    %0 = x86vector.avx512.dot %arg0, %arg1, %arg2 : vector<8xbf16> -> vector<4xf32>
    return %0 : vector<4xf32>
  }
  func.func @LLVM_x86_avx512bf16_dpbf16ps_256(%arg0: vector<8xf32>, %arg1: vector<16xbf16>, %arg2: vector<16xbf16>) -> vector<8xf32> {
    %0 = x86vector.avx512.dot %arg0, %arg1, %arg2 : vector<16xbf16> -> vector<8xf32>
    return %0 : vector<8xf32>
  }
  func.func @LLVM_x86_avx512bf16_dpbf16ps_512(%arg0: vector<16xf32>, %arg1: vector<32xbf16>, %arg2: vector<32xbf16>) -> vector<16xf32> {
    %0 = x86vector.avx512.dot %arg0, %arg1, %arg2 : vector<32xbf16> -> vector<16xf32>
    return %0 : vector<16xf32>
  }
  func.func @LLVM_x86_avx512bf16_cvtneps2bf16_256(%arg0: vector<8xf32>) -> vector<8xbf16> {
    %0 = x86vector.avx512.cvt.packed.f32_to_bf16 %arg0 : vector<8xf32> -> vector<8xbf16>
    return %0 : vector<8xbf16>
  }
  func.func @LLVM_x86_avx512bf16_cvtneps2bf16_512(%arg0: vector<16xf32>) -> vector<16xbf16> {
    %0 = x86vector.avx512.cvt.packed.f32_to_bf16 %arg0 : vector<16xf32> -> vector<16xbf16>
    return %0 : vector<16xbf16>
  }
  func.func @LLVM_x86_avxbf16_vcvtneebf162ps128(%arg0: memref<8xbf16>) -> vector<4xf32> {
    %0 = x86vector.avx.cvt.packed.even.indexed_to_f32 %arg0 : memref<8xbf16> -> vector<4xf32>
    return %0 : vector<4xf32>
  }
  func.func @LLVM_x86_avxbf16_vcvtneebf162ps256(%arg0: memref<16xbf16>) -> vector<8xf32> {
    %0 = x86vector.avx.cvt.packed.even.indexed_to_f32 %arg0 : memref<16xbf16> -> vector<8xf32>
    return %0 : vector<8xf32>
  }
  func.func @LLVM_x86_avxbf16_vcvtneobf162ps128(%arg0: memref<8xbf16>) -> vector<4xf32> {
    %0 = x86vector.avx.cvt.packed.odd.indexed_to_f32 %arg0 : memref<8xbf16> -> vector<4xf32>
    return %0 : vector<4xf32>
  }
  func.func @LLVM_x86_avxbf16_vcvtneobf162ps256(%arg0: memref<16xbf16>) -> vector<8xf32> {
    %0 = x86vector.avx.cvt.packed.odd.indexed_to_f32 %arg0 : memref<16xbf16> -> vector<8xf32>
    return %0 : vector<8xf32>
  }
  func.func @LLVM_x86_avxbf16_vbcstnebf162ps128(%arg0: memref<1xbf16>) -> vector<4xf32> {
    %0 = x86vector.avx.bcst_to_f32.packed %arg0 : memref<1xbf16> -> vector<4xf32>
    return %0 : vector<4xf32>
  }
  func.func @LLVM_x86_avxbf16_vbcstnebf162ps256(%arg0: memref<1xbf16>) -> vector<8xf32> {
    %0 = x86vector.avx.bcst_to_f32.packed %arg0 : memref<1xbf16> -> vector<8xf32>
    return %0 : vector<8xf32>
  }
  func.func @LLVM_x86_avxf16_vcvtneeph2ps128(%arg0: memref<8xf16>) -> vector<4xf32> {
    %0 = x86vector.avx.cvt.packed.even.indexed_to_f32 %arg0 : memref<8xf16> -> vector<4xf32>
    return %0 : vector<4xf32>
  }
  func.func @LLVM_x86_avxf16_vcvtneeph2ps256(%arg0: memref<16xf16>) -> vector<8xf32> {
    %0 = x86vector.avx.cvt.packed.even.indexed_to_f32 %arg0 : memref<16xf16> -> vector<8xf32>
    return %0 : vector<8xf32>
  }
  func.func @LLVM_x86_avxf16_vcvtneoph2ps128(%arg0: memref<8xf16>) -> vector<4xf32> {
    %0 = x86vector.avx.cvt.packed.odd.indexed_to_f32 %arg0 : memref<8xf16> -> vector<4xf32>
    return %0 : vector<4xf32>
  }
  func.func @LLVM_x86_avxf16_vcvtneoph2ps256(%arg0: memref<16xf16>) -> vector<8xf32> {
    %0 = x86vector.avx.cvt.packed.odd.indexed_to_f32 %arg0 : memref<16xf16> -> vector<8xf32>
    return %0 : vector<8xf32>
  }
  func.func @LLVM_x86_avxf16_vbcstnesh2ps128(%arg0: memref<1xf16>) -> vector<4xf32> {
    %0 = x86vector.avx.bcst_to_f32.packed %arg0 : memref<1xf16> -> vector<4xf32>
    return %0 : vector<4xf32>
  }
  func.func @LLVM_x86_avxf16_vbcstnesh2ps256(%arg0: memref<1xf16>) -> vector<8xf32> {
    %0 = x86vector.avx.bcst_to_f32.packed %arg0 : memref<1xf16> -> vector<8xf32>
    return %0 : vector<8xf32>
  }
  func.func @LLVM_x86_avx_rsqrt_ps_256(%arg0: vector<8xf32>) -> vector<8xf32> {
    %0 = x86vector.avx.rsqrt %arg0 : vector<8xf32>
    return %0 : vector<8xf32>
  }
  func.func @LLVM_x86_avx_dp_ps_256(%arg0: vector<8xf32>, %arg1: vector<8xf32>) -> vector<8xf32> {
    %0 = x86vector.avx.intr.dot %arg0, %arg1 : vector<8xf32>
    return %0 : vector<8xf32>
  }
  func.func @LLVM_x86_avx2_vpdpbssd_128(%arg0: vector<4xi32>, %arg1: vector<16xi8>, %arg2: vector<16xi8>) -> vector<4xi32> {
    %0 = x86vector.avx.dot.i8 %arg0, %arg1, %arg2 : vector<16xi8> -> vector<4xi32>
    return %0 : vector<4xi32>
  }
  func.func @LLVM_x86_avx2_vpdpbssd_256(%arg0: vector<8xi32>, %arg1: vector<32xi8>, %arg2: vector<32xi8>) -> vector<8xi32> {
    %0 = x86vector.avx.dot.i8 %arg0, %arg1, %arg2 : vector<32xi8> -> vector<8xi32>
    return %0 : vector<8xi32>
  }
}

