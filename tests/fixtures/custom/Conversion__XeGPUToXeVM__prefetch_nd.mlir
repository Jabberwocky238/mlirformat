module {
  gpu.module @prefetch_nd_check {
    gpu.func @prefetch_nd(%arg0: memref<8x16xf32, 1>, %arg1: memref<8x16xf32, 1>) kernel {
      %memspacecast = memref.memory_space_cast %arg0 : memref<8x16xf32, 1> to memref<8x16xf32>
      %0 = xegpu.create_nd_tdesc %memspacecast : memref<8x16xf32> -> !xegpu.tensor_desc<8x16xf32, #xegpu.layout<lane_layout = [1, 16], lane_data = [1, 1]>>
      xegpu.prefetch_nd %0[0, 0] <{l1_hint = #xegpu.cache_hint<cached>, l2_hint = #xegpu.cache_hint<uncached>}> : !xegpu.tensor_desc<8x16xf32, #xegpu.layout<lane_layout = [1, 16], lane_data = [1, 1]>>
      gpu.return
    }
  }
}

