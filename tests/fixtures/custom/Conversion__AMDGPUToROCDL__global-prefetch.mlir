module {
  func.func @glb_prefetch0(%arg0: memref<64x64xf16, #gpu.address_space<global>>, %arg1: i64, %arg2: i64) {
    amdgpu.global_prefetch %arg0[%arg1, %arg2] HT WGP : memref<64x64xf16, #gpu.address_space<global>>
    return
  }
  func.func @glb_prefetch1(%arg0: memref<64x64xf16, #gpu.address_space<global>>, %arg1: i64, %arg2: i64) {
    amdgpu.global_prefetch %arg0[%arg1, %arg2] HT SE speculative : memref<64x64xf16, #gpu.address_space<global>>
    return
  }
  func.func @glb_prefetch2(%arg0: memref<64x64xf16, #gpu.address_space<global>>, %arg1: i64, %arg2: i64) {
    amdgpu.global_prefetch %arg0[%arg1, %arg2] RT DEV speculative : memref<64x64xf16, #gpu.address_space<global>>
    return
  }
  func.func @glb_prefetch3(%arg0: memref<64x64xf16, #gpu.address_space<global>>, %arg1: i64, %arg2: i64) {
    amdgpu.global_prefetch %arg0[%arg1, %arg2] NT_RT SE speculative : memref<64x64xf16, #gpu.address_space<global>>
    return
  }
}

