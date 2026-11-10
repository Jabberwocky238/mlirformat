module {
  gpu.module @xevm_module {
    gpu.func @gemm(%arg0: memref<1024x1024xbf16>, %arg1: memref<1024x1024xbf16>, %arg2: memref<1024x1024xf32>) {
      %c0 = arith.constant 0 : index
      %c16 = arith.constant 16 : index
      %c8 = arith.constant 8 : index
      %c1024 = arith.constant 1024 : index
      %block_id_x = gpu.block_id x
      %block_id_y = gpu.block_id y
      %0 = arith.muli %block_id_x, %c8 : index
      %1 = arith.muli %block_id_y, %c16 : index
      %2 = xegpu.create_nd_tdesc %arg2 : memref<1024x1024xf32> -> !xegpu.tensor_desc<8x16xf32>
      %3 = xegpu.load_nd %2[%0, %1] <{layout = #xegpu.layout<lane_layout = [1, 16], lane_data = [1, 1]>}> : !xegpu.tensor_desc<8x16xf32> -> vector<8x16xf32>
      %4 = xegpu.create_nd_tdesc %arg0 : memref<1024x1024xbf16> -> !xegpu.tensor_desc<8x16xbf16>
      %5 = xegpu.create_nd_tdesc %arg1 : memref<1024x1024xbf16> -> !xegpu.tensor_desc<16x16xbf16>
      %6 = scf.for %arg3 = %c0 to %c1024 step %c16 iter_args(%arg4 = %3) -> (vector<8x16xf32>) {
        %7 = xegpu.load_nd %4[%0, %arg3] <{layout = #xegpu.layout<lane_layout = [1, 16], lane_data = [1, 1]>}> : !xegpu.tensor_desc<8x16xbf16> -> vector<8x16xbf16>
        %8 = xegpu.load_nd %5[%arg3, %1] <{layout = #xegpu.layout<lane_layout = [1, 16], lane_data = [2, 1]>}> : !xegpu.tensor_desc<16x16xbf16> -> vector<16x16xbf16>
        %9 = xegpu.dpas %7, %8, %arg4 {layout_a = #xegpu.layout<lane_layout = [1, 16], lane_data = [1, 1]>, layout_b = #xegpu.layout<lane_layout = [1, 16], lane_data = [2, 1]>, layout_cd = #xegpu.layout<lane_layout = [1, 16], lane_data = [1, 1]>} : vector<8x16xbf16>, vector<16x16xbf16>, vector<8x16xf32> -> vector<8x16xf32>
        scf.yield %9 : vector<8x16xf32>
      }
      xegpu.store_nd %6, %2[%0, %1] <{layout = #xegpu.layout<lane_layout = [1, 16], lane_data = [1, 1]>}> : vector<8x16xf32>, !xegpu.tensor_desc<8x16xf32>
      gpu.return
    }
    gpu.func @gemm_with_preop(%arg0: memref<1024x1024xbf16>, %arg1: memref<1024x1024xbf16>, %arg2: memref<1024x1024xf32>) {
      %c0 = arith.constant 0 : index
      %c16 = arith.constant 16 : index
      %c8 = arith.constant 8 : index
      %c1024 = arith.constant 1024 : index
      %cst = arith.constant dense<1.000000e+00> : vector<8x16xbf16>
      %block_id_x = gpu.block_id x
      %block_id_y = gpu.block_id y
      %0 = arith.muli %block_id_x, %c8 : index
      %1 = arith.muli %block_id_y, %c16 : index
      %2 = xegpu.create_nd_tdesc %arg2 : memref<1024x1024xf32> -> !xegpu.tensor_desc<8x16xf32>
      %3 = xegpu.load_nd %2[%0, %1] <{layout = #xegpu.layout<lane_layout = [1, 16], lane_data = [1, 1]>}> : !xegpu.tensor_desc<8x16xf32> -> vector<8x16xf32>
      %4 = xegpu.create_nd_tdesc %arg0 : memref<1024x1024xbf16> -> !xegpu.tensor_desc<8x16xbf16>
      %5 = xegpu.create_nd_tdesc %arg1 : memref<1024x1024xbf16> -> !xegpu.tensor_desc<16x16xbf16>
      %6 = scf.for %arg3 = %c0 to %c1024 step %c16 iter_args(%arg4 = %3) -> (vector<8x16xf32>) {
        %7 = xegpu.load_nd %4[%0, %arg3] <{layout = #xegpu.layout<lane_layout = [1, 16], lane_data = [1, 1]>}> : !xegpu.tensor_desc<8x16xbf16> -> vector<8x16xbf16>
        %8 = arith.addf %7, %cst : vector<8x16xbf16>
        %9 = xegpu.load_nd %5[%arg3, %1] <{layout = #xegpu.layout<lane_layout = [1, 16], lane_data = [2, 1]>}> : !xegpu.tensor_desc<16x16xbf16> -> vector<16x16xbf16>
        %10 = xegpu.dpas %8, %9, %arg4 {layout_a = #xegpu.layout<lane_layout = [1, 16], lane_data = [1, 1]>, layout_b = #xegpu.layout<lane_layout = [1, 16], lane_data = [2, 1]>, layout_cd = #xegpu.layout<lane_layout = [1, 16], lane_data = [1, 1]>} : vector<8x16xbf16>, vector<16x16xbf16>, vector<8x16xf32> -> vector<8x16xf32>
        scf.yield %10 : vector<8x16xf32>
      }
      xegpu.store_nd %6, %2[%0, %1] <{layout = #xegpu.layout<lane_layout = [1, 16], lane_data = [1, 1]>}> : vector<8x16xf32>, !xegpu.tensor_desc<8x16xf32>
      gpu.return
    }
    gpu.func @gemm_with_postop(%arg0: memref<1024x1024xbf16>, %arg1: memref<1024x1024xbf16>, %arg2: memref<1024x1024xf32>) {
      %c0 = arith.constant 0 : index
      %c16 = arith.constant 16 : index
      %c8 = arith.constant 8 : index
      %c1024 = arith.constant 1024 : index
      %block_id_x = gpu.block_id x
      %block_id_y = gpu.block_id y
      %0 = arith.muli %block_id_x, %c8 : index
      %1 = arith.muli %block_id_y, %c16 : index
      %2 = xegpu.create_nd_tdesc %arg2 : memref<1024x1024xf32> -> !xegpu.tensor_desc<8x16xf32>
      %3 = xegpu.load_nd %2[%0, %1] <{layout = #xegpu.layout<lane_layout = [1, 16], lane_data = [1, 1]>}> : !xegpu.tensor_desc<8x16xf32> -> vector<8x16xf32>
      %4 = xegpu.create_nd_tdesc %arg0 : memref<1024x1024xbf16> -> !xegpu.tensor_desc<8x16xbf16>
      %5 = xegpu.create_nd_tdesc %arg1 : memref<1024x1024xbf16> -> !xegpu.tensor_desc<16x16xbf16>
      %6 = scf.for %arg3 = %c0 to %c1024 step %c16 iter_args(%arg4 = %3) -> (vector<8x16xf32>) {
        %8 = xegpu.load_nd %4[%0, %arg3] <{layout = #xegpu.layout<lane_layout = [1, 16], lane_data = [1, 1]>}> : !xegpu.tensor_desc<8x16xbf16> -> vector<8x16xbf16>
        %9 = xegpu.load_nd %5[%arg3, %1] <{layout = #xegpu.layout<lane_layout = [1, 16], lane_data = [2, 1]>}> : !xegpu.tensor_desc<16x16xbf16> -> vector<16x16xbf16>
        %10 = xegpu.dpas %8, %9, %arg4 {layout_a = #xegpu.layout<lane_layout = [1, 16], lane_data = [1, 1]>, layout_b = #xegpu.layout<lane_layout = [1, 16], lane_data = [2, 1]>, layout_cd = #xegpu.layout<lane_layout = [1, 16], lane_data = [1, 1]>} : vector<8x16xbf16>, vector<16x16xbf16>, vector<8x16xf32> -> vector<8x16xf32>
        scf.yield %10 : vector<8x16xf32>
      }
      %7 = math.exp %6 : vector<8x16xf32>
      xegpu.store_nd %7, %2[%0, %1] <{layout = #xegpu.layout<lane_layout = [1, 16], lane_data = [1, 1]>}> : vector<8x16xf32>, !xegpu.tensor_desc<8x16xf32>
      gpu.return
    }
  }
}

// -----
module {
  gpu.module @xevm_module {
    gpu.func @load_dpas_postop_store(%arg0: memref<8x16xf16>, %arg1: memref<16x16xf16>, %arg2: memref<8x16xf32>) {
      %c0 = arith.constant 0 : index
      %cst = arith.constant dense<0.000000e+00> : vector<8x16xf32>
      %0 = xegpu.create_nd_tdesc %arg0 : memref<8x16xf16> -> !xegpu.tensor_desc<8x16xf16>
      %1 = xegpu.load_nd %0[%c0, %c0] <{layout = #xegpu.layout<lane_layout = [1, 16], lane_data = [1, 1]>}> : !xegpu.tensor_desc<8x16xf16> -> vector<8x16xf16>
      %2 = xegpu.create_nd_tdesc %arg1 : memref<16x16xf16> -> !xegpu.tensor_desc<16x16xf16>
      %3 = xegpu.load_nd %2[%c0, %c0] <{layout = #xegpu.layout<lane_layout = [1, 16], lane_data = [2, 1]>}> : !xegpu.tensor_desc<16x16xf16> -> vector<16x16xf16>
      %4 = xegpu.dpas %1, %3, %cst {layout_a = #xegpu.layout<lane_layout = [1, 16], lane_data = [1, 1]>, layout_b = #xegpu.layout<lane_layout = [1, 16], lane_data = [2, 1]>, layout_cd = #xegpu.layout<lane_layout = [1, 16], lane_data = [1, 1]>} : vector<8x16xf16>, vector<16x16xf16>, vector<8x16xf32> -> vector<8x16xf32>
      %5 = math.exp %4 : vector<8x16xf32>
      %6 = xegpu.create_nd_tdesc %arg2 : memref<8x16xf32> -> !xegpu.tensor_desc<8x16xf32>
      xegpu.store_nd %5, %6[%c0, %c0] <{layout = #xegpu.layout<lane_layout = [1, 16], lane_data = [1, 1]>}> : vector<8x16xf32>, !xegpu.tensor_desc<8x16xf32>
      gpu.return
    }
  }
}

// -----
module {
  gpu.module @xevm_module {
    gpu.func @scatter_ops_scf_yield(%arg0: memref<256xf16>, %arg1: i1) {
      %cst = arith.constant dense<true> : vector<16xi1>
      %cst_0 = arith.constant dense<12> : vector<16xindex>
      %0 = scf.if %arg1 -> (vector<16x8xf16>) {
        %1 = xegpu.load %arg0[%cst_0], %cst <{chunk_size = 8 : i64, layout = #xegpu.layout<lane_layout = [16, 1], lane_data = [1, 2]>}> : memref<256xf16>, vector<16xindex>, vector<16xi1> -> vector<16x8xf16>
        scf.yield %1 : vector<16x8xf16>
      } else {
        %cst_1 = arith.constant dense<1.200000e+01> : vector<16x8xf16>
        scf.yield %cst_1 : vector<16x8xf16>
      }
      xegpu.store %0, %arg0[%cst_0], %cst <{chunk_size = 8 : i64, layout = #xegpu.layout<lane_layout = [16, 1], lane_data = [1, 2]>}> : vector<16x8xf16>, memref<256xf16>, vector<16xindex>, vector<16xi1>
      gpu.return
    }
  }
}

// -----
module {
  gpu.module @xevm_module {
    gpu.func @scatter_ops_scf_non_yield(%arg0: memref<256xf16>) {
      %0 = llvm.mlir.poison : i1
      %cst = arith.constant dense<true> : vector<16xi1>
      %cst_0 = arith.constant dense<12> : vector<16xindex>
      scf.if %0 {
        %1 = xegpu.load %arg0[%cst_0], %cst <{chunk_size = 8 : i64, layout = #xegpu.layout<lane_layout = [16, 1], lane_data = [1, 2]>}> : memref<256xf16>, vector<16xindex>, vector<16xi1> -> vector<16x8xf16>
        xegpu.store %1, %arg0[%cst_0], %cst <{chunk_size = 8 : i64, layout = #xegpu.layout<lane_layout = [16, 1], lane_data = [1, 2]>}> : vector<16x8xf16>, memref<256xf16>, vector<16xindex>, vector<16xi1>
      }
      gpu.return
    }
  }
}

// -----
module {
  gpu.module @xevm_module {
    gpu.func @mma_transpose_b(%arg0: memref<8x16xf16>, %arg1: memref<16x8xi32>, %arg2: memref<8x16xf32>) {
      %c0 = arith.constant 0 : index
      %cst = arith.constant dense<0.000000e+00> : vector<8x16xf32>
      %0 = xegpu.create_nd_tdesc %arg0 : memref<8x16xf16> -> !xegpu.tensor_desc<8x16xf16>
      %1 = xegpu.load_nd %0[%c0, %c0] <{layout = #xegpu.layout<lane_layout = [1, 16], lane_data = [1, 1]>}> : !xegpu.tensor_desc<8x16xf16> -> vector<8x16xf16>
      %2 = xegpu.create_nd_tdesc %arg1 : memref<16x8xi32> -> !xegpu.tensor_desc<16x8xi32>
      %3 = xegpu.load_nd %2[%c0, %c0] <{layout = #xegpu.layout<lane_layout = [16, 1], lane_data = [1, 1], order = [0, 1]>}> : !xegpu.tensor_desc<16x8xi32> -> vector<16x8xi32>
      %4 = vector.bitcast %3 : vector<16x8xi32> to vector<16x16xf16>
      %5 = vector.transpose %4, [1, 0] : vector<16x16xf16> to vector<16x16xf16>
      %6 = xegpu.dpas %1, %5, %cst {layout_a = #xegpu.layout<lane_layout = [1, 16], lane_data = [1, 1]>, layout_b = #xegpu.layout<lane_layout = [1, 16], lane_data = [2, 1]>, layout_cd = #xegpu.layout<lane_layout = [1, 16], lane_data = [1, 1]>} : vector<8x16xf16>, vector<16x16xf16>, vector<8x16xf32> -> vector<8x16xf32>
      %7 = xegpu.create_nd_tdesc %arg2 : memref<8x16xf32> -> !xegpu.tensor_desc<8x16xf32>
      xegpu.store_nd %6, %7[%c0, %c0] <{layout = #xegpu.layout<lane_layout = [1, 16], lane_data = [1, 1]>}> : vector<8x16xf32>, !xegpu.tensor_desc<8x16xf32>
      gpu.return
    }
  }
}

// -----
module {
  gpu.module @xevm_module {
    gpu.func @load_store_matrix_1(%arg0: !xegpu.mem_desc<32x32xf32>) {
      %c0 = arith.constant 0 : index
      %0 = xegpu.load_matrix %arg0[%c0, %c0] <{layout = #xegpu.layout<lane_layout = [2, 8], lane_data = [1, 1]>}>: !xegpu.mem_desc<32x32xf32>, index, index -> vector<2x8xf32>
      xegpu.store_matrix %0, %arg0[%c0, %c0] <{layout = #xegpu.layout<lane_layout = [2, 8], lane_data = [1, 1]>}>: vector<2x8xf32>, !xegpu.mem_desc<32x32xf32>, index, index
      gpu.return
    }
  }
}

// -----
module {
  gpu.module @xevm_module {
    gpu.func @load_store_matrix_2(%arg0: !xegpu.mem_desc<32x32xf32>) {
      %c0 = arith.constant 0 : index
      %c1 = arith.constant 1 : index
      %0 = xegpu.load_matrix %arg0[%c0, %c1] <{layout = #xegpu.layout<lane_layout = [4, 4], lane_data = [2, 1]>}>: !xegpu.mem_desc<32x32xf32>, index, index -> vector<8x4xf32>
      xegpu.store_matrix %0, %arg0[%c0, %c1] <{layout = #xegpu.layout<lane_layout = [4, 4], lane_data = [2, 1]>}>: vector<8x4xf32>, !xegpu.mem_desc<32x32xf32>, index, index
      gpu.return
    }
  }
}

// -----
module {
  gpu.module @xevm_module {
    gpu.func @load_store_matrix_3(%arg0: !xegpu.mem_desc<32x32xf32, #xegpu.mem_layout<block = [16, 1], stride = [1, 32]>>) {
      %c0 = arith.constant 0 : index
      %c1 = arith.constant 1 : index
      %0 = xegpu.load_matrix %arg0[%c0, %c1] <{layout = #xegpu.layout<lane_layout = [16, 1], lane_data = [1, 1]>, subgroup_block_io}>: !xegpu.mem_desc<32x32xf32, #xegpu.mem_layout<block = [16, 1], stride = [1, 32]>>, index, index -> vector<16x2xf32>
      xegpu.store_matrix %0, %arg0[%c0, %c1] <{layout = #xegpu.layout<lane_layout = [16, 1], lane_data = [1, 1]>, subgroup_block_io}>: vector<16x2xf32>, !xegpu.mem_desc<32x32xf32, #xegpu.mem_layout<block = [16, 1], stride = [1, 32]>>, index, index
      gpu.return
    }
  }
}

// -----
module {
  gpu.module @xevm_module {
    gpu.func @vector_broadcast_1d_to_2d_broadcast_within_lane(%arg0: memref<16x16xf16>, %arg1: memref<16x16xf16>) {
      %c0 = arith.constant 0 : index
      %cst = arith.constant dense<0.000000e+00> : vector<16xf16>
      %0 = xegpu.create_nd_tdesc %arg0 : memref<16x16xf16> -> !xegpu.tensor_desc<16x16xf16>
      %1 = xegpu.create_nd_tdesc %arg1 : memref<16x16xf16> -> !xegpu.tensor_desc<16x16xf16>
      %2 = xegpu.load_nd %0[%c0, %c0] <{layout = #xegpu.layout<lane_layout = [1, 16], lane_data = [1, 1]>}> : !xegpu.tensor_desc<16x16xf16> -> vector<16x16xf16>
      %3 = vector.multi_reduction <add>, %2, %cst [0] : vector<16x16xf16> to vector<16xf16>
      %4 = vector.broadcast %3 : vector<16xf16> to vector<16x16xf16>
      xegpu.store_nd %4, %1[%c0, %c0] <{layout = #xegpu.layout<lane_layout = [1, 16], lane_data = [1, 1]>}> : vector<16x16xf16>, !xegpu.tensor_desc<16x16xf16>
      gpu.return
    }
  }
}

// -----
module {
  gpu.module @xevm_module {
    gpu.func @vector_shape_cast_scalar_to_vector(%arg0: memref<16xf16>, %arg1: memref<16x16xf16>) {
      %c0 = arith.constant 0 : index
      %block_id_x = gpu.block_id x
      %0 = arith.index_cast %block_id_x : index to i16
      %1 = arith.bitcast %0 : i16 to f16
      %2 = vector.broadcast %1 : f16 to vector<16x16xf16>
      %3 = xegpu.create_nd_tdesc %arg1 : memref<16x16xf16> -> !xegpu.tensor_desc<16x16xf16>
      xegpu.store_nd %2, %3[%c0, %c0] <{layout = #xegpu.layout<lane_layout = [1, 16], lane_data = [1, 1]>}> : vector<16x16xf16>, !xegpu.tensor_desc<16x16xf16>
      gpu.return
    }
  }
}

// -----
module {
  gpu.module @xevm_module {
    gpu.func @vector_reduce_2d(%arg0: memref<4x16xf32>, %arg1: memref<256xf32>) {
      %cst = arith.constant 1.000000e+00 : f32
      %0 = xegpu.create_nd_tdesc %arg0 : memref<4x16xf32> -> !xegpu.tensor_desc<4x16xf32>
      %1 = xegpu.load_nd %0[0, 0] <{layout = #xegpu.layout<lane_layout = [1, 16], lane_data = [1, 1]>}> : !xegpu.tensor_desc<4x16xf32> -> vector<4x16xf32>
      %2 = vector.broadcast %cst : f32 to vector<16xf32>
      %3 = vector.multi_reduction <add>, %1, %2 [0] : vector<4x16xf32> to vector<16xf32>
      %4 = vector.reduction <add>, %3 : vector<16xf32> into f32
      %5 = xegpu.convert_layout %4 <{input_layout = #xegpu.slice<#xegpu.slice<#xegpu.layout<lane_layout = [1, 16], lane_data = [1, 1]>, dims = [0]>, dims = [0]>, target_layout = #xegpu.slice<#xegpu.slice<#xegpu.layout<lane_layout = [1, 16], lane_data = [1, 1]>, dims = [0]>, dims = [0]>}> : f32
      %6 = vector.broadcast %5 : f32 to vector<16xf32>
      %cst_0 = arith.constant dense<0> : vector<16xindex>
      %cst_1 = arith.constant dense<true> : vector<16xi1>
      xegpu.store %6, %arg1[%cst_0], %cst_1 <{layout = #xegpu.slice<#xegpu.layout<lane_layout = [1, 16], lane_data = [1, 1]>, dims = [0]>}> : vector<16xf32>, memref<256xf32>, vector<16xindex>, vector<16xi1>
      gpu.return
    }
  }
}

// -----
module {
  gpu.module @xevm_module {
    gpu.func @scf_for_shape_cast_cleanup(%arg0: memref<16x16xf32>, %arg1: memref<16x16xf32>) {
      %c0 = arith.constant 0 : index
      %c1 = arith.constant 1 : index
      %c16 = arith.constant 16 : index
      %cst = arith.constant dense<0.000000e+00> : vector<16x16xf32>
      %0 = xegpu.create_nd_tdesc %arg0 : memref<16x16xf32> -> !xegpu.tensor_desc<16x16xf32>
      %1 = xegpu.load_nd %0[%c0, %c0] <{layout = #xegpu.layout<lane_layout = [1, 16], lane_data = [1, 1]>}> : !xegpu.tensor_desc<16x16xf32> -> vector<16x16xf32>
      %2 = scf.for %arg2 = %c0 to %c16 step %c1 iter_args(%arg3 = %cst) -> (vector<16x16xf32>) {
        %4 = arith.addf %arg3, %1 {layout_result_0 = #xegpu.layout<lane_layout = [1, 16], lane_data = [1, 1]>} : vector<16x16xf32>
        scf.yield %4 : vector<16x16xf32>
      } {layout_result_0 = #xegpu.layout<lane_layout = [1, 16], lane_data = [1, 1]>}
      %3 = xegpu.create_nd_tdesc %arg1 : memref<16x16xf32> -> !xegpu.tensor_desc<16x16xf32>
      xegpu.store_nd %2, %3[%c0, %c0] <{layout = #xegpu.layout<lane_layout = [1, 16], lane_data = [1, 1]>}> : vector<16x16xf32>, !xegpu.tensor_desc<16x16xf32>
      gpu.return
    }
  }
}

// -----
module {
  gpu.module @xevm_module {
    gpu.func @scf_while_lane_distribute(%arg0: memref<16x16xf32>, %arg1: memref<16x16xf32>) {
      %c0 = arith.constant 0 : index
      %c0_i32 = arith.constant 0 : i32
      %c10_i32 = arith.constant 10 : i32
      %c1_i32 = arith.constant 1 : i32
      %0 = xegpu.create_nd_tdesc %arg0 : memref<16x16xf32> -> !xegpu.tensor_desc<16x16xf32>
      %1 = xegpu.load_nd %0[%c0, %c0] <{layout = #xegpu.layout<lane_layout = [1, 16], lane_data = [1, 1]>}> : !xegpu.tensor_desc<16x16xf32> -> vector<16x16xf32>
      %2 = xegpu.create_nd_tdesc %arg1 : memref<16x16xf32> -> !xegpu.tensor_desc<16x16xf32>
      %3:2 = scf.while (%arg2 = %1, %arg3 = %c0_i32) : (vector<16x16xf32>, i32) -> (vector<16x16xf32>, i32) {
        %4 = arith.cmpi slt, %arg3, %c10_i32 : i32
        scf.condition(%4) %arg2, %arg3 : vector<16x16xf32>, i32
      } do {
      ^bb0(%arg2: vector<16x16xf32>, %arg3: i32):
        xegpu.store_nd %arg2, %2[%c0, %c0] <{layout = #xegpu.layout<lane_layout = [1, 16], lane_data = [1, 1]>}> : vector<16x16xf32>, !xegpu.tensor_desc<16x16xf32>
        %4 = arith.addi %arg3, %c1_i32 : i32
        %5 = xegpu.load_nd %0[%c0, %c0] <{layout = #xegpu.layout<lane_layout = [1, 16], lane_data = [1, 1]>}> : !xegpu.tensor_desc<16x16xf32> -> vector<16x16xf32>
        scf.yield %5, %4 : vector<16x16xf32>, i32
      }
      xegpu.store_nd %3#0, %2[%c0, %c0] <{layout = #xegpu.layout<lane_layout = [1, 16], lane_data = [1, 1]>}> : vector<16x16xf32>, !xegpu.tensor_desc<16x16xf32>
      gpu.return
    }
  }
}

