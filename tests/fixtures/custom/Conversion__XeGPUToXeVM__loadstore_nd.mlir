module {
  gpu.module @load_store_check {
    gpu.func @load_store(%arg0: memref<8x16xf32, 1>, %arg1: memref<8x16xf32, 1>) kernel {
      %memspacecast = memref.memory_space_cast %arg0 : memref<8x16xf32, 1> to memref<8x16xf32>
      %memspacecast_0 = memref.memory_space_cast %arg1 : memref<8x16xf32, 1> to memref<8x16xf32>
      %0 = xegpu.create_nd_tdesc %memspacecast : memref<8x16xf32> -> !xegpu.tensor_desc<8x16xf32>
      %1 = xegpu.load_nd %0[0, 0] <{l1_hint = #xegpu.cache_hint<cached>, l2_hint = #xegpu.cache_hint<uncached>}> : !xegpu.tensor_desc<8x16xf32> -> vector<8xf32>
      %thread_id_x = gpu.thread_id  x
      %2 = arith.index_cast %thread_id_x : index to i32
      %3 = arith.sitofp %2 : i32 to f32
      %4 = vector.insert %3, %1 [0] : f32 into vector<8xf32>
      %5 = xegpu.create_nd_tdesc %memspacecast_0 : memref<8x16xf32> -> !xegpu.tensor_desc<8x16xf32>
      xegpu.store_nd %4, %5[0, 0] <{l1_hint = #xegpu.cache_hint<write_back>, l2_hint = #xegpu.cache_hint<uncached>}> : vector<8xf32>, !xegpu.tensor_desc<8x16xf32>
      gpu.return
    }
  }
}

