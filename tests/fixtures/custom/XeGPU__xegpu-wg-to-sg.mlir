module {
  gpu.module @test_distribution {
    gpu.func @create_nd_tdesc(%arg0: memref<256x128xf32>) {
      %0 = xegpu.create_nd_tdesc %arg0 : memref<256x128xf32> -> !xegpu.tensor_desc<256x128xf32, #xegpu.layout<sg_layout = [8, 4], sg_data = [32, 32], lane_layout = [1, 16], lane_data = [1, 1]>>
      gpu.return
    }
    gpu.func @create_nd_tdesc_with_ptr(%arg0: ui64, %arg1: index, %arg2: index, %arg3: index, %arg4: index) {
      %c1 = arith.constant 1 : index
      %0 = xegpu.create_nd_tdesc %arg0, shape : [%arg2, %arg1], strides : [%arg1, %c1] : ui64 -> !xegpu.tensor_desc<256x128xf32, #xegpu.layout<sg_layout = [8, 4], sg_data = [32, 32], lane_layout = [1, 16], lane_data = [1, 1]>>
      gpu.return
    }
    gpu.func @load_nd(%arg0: memref<256x128xf32>) {
      %0 = xegpu.create_nd_tdesc %arg0 : memref<256x128xf32> -> !xegpu.tensor_desc<256x128xf32>
      %1 = xegpu.load_nd %0[0, 0] <{layout = #xegpu.layout<sg_layout = [8, 4], sg_data = [32, 32], lane_layout = [1, 16], lane_data = [1, 1]>}> : !xegpu.tensor_desc<256x128xf32> -> vector<256x128xf32>
      gpu.return
    }
    gpu.func @store_nd(%arg0: memref<256x128xf32>) {
      %0 = xegpu.create_nd_tdesc %arg0 : memref<256x128xf32> -> !xegpu.tensor_desc<256x128xf32>
      %1 = xegpu.load_nd %0[0, 0] <{layout = #xegpu.layout<sg_layout = [8, 4], sg_data = [32, 32], lane_layout = [1, 16], lane_data = [1, 1]>}> : !xegpu.tensor_desc<256x128xf32> -> vector<256x128xf32>
      xegpu.store_nd %1, %0[0, 0] <{layout = #xegpu.layout<sg_layout = [8, 4], sg_data = [32, 32], lane_layout = [1, 16], lane_data = [1, 1]>}> : vector<256x128xf32>, !xegpu.tensor_desc<256x128xf32>
      gpu.return
    }
    gpu.func @prefetch_nd(%arg0: memref<256x128xf32>) {
      %c0 = arith.constant 0 : index
      %0 = xegpu.create_nd_tdesc %arg0 : memref<256x128xf32> -> !xegpu.tensor_desc<256x128xf32>
      xegpu.prefetch_nd %0[%c0, %c0] <{layout = #xegpu.layout<sg_layout = [8, 4], sg_data = [32, 32], lane_layout = [1, 16], lane_data = [1, 1]>}> : !xegpu.tensor_desc<256x128xf32>
      gpu.return
    }
    gpu.func @dpas(%arg0: memref<128x128xf16>, %arg1: memref<128x128xf16>) {
      %0 = xegpu.create_nd_tdesc %arg0 : memref<128x128xf16> -> !xegpu.tensor_desc<128x128xf16>
      %1 = xegpu.load_nd %0[0, 0] <{layout = #xegpu.layout<sg_layout = [8, 8], sg_data = [16, 128], lane_layout = [1, 16], lane_data = [1, 1]>}> : !xegpu.tensor_desc<128x128xf16> -> vector<128x128xf16>
      %2 = xegpu.create_nd_tdesc %arg1 : memref<128x128xf16> -> !xegpu.tensor_desc<128x128xf16>
      %3 = xegpu.load_nd %2[0, 0] <{layout = #xegpu.layout<sg_layout = [8, 8], sg_data = [128, 16], lane_layout = [1, 16], lane_data = [2, 1]>}> : !xegpu.tensor_desc<128x128xf16> -> vector<128x128xf16>
      %4 = xegpu.dpas %1, %3 {layout_a = #xegpu.layout<sg_layout = [8, 8], sg_data = [16, 128], lane_layout = [1, 16], lane_data = [1, 1]>, layout_b = #xegpu.layout<sg_layout = [8, 8], sg_data = [128, 16], lane_layout = [1, 16], lane_data = [2, 1]>, layout_cd = #xegpu.layout<sg_layout = [8, 8], sg_data = [16, 16], lane_layout = [1, 16], lane_data = [1, 1]>} : vector<128x128xf16>, vector<128x128xf16> -> vector<128x128xf32>
      gpu.return
    }
    gpu.func @dpas_mx(%arg0: memref<128x128xf8E5M2>, %arg1: memref<128x128xf8E5M2>, %arg2: memref<128x4xf8E8M0FNU>, %arg3: memref<4x128xf8E8M0FNU>) {
      %0 = xegpu.create_nd_tdesc %arg0 : memref<128x128xf8E5M2> -> !xegpu.tensor_desc<128x128xf8E5M2, #xegpu.layout<sg_layout = [8, 8], sg_data = [16, 128], lane_layout = [1, 16], lane_data = [1, 2]>>
      %1 = xegpu.load_nd %0[0, 0] <{layout = #xegpu.layout<sg_layout = [8, 8], sg_data = [16, 128], lane_layout = [1, 16], lane_data = [1, 2]>}> : !xegpu.tensor_desc<128x128xf8E5M2, #xegpu.layout<sg_layout = [8, 8], sg_data = [16, 128], lane_layout = [1, 16], lane_data = [1, 2]>> -> vector<128x128xf8E5M2>
      %2 = xegpu.create_nd_tdesc %arg1 : memref<128x128xf8E5M2> -> !xegpu.tensor_desc<128x128xf8E5M2, #xegpu.layout<sg_layout = [8, 8], sg_data = [128, 16], lane_layout = [1, 16], lane_data = [2, 1]>>
      %3 = xegpu.load_nd %2[0, 0] <{layout = #xegpu.layout<sg_layout = [8, 8], sg_data = [128, 16], lane_layout = [1, 16], lane_data = [2, 1]>}> : !xegpu.tensor_desc<128x128xf8E5M2, #xegpu.layout<sg_layout = [8, 8], sg_data = [128, 16], lane_layout = [1, 16], lane_data = [2, 1]>> -> vector<128x128xf8E5M2>
      %4 = xegpu.create_nd_tdesc %arg2 : memref<128x4xf8E8M0FNU> -> !xegpu.tensor_desc<128x4xf8E8M0FNU, #xegpu.layout<sg_layout = [8, 8], sg_data = [16, 4], lane_layout = [16, 1], lane_data = [1, 1]>>
      %5 = xegpu.load_nd %4[0, 0] <{layout = #xegpu.layout<sg_layout = [8, 8], sg_data = [16, 4], lane_layout = [16, 1], lane_data = [1, 1]>}> : !xegpu.tensor_desc<128x4xf8E8M0FNU, #xegpu.layout<sg_layout = [8, 8], sg_data = [16, 4], lane_layout = [16, 1], lane_data = [1, 1]>> -> vector<128x4xf8E8M0FNU>
      %6 = xegpu.create_nd_tdesc %arg3 : memref<4x128xf8E8M0FNU> -> !xegpu.tensor_desc<4x128xf8E8M0FNU, #xegpu.layout<sg_layout = [8, 8], sg_data = [4, 16], lane_layout = [1, 16], lane_data = [1, 1]>>
      %7 = xegpu.load_nd %6[0, 0] <{layout = #xegpu.layout<sg_layout = [8, 8], sg_data = [4, 16], lane_layout = [1, 16], lane_data = [1, 1]>}> : !xegpu.tensor_desc<4x128xf8E8M0FNU, #xegpu.layout<sg_layout = [8, 8], sg_data = [4, 16], lane_layout = [1, 16], lane_data = [1, 1]>> -> vector<4x128xf8E8M0FNU>
      %cst = arith.constant dense<0.000000e+00> : vector<128x128xbf16>
      %8 = xegpu.dpas_mx %1, %3, %cst scale_a = %5 scale_b = %7 {layout_a = #xegpu.layout<sg_layout = [8, 8], sg_data = [16, 128], lane_layout = [1, 16], lane_data = [1, 2]>, layout_a_scale = #xegpu.layout<sg_layout = [8, 8], sg_data = [16, 4], lane_layout = [16, 1], lane_data = [1, 1]>, layout_b = #xegpu.layout<sg_layout = [8, 8], sg_data = [128, 16], lane_layout = [1, 16], lane_data = [2, 1]>, layout_b_scale = #xegpu.layout<sg_layout = [8, 8], sg_data = [4, 16], lane_layout = [1, 16], lane_data = [1, 1]>, layout_cd = #xegpu.layout<sg_layout = [8, 8], sg_data = [16, 16], lane_layout = [1, 16], lane_data = [1, 1]>} : (vector<128x128xf8E5M2>, vector<128x128xf8E5M2>, vector<128x128xbf16>, vector<128x4xf8E8M0FNU>, vector<4x128xf8E8M0FNU>) -> vector<128x128xbf16>
      gpu.return
    }
    gpu.func @dpas_no_sg_data(%arg0: memref<128x128xf16>, %arg1: memref<128x128xf16>) {
      %0 = xegpu.create_nd_tdesc %arg0 : memref<128x128xf16> -> !xegpu.tensor_desc<128x128xf16>
      %1 = xegpu.load_nd %0[0, 0] <{layout = #xegpu.layout<sg_layout = [8, 8], sg_data = [16, 128], lane_layout = [1, 16], lane_data = [1, 1], order = [1, 0]>}> : !xegpu.tensor_desc<128x128xf16> -> vector<128x128xf16>
      %2 = xegpu.create_nd_tdesc %arg1 : memref<128x128xf16> -> !xegpu.tensor_desc<128x128xf16>
      %3 = xegpu.load_nd %2[0, 0] <{layout = #xegpu.layout<sg_layout = [8, 8], sg_data = [128, 16], lane_layout = [1, 16], lane_data = [2, 1], order = [1, 0]>}> : !xegpu.tensor_desc<128x128xf16> -> vector<128x128xf16>
      %4 = xegpu.dpas %1, %3 {layout_a = #xegpu.layout<sg_layout = [8, 8], sg_data = [16, 16], lane_layout = [1, 16], lane_data = [1, 1], order = [1, 0]>, layout_b = #xegpu.layout<sg_layout = [8, 8], sg_data = [16, 16], lane_layout = [1, 16], lane_data = [2, 1], order = [1, 0]>, layout_cd = #xegpu.layout<sg_layout = [8, 8], sg_data = [16, 16], lane_layout = [1, 16], lane_data = [1, 1], order = [1, 0]>} : vector<128x128xf16>, vector<128x128xf16> -> vector<128x128xf32>
      gpu.return
    }
    gpu.func @broadcast_dim1(%arg0: memref<256x1xf32>) {
      %0 = xegpu.create_nd_tdesc %arg0 : memref<256x1xf32> -> !xegpu.tensor_desc<256x1xf32>
      %1 = xegpu.load_nd %0[0, 0] <{layout = #xegpu.layout<sg_layout = [8, 1], sg_data = [32, 1], lane_layout = [8, 1], lane_data = [1, 1]>}> : !xegpu.tensor_desc<256x1xf32> -> vector<256x1xf32>
      %2 = vector.broadcast %1 : vector<256x1xf32> to vector<256x32xf32>
      %3 = xegpu.convert_layout %2 <{input_layout = #xegpu.layout<sg_layout = [8, 1], sg_data = [32, 32], lane_layout = [8, 1], lane_data = [1, 1]>, target_layout = #xegpu.layout<sg_layout = [8, 1], sg_data = [32, 32], lane_layout = [8, 1], lane_data = [1, 1]>}> : vector<256x32xf32>
      gpu.return
    }
    gpu.func @broadcast_dim0(%arg0: memref<1x128xf32>) {
      %0 = xegpu.create_nd_tdesc %arg0 : memref<1x128xf32> -> !xegpu.tensor_desc<1x128xf32>
      %1 = xegpu.load_nd %0[0, 0] <{layout = #xegpu.layout<sg_layout = [1, 4], sg_data = [1, 32], lane_layout = [1, 16], lane_data = [1, 1]>}> : !xegpu.tensor_desc<1x128xf32> -> vector<1x128xf32>
      %2 = vector.broadcast %1 : vector<1x128xf32> to vector<32x128xf32>
      %3 = xegpu.convert_layout %2 <{input_layout = #xegpu.layout<sg_layout = [1, 4], sg_data = [32, 32], lane_layout = [1, 16], lane_data = [1, 1]>, target_layout = #xegpu.layout<sg_layout = [1, 4], sg_data = [32, 32], lane_layout = [1, 16], lane_data = [1, 1]>}> : vector<32x128xf32>
      gpu.return
    }
    gpu.func @gemm_with_load_store_offset(%arg0: memref<1024x1024xf16>, %arg1: memref<1024x1024xf16>, %arg2: memref<1024x1024xf32>) {
      %c0 = arith.constant 0 : index
      %c128 = arith.constant 128 : index
      %c1024 = arith.constant 1024 : index
      %block_id_x = gpu.block_id x
      %block_id_y = gpu.block_id y
      %0 = arith.muli %block_id_x, %c128 : index
      %1 = arith.muli %block_id_y, %c128 : index
      %2 = xegpu.create_nd_tdesc %arg2 : memref<1024x1024xf32> -> !xegpu.tensor_desc<128x128xf32>
      %3 = xegpu.create_nd_tdesc %arg0 : memref<1024x1024xf16> -> !xegpu.tensor_desc<128x128xf16>
      %4 = xegpu.create_nd_tdesc %arg1 : memref<1024x1024xf16> -> !xegpu.tensor_desc<128x128xf16>
      %5 = xegpu.load_nd %2[%0, %1] <{layout = #xegpu.layout<sg_layout = [8, 8], sg_data = [16, 16]>}> : !xegpu.tensor_desc<128x128xf32> -> vector<128x128xf32>
      %6 = xegpu.load_nd %3[%0, %c0] <{layout = #xegpu.layout<sg_layout = [8, 8], sg_data = [16, 128]>}> : !xegpu.tensor_desc<128x128xf16> -> vector<128x128xf16>
      %7 = xegpu.load_nd %4[%c0, %1] <{layout = #xegpu.layout<sg_layout = [8, 8], sg_data = [128, 16]>}> : !xegpu.tensor_desc<128x128xf16> -> vector<128x128xf16>
      %8:3 = scf.for %arg3 = %c0 to %c1024 step %c128 iter_args(%arg4 = %6, %arg5 = %7, %arg6 = %5) -> (vector<128x128xf16>, vector<128x128xf16>, vector<128x128xf32>) {
        %9 = xegpu.dpas %arg4, %arg5, %arg6 {layout_a = #xegpu.layout<sg_layout = [8, 8], sg_data = [16, 128]>, layout_b = #xegpu.layout<sg_layout = [8, 8], sg_data = [128, 16]>, layout_cd = #xegpu.layout<sg_layout = [8, 8], sg_data = [16, 16]>} : vector<128x128xf16>, vector<128x128xf16>, vector<128x128xf32> -> vector<128x128xf32>
        %10 = xegpu.load_nd %3[%arg3, %c0] <{layout = #xegpu.layout<sg_layout = [8, 8], sg_data = [16, 128]>}> : !xegpu.tensor_desc<128x128xf16> -> vector<128x128xf16>
        %11 = xegpu.load_nd %4[%c0, %arg3] <{layout = #xegpu.layout<sg_layout = [8, 8], sg_data = [128, 16]>}> : !xegpu.tensor_desc<128x128xf16> -> vector<128x128xf16>
        scf.yield %10, %11, %9 : vector<128x128xf16>, vector<128x128xf16>, vector<128x128xf32>
      }
      xegpu.store_nd %8#2, %2[%0, %1] <{layout = #xegpu.layout<sg_layout = [8, 8], sg_data = [16, 16]>}> : vector<128x128xf32>, !xegpu.tensor_desc<128x128xf32>
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
        %7 = xegpu.create_nd_tdesc %arg0 : memref<256x128xf32> -> !xegpu.tensor_desc<256x128xf32>
        %8 = xegpu.load_nd %7[0, 0] <{layout = #xegpu.layout<sg_layout = [8, 4], sg_data = [32, 32], lane_layout = [8, 4], lane_data = [1, 1]>}> : !xegpu.tensor_desc<256x128xf32> -> vector<256x128xf32>
      } {sg_id_range = #xegpu.range<[0 : i64, 32 : i64]>}
      %4 = arith.cmpi sge, %0, %c2 : index
      %5 = arith.cmpi slt, %0, %c31 : index
      %6 = arith.andi %4, %5 : i1
      scf.if %6 {
        %7 = xegpu.create_nd_tdesc %arg2 : memref<128x64xf32> -> !xegpu.tensor_desc<128x64xf32>
        %8 = xegpu.load_nd %7[0, 0] <{layout = #xegpu.layout<sg_layout = [4, 4], sg_data = [32, 16], lane_layout = [8, 4], lane_data = [1, 1]>}> : !xegpu.tensor_desc<128x64xf32> -> vector<128x64xf32>
        %9 = math.exp %8 : vector<128x64xf32>
        %10 = xegpu.convert_layout %9 <{input_layout = #xegpu.layout<sg_layout = [4, 4], sg_data = [32, 16], lane_layout = [8, 4], lane_data = [1, 1]>, target_layout = #xegpu.layout<sg_layout = [4, 4], sg_data = [32, 16], lane_layout = [8, 4], lane_data = [1, 1]>}> : vector<128x64xf32>
      } {sg_id_range = #xegpu.range<[2 : i64, 18 : i64]>}
      gpu.return
    }
    gpu.func @subgroup_id_range_nested_if(%arg0: memref<256x128xf32>, %arg1: memref<128x64xf32>) {
      %0 = gpu.subgroup_id : index
      %true = arith.constant true
      %c3 = arith.constant 3 : index
      %c32 = arith.constant 32 : index
      %1 = xegpu.create_nd_tdesc %arg0 : memref<256x128xf32> -> !xegpu.tensor_desc<256x128xf32>
      %2 = xegpu.load_nd %1[0, 0] <{layout = #xegpu.layout<sg_layout = [8, 4], sg_data = [32, 32], lane_layout = [8, 4], lane_data = [1, 1]>}> : !xegpu.tensor_desc<256x128xf32> -> vector<256x128xf32>
      %3 = arith.cmpi sge, %0, %c3 : index
      %4 = arith.cmpi slt, %0, %c32 : index
      %5 = arith.andi %3, %4 : i1
      scf.if %true {
        scf.if %5 {
          %6 = xegpu.create_nd_tdesc %arg1 : memref<128x64xf32> -> !xegpu.tensor_desc<128x64xf32>
          %7 = xegpu.load_nd %6[0, 0] <{layout = #xegpu.layout<sg_layout = [4, 4], sg_data = [32, 16], lane_layout = [8, 4], lane_data = [1, 1]>}> : !xegpu.tensor_desc<128x64xf32> -> vector<128x64xf32>
          %8 = math.exp %7 : vector<128x64xf32>
          %9 = xegpu.convert_layout %8 <{input_layout = #xegpu.layout<sg_layout = [4, 4], sg_data = [32, 16], lane_layout = [8, 4], lane_data = [1, 1]>, target_layout = #xegpu.layout<sg_layout = [4, 4], sg_data = [32, 16], lane_layout = [8, 4], lane_data = [1, 1]>}> : vector<128x64xf32>
        }
      } {sg_id_range = #xegpu.range<[3 : i64, 19 : i64]>}
      gpu.return
    }
    gpu.func @load_gather(%arg0: memref<?xf16>) {
      %cst = arith.constant dense<0> : vector<256x16xindex>
      %cst_0 = arith.constant dense<true> : vector<256x16xi1>
      %0 = xegpu.load %arg0[%cst], %cst_0 <{chunk_size = 1 : i64, l1_hint = #xegpu.cache_hint<cached>, layout = #xegpu.layout<sg_layout = [8, 4], sg_data = [32, 4]>}> : memref<?xf16>, vector<256x16xindex>, vector<256x16xi1> -> vector<256x16xf16>
      gpu.return
    }
    gpu.func @store_scatter(%arg0: memref<256xf16>) {
      %cst = arith.constant dense<2.550000e+01> : vector<256xf16>
      %cst_0 = arith.constant dense<0> : vector<256xindex>
      %cst_1 = arith.constant dense<true> : vector<256xi1>
      xegpu.store %cst, %arg0[%cst_0], %cst_1 <{chunk_size = 1 : i64, l1_hint = #xegpu.cache_hint<cached>, layout = #xegpu.layout<sg_layout = [32], sg_data = [8], inst_data = [8]>}> : vector<256xf16>, memref<256xf16>, vector<256xindex>, vector<256xi1>
      gpu.return
    }
    gpu.func @load_with_non_unit_chunk_size(%arg0: memref<?xf16>) {
      %cst = arith.constant dense<0> : vector<256xindex>
      %cst_0 = arith.constant dense<true> : vector<256xi1>
      %0 = xegpu.load %arg0[%cst], %cst_0 <{chunk_size = 4 : i64, l1_hint = #xegpu.cache_hint<cached>, layout = #xegpu.layout<sg_layout = [32, 1], sg_data = [8, 4]>}> : memref<?xf16>, vector<256xindex>, vector<256xi1> -> vector<256x4xf16>
      gpu.return
    }
    gpu.func @distribute_load_matrix(%arg0: memref<32768xi8, 3>) {
      %0 = xegpu.create_mem_desc %arg0 : memref<32768xi8, 3> -> !xegpu.mem_desc<64x128xf32>
      %1 = xegpu.load_matrix %0[0, 0] <{layout = #xegpu.layout<sg_layout = [2, 4], sg_data = [32, 32], lane_layout = [2, 8], lane_data = [1, 1]>}>: !xegpu.mem_desc<64x128xf32> -> vector<64x128xf32>
      gpu.return
    }
    gpu.func @distribute_store_matrix(%arg0: memref<32768xi8, 3>) {
      %cst = arith.constant dense<1.000000e+00> : vector<64x128xf32>
      %0 = xegpu.create_mem_desc %arg0 : memref<32768xi8, 3> -> !xegpu.mem_desc<64x128xf32>
      xegpu.store_matrix %cst, %0[0, 0] <{layout = #xegpu.layout<sg_layout = [2, 4], sg_data = [32, 32]>}>: vector<64x128xf32>, !xegpu.mem_desc<64x128xf32>
      gpu.return
    }
    gpu.func @vector_reduce_dim_0(%arg0: memref<4x128xf32>) {
      %cst = arith.constant dense<1.000000e+00> : vector<128xf32>
      %0 = xegpu.create_nd_tdesc %arg0 : memref<4x128xf32> -> !xegpu.tensor_desc<4x128xf32>
      %1 = xegpu.load_nd %0[0, 0] <{layout = #xegpu.layout<sg_layout = [1, 32], sg_data = [4, 4]>}> : !xegpu.tensor_desc<4x128xf32> -> vector<4x128xf32>
      %2 = vector.multi_reduction <add>, %1, %cst [0] : vector<4x128xf32> to vector<128xf32>
      %3 = xegpu.convert_layout %2 <{input_layout = #xegpu.slice<#xegpu.layout<sg_layout = [1, 32], sg_data = [4, 4]>, dims = [0]>, target_layout = #xegpu.slice<#xegpu.layout<sg_layout = [1, 32], sg_data = [4, 4]>, dims = [0]>}> : vector<128xf32>
      gpu.return
    }
    gpu.func @vector_reduce_dim_1(%arg0: memref<256x64xf32>) {
      %cst = arith.constant dense<1.000000e+00> : vector<256xf32>
      %0 = xegpu.create_nd_tdesc %arg0 : memref<256x64xf32> -> !xegpu.tensor_desc<256x64xf32>
      %1 = xegpu.load_nd %0[0, 0] <{layout = #xegpu.layout<sg_layout = [16, 1], sg_data = [16, 64]>}> : !xegpu.tensor_desc<256x64xf32> -> vector<256x64xf32>
      %2 = vector.multi_reduction <add>, %1, %cst [1] : vector<256x64xf32> to vector<256xf32>
      %3 = xegpu.convert_layout %2 <{input_layout = #xegpu.slice<#xegpu.layout<sg_layout = [16, 1], sg_data = [16, 64]>, dims = [1]>, target_layout = #xegpu.slice<#xegpu.layout<sg_layout = [16, 1], sg_data = [16, 64]>, dims = [1]>}> : vector<256xf32>
      gpu.return
    }
    gpu.func @vector_reduce_4D(%arg0: ui64) {
      %cst = arith.constant dense<0.000000e+00> : vector<4x2x6xf16>
      %cst_0 = arith.constant dense<0> : vector<4x2x6x32xindex>
      %cst_1 = arith.constant dense<true> : vector<4x2x6x32xi1>
      %0 = xegpu.load %arg0[%cst_0], %cst_1 <{layout = #xegpu.layout<sg_layout = [4, 2, 6, 1], sg_data = [1, 1, 1, 32]>}> : ui64, vector<4x2x6x32xindex>, vector<4x2x6x32xi1> -> vector<4x2x6x32xf16>
      %1 = vector.multi_reduction <add>, %0, %cst [3] : vector<4x2x6x32xf16> to vector<4x2x6xf16>
      %2 = xegpu.convert_layout %1 <{input_layout = #xegpu.slice<#xegpu.layout<sg_layout = [4, 2, 6, 1], sg_data = [1, 1, 1, 32]>, dims = [3]>, target_layout = #xegpu.slice<#xegpu.layout<sg_layout = [4, 2, 6, 1], sg_data = [1, 1, 1, 32]>, dims = [3]>}> : vector<4x2x6xf16>
      gpu.return
    }
    gpu.func @vector_reduce_scalar_cross_sg(%arg0: memref<32x32xf32>) {
      %cst = arith.constant 0.000000e+00 : f32
      %0 = xegpu.create_nd_tdesc %arg0 : memref<32x32xf32> -> !xegpu.tensor_desc<32x32xf32>
      %1 = xegpu.load_nd %0[0, 0] <{layout = #xegpu.layout<sg_layout = [4, 4], sg_data = [8, 8]>}> : !xegpu.tensor_desc<32x32xf32> -> vector<32x32xf32>
      %2 = vector.multi_reduction <add>, %1, %cst [0, 1] : vector<32x32xf32> to f32
      %3 = xegpu.convert_layout %2 <{input_layout = #xegpu.slice<#xegpu.layout<sg_layout = [4, 4], sg_data = [8, 8]>, dims = [0, 1]>, target_layout = #xegpu.slice<#xegpu.layout<sg_layout = [4, 4], sg_data = [8, 8]>, dims = [0, 1]>}> : f32
      gpu.return
    }
    gpu.func @vector_step_op_slice_attr() {
      %0 = vector.step : vector<128xindex>
      %1 = xegpu.convert_layout %0 <{input_layout = #xegpu.slice<#xegpu.layout<sg_layout = [4, 8], sg_data = [32, 32]>, dims = [1]>, target_layout = #xegpu.slice<#xegpu.layout<sg_layout = [4, 8], sg_data = [32, 32]>, dims = [1]>}> : vector<128xindex>
      gpu.return
    }
    gpu.func @vector_step_op_layout_attr() {
      %0 = vector.step : vector<128xindex>
      %1 = xegpu.convert_layout %0 <{input_layout = #xegpu.layout<sg_layout = [16], sg_data = [8]>, target_layout = #xegpu.layout<sg_layout = [16], sg_data = [8]>}> : vector<128xindex>
      gpu.return
    }
    gpu.func @constant_with_slice_attr() {
      %cst = arith.constant dense<10> : vector<4xindex>
      %0 = xegpu.convert_layout %cst <{input_layout = #xegpu.slice<#xegpu.layout<sg_layout = [4, 2, 6, 1], sg_data = [1, 1, 1, 1]>, dims = [1, 2, 3]>, target_layout = #xegpu.slice<#xegpu.layout<sg_layout = [4, 2, 6, 1], sg_data = [1, 1, 1, 1]>, dims = [1, 2, 3]>}> : vector<4xindex>
      gpu.return
    }
    gpu.func @vector_shape_cast() {
      %cst = arith.constant dense<10> : vector<128xindex>
      %0 = vector.step : vector<128xindex>
      %1 = arith.muli %cst, %0 : vector<128xindex>
      %2 = vector.shape_cast %1 : vector<128xindex> to vector<1x1x1x128xindex>
      %3 = xegpu.convert_layout %2 <{input_layout = #xegpu.layout<sg_layout = [8, 1, 1, 4], sg_data = [1, 1, 1, 32]>, target_layout = #xegpu.layout<sg_layout = [8, 1, 1, 4], sg_data = [1, 1, 1, 32]>}> : vector<1x1x1x128xindex>
      gpu.return
    }
    gpu.func @vector_broadcast(%arg0: index, %arg1: index) {
      %0 = arith.muli %arg0, %arg1 : index
      %1 = vector.broadcast %0 : index to vector<4x2x6x32xindex>
      %2 = xegpu.convert_layout %1 <{input_layout = #xegpu.layout<sg_layout = [4, 2, 6, 1], sg_data = [1, 1, 1, 32]>, target_layout = #xegpu.layout<sg_layout = [4, 2, 6, 1], sg_data = [1, 1, 1, 32]>}> : vector<4x2x6x32xindex>
      gpu.return
    }
    gpu.func @vector_transpose(%arg0: memref<256x32xf32>) {
      %0 = xegpu.create_nd_tdesc %arg0 : memref<256x32xf32> -> !xegpu.tensor_desc<256x32xf32>
      %1 = xegpu.load_nd %0[0, 0] <{layout = #xegpu.layout<sg_layout = [4, 8], sg_data = [64, 32], lane_layout = [16, 1], lane_data = [1, 1], order = [0, 1]>}> : !xegpu.tensor_desc<256x32xf32> -> vector<256x32xf32>
      %2 = vector.transpose %1, [1, 0] : vector<256x32xf32> to vector<32x256xf32>
      %3 = xegpu.convert_layout %2 <{input_layout = #xegpu.layout<sg_layout = [8, 4], sg_data = [32, 64], lane_layout = [1, 16], lane_data = [1, 1]>, target_layout = #xegpu.layout<sg_layout = [8, 4], sg_data = [32, 64], lane_layout = [1, 16], lane_data = [1, 1]>}> : vector<32x256xf32>
      gpu.return
    }
    gpu.func @non_splat_constant_2D() {
      %cst = arith.constant dense<[[0], [16], [32], [48], [64], [80], [96], [112], [128], [144], [160], [176], [192], [208], [224], [240], [256], [272], [288], [304], [320], [336], [352], [368], [384], [400], [416], [432], [448], [464], [480], [496]]> : vector<32x1xindex>
      %0 = xegpu.convert_layout %cst <{input_layout = #xegpu.layout<sg_layout = [32, 1], sg_data = [1, 1]>, target_layout = #xegpu.layout<sg_layout = [32, 1], sg_data = [1, 1]>}> : vector<32x1xindex>
      gpu.return
    }
    gpu.func @non_splat_constant_2D_non_unit_dim() {
      %cst = arith.constant dense<[[0, 16, 32, 48, 64, 80, 96, 112], [8, 24, 40, 56, 72, 88, 104, 120], [16, 32, 48, 64, 80, 96, 112, 128], [24, 40, 56, 72, 88, 104, 120, 136], [32, 48, 64, 80, 96, 112, 128, 144], [40, 56, 72, 88, 104, 120, 136, 152], [48, 64, 80, 96, 112, 128, 144, 160], [56, 72, 88, 104, 120, 136, 152, 168]]> : vector<8x8xindex>
      %0 = xegpu.convert_layout %cst <{input_layout = #xegpu.layout<sg_layout = [4, 4], sg_data = [2, 2]>, target_layout = #xegpu.layout<sg_layout = [4, 4], sg_data = [2, 2]>}> : vector<8x8xindex>
      gpu.return
    }
    gpu.func @non_splat_constant() {
      %cst = arith.constant dense<[0, 16, 32, 48, 64, 80, 96, 112, 128, 144, 160, 176, 192, 208, 224, 240, 256, 272, 288, 304, 320, 336, 352, 368, 384, 400, 416, 432, 448, 464, 480, 496]> : vector<32xindex>
      %0 = xegpu.convert_layout %cst <{input_layout = #xegpu.layout<sg_layout = [32], sg_data = [1]>, target_layout = #xegpu.layout<sg_layout = [32], sg_data = [1]>}> : vector<32xindex>
      %cst_0 = arith.constant dense<[[0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15]]> : vector<1x16xindex>
      %1 = xegpu.convert_layout %cst_0 <{input_layout = #xegpu.layout<sg_layout = [32, 1], sg_data = [1, 16]>, target_layout = #xegpu.layout<sg_layout = [32, 1], sg_data = [1, 16]>}> : vector<1x16xindex>
      gpu.return
    }
    gpu.func @scalar_broadcast(%arg0: index) {
      %0 = vector.broadcast %arg0 : index to vector<4x1x1xindex>
      %1 = xegpu.convert_layout %0 <{input_layout = #xegpu.layout<sg_layout = [4, 8, 1], sg_data = [1, 1, 1]>, target_layout = #xegpu.layout<sg_layout = [4, 8, 1], sg_data = [1, 1, 1]>}> : vector<4x1x1xindex>
      gpu.return
    }
    gpu.func @vector_mask_1D() {
      %0 = vector.constant_mask [8] : vector<32xi1>
      %1 = xegpu.convert_layout %0 <{input_layout = #xegpu.layout<sg_layout = [2], sg_data = [16]>, target_layout = #xegpu.layout<sg_layout = [2], sg_data = [16]>}> : vector<32xi1>
      gpu.return
    }
    gpu.func @vector_mask_2D() {
      %0 = vector.constant_mask [16, 16] : vector<256x128xi1>
      %1 = xegpu.convert_layout %0 <{input_layout = #xegpu.layout<sg_layout = [8, 4], sg_data = [32, 32]>, target_layout = #xegpu.layout<sg_layout = [8, 4], sg_data = [32, 32]>}> : vector<256x128xi1>
      gpu.return
    }
    gpu.func @vector_create_mask_1D() {
      %c8 = arith.constant 8 : index
      %0 = vector.create_mask %c8 : vector<32xi1>
      %1 = xegpu.convert_layout %0 <{input_layout = #xegpu.layout<sg_layout = [2], sg_data = [16]>, target_layout = #xegpu.layout<sg_layout = [2], sg_data = [16]>}> : vector<32xi1>
      gpu.return
    }
    gpu.func @vector_create_mask_2D() {
      %c16 = arith.constant 16 : index
      %0 = vector.create_mask %c16, %c16 : vector<256x128xi1>
      %1 = xegpu.convert_layout %0 <{input_layout = #xegpu.layout<sg_layout = [8, 4], sg_data = [32, 32]>, target_layout = #xegpu.layout<sg_layout = [8, 4], sg_data = [32, 32]>}> : vector<256x128xi1>
      gpu.return
    }
    gpu.func @distribute_load_slice_attr() {
      %alloca = memref.alloca() {alignment = 1024 : i64} : memref<4096xf32>
      %cst = arith.constant dense<0> : vector<256xindex>
      %cst_0 = arith.constant dense<true> : vector<256xi1>
      %0 = xegpu.load %alloca[%cst], %cst_0 <{chunk_size = 1 : i64, layout = #xegpu.slice<#xegpu.layout<sg_layout = [8, 8], sg_data = [32, 32], inst_data = [8, 16]>, dims = [0]>}> : memref<4096xf32>, vector<256xindex>, vector<256xi1> -> vector<256xf32>
      %1 = vector.broadcast %0 : vector<256xf32> to vector<256x256xf32>
      %2 = xegpu.convert_layout %1 <{input_layout = #xegpu.layout<sg_layout = [8, 8], sg_data = [32, 32], inst_data = [8, 16]>, target_layout = #xegpu.layout<sg_layout = [8, 8], sg_data = [32, 32], inst_data = [8, 16]>}> : vector<256x256xf32>
      gpu.return
    }
    gpu.func @vector_reduce_cross_sg_dim_1(%arg0: memref<?xf32>) {
      %cst = arith.constant dense<1.000000e+00> : vector<1x32xf32>
      %cst_0 = arith.constant dense<0> : vector<1x32x32xindex>
      %cst_1 = arith.constant dense<true> : vector<1x32x32xi1>
      %0 = xegpu.load %arg0[%cst_0], %cst_1 <{chunk_size = 1 : i64, layout = #xegpu.layout<sg_layout = [1, 32, 1], sg_data = [1, 1, 32]>}> : memref<?xf32>, vector<1x32x32xindex>, vector<1x32x32xi1> -> vector<1x32x32xf32>
      %1 = vector.multi_reduction <add>, %0, %cst [1] : vector<1x32x32xf32> to vector<1x32xf32>
      %2 = xegpu.convert_layout %1 <{input_layout = #xegpu.slice<#xegpu.layout<sg_layout = [1, 32, 1], sg_data = [1, 1, 32]>, dims = [1]>, target_layout = #xegpu.slice<#xegpu.layout<sg_layout = [1, 32, 1], sg_data = [1, 1, 32]>, dims = [1]>}> : vector<1x32xf32>
      gpu.return
    }
    gpu.func @vector_reduce_cross_sg_dim_0(%arg0: memref<256x128xf32>) {
      %cst = arith.constant dense<0.000000e+00> : vector<128xf32>
      %0 = xegpu.create_nd_tdesc %arg0 : memref<256x128xf32> -> !xegpu.tensor_desc<256x128xf32>
      %1 = xegpu.load_nd %0[0, 0] <{layout = #xegpu.layout<sg_layout = [8, 4], sg_data = [32, 32]>}> : !xegpu.tensor_desc<256x128xf32> -> vector<256x128xf32>
      %2 = vector.multi_reduction <add>, %1, %cst [0] : vector<256x128xf32> to vector<128xf32>
      %3 = xegpu.convert_layout %2 <{input_layout = #xegpu.slice<#xegpu.layout<sg_layout = [8, 4], sg_data = [32, 32]>, dims = [0]>, target_layout = #xegpu.slice<#xegpu.layout<sg_layout = [8, 4], sg_data = [32, 32]>, dims = [0]>}> : vector<128xf32>
      gpu.return
    }
    gpu.func @vector_reduce_multi_dim(%arg0: memref<?xf32>) {
      %cst = arith.constant dense<0.000000e+00> : vector<2x2xf32>
      %cst_0 = arith.constant dense<0> : vector<2x2x128x128xindex>
      %cst_1 = arith.constant dense<true> : vector<2x2x128x128xi1>
      %0 = xegpu.load %arg0[%cst_0], %cst_1 <{chunk_size = 1 : i64, layout = #xegpu.layout<sg_layout = [2, 2, 4, 4], sg_data = [1, 1, 32, 32]>}> : memref<?xf32>, vector<2x2x128x128xindex>, vector<2x2x128x128xi1> -> vector<2x2x128x128xf32>
      %1 = vector.multi_reduction <add>, %0, %cst [2, 3] : vector<2x2x128x128xf32> to vector<2x2xf32>
      %2 = xegpu.convert_layout %1 <{input_layout = #xegpu.slice<#xegpu.layout<sg_layout = [2, 2, 4, 4], sg_data = [1, 1, 32, 32]>, dims = [2, 3]>, target_layout = #xegpu.slice<#xegpu.layout<sg_layout = [2, 2, 4, 4], sg_data = [1, 1, 32, 32]>, dims = [2, 3]>}> : vector<2x2xf32>
      gpu.return
    }
    gpu.func @vector_reduce_multi_dim_nou_unit_local_reduction(%arg0: memref<?xf32>) {
      %cst = arith.constant dense<0.000000e+00> : vector<32x32xf32>
      %cst_0 = arith.constant dense<0> : vector<32x32x128x128xindex>
      %cst_1 = arith.constant dense<true> : vector<32x32x128x128xi1>
      %0 = xegpu.load %arg0[%cst_0], %cst_1 <{chunk_size = 1 : i64, layout = #xegpu.layout<sg_layout = [2, 2, 4, 4], sg_data = [16, 16, 32, 32]>}> : memref<?xf32>, vector<32x32x128x128xindex>, vector<32x32x128x128xi1> -> vector<32x32x128x128xf32>
      %1 = vector.multi_reduction <add>, %0, %cst [2, 3] : vector<32x32x128x128xf32> to vector<32x32xf32>
      %2 = xegpu.convert_layout %1 <{input_layout = #xegpu.slice<#xegpu.layout<sg_layout = [2, 2, 4, 4], sg_data = [16, 16, 32, 32]>, dims = [2, 3]>, target_layout = #xegpu.slice<#xegpu.layout<sg_layout = [2, 2, 4, 4], sg_data = [16, 16, 32, 32]>, dims = [2, 3]>}> : vector<32x32xf32>
      gpu.return
    }
    gpu.func @load_nd_tdesc_with_anchor_layout(%arg0: memref<256x128xf32>) {
      %0 = xegpu.create_nd_tdesc %arg0 : memref<256x128xf32> -> !xegpu.tensor_desc<256x128xf32>
      %1 = xegpu.load_nd %0[0, 0] <{layout = #xegpu.layout<sg_layout = [8, 4], sg_data = [32, 32], inst_data = [32, 16], lane_layout = [1, 16], lane_data = [1, 1]>}> : !xegpu.tensor_desc<256x128xf32> -> vector<256x128xf32>
      gpu.return
    }
    gpu.func @convert_layout_no_slm(%arg0: memref<4096x4096xf32>, %arg1: memref<4096x4096xf16>, %arg2: memref<4096x4096xf16>) {
      %c32 = arith.constant 32 : index
      %c4096 = arith.constant 4096 : index
      %c0 = arith.constant 0 : index
      %c256 = arith.constant 256 : index
      %block_id_x = gpu.block_id x
      %block_id_y = gpu.block_id y
      %0 = arith.muli %block_id_x, %c256 overflow<nsw> : index
      %1 = arith.muli %block_id_y, %c256 overflow<nsw> : index
      %2 = xegpu.create_nd_tdesc %arg0 : memref<4096x4096xf32> -> !xegpu.tensor_desc<256x256xf32, #xegpu.block_tdesc_attr<boundary_check = false>, #xegpu.layout<sg_layout = [8, 8], sg_data = [32, 32], inst_data = [8, 16]>>
      %3 = xegpu.load_nd %2[%0, %1] <{layout = #xegpu.layout<sg_layout = [8, 8], sg_data = [32, 32], inst_data = [8, 16]>}> : !xegpu.tensor_desc<256x256xf32, #xegpu.block_tdesc_attr<boundary_check = false>, #xegpu.layout<sg_layout = [8, 8], sg_data = [32, 32], inst_data = [8, 16]>> -> vector<256x256xf32>
      %4 = xegpu.create_nd_tdesc %arg1 : memref<4096x4096xf16> -> !xegpu.tensor_desc<256x32xf16, #xegpu.block_tdesc_attr<boundary_check = false>, #xegpu.layout<sg_layout = [8, 8], sg_data = [32, 32], inst_data = [32, 16]>>
      %5 = xegpu.create_nd_tdesc %arg2 : memref<4096x4096xf16> -> !xegpu.tensor_desc<32x256xf16, #xegpu.block_tdesc_attr<boundary_check = false>, #xegpu.layout<sg_layout = [8, 8], sg_data = [32, 32], inst_data = [32, 16]>>
      %6 = scf.for %arg3 = %c0 to %c4096 step %c32 iter_args(%arg4 = %3) -> (vector<256x256xf32>) {
        %7 = xegpu.load_nd %4[%0, %arg3] <{layout = #xegpu.layout<sg_layout = [8, 8], sg_data = [32, 32], inst_data = [32, 16]>}> : !xegpu.tensor_desc<256x32xf16, #xegpu.block_tdesc_attr<boundary_check = false>, #xegpu.layout<sg_layout = [8, 8], sg_data = [32, 32], inst_data = [32, 16]>> -> vector<256x32xf16>
        %8 = xegpu.load_nd %5[%arg3, %1] <{layout = #xegpu.layout<sg_layout = [8, 8], sg_data = [32, 32], inst_data = [32, 16]>}> : !xegpu.tensor_desc<32x256xf16, #xegpu.block_tdesc_attr<boundary_check = false>, #xegpu.layout<sg_layout = [8, 8], sg_data = [32, 32], inst_data = [32, 16]>> -> vector<32x256xf16>
        %9 = xegpu.convert_layout %7 <{input_layout = #xegpu.layout<sg_layout = [8, 8], sg_data = [32, 32], inst_data = [32, 16]>, target_layout = #xegpu.layout<sg_layout = [8, 8], sg_data = [32, 32], inst_data = [8, 16]>}> : vector<256x32xf16>
        %10 = xegpu.convert_layout %8 <{input_layout = #xegpu.layout<sg_layout = [8, 8], sg_data = [32, 32], inst_data = [32, 16]>, target_layout = #xegpu.layout<sg_layout = [8, 8], sg_data = [32, 32], inst_data = [16, 16]>}> : vector<32x256xf16>
        %11 = xegpu.dpas %9, %10, %arg4 {layout_a = #xegpu.layout<sg_layout = [8, 8], sg_data = [32, 32], inst_data = [8, 16]>, layout_b = #xegpu.layout<sg_layout = [8, 8], sg_data = [32, 32], inst_data = [16, 16]>, layout_cd = #xegpu.layout<sg_layout = [8, 8], sg_data = [32, 32], inst_data = [8, 16]>} : vector<256x32xf16>, vector<32x256xf16>, vector<256x256xf32> -> vector<256x256xf32>
        scf.yield %11 : vector<256x256xf32>
      }
      xegpu.store_nd %6, %2[%0, %1] <{layout = #xegpu.layout<sg_layout = [8, 8], sg_data = [32, 32], inst_data = [8, 16]>}> : vector<256x256xf32>, !xegpu.tensor_desc<256x256xf32, #xegpu.block_tdesc_attr<boundary_check = false>, #xegpu.layout<sg_layout = [8, 8], sg_data = [32, 32], inst_data = [8, 16]>>
      gpu.return
    }
    gpu.func @convert_layout_slm(%arg0: memref<128x256xf32>) {
      %0 = xegpu.create_nd_tdesc %arg0 : memref<128x256xf32> -> !xegpu.tensor_desc<128x256xf32>
      %1 = xegpu.load_nd %0[0, 0] <{layout = #xegpu.layout<sg_layout = [4, 16], sg_data = [32, 16], inst_data = [16, 16]>}> : !xegpu.tensor_desc<128x256xf32> -> vector<128x256xf32>
      %2 = xegpu.convert_layout %1 <{input_layout = #xegpu.layout<sg_layout = [4, 16], sg_data = [32, 16], inst_data = [16, 16]>, target_layout = #xegpu.layout<sg_layout = [8, 8], sg_data = [16, 32], inst_data = [16, 16]>}> : vector<128x256xf32>
      %3 = xegpu.convert_layout %2 <{input_layout = #xegpu.layout<sg_layout = [8, 8], sg_data = [16, 32], inst_data = [16, 16]>, target_layout = #xegpu.layout<sg_layout = [8, 8], sg_data = [16, 32], inst_data = [16, 16]>}> : vector<128x256xf32>
      gpu.return
    }
    gpu.func @convert_layout_3D(%arg0: memref<?xf32>) {
      %cst = arith.constant dense<0> : vector<8x128x256xindex>
      %cst_0 = arith.constant dense<true> : vector<8x128x256xi1>
      %0 = xegpu.load %arg0[%cst], %cst_0 <{chunk_size = 1 : i64, layout = #xegpu.layout<sg_layout = [8, 4, 16], sg_data = [1, 32, 16], inst_data = [1, 16, 16]>}> : memref<?xf32>, vector<8x128x256xindex>, vector<8x128x256xi1> -> vector<8x128x256xf32>
      %1 = xegpu.convert_layout %0 <{input_layout = #xegpu.layout<sg_layout = [8, 4, 16], sg_data = [1, 32, 16], inst_data = [1, 16, 16]>, target_layout = #xegpu.layout<sg_layout = [8, 8, 8], sg_data = [1, 16, 32], inst_data = [1, 16, 16]>}> : vector<8x128x256xf32>
      %2 = xegpu.convert_layout %1 <{input_layout = #xegpu.layout<sg_layout = [8, 8, 8], sg_data = [1, 16, 32], inst_data = [1, 16, 16]>, target_layout = #xegpu.layout<sg_layout = [8, 8, 8], sg_data = [1, 16, 32], inst_data = [1, 16, 16]>}> : vector<8x128x256xf32>
      gpu.return
    }
    gpu.func @convert_layout_reduce_to_scalar(%arg0: memref<32x32xf32>) {
      %cst = arith.constant dense<true> : vector<32x32xi1>
      %cst_0 = arith.constant dense<0> : vector<32x32xindex>
      %cst_1 = arith.constant 0.000000e+00 : f32
      %intptr = memref.extract_aligned_pointer_as_index %arg0 : memref<32x32xf32> -> index
      %0 = arith.index_cast %intptr : index to i64
      %1 = xegpu.load %0[%cst_0], %cst <{layout = #xegpu.layout<sg_layout = [32, 1], sg_data = [1, 32]>}> : i64, vector<32x32xindex>, vector<32x32xi1> -> vector<32x32xf32>
      %2 = vector.multi_reduction <add>, %1, %cst_1 [0, 1] : vector<32x32xf32> to f32
      %3 = xegpu.convert_layout %2 <{input_layout = #xegpu.slice<#xegpu.layout<sg_layout = [32, 1], sg_data = [1, 32]>, dims = [0, 1]>, target_layout = #xegpu.slice<#xegpu.layout<sg_layout = [32, 1], sg_data = [1, 32]>, dims = [0, 1]>}> : f32
      gpu.return
    }
    gpu.func @distribute_nested_slice(%arg0: memref<256x256xf32>) {
      %0 = xegpu.create_nd_tdesc %arg0 : memref<256x256xf32> -> !xegpu.tensor_desc<256x256xf32>
      %1 = xegpu.load_nd %0[0, 0] <{layout = #xegpu.layout<sg_layout = [8, 8], sg_data = [32, 32]>}> : !xegpu.tensor_desc<256x256xf32> -> vector<256x256xf32>
      %2 = xegpu.convert_layout %1 <{input_layout = #xegpu.layout<sg_layout = [8, 8], sg_data = [32, 32]>, target_layout = #xegpu.slice<#xegpu.slice<#xegpu.slice<#xegpu.layout<sg_layout = [8, 1, 1, 8, 1, 1], sg_data = [32, 1, 16, 32, 1, 1]>, dims = [2]>, dims = [4]>, dims = [1, 3]>}> : vector<256x256xf32>
      %3 = vector.shape_cast %2 : vector<256x256xf32> to vector<256x1x256x1xf32>
      %4 = vector.broadcast %3 : vector<256x1x256x1xf32> to vector<256x16x256x16xf32>
      %5 = vector.shape_cast %4 : vector<256x16x256x16xf32> to vector<256x16x256x16x1xf32>
      %6 = vector.broadcast %5 : vector<256x16x256x16x1xf32> to vector<256x16x256x16x16xf32>
      %7 = vector.shape_cast %6 : vector<256x16x256x16x16xf32> to vector<256x16x1x256x16x16xf32>
      %8 = vector.broadcast %7 : vector<256x16x1x256x16x16xf32> to vector<256x16x16x256x16x16xf32>
      %9 = xegpu.convert_layout %8 <{input_layout = #xegpu.layout<sg_layout = [8, 1, 1, 8, 1, 1], sg_data = [32, 16, 16, 32, 16, 16]>, target_layout = #xegpu.layout<sg_layout = [8, 1, 1, 8, 1, 1], sg_data = [32, 16, 16, 32, 16, 16]>}> : vector<256x16x16x256x16x16xf32>
      gpu.return
    }
    gpu.func @preserve_anchor_layout(%arg0: memref<256x128xf32>) {
      %cst = arith.constant dense<1.000000e+00> : vector<256x128xf32>
      %0 = xegpu.create_nd_tdesc %arg0 : memref<256x128xf32> -> !xegpu.tensor_desc<256x128xf32>
      xegpu.store_nd %cst, %0[0, 0] <{layout = #xegpu.layout<sg_layout = [16, 1], sg_data = [16, 128], inst_data = [8, 16]>}> : vector<256x128xf32>, !xegpu.tensor_desc<256x128xf32>
      gpu.return
    }
    gpu.func @create_nd_tdesc_from_higher_rank_memref(%arg0: memref<3x256x128xf32>) {
      %0 = xegpu.create_nd_tdesc %arg0 : memref<3x256x128xf32> -> !xegpu.tensor_desc<256x128xf32, #xegpu.layout<sg_layout = [8, 4], sg_data = [32, 32], lane_layout = [1, 16], lane_data = [1, 1]>>
      gpu.return
    }
    gpu.func @scf_for(%arg0: memref<1024x1024xf16>, %arg1: memref<1024x1024xf16>, %arg2: memref<1024x1024xf32>) {
      %c0 = arith.constant 0 : index
      %c128 = arith.constant 128 : index
      %c1024 = arith.constant 1024 : index
      %block_id_x = gpu.block_id x
      %block_id_y = gpu.block_id y
      %0 = arith.muli %block_id_x, %c128 : index
      %1 = arith.muli %block_id_y, %c128 : index
      %2 = xegpu.create_nd_tdesc %arg2 : memref<1024x1024xf32> -> !xegpu.tensor_desc<128x128xf32>
      %3 = xegpu.load_nd %2[0, 0] <{layout = #xegpu.layout<sg_layout = [8, 8], sg_data = [16, 16]>}> : !xegpu.tensor_desc<128x128xf32> -> vector<128x128xf32>
      %4 = xegpu.create_nd_tdesc %arg0 : memref<1024x1024xf16> -> !xegpu.tensor_desc<128x128xf16>
      %5 = xegpu.create_nd_tdesc %arg1 : memref<1024x1024xf16> -> !xegpu.tensor_desc<128x128xf16>
      %6 = scf.for %arg3 = %c0 to %c1024 step %c128 iter_args(%arg4 = %3) -> (vector<128x128xf32>) {
        %8 = xegpu.load_nd %4[0, %arg3] <{layout = #xegpu.layout<sg_layout = [8, 8], sg_data = [16, 128]>}> : !xegpu.tensor_desc<128x128xf16> -> vector<128x128xf16>
        %9 = xegpu.load_nd %5[%arg3, 0] <{layout = #xegpu.layout<sg_layout = [8, 8], sg_data = [128, 16]>}> : !xegpu.tensor_desc<128x128xf16> -> vector<128x128xf16>
        %10 = xegpu.dpas %8, %9, %arg4 {layout_a = #xegpu.layout<sg_layout = [8, 8], sg_data = [16, 128]>, layout_b = #xegpu.layout<sg_layout = [8, 8], sg_data = [128, 16]>, layout_cd = #xegpu.layout<sg_layout = [8, 8], sg_data = [16, 16]>} : vector<128x128xf16>, vector<128x128xf16>, vector<128x128xf32> -> vector<128x128xf32>
        scf.yield %10 : vector<128x128xf32>
      }
      %7 = xegpu.create_nd_tdesc %arg2 : memref<1024x1024xf32> -> !xegpu.tensor_desc<128x128xf32>
      xegpu.store_nd %6, %7[0, 0] <{layout = #xegpu.layout<sg_layout = [8, 8], sg_data = [16, 16]>}> : vector<128x128xf32>, !xegpu.tensor_desc<128x128xf32>
      gpu.return
    }
    gpu.func @scf_while_and_condition(%arg0: memref<1024xf32>, %arg1: memref<1024xf32>) {
      %c1_i32 = arith.constant 1 : i32
      %c10_i32 = arith.constant 10 : i32
      %c0_i32 = arith.constant 0 : i32
      %c256 = arith.constant 256 : index
      %0 = xegpu.create_nd_tdesc %arg0 : memref<1024xf32> -> !xegpu.tensor_desc<256xf32>
      %1 = xegpu.load_nd %0[0] <{layout = #xegpu.layout<sg_layout = [16], sg_data = [16]>}> : !xegpu.tensor_desc<256xf32> -> vector<256xf32>
      %2 = xegpu.create_nd_tdesc %arg1 : memref<1024xf32> -> !xegpu.tensor_desc<256xf32>
      %3:2 = scf.while (%arg2 = %1, %arg3 = %c0_i32) : (vector<256xf32>, i32) -> (vector<256xf32>, i32) {
        %4 = arith.cmpi slt, %arg3, %c10_i32 : i32
        scf.condition(%4) %arg2, %arg3 : vector<256xf32>, i32
      } do {
      ^bb0(%arg2: vector<256xf32>, %arg3: i32):
        xegpu.store_nd %arg2, %2[0] <{layout = #xegpu.layout<sg_layout = [16], sg_data = [16]>}> : vector<256xf32>, !xegpu.tensor_desc<256xf32>
        %4 = arith.addi %arg3, %c1_i32 : i32
        %5 = xegpu.load_nd %0[%c256] <{layout = #xegpu.layout<sg_layout = [16], sg_data = [16]>}> : !xegpu.tensor_desc<256xf32> -> vector<256xf32>
        scf.yield %5, %4 : vector<256xf32>, i32
      }
      xegpu.store_nd %3#0, %2[0] <{layout = #xegpu.layout<sg_layout = [16], sg_data = [16]>}> : vector<256xf32>, !xegpu.tensor_desc<256xf32>
      gpu.return
    }
    gpu.func @scf_while_multi_vector_iter_args(%arg0: memref<1024x1024xf32>, %arg1: memref<1024x1024xf32>) {
      %c1_i32 = arith.constant 1 : i32
      %c10_i32 = arith.constant 10 : i32
      %c0_i32 = arith.constant 0 : i32
      %0 = xegpu.create_nd_tdesc %arg0 : memref<1024x1024xf32> -> !xegpu.tensor_desc<128x128xf32>
      %1 = xegpu.load_nd %0[0, 0] <{layout = #xegpu.layout<sg_layout = [8, 8], sg_data = [16, 16]>}> : !xegpu.tensor_desc<128x128xf32> -> vector<128x128xf32>
      %2 = xegpu.create_nd_tdesc %arg1 : memref<1024x1024xf32> -> !xegpu.tensor_desc<128x128xf32>
      %3 = xegpu.load_nd %2[0, 0] <{layout = #xegpu.layout<sg_layout = [8, 8], sg_data = [16, 16]>}> : !xegpu.tensor_desc<128x128xf32> -> vector<128x128xf32>
      %4:3 = scf.while (%arg2 = %1, %arg3 = %3, %arg4 = %c0_i32) : (vector<128x128xf32>, vector<128x128xf32>, i32) -> (vector<128x128xf32>, vector<128x128xf32>, i32) {
        %5 = arith.cmpi slt, %arg4, %c10_i32 : i32
        scf.condition(%5) %arg2, %arg3, %arg4 : vector<128x128xf32>, vector<128x128xf32>, i32
      } do {
      ^bb0(%arg2: vector<128x128xf32>, %arg3: vector<128x128xf32>, %arg4: i32):
        %5 = arith.addi %arg4, %c1_i32 : i32
        %6 = xegpu.load_nd %0[0, 0] <{layout = #xegpu.layout<sg_layout = [8, 8], sg_data = [16, 16]>}> : !xegpu.tensor_desc<128x128xf32> -> vector<128x128xf32>
        %7 = xegpu.load_nd %2[0, 0] <{layout = #xegpu.layout<sg_layout = [8, 8], sg_data = [16, 16]>}> : !xegpu.tensor_desc<128x128xf32> -> vector<128x128xf32>
        scf.yield %6, %7, %5 : vector<128x128xf32>, vector<128x128xf32>, i32
      }
      xegpu.store_nd %4#0, %2[0, 0] <{layout = #xegpu.layout<sg_layout = [8, 8], sg_data = [16, 16]>}> : vector<128x128xf32>, !xegpu.tensor_desc<128x128xf32>
      xegpu.store_nd %4#1, %2[0, 0] <{layout = #xegpu.layout<sg_layout = [8, 8], sg_data = [16, 16]>}> : vector<128x128xf32>, !xegpu.tensor_desc<128x128xf32>
      gpu.return
    }
    gpu.func @scf_if(%arg0: memref<1024xf32>, %arg1: memref<1024xf32>) {
      %c10 = arith.constant 10 : index
      %0 = gpu.subgroup_id : index
      %1 = xegpu.create_nd_tdesc %arg0 : memref<1024xf32> -> !xegpu.tensor_desc<256xf32>
      %2 = xegpu.create_nd_tdesc %arg1 : memref<1024xf32> -> !xegpu.tensor_desc<256xf32>
      %3 = arith.cmpi eq, %0, %c10 : index
      %4 = scf.if %3 -> (vector<256xf32>) {
        %5 = xegpu.load_nd %1[0] <{layout = #xegpu.layout<sg_layout = [16], sg_data = [16]>}> : !xegpu.tensor_desc<256xf32> -> vector<256xf32>
        scf.yield %5 : vector<256xf32>
      } else {
        %5 = xegpu.load_nd %2[0] <{layout = #xegpu.layout<sg_layout = [16], sg_data = [16]>}> : !xegpu.tensor_desc<256xf32> -> vector<256xf32>
        scf.yield %5 : vector<256xf32>
      }
      xegpu.store_nd %4, %1[0] <{layout = #xegpu.layout<sg_layout = [16], sg_data = [16]>}> : vector<256xf32>, !xegpu.tensor_desc<256xf32>
      gpu.return
    }
    gpu.func @scf_if_tensor_desc(%arg0: memref<1024xf32>, %arg1: memref<1024xf32>) {
      %c10 = arith.constant 10 : index
      %0 = gpu.subgroup_id : index
      %1 = xegpu.create_nd_tdesc %arg0 : memref<1024xf32> -> !xegpu.tensor_desc<256xf32>
      %2 = xegpu.load_nd %1[0] <{layout = #xegpu.layout<sg_layout = [16], sg_data = [16]>}> : !xegpu.tensor_desc<256xf32> -> vector<256xf32>
      %3 = arith.cmpi eq, %0, %c10 : index
      %4 = scf.if %3 -> (!xegpu.tensor_desc<256xf32>) {
        %5 = xegpu.create_nd_tdesc %arg0 : memref<1024xf32> -> !xegpu.tensor_desc<256xf32>
        scf.yield %5 : !xegpu.tensor_desc<256xf32>
      } else {
        %5 = xegpu.create_nd_tdesc %arg1 : memref<1024xf32> -> !xegpu.tensor_desc<256xf32>
        scf.yield %5 : !xegpu.tensor_desc<256xf32>
      }
      xegpu.store_nd %2, %4[0] <{layout = #xegpu.layout<sg_layout = [16], sg_data = [16]>}> : vector<256xf32>, !xegpu.tensor_desc<256xf32>
      gpu.return
    }
    gpu.func @distribute_constant() {
      %cst = arith.constant dense<1.000000e+00> : vector<256x128xf32>
      %0 = xegpu.convert_layout %cst <{input_layout = #xegpu.layout<sg_layout = [8, 4], sg_data = [32, 32]>, target_layout = #xegpu.layout<sg_layout = [8, 4], sg_data = [32, 32]>}> : vector<256x128xf32>
      gpu.return
    }
    gpu.func @shape_cast_used_by_elementwise(%arg0: memref<1x1x16xf32>) {
      %0 = vector.step : vector<16xindex>
      %1 = vector.shape_cast %0 : vector<16xindex> to vector<1x1x16xindex>
      %cst = arith.constant dense<10> : vector<1x1x16xindex>
      %2 = arith.addi %1, %cst : vector<1x1x16xindex>
      %cst_0 = arith.constant dense<1.000000e+00> : vector<1x1x16xf32>
      %intptr = memref.extract_aligned_pointer_as_index %arg0 : memref<1x1x16xf32> -> index
      %3 = arith.index_cast %intptr : index to i64
      %cst_1 = arith.constant dense<true> : vector<1x1x16xi1>
      xegpu.store %cst_0, %3[%2], %cst_1 <{layout = #xegpu.layout<sg_layout = [1, 1, 1], sg_data = [1, 1, 16]>}> : vector<1x1x16xf32>, i64, vector<1x1x16xindex>, vector<1x1x16xi1>
      gpu.return
    }
    gpu.func @bitcast_distribution(%arg0: memref<256x128xf32>) {
      %0 = xegpu.create_nd_tdesc %arg0 : memref<256x128xf32> -> !xegpu.tensor_desc<256x128xf32>
      %1 = xegpu.load_nd %0[0, 0] <{layout = #xegpu.layout<sg_layout = [8, 4], sg_data = [32, 32]>}> : !xegpu.tensor_desc<256x128xf32> -> vector<256x128xf32>
      %2 = vector.bitcast %1 : vector<256x128xf32> to vector<256x256xi16>
      %3 = arith.addi %2, %2 : vector<256x256xi16>
      %4 = vector.bitcast %3 : vector<256x256xi16> to vector<256x128xi32>
      %5 = xegpu.convert_layout %4 <{input_layout = #xegpu.layout<sg_layout = [8, 4], sg_data = [32, 32]>, target_layout = #xegpu.layout<sg_layout = [8, 4], sg_data = [32, 32]>}> : vector<256x128xi32>
      gpu.return
    }
    gpu.func @interleave_distribution(%arg0: memref<256x128xf32>) {
      %0 = xegpu.create_nd_tdesc %arg0 : memref<256x128xf32> -> !xegpu.tensor_desc<256x128xf32>
      %1 = xegpu.load_nd %0[0, 0] <{layout = #xegpu.layout<sg_layout = [8, 4], sg_data = [32, 32]>}> : !xegpu.tensor_desc<256x128xf32> -> vector<256x128xf32>
      %2 = xegpu.load_nd %0[0, 0] <{layout = #xegpu.layout<sg_layout = [8, 4], sg_data = [32, 32]>}> : !xegpu.tensor_desc<256x128xf32> -> vector<256x128xf32>
      %3 = vector.interleave %1, %2 : vector<256x128xf32> -> vector<256x256xf32>
      %4 = xegpu.convert_layout %3 <{input_layout = #xegpu.layout<sg_layout = [8, 4], sg_data = [32, 64]>, target_layout = #xegpu.layout<sg_layout = [8, 4], sg_data = [32, 64]>}> : vector<256x256xf32>
      gpu.return
    }
    gpu.func @deinterleave_distribution(%arg0: memref<256x256xf32>) {
      %0 = xegpu.create_nd_tdesc %arg0 : memref<256x256xf32> -> !xegpu.tensor_desc<256x256xf32>
      %1 = xegpu.load_nd %0[0, 0] <{layout = #xegpu.layout<sg_layout = [8, 4], sg_data = [32, 64]>}> : !xegpu.tensor_desc<256x256xf32> -> vector<256x256xf32>
      %res1, %res2 = vector.deinterleave %1 : vector<256x256xf32> -> vector<256x128xf32>
      %2 = xegpu.convert_layout %res1 <{input_layout = #xegpu.layout<sg_layout = [8, 4], sg_data = [32, 32]>, target_layout = #xegpu.layout<sg_layout = [8, 4], sg_data = [32, 32]>}> : vector<256x128xf32>
      gpu.return
    }
  }
}

// -----
module {
  func.func @no_crash_on_dynamic_tensor(%arg0: tensor<?xi32>, %arg1: index) -> tensor<?xi32> {
    %c0 = arith.constant 0 : index
    %c1 = arith.constant 1 : index
    %0 = scf.for %arg2 = %c0 to %arg1 step %c1 iter_args(%arg3 = %arg0) -> (tensor<?xi32>) {
      %1 = arith.index_cast %arg2 : index to i32
      %inserted = tensor.insert %1 into %arg3[%arg2] : tensor<?xi32>
      scf.yield %inserted : tensor<?xi32>
    }
    return %0 : tensor<?xi32>
  }
}

