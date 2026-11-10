module {
  gpu.module @load_check {
    gpu.func @load_nd_transpose_f16(%arg0: memref<16x16xf16, 1>, %arg1: memref<16x16xf16, 1>) kernel {
      %memspacecast = memref.memory_space_cast %arg0 : memref<16x16xf16, 1> to memref<16x16xf16>
      %memspacecast_0 = memref.memory_space_cast %arg1 : memref<16x16xf16, 1> to memref<16x16xf16>
      %0 = xegpu.create_nd_tdesc %memspacecast : memref<16x16xf16> -> !xegpu.tensor_desc<16x16xf16>
      %1 = xegpu.load_nd %0[0, 16] <{l1_hint = #xegpu.cache_hint<cached>, l2_hint = #xegpu.cache_hint<uncached>, transpose = array<i64: 1, 0>}> : !xegpu.tensor_desc<16x16xf16> -> vector<16xf16>
      %c0 = arith.constant 0 : index
      vector.store %1, %memspacecast_0[%c0, %c0] : memref<16x16xf16>, vector<16xf16>
      gpu.return
    }
  }
}

