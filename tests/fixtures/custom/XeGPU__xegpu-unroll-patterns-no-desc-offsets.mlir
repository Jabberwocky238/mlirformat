module {
  gpu.module @xevm_test {
    gpu.func @create_nd_tdesc(%arg0: memref<24x32xf32>) -> !xegpu.tensor_desc<24x32xf32, #xegpu.layout<inst_data = [8, 16]>> {
      %0 = xegpu.create_nd_tdesc %arg0 : memref<24x32xf32> -> !xegpu.tensor_desc<24x32xf32, #xegpu.layout<inst_data = [8, 16]>>
      gpu.return %0 : !xegpu.tensor_desc<24x32xf32, #xegpu.layout<inst_data = [8, 16]>>
    }
    gpu.func @load_nd(%arg0: memref<256x318xf32>) -> vector<24x32xf32> {
      %0 = xegpu.create_nd_tdesc %arg0 : memref<256x318xf32> -> !xegpu.tensor_desc<24x32xf32, #xegpu.layout<inst_data = [8, 16]>>
      %1 = xegpu.load_nd %0[8, 16]  : !xegpu.tensor_desc<24x32xf32, #xegpu.layout<inst_data = [8, 16]>> -> vector<24x32xf32>
      gpu.return %1 : vector<24x32xf32>
    }
    gpu.func @load_nd_store_nd(%arg0: memref<256x318xf32>) {
      %0 = xegpu.create_nd_tdesc %arg0 : memref<256x318xf32> -> !xegpu.tensor_desc<24x32xf32, #xegpu.layout<inst_data = [8, 16]>>
      %1 = xegpu.load_nd %0[8, 16]  : !xegpu.tensor_desc<24x32xf32, #xegpu.layout<inst_data = [8, 16]>> -> vector<24x32xf32>
      xegpu.store_nd %1, %0[0, 0]  : vector<24x32xf32>, !xegpu.tensor_desc<24x32xf32, #xegpu.layout<inst_data = [8, 16]>>
      gpu.return
    }
    gpu.func @prefetch_nd_tdesc(%arg0: memref<24x32xf32>) {
      %0 = xegpu.create_nd_tdesc %arg0 : memref<24x32xf32> -> !xegpu.tensor_desc<24x32xf32, #xegpu.layout<inst_data = [8, 16]>>
      xegpu.prefetch_nd %0[8, 16]  : !xegpu.tensor_desc<24x32xf32, #xegpu.layout<inst_data = [8, 16]>>
      gpu.return
    }
    gpu.func @load_nd_offsets_at_both_places(%arg0: memref<256x318xf32>) -> vector<24x32xf32> {
      %0 = xegpu.create_nd_tdesc %arg0[16, 8] : memref<256x318xf32> -> !xegpu.tensor_desc<24x32xf32, #xegpu.layout<inst_data = [8, 16]>>
      %1 = xegpu.load_nd %0[8, 16]  : !xegpu.tensor_desc<24x32xf32, #xegpu.layout<inst_data = [8, 16]>> -> vector<24x32xf32>
      gpu.return %1 : vector<24x32xf32>
    }
  }
}

