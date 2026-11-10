module {
  gpu.module @load_store_check {
    gpu.func @load_store(%arg0: memref<8x16xf32, 1>, %arg1: memref<8x16xf32, 1>) kernel {
      %memspacecast = memref.memory_space_cast %arg0 : memref<8x16xf32, 1> to memref<8x16xf32>
      %memspacecast_0 = memref.memory_space_cast %arg1 : memref<8x16xf32, 1> to memref<8x16xf32>
      %0 = xegpu.create_nd_tdesc %memspacecast : memref<8x16xf32> -> !xegpu.tensor_desc<8x16xf32>
      %1 = xegpu.load_nd %0[0, 0] <{l1_hint = #xegpu.cache_hint<cached>, l2_hint = #xegpu.cache_hint<uncached>}> : !xegpu.tensor_desc<8x16xf32> -> vector<8xf32>
      %thread_id_x = gpu.thread_id x
      %2 = arith.index_cast %thread_id_x : index to i32
      %3 = arith.sitofp %2 : i32 to f32
      %4 = vector.insert %3, %1 [0] : f32 into vector<8xf32>
      %5 = xegpu.create_nd_tdesc %memspacecast_0 : memref<8x16xf32> -> !xegpu.tensor_desc<8x16xf32>
      xegpu.store_nd %4, %5[0, 0] <{l1_hint = #xegpu.cache_hint<write_back>, l2_hint = #xegpu.cache_hint<uncached>}> : vector<8xf32>, !xegpu.tensor_desc<8x16xf32>
      gpu.return
    }
    gpu.func @load_store_with_partial_cache_hints(%arg0: memref<8x16xf32, 1>, %arg1: memref<8x16xf32, 1>) kernel {
      %memspacecast = memref.memory_space_cast %arg0 : memref<8x16xf32, 1> to memref<8x16xf32>
      %memspacecast_0 = memref.memory_space_cast %arg1 : memref<8x16xf32, 1> to memref<8x16xf32>
      %0 = xegpu.create_nd_tdesc %memspacecast : memref<8x16xf32> -> !xegpu.tensor_desc<8x16xf32>
      %1 = xegpu.load_nd %0[0, 0] <{l1_hint = #xegpu.cache_hint<cached>}> : !xegpu.tensor_desc<8x16xf32> -> vector<8xf32>
      %thread_id_x = gpu.thread_id x
      %2 = arith.index_cast %thread_id_x : index to i32
      %3 = arith.sitofp %2 : i32 to f32
      %4 = vector.insert %3, %1 [0] : f32 into vector<8xf32>
      %5 = xegpu.create_nd_tdesc %memspacecast_0 : memref<8x16xf32> -> !xegpu.tensor_desc<8x16xf32>
      xegpu.store_nd %4, %5[0, 0]  : vector<8xf32>, !xegpu.tensor_desc<8x16xf32>
      gpu.return
    }
    gpu.func @load_nd_8bit(%arg0: memref<32x16xi8, 1>, %arg1: memref<32x16xi8, 1>) kernel {
      %memspacecast = memref.memory_space_cast %arg0 : memref<32x16xi8, 1> to memref<32x16xi8>
      %memspacecast_0 = memref.memory_space_cast %arg1 : memref<32x16xi8, 1> to memref<32x16xi8>
      %0 = xegpu.create_nd_tdesc %memspacecast : memref<32x16xi8> -> !xegpu.tensor_desc<32x16xi8>
      %1 = xegpu.load_nd %0[0, 0] <{l1_hint = #xegpu.cache_hint<cached>, l2_hint = #xegpu.cache_hint<uncached>}> : !xegpu.tensor_desc<32x16xi8> -> vector<32xi8>
      %c0 = arith.constant 0 : index
      vector.store %1, %memspacecast_0[%c0, %c0] : memref<32x16xi8>, vector<32xi8>
      gpu.return
    }
  }
}

