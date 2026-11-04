module {
  gpu.module @load_store_check {
    gpu.func @load_store_matrix_a(%arg0: memref<16x128xi4, 1>, %arg1: memref<16x128xi4, 1>) kernel {
      %memspacecast = memref.memory_space_cast %arg0 : memref<16x128xi4, 1> to memref<16x128xi4>
      %memspacecast_0 = memref.memory_space_cast %arg1 : memref<16x128xi4, 1> to memref<16x128xi4>
      %0 = xegpu.create_nd_tdesc %memspacecast : memref<16x128xi4> -> !xegpu.tensor_desc<8x64xi4>
      %1 = xegpu.load_nd %0[8, 64] <{l1_hint = #xegpu.cache_hint<cached>, l2_hint = #xegpu.cache_hint<uncached>}> : !xegpu.tensor_desc<8x64xi4> -> vector<32xi4>
      %2 = xegpu.create_nd_tdesc %memspacecast_0 : memref<16x128xi4> -> !xegpu.tensor_desc<8x64xi4>
      xegpu.store_nd %1, %2[8, 64] <{l1_hint = #xegpu.cache_hint<write_back>, l2_hint = #xegpu.cache_hint<uncached>}> : vector<32xi4>, !xegpu.tensor_desc<8x64xi4>
      gpu.return
    }
    gpu.func @load_matrix_b_request_pack(%arg0: memref<64x128xi4, 1>, %arg1: memref<64x128xi4, 1>) kernel {
      %memspacecast = memref.memory_space_cast %arg0 : memref<64x128xi4, 1> to memref<64x128xi4>
      %memspacecast_0 = memref.memory_space_cast %arg1 : memref<64x128xi4, 1> to memref<64x128xi4>
      %0 = xegpu.create_nd_tdesc %memspacecast : memref<64x128xi4> -> !xegpu.tensor_desc<32x32xi4>
      %1 = xegpu.load_nd %0[32, 32] <{l1_hint = #xegpu.cache_hint<cached>, l2_hint = #xegpu.cache_hint<uncached>, packed}> : !xegpu.tensor_desc<32x32xi4> -> vector<64xi4>
      %c32 = arith.constant 32 : index
      %c0 = arith.constant 0 : index
      vector.store %1, %memspacecast_0[%c32, %c0] : memref<64x128xi4>, vector<64xi4>
      gpu.return
    }
  }
}

