module {
  gpu.module @test_kernel {
    gpu.func @gemm_with_one_to_n_lowering(%arg0: memref<1024x1024xf16>, %arg1: memref<1024x1024xf16>, %arg2: memref<1024x1024xf32>) {
      %c0 = arith.constant 0 : index
      %c16 = arith.constant 16 : index
      %c32 = arith.constant 32 : index
      %c1024 = arith.constant 1024 : index
      %block_id_x = gpu.block_id x
      %block_id_y = gpu.block_id y
      %0 = arith.muli %block_id_x, %c16 : index
      %1 = arith.muli %block_id_y, %c32 : index
      %2 = xegpu.create_nd_tdesc %arg2 : memref<1024x1024xf32> -> !xegpu.tensor_desc<16x32xf32, #xegpu.layout<inst_data = [8, 16], lane_layout = [1, 16], lane_data = [8, 1]>>
      %3 = xegpu.load_nd %2[0, 0] <{layout = #xegpu.layout<inst_data = [8, 16], lane_layout = [1, 16], lane_data = [8, 1]>}> : !xegpu.tensor_desc<16x32xf32, #xegpu.layout<inst_data = [8, 16], lane_layout = [1, 16], lane_data = [8, 1]>> -> vector<16x32xf32>
      %4 = xegpu.create_nd_tdesc %arg0 : memref<1024x1024xf16> -> !xegpu.tensor_desc<16x32xf16, #xegpu.layout<inst_data = [8, 16], lane_layout = [1, 16], lane_data = [8, 1]>>
      %5 = xegpu.create_nd_tdesc %arg1 : memref<1024x1024xf16> -> !xegpu.tensor_desc<32x32xf16, #xegpu.layout<inst_data = [16, 16], lane_layout = [1, 16], lane_data = [16, 1]>>
      %6 = scf.for %arg3 = %c0 to %c1024 step %c32 iter_args(%arg4 = %3) -> (vector<16x32xf32>) {
        %7 = xegpu.load_nd %4[%c0, %arg3] <{layout = #xegpu.layout<inst_data = [8, 16], lane_layout = [1, 16], lane_data = [8, 1]>}> : !xegpu.tensor_desc<16x32xf16, #xegpu.layout<inst_data = [8, 16], lane_layout = [1, 16], lane_data = [8, 1]>> -> vector<16x32xf16>
        %8 = xegpu.load_nd %5[%arg3, %c0] <{layout = #xegpu.layout<inst_data = [16, 16], lane_layout = [1, 16], lane_data = [16, 1]>}> : !xegpu.tensor_desc<32x32xf16, #xegpu.layout<inst_data = [16, 16], lane_layout = [1, 16], lane_data = [16, 1]>> -> vector<32x32xf16>
        %9 = xegpu.dpas %7, %8, %arg4 {layout_a = #xegpu.layout<inst_data = [8, 16], lane_layout = [1, 16], lane_data = [8, 1]>, layout_b = #xegpu.layout<inst_data = [16, 16], lane_layout = [1, 16], lane_data = [16, 1]>, layout_cd = #xegpu.layout<inst_data = [8, 16], lane_layout = [1, 16], lane_data = [8, 1]>} : vector<16x32xf16>, vector<32x32xf16>, vector<16x32xf32> -> vector<16x32xf32>
        scf.yield %9 : vector<16x32xf32>
      }
      xegpu.store_nd %6, %2[0, 0] <{layout = #xegpu.layout<inst_data = [8, 16], lane_layout = [1, 16], lane_data = [8, 1]>}> : vector<16x32xf32>, !xegpu.tensor_desc<16x32xf32, #xegpu.layout<inst_data = [8, 16], lane_layout = [1, 16], lane_data = [8, 1]>>
      gpu.return
    }
  }
}

// -----
module {
  gpu.module @test_kernel {
    gpu.func @gemm_with_inst_data_only_attribute(%arg0: memref<1024x1024xf16>, %arg1: memref<1024x1024xf16>, %arg2: memref<1024x1024xf32>) {
      %c0 = arith.constant 0 : index
      %c16 = arith.constant 16 : index
      %c32 = arith.constant 32 : index
      %c1024 = arith.constant 1024 : index
      %block_id_x = gpu.block_id x
      %block_id_y = gpu.block_id y
      %0 = arith.muli %block_id_x, %c16 : index
      %1 = arith.muli %block_id_y, %c32 : index
      %2 = xegpu.create_nd_tdesc %arg2 : memref<1024x1024xf32> -> !xegpu.tensor_desc<16x32xf32, #xegpu.layout<inst_data = [8, 16]>>
      %3 = xegpu.load_nd %2[0, 0] <{layout = #xegpu.layout<inst_data = [8, 16]>}> : !xegpu.tensor_desc<16x32xf32, #xegpu.layout<inst_data = [8, 16]>> -> vector<16x32xf32>
      %4 = xegpu.create_nd_tdesc %arg0 : memref<1024x1024xf16> -> !xegpu.tensor_desc<16x32xf16, #xegpu.layout<inst_data = [8, 16]>>
      %5 = xegpu.create_nd_tdesc %arg1 : memref<1024x1024xf16> -> !xegpu.tensor_desc<32x32xf16, #xegpu.layout<inst_data = [16, 16]>>
      %6 = scf.for %arg3 = %c0 to %c1024 step %c32 iter_args(%arg4 = %3) -> (vector<16x32xf32>) {
        %7 = xegpu.load_nd %4[%c0, %arg3] <{layout = #xegpu.layout<inst_data = [8, 16]>}> : !xegpu.tensor_desc<16x32xf16, #xegpu.layout<inst_data = [8, 16]>> -> vector<16x32xf16>
        %8 = xegpu.load_nd %5[%arg3, %c0] <{layout = #xegpu.layout<inst_data = [16, 16]>}> : !xegpu.tensor_desc<32x32xf16, #xegpu.layout<inst_data = [16, 16]>> -> vector<32x32xf16>
        %9 = xegpu.dpas %7, %8, %arg4 {layout_a = #xegpu.layout<inst_data = [8, 16]>, layout_b = #xegpu.layout<inst_data = [16, 16]>, layout_cd = #xegpu.layout<inst_data = [8, 16]>} : vector<16x32xf16>, vector<32x32xf16>, vector<16x32xf32> -> vector<16x32xf32>
        scf.yield %9 : vector<16x32xf32>
      }
      xegpu.store_nd %6, %2[0, 0] <{layout = #xegpu.layout<inst_data = [8, 16]>}> : vector<16x32xf32>, !xegpu.tensor_desc<16x32xf32, #xegpu.layout<inst_data = [8, 16]>>
      gpu.return
    }
  }
}

// -----
module {
  gpu.module @test_kernel {
    gpu.func @gemm_with_one_to_one_lowering(%arg0: memref<1024x1024xf16>, %arg1: memref<1024x1024xf16>, %arg2: memref<1024x1024xf32>) {
      %c0 = arith.constant 0 : index
      %c8 = arith.constant 8 : index
      %c16 = arith.constant 16 : index
      %c32 = arith.constant 32 : index
      %c1024 = arith.constant 1024 : index
      %block_id_x = gpu.block_id x
      %block_id_y = gpu.block_id y
      %0 = arith.muli %block_id_x, %c8 : index
      %1 = arith.muli %block_id_y, %c32 : index
      %2 = xegpu.create_nd_tdesc %arg2 : memref<1024x1024xf32> -> !xegpu.tensor_desc<8x32xf32, #xegpu.layout<inst_data = [8, 16]>>
      %3 = xegpu.load_nd %2[0, 0] <{layout = #xegpu.layout<inst_data = [8, 16]>}> : !xegpu.tensor_desc<8x32xf32, #xegpu.layout<inst_data = [8, 16]>> -> vector<8x32xf32>
      %c2 = arith.constant 2 : index
      %4 = xegpu.create_nd_tdesc %arg0 : memref<1024x1024xf16> -> !xegpu.tensor_desc<8x16xf16, #xegpu.layout<inst_data = [8, 16]>>
      %5 = xegpu.create_nd_tdesc %arg1 : memref<1024x1024xf16> -> !xegpu.tensor_desc<16x32xf16, #xegpu.layout<inst_data = [16, 16]>>
      %6 = scf.for %arg3 = %c0 to %c1024 step %c16 iter_args(%arg4 = %3) -> (vector<8x32xf32>) {
        %7 = arith.muli %arg3, %c2 : index
        %8 = xegpu.load_nd %4[%c0, %7] <{layout = #xegpu.layout<inst_data = [8, 16]>}> : !xegpu.tensor_desc<8x16xf16, #xegpu.layout<inst_data = [8, 16]>> -> vector<8x16xf16>
        %9 = xegpu.load_nd %5[%7, %c0] <{layout = #xegpu.layout<inst_data = [16, 16]>}> : !xegpu.tensor_desc<16x32xf16, #xegpu.layout<inst_data = [16, 16]>> -> vector<16x32xf16>
        %10 = xegpu.dpas %8, %9, %arg4 {layout_a = #xegpu.layout<inst_data = [8, 16]>, layout_b = #xegpu.layout<inst_data = [16, 16]>, layout_cd = #xegpu.layout<inst_data = [8, 16]>} : vector<8x16xf16>, vector<16x32xf16>, vector<8x32xf32> -> vector<8x32xf32>
        scf.yield %10 : vector<8x32xf32>
      }
      xegpu.store_nd %6, %2[0, 0] <{layout = #xegpu.layout<inst_data = [8, 16]>}> : vector<8x32xf32>, !xegpu.tensor_desc<8x32xf32, #xegpu.layout<inst_data = [8, 16]>>
      gpu.return
    }
  }
}

// -----
module {
  gpu.module @test_kernel {
    gpu.func @gemm_with_elemwise_preop(%arg0: memref<1024x1024xf16>, %arg1: memref<1024x1024xf16>, %arg2: memref<1024x1024xf32>) {
      %c0 = arith.constant 0 : index
      %c16 = arith.constant 16 : index
      %c32 = arith.constant 32 : index
      %c1024 = arith.constant 1024 : index
      %block_id_x = gpu.block_id x
      %block_id_y = gpu.block_id y
      %0 = arith.muli %block_id_x, %c16 : index
      %1 = arith.muli %block_id_y, %c32 : index
      %2 = xegpu.create_nd_tdesc %arg2 : memref<1024x1024xf32> -> !xegpu.tensor_desc<16x32xf32, #xegpu.layout<inst_data = [8, 16], lane_layout = [1, 16], lane_data = [8, 1]>>
      %3 = xegpu.load_nd %2[0, 0] <{layout = #xegpu.layout<inst_data = [8, 16], lane_layout = [1, 16], lane_data = [8, 1]>}> : !xegpu.tensor_desc<16x32xf32, #xegpu.layout<inst_data = [8, 16], lane_layout = [1, 16], lane_data = [8, 1]>> -> vector<16x32xf32>
      %4 = xegpu.create_nd_tdesc %arg0 : memref<1024x1024xf16> -> !xegpu.tensor_desc<16x32xf16, #xegpu.layout<inst_data = [8, 16], lane_layout = [1, 16], lane_data = [8, 1]>>
      %5 = xegpu.create_nd_tdesc %arg1 : memref<1024x1024xf16> -> !xegpu.tensor_desc<32x32xf16, #xegpu.layout<inst_data = [16, 16], lane_layout = [1, 16], lane_data = [16, 1]>>
      %6 = scf.for %arg3 = %c0 to %c1024 step %c32 iter_args(%arg4 = %3) -> (vector<16x32xf32>) {
        %7 = xegpu.load_nd %4[%c0, %arg3] <{layout = #xegpu.layout<inst_data = [8, 16], lane_layout = [1, 16], lane_data = [8, 1]>}> : !xegpu.tensor_desc<16x32xf16, #xegpu.layout<inst_data = [8, 16], lane_layout = [1, 16], lane_data = [8, 1]>> -> vector<16x32xf16>
        %8 = xegpu.load_nd %5[%arg3, %c0] <{layout = #xegpu.layout<inst_data = [16, 16], lane_layout = [1, 16], lane_data = [16, 1]>}> : !xegpu.tensor_desc<32x32xf16, #xegpu.layout<inst_data = [16, 16], lane_layout = [1, 16], lane_data = [16, 1]>> -> vector<32x32xf16>
        %9 = math.exp %7 : vector<16x32xf16>
        %10 = xegpu.dpas %9, %8, %arg4 {layout_a = #xegpu.layout<inst_data = [8, 16], lane_layout = [1, 16], lane_data = [8, 1]>, layout_b = #xegpu.layout<inst_data = [16, 16], lane_layout = [1, 16], lane_data = [16, 1]>, layout_cd = #xegpu.layout<inst_data = [8, 16], lane_layout = [1, 16], lane_data = [8, 1]>} : vector<16x32xf16>, vector<32x32xf16>, vector<16x32xf32> -> vector<16x32xf32>
        scf.yield %10 : vector<16x32xf32>
      }
      xegpu.store_nd %6, %2[0, 0] <{layout = #xegpu.layout<inst_data = [8, 16], lane_layout = [1, 16], lane_data = [8, 1]>}> : vector<16x32xf32>, !xegpu.tensor_desc<16x32xf32, #xegpu.layout<inst_data = [8, 16], lane_layout = [1, 16], lane_data = [8, 1]>>
      gpu.return
    }
  }
}

// -----
module {
  gpu.module @test_kernel {
    gpu.func @elementwise_with_inst_data_only(%arg0: memref<1024x1024xf16>, %arg1: memref<1024x1024xf16>, %arg2: memref<1024x1024xf16>) {
      %c0 = arith.constant 0 : index
      %c32 = arith.constant 32 : index
      %c1024 = arith.constant 1024 : index
      %block_id_x = gpu.block_id x
      %block_id_y = gpu.block_id y
      %0 = arith.muli %block_id_x, %c32 : index
      %1 = xegpu.create_nd_tdesc %arg0 : memref<1024x1024xf16> -> !xegpu.tensor_desc<16x32xf16, #xegpu.layout<inst_data = [8, 16]>>
      %2 = xegpu.create_nd_tdesc %arg1 : memref<1024x1024xf16> -> !xegpu.tensor_desc<16x32xf16, #xegpu.layout<inst_data = [8, 16]>>
      %3 = xegpu.create_nd_tdesc %arg2 : memref<1024x1024xf16> -> !xegpu.tensor_desc<16x32xf16, #xegpu.layout<inst_data = [8, 16]>>
      scf.for %arg3 = %c0 to %c1024 step %c32 {
        %4 = xegpu.load_nd %1[%c0, %arg3] <{layout = #xegpu.layout<inst_data = [8, 16]>}> : !xegpu.tensor_desc<16x32xf16, #xegpu.layout<inst_data = [8, 16]>> -> vector<16x32xf16>
        %5 = xegpu.load_nd %2[%c0, %arg3] <{layout = #xegpu.layout<inst_data = [8, 16]>}> : !xegpu.tensor_desc<16x32xf16, #xegpu.layout<inst_data = [8, 16]>> -> vector<16x32xf16>
        %6 = arith.addf %4, %5 : vector<16x32xf16>
        xegpu.store_nd %6, %3[%c0, %arg3] <{layout = #xegpu.layout<inst_data = [8, 16]>}> : vector<16x32xf16>, !xegpu.tensor_desc<16x32xf16, #xegpu.layout<inst_data = [8, 16]>>
      }
      gpu.return
    }
  }
}

// -----
module {
  gpu.module @test_kernel {
    gpu.func @elementwise_1D(%arg0: memref<1024x1024xf16>, %arg1: memref<1024x1024xf16>, %arg2: memref<1024x1024xf16>) {
      %c0 = arith.constant 0 : index
      %c32 = arith.constant 32 : index
      %c1024 = arith.constant 1024 : index
      %block_id_x = gpu.block_id x
      %block_id_y = gpu.block_id y
      %0 = arith.muli %block_id_x, %c32 : index
      %1 = xegpu.create_nd_tdesc %arg0 : memref<1024x1024xf16> -> !xegpu.tensor_desc<32xf16, #xegpu.layout<inst_data = [8]>>
      %2 = xegpu.create_nd_tdesc %arg1 : memref<1024x1024xf16> -> !xegpu.tensor_desc<32xf16, #xegpu.layout<inst_data = [8]>>
      %3 = xegpu.create_nd_tdesc %arg2 : memref<1024x1024xf16> -> !xegpu.tensor_desc<32xf16, #xegpu.layout<inst_data = [8]>>
      scf.for %arg3 = %c0 to %c1024 step %c32 {
        %4 = xegpu.load_nd %1[%arg3] <{layout = #xegpu.layout<inst_data = [8]>}> : !xegpu.tensor_desc<32xf16, #xegpu.layout<inst_data = [8]>> -> vector<32xf16>
        %5 = xegpu.load_nd %2[%arg3] <{layout = #xegpu.layout<inst_data = [8]>}> : !xegpu.tensor_desc<32xf16, #xegpu.layout<inst_data = [8]>> -> vector<32xf16>
        %6 = arith.addf %4, %5 : vector<32xf16>
        xegpu.store_nd %6, %3[%arg3] <{layout = #xegpu.layout<inst_data = [8]>}> : vector<32xf16>, !xegpu.tensor_desc<32xf16, #xegpu.layout<inst_data = [8]>>
      }
      gpu.return
    }
  }
}

// -----
module {
  gpu.module @test_kernel {
    gpu.func @reduce_dim_0(%arg0: memref<16x512xf32>, %arg1: memref<512xf32>) kernel attributes {VectorComputeFunctionINTEL, spirv.entry_point_abi = #spirv.entry_point_abi<>} {
      %cst = arith.constant dense<0.000000e+00> : vector<64xf32>
      %c64 = arith.constant 64 : index
      %block_id_x = gpu.block_id x
      %0 = arith.muli %block_id_x, %c64 : index
      %1 = xegpu.create_nd_tdesc %arg0 : memref<16x512xf32> -> !xegpu.tensor_desc<16x64xf32, #xegpu.layout<inst_data = [16, 16]>>
      %2 = xegpu.load_nd %1[0, 0] <{layout = #xegpu.layout<inst_data = [16, 16]>}> : !xegpu.tensor_desc<16x64xf32, #xegpu.layout<inst_data = [16, 16]>> -> vector<16x64xf32>
      %3 = vector.multi_reduction <add>, %2, %cst [0] : vector<16x64xf32> to vector<64xf32>
      %4 = xegpu.create_nd_tdesc %arg1 : memref<512xf32> -> !xegpu.tensor_desc<64xf32, #xegpu.slice<#xegpu.layout<inst_data = [16, 16]>, dims = [0]>>
      xegpu.store_nd %3, %4[0] <{layout = #xegpu.slice<#xegpu.layout<inst_data = [16, 16]>, dims = [0]>}> : vector<64xf32>, !xegpu.tensor_desc<64xf32, #xegpu.slice<#xegpu.layout<inst_data = [16, 16]>, dims = [0]>>
      gpu.return
    }
  }
}

// -----
module {
  gpu.module @test_kernel {
    gpu.func @reduce_dim_1(%arg0: memref<512x32xf32>, %arg1: memref<512xf32>) kernel attributes {VectorComputeFunctionINTEL, spirv.entry_point_abi = #spirv.entry_point_abi<>} {
      %c1 = arith.constant 1 : index
      %c32 = arith.constant 32 : index
      %cst = arith.constant dense<0.000000e+00> : vector<32xf32>
      %block_id_x = gpu.block_id x
      %block_id_y = gpu.block_id y
      %0 = arith.muli %block_id_x, %c32 : index
      %1 = arith.muli %block_id_y, %c32 : index
      %2 = xegpu.create_nd_tdesc %arg0 : memref<512x32xf32> -> !xegpu.tensor_desc<32x128xf32, #xegpu.layout<inst_data = [16, 16]>>
      %3 = xegpu.load_nd %2[0, 0] <{layout = #xegpu.layout<inst_data = [16, 16]>}> : !xegpu.tensor_desc<32x128xf32, #xegpu.layout<inst_data = [16, 16]>> -> vector<32x128xf32>
      %4 = vector.multi_reduction <add>, %3, %cst [1] : vector<32x128xf32> to vector<32xf32>
      %5 = xegpu.create_nd_tdesc %arg1 : memref<512xf32> -> !xegpu.tensor_desc<32xf32, #xegpu.slice<#xegpu.layout<inst_data = [16, 16]>, dims = [1]>>
      xegpu.store_nd %4, %5[0] <{layout = #xegpu.slice<#xegpu.layout<inst_data = [16, 16]>, dims = [1]>}> : vector<32xf32>, !xegpu.tensor_desc<32xf32, #xegpu.slice<#xegpu.layout<inst_data = [16, 16]>, dims = [1]>>
      gpu.return
    }
  }
}

// -----
module {
  gpu.module @test_kernel {
    gpu.func @broadcast_dim_0(%arg0: memref<512xf32>, %arg1: memref<16x512xf32>) kernel attributes {VectorComputeFunctionINTEL, spirv.entry_point_abi = #spirv.entry_point_abi<>} {
      %c64 = arith.constant 64 : index
      %block_id_x = gpu.block_id x
      %0 = arith.muli %block_id_x, %c64 : index
      %1 = xegpu.create_nd_tdesc %arg0 : memref<512xf32> -> !xegpu.tensor_desc<64xf32, #xegpu.layout<inst_data = [16]>>
      %2 = xegpu.load_nd %1[0] <{layout = #xegpu.layout<inst_data = [16]>}> : !xegpu.tensor_desc<64xf32, #xegpu.layout<inst_data = [16]>> -> vector<64xf32>
      %3 = vector.broadcast %2 : vector<64xf32> to vector<16x64xf32>
      %4 = xegpu.create_nd_tdesc %arg1 : memref<16x512xf32> -> !xegpu.tensor_desc<16x64xf32, #xegpu.layout<inst_data = [16, 16]>>
      xegpu.store_nd %3, %4[0, 0] <{layout = #xegpu.layout<inst_data = [16, 16]>}> : vector<16x64xf32>, !xegpu.tensor_desc<16x64xf32, #xegpu.layout<inst_data = [16, 16]>>
      gpu.return
    }
  }
}

// -----
module {
  gpu.module @test_kernel {
    gpu.func @broadcast_dim_1(%arg0: memref<512xf32>, %arg1: memref<16x512xf32>) kernel attributes {VectorComputeFunctionINTEL, spirv.entry_point_abi = #spirv.entry_point_abi<>} {
      %c32 = arith.constant 32 : index
      %block_id_x = gpu.block_id x
      %0 = arith.muli %block_id_x, %c32 : index
      %1 = xegpu.create_nd_tdesc %arg0 : memref<512xf32> -> !xegpu.tensor_desc<32xf32, #xegpu.layout<inst_data = [16]>>
      %2 = xegpu.load_nd %1[0] <{layout = #xegpu.layout<inst_data = [16]>}> : !xegpu.tensor_desc<32xf32, #xegpu.layout<inst_data = [16]>> -> vector<32xf32>
      %3 = vector.shape_cast %2 : vector<32xf32> to vector<32x1xf32>
      %4 = vector.broadcast %3 : vector<32x1xf32> to vector<32x64xf32>
      %5 = xegpu.create_nd_tdesc %arg1 : memref<16x512xf32> -> !xegpu.tensor_desc<32x64xf32, #xegpu.layout<inst_data = [16, 16]>>
      xegpu.store_nd %4, %5[0, 0] <{layout = #xegpu.layout<inst_data = [16, 16]>}> : vector<32x64xf32>, !xegpu.tensor_desc<32x64xf32, #xegpu.layout<inst_data = [16, 16]>>
      gpu.return
    }
  }
}

// -----
module {
  gpu.module @test_kernel {
    gpu.func @transpose(%arg0: memref<512x8xf32>, %arg1: memref<8x512xf32>) kernel attributes {VectorComputeFunctionINTEL, spirv.entry_point_abi = #spirv.entry_point_abi<>} {
      %c32 = arith.constant 32 : index
      %block_id_x = gpu.block_id x
      %0 = arith.muli %block_id_x, %c32 : index
      %1 = xegpu.create_nd_tdesc %arg0 : memref<512x8xf32> -> !xegpu.tensor_desc<32x8xf32, #xegpu.layout<inst_data = [16, 8]>>
      %2 = xegpu.load_nd %1[0, 0] <{layout = #xegpu.layout<inst_data = [16, 8]>}> : !xegpu.tensor_desc<32x8xf32, #xegpu.layout<inst_data = [16, 8]>> -> vector<32x8xf32>
      %3 = vector.transpose %2, [1, 0] : vector<32x8xf32> to vector<8x32xf32>
      %4 = xegpu.create_nd_tdesc %arg1 : memref<8x512xf32> -> !xegpu.tensor_desc<8x32xf32, #xegpu.layout<inst_data = [8, 16]>>
      xegpu.store_nd %3, %4[0, 0] <{layout = #xegpu.layout<inst_data = [8, 16]>}> : vector<8x32xf32>, !xegpu.tensor_desc<8x32xf32, #xegpu.layout<inst_data = [8, 16]>>
      gpu.return
    }
  }
}

// -----
module {
  gpu.module @test_kernel {
    gpu.func @test_vector_constant_mask(%arg0: ui64, %arg1: ui64) {
      %0 = vector.constant_mask [32] : vector<32xi1>
      %cst = arith.constant dense<[0, 8, 16, 24, 32, 40, 48, 56, 64, 72, 80, 88, 96, 104, 112, 120, 128, 136, 144, 152, 160, 168, 176, 184, 192, 200, 208, 216, 224, 232, 240, 248]> : vector<32xindex>
      %1 = xegpu.load %arg0[%cst], %0 <{chunk_size = 1 : i64, l1_hint = #xegpu.cache_hint<cached>, layout = #xegpu.layout<inst_data = [16]>}> : ui64, vector<32xindex>, vector<32xi1> -> vector<32xf32>
      xegpu.store %1, %arg1[%cst], %0 <{chunk_size = 1 : i64, l1_hint = #xegpu.cache_hint<cached>, layout = #xegpu.layout<inst_data = [16]>}> : vector<32xf32>, ui64, vector<32xindex>, vector<32xi1>
      gpu.return
    }
  }
}

// -----
module {
  gpu.module @test_kernel {
    gpu.func @test_vector_create_mask(%arg0: ui64, %arg1: ui64) {
      %c16 = arith.constant 16 : index
      %0 = vector.create_mask %c16 : vector<32xi1>
      %cst = arith.constant dense<[0, 8, 16, 24, 32, 40, 48, 56, 64, 72, 80, 88, 96, 104, 112, 120, 128, 136, 144, 152, 160, 168, 176, 184, 192, 200, 208, 216, 224, 232, 240, 248]> : vector<32xindex>
      %1 = xegpu.load %arg0[%cst], %0 <{chunk_size = 1 : i64, l1_hint = #xegpu.cache_hint<cached>, layout = #xegpu.layout<inst_data = [16]>}> : ui64, vector<32xindex>, vector<32xi1> -> vector<32xf32>
      xegpu.store %1, %arg1[%cst], %0 <{chunk_size = 1 : i64, l1_hint = #xegpu.cache_hint<cached>, layout = #xegpu.layout<inst_data = [16]>}> : vector<32xf32>, ui64, vector<32xindex>, vector<32xi1>
      gpu.return
    }
  }
}

// -----
module {
  gpu.module @test_kernel {
    gpu.func @test_vector_step(%arg0: ui64, %arg1: ui64) {
      %c16 = arith.constant 16 : index
      %0 = vector.step : vector<32xindex>
      %1 = vector.create_mask %c16 : vector<32xi1>
      %2 = xegpu.load %arg0[%0], %1 <{chunk_size = 1 : i64, l1_hint = #xegpu.cache_hint<cached>, layout = #xegpu.layout<inst_data = [16]>}> : ui64, vector<32xindex>, vector<32xi1> -> vector<32xf32>
      xegpu.store %2, %arg1[%0], %1 <{chunk_size = 1 : i64, l1_hint = #xegpu.cache_hint<cached>, layout = #xegpu.layout<inst_data = [16]>}> : vector<32xf32>, ui64, vector<32xindex>, vector<32xi1>
      gpu.return
    }
  }
}

// -----
module {
  gpu.module @test_kernel {
    gpu.func @convert_layout(%arg0: memref<16x16xf16>, %arg1: memref<16x16xf16>, %arg2: memref<16x16xf32>) {
      %c0 = arith.constant 0 : index
      %0 = xegpu.create_nd_tdesc %arg0 : memref<16x16xf16> -> !xegpu.tensor_desc<16x16xf16, #xegpu.layout<inst_data = [16, 16], lane_layout = [1, 16], lane_data = [16, 1]>>
      %1 = xegpu.create_nd_tdesc %arg1 : memref<16x16xf16> -> !xegpu.tensor_desc<16x16xf16, #xegpu.layout<inst_data = [16, 16], lane_layout = [1, 16], lane_data = [16, 1]>>
      %2 = xegpu.load_nd %0[0, 0] <{layout = #xegpu.layout<inst_data = [16, 16], lane_layout = [1, 16], lane_data = [16, 1]>}> : !xegpu.tensor_desc<16x16xf16, #xegpu.layout<inst_data = [16, 16], lane_layout = [1, 16], lane_data = [16, 1]>> -> vector<16x16xf16>
      %3 = xegpu.load_nd %1[0, 0] <{layout = #xegpu.layout<inst_data = [16, 16], lane_layout = [1, 16], lane_data = [16, 1]>}> : !xegpu.tensor_desc<16x16xf16, #xegpu.layout<inst_data = [16, 16], lane_layout = [1, 16], lane_data = [16, 1]>> -> vector<16x16xf16>
      %4 = xegpu.convert_layout %2 <{input_layout = #xegpu.layout<inst_data = [16, 16], lane_layout = [1, 16], lane_data = [16, 1]>, target_layout = #xegpu.layout<inst_data = [8, 16], lane_layout = [1, 16], lane_data = [8, 1]>}> : vector<16x16xf16>
      %5 = xegpu.dpas %4, %3 {layout_a = #xegpu.layout<inst_data = [8, 16], lane_layout = [1, 16], lane_data = [8, 1]>, layout_b = #xegpu.layout<inst_data = [16, 16], lane_layout = [1, 16], lane_data = [16, 1]>, layout_cd = #xegpu.layout<inst_data = [8, 16], lane_layout = [1, 16], lane_data = [8, 1]>} : vector<16x16xf16>, vector<16x16xf16> -> vector<16x16xf32>
      %6 = xegpu.create_nd_tdesc %arg2 : memref<16x16xf32> -> !xegpu.tensor_desc<16x16xf32, #xegpu.layout<inst_data = [8, 16], lane_layout = [1, 16], lane_data = [8, 1]>>
      xegpu.store_nd %5, %6[0, 0] <{layout = #xegpu.layout<inst_data = [8, 16], lane_layout = [1, 16], lane_data = [8, 1]>}> : vector<16x16xf32>, !xegpu.tensor_desc<16x16xf32, #xegpu.layout<inst_data = [8, 16], lane_layout = [1, 16], lane_data = [8, 1]>>
      gpu.return
    }
  }
}

// -----
module {
  gpu.module @test_kernel {
    gpu.func @convert_layout_scalar(%arg0: memref<16x16xf16>, %arg1: memref<4xf16>) {
      %cst = arith.constant 0.000000e+00 : f16
      %c0 = arith.constant 0 : index
      %0 = xegpu.create_nd_tdesc %arg0 : memref<16x16xf16> -> !xegpu.tensor_desc<16x16xf16, #xegpu.layout<inst_data = [8, 16]>>
      %1 = xegpu.load_nd %0[0, 0] <{layout = #xegpu.layout<inst_data = [8, 16]>}> : !xegpu.tensor_desc<16x16xf16, #xegpu.layout<inst_data = [8, 16]>> -> vector<16x16xf16>
      %2 = vector.multi_reduction <add>, %1, %cst [0, 1] : vector<16x16xf16> to f16
      %3 = xegpu.convert_layout %2 <{input_layout = #xegpu.slice<#xegpu.layout<inst_data = [8, 16]>, dims = [0, 1]>, target_layout = #xegpu.slice<#xegpu.layout<inst_data = [8, 16]>, dims = [0, 1]>}> : f16
      memref.store %3, %arg1[%c0] : memref<4xf16>
      gpu.return
    }
  }
}

// -----
module {
  gpu.module @test_kernel {
    gpu.func @convert_layout_drop_inst_data_to_null(%arg0: vector<2xf32>) -> vector<2xf32> {
      %0 = xegpu.convert_layout %arg0 <{input_layout = #xegpu.slice<#xegpu.layout<inst_data = [1, 16]>, dims = [1]>, target_layout = #xegpu.slice<#xegpu.layout<inst_data = [1, 16], lane_layout = [1, 16], lane_data = [1, 1]>, dims = [1]>}> : vector<2xf32>
      gpu.return %0 : vector<2xf32>
    }
  }
}

// -----
module {
  gpu.module @test_kernel {
    gpu.func @convert_layout_drop_slice_inst_data_to_null(%arg0: vector<1xf32>) -> vector<1xf32> {
      %0 = xegpu.convert_layout %arg0 <{input_layout = #xegpu.layout<inst_data = [1]>, target_layout = #xegpu.slice<#xegpu.layout<inst_data = [1, 1, 16]>, dims = [1, 2]>}> : vector<1xf32>
      gpu.return %0 : vector<1xf32>
    }
  }
}

// -----
module {
  gpu.module @test_kernel {
    gpu.func @convert_layout(%arg0: vector<8x32x2xf16>) -> vector<8x32x2xf16> {
      %0 = xegpu.convert_layout %arg0 <{input_layout = #xegpu.layout<inst_data = [4, 32, 2], lane_layout = [1, 16, 1], lane_data = [4, 1, 2]>, target_layout = #xegpu.layout<inst_data = [4, 16, 2], lane_layout = [1, 16, 1], lane_data = [4, 1, 1]>}> : vector<8x32x2xf16>
      %1 = math.exp %0 : vector<8x32x2xf16>
      %2 = xegpu.convert_layout %1 <{input_layout = #xegpu.layout<inst_data = [4, 16, 2], lane_layout = [1, 16, 1], lane_data = [4, 1, 1]>, target_layout = #xegpu.layout<inst_data = [4, 16, 2], lane_layout = [1, 16, 1], lane_data = [4, 1, 1]>}> : vector<8x32x2xf16>
      gpu.return %1 : vector<8x32x2xf16>
    }
  }
}

// -----
module {
  gpu.module @test_kernel {
    gpu.func @unroll_load_matrix(%arg0: memref<4096xi8, 3>) -> vector<32x32xf32> {
      %0 = xegpu.create_mem_desc %arg0 : memref<4096xi8, 3> -> !xegpu.mem_desc<32x32xf32>
      %1 = xegpu.load_matrix %0[0, 0] <{layout = #xegpu.layout<inst_data = [8, 16]>}>: !xegpu.mem_desc<32x32xf32> -> vector<32x32xf32>
      gpu.return %1 : vector<32x32xf32>
    }
  }
}

// -----
module {
  gpu.module @test_kernel {
    gpu.func @unroll_store_matrix(%arg0: vector<1x32xf32>, %arg1: memref<32768xi8, 3>) {
      %0 = xegpu.create_mem_desc %arg1 : memref<32768xi8, 3> -> !xegpu.mem_desc<64x128xf32>
      xegpu.store_matrix %arg0, %0[0, 0] <{layout = #xegpu.layout<inst_data = [1, 16]>}>: vector<1x32xf32>, !xegpu.mem_desc<64x128xf32>
      gpu.return
    }
  }
}

// -----
module {
  gpu.module @test_kernel {
    gpu.func @load_with_offsets(%arg0: ui64) -> vector<32xf32> {
      %cst = arith.constant dense<[0, 8, 16, 24, 32, 40, 48, 56, 64, 72, 80, 88, 96, 104, 112, 120, 128, 136, 144, 152, 160, 168, 176, 184, 192, 200, 208, 216, 224, 232, 240, 248]> : vector<32xindex>
      %c17 = arith.constant 17 : index
      %0 = vector.create_mask %c17 : vector<32xi1>
      %1 = xegpu.load %arg0[%cst], %0 <{chunk_size = 1 : i64, l1_hint = #xegpu.cache_hint<cached>, layout = #xegpu.layout<inst_data = [16]>}> : ui64, vector<32xindex>, vector<32xi1> -> vector<32xf32>
      gpu.return %1 : vector<32xf32>
    }
  }
}

// -----
module {
  gpu.module @test_kernel {
    gpu.func @store_with_offsets(%arg0: ui64) {
      %cst = arith.constant dense<[0, 8, 16, 24, 32, 40, 48, 56, 64, 72, 80, 88, 96, 104, 112, 120, 128, 136, 144, 152, 160, 168, 176, 184, 192, 200, 208, 216, 224, 232, 240, 248]> : vector<32xindex>
      %c17 = arith.constant 17 : index
      %0 = vector.create_mask %c17 : vector<32xi1>
      %cst_0 = arith.constant dense<1.023000e+03> : vector<32xf32>
      xegpu.store %cst_0, %arg0[%cst], %0 <{chunk_size = 1 : i64, l1_hint = #xegpu.cache_hint<cached>, layout = #xegpu.layout<inst_data = [16]>}> : vector<32xf32>, ui64, vector<32xindex>, vector<32xi1>
      gpu.return
    }
  }
}

// -----
module {
  gpu.module @test_kernel {
    gpu.func @load_with_offsets_chunk(%arg0: ui64) -> vector<32x4xf32> {
      %cst = arith.constant dense<[0, 8, 16, 24, 32, 40, 48, 56, 64, 72, 80, 88, 96, 104, 112, 120, 128, 136, 144, 152, 160, 168, 176, 184, 192, 200, 208, 216, 224, 232, 240, 248]> : vector<32xindex>
      %c17 = arith.constant 17 : index
      %0 = vector.create_mask %c17 : vector<32xi1>
      %1 = xegpu.load %arg0[%cst], %0 <{chunk_size = 4 : i64, l1_hint = #xegpu.cache_hint<cached>, layout = #xegpu.layout<inst_data = [16, 2]>}> : ui64, vector<32xindex>, vector<32xi1> -> vector<32x4xf32>
      gpu.return %1 : vector<32x4xf32>
    }
  }
}

// -----
module {
  gpu.module @test_kernel {
    gpu.func @store_with_offsets_chunk(%arg0: ui64) {
      %cst = arith.constant dense<[0, 8, 16, 24, 32, 40, 48, 56, 64, 72, 80, 88, 96, 104, 112, 120, 128, 136, 144, 152, 160, 168, 176, 184, 192, 200, 208, 216, 224, 232, 240, 248]> : vector<32xindex>
      %c17 = arith.constant 17 : index
      %0 = vector.create_mask %c17 : vector<32xi1>
      %cst_0 = arith.constant dense<1.023000e+03> : vector<32x4xf32>
      xegpu.store %cst_0, %arg0[%cst], %0 <{chunk_size = 4 : i64, l1_hint = #xegpu.cache_hint<cached>, layout = #xegpu.layout<inst_data = [16, 2]>}> : vector<32x4xf32>, ui64, vector<32xindex>, vector<32xi1>
      gpu.return
    }
  }
}

// -----
module {
  gpu.module @test_kernel {
    gpu.func @preserve_unit_dim_of_load_inst_data(%arg0: ui64) -> vector<1x1x32xf32> {
      %cst = arith.constant dense<[[[0, 8, 16, 24, 32, 40, 48, 56, 64, 72, 80, 88, 96, 104, 112, 120, 128, 136, 144, 152, 160, 168, 176, 184, 192, 200, 208, 216, 224, 232, 240, 248]]]> : vector<1x1x32xindex>
      %cst_0 = arith.constant dense<true> : vector<1x1x32xi1>
      %0 = xegpu.load %arg0[%cst], %cst_0 <{chunk_size = 1 : i64, l1_hint = #xegpu.cache_hint<cached>, layout = #xegpu.layout<inst_data = [1, 1, 16]>}> : ui64, vector<1x1x32xindex>, vector<1x1x32xi1> -> vector<1x1x32xf32>
      gpu.return %0 : vector<1x1x32xf32>
    }
  }
}

// -----
module {
  gpu.module @test_kernel {
    gpu.func @load_store_nd_with_offsets(%arg0: memref<1024x1024xf32>, %arg1: memref<1024x1024xf32>, %arg2: memref<1024x1024xf32>) {
      %c0 = arith.constant 0 : index
      %0 = xegpu.create_nd_tdesc %arg0 : memref<1024x1024xf32> -> !xegpu.tensor_desc<1x32xf32, #xegpu.layout<inst_data = [1, 16]>>
      %1 = xegpu.create_nd_tdesc %arg1 : memref<1024x1024xf32> -> !xegpu.tensor_desc<1x32xf32, #xegpu.layout<inst_data = [1, 16]>>
      %2 = xegpu.create_nd_tdesc %arg2 : memref<1024x1024xf32> -> !xegpu.tensor_desc<1x32xf32, #xegpu.layout<inst_data = [1, 16]>>
      %3 = xegpu.load_nd %0[%c0, %c0] <{layout = #xegpu.layout<inst_data = [1, 16]>}> : !xegpu.tensor_desc<1x32xf32, #xegpu.layout<inst_data = [1, 16]>> -> vector<1x32xf32>
      %4 = xegpu.load_nd %1[%c0, %c0] <{layout = #xegpu.layout<inst_data = [1, 16]>}> : !xegpu.tensor_desc<1x32xf32, #xegpu.layout<inst_data = [1, 16]>> -> vector<1x32xf32>
      %5 = arith.addf %3, %4 : vector<1x32xf32>
      xegpu.store_nd %5, %2[%c0, %c0] <{layout = #xegpu.layout<inst_data = [1, 16]>}> : vector<1x32xf32>, !xegpu.tensor_desc<1x32xf32, #xegpu.layout<inst_data = [1, 16]>>
      gpu.return
    }
  }
}

// -----
module {
  gpu.module @test_kernel {
    gpu.func @load_add_store_leading_unit_dims(%arg0: ui64, %arg1: ui64, %arg2: ui64) {
      %cst = arith.constant dense<[[[0, 8, 16, 24, 32, 40, 48, 56, 64, 72, 80, 88, 96, 104, 112, 120, 128, 136, 144, 152, 160, 168, 176, 184, 192, 200, 208, 216, 224, 232, 240, 248]]]> : vector<1x1x32xindex>
      %cst_0 = arith.constant dense<true> : vector<1x1x32xi1>
      %0 = xegpu.load %arg0[%cst], %cst_0 <{chunk_size = 1 : i64, l1_hint = #xegpu.cache_hint<cached>, layout = #xegpu.layout<inst_data = [1, 1, 16]>}> : ui64, vector<1x1x32xindex>, vector<1x1x32xi1> -> vector<1x1x32xf32>
      %1 = xegpu.load %arg1[%cst], %cst_0 <{chunk_size = 1 : i64, l1_hint = #xegpu.cache_hint<cached>, layout = #xegpu.layout<inst_data = [1, 1, 16]>}> : ui64, vector<1x1x32xindex>, vector<1x1x32xi1> -> vector<1x1x32xf32>
      %2 = arith.addf %0, %1 : vector<1x1x32xf32>
      xegpu.store %2, %arg2[%cst], %cst_0 <{chunk_size = 1 : i64, l1_hint = #xegpu.cache_hint<cached>, layout = #xegpu.layout<inst_data = [1, 1, 16]>}> : vector<1x1x32xf32>, ui64, vector<1x1x32xindex>, vector<1x1x32xi1>
      gpu.return
    }
  }
}

// -----
module {
  gpu.module @test_kernel {
    gpu.func @dpas_mx(%arg0: memref<1024x1024xf4E2M1FN>, %arg1: memref<1024x1024xf4E2M1FN>, %arg2: memref<1024x1024xf32>, %arg3: memref<1024x64xf8E8M0FNU>, %arg4: memref<64x1024xf8E8M0FNU>) {
      %c0 = arith.constant 0 : index
      %c16 = arith.constant 16 : index
      %c32 = arith.constant 32 : index
      %c64 = arith.constant 64 : index
      %c1024 = arith.constant 1024 : index
      %block_id_x = gpu.block_id x
      %block_id_y = gpu.block_id y
      %0 = arith.muli %block_id_x, %c16 : index
      %1 = arith.muli %block_id_y, %c32 : index
      %2 = xegpu.create_nd_tdesc %arg2 : memref<1024x1024xf32> -> !xegpu.tensor_desc<16x32xf32, #xegpu.layout<inst_data = [8, 16]>>
      %3 = xegpu.load_nd %2[0, 0] <{layout = #xegpu.layout<inst_data = [8, 16]>}> : !xegpu.tensor_desc<16x32xf32, #xegpu.layout<inst_data = [8, 16]>> -> vector<16x32xf32>
      %4 = xegpu.create_nd_tdesc %arg0 : memref<1024x1024xf4E2M1FN> -> !xegpu.tensor_desc<16x64xf4E2M1FN, #xegpu.layout<inst_data = [8, 32]>>
      %5 = xegpu.create_nd_tdesc %arg1 : memref<1024x1024xf4E2M1FN> -> !xegpu.tensor_desc<64x32xf4E2M1FN, #xegpu.layout<inst_data = [32, 16]>>
      %6 = xegpu.create_nd_tdesc %arg3 : memref<1024x64xf8E8M0FNU> -> !xegpu.tensor_desc<16x2xf8E8M0FNU, #xegpu.layout<inst_data = [8, 1]>>
      %7 = xegpu.create_nd_tdesc %arg4 : memref<64x1024xf8E8M0FNU> -> !xegpu.tensor_desc<2x32xf8E8M0FNU, #xegpu.layout<inst_data = [1, 16]>>
      %8 = scf.for %arg5 = %c0 to %c1024 step %c64 iter_args(%arg6 = %3) -> (vector<16x32xf32>) {
        %9 = xegpu.load_nd %4[%c0, %arg5] <{layout = #xegpu.layout<inst_data = [8, 32]>}> : !xegpu.tensor_desc<16x64xf4E2M1FN, #xegpu.layout<inst_data = [8, 32]>> -> vector<16x64xf4E2M1FN>
        %10 = xegpu.load_nd %5[%arg5, %c0] <{layout = #xegpu.layout<inst_data = [32, 16]>}> : !xegpu.tensor_desc<64x32xf4E2M1FN, #xegpu.layout<inst_data = [32, 16]>> -> vector<64x32xf4E2M1FN>
        %11 = xegpu.load_nd %6[%c0, %c0] <{layout = #xegpu.layout<inst_data = [8, 1]>}> : !xegpu.tensor_desc<16x2xf8E8M0FNU, #xegpu.layout<inst_data = [8, 1]>> -> vector<16x2xf8E8M0FNU>
        %12 = xegpu.load_nd %7[%c0, %c0] <{layout = #xegpu.layout<inst_data = [1, 16]>}> : !xegpu.tensor_desc<2x32xf8E8M0FNU, #xegpu.layout<inst_data = [1, 16]>> -> vector<2x32xf8E8M0FNU>
        %13 = xegpu.dpas_mx %9, %10, %arg6 scale_a = %11 scale_b = %12 {layout_a = #xegpu.layout<inst_data = [8, 32]>, layout_a_scale = #xegpu.layout<inst_data = [8, 1]>, layout_b = #xegpu.layout<inst_data = [32, 16]>, layout_b_scale = #xegpu.layout<inst_data = [1, 16]>, layout_cd = #xegpu.layout<inst_data = [8, 16]>, layout_result_0 = #xegpu.layout<inst_data = [8, 16]>} : (vector<16x64xf4E2M1FN>, vector<64x32xf4E2M1FN>, vector<16x32xf32>, vector<16x2xf8E8M0FNU>, vector<2x32xf8E8M0FNU>) -> vector<16x32xf32>
        scf.yield %13 : vector<16x32xf32>
      } {layout_result_0 = #xegpu.layout<inst_data = [8, 16]>}
      xegpu.store_nd %8, %2[0, 0] <{layout = #xegpu.layout<inst_data = [8, 16]>}> : vector<16x32xf32>, !xegpu.tensor_desc<16x32xf32, #xegpu.layout<inst_data = [8, 16]>>
      gpu.return
    }
  }
}

// -----
module {
  gpu.module @test_kernel {
    gpu.func @gemm_3d_batch_blocking(%arg0: memref<4x8x32xf16>, %arg1: memref<4x32x16xf16>, %arg2: memref<4x8x16xf32>) {
      %c0 = arith.constant 0 : index
      %0 = xegpu.create_nd_tdesc %arg2 : memref<4x8x16xf32> -> !xegpu.tensor_desc<4x8x16xf32, #xegpu.layout<inst_data = [1, 8, 16]>>
      %1 = xegpu.load_nd %0[0, 0, 0] <{layout = #xegpu.layout<inst_data = [1, 8, 16]>}> : !xegpu.tensor_desc<4x8x16xf32, #xegpu.layout<inst_data = [1, 8, 16]>> -> vector<4x8x16xf32>
      %2 = xegpu.create_nd_tdesc %arg0 : memref<4x8x32xf16> -> !xegpu.tensor_desc<4x8x32xf16, #xegpu.layout<inst_data = [1, 8, 16]>>
      %3 = xegpu.create_nd_tdesc %arg1 : memref<4x32x16xf16> -> !xegpu.tensor_desc<4x32x16xf16, #xegpu.layout<inst_data = [1, 16, 16]>>
      %4 = xegpu.load_nd %2[0, 0, 0] <{layout = #xegpu.layout<inst_data = [1, 8, 16]>}> : !xegpu.tensor_desc<4x8x32xf16, #xegpu.layout<inst_data = [1, 8, 16]>> -> vector<4x8x32xf16>
      %5 = xegpu.load_nd %3[0, 0, 0] <{layout = #xegpu.layout<inst_data = [1, 16, 16]>}> : !xegpu.tensor_desc<4x32x16xf16, #xegpu.layout<inst_data = [1, 16, 16]>> -> vector<4x32x16xf16>
      %6 = xegpu.dpas %4, %5, %1 {layout_a = #xegpu.layout<inst_data = [1, 8, 16]>, layout_b = #xegpu.layout<inst_data = [1, 16, 16]>, layout_cd = #xegpu.layout<inst_data = [1, 8, 16]>} : vector<4x8x32xf16>, vector<4x32x16xf16>, vector<4x8x16xf32> -> vector<4x8x16xf32>
      xegpu.store_nd %6, %0[0, 0, 0] <{layout = #xegpu.layout<inst_data = [1, 8, 16]>}> : vector<4x8x16xf32>, !xegpu.tensor_desc<4x8x16xf32, #xegpu.layout<inst_data = [1, 8, 16]>>
      gpu.return
    }
  }
}

// -----
module {
  gpu.module @test_kernel {
    gpu.func @dpas_mx_3d_batch_blocking(%arg0: memref<2x16x64xf4E2M1FN>, %arg1: memref<2x64x32xf4E2M1FN>, %arg2: memref<2x16x32xf32>, %arg3: memref<2x16x2xf8E8M0FNU>, %arg4: memref<2x2x32xf8E8M0FNU>) {
      %c0 = arith.constant 0 : index
      %0 = xegpu.create_nd_tdesc %arg2 : memref<2x16x32xf32> -> !xegpu.tensor_desc<2x16x32xf32, #xegpu.layout<inst_data = [1, 8, 16]>>
      %1 = xegpu.load_nd %0[0, 0, 0] <{layout = #xegpu.layout<inst_data = [1, 8, 16]>}> : !xegpu.tensor_desc<2x16x32xf32, #xegpu.layout<inst_data = [1, 8, 16]>> -> vector<2x16x32xf32>
      %2 = xegpu.create_nd_tdesc %arg0 : memref<2x16x64xf4E2M1FN> -> !xegpu.tensor_desc<2x16x64xf4E2M1FN, #xegpu.layout<inst_data = [1, 8, 64]>>
      %3 = xegpu.create_nd_tdesc %arg1 : memref<2x64x32xf4E2M1FN> -> !xegpu.tensor_desc<2x64x32xf4E2M1FN, #xegpu.layout<inst_data = [1, 64, 16]>>
      %4 = xegpu.create_nd_tdesc %arg3 : memref<2x16x2xf8E8M0FNU> -> !xegpu.tensor_desc<2x16x2xf8E8M0FNU, #xegpu.layout<inst_data = [1, 8, 2]>>
      %5 = xegpu.create_nd_tdesc %arg4 : memref<2x2x32xf8E8M0FNU> -> !xegpu.tensor_desc<2x2x32xf8E8M0FNU, #xegpu.layout<inst_data = [1, 2, 16]>>
      %6 = xegpu.load_nd %2[0, 0, 0] <{layout = #xegpu.layout<inst_data = [1, 8, 64]>}> : !xegpu.tensor_desc<2x16x64xf4E2M1FN, #xegpu.layout<inst_data = [1, 8, 64]>> -> vector<2x16x64xf4E2M1FN>
      %7 = xegpu.load_nd %3[0, 0, 0] <{layout = #xegpu.layout<inst_data = [1, 64, 16]>}> : !xegpu.tensor_desc<2x64x32xf4E2M1FN, #xegpu.layout<inst_data = [1, 64, 16]>> -> vector<2x64x32xf4E2M1FN>
      %8 = xegpu.load_nd %4[0, 0, 0] <{layout = #xegpu.layout<inst_data = [1, 8, 2]>}> : !xegpu.tensor_desc<2x16x2xf8E8M0FNU, #xegpu.layout<inst_data = [1, 8, 2]>> -> vector<2x16x2xf8E8M0FNU>
      %9 = xegpu.load_nd %5[0, 0, 0] <{layout = #xegpu.layout<inst_data = [1, 2, 16]>}> : !xegpu.tensor_desc<2x2x32xf8E8M0FNU, #xegpu.layout<inst_data = [1, 2, 16]>> -> vector<2x2x32xf8E8M0FNU>
      %10 = xegpu.dpas_mx %6, %7, %1 scale_a = %8 scale_b = %9 {layout_a = #xegpu.layout<inst_data = [1, 8, 64]>, layout_a_scale = #xegpu.layout<inst_data = [1, 8, 2]>, layout_b = #xegpu.layout<inst_data = [1, 64, 16]>, layout_b_scale = #xegpu.layout<inst_data = [1, 2, 16]>, layout_cd = #xegpu.layout<inst_data = [1, 8, 16]>} : (vector<2x16x64xf4E2M1FN>, vector<2x64x32xf4E2M1FN>, vector<2x16x32xf32>, vector<2x16x2xf8E8M0FNU>, vector<2x2x32xf8E8M0FNU>) -> vector<2x16x32xf32>
      xegpu.store_nd %10, %0[0, 0, 0] <{layout = #xegpu.layout<inst_data = [1, 8, 16]>}> : vector<2x16x32xf32>, !xegpu.tensor_desc<2x16x32xf32, #xegpu.layout<inst_data = [1, 8, 16]>>
      gpu.return
    }
  }
}

// -----
module {
  gpu.module @test_kernel {
    gpu.func @if_one_to_n_results(%arg0: i1, %arg1: i64) {
      %c0 = arith.constant 0 : index
      %0:2 = scf.if %arg0 -> (vector<16x64xf32>, vector<16xf32>) {
        %cst = arith.constant dense<1.000000e+00> : vector<16x64xf32>
        %cst_0 = arith.constant dense<1.000000e+00> : vector<16xf32>
        scf.yield %cst, %cst_0 : vector<16x64xf32>, vector<16xf32>
      } else {
        %cst = arith.constant dense<0.000000e+00> : vector<16x64xf32>
        %cst_0 = arith.constant dense<0.000000e+00> : vector<16xf32>
        scf.yield %cst, %cst_0 : vector<16x64xf32>, vector<16xf32>
      }
      %1 = vector.broadcast %0#1 : vector<16xf32> to vector<64x16xf32>
      %2 = vector.transpose %1, [1, 0] : vector<64x16xf32> to vector<16x64xf32>
      %3 = arith.addf %0#0, %2 : vector<16x64xf32>
      %4 = arith.truncf %3 : vector<16x64xf32> to vector<16x64xf16>
      %5 = xegpu.create_nd_tdesc %arg1, shape : [16, 64], strides : [64, 1] : i64 -> !xegpu.tensor_desc<16x64xf16, #xegpu.layout<inst_data = [8, 16], lane_layout = [1, 16], lane_data = [1, 1]>>
      xegpu.store_nd %4, %5[%c0, %c0] <{layout = #xegpu.layout<inst_data = [8, 16], lane_layout = [1, 16], lane_data = [1, 1]>}> : vector<16x64xf16>, !xegpu.tensor_desc<16x64xf16, #xegpu.layout<inst_data = [8, 16], lane_layout = [1, 16], lane_data = [1, 1]>>
      gpu.return
    }
  }
}

