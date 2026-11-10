module {
  func.func @fat_raw_buffer_cast(%arg0: memref<8xi32, #gpu.address_space<global>>) -> memref<8xi32, #amdgpu.address_space<fat_raw_buffer>> {
    %0 = amdgpu.fat_raw_buffer_cast %arg0 : memref<8xi32, #gpu.address_space<global>> to memref<8xi32, #amdgpu.address_space<fat_raw_buffer>>
    return %0 : memref<8xi32, #amdgpu.address_space<fat_raw_buffer>>
  }
  func.func @fat_raw_buffer_cast_0d(%arg0: memref<i32, #gpu.address_space<global>>) -> memref<i32, #amdgpu.address_space<fat_raw_buffer>> {
    %0 = amdgpu.fat_raw_buffer_cast %arg0 : memref<i32, #gpu.address_space<global>> to memref<i32, #amdgpu.address_space<fat_raw_buffer>>
    return %0 : memref<i32, #amdgpu.address_space<fat_raw_buffer>>
  }
  func.func @fat_raw_buffer_cast_dyn_size_offset(%arg0: memref<?xi32, strided<[1], offset: ?>, #gpu.address_space<global>>) -> memref<?xi32, strided<[1], offset: ?>, #amdgpu.address_space<fat_raw_buffer>> {
    %0 = amdgpu.fat_raw_buffer_cast %arg0 : memref<?xi32, strided<[1], offset: ?>, #gpu.address_space<global>> to memref<?xi32, strided<[1], offset: ?>, #amdgpu.address_space<fat_raw_buffer>>
    return %0 : memref<?xi32, strided<[1], offset: ?>, #amdgpu.address_space<fat_raw_buffer>>
  }
  func.func @fat_raw_buffer_cast_reset_offset(%arg0: memref<?xi32, strided<[1], offset: ?>, #gpu.address_space<global>>) -> memref<?xi32, #amdgpu.address_space<fat_raw_buffer>> {
    %0 = amdgpu.fat_raw_buffer_cast %arg0 resetOffset : memref<?xi32, strided<[1], offset: ?>, #gpu.address_space<global>> to memref<?xi32, #amdgpu.address_space<fat_raw_buffer>>
    return %0 : memref<?xi32, #amdgpu.address_space<fat_raw_buffer>>
  }
  func.func @fat_raw_buffer_cast_valid_bytes(%arg0: memref<8xi32, #gpu.address_space<global>>) -> memref<8xi32, #amdgpu.address_space<fat_raw_buffer>> {
    %c-1_i64 = arith.constant -1 : i64
    %0 = amdgpu.fat_raw_buffer_cast %arg0 validBytes(%c-1_i64) : memref<8xi32, #gpu.address_space<global>> to memref<8xi32, #amdgpu.address_space<fat_raw_buffer>>
    return %0 : memref<8xi32, #amdgpu.address_space<fat_raw_buffer>>
  }
  func.func @fat_raw_buffer_cast_bounds_check(%arg0: memref<8xi32, #gpu.address_space<global>>) -> memref<8xi32, #amdgpu.address_space<fat_raw_buffer>> {
    %0 = amdgpu.fat_raw_buffer_cast %arg0 boundsCheck(false) : memref<8xi32, #gpu.address_space<global>> to memref<8xi32, #amdgpu.address_space<fat_raw_buffer>>
    return %0 : memref<8xi32, #amdgpu.address_space<fat_raw_buffer>>
  }
  func.func @fat_raw_buffer_cast_cache_swizzle(%arg0: memref<64x64xi32, #gpu.address_space<global>>, %arg1: i14) -> memref<64x64xi32, #amdgpu.address_space<fat_raw_buffer>> {
    %0 = amdgpu.fat_raw_buffer_cast %arg0 cacheSwizzleStride(%arg1) : memref<64x64xi32, #gpu.address_space<global>> to memref<64x64xi32, #amdgpu.address_space<fat_raw_buffer>>
    return %0 : memref<64x64xi32, #amdgpu.address_space<fat_raw_buffer>>
  }
  func.func @gpu_gcn_raw_buffer_load_scalar_i32(%arg0: memref<i32>) -> i32 {
    %0 = amdgpu.raw_buffer_load %arg0[] : memref<i32> -> i32
    return %0 : i32
  }
  func.func @gpu_gcn_raw_buffer_load_i32(%arg0: memref<64xi32>, %arg1: i32) -> i32 {
    %0 = amdgpu.raw_buffer_load %arg0[%arg1] : memref<64xi32>, i32 -> i32
    return %0 : i32
  }
  func.func @gpu_gcn_raw_buffer_load_i32_strided(%arg0: memref<16x16xi32, strided<[?, ?], offset: ?>>, %arg1: i32, %arg2: i32) -> i32 {
    %0 = amdgpu.raw_buffer_load %arg0[%arg1, %arg2] : memref<16x16xi32, strided<[?, ?], offset: ?>>, i32, i32 -> i32
    return %0 : i32
  }
  func.func @gpu_gcn_raw_buffer_load_i32_oob_off(%arg0: memref<64xi32>, %arg1: i32) -> i32 {
    %0 = amdgpu.raw_buffer_load {boundsCheck = false} %arg0[%arg1] : memref<64xi32>, i32 -> i32
    return %0 : i32
  }
  func.func @gpu_gcn_raw_buffer_load_1xi32(%arg0: memref<64xi32>, %arg1: i32) -> vector<1xi32> {
    %0 = amdgpu.raw_buffer_load %arg0[%arg1] : memref<64xi32>, i32 -> vector<1xi32>
    return %0 : vector<1xi32>
  }
  func.func @gpu_gcn_raw_buffer_load_2xi32(%arg0: memref<64xi32>, %arg1: i32) -> vector<2xi32> {
    %0 = amdgpu.raw_buffer_load %arg0[%arg1] : memref<64xi32>, i32 -> vector<2xi32>
    return %0 : vector<2xi32>
  }
  func.func @gpu_gcn_raw_buffer_load_i8(%arg0: memref<64xi8>, %arg1: i32) -> i8 {
    %0 = amdgpu.raw_buffer_load %arg0[%arg1] : memref<64xi8>, i32 -> i8
    return %0 : i8
  }
  func.func @gpu_gcn_raw_buffer_load_2xi8(%arg0: memref<64xi8>, %arg1: i32) -> vector<2xi8> {
    %0 = amdgpu.raw_buffer_load %arg0[%arg1] : memref<64xi8>, i32 -> vector<2xi8>
    return %0 : vector<2xi8>
  }
  func.func @gpu_gcn_raw_buffer_load_16xi8(%arg0: memref<64xi8>, %arg1: i32) -> vector<16xi8> {
    %0 = amdgpu.raw_buffer_load %arg0[%arg1] : memref<64xi8>, i32 -> vector<16xi8>
    return %0 : vector<16xi8>
  }
  func.func @gpu_gcn_raw_buffer_load_f8E5M2FNUZ(%arg0: memref<64xf8E5M2FNUZ>, %arg1: i32) -> f8E5M2FNUZ {
    %0 = amdgpu.raw_buffer_load %arg0[%arg1] : memref<64xf8E5M2FNUZ>, i32 -> f8E5M2FNUZ
    return %0 : f8E5M2FNUZ
  }
  func.func @gpu_gcn_raw_buffer_load_4xf8E4M3FNUZ(%arg0: memref<64xf8E4M3FNUZ>, %arg1: i32) -> vector<4xf8E4M3FNUZ> {
    %0 = amdgpu.raw_buffer_load %arg0[%arg1] : memref<64xf8E4M3FNUZ>, i32 -> vector<4xf8E4M3FNUZ>
    return %0 : vector<4xf8E4M3FNUZ>
  }
  func.func @gpu_gcn_raw_buffer_store_scalar_i32(%arg0: i32, %arg1: memref<i32>) {
    amdgpu.raw_buffer_store %arg0 -> %arg1[] : i32 -> memref<i32>
    return
  }
  func.func @gpu_gcn_raw_buffer_store_i32(%arg0: i32, %arg1: memref<64xi32>, %arg2: i32) {
    amdgpu.raw_buffer_store %arg0 -> %arg1[%arg2] : i32 -> memref<64xi32>, i32
    return
  }
  func.func @gpu_gcn_raw_buffer_store_1xf32(%arg0: vector<1xf32>, %arg1: memref<64xf32>, %arg2: i32) {
    amdgpu.raw_buffer_store %arg0 -> %arg1[%arg2] : vector<1xf32> -> memref<64xf32>, i32
    return
  }
  func.func @gpu_gcn_raw_buffer_store_2xi8(%arg0: vector<2xi8>, %arg1: memref<64xi8>, %arg2: i32) {
    amdgpu.raw_buffer_store %arg0 -> %arg1[%arg2] : vector<2xi8> -> memref<64xi8>, i32
    return
  }
  func.func @gpu_gcn_raw_buffer_store_16xi8(%arg0: vector<16xi8>, %arg1: memref<64xi8>, %arg2: i32) {
    amdgpu.raw_buffer_store %arg0 -> %arg1[%arg2] : vector<16xi8> -> memref<64xi8>, i32
    return
  }
  func.func @gpu_gcn_raw_buffer_atomic_fadd_f32(%arg0: f32, %arg1: memref<64xf32>, %arg2: i32) -> f32 {
    %0 = amdgpu.raw_buffer_atomic_fadd %arg0 -> %arg1[%arg2] : f32 -> memref<64xf32>, i32
    return %0 : f32
  }
  func.func @gpu_gcn_raw_buffer_atomic_fadd_v2f16(%arg0: vector<2xf16>, %arg1: memref<64xf16>, %arg2: i32) -> vector<2xf16> {
    %0 = amdgpu.raw_buffer_atomic_fadd %arg0 -> %arg1[%arg2] : vector<2xf16> -> memref<64xf16>, i32
    return %0 : vector<2xf16>
  }
  func.func @gpu_gcn_raw_buffer_atomic_fadd_v2bf16(%arg0: vector<2xbf16>, %arg1: memref<64xbf16>, %arg2: i32) -> vector<2xbf16> {
    %0 = amdgpu.raw_buffer_atomic_fadd %arg0 -> %arg1[%arg2] : vector<2xbf16> -> memref<64xbf16>, i32
    return %0 : vector<2xbf16>
  }
  func.func @gpu_gcn_raw_buffer_atomic_fmax_f32(%arg0: f32, %arg1: memref<64xf32>, %arg2: i32) -> f32 {
    %0 = amdgpu.raw_buffer_atomic_fmax %arg0 -> %arg1[%arg2] : f32 -> memref<64xf32>, i32
    return %0 : f32
  }
  func.func @gpu_gcn_raw_buffer_atomic_smax_i32(%arg0: i32, %arg1: memref<64xi32>, %arg2: i32) -> i32 {
    %0 = amdgpu.raw_buffer_atomic_smax %arg0 -> %arg1[%arg2] : i32 -> memref<64xi32>, i32
    return %0 : i32
  }
  func.func @gpu_gcn_raw_buffer_atomic_umin_i32(%arg0: i32, %arg1: memref<64xi32>, %arg2: i32) -> i32 {
    %0 = amdgpu.raw_buffer_atomic_umin %arg0 -> %arg1[%arg2] : i32 -> memref<64xi32>, i32
    return %0 : i32
  }
  func.func @amdgpu_raw_buffer_atomic_cmpswap_f32(%arg0: f32, %arg1: f32, %arg2: memref<64xf32>, %arg3: i32) -> f32 {
    %0 = amdgpu.raw_buffer_atomic_cmpswap %arg0, %arg1 -> %arg2[%arg3] : f32 -> memref<64xf32>, i32
    return %0 : f32
  }
  func.func @amdgpu_raw_buffer_atomic_cmpswap_i64(%arg0: i64, %arg1: i64, %arg2: memref<64xi64>, %arg3: i32) -> i64 {
    %0 = amdgpu.raw_buffer_atomic_cmpswap %arg0, %arg1 -> %arg2[%arg3] : i64 -> memref<64xi64>, i32
    return %0 : i64
  }
  func.func @amdgpu_raw_buffer_atomic_cmpswap_v2f16(%arg0: vector<2xf16>, %arg1: vector<2xf16>, %arg2: memref<64xf16>, %arg3: i32) -> vector<2xf16> {
    %0 = amdgpu.raw_buffer_atomic_cmpswap %arg0, %arg1 -> %arg2[%arg3] : vector<2xf16> -> memref<64xf16>, i32
    return %0 : vector<2xf16>
  }
  func.func @lds_barrier() {
    amdgpu.lds_barrier
    return
  }
  func.func @sched_barrier() {
    amdgpu.sched_barrier allow = none
    amdgpu.sched_barrier allow = non_mem_non_sideeffect
    amdgpu.sched_barrier allow = valu|all_vmem
    amdgpu.sched_barrier allow = all
    return
  }
}

