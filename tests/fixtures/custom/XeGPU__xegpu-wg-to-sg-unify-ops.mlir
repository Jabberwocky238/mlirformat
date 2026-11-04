module {
  gpu.module @test_distribution {
    gpu.func @create_nd_tdesc_no_offset(%arg0: memref<256x128xf32>) {
      %0 = xegpu.create_nd_tdesc %arg0 : memref<256x128xf32> -> !xegpu.tensor_desc<256x128xf32, #xegpu.layout<sg_layout = [8, 4], sg_data = [32, 32], lane_layout = [1, 16], lane_data = [1, 1]>>
      gpu.return
    }
    gpu.func @create_nd_tdesc_with_ptr(%arg0: ui64, %arg1: index, %arg2: index, %arg3: index, %arg4: index) {
      %c1 = arith.constant 1 : index
      %0 = xegpu.create_nd_tdesc %arg0, shape : [%arg2, %arg1], strides : [%arg1, %c1] : ui64 -> !xegpu.tensor_desc<256x128xf32, #xegpu.layout<sg_layout = [8, 4], sg_data = [32, 32], lane_layout = [1, 16], lane_data = [1, 1]>>
      gpu.return
    }
    gpu.func @load_nd_tdesc_with_offset(%arg0: memref<256x128xf32>) {
      %0 = xegpu.create_nd_tdesc %arg0 : memref<256x128xf32> -> !xegpu.tensor_desc<256x128xf32, #xegpu.layout<sg_layout = [8, 4], sg_data = [32, 32], lane_layout = [1, 16], lane_data = [1, 1]>>
      %1 = xegpu.load_nd %0[0, 0] <{layout = #xegpu.layout<sg_layout = [8, 4], sg_data = [32, 32], lane_layout = [1, 16], lane_data = [1, 1]>}> : !xegpu.tensor_desc<256x128xf32, #xegpu.layout<sg_layout = [8, 4], sg_data = [32, 32], lane_layout = [1, 16], lane_data = [1, 1]>> -> vector<256x128xf32>
      gpu.return
    }
    gpu.func @store_nd_with_offsets(%arg0: memref<256x128xf32>) {
      %0 = xegpu.create_nd_tdesc %arg0 : memref<256x128xf32> -> !xegpu.tensor_desc<256x128xf32, #xegpu.layout<sg_layout = [8, 4], sg_data = [32, 32], lane_layout = [1, 16], lane_data = [1, 1]>>
      %1 = xegpu.load_nd %0[0, 0] <{layout = #xegpu.layout<sg_layout = [8, 4], sg_data = [32, 32], lane_layout = [1, 16], lane_data = [1, 1]>}> : !xegpu.tensor_desc<256x128xf32, #xegpu.layout<sg_layout = [8, 4], sg_data = [32, 32], lane_layout = [1, 16], lane_data = [1, 1]>> -> vector<256x128xf32>
      xegpu.store_nd %1, %0[0, 0]  : vector<256x128xf32>, !xegpu.tensor_desc<256x128xf32, #xegpu.layout<sg_layout = [8, 4], sg_data = [32, 32], lane_layout = [1, 16], lane_data = [1, 1]>>
      gpu.return
    }
    gpu.func @prefetch_nd_tdesc_with_offset(%arg0: memref<256x128xf32>) {
      %c0 = arith.constant 0 : index
      %0 = xegpu.create_nd_tdesc %arg0 : memref<256x128xf32> -> !xegpu.tensor_desc<256x128xf32, #xegpu.layout<sg_layout = [8, 4], sg_data = [32, 32], lane_layout = [1, 16], lane_data = [1, 1]>>
      xegpu.prefetch_nd %0[%c0, %c0]  : !xegpu.tensor_desc<256x128xf32, #xegpu.layout<sg_layout = [8, 4], sg_data = [32, 32], lane_layout = [1, 16], lane_data = [1, 1]>>
      gpu.return
    }
    gpu.func @dpas(%arg0: memref<128x128xf16>, %arg1: memref<128x128xf16>) {
      %0 = xegpu.create_nd_tdesc %arg0 : memref<128x128xf16> -> !xegpu.tensor_desc<128x128xf16, #xegpu.layout<sg_layout = [8, 8], sg_data = [16, 128], lane_layout = [1, 16], lane_data = [1, 1]>>
      %1 = xegpu.load_nd %0[0, 0] <{layout = #xegpu.layout<sg_layout = [8, 8], sg_data = [16, 128], lane_layout = [1, 16], lane_data = [1, 1]>}> : !xegpu.tensor_desc<128x128xf16, #xegpu.layout<sg_layout = [8, 8], sg_data = [16, 128], lane_layout = [1, 16], lane_data = [1, 1]>> -> vector<128x128xf16>
      %2 = xegpu.create_nd_tdesc %arg1 : memref<128x128xf16> -> !xegpu.tensor_desc<128x128xf16, #xegpu.layout<sg_layout = [8, 8], sg_data = [128, 16], lane_layout = [1, 16], lane_data = [2, 1]>>
      %3 = xegpu.load_nd %2[0, 0] <{layout = #xegpu.layout<sg_layout = [8, 8], sg_data = [128, 16], lane_layout = [1, 16], lane_data = [2, 1]>}> : !xegpu.tensor_desc<128x128xf16, #xegpu.layout<sg_layout = [8, 8], sg_data = [128, 16], lane_layout = [1, 16], lane_data = [2, 1]>> -> vector<128x128xf16>
      %4 = xegpu.dpas %1, %3 {layout_a = #xegpu.layout<sg_layout = [8, 8], sg_data = [16, 128], lane_layout = [1, 16], lane_data = [1, 1]>, layout_b = #xegpu.layout<sg_layout = [8, 8], sg_data = [128, 16], lane_layout = [1, 16], lane_data = [2, 1]>, layout_cd = #xegpu.layout<sg_layout = [8, 8], sg_data = [16, 16], lane_layout = [1, 16], lane_data = [1, 1]>} : vector<128x128xf16>, vector<128x128xf16> -> vector<128x128xf32>
      gpu.return
    }
    gpu.func @dpas_no_sg_data(%arg0: memref<128x128xf16>, %arg1: memref<128x128xf16>) {
      %0 = xegpu.create_nd_tdesc %arg0 : memref<128x128xf16> -> !xegpu.tensor_desc<128x128xf16, #xegpu.layout<sg_layout = [8, 8], lane_layout = [1, 16], lane_data = [1, 1], order = [1, 0]>>
      %1 = xegpu.load_nd %0[0, 0] <{layout = #xegpu.layout<sg_layout = [8, 8], lane_layout = [1, 16], lane_data = [1, 1], order = [1, 0]>}> : !xegpu.tensor_desc<128x128xf16, #xegpu.layout<sg_layout = [8, 8], lane_layout = [1, 16], lane_data = [1, 1], order = [1, 0]>> -> vector<128x128xf16>
      %2 = xegpu.create_nd_tdesc %arg1 : memref<128x128xf16> -> !xegpu.tensor_desc<128x128xf16, #xegpu.layout<sg_layout = [8, 8], lane_layout = [1, 16], lane_data = [2, 1], order = [1, 0]>>
      %3 = xegpu.load_nd %2[0, 0] <{layout = #xegpu.layout<sg_layout = [8, 8], lane_layout = [1, 16], lane_data = [2, 1], order = [1, 0]>}> : !xegpu.tensor_desc<128x128xf16, #xegpu.layout<sg_layout = [8, 8], lane_layout = [1, 16], lane_data = [2, 1], order = [1, 0]>> -> vector<128x128xf16>
      %4 = xegpu.dpas %1, %3 {layout_a = #xegpu.layout<sg_layout = [8, 8], lane_layout = [1, 16], lane_data = [1, 1], order = [1, 0]>, layout_b = #xegpu.layout<sg_layout = [8, 8], lane_layout = [1, 16], lane_data = [2, 1], order = [1, 0]>, layout_cd = #xegpu.layout<sg_layout = [8, 8], lane_layout = [1, 16], lane_data = [1, 1], order = [1, 0]>} : vector<128x128xf16>, vector<128x128xf16> -> vector<128x128xf32>
      gpu.return
    }
    gpu.func @dpas_with_no_create_nd_desc(%arg0: vector<256x128xf32>, %arg1: vector<128x256xf32>) {
      %0 = xegpu.dpas %arg0, %arg1 {layout_a = #xegpu.layout<sg_layout = [8, 8], sg_data = [16, 128], lane_layout = [1, 16], lane_data = [1, 1]>, layout_b = #xegpu.layout<sg_layout = [8, 8], sg_data = [128, 16], lane_layout = [1, 16], lane_data = [1, 1]>, layout_cd = #xegpu.layout<sg_layout = [8, 8], sg_data = [16, 16], lane_layout = [1, 16], lane_data = [1, 1]>} : vector<256x128xf32>, vector<128x256xf32> -> vector<256x256xf32>
      gpu.return
    }
    gpu.func @broadcast_dim1(%arg0: memref<256x1xf32>) {
      %0 = xegpu.create_nd_tdesc %arg0 : memref<256x1xf32> -> !xegpu.tensor_desc<256x1xf32, #xegpu.layout<sg_layout = [8, 1], sg_data = [32, 1], lane_layout = [8, 1], lane_data = [1, 1]>>
      %1 = xegpu.load_nd %0[0, 0] <{layout = #xegpu.layout<sg_layout = [8, 1], sg_data = [32, 1], lane_layout = [8, 1], lane_data = [1, 1]>}> : !xegpu.tensor_desc<256x1xf32, #xegpu.layout<sg_layout = [8, 1], sg_data = [32, 1], lane_layout = [8, 1], lane_data = [1, 1]>> -> vector<256x1xf32>
      %2 = vector.broadcast %1 {layout_result_0 = #xegpu.layout<sg_layout = [8, 1], sg_data = [32, 32], lane_layout = [8, 1], lane_data = [1, 1]>} : vector<256x1xf32> to vector<256x32xf32>
      gpu.return
    }
    gpu.func @broadcast_dim0(%arg0: memref<1x128xf32>) {
      %0 = xegpu.create_nd_tdesc %arg0 : memref<1x128xf32> -> !xegpu.tensor_desc<1x128xf32, #xegpu.layout<sg_layout = [1, 4], sg_data = [1, 32], lane_layout = [1, 16], lane_data = [1, 1]>>
      %1 = xegpu.load_nd %0[0, 0] <{layout = #xegpu.layout<sg_layout = [1, 4], sg_data = [1, 32], lane_layout = [1, 16], lane_data = [1, 1]>}> : !xegpu.tensor_desc<1x128xf32, #xegpu.layout<sg_layout = [1, 4], sg_data = [1, 32], lane_layout = [1, 16], lane_data = [1, 1]>> -> vector<1x128xf32>
      %2 = vector.broadcast %1 {layout_result_0 = #xegpu.layout<sg_layout = [1, 4], sg_data = [32, 32], lane_layout = [1, 16], lane_data = [1, 1]>} : vector<1x128xf32> to vector<32x128xf32>
      gpu.return
    }
    gpu.func @gemm_with_load_store_offset(%arg0: memref<1024x1024xf16>, %arg1: memref<1024x1024xf16>, %arg2: memref<1024x1024xf32>) {
      %c0 = arith.constant 0 : index
      %c128 = arith.constant 128 : index
      %c1024 = arith.constant 1024 : index
      %block_id_x = gpu.block_id  x
      %block_id_y = gpu.block_id  y
      %0 = arith.muli %block_id_x, %c128 : index
      %1 = arith.muli %block_id_y, %c128 : index
      %2 = xegpu.create_nd_tdesc %arg2 : memref<1024x1024xf32> -> !xegpu.tensor_desc<128x128xf32, #xegpu.layout<sg_layout = [8, 8], sg_data = [16, 16]>>
      %3 = xegpu.create_nd_tdesc %arg0 : memref<1024x1024xf16> -> !xegpu.tensor_desc<128x128xf16, #xegpu.layout<sg_layout = [8, 8], sg_data = [16, 128]>>
      %4 = xegpu.create_nd_tdesc %arg1 : memref<1024x1024xf16> -> !xegpu.tensor_desc<128x128xf16, #xegpu.layout<sg_layout = [8, 8], sg_data = [128, 16]>>
      %5 = xegpu.load_nd %2[%0, %1] <{layout = #xegpu.layout<sg_layout = [8, 8], sg_data = [16, 16]>}> : !xegpu.tensor_desc<128x128xf32, #xegpu.layout<sg_layout = [8, 8], sg_data = [16, 16]>> -> vector<128x128xf32>
      %6 = xegpu.load_nd %3[%0, %c0] <{layout = #xegpu.layout<sg_layout = [8, 8], sg_data = [16, 128]>}> : !xegpu.tensor_desc<128x128xf16, #xegpu.layout<sg_layout = [8, 8], sg_data = [16, 128]>> -> vector<128x128xf16>
      %7 = xegpu.load_nd %4[%c0, %1] <{layout = #xegpu.layout<sg_layout = [8, 8], sg_data = [128, 16]>}> : !xegpu.tensor_desc<128x128xf16, #xegpu.layout<sg_layout = [8, 8], sg_data = [128, 16]>> -> vector<128x128xf16>
      %8:3 = scf.for %arg3 = %c0 to %c1024 step %c128 iter_args(%arg4 = %6, %arg5 = %7, %arg6 = %5) -> (vector<128x128xf16>, vector<128x128xf16>, vector<128x128xf32>) {
        %9 = xegpu.dpas %arg4, %arg5, %arg6 {layout_a = #xegpu.layout<sg_layout = [8, 8], sg_data = [16, 128]>, layout_b = #xegpu.layout<sg_layout = [8, 8], sg_data = [128, 16]>, layout_cd = #xegpu.layout<sg_layout = [8, 8], sg_data = [16, 16]>} : vector<128x128xf16>, vector<128x128xf16>, vector<128x128xf32> -> vector<128x128xf32>
        %10 = xegpu.load_nd %3[%arg3, %c0] <{layout = #xegpu.layout<sg_layout = [8, 8], sg_data = [16, 128]>}> : !xegpu.tensor_desc<128x128xf16, #xegpu.layout<sg_layout = [8, 8], sg_data = [16, 128]>> -> vector<128x128xf16>
        %11 = xegpu.load_nd %4[%c0, %arg3] <{layout = #xegpu.layout<sg_layout = [8, 8], sg_data = [128, 16]>}> : !xegpu.tensor_desc<128x128xf16, #xegpu.layout<sg_layout = [8, 8], sg_data = [128, 16]>> -> vector<128x128xf16>
        scf.yield %10, %11, %9 : vector<128x128xf16>, vector<128x128xf16>, vector<128x128xf32>
      }
      xegpu.store_nd %8#2, %2[%0, %1]  : vector<128x128xf32>, !xegpu.tensor_desc<128x128xf32, #xegpu.layout<sg_layout = [8, 8], sg_data = [16, 16]>>
      gpu.return
    }
    gpu.func @subgroup_id_range(%arg0: memref<256x128xf32>, %arg1: memref<128x256xf32>, %arg2: memref<128x64xf32>) {
      %0 = gpu.subgroup_id : index
      %c0 = arith.constant 0 : index
      %c1 = arith.constant 1 : index
      %c2 = arith.constant 2 : index
      %c31 = arith.constant 31 : index
      %c3 = arith.constant 3 : index
      %1 = arith.cmpi sge, %0, %c0 : index
      %2 = arith.cmpi slt, %0, %c1 : index
      %3 = arith.andi %1, %2 : i1
      scf.if %3 {
        %7 = xegpu.create_nd_tdesc %arg0 : memref<256x128xf32> -> !xegpu.tensor_desc<256x128xf32, #xegpu.layout<sg_layout = [8, 4], sg_data = [32, 32], lane_layout = [8, 4], lane_data = [1, 1]>>
        %8 = xegpu.load_nd %7[0, 0] <{layout = #xegpu.layout<sg_layout = [8, 4], sg_data = [32, 32], lane_layout = [8, 4], lane_data = [1, 1]>}> : !xegpu.tensor_desc<256x128xf32, #xegpu.layout<sg_layout = [8, 4], sg_data = [32, 32], lane_layout = [8, 4], lane_data = [1, 1]>> -> vector<256x128xf32>
      } {sg_id_range = #xegpu.range<[0 : i64, 32 : i64]>}
      %4 = arith.cmpi sge, %0, %c2 : index
      %5 = arith.cmpi slt, %0, %c31 : index
      %6 = arith.andi %4, %5 : i1
      scf.if %6 {
        %7 = xegpu.create_nd_tdesc %arg2 : memref<128x64xf32> -> !xegpu.tensor_desc<128x64xf32, #xegpu.layout<sg_layout = [4, 4], sg_data = [32, 16], lane_layout = [8, 4], lane_data = [1, 1]>>
        %8 = xegpu.load_nd %7[0, 0] <{layout = #xegpu.layout<sg_layout = [4, 4], sg_data = [32, 16], lane_layout = [8, 4], lane_data = [1, 1]>}> : !xegpu.tensor_desc<128x64xf32, #xegpu.layout<sg_layout = [4, 4], sg_data = [32, 16], lane_layout = [8, 4], lane_data = [1, 1]>> -> vector<128x64xf32>
        %9 = math.exp %8 {layout_result_0 = #xegpu.layout<sg_layout = [4, 4], sg_data = [32, 16], lane_layout = [8, 4], lane_data = [1, 1]>} : vector<128x64xf32>
      } {sg_id_range = #xegpu.range<[2 : i64, 18 : i64]>}
      gpu.return
    }
    gpu.func @subgroup_id_range_nested_if(%arg0: memref<256x128xf32>, %arg1: memref<128x64xf32>) {
      %0 = gpu.subgroup_id : index
      %true = arith.constant true
      %c3 = arith.constant 3 : index
      %c32 = arith.constant 32 : index
      %1 = xegpu.create_nd_tdesc %arg0 : memref<256x128xf32> -> !xegpu.tensor_desc<256x128xf32, #xegpu.layout<sg_layout = [8, 4], sg_data = [32, 32], lane_layout = [8, 4], lane_data = [1, 1]>>
      %2 = xegpu.load_nd %1[0, 0] <{layout = #xegpu.layout<sg_layout = [8, 4], sg_data = [32, 32], lane_layout = [8, 4], lane_data = [1, 1]>}> : !xegpu.tensor_desc<256x128xf32, #xegpu.layout<sg_layout = [8, 4], sg_data = [32, 32], lane_layout = [8, 4], lane_data = [1, 1]>> -> vector<256x128xf32>
      %3 = arith.cmpi sge, %0, %c3 : index
      %4 = arith.cmpi slt, %0, %c32 : index
      %5 = arith.andi %3, %4 : i1
      scf.if %true {
        scf.if %5 {
          %6 = xegpu.create_nd_tdesc %arg1 : memref<128x64xf32> -> !xegpu.tensor_desc<128x64xf32, #xegpu.layout<sg_layout = [4, 4], sg_data = [32, 16], lane_layout = [8, 4], lane_data = [1, 1]>>
          %7 = xegpu.load_nd %6[0, 0] <{layout = #xegpu.layout<sg_layout = [4, 4], sg_data = [32, 16], lane_layout = [8, 4], lane_data = [1, 1]>}> : !xegpu.tensor_desc<128x64xf32, #xegpu.layout<sg_layout = [4, 4], sg_data = [32, 16], lane_layout = [8, 4], lane_data = [1, 1]>> -> vector<128x64xf32>
          %8 = math.exp %7 {layout_result_0 = #xegpu.layout<sg_layout = [4, 4], sg_data = [32, 16], lane_layout = [8, 4], lane_data = [1, 1]>} : vector<128x64xf32>
        }
      } {sg_id_range = #xegpu.range<[3 : i64, 19 : i64]>}
      gpu.return
    }
    gpu.func @load_gather(%arg0: memref<?xf16>) {
      %cst = arith.constant {layout_result_0 = #xegpu.layout<sg_layout = [8, 4], sg_data = [32, 4]>} dense<0> : vector<256x16xindex>
      %cst_0 = arith.constant {layout_result_0 = #xegpu.layout<sg_layout = [8, 4], sg_data = [32, 4]>} dense<true> : vector<256x16xi1>
      %0 = xegpu.load %arg0[%cst], %cst_0 <{chunk_size = 1 : i64, l1_hint = #xegpu.cache_hint<cached>, layout = #xegpu.layout<sg_layout = [8, 4], sg_data = [32, 4]>}> : memref<?xf16>, vector<256x16xindex>, vector<256x16xi1> -> vector<256x16xf16>
      gpu.return
    }
    gpu.func @store_scatter(%arg0: memref<256xf16>) {
      %cst = arith.constant {layout_result_0 = #xegpu.layout<sg_layout = [32], sg_data = [8], inst_data = [8]>} dense<2.550000e+01> : vector<256xf16>
      %cst_0 = arith.constant {layout_result_0 = #xegpu.layout<sg_layout = [32], sg_data = [8], inst_data = [8]>} dense<0> : vector<256xindex>
      %cst_1 = arith.constant {layout_result_0 = #xegpu.layout<sg_layout = [32], sg_data = [8], inst_data = [8]>} dense<true> : vector<256xi1>
      xegpu.store %cst, %arg0[%cst_0], %cst_1 <{chunk_size = 1 : i64, l1_hint = #xegpu.cache_hint<cached>, layout = #xegpu.layout<sg_layout = [32], sg_data = [8], inst_data = [8]>}> {layout_operand_2 = #xegpu.layout<sg_layout = [32], sg_data = [8], inst_data = [8]>, layout_operand_3 = #xegpu.layout<sg_layout = [32], sg_data = [8], inst_data = [8]>} : vector<256xf16>, memref<256xf16>, vector<256xindex>, vector<256xi1>
      gpu.return
    }
    gpu.func @load_with_non_unit_chunk_size(%arg0: memref<?xf16>) {
      %cst = arith.constant {layout_result_0 = #xegpu.layout<sg_layout = [32], sg_data = [8]>} dense<0> : vector<256xindex>
      %cst_0 = arith.constant {layout_result_0 = #xegpu.layout<sg_layout = [32], sg_data = [8]>} dense<true> : vector<256xi1>
      %0 = xegpu.load %arg0[%cst], %cst_0 <{chunk_size = 4 : i64, l1_hint = #xegpu.cache_hint<cached>, layout = #xegpu.layout<sg_layout = [32, 1], sg_data = [8, 4]>}> : memref<?xf16>, vector<256xindex>, vector<256xi1> -> vector<256x4xf16>
      gpu.return
    }
    gpu.func @distribute_load_matrix(%arg0: memref<32768xi8, 3>) {
      %0 = xegpu.create_mem_desc %arg0 : memref<32768xi8, 3> -> !xegpu.mem_desc<64x128xf32>
      %1 = xegpu.load_matrix %0[0, 0] <{layout = #xegpu.layout<sg_layout = [2, 4], sg_data = [32, 32], lane_layout = [2, 8], lane_data = [1, 1]>}>: !xegpu.mem_desc<64x128xf32> -> vector<64x128xf32>
      gpu.return
    }
    gpu.func @distribute_store_matrix(%arg0: memref<32768xi8, 3>) {
      %cst = arith.constant {layout_result_0 = #xegpu.layout<sg_layout = [2, 4], sg_data = [32, 32]>} dense<1.000000e+00> : vector<64x128xf32>
      %0 = xegpu.create_mem_desc %arg0 : memref<32768xi8, 3> -> !xegpu.mem_desc<64x128xf32>
      xegpu.store_matrix %cst, %0[0, 0] <{layout = #xegpu.layout<sg_layout = [2, 4], sg_data = [32, 32]>}>: vector<64x128xf32>, !xegpu.mem_desc<64x128xf32>
      gpu.return
    }
    gpu.func @vector_reduce_dim_0(%arg0: memref<4x128xf32>) {
      %cst = arith.constant {layout_result_0 = #xegpu.slice<#xegpu.layout<sg_layout = [1, 32], sg_data = [4, 4]>, dims = [0]>} dense<1.000000e+00> : vector<128xf32>
      %0 = xegpu.create_nd_tdesc %arg0 : memref<4x128xf32> -> !xegpu.tensor_desc<4x128xf32, #xegpu.layout<sg_layout = [1, 32], sg_data = [4, 4]>>
      %1 = xegpu.load_nd %0[0, 0] <{layout = #xegpu.layout<sg_layout = [1, 32], sg_data = [4, 4]>}> : !xegpu.tensor_desc<4x128xf32, #xegpu.layout<sg_layout = [1, 32], sg_data = [4, 4]>> -> vector<4x128xf32>
      %2 = vector.multi_reduction <add>, %1, %cst {layout_result_0 = #xegpu.slice<#xegpu.layout<sg_layout = [1, 32], sg_data = [4, 4]>, dims = [0]>} [0] : vector<4x128xf32> to vector<128xf32>
      gpu.return
    }
    gpu.func @vector_reduce_dim_1(%arg0: memref<256x64xf32>) {
      %cst = arith.constant {layout_result_0 = #xegpu.slice<#xegpu.layout<sg_layout = [16, 1], sg_data = [16, 64]>, dims = [1]>} dense<1.000000e+00> : vector<256xf32>
      %0 = xegpu.create_nd_tdesc %arg0 : memref<256x64xf32> -> !xegpu.tensor_desc<256x64xf32, #xegpu.layout<sg_layout = [16, 1], sg_data = [16, 64]>>
      %1 = xegpu.load_nd %0[0, 0] <{layout = #xegpu.layout<sg_layout = [16, 1], sg_data = [16, 64]>}> : !xegpu.tensor_desc<256x64xf32, #xegpu.layout<sg_layout = [16, 1], sg_data = [16, 64]>> -> vector<256x64xf32>
      %2 = vector.multi_reduction <add>, %1, %cst {layout_result_0 = #xegpu.slice<#xegpu.layout<sg_layout = [16, 1], sg_data = [16, 64]>, dims = [1]>} [1] : vector<256x64xf32> to vector<256xf32>
      gpu.return
    }
    gpu.func @vector_reduce_4D(%arg0: ui64) {
      %cst = arith.constant {layout_result_0 = #xegpu.slice<#xegpu.layout<sg_layout = [4, 2, 6, 1], sg_data = [1, 1, 1, 32]>, dims = [3]>} dense<0.000000e+00> : vector<4x2x6xf16>
      %cst_0 = arith.constant {layout_result_0 = #xegpu.layout<sg_layout = [4, 2, 6, 1], sg_data = [1, 1, 1, 32]>} dense<0> : vector<4x2x6x32xindex>
      %cst_1 = arith.constant {layout_result_0 = #xegpu.layout<sg_layout = [4, 2, 6, 1], sg_data = [1, 1, 1, 32]>} dense<true> : vector<4x2x6x32xi1>
      %0 = xegpu.load %arg0[%cst_0], %cst_1 <{layout = #xegpu.layout<sg_layout = [4, 2, 6, 1], sg_data = [1, 1, 1, 32]>}> : ui64, vector<4x2x6x32xindex>, vector<4x2x6x32xi1> -> vector<4x2x6x32xf16>
      %1 = vector.multi_reduction <add>, %0, %cst {layout_result_0 = #xegpu.slice<#xegpu.layout<sg_layout = [4, 2, 6, 1], sg_data = [1, 1, 1, 32]>, dims = [3]>} [3] : vector<4x2x6x32xf16> to vector<4x2x6xf16>
      gpu.return
    }
    gpu.func @vector_step_op_slice_attr() {
      %0 = vector.step {layout_result_0 = #xegpu.slice<#xegpu.layout<sg_layout = [4, 8], sg_data = [32, 32]>, dims = [1]>} : vector<128xindex>
      gpu.return
    }
    gpu.func @vector_step_op_layout_attr() {
      %0 = vector.step {layout_result_0 = #xegpu.layout<sg_layout = [16], sg_data = [8]>} : vector<128xindex>
      gpu.return
    }
    gpu.func @constant_with_slice_attr() {
      %cst = arith.constant {layout_result_0 = #xegpu.slice<#xegpu.layout<sg_layout = [4, 2, 6, 1], sg_data = [1, 1, 1, 1]>, dims = [1, 2, 3]>} dense<10> : vector<4xindex>
      gpu.return
    }
    gpu.func @vector_shape_cast() {
      %cst = arith.constant {layout_result_0 = #xegpu.slice<#xegpu.layout<sg_layout = [8, 1, 1, 4], sg_data = [1, 1, 1, 32]>, dims = [0, 1, 2]>} dense<10> : vector<128xindex>
      %0 = vector.step {layout_result_0 = #xegpu.slice<#xegpu.layout<sg_layout = [8, 1, 1, 4], sg_data = [1, 1, 1, 32]>, dims = [0, 1, 2]>} : vector<128xindex>
      %1 = arith.muli %cst, %0 {layout_result_0 = #xegpu.slice<#xegpu.layout<sg_layout = [8, 1, 1, 4], sg_data = [1, 1, 1, 32]>, dims = [0, 1, 2]>} : vector<128xindex>
      %2 = vector.shape_cast %1 {layout_result_0 = #xegpu.layout<sg_layout = [8, 1, 1, 4], sg_data = [1, 1, 1, 32]>} : vector<128xindex> to vector<1x1x1x128xindex>
      gpu.return
    }
    gpu.func @vector_broadcast(%arg0: index, %arg1: index) {
      %0 = arith.muli %arg0, %arg1 : index
      %1 = vector.broadcast %0 {layout_result_0 = #xegpu.layout<sg_layout = [4, 2, 6, 1], sg_data = [1, 1, 1, 32]>} : index to vector<4x2x6x32xindex>
      gpu.return
    }
    gpu.func @vector_transpose(%arg0: memref<256x32xf32>) {
      %0 = xegpu.create_nd_tdesc %arg0 : memref<256x32xf32> -> !xegpu.tensor_desc<256x32xf32, #xegpu.layout<sg_layout = [4, 8], sg_data = [64, 32], lane_layout = [16, 1], lane_data = [1, 1], order = [0, 1]>>
      %1 = xegpu.load_nd %0[0, 0] <{layout = #xegpu.layout<sg_layout = [4, 8], sg_data = [64, 32], lane_layout = [16, 1], lane_data = [1, 1], order = [0, 1]>}> : !xegpu.tensor_desc<256x32xf32, #xegpu.layout<sg_layout = [4, 8], sg_data = [64, 32], lane_layout = [16, 1], lane_data = [1, 1], order = [0, 1]>> -> vector<256x32xf32>
      %2 = vector.transpose %1, [1, 0] {layout_result_0 = #xegpu.layout<sg_layout = [8, 4], sg_data = [32, 64], lane_layout = [1, 16], lane_data = [1, 1], order = [1, 0]>} : vector<256x32xf32> to vector<32x256xf32>
      gpu.return
    }
    gpu.func @non_splat_constant_2D() {
      %cst = arith.constant {layout_result_0 = #xegpu.layout<sg_layout = [32, 1], sg_data = [1, 1]>} dense<[[0], [16], [32], [48], [64], [80], [96], [112], [128], [144], [160], [176], [192], [208], [224], [240], [256], [272], [288], [304], [320], [336], [352], [368], [384], [400], [416], [432], [448], [464], [480], [496]]> : vector<32x1xindex>
      gpu.return
    }
    gpu.func @non_splat_constant_2D_non_unit_dim() {
      %cst = arith.constant {layout_result_0 = #xegpu.layout<sg_layout = [4, 4], sg_data = [2, 2]>} dense<[[0, 16, 32, 48, 64, 80, 96, 112], [8, 24, 40, 56, 72, 88, 104, 120], [16, 32, 48, 64, 80, 96, 112, 128], [24, 40, 56, 72, 88, 104, 120, 136], [32, 48, 64, 80, 96, 112, 128, 144], [40, 56, 72, 88, 104, 120, 136, 152], [48, 64, 80, 96, 112, 128, 144, 160], [56, 72, 88, 104, 120, 136, 152, 168]]> : vector<8x8xindex>
      gpu.return
    }
    gpu.func @non_splat_constant() {
      %cst = arith.constant {layout_result_0 = #xegpu.layout<sg_layout = [32], sg_data = [1]>} dense<[0, 16, 32, 48, 64, 80, 96, 112, 128, 144, 160, 176, 192, 208, 224, 240, 256, 272, 288, 304, 320, 336, 352, 368, 384, 400, 416, 432, 448, 464, 480, 496]> : vector<32xindex>
      %cst_0 = arith.constant {layout_result_0 = #xegpu.layout<sg_layout = [32, 1], sg_data = [1, 16]>} dense<[[0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15]]> : vector<1x16xindex>
      gpu.return
    }
    gpu.func @scalar_broadcast(%arg0: index) {
      %0 = vector.broadcast %arg0 {layout_result_0 = #xegpu.layout<sg_layout = [4, 8, 1], sg_data = [1, 1, 1]>} : index to vector<4x1x1xindex>
      gpu.return
    }
    gpu.func @vector_mask_1D() {
      %0 = vector.constant_mask [8] {layout_result_0 = #xegpu.layout<sg_layout = [2], sg_data = [16]>} : vector<32xi1>
      gpu.return
    }
    gpu.func @vector_mask_2D() {
      %0 = vector.constant_mask [16, 16] {layout_result_0 = #xegpu.layout<sg_layout = [8, 4], sg_data = [32, 32]>} : vector<256x128xi1>
      gpu.return
    }
    gpu.func @vector_create_mask_1D() {
      %c8 = arith.constant 8 : index
      %0 = vector.create_mask %c8 {layout_result_0 = #xegpu.layout<sg_layout = [2], sg_data = [16]>} : vector<32xi1>
      gpu.return
    }
    gpu.func @vector_create_mask_2D() {
      %c16 = arith.constant 16 : index
      %0 = vector.create_mask %c16, %c16 {layout_result_0 = #xegpu.layout<sg_layout = [8, 4], sg_data = [32, 32]>} : vector<256x128xi1>
      gpu.return
    }
    gpu.func @distribute_load_slice_attr() {
      %alloca = memref.alloca() {alignment = 1024 : i64} : memref<4096xf32>
      %cst = arith.constant {layout_result_0 = #xegpu.layout<sg_layout = [8], sg_data = [32], inst_data = [16]>} dense<0> : vector<256xindex>
      %cst_0 = arith.constant {layout_result_0 = #xegpu.layout<sg_layout = [8], sg_data = [32], inst_data = [16]>} dense<true> : vector<256xi1>
      %0 = xegpu.load %alloca[%cst], %cst_0 <{chunk_size = 1 : i64, layout = #xegpu.slice<#xegpu.layout<sg_layout = [8, 8], sg_data = [32, 32], inst_data = [8, 16]>, dims = [0]>}> : memref<4096xf32>, vector<256xindex>, vector<256xi1> -> vector<256xf32>
      %1 = vector.broadcast %0 {layout_result_0 = #xegpu.layout<sg_layout = [8, 8], sg_data = [32, 32], inst_data = [8, 16]>} : vector<256xf32> to vector<256x256xf32>
      gpu.return
    }
    gpu.func @load_nd_tdesc_with_anchor_layout(%arg0: memref<256x128xf32>) {
      %0 = xegpu.create_nd_tdesc %arg0 : memref<256x128xf32> -> !xegpu.tensor_desc<256x128xf32, #xegpu.layout<sg_layout = [8, 4], sg_data = [32, 32], lane_layout = [1, 16], lane_data = [1, 1]>>
      %1 = xegpu.load_nd %0[0, 0] <{layout = #xegpu.layout<sg_layout = [8, 4], sg_data = [32, 32], inst_data = [32, 16], lane_layout = [1, 16], lane_data = [1, 1]>}> : !xegpu.tensor_desc<256x128xf32, #xegpu.layout<sg_layout = [8, 4], sg_data = [32, 32], lane_layout = [1, 16], lane_data = [1, 1]>> -> vector<256x128xf32>
      gpu.return
    }
  }
}

