module {
  gpu.module @test {
    gpu.func @create_nd_tdesc_1(%arg0: memref<24x32xf32>) {
      %0 = xegpu.create_nd_tdesc %arg0 : memref<24x32xf32> -> !xegpu.tensor_desc<8x16xf32>
      gpu.return
    }
    gpu.func @create_nd_tdesc_2(%arg0: ui64, %arg1: index, %arg2: index, %arg3: index, %arg4: index) {
      %c1 = arith.constant 1 : index
      %0 = xegpu.create_nd_tdesc %arg0, shape : [%arg2, %arg1], strides : [%arg1, %c1] : ui64 -> !xegpu.tensor_desc<8x16xf32>
      gpu.return
    }
    gpu.func @create_nd_tdesc_3(%arg0: memref<24x32xf32>) {
      %0 = xegpu.create_nd_tdesc %arg0 : memref<24x32xf32> -> !xegpu.tensor_desc<24x16xf32, #xegpu.block_tdesc_attr<array_length = 2 : i64>>
      gpu.return
    }
    gpu.func @create_nd_tdesc_4(%arg0: memref<2x24x32xf32>) {
      %0 = xegpu.create_nd_tdesc %arg0 : memref<2x24x32xf32> -> !xegpu.tensor_desc<8x16xf32>
      gpu.return
    }
    gpu.func @create_nd_tdesc_5(%arg0: memref<2x24x32xf32, 3>) {
      %0 = xegpu.create_nd_tdesc %arg0 : memref<2x24x32xf32, 3> -> !xegpu.tensor_desc<16xf32, #xegpu.block_tdesc_attr<memory_space = slm>>
      gpu.return
    }
    gpu.func @create_nd_tdesc_6(%arg0: memref<24x32xf32>) {
      %0 = xegpu.create_nd_tdesc %arg0 : memref<24x32xf32> -> !xegpu.tensor_desc<24x16xf32, #xegpu.block_tdesc_attr<array_length = 2 : i64>>
      gpu.return
    }
    gpu.func @create_nd_tdesc_7(%arg0: memref<8x24x32x48x64xf32>) {
      %0 = xegpu.create_nd_tdesc %arg0 : memref<8x24x32x48x64xf32> -> !xegpu.tensor_desc<8x8x8x24x32xf32>
      gpu.return
    }
    gpu.func @test_create_nd_tdesc_7(%arg0: ui64, %arg1: index, %arg2: index, %arg3: index, %arg4: index, %arg5: memref<24x32xf32>) {
      %c1 = arith.constant 1 : index
      %0 = xegpu.create_nd_tdesc %arg5 : memref<24x32xf32> -> !xegpu.tensor_desc<8x16xf32>
      gpu.return
    }
    gpu.func @test_create_nd_tdesc_8(%arg0: ui64, %arg1: index, %arg2: index, %arg3: index, %arg4: index) {
      %c1 = arith.constant 1 : index
      %0 = xegpu.create_nd_tdesc %arg0, shape : [%arg2, %arg1], strides : [%arg1, %c1] : ui64 -> !xegpu.tensor_desc<8x16xf32>
      gpu.return
    }
    gpu.func @test_create_nd_tdesc_9(%arg0: memref<?x?xf16>, %arg1: index, %arg2: index, %arg3: index, %arg4: index) {
      %c1 = arith.constant 1 : index
      %0 = xegpu.create_nd_tdesc %arg0, shape : [%arg2, %arg1], strides : [%arg1, %c1] : memref<?x?xf16> -> !xegpu.tensor_desc<8x16xf16>
      gpu.return
    }
    gpu.func @test_create_nd_tdesc_10(%arg0: memref<?x?xf16>, %arg1: index, %arg2: index, %arg3: index, %arg4: index) {
      %c1 = arith.constant 1 : index
      %0 = xegpu.create_nd_tdesc %arg0, shape : [%arg2, %arg1], strides : [%arg1, %c1] : memref<?x?xf16> -> !xegpu.tensor_desc<8x16xf16>
      gpu.return
    }
    gpu.func @prefetch_nd(%arg0: memref<24x32xf16>) {
      %0 = xegpu.create_nd_tdesc %arg0 : memref<24x32xf16> -> !xegpu.tensor_desc<8x16xf16>
      xegpu.prefetch_nd %0[0, 0] <{l1_hint = #xegpu.cache_hint<cached>, l2_hint = #xegpu.cache_hint<uncached>}> : !xegpu.tensor_desc<8x16xf16>
      gpu.return
    }
    gpu.func @prefetch_nd_2(%arg0: memref<48x64xf16>) {
      %0 = xegpu.create_nd_tdesc %arg0 : memref<48x64xf16> -> !xegpu.tensor_desc<8x16xf16>
      xegpu.prefetch_nd %0[0, 0] <{l1_hint = #xegpu.cache_hint<cached>, l2_hint = #xegpu.cache_hint<uncached>}> : !xegpu.tensor_desc<8x16xf16>
      gpu.return
    }
    gpu.func @prefetch_nd_offset_1(%arg0: memref<48x64xf16>, %arg1: index, %arg2: index) {
      %0 = xegpu.create_nd_tdesc %arg0 : memref<48x64xf16> -> !xegpu.tensor_desc<8x16xf16>
      xegpu.prefetch_nd %0[%arg1, %arg2] <{l1_hint = #xegpu.cache_hint<cached>, l2_hint = #xegpu.cache_hint<uncached>}> : !xegpu.tensor_desc<8x16xf16>
      gpu.return
    }
    gpu.func @subgroup_load_nd(%arg0: memref<8x16xf16>) {
      %0 = xegpu.create_nd_tdesc %arg0 : memref<8x16xf16> -> !xegpu.tensor_desc<8x16xf16>
      %1 = xegpu.load_nd %0[0, 0] <{l1_hint = #xegpu.cache_hint<cached>, l2_hint = #xegpu.cache_hint<uncached>, packed}> : !xegpu.tensor_desc<8x16xf16> -> vector<4x16x2xf16>
      gpu.return
    }
    gpu.func @simt_load_nd(%arg0: memref<8x16xf16>) {
      %0 = xegpu.create_nd_tdesc %arg0 : memref<8x16xf16> -> !xegpu.tensor_desc<8x16xf16>
      %1 = xegpu.load_nd %0[0, 0] <{l1_hint = #xegpu.cache_hint<cached>, l2_hint = #xegpu.cache_hint<uncached>}> : !xegpu.tensor_desc<8x16xf16> -> vector<8xf16>
      gpu.return
    }
    gpu.func @subgroup_load_nd_2(%arg0: memref<8x16xf16>) {
      %0 = xegpu.create_nd_tdesc %arg0 : memref<8x16xf16> -> !xegpu.tensor_desc<16xf16>
      %1 = xegpu.load_nd %0[0] <{l1_hint = #xegpu.cache_hint<cached>, l2_hint = #xegpu.cache_hint<uncached>}> : !xegpu.tensor_desc<16xf16> -> vector<16xf16>
      gpu.return
    }
    gpu.func @simt_load_nd_2(%arg0: memref<8x16xf16>) {
      %0 = xegpu.create_nd_tdesc %arg0 : memref<8x16xf16> -> !xegpu.tensor_desc<16xf16>
      %1 = xegpu.load_nd %0[0] <{l1_hint = #xegpu.cache_hint<cached>, l2_hint = #xegpu.cache_hint<uncached>}> : !xegpu.tensor_desc<16xf16> -> vector<1xf16>
      gpu.return
    }
    gpu.func @subgroup_load_nd_3(%arg0: memref<24x32xf32>) {
      %0 = xegpu.create_nd_tdesc %arg0 : memref<24x32xf32> -> !xegpu.tensor_desc<8x16xf32>
      %1 = xegpu.load_nd %0[0, 0] <{l1_hint = #xegpu.cache_hint<cached>, l2_hint = #xegpu.cache_hint<uncached>}> : !xegpu.tensor_desc<8x16xf32> -> vector<8x16xf32>
      gpu.return
    }
    gpu.func @simt_load_nd_3(%arg0: memref<24x32xf32>) {
      %0 = xegpu.create_nd_tdesc %arg0 : memref<24x32xf32> -> !xegpu.tensor_desc<8x16xf32>
      %1 = xegpu.load_nd %0[0, 0] <{l1_hint = #xegpu.cache_hint<cached>, l2_hint = #xegpu.cache_hint<uncached>}> : !xegpu.tensor_desc<8x16xf32> -> vector<8xf32>
      gpu.return
    }
    gpu.func @subgroup_load_nd_4(%arg0: memref<24x32xf16>) {
      %0 = xegpu.create_nd_tdesc %arg0 : memref<24x32xf16> -> !xegpu.tensor_desc<16x16xf16>
      %1 = xegpu.load_nd %0[0, 0] <{l1_hint = #xegpu.cache_hint<cached>, l2_hint = #xegpu.cache_hint<uncached>, packed}> : !xegpu.tensor_desc<16x16xf16> -> vector<8x16x2xf16>
      gpu.return
    }
    gpu.func @simt_load_nd_4(%arg0: memref<24x32xf16>) {
      %0 = xegpu.create_nd_tdesc %arg0 : memref<24x32xf16> -> !xegpu.tensor_desc<16x16xf16>
      %1 = xegpu.load_nd %0[0, 0] <{l1_hint = #xegpu.cache_hint<cached>, l2_hint = #xegpu.cache_hint<uncached>}> : !xegpu.tensor_desc<16x16xf16> -> vector<16xf16>
      gpu.return
    }
    gpu.func @subgroup_load_nd_5(%arg0: memref<24x32xf32>) {
      %0 = xegpu.create_nd_tdesc %arg0 : memref<24x32xf32> -> !xegpu.tensor_desc<32xf32>
      %1 = xegpu.load_nd %0[0] <{l1_hint = #xegpu.cache_hint<cached>, l2_hint = #xegpu.cache_hint<uncached>}> : !xegpu.tensor_desc<32xf32> -> vector<32xf32>
      gpu.return
    }
    gpu.func @simt_load_nd_5(%arg0: memref<24x32xf32>) {
      %0 = xegpu.create_nd_tdesc %arg0 : memref<24x32xf32> -> !xegpu.tensor_desc<32xf32>
      %1 = xegpu.load_nd %0[0] <{l1_hint = #xegpu.cache_hint<cached>, l2_hint = #xegpu.cache_hint<uncached>}> : !xegpu.tensor_desc<32xf32> -> vector<2xf32>
      gpu.return
    }
    gpu.func @subgroup_load_nd_6(%arg0: memref<24x32xf16>) {
      %0 = xegpu.create_nd_tdesc %arg0 : memref<24x32xf16> -> !xegpu.tensor_desc<16x16xf16, #xegpu.block_tdesc_attr<array_length = 2 : i64>>
      %1 = xegpu.load_nd %0[0, 0] <{l1_hint = #xegpu.cache_hint<cached>, l2_hint = #xegpu.cache_hint<uncached>}> : !xegpu.tensor_desc<16x16xf16, #xegpu.block_tdesc_attr<array_length = 2 : i64>> -> vector<32x16xf16>
      gpu.return
    }
    gpu.func @simt_load_nd_6(%arg0: memref<24x32xf16>) {
      %0 = xegpu.create_nd_tdesc %arg0 : memref<24x32xf16> -> !xegpu.tensor_desc<16x16xf16, #xegpu.block_tdesc_attr<array_length = 2 : i64>>
      %1 = xegpu.load_nd %0[0, 0] <{l1_hint = #xegpu.cache_hint<cached>, l2_hint = #xegpu.cache_hint<uncached>}> : !xegpu.tensor_desc<16x16xf16, #xegpu.block_tdesc_attr<array_length = 2 : i64>> -> vector<32xf16>
      gpu.return
    }
    gpu.func @subgroup_load_nd_7(%arg0: memref<24x32xf16>) {
      %0 = xegpu.create_nd_tdesc %arg0 : memref<24x32xf16> -> !xegpu.tensor_desc<16x16xf16, #xegpu.block_tdesc_attr<array_length = 2 : i64>>
      %1 = xegpu.load_nd %0[0, 0] <{l1_hint = #xegpu.cache_hint<cached>, l2_hint = #xegpu.cache_hint<uncached>, packed}> : !xegpu.tensor_desc<16x16xf16, #xegpu.block_tdesc_attr<array_length = 2 : i64>> -> vector<16x16x2xf16>
      gpu.return
    }
    gpu.func @simt_load_nd_7(%arg0: memref<24x32xf16>) {
      %0 = xegpu.create_nd_tdesc %arg0 : memref<24x32xf16> -> !xegpu.tensor_desc<16x16xf16, #xegpu.block_tdesc_attr<array_length = 2 : i64>>
      %1 = xegpu.load_nd %0[0, 0] <{l1_hint = #xegpu.cache_hint<cached>, l2_hint = #xegpu.cache_hint<uncached>}> : !xegpu.tensor_desc<16x16xf16, #xegpu.block_tdesc_attr<array_length = 2 : i64>> -> vector<32xf16>
      gpu.return
    }
    gpu.func @subgroup_load_nd_8(%arg0: memref<24x32xf32>) {
      %0 = xegpu.create_nd_tdesc %arg0 : memref<24x32xf32> -> !xegpu.tensor_desc<16x8xf32>
      %1 = xegpu.load_nd %0[0, 0] <{l1_hint = #xegpu.cache_hint<cached>, l2_hint = #xegpu.cache_hint<uncached>, transpose = array<i64: 1, 0>}> : !xegpu.tensor_desc<16x8xf32> -> vector<8x16xf32>
      gpu.return
    }
    gpu.func @subgroup_load_nd_offset_1(%arg0: memref<24x32xf32>, %arg1: index, %arg2: index) {
      %0 = xegpu.create_nd_tdesc %arg0 : memref<24x32xf32> -> !xegpu.tensor_desc<16x8xf32>
      %1 = xegpu.load_nd %0[%arg1, %arg2] <{l1_hint = #xegpu.cache_hint<cached>, l2_hint = #xegpu.cache_hint<uncached>, transpose = array<i64: 1, 0>}> : !xegpu.tensor_desc<16x8xf32> -> vector<8x16xf32>
      gpu.return
    }
    gpu.func @subgroup_load_nd_offset_2(%arg0: memref<24x32xf32>, %arg1: index) {
      %0 = xegpu.create_nd_tdesc %arg0 : memref<24x32xf32> -> !xegpu.tensor_desc<16x8xf32>
      %1 = xegpu.load_nd %0[%arg1, 0] <{l1_hint = #xegpu.cache_hint<cached>, l2_hint = #xegpu.cache_hint<uncached>, transpose = array<i64: 1, 0>}> : !xegpu.tensor_desc<16x8xf32> -> vector<8x16xf32>
      gpu.return
    }
    gpu.func @simt_load_nd_8(%arg0: memref<24x32xf32>) {
      %0 = xegpu.create_nd_tdesc %arg0 : memref<24x32xf32> -> !xegpu.tensor_desc<16x8xf32>
      %1 = xegpu.load_nd %0[0, 0] <{l1_hint = #xegpu.cache_hint<cached>, l2_hint = #xegpu.cache_hint<uncached>, transpose = array<i64: 1, 0>}> : !xegpu.tensor_desc<16x8xf32> -> vector<8xf32>
      gpu.return
    }
    gpu.func @subgroup_store_nd(%arg0: memref<24x32xf16>) {
      %cst = arith.constant dense<1.000000e+00> : vector<24x32xf16>
      %0 = xegpu.create_nd_tdesc %arg0 : memref<24x32xf16> -> !xegpu.tensor_desc<24x32xf16>
      xegpu.store_nd %cst, %0[0, 0] <{l1_hint = #xegpu.cache_hint<write_back>, l2_hint = #xegpu.cache_hint<uncached>}> : vector<24x32xf16>, !xegpu.tensor_desc<24x32xf16>
      gpu.return
    }
    gpu.func @simt_store_nd(%arg0: memref<24x32xf16>) {
      %cst = arith.constant dense<1.000000e+00> : vector<48xf16>
      %0 = xegpu.create_nd_tdesc %arg0 : memref<24x32xf16> -> !xegpu.tensor_desc<24x32xf16>
      xegpu.store_nd %cst, %0[0, 0] <{l1_hint = #xegpu.cache_hint<write_back>, l2_hint = #xegpu.cache_hint<uncached>}> : vector<48xf16>, !xegpu.tensor_desc<24x32xf16>
      gpu.return
    }
    gpu.func @subgroup_store_nd_2(%arg0: memref<24x32xf16>, %arg1: index) {
      %cst = arith.constant dense<1.000000e+00> : vector<32xf16>
      %0 = xegpu.create_nd_tdesc %arg0 : memref<24x32xf16> -> !xegpu.tensor_desc<32xf16>
      xegpu.store_nd %cst, %0[%arg1] <{l1_hint = #xegpu.cache_hint<write_back>, l2_hint = #xegpu.cache_hint<uncached>}> : vector<32xf16>, !xegpu.tensor_desc<32xf16>
      gpu.return
    }
    gpu.func @subgroup_store_nd_offset_1(%arg0: memref<24x32xf16>) {
      %cst = arith.constant dense<1.000000e+00> : vector<32xf16>
      %0 = xegpu.create_nd_tdesc %arg0 : memref<24x32xf16> -> !xegpu.tensor_desc<32xf16>
      xegpu.store_nd %cst, %0[0] <{l1_hint = #xegpu.cache_hint<write_back>, l2_hint = #xegpu.cache_hint<uncached>}> : vector<32xf16>, !xegpu.tensor_desc<32xf16>
      gpu.return
    }
    gpu.func @simt_store_nd_2(%arg0: memref<24x32xf16>) {
      %cst = arith.constant dense<1.000000e+00> : vector<2xf16>
      %0 = xegpu.create_nd_tdesc %arg0 : memref<24x32xf16> -> !xegpu.tensor_desc<32xf16>
      xegpu.store_nd %cst, %0[0] <{l1_hint = #xegpu.cache_hint<write_back>, l2_hint = #xegpu.cache_hint<uncached>}> : vector<2xf16>, !xegpu.tensor_desc<32xf16>
      gpu.return
    }
    gpu.func @load_nd_3d(%arg0: memref<4x8x16xf16>) {
      %0 = xegpu.create_nd_tdesc %arg0 : memref<4x8x16xf16> -> !xegpu.tensor_desc<4x8x16xf16>
      %1 = xegpu.load_nd %0[0, 0, 0] <{l1_hint = #xegpu.cache_hint<cached>, l2_hint = #xegpu.cache_hint<uncached>}> : !xegpu.tensor_desc<4x8x16xf16> -> vector<4x8x16xf16>
      gpu.return
    }
    gpu.func @store_nd_3d(%arg0: memref<4x8x16xf16>) {
      %cst = arith.constant dense<1.000000e+00> : vector<4x8x16xf16>
      %0 = xegpu.create_nd_tdesc %arg0 : memref<4x8x16xf16> -> !xegpu.tensor_desc<4x8x16xf16>
      xegpu.store_nd %cst, %0[0, 0, 0] <{l1_hint = #xegpu.cache_hint<write_back>, l2_hint = #xegpu.cache_hint<uncached>}> : vector<4x8x16xf16>, !xegpu.tensor_desc<4x8x16xf16>
      gpu.return
    }
    gpu.func @prefetch_nd_3d(%arg0: memref<4x8x16xf16>) {
      %0 = xegpu.create_nd_tdesc %arg0 : memref<4x8x16xf16> -> !xegpu.tensor_desc<4x8x16xf16>
      xegpu.prefetch_nd %0[0, 0, 0] <{l1_hint = #xegpu.cache_hint<cached>, l2_hint = #xegpu.cache_hint<uncached>}> : !xegpu.tensor_desc<4x8x16xf16>
      gpu.return
    }
    gpu.func @simt_load_4(%arg0: memref<256xf16>, %arg1: vector<1xindex>, %arg2: vector<1xi1>) {
      %0 = xegpu.load %arg0[%arg1], %arg2 <{chunk_size = 8 : i64}> : memref<256xf16>, vector<1xindex>, vector<1xi1> -> vector<8xf16>
      gpu.return
    }
    gpu.func @simt_load_5(%arg0: memref<256xf16>, %arg1: vector<1xindex>, %arg2: vector<1xi1>) {
      %0 = xegpu.load %arg0[%arg1], %arg2  : memref<256xf16>, vector<1xindex>, vector<1xi1> -> vector<1xf16>
      gpu.return
    }
    gpu.func @simt_load_6(%arg0: memref<256xf16>, %arg1: index, %arg2: i1) {
      %0 = xegpu.load %arg0[%arg1], %arg2 <{chunk_size = 8 : i64}> : memref<256xf16>, index, i1 -> vector<8xf16>
      gpu.return
    }
    gpu.func @simt_load_7(%arg0: memref<256xf16>, %arg1: index, %arg2: i1) {
      %0 = xegpu.load %arg0[%arg1], %arg2  : memref<256xf16>, index, i1 -> f16
      gpu.return
    }
    gpu.func @subgroup_load_offset_1(%arg0: memref<?xf16>) {
      %cst = arith.constant dense<[0, 8, 16, 24]> : vector<4xindex>
      %cst_0 = arith.constant dense<true> : vector<4xi1>
      %0 = xegpu.load %arg0[%cst], %cst_0 <{chunk_size = 2 : i64, l1_hint = #xegpu.cache_hint<cached>}> : memref<?xf16>, vector<4xindex>, vector<4xi1> -> vector<4x2xf16>
      gpu.return
    }
    gpu.func @simt_store_4(%arg0: vector<8xf16>, %arg1: memref<256xf16>, %arg2: vector<1xindex>, %arg3: vector<1xi1>) {
      xegpu.store %arg0, %arg1[%arg2], %arg3 <{chunk_size = 8 : i64}> : vector<8xf16>, memref<256xf16>, vector<1xindex>, vector<1xi1>
      gpu.return
    }
    gpu.func @simt_store_5(%arg0: vector<8xf16>, %arg1: memref<256xf16>, %arg2: index, %arg3: i1) {
      xegpu.store %arg0, %arg1[%arg2], %arg3 <{chunk_size = 8 : i64}> : vector<8xf16>, memref<256xf16>, index, i1
      gpu.return
    }
    gpu.func @simt_store_6(%arg0: vector<1xf16>, %arg1: memref<256xf16>, %arg2: vector<1xindex>, %arg3: vector<1xi1>) {
      xegpu.store %arg0, %arg1[%arg2], %arg3  : vector<1xf16>, memref<256xf16>, vector<1xindex>, vector<1xi1>
      gpu.return
    }
    gpu.func @simt_store_7(%arg0: f16, %arg1: memref<256xf16>, %arg2: index, %arg3: i1) {
      xegpu.store %arg0, %arg1[%arg2], %arg3  : f16, memref<256xf16>, index, i1
      gpu.return
    }
    gpu.func @subgroup_store_offset_1(%arg0: memref<?xf16>) {
      %cst = arith.constant dense<2.900390e+00> : vector<4x2xf16>
      %cst_0 = arith.constant dense<[0, 8, 16, 24]> : vector<4xindex>
      %cst_1 = arith.constant dense<true> : vector<4xi1>
      xegpu.store %cst, %arg0[%cst_0], %cst_1 <{chunk_size = 2 : i64, l1_hint = #xegpu.cache_hint<cached>}> : vector<4x2xf16>, memref<?xf16>, vector<4xindex>, vector<4xi1>
      gpu.return
    }
    gpu.func @load_contiguity(%arg0: i64, %arg1: vector<16xindex>, %arg2: vector<16xi1>) {
      %0 = xegpu.load %arg0[%arg1], %arg2 <{contiguity = 4 : i64}> : i64, vector<16xindex>, vector<16xi1> -> vector<16xf32>
      gpu.return
    }
    gpu.func @store_contiguity(%arg0: vector<16xf32>, %arg1: i64, %arg2: vector<16xindex>, %arg3: vector<16xi1>) {
      xegpu.store %arg0, %arg1[%arg2], %arg3 <{contiguity = 4 : i64}> : vector<16xf32>, i64, vector<16xindex>, vector<16xi1>
      gpu.return
    }
    gpu.func @prefetch_offset(%arg0: ui64) {
      %cst = arith.constant dense<[0, 8, 16, 24]> : vector<4xindex>
      xegpu.prefetch %arg0[%cst] <{l1_hint = #xegpu.cache_hint<cached>, l2_hint = #xegpu.cache_hint<uncached>, offset_align_byte = 2 : i64}> : ui64, vector<4xindex>
      gpu.return
    }
    gpu.func @subgroup_dpas(%arg0: vector<8x16xf16>, %arg1: vector<16x16xf16>) {
      %0 = xegpu.dpas %arg0, %arg1 : vector<8x16xf16>, vector<16x16xf16> -> vector<8x16xf32>
      gpu.return
    }
    gpu.func @simt_dpas(%arg0: vector<8xf16>, %arg1: vector<16xf16>) {
      %0 = xegpu.dpas %arg0, %arg1 : vector<8xf16>, vector<16xf16> -> vector<8xf32>
      gpu.return
    }
    gpu.func @subgroup_dpas_packed_b(%arg0: vector<8x16xf16>, %arg1: vector<8x16x2xf16>) {
      %0 = xegpu.dpas %arg0, %arg1 : vector<8x16xf16>, vector<8x16x2xf16> -> vector<8x16xf32>
      gpu.return
    }
    gpu.func @alloc_nbarrier() {
      xegpu.alloc_nbarrier 8
      gpu.return
    }
    gpu.func @init_nbarrier() {
      %c1_i8 = arith.constant 1 : i8
      %c16_i8 = arith.constant 16 : i8
      %0 = xegpu.init_nbarrier %c1_i8, %c16_i8 : i8, i8 -> !xegpu.nbarrier
      gpu.return
    }
    gpu.func @nbarrier_arrive(%arg0: !xegpu.nbarrier) {
      xegpu.nbarrier_arrive %arg0 : !xegpu.nbarrier
      gpu.return
    }
    gpu.func @nbarrier_wait(%arg0: !xegpu.nbarrier) {
      xegpu.nbarrier_wait %arg0 : !xegpu.nbarrier
      gpu.return
    }
    gpu.func @fence() {
      xegpu.fence memory_kind = global, fence_scope = workgroup
      gpu.return
    }
    gpu.func @create_mem_desc() {
      %alloca = memref.alloca() {alignment = 1024 : i64} : memref<2048xi8, 3>
      %0 = xegpu.create_mem_desc %alloca : memref<2048xi8, 3> -> !xegpu.mem_desc<16x64xf16>
      gpu.return
    }
    gpu.func @create_mem_desc_with_stride() {
      %alloca = memref.alloca() {alignment = 1024 : i64} : memref<2048xi8, 3>
      %0 = xegpu.create_mem_desc %alloca : memref<2048xi8, 3> -> !xegpu.mem_desc<16x64xf16, #xegpu.mem_layout<stride = [1, 16]>>
      gpu.return
    }
    gpu.func @create_mem_desc_from_2d_memref() {
      %alloca = memref.alloca() {alignment = 1024 : i64} : memref<16x64xf16, 3>
      %0 = xegpu.create_mem_desc %alloca : memref<16x64xf16, 3> -> !xegpu.mem_desc<16x64xf16>
      gpu.return
    }
    gpu.func @create_mem_desc_with_stride_from_2d_memref() {
      %alloca = memref.alloca() {alignment = 1024 : i64} : memref<32x64xf16, 3>
      %subview = memref.subview %alloca[16, 0] [16, 64] [1, 1] : memref<32x64xf16, 3> to memref<16x64xf16, strided<[64, 1], offset: 1024>, 3>
      %0 = xegpu.create_mem_desc %subview : memref<16x64xf16, strided<[64, 1], offset: 1024>, 3> -> !xegpu.mem_desc<16x64xf16, #xegpu.mem_layout<stride = [1, 16]>>
      gpu.return
    }
    gpu.func @load_matrix(%arg0: !xegpu.mem_desc<16x64xf16>) {
      %0 = xegpu.load_matrix %arg0[8, 8] : !xegpu.mem_desc<16x64xf16> -> vector<8x16xf16>
      gpu.return
    }
    gpu.func @load_matrix_with_stride(%arg0: !xegpu.mem_desc<16x64xf16, #xegpu.mem_layout<stride = [1, 16]>>) {
      %0 = xegpu.load_matrix %arg0[8, 8] : !xegpu.mem_desc<16x64xf16, #xegpu.mem_layout<stride = [1, 16]>> -> vector<8x16xf16>
      gpu.return
    }
    gpu.func @simt_load_matrix(%arg0: !xegpu.mem_desc<16x64xf16>) {
      %0 = xegpu.load_matrix %arg0[8, 16] : !xegpu.mem_desc<16x64xf16> -> vector<1xf16>
      gpu.return
    }
    gpu.func @simt_load_matrix_subgroup_block_io(%arg0: !xegpu.mem_desc<16x64xf16, #xegpu.mem_layout<block = [16, 16]>>) {
      %0 = xegpu.load_matrix %arg0[8, 16] <{subgroup_block_io}>: !xegpu.mem_desc<16x64xf16, #xegpu.mem_layout<block = [16, 16]>> -> vector<8xf16>
      gpu.return
    }
    gpu.func @simt_load_matrix_vector(%arg0: !xegpu.mem_desc<16x64xf16, #xegpu.mem_layout<stride = [1, 16]>>) {
      %0 = xegpu.load_matrix %arg0[8, 8] : !xegpu.mem_desc<16x64xf16, #xegpu.mem_layout<stride = [1, 16]>> -> vector<8xf16>
      gpu.return
    }
    gpu.func @store_matrix(%arg0: !xegpu.mem_desc<16x64xf16>, %arg1: vector<16x16xf16>) {
      xegpu.store_matrix %arg1, %arg0[8, 8] : vector<16x16xf16>, !xegpu.mem_desc<16x64xf16>
      gpu.return
    }
    gpu.func @store_matrix_with_stride(%arg0: !xegpu.mem_desc<16x64xf16, #xegpu.mem_layout<stride = [1, 16]>>, %arg1: vector<16x16xf16>) {
      xegpu.store_matrix %arg1, %arg0[0, 8] : vector<16x16xf16>, !xegpu.mem_desc<16x64xf16, #xegpu.mem_layout<stride = [1, 16]>>
      gpu.return
    }
    gpu.func @simt_store_matrix(%arg0: !xegpu.mem_desc<16x64xf16>, %arg1: vector<1xf16>) {
      xegpu.store_matrix %arg1, %arg0[8, 16] : vector<1xf16>, !xegpu.mem_desc<16x64xf16>
      gpu.return
    }
    gpu.func @simt_store_matrix_subgroup_block_io(%arg0: !xegpu.mem_desc<16x64xf16, #xegpu.mem_layout<block = [16, 16]>>, %arg1: vector<8xf16>) {
      xegpu.store_matrix %arg1, %arg0[8, 16] <{subgroup_block_io}>: vector<8xf16>, !xegpu.mem_desc<16x64xf16, #xegpu.mem_layout<block = [16, 16]>>
      gpu.return
    }
    gpu.func @simt_store_matrix_vector(%arg0: !xegpu.mem_desc<16x64xf16, #xegpu.mem_layout<stride = [1, 16]>>, %arg1: vector<8xf16>) {
      xegpu.store_matrix %arg1, %arg0[8, 8] : vector<8xf16>, !xegpu.mem_desc<16x64xf16, #xegpu.mem_layout<stride = [1, 16]>>
      gpu.return
    }
    gpu.func @load_matrix_1d(%arg0: !xegpu.mem_desc<64xf16>) {
      %0 = xegpu.load_matrix %arg0[16] : !xegpu.mem_desc<64xf16> -> vector<16xf16>
      gpu.return
    }
    gpu.func @store_matrix_1d(%arg0: !xegpu.mem_desc<64xf16>, %arg1: vector<16xf16>) {
      xegpu.store_matrix %arg1, %arg0[0] : vector<16xf16>, !xegpu.mem_desc<64xf16>
      gpu.return
    }
    gpu.func @load_matrix_1d_block_io(%arg0: !xegpu.mem_desc<64xf16, #xegpu.mem_layout<block = [16]>>) {
      %0 = xegpu.load_matrix %arg0[0] <{subgroup_block_io}>: !xegpu.mem_desc<64xf16, #xegpu.mem_layout<block = [16]>> -> vector<16xf16>
      gpu.return
    }
    gpu.func @store_matrix_1d_block_io(%arg0: !xegpu.mem_desc<64xf16, #xegpu.mem_layout<block = [16]>>, %arg1: vector<16xf16>) {
      xegpu.store_matrix %arg1, %arg0[0] <{subgroup_block_io}>: vector<16xf16>, !xegpu.mem_desc<64xf16, #xegpu.mem_layout<block = [16]>>
      gpu.return
    }
    gpu.func @simt_load_matrix_1d(%arg0: !xegpu.mem_desc<64xf16>) {
      %0 = xegpu.load_matrix %arg0[0] : !xegpu.mem_desc<64xf16> -> vector<1xf16>
      gpu.return
    }
    gpu.func @truncf(%arg0: vector<8x16xf16>) {
      %0 = xegpu.truncf %arg0 : vector<8x16xf16> -> vector<8x16xf8E5M2>
      gpu.return
    }
    gpu.func @dpas_mx(%arg0: vector<8x32xf8E5M2>, %arg1: vector<32x16xf8E5M2>, %arg2: vector<8x16xbf16>, %arg3: vector<8x1xf8E8M0FNU>, %arg4: vector<1x16xf8E8M0FNU>) {
      %0 = xegpu.dpas_mx %arg0, %arg1, %arg2 scale_a = %arg3 scale_b = %arg4 : (vector<8x32xf8E5M2>, vector<32x16xf8E5M2>, vector<8x16xbf16>, vector<8x1xf8E8M0FNU>, vector<1x16xf8E8M0FNU>) -> vector<8x16xbf16>
      gpu.return
    }
    gpu.func @dpas_3d_batch(%arg0: vector<4x8x16xf16>, %arg1: vector<4x16x16xf16>) {
      %0 = xegpu.dpas %arg0, %arg1 : vector<4x8x16xf16>, vector<4x16x16xf16> -> vector<4x8x16xf32>
      gpu.return
    }
    gpu.func @dpas_3d_batch_with_acc(%arg0: vector<4x8x16xf16>, %arg1: vector<4x16x16xf16>, %arg2: vector<4x8x16xf32>) {
      %0 = xegpu.dpas %arg0, %arg1, %arg2 : vector<4x8x16xf16>, vector<4x16x16xf16>, vector<4x8x16xf32> -> vector<4x8x16xf32>
      gpu.return
    }
    gpu.func @dpas_mx_3d_batch(%arg0: vector<4x8x32xf8E5M2>, %arg1: vector<4x32x16xf8E5M2>, %arg2: vector<4x8x16xbf16>, %arg3: vector<4x8x1xf8E8M0FNU>, %arg4: vector<4x1x16xf8E8M0FNU>) {
      %0 = xegpu.dpas_mx %arg0, %arg1, %arg2 scale_a = %arg3 scale_b = %arg4 : (vector<4x8x32xf8E5M2>, vector<4x32x16xf8E5M2>, vector<4x8x16xbf16>, vector<4x8x1xf8E8M0FNU>, vector<4x1x16xf8E8M0FNU>) -> vector<4x8x16xbf16>
      gpu.return
    }
  }
}

