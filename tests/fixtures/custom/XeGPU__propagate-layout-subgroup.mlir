module {
  gpu.module @test {
    func.func @store_nd(%arg0: memref<256x128xf32>) {
      %0 = xegpu.create_nd_tdesc %arg0 : memref<256x128xf32> -> !xegpu.tensor_desc<256x128xf32>
      %1 = xegpu.load_nd %0  : !xegpu.tensor_desc<256x128xf32> -> vector<256x128xf32>
      xegpu.store_nd %1, %0 <{layout = #xegpu.layout<sg_layout = [8, 4], sg_data = [32, 32]>}> : vector<256x128xf32>, !xegpu.tensor_desc<256x128xf32>
      return
    }
  }
}

// -----
module {
  gpu.module @test {
    func.func @vector_transpose(%arg0: memref<256x128xf32>, %arg1: memref<128x256xf32>) {
      %0 = xegpu.create_nd_tdesc %arg0 : memref<256x128xf32> -> !xegpu.tensor_desc<256x128xf32>
      %1 = xegpu.create_nd_tdesc %arg1 : memref<128x256xf32> -> !xegpu.tensor_desc<128x256xf32>
      %2 = xegpu.load_nd %0[0, 0]  : !xegpu.tensor_desc<256x128xf32> -> vector<256x128xf32>
      %3 = vector.transpose %2, [1, 0] : vector<256x128xf32> to vector<128x256xf32>
      xegpu.store_nd %3, %1[0, 0] <{layout = #xegpu.layout<sg_layout = [8, 4], sg_data = [32, 64], order = [1, 0]>}> : vector<128x256xf32>, !xegpu.tensor_desc<128x256xf32>
      return
    }
  }
}

