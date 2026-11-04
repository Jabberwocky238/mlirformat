module {
  gpu.module @load_store_check {
    gpu.func @load_store(%arg0: memref<512xf32, 1>, %arg1: memref<256xf32, 1>) kernel {
      %memspacecast = memref.memory_space_cast %arg0 : memref<512xf32, 1> to memref<512xf32>
      %memspacecast_0 = memref.memory_space_cast %arg1 : memref<256xf32, 1> to memref<256xf32>
      %0 = xegpu.create_nd_tdesc %memspacecast : memref<512xf32> -> !xegpu.tensor_desc<32xf32>
      %1 = xegpu.load_nd %0[96] <{l1_hint = #xegpu.cache_hint<cached>, l2_hint = #xegpu.cache_hint<uncached>}> : !xegpu.tensor_desc<32xf32> -> vector<2xf32>
      %2 = xegpu.create_nd_tdesc %memspacecast_0 : memref<256xf32> -> !xegpu.tensor_desc<32xf32>
      xegpu.store_nd %1, %2[128] <{l1_hint = #xegpu.cache_hint<write_back>, l2_hint = #xegpu.cache_hint<uncached>}> : vector<2xf32>, !xegpu.tensor_desc<32xf32>
      gpu.return
    }
  }
}

