module {
  gpu.module @test {
    gpu.func @create_nd_tdesc(%arg0: memref<24x32xf32>) -> !xegpu.tensor_desc<24x32xf32, #xegpu.layout<inst_data = [8, 16]>> {
      %0 = xegpu.create_nd_tdesc %arg0[0, 0] : memref<24x32xf32> -> !xegpu.tensor_desc<24x32xf32, #xegpu.layout<inst_data = [8, 16]>>
      gpu.return %0 : !xegpu.tensor_desc<24x32xf32, #xegpu.layout<inst_data = [8, 16]>>
    }
    gpu.func @create_nd_tdesc_1d(%arg0: memref<64xf32>) -> !xegpu.tensor_desc<32xf32, #xegpu.layout<inst_data = [16]>> {
      %0 = xegpu.create_nd_tdesc %arg0[0] : memref<64xf32> -> !xegpu.tensor_desc<32xf32, #xegpu.layout<inst_data = [16]>>
      gpu.return %0 : !xegpu.tensor_desc<32xf32, #xegpu.layout<inst_data = [16]>>
    }
    gpu.func @update_nd_tdesc(%arg0: memref<24x32xf32>) -> !xegpu.tensor_desc<24x32xf32, #xegpu.layout<inst_data = [8, 16]>> {
      %0 = xegpu.create_nd_tdesc %arg0[0, 0] : memref<24x32xf32> -> !xegpu.tensor_desc<24x32xf32, #xegpu.layout<inst_data = [8, 16]>>
      %1 = xegpu.update_nd_offset %0, [0, 16] : !xegpu.tensor_desc<24x32xf32, #xegpu.layout<inst_data = [8, 16]>>
      gpu.return %1 : !xegpu.tensor_desc<24x32xf32, #xegpu.layout<inst_data = [8, 16]>>
    }
    gpu.func @update_nd_tdesc_1d(%arg0: memref<64xf32>) -> !xegpu.tensor_desc<32xf32, #xegpu.layout<inst_data = [16]>> {
      %0 = xegpu.create_nd_tdesc %arg0[0] : memref<64xf32> -> !xegpu.tensor_desc<32xf32, #xegpu.layout<inst_data = [16]>>
      %1 = xegpu.update_nd_offset %0, [32] : !xegpu.tensor_desc<32xf32, #xegpu.layout<inst_data = [16]>>
      gpu.return %1 : !xegpu.tensor_desc<32xf32, #xegpu.layout<inst_data = [16]>>
    }
    gpu.func @prefetch_nd_tdesc(%arg0: memref<24x32xf32>) {
      %0 = xegpu.create_nd_tdesc %arg0[0, 0] : memref<24x32xf32> -> !xegpu.tensor_desc<24x32xf32, #xegpu.layout<inst_data = [8, 16]>>
      xegpu.prefetch_nd %0  : !xegpu.tensor_desc<24x32xf32, #xegpu.layout<inst_data = [8, 16]>>
      gpu.return
    }
    gpu.func @prefetch_nd_tdesc_1d(%arg0: memref<64xf32>) {
      %0 = xegpu.create_nd_tdesc %arg0[0] : memref<64xf32> -> !xegpu.tensor_desc<64xf32, #xegpu.layout<inst_data = [16]>>
      xegpu.prefetch_nd %0  : !xegpu.tensor_desc<64xf32, #xegpu.layout<inst_data = [16]>>
      gpu.return
    }
    gpu.func @load_nd(%arg0: memref<24x32xf32>) -> vector<24x32xf32> {
      %0 = xegpu.create_nd_tdesc %arg0[0, 0] : memref<24x32xf32> -> !xegpu.tensor_desc<24x32xf32, #xegpu.layout<inst_data = [8, 16]>>
      %1 = xegpu.load_nd %0  : !xegpu.tensor_desc<24x32xf32, #xegpu.layout<inst_data = [8, 16]>> -> vector<24x32xf32>
      gpu.return %1 : vector<24x32xf32>
    }
    gpu.func @load_nd_1d(%arg0: memref<64xf32>) -> vector<64xf32> {
      %0 = xegpu.create_nd_tdesc %arg0[0] : memref<64xf32> -> !xegpu.tensor_desc<64xf32, #xegpu.layout<inst_data = [16]>>
      %1 = xegpu.load_nd %0  : !xegpu.tensor_desc<64xf32, #xegpu.layout<inst_data = [16]>> -> vector<64xf32>
      gpu.return %1 : vector<64xf32>
    }
    gpu.func @store_nd(%arg0: memref<24x32xf32>) {
      %0 = xegpu.create_nd_tdesc %arg0[0, 0] : memref<24x32xf32> -> !xegpu.tensor_desc<24x32xf32, #xegpu.layout<inst_data = [8, 16]>>
      %cst = arith.constant dense<9.000000e+00> : vector<24x32xf32>
      xegpu.store_nd %cst, %0  : vector<24x32xf32>, !xegpu.tensor_desc<24x32xf32, #xegpu.layout<inst_data = [8, 16]>>
      gpu.return
    }
    gpu.func @store_nd_1d(%arg0: memref<64xf32>) {
      %0 = xegpu.create_nd_tdesc %arg0[0] : memref<64xf32> -> !xegpu.tensor_desc<64xf32, #xegpu.layout<inst_data = [16]>>
      %cst = arith.constant dense<9.000000e+00> : vector<64xf32>
      xegpu.store_nd %cst, %0  : vector<64xf32>, !xegpu.tensor_desc<64xf32, #xegpu.layout<inst_data = [16]>>
      gpu.return
    }
    gpu.func @createNd_loadNd_storeNd(%arg0: memref<24x32xf32>) {
      %0 = xegpu.create_nd_tdesc %arg0[0, 0] : memref<24x32xf32> -> !xegpu.tensor_desc<24x32xf32, #xegpu.layout<inst_data = [8, 16]>>
      %cst = arith.constant dense<9.000000e+00> : vector<24x32xf32>
      %1 = xegpu.load_nd %0  : !xegpu.tensor_desc<24x32xf32, #xegpu.layout<inst_data = [8, 16]>> -> vector<24x32xf32>
      %2 = arith.addf %cst, %1 : vector<24x32xf32>
      xegpu.store_nd %2, %0  : vector<24x32xf32>, !xegpu.tensor_desc<24x32xf32, #xegpu.layout<inst_data = [8, 16]>>
      gpu.return
    }
    gpu.func @dpas(%arg0: vector<32x32xf16>, %arg1: vector<32x32xf16>) -> vector<32x32xf32> {
      %0 = xegpu.dpas %arg0, %arg1 : vector<32x32xf16>, vector<32x32xf16> -> vector<32x32xf32>
      gpu.return %0 : vector<32x32xf32>
    }
    gpu.func @create_tdesc_vec(%arg0: ui64) -> !xegpu.tensor_desc<32xf32, #xegpu.scatter_tdesc_attr<>, #xegpu.layout<inst_data = [16]>> {
      %cst = arith.constant dense<[0, 8, 16, 24, 32, 40, 48, 56, 64, 72, 80, 88, 96, 104, 112, 120, 128, 136, 144, 152, 160, 168, 176, 184, 192, 200, 208, 216, 224, 232, 240, 248]> : vector<32xindex>
      %0 = xegpu.create_tdesc %arg0, %cst : ui64, vector<32xindex> -> !xegpu.tensor_desc<32xf32, #xegpu.scatter_tdesc_attr<>, #xegpu.layout<inst_data = [16]>>
      gpu.return %0 : !xegpu.tensor_desc<32xf32, #xegpu.scatter_tdesc_attr<>, #xegpu.layout<inst_data = [16]>>
    }
    gpu.func @create_tdesc_step(%arg0: ui64) -> !xegpu.tensor_desc<32xf32, #xegpu.scatter_tdesc_attr<>, #xegpu.layout<inst_data = [16]>> {
      %cst = arith.constant dense<8> : vector<32xindex>
      %0 = vector.step : vector<32xindex>
      %1 = arith.muli %0, %cst : vector<32xindex>
      %2 = xegpu.create_tdesc %arg0, %1 : ui64, vector<32xindex> -> !xegpu.tensor_desc<32xf32, #xegpu.scatter_tdesc_attr<>, #xegpu.layout<inst_data = [16]>>
      gpu.return %2 : !xegpu.tensor_desc<32xf32, #xegpu.scatter_tdesc_attr<>, #xegpu.layout<inst_data = [16]>>
    }
    gpu.func @load(%arg0: ui64) -> vector<32xf32> {
      %cst = arith.constant dense<[0, 8, 16, 24, 32, 40, 48, 56, 64, 72, 80, 88, 96, 104, 112, 120, 128, 136, 144, 152, 160, 168, 176, 184, 192, 200, 208, 216, 224, 232, 240, 248]> : vector<32xindex>
      %c17 = arith.constant 17 : index
      %0 = vector.create_mask %c17 : vector<32xi1>
      %1 = xegpu.create_tdesc %arg0, %cst : ui64, vector<32xindex> -> !xegpu.tensor_desc<32xf32, #xegpu.scatter_tdesc_attr<>, #xegpu.layout<inst_data = [16]>>
      %2 = xegpu.load %1, %0  : !xegpu.tensor_desc<32xf32, #xegpu.scatter_tdesc_attr<>, #xegpu.layout<inst_data = [16]>>, vector<32xi1> -> vector<32xf32>
      gpu.return %2 : vector<32xf32>
    }
    gpu.func @load_with_offsets(%arg0: ui64) -> vector<32xf32> {
      %cst = arith.constant dense<[0, 8, 16, 24, 32, 40, 48, 56, 64, 72, 80, 88, 96, 104, 112, 120, 128, 136, 144, 152, 160, 168, 176, 184, 192, 200, 208, 216, 224, 232, 240, 248]> : vector<32xindex>
      %c17 = arith.constant 17 : index
      %0 = vector.create_mask %c17 : vector<32xi1>
      %1 = xegpu.load %arg0[%cst], %0 <{chunk_size = 1 : i64, l1_hint = #xegpu.cache_hint<cached>, layout = #xegpu.layout<inst_data = [16]>}> : ui64, vector<32xindex>, vector<32xi1> -> vector<32xf32>
      gpu.return %1 : vector<32xf32>
    }
    gpu.func @prefetch(%arg0: ui64) {
      %cst = arith.constant dense<[0, 8, 16, 24, 32, 40, 48, 56, 64, 72, 80, 88, 96, 104, 112, 120, 128, 136, 144, 152, 160, 168, 176, 184, 192, 200, 208, 216, 224, 232, 240, 248]> : vector<32xindex>
      %0 = xegpu.create_tdesc %arg0, %cst : ui64, vector<32xindex> -> !xegpu.tensor_desc<32xf32, #xegpu.scatter_tdesc_attr<>, #xegpu.layout<inst_data = [16]>>
      xegpu.prefetch %0  : !xegpu.tensor_desc<32xf32, #xegpu.scatter_tdesc_attr<>, #xegpu.layout<inst_data = [16]>>
      gpu.return
    }
    gpu.func @store(%arg0: ui64) {
      %cst = arith.constant dense<[0, 8, 16, 24, 32, 40, 48, 56, 64, 72, 80, 88, 96, 104, 112, 120, 128, 136, 144, 152, 160, 168, 176, 184, 192, 200, 208, 216, 224, 232, 240, 248]> : vector<32xindex>
      %c17 = arith.constant 17 : index
      %0 = vector.create_mask %c17 : vector<32xi1>
      %cst_0 = arith.constant dense<1.023000e+03> : vector<32xf32>
      %1 = xegpu.create_tdesc %arg0, %cst : ui64, vector<32xindex> -> !xegpu.tensor_desc<32xf32, #xegpu.scatter_tdesc_attr<>, #xegpu.layout<inst_data = [16]>>
      xegpu.store %cst_0, %1, %0  : vector<32xf32>, !xegpu.tensor_desc<32xf32, #xegpu.scatter_tdesc_attr<>, #xegpu.layout<inst_data = [16]>>, vector<32xi1>
      gpu.return
    }
    gpu.func @store_with_offsets(%arg0: ui64) {
      %cst = arith.constant dense<[0, 8, 16, 24, 32, 40, 48, 56, 64, 72, 80, 88, 96, 104, 112, 120, 128, 136, 144, 152, 160, 168, 176, 184, 192, 200, 208, 216, 224, 232, 240, 248]> : vector<32xindex>
      %c17 = arith.constant 17 : index
      %0 = vector.create_mask %c17 : vector<32xi1>
      %cst_0 = arith.constant dense<1.023000e+03> : vector<32xf32>
      xegpu.store %cst_0, %arg0[%cst], %0 <{chunk_size = 1 : i64, l1_hint = #xegpu.cache_hint<cached>, layout = #xegpu.layout<inst_data = [16]>}> : vector<32xf32>, ui64, vector<32xindex>, vector<32xi1>
      gpu.return
    }
    gpu.func @create_tdesc_step_chunk(%arg0: ui64) -> !xegpu.tensor_desc<32x4xf32, #xegpu.scatter_tdesc_attr<chunk_size = 4 : i64>, #xegpu.layout<inst_data = [16, 4]>> {
      %cst = arith.constant dense<8> : vector<32xindex>
      %0 = vector.step : vector<32xindex>
      %1 = arith.muli %0, %cst : vector<32xindex>
      %2 = xegpu.create_tdesc %arg0, %1 : ui64, vector<32xindex> -> !xegpu.tensor_desc<32x4xf32, #xegpu.scatter_tdesc_attr<chunk_size = 4 : i64>, #xegpu.layout<inst_data = [16, 4]>>
      gpu.return %2 : !xegpu.tensor_desc<32x4xf32, #xegpu.scatter_tdesc_attr<chunk_size = 4 : i64>, #xegpu.layout<inst_data = [16, 4]>>
    }
    gpu.func @create_tdesc_step_chunk2(%arg0: ui64) -> !xegpu.tensor_desc<32x4xf32, #xegpu.scatter_tdesc_attr<chunk_size = 4 : i64>, #xegpu.layout<inst_data = [16, 2]>> {
      %cst = arith.constant dense<8> : vector<32xindex>
      %0 = vector.step : vector<32xindex>
      %1 = arith.muli %0, %cst : vector<32xindex>
      %2 = xegpu.create_tdesc %arg0, %1 : ui64, vector<32xindex> -> !xegpu.tensor_desc<32x4xf32, #xegpu.scatter_tdesc_attr<chunk_size = 4 : i64>, #xegpu.layout<inst_data = [16, 2]>>
      gpu.return %2 : !xegpu.tensor_desc<32x4xf32, #xegpu.scatter_tdesc_attr<chunk_size = 4 : i64>, #xegpu.layout<inst_data = [16, 2]>>
    }
    gpu.func @create_tdesc_step_chunk3(%arg0: ui64) -> !xegpu.tensor_desc<16x8xf32, #xegpu.scatter_tdesc_attr<chunk_size = 8 : i64>, #xegpu.layout<inst_data = [16, 2]>> {
      %cst = arith.constant dense<8> : vector<16xindex>
      %0 = vector.step : vector<16xindex>
      %1 = arith.muli %0, %cst : vector<16xindex>
      %2 = xegpu.create_tdesc %arg0, %1 : ui64, vector<16xindex> -> !xegpu.tensor_desc<16x8xf32, #xegpu.scatter_tdesc_attr<chunk_size = 8 : i64>, #xegpu.layout<inst_data = [16, 2]>>
      gpu.return %2 : !xegpu.tensor_desc<16x8xf32, #xegpu.scatter_tdesc_attr<chunk_size = 8 : i64>, #xegpu.layout<inst_data = [16, 2]>>
    }
    gpu.func @load_chunk(%arg0: ui64) -> vector<32x4xf32> {
      %cst = arith.constant dense<[0, 8, 16, 24, 32, 40, 48, 56, 64, 72, 80, 88, 96, 104, 112, 120, 128, 136, 144, 152, 160, 168, 176, 184, 192, 200, 208, 216, 224, 232, 240, 248]> : vector<32xindex>
      %c17 = arith.constant 17 : index
      %0 = vector.create_mask %c17 : vector<32xi1>
      %1 = xegpu.create_tdesc %arg0, %cst : ui64, vector<32xindex> -> !xegpu.tensor_desc<32x4xf32, #xegpu.scatter_tdesc_attr<chunk_size = 4 : i64>, #xegpu.layout<inst_data = [16, 2]>>
      %2 = xegpu.load %1, %0 <{l1_hint = #xegpu.cache_hint<cached>, l2_hint = #xegpu.cache_hint<uncached>}> : !xegpu.tensor_desc<32x4xf32, #xegpu.scatter_tdesc_attr<chunk_size = 4 : i64>, #xegpu.layout<inst_data = [16, 2]>>, vector<32xi1> -> vector<32x4xf32>
      gpu.return %2 : vector<32x4xf32>
    }
    gpu.func @load_with_offsets_chunk(%arg0: ui64) -> vector<32x4xf32> {
      %cst = arith.constant dense<[0, 8, 16, 24, 32, 40, 48, 56, 64, 72, 80, 88, 96, 104, 112, 120, 128, 136, 144, 152, 160, 168, 176, 184, 192, 200, 208, 216, 224, 232, 240, 248]> : vector<32xindex>
      %c17 = arith.constant 17 : index
      %0 = vector.create_mask %c17 : vector<32xi1>
      %1 = xegpu.load %arg0[%cst], %0 <{chunk_size = 4 : i64, l1_hint = #xegpu.cache_hint<cached>, layout = #xegpu.layout<inst_data = [16, 2]>}> : ui64, vector<32xindex>, vector<32xi1> -> vector<32x4xf32>
      gpu.return %1 : vector<32x4xf32>
    }
    gpu.func @store_chunk(%arg0: ui64) {
      %cst = arith.constant dense<[0, 8, 16, 24, 32, 40, 48, 56, 64, 72, 80, 88, 96, 104, 112, 120, 128, 136, 144, 152, 160, 168, 176, 184, 192, 200, 208, 216, 224, 232, 240, 248]> : vector<32xindex>
      %c17 = arith.constant 17 : index
      %0 = vector.create_mask %c17 : vector<32xi1>
      %cst_0 = arith.constant dense<1.023000e+03> : vector<32x4xf32>
      %1 = xegpu.create_tdesc %arg0, %cst : ui64, vector<32xindex> -> !xegpu.tensor_desc<32x4xf32, #xegpu.scatter_tdesc_attr<chunk_size = 4 : i64>, #xegpu.layout<inst_data = [16, 2]>>
      xegpu.store %cst_0, %1, %0 <{l1_hint = #xegpu.cache_hint<cached>, l2_hint = #xegpu.cache_hint<uncached>}> : vector<32x4xf32>, !xegpu.tensor_desc<32x4xf32, #xegpu.scatter_tdesc_attr<chunk_size = 4 : i64>, #xegpu.layout<inst_data = [16, 2]>>, vector<32xi1>
      gpu.return
    }
    gpu.func @store_with_offsets_chunk(%arg0: ui64) {
      %cst = arith.constant dense<[0, 8, 16, 24, 32, 40, 48, 56, 64, 72, 80, 88, 96, 104, 112, 120, 128, 136, 144, 152, 160, 168, 176, 184, 192, 200, 208, 216, 224, 232, 240, 248]> : vector<32xindex>
      %c17 = arith.constant 17 : index
      %0 = vector.create_mask %c17 : vector<32xi1>
      %cst_0 = arith.constant dense<1.023000e+03> : vector<32x4xf32>
      xegpu.store %cst_0, %arg0[%cst], %0 <{chunk_size = 4 : i64, l1_hint = #xegpu.cache_hint<cached>, layout = #xegpu.layout<inst_data = [16, 2]>}> : vector<32x4xf32>, ui64, vector<32xindex>, vector<32xi1>
      gpu.return
    }
    gpu.func @prefetch_chunk(%arg0: ui64) {
      %cst = arith.constant dense<[0, 8, 16, 24, 32, 40, 48, 56, 64, 72, 80, 88, 96, 104, 112, 120, 128, 136, 144, 152, 160, 168, 176, 184, 192, 200, 208, 216, 224, 232, 240, 248]> : vector<32xindex>
      %0 = xegpu.create_tdesc %arg0, %cst : ui64, vector<32xindex> -> !xegpu.tensor_desc<32x4xf32, #xegpu.scatter_tdesc_attr<chunk_size = 4 : i64>, #xegpu.layout<inst_data = [16, 2]>>
      xegpu.prefetch %0  : !xegpu.tensor_desc<32x4xf32, #xegpu.scatter_tdesc_attr<chunk_size = 4 : i64>, #xegpu.layout<inst_data = [16, 2]>>
      gpu.return
    }
    gpu.func @update_chunk(%arg0: ui64) -> !xegpu.tensor_desc<32x4xf32, #xegpu.scatter_tdesc_attr<chunk_size = 4 : i64>, #xegpu.layout<inst_data = [16, 2]>> {
      %cst = arith.constant dense<[0, 8, 16, 24, 32, 40, 48, 56, 64, 72, 80, 88, 96, 104, 112, 120, 128, 136, 144, 152, 160, 168, 176, 184, 192, 200, 208, 216, 224, 232, 240, 248]> : vector<32xindex>
      %cst_0 = arith.constant dense<32> : vector<32xindex>
      %0 = xegpu.create_tdesc %arg0, %cst : ui64, vector<32xindex> -> !xegpu.tensor_desc<32x4xf32, #xegpu.scatter_tdesc_attr<chunk_size = 4 : i64>, #xegpu.layout<inst_data = [16, 2]>>
      %1 = xegpu.update_offset %0, %cst_0 : !xegpu.tensor_desc<32x4xf32, #xegpu.scatter_tdesc_attr<chunk_size = 4 : i64>, #xegpu.layout<inst_data = [16, 2]>>, vector<32xindex>
      gpu.return %1 : !xegpu.tensor_desc<32x4xf32, #xegpu.scatter_tdesc_attr<chunk_size = 4 : i64>, #xegpu.layout<inst_data = [16, 2]>>
    }
  }
}

