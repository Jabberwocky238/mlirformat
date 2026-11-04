module {
  gpu.module @prefetch_check {
    gpu.func @prefetch_matrix_a(%arg0: memref<16x128xi4, 1>) kernel {
      %memspacecast = memref.memory_space_cast %arg0 : memref<16x128xi4, 1> to memref<16x128xi4>
      %0 = xegpu.create_nd_tdesc %memspacecast : memref<16x128xi4> -> !xegpu.tensor_desc<8x64xi4>
      xegpu.prefetch_nd %0[8, 64] <{l1_hint = #xegpu.cache_hint<cached>, l2_hint = #xegpu.cache_hint<uncached>}> : !xegpu.tensor_desc<8x64xi4>
      gpu.return
    }
  }
}

