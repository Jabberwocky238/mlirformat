module {
  gpu.module @test {
    gpu.func @create_nd_tdesc(%arg0: memref<24x32xf32>) -> !xegpu.tensor_desc<24x32xf32, #xegpu.layout<inst_data = [8, 16]>> {
      %0 = xegpu.create_nd_tdesc %arg0 : memref<24x32xf32> -> !xegpu.tensor_desc<24x32xf32, #xegpu.layout<inst_data = [8, 16]>>
      gpu.return %0 : !xegpu.tensor_desc<24x32xf32, #xegpu.layout<inst_data = [8, 16]>>
    }
    gpu.func @create_nd_tdesc_1d(%arg0: memref<64xf32>) -> !xegpu.tensor_desc<32xf32, #xegpu.layout<inst_data = [16]>> {
      %0 = xegpu.create_nd_tdesc %arg0 : memref<64xf32> -> !xegpu.tensor_desc<32xf32, #xegpu.layout<inst_data = [16]>>
      gpu.return %0 : !xegpu.tensor_desc<32xf32, #xegpu.layout<inst_data = [16]>>
    }
    gpu.func @prefetch_nd_tdesc(%arg0: memref<24x32xf32>) {
      %0 = xegpu.create_nd_tdesc %arg0 : memref<24x32xf32> -> !xegpu.tensor_desc<24x32xf32, #xegpu.layout<inst_data = [8, 16]>>
      xegpu.prefetch_nd %0[0, 0]  : !xegpu.tensor_desc<24x32xf32, #xegpu.layout<inst_data = [8, 16]>>
      gpu.return
    }
    gpu.func @prefetch_nd_tdesc_1d(%arg0: memref<64xf32>) {
      %0 = xegpu.create_nd_tdesc %arg0 : memref<64xf32> -> !xegpu.tensor_desc<64xf32, #xegpu.layout<inst_data = [16]>>
      xegpu.prefetch_nd %0[0]  : !xegpu.tensor_desc<64xf32, #xegpu.layout<inst_data = [16]>>
      gpu.return
    }
    gpu.func @load_nd(%arg0: memref<24x32xf32>) -> vector<24x32xf32> {
      %0 = xegpu.create_nd_tdesc %arg0 : memref<24x32xf32> -> !xegpu.tensor_desc<24x32xf32, #xegpu.layout<inst_data = [8, 16]>>
      %1 = xegpu.load_nd %0[0, 0]  : !xegpu.tensor_desc<24x32xf32, #xegpu.layout<inst_data = [8, 16]>> -> vector<24x32xf32>
      gpu.return %1 : vector<24x32xf32>
    }
    gpu.func @load_nd_1d(%arg0: memref<64xf32>) -> vector<64xf32> {
      %0 = xegpu.create_nd_tdesc %arg0 : memref<64xf32> -> !xegpu.tensor_desc<64xf32, #xegpu.layout<inst_data = [16]>>
      %1 = xegpu.load_nd %0[0]  : !xegpu.tensor_desc<64xf32, #xegpu.layout<inst_data = [16]>> -> vector<64xf32>
      gpu.return %1 : vector<64xf32>
    }
    gpu.func @store_nd(%arg0: memref<24x32xf32>) {
      %0 = xegpu.create_nd_tdesc %arg0 : memref<24x32xf32> -> !xegpu.tensor_desc<24x32xf32, #xegpu.layout<inst_data = [8, 16]>>
      %cst = arith.constant dense<9.000000e+00> : vector<24x32xf32>
      xegpu.store_nd %cst, %0[0, 0]  : vector<24x32xf32>, !xegpu.tensor_desc<24x32xf32, #xegpu.layout<inst_data = [8, 16]>>
      gpu.return
    }
    gpu.func @store_nd_1d(%arg0: memref<64xf32>) {
      %0 = xegpu.create_nd_tdesc %arg0 : memref<64xf32> -> !xegpu.tensor_desc<64xf32, #xegpu.layout<inst_data = [16]>>
      %cst = arith.constant dense<9.000000e+00> : vector<64xf32>
      xegpu.store_nd %cst, %0[0]  : vector<64xf32>, !xegpu.tensor_desc<64xf32, #xegpu.layout<inst_data = [16]>>
      gpu.return
    }
    gpu.func @createNd_loadNd_storeNd(%arg0: memref<24x32xf32>) {
      %0 = xegpu.create_nd_tdesc %arg0 : memref<24x32xf32> -> !xegpu.tensor_desc<24x32xf32, #xegpu.layout<inst_data = [8, 16]>>
      %cst = arith.constant dense<9.000000e+00> : vector<24x32xf32>
      %1 = xegpu.load_nd %0[0, 0]  : !xegpu.tensor_desc<24x32xf32, #xegpu.layout<inst_data = [8, 16]>> -> vector<24x32xf32>
      %2 = arith.addf %cst, %1 : vector<24x32xf32>
      xegpu.store_nd %2, %0[0, 0]  : vector<24x32xf32>, !xegpu.tensor_desc<24x32xf32, #xegpu.layout<inst_data = [8, 16]>>
      gpu.return
    }
    gpu.func @dpas(%arg0: vector<32x32xf16>, %arg1: vector<32x32xf16>) -> vector<32x32xf32> {
      %0 = xegpu.dpas %arg0, %arg1 : vector<32x32xf16>, vector<32x32xf16> -> vector<32x32xf32>
      gpu.return %0 : vector<32x32xf32>
    }
    gpu.func @load_with_offsets(%arg0: ui64) -> vector<32xf32> {
      %cst = arith.constant dense<[0, 8, 16, 24, 32, 40, 48, 56, 64, 72, 80, 88, 96, 104, 112, 120, 128, 136, 144, 152, 160, 168, 176, 184, 192, 200, 208, 216, 224, 232, 240, 248]> : vector<32xindex>
      %c17 = arith.constant 17 : index
      %0 = vector.create_mask %c17 : vector<32xi1>
      %1 = xegpu.load %arg0[%cst], %0 <{chunk_size = 1 : i64, l1_hint = #xegpu.cache_hint<cached>, layout = #xegpu.layout<inst_data = [16]>}> : ui64, vector<32xindex>, vector<32xi1> -> vector<32xf32>
      gpu.return %1 : vector<32xf32>
    }
    gpu.func @store_with_offsets(%arg0: ui64) {
      %cst = arith.constant dense<[0, 8, 16, 24, 32, 40, 48, 56, 64, 72, 80, 88, 96, 104, 112, 120, 128, 136, 144, 152, 160, 168, 176, 184, 192, 200, 208, 216, 224, 232, 240, 248]> : vector<32xindex>
      %c17 = arith.constant 17 : index
      %0 = vector.create_mask %c17 : vector<32xi1>
      %cst_0 = arith.constant dense<1.023000e+03> : vector<32xf32>
      xegpu.store %cst_0, %arg0[%cst], %0 <{chunk_size = 1 : i64, l1_hint = #xegpu.cache_hint<cached>, layout = #xegpu.layout<inst_data = [16]>}> : vector<32xf32>, ui64, vector<32xindex>, vector<32xi1>
      gpu.return
    }
    gpu.func @load_with_offsets_chunk(%arg0: ui64) -> vector<32x4xf32> {
      %cst = arith.constant dense<[0, 8, 16, 24, 32, 40, 48, 56, 64, 72, 80, 88, 96, 104, 112, 120, 128, 136, 144, 152, 160, 168, 176, 184, 192, 200, 208, 216, 224, 232, 240, 248]> : vector<32xindex>
      %c17 = arith.constant 17 : index
      %0 = vector.create_mask %c17 : vector<32xi1>
      %1 = xegpu.load %arg0[%cst], %0 <{chunk_size = 4 : i64, l1_hint = #xegpu.cache_hint<cached>, layout = #xegpu.layout<inst_data = [16, 2]>}> : ui64, vector<32xindex>, vector<32xi1> -> vector<32x4xf32>
      gpu.return %1 : vector<32x4xf32>
    }
    gpu.func @store_with_offsets_chunk(%arg0: ui64) {
      %cst = arith.constant dense<[0, 8, 16, 24, 32, 40, 48, 56, 64, 72, 80, 88, 96, 104, 112, 120, 128, 136, 144, 152, 160, 168, 176, 184, 192, 200, 208, 216, 224, 232, 240, 248]> : vector<32xindex>
      %c17 = arith.constant 17 : index
      %0 = vector.create_mask %c17 : vector<32xi1>
      %cst_0 = arith.constant dense<1.023000e+03> : vector<32x4xf32>
      xegpu.store %cst_0, %arg0[%cst], %0 <{chunk_size = 4 : i64, l1_hint = #xegpu.cache_hint<cached>, layout = #xegpu.layout<inst_data = [16, 2]>}> : vector<32x4xf32>, ui64, vector<32xindex>, vector<32xi1>
      gpu.return
    }
    gpu.func @load_nd_store_nd(%arg0: memref<256x318xf32>) {
      %0 = xegpu.create_nd_tdesc %arg0 : memref<256x318xf32> -> !xegpu.tensor_desc<24x32xf32, #xegpu.layout<inst_data = [8, 16]>>
      %1 = xegpu.load_nd %0[8, 16]  : !xegpu.tensor_desc<24x32xf32, #xegpu.layout<inst_data = [8, 16]>> -> vector<24x32xf32>
      xegpu.store_nd %1, %0[0, 0]  : vector<24x32xf32>, !xegpu.tensor_desc<24x32xf32, #xegpu.layout<inst_data = [8, 16]>>
      gpu.return
    }
    gpu.func @multi_reduction_2d_last_dim(%arg0: vector<32x80xf32>, %arg1: vector<32xf32>) -> vector<32xf32> {
      %0 = vector.multi_reduction <add>, %arg0, %arg1 {layout_operand_0 = #xegpu.layout<inst_data = [16, 16]>} [1] : vector<32x80xf32> to vector<32xf32>
      gpu.return %0 : vector<32xf32>
    }
    gpu.func @multi_reduction_multi_dim(%arg0: vector<4x8x16x32xf32>, %arg1: vector<4x16xf32>) -> vector<4x16xf32> {
      %0 = vector.multi_reduction <add>, %arg0, %arg1 {layout_operand_0 = #xegpu.layout<inst_data = [2, 4, 16, 16]>} [1, 3] : vector<4x8x16x32xf32> to vector<4x16xf32>
      gpu.return %0 : vector<4x16xf32>
    }
    gpu.func @multi_reduction_reduce_dim0(%arg0: vector<48x32xf32>, %arg1: vector<32xf32>) -> vector<32xf32> {
      %0 = vector.multi_reduction <add>, %arg0, %arg1 {layout_operand_0 = #xegpu.layout<inst_data = [16, 16]>} [0] : vector<48x32xf32> to vector<32xf32>
      gpu.return %0 : vector<32xf32>
    }
    gpu.func @multi_reduction_no_elwise(%arg0: vector<32x16xf32>, %arg1: vector<32xf32>) -> vector<32xf32> {
      %0 = vector.multi_reduction <add>, %arg0, %arg1 {layout_operand_0 = #xegpu.layout<inst_data = [16, 16]>} [1] : vector<32x16xf32> to vector<32xf32>
      gpu.return %0 : vector<32xf32>
    }
  }
}

