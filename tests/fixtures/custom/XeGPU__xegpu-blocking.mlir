module {
  gpu.module @test_kernel {
    gpu.func @gemm_with_one_to_n_lowering(%arg0: memref<1024x1024xf16>, %arg1: memref<1024x1024xf16>, %arg2: memref<1024x1024xf32>) {
      %c0 = arith.constant 0 : index
      %c16 = arith.constant 16 : index
      %c32 = arith.constant 32 : index
      %c1024 = arith.constant 1024 : index
      %block_id_x = gpu.block_id  x
      %block_id_y = gpu.block_id  y
      %0 = arith.muli %block_id_x, %c16 : index
      %1 = arith.muli %block_id_y, %c32 : index
      %2 = xegpu.create_nd_tdesc %arg2[%0, %1] : memref<1024x1024xf32> -> !xegpu.tensor_desc<16x32xf32, #xegpu.layout<inst_data = [8, 16], lane_layout = [1, 16], lane_data = [8, 1]>>
      %3 = xegpu.load_nd %2 <{layout = #xegpu.layout<inst_data = [8, 16], lane_layout = [1, 16], lane_data = [8, 1]>}> : !xegpu.tensor_desc<16x32xf32, #xegpu.layout<inst_data = [8, 16], lane_layout = [1, 16], lane_data = [8, 1]>> -> vector<16x32xf32>
      %4 = xegpu.create_nd_tdesc %arg0[%0, %c0] : memref<1024x1024xf16> -> !xegpu.tensor_desc<16x32xf16, #xegpu.layout<inst_data = [8, 16], lane_layout = [1, 16], lane_data = [8, 1]>>
      %5 = xegpu.create_nd_tdesc %arg1[%c0, %1] : memref<1024x1024xf16> -> !xegpu.tensor_desc<32x32xf16, #xegpu.layout<inst_data = [16, 16], lane_layout = [1, 16], lane_data = [16, 1]>>
      %6:3 = scf.for %arg3 = %c0 to %c1024 step %c32 iter_args(%arg4 = %4, %arg5 = %5, %arg6 = %3) -> (!xegpu.tensor_desc<16x32xf16, #xegpu.layout<inst_data = [8, 16], lane_layout = [1, 16], lane_data = [8, 1]>>, !xegpu.tensor_desc<32x32xf16, #xegpu.layout<inst_data = [16, 16], lane_layout = [1, 16], lane_data = [16, 1]>>, vector<16x32xf32>) {
        %7 = xegpu.load_nd %arg4 <{layout = #xegpu.layout<inst_data = [8, 16], lane_layout = [1, 16], lane_data = [8, 1]>}> : !xegpu.tensor_desc<16x32xf16, #xegpu.layout<inst_data = [8, 16], lane_layout = [1, 16], lane_data = [8, 1]>> -> vector<16x32xf16>
        %8 = xegpu.load_nd %arg5 <{layout = #xegpu.layout<inst_data = [16, 16], lane_layout = [1, 16], lane_data = [16, 1]>}> : !xegpu.tensor_desc<32x32xf16, #xegpu.layout<inst_data = [16, 16], lane_layout = [1, 16], lane_data = [16, 1]>> -> vector<32x32xf16>
        %9 = xegpu.dpas %7, %8, %arg6 {layout_a = #xegpu.layout<inst_data = [8, 16], lane_layout = [1, 16], lane_data = [8, 1]>, layout_b = #xegpu.layout<inst_data = [16, 16], lane_layout = [1, 16], lane_data = [16, 1]>, layout_cd = #xegpu.layout<inst_data = [8, 16], lane_layout = [1, 16], lane_data = [8, 1]>} : vector<16x32xf16>, vector<32x32xf16>, vector<16x32xf32> -> vector<16x32xf32>
        %10 = xegpu.update_nd_offset %arg4, [%c0, %c32] : !xegpu.tensor_desc<16x32xf16, #xegpu.layout<inst_data = [8, 16], lane_layout = [1, 16], lane_data = [8, 1]>>
        %11 = xegpu.update_nd_offset %arg5, [%c32, %c0] : !xegpu.tensor_desc<32x32xf16, #xegpu.layout<inst_data = [16, 16], lane_layout = [1, 16], lane_data = [16, 1]>>
        scf.yield %10, %11, %9 : !xegpu.tensor_desc<16x32xf16, #xegpu.layout<inst_data = [8, 16], lane_layout = [1, 16], lane_data = [8, 1]>>, !xegpu.tensor_desc<32x32xf16, #xegpu.layout<inst_data = [16, 16], lane_layout = [1, 16], lane_data = [16, 1]>>, vector<16x32xf32>
      }
      xegpu.store_nd %6#2, %2 <{layout = #xegpu.layout<inst_data = [8, 16], lane_layout = [1, 16], lane_data = [8, 1]>}> : vector<16x32xf32>, !xegpu.tensor_desc<16x32xf32, #xegpu.layout<inst_data = [8, 16], lane_layout = [1, 16], lane_data = [8, 1]>>
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
      %block_id_x = gpu.block_id  x
      %block_id_y = gpu.block_id  y
      %0 = arith.muli %block_id_x, %c16 : index
      %1 = arith.muli %block_id_y, %c32 : index
      %2 = xegpu.create_nd_tdesc %arg2[%0, %1] : memref<1024x1024xf32> -> !xegpu.tensor_desc<16x32xf32, #xegpu.layout<inst_data = [8, 16]>>
      %3 = xegpu.load_nd %2 <{layout = #xegpu.layout<inst_data = [8, 16]>}> : !xegpu.tensor_desc<16x32xf32, #xegpu.layout<inst_data = [8, 16]>> -> vector<16x32xf32>
      %4 = xegpu.create_nd_tdesc %arg0[%0, %c0] : memref<1024x1024xf16> -> !xegpu.tensor_desc<16x32xf16, #xegpu.layout<inst_data = [8, 16]>>
      %5 = xegpu.create_nd_tdesc %arg1[%c0, %1] : memref<1024x1024xf16> -> !xegpu.tensor_desc<32x32xf16, #xegpu.layout<inst_data = [16, 16]>>
      %6:3 = scf.for %arg3 = %c0 to %c1024 step %c32 iter_args(%arg4 = %4, %arg5 = %5, %arg6 = %3) -> (!xegpu.tensor_desc<16x32xf16, #xegpu.layout<inst_data = [8, 16]>>, !xegpu.tensor_desc<32x32xf16, #xegpu.layout<inst_data = [16, 16]>>, vector<16x32xf32>) {
        %7 = xegpu.load_nd %arg4 <{layout = #xegpu.layout<inst_data = [8, 16]>}> : !xegpu.tensor_desc<16x32xf16, #xegpu.layout<inst_data = [8, 16]>> -> vector<16x32xf16>
        %8 = xegpu.load_nd %arg5 <{layout = #xegpu.layout<inst_data = [16, 16]>}> : !xegpu.tensor_desc<32x32xf16, #xegpu.layout<inst_data = [16, 16]>> -> vector<32x32xf16>
        %9 = xegpu.dpas %7, %8, %arg6 {layout_a = #xegpu.layout<inst_data = [8, 16]>, layout_b = #xegpu.layout<inst_data = [16, 16]>, layout_cd = #xegpu.layout<inst_data = [8, 16]>, layout_result_0 = #xegpu.layout<inst_data = [8, 16]>} : vector<16x32xf16>, vector<32x32xf16>, vector<16x32xf32> -> vector<16x32xf32>
        %10 = xegpu.update_nd_offset %arg4, [%c0, %c32] : !xegpu.tensor_desc<16x32xf16, #xegpu.layout<inst_data = [8, 16]>>
        %11 = xegpu.update_nd_offset %arg5, [%c32, %c0] : !xegpu.tensor_desc<32x32xf16, #xegpu.layout<inst_data = [16, 16]>>
        scf.yield %10, %11, %9 : !xegpu.tensor_desc<16x32xf16, #xegpu.layout<inst_data = [8, 16]>>, !xegpu.tensor_desc<32x32xf16, #xegpu.layout<inst_data = [16, 16]>>, vector<16x32xf32>
      }
      xegpu.store_nd %6#2, %2 <{layout = #xegpu.layout<inst_data = [8, 16]>}> : vector<16x32xf32>, !xegpu.tensor_desc<16x32xf32, #xegpu.layout<inst_data = [8, 16]>>
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
      %block_id_x = gpu.block_id  x
      %block_id_y = gpu.block_id  y
      %0 = arith.muli %block_id_x, %c8 : index
      %1 = arith.muli %block_id_y, %c32 : index
      %2 = xegpu.create_nd_tdesc %arg2[%0, %1] : memref<1024x1024xf32> -> !xegpu.tensor_desc<8x32xf32, #xegpu.layout<inst_data = [8, 16]>>
      %3 = xegpu.load_nd %2 <{layout = #xegpu.layout<inst_data = [8, 16]>}> : !xegpu.tensor_desc<8x32xf32, #xegpu.layout<inst_data = [8, 16]>> -> vector<8x32xf32>
      %4 = xegpu.create_nd_tdesc %arg0[%0, %c0] : memref<1024x1024xf16> -> !xegpu.tensor_desc<8x16xf16, #xegpu.layout<inst_data = [8, 16]>>
      %5 = xegpu.create_nd_tdesc %arg1[%c0, %1] : memref<1024x1024xf16> -> !xegpu.tensor_desc<16x32xf16, #xegpu.layout<inst_data = [16, 16]>>
      %6:3 = scf.for %arg3 = %c0 to %c1024 step %c16 iter_args(%arg4 = %4, %arg5 = %5, %arg6 = %3) -> (!xegpu.tensor_desc<8x16xf16, #xegpu.layout<inst_data = [8, 16]>>, !xegpu.tensor_desc<16x32xf16, #xegpu.layout<inst_data = [16, 16]>>, vector<8x32xf32>) {
        %7 = xegpu.load_nd %arg4 <{layout = #xegpu.layout<inst_data = [8, 16]>}> : !xegpu.tensor_desc<8x16xf16, #xegpu.layout<inst_data = [8, 16]>> -> vector<8x16xf16>
        %8 = xegpu.load_nd %arg5 <{layout = #xegpu.layout<inst_data = [16, 16]>}> : !xegpu.tensor_desc<16x32xf16, #xegpu.layout<inst_data = [16, 16]>> -> vector<16x32xf16>
        %9 = xegpu.dpas %7, %8, %arg6 {layout_a = #xegpu.layout<inst_data = [8, 16]>, layout_b = #xegpu.layout<inst_data = [16, 16]>, layout_cd = #xegpu.layout<inst_data = [8, 16]>, layout_result_0 = #xegpu.layout<inst_data = [8, 16]>} : vector<8x16xf16>, vector<16x32xf16>, vector<8x32xf32> -> vector<8x32xf32>
        %10 = xegpu.update_nd_offset %arg4, [%c0, %c32] : !xegpu.tensor_desc<8x16xf16, #xegpu.layout<inst_data = [8, 16]>>
        %11 = xegpu.update_nd_offset %arg5, [%c32, %c0] : !xegpu.tensor_desc<16x32xf16, #xegpu.layout<inst_data = [16, 16]>>
        scf.yield %10, %11, %9 : !xegpu.tensor_desc<8x16xf16, #xegpu.layout<inst_data = [8, 16]>>, !xegpu.tensor_desc<16x32xf16, #xegpu.layout<inst_data = [16, 16]>>, vector<8x32xf32>
      }
      xegpu.store_nd %6#2, %2 <{layout = #xegpu.layout<inst_data = [8, 16]>}> : vector<8x32xf32>, !xegpu.tensor_desc<8x32xf32, #xegpu.layout<inst_data = [8, 16]>>
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
      %block_id_x = gpu.block_id  x
      %block_id_y = gpu.block_id  y
      %0 = arith.muli %block_id_x, %c16 : index
      %1 = arith.muli %block_id_y, %c32 : index
      %2 = xegpu.create_nd_tdesc %arg2[%0, %1] : memref<1024x1024xf32> -> !xegpu.tensor_desc<16x32xf32, #xegpu.layout<inst_data = [8, 16], lane_layout = [1, 16], lane_data = [8, 1]>>
      %3 = xegpu.load_nd %2 <{layout = #xegpu.layout<inst_data = [8, 16], lane_layout = [1, 16], lane_data = [8, 1]>}> : !xegpu.tensor_desc<16x32xf32, #xegpu.layout<inst_data = [8, 16], lane_layout = [1, 16], lane_data = [8, 1]>> -> vector<16x32xf32>
      %4 = xegpu.create_nd_tdesc %arg0[%0, %c0] : memref<1024x1024xf16> -> !xegpu.tensor_desc<16x32xf16, #xegpu.layout<inst_data = [8, 16], lane_layout = [1, 16], lane_data = [8, 1]>>
      %5 = xegpu.create_nd_tdesc %arg1[%c0, %1] : memref<1024x1024xf16> -> !xegpu.tensor_desc<32x32xf16, #xegpu.layout<inst_data = [16, 16], lane_layout = [1, 16], lane_data = [16, 1]>>
      %6:3 = scf.for %arg3 = %c0 to %c1024 step %c32 iter_args(%arg4 = %4, %arg5 = %5, %arg6 = %3) -> (!xegpu.tensor_desc<16x32xf16, #xegpu.layout<inst_data = [8, 16], lane_layout = [1, 16], lane_data = [8, 1]>>, !xegpu.tensor_desc<32x32xf16, #xegpu.layout<inst_data = [16, 16], lane_layout = [1, 16], lane_data = [16, 1]>>, vector<16x32xf32>) {
        %7 = xegpu.load_nd %arg4 <{layout = #xegpu.layout<inst_data = [8, 16], lane_layout = [1, 16], lane_data = [8, 1]>}> : !xegpu.tensor_desc<16x32xf16, #xegpu.layout<inst_data = [8, 16], lane_layout = [1, 16], lane_data = [8, 1]>> -> vector<16x32xf16>
        %8 = xegpu.load_nd %arg5 <{layout = #xegpu.layout<inst_data = [16, 16], lane_layout = [1, 16], lane_data = [16, 1]>}> : !xegpu.tensor_desc<32x32xf16, #xegpu.layout<inst_data = [16, 16], lane_layout = [1, 16], lane_data = [16, 1]>> -> vector<32x32xf16>
        %9 = math.exp %7 {layout_result_0 = #xegpu.layout<inst_data = [8, 16], lane_layout = [1, 16], lane_data = [8, 1]>} : vector<16x32xf16>
        %10 = xegpu.dpas %9, %8, %arg6 {layout_a = #xegpu.layout<inst_data = [8, 16], lane_layout = [1, 16], lane_data = [8, 1]>, layout_b = #xegpu.layout<inst_data = [16, 16], lane_layout = [1, 16], lane_data = [16, 1]>, layout_cd = #xegpu.layout<inst_data = [8, 16], lane_layout = [1, 16], lane_data = [8, 1]>, layout_result_0 = #xegpu.layout<inst_data = [8, 16], lane_layout = [1, 16], lane_data = [8, 1]>} : vector<16x32xf16>, vector<32x32xf16>, vector<16x32xf32> -> vector<16x32xf32>
        %11 = xegpu.update_nd_offset %arg4, [%c0, %c32] : !xegpu.tensor_desc<16x32xf16, #xegpu.layout<inst_data = [8, 16], lane_layout = [1, 16], lane_data = [8, 1]>>
        %12 = xegpu.update_nd_offset %arg5, [%c32, %c0] : !xegpu.tensor_desc<32x32xf16, #xegpu.layout<inst_data = [16, 16], lane_layout = [1, 16], lane_data = [16, 1]>>
        scf.yield %11, %12, %10 : !xegpu.tensor_desc<16x32xf16, #xegpu.layout<inst_data = [8, 16], lane_layout = [1, 16], lane_data = [8, 1]>>, !xegpu.tensor_desc<32x32xf16, #xegpu.layout<inst_data = [16, 16], lane_layout = [1, 16], lane_data = [16, 1]>>, vector<16x32xf32>
      }
      xegpu.store_nd %6#2, %2 <{layout = #xegpu.layout<inst_data = [8, 16], lane_layout = [1, 16], lane_data = [8, 1]>}> : vector<16x32xf32>, !xegpu.tensor_desc<16x32xf32, #xegpu.layout<inst_data = [8, 16], lane_layout = [1, 16], lane_data = [8, 1]>>
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
      %block_id_x = gpu.block_id  x
      %block_id_y = gpu.block_id  y
      %0 = arith.muli %block_id_x, %c32 : index
      %1 = xegpu.create_nd_tdesc %arg0[%0, %c0] : memref<1024x1024xf16> -> !xegpu.tensor_desc<16x32xf16, #xegpu.layout<inst_data = [8, 16]>>
      %2 = xegpu.create_nd_tdesc %arg1[%0, %c0] : memref<1024x1024xf16> -> !xegpu.tensor_desc<16x32xf16, #xegpu.layout<inst_data = [8, 16]>>
      %3 = xegpu.create_nd_tdesc %arg2[%0, %c0] : memref<1024x1024xf16> -> !xegpu.tensor_desc<16x32xf16, #xegpu.layout<inst_data = [8, 16]>>
      %4:3 = scf.for %arg3 = %c0 to %c1024 step %c32 iter_args(%arg4 = %1, %arg5 = %2, %arg6 = %3) -> (!xegpu.tensor_desc<16x32xf16, #xegpu.layout<inst_data = [8, 16]>>, !xegpu.tensor_desc<16x32xf16, #xegpu.layout<inst_data = [8, 16]>>, !xegpu.tensor_desc<16x32xf16, #xegpu.layout<inst_data = [8, 16]>>) {
        %5 = xegpu.load_nd %arg4 <{layout = #xegpu.layout<inst_data = [8, 16]>}> : !xegpu.tensor_desc<16x32xf16, #xegpu.layout<inst_data = [8, 16]>> -> vector<16x32xf16>
        %6 = xegpu.load_nd %arg5 <{layout = #xegpu.layout<inst_data = [8, 16]>}> : !xegpu.tensor_desc<16x32xf16, #xegpu.layout<inst_data = [8, 16]>> -> vector<16x32xf16>
        %7 = arith.addf %5, %6 {layout_result_0 = #xegpu.layout<inst_data = [8, 16]>} : vector<16x32xf16>
        xegpu.store_nd %7, %arg6 <{layout = #xegpu.layout<inst_data = [8, 16]>}> : vector<16x32xf16>, !xegpu.tensor_desc<16x32xf16, #xegpu.layout<inst_data = [8, 16]>>
        %8 = xegpu.update_nd_offset %arg4, [%c0, %c32] : !xegpu.tensor_desc<16x32xf16, #xegpu.layout<inst_data = [8, 16]>>
        %9 = xegpu.update_nd_offset %arg5, [%c0, %c32] : !xegpu.tensor_desc<16x32xf16, #xegpu.layout<inst_data = [8, 16]>>
        %10 = xegpu.update_nd_offset %arg6, [%c0, %c32] : !xegpu.tensor_desc<16x32xf16, #xegpu.layout<inst_data = [8, 16]>>
        scf.yield %8, %9, %10 : !xegpu.tensor_desc<16x32xf16, #xegpu.layout<inst_data = [8, 16]>>, !xegpu.tensor_desc<16x32xf16, #xegpu.layout<inst_data = [8, 16]>>, !xegpu.tensor_desc<16x32xf16, #xegpu.layout<inst_data = [8, 16]>>
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
      %block_id_x = gpu.block_id  x
      %block_id_y = gpu.block_id  y
      %0 = arith.muli %block_id_x, %c32 : index
      %1 = xegpu.create_nd_tdesc %arg0[%0, %c0] : memref<1024x1024xf16> -> !xegpu.tensor_desc<32xf16, #xegpu.layout<inst_data = [8]>>
      %2 = xegpu.create_nd_tdesc %arg1[%0, %c0] : memref<1024x1024xf16> -> !xegpu.tensor_desc<32xf16, #xegpu.layout<inst_data = [8]>>
      %3 = xegpu.create_nd_tdesc %arg2[%0, %c0] : memref<1024x1024xf16> -> !xegpu.tensor_desc<32xf16, #xegpu.layout<inst_data = [8]>>
      %4:3 = scf.for %arg3 = %c0 to %c1024 step %c32 iter_args(%arg4 = %1, %arg5 = %2, %arg6 = %3) -> (!xegpu.tensor_desc<32xf16, #xegpu.layout<inst_data = [8]>>, !xegpu.tensor_desc<32xf16, #xegpu.layout<inst_data = [8]>>, !xegpu.tensor_desc<32xf16, #xegpu.layout<inst_data = [8]>>) {
        %5 = xegpu.load_nd %arg4 <{layout = #xegpu.layout<inst_data = [8]>}> : !xegpu.tensor_desc<32xf16, #xegpu.layout<inst_data = [8]>> -> vector<32xf16>
        %6 = xegpu.load_nd %arg5 <{layout = #xegpu.layout<inst_data = [8]>}> : !xegpu.tensor_desc<32xf16, #xegpu.layout<inst_data = [8]>> -> vector<32xf16>
        %7 = arith.addf %5, %6 {layout_result_0 = #xegpu.layout<inst_data = [8]>} : vector<32xf16>
        xegpu.store_nd %7, %arg6 <{layout = #xegpu.layout<inst_data = [8]>}> : vector<32xf16>, !xegpu.tensor_desc<32xf16, #xegpu.layout<inst_data = [8]>>
        %8 = xegpu.update_nd_offset %arg4, [%c32] : !xegpu.tensor_desc<32xf16, #xegpu.layout<inst_data = [8]>>
        %9 = xegpu.update_nd_offset %arg5, [%c32] : !xegpu.tensor_desc<32xf16, #xegpu.layout<inst_data = [8]>>
        %10 = xegpu.update_nd_offset %arg6, [%c32] : !xegpu.tensor_desc<32xf16, #xegpu.layout<inst_data = [8]>>
        scf.yield %8, %9, %10 : !xegpu.tensor_desc<32xf16, #xegpu.layout<inst_data = [8]>>, !xegpu.tensor_desc<32xf16, #xegpu.layout<inst_data = [8]>>, !xegpu.tensor_desc<32xf16, #xegpu.layout<inst_data = [8]>>
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
      %block_id_x = gpu.block_id  x
      %0 = arith.muli %block_id_x, %c64 : index
      %1 = xegpu.create_nd_tdesc %arg0[0, %0] : memref<16x512xf32> -> !xegpu.tensor_desc<16x64xf32, #xegpu.layout<inst_data = [16, 16]>>
      %2 = xegpu.load_nd %1 <{layout = #xegpu.layout<inst_data = [16, 16]>}> : !xegpu.tensor_desc<16x64xf32, #xegpu.layout<inst_data = [16, 16]>> -> vector<16x64xf32>
      %3 = vector.multi_reduction <add>, %2, %cst {layout_result_0 = #xegpu.layout<inst_data = [16]>} [0] : vector<16x64xf32> to vector<64xf32>
      %4 = xegpu.create_nd_tdesc %arg1[%0] : memref<512xf32> -> !xegpu.tensor_desc<64xf32, #xegpu.layout<inst_data = [16]>>
      xegpu.store_nd %3, %4 <{layout = #xegpu.layout<inst_data = [16]>}> : vector<64xf32>, !xegpu.tensor_desc<64xf32, #xegpu.layout<inst_data = [16]>>
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
      %block_id_x = gpu.block_id  x
      %block_id_y = gpu.block_id  y
      %0 = arith.muli %block_id_x, %c32 : index
      %1 = arith.muli %block_id_y, %c32 : index
      %2 = xegpu.create_nd_tdesc %arg0[%0, %1] : memref<512x32xf32> -> !xegpu.tensor_desc<32x128xf32, #xegpu.layout<inst_data = [16, 16]>>
      %3 = xegpu.load_nd %2 <{layout = #xegpu.layout<inst_data = [16, 16]>}> : !xegpu.tensor_desc<32x128xf32, #xegpu.layout<inst_data = [16, 16]>> -> vector<32x128xf32>
      %4 = vector.multi_reduction <add>, %3, %cst {layout_result_0 = #xegpu.layout<inst_data = [16]>} [1] : vector<32x128xf32> to vector<32xf32>
      %5 = xegpu.create_nd_tdesc %arg1[%1] : memref<512xf32> -> !xegpu.tensor_desc<32xf32, #xegpu.layout<inst_data = [16]>>
      xegpu.store_nd %4, %5 <{layout = #xegpu.layout<inst_data = [16]>}> : vector<32xf32>, !xegpu.tensor_desc<32xf32, #xegpu.layout<inst_data = [16]>>
      gpu.return
    }
  }
}

// -----
module {
  gpu.module @test_kernel {
    gpu.func @broadcast_dim_0(%arg0: memref<512xf32>, %arg1: memref<16x512xf32>) kernel attributes {VectorComputeFunctionINTEL, spirv.entry_point_abi = #spirv.entry_point_abi<>} {
      %c64 = arith.constant 64 : index
      %block_id_x = gpu.block_id  x
      %0 = arith.muli %block_id_x, %c64 : index
      %1 = xegpu.create_nd_tdesc %arg0[%0] : memref<512xf32> -> !xegpu.tensor_desc<64xf32, #xegpu.layout<inst_data = [16]>>
      %2 = xegpu.load_nd %1 <{layout = #xegpu.layout<inst_data = [16]>}> : !xegpu.tensor_desc<64xf32, #xegpu.layout<inst_data = [16]>> -> vector<64xf32>
      %3 = vector.broadcast %2 {layout_result_0 = #xegpu.layout<inst_data = [16, 16]>} : vector<64xf32> to vector<16x64xf32>
      %4 = xegpu.create_nd_tdesc %arg1[0, %0] : memref<16x512xf32> -> !xegpu.tensor_desc<16x64xf32, #xegpu.layout<inst_data = [16, 16]>>
      xegpu.store_nd %3, %4 <{layout = #xegpu.layout<inst_data = [16, 16]>}> : vector<16x64xf32>, !xegpu.tensor_desc<16x64xf32, #xegpu.layout<inst_data = [16, 16]>>
      gpu.return
    }
  }
}

// -----
module {
  gpu.module @test_kernel {
    gpu.func @broadcast_dim_1(%arg0: memref<512xf32>, %arg1: memref<16x512xf32>) kernel attributes {VectorComputeFunctionINTEL, spirv.entry_point_abi = #spirv.entry_point_abi<>} {
      %c32 = arith.constant 32 : index
      %block_id_x = gpu.block_id  x
      %0 = arith.muli %block_id_x, %c32 : index
      %1 = xegpu.create_nd_tdesc %arg0[%0] : memref<512xf32> -> !xegpu.tensor_desc<32xf32, #xegpu.layout<inst_data = [16]>>
      %2 = xegpu.load_nd %1 <{layout = #xegpu.layout<inst_data = [16]>}> : !xegpu.tensor_desc<32xf32, #xegpu.layout<inst_data = [16]>> -> vector<32xf32>
      %3 = vector.shape_cast %2 : vector<32xf32> to vector<32x1xf32>
      %4 = vector.broadcast %3 {layout_result_0 = #xegpu.layout<inst_data = [16, 16]>} : vector<32x1xf32> to vector<32x64xf32>
      %5 = xegpu.create_nd_tdesc %arg1[0, %0] : memref<16x512xf32> -> !xegpu.tensor_desc<32x64xf32, #xegpu.layout<inst_data = [16, 16]>>
      xegpu.store_nd %4, %5  : vector<32x64xf32>, !xegpu.tensor_desc<32x64xf32, #xegpu.layout<inst_data = [16, 16]>>
      gpu.return
    }
  }
}

// -----
module {
  gpu.module @test_kernel {
    gpu.func @transpose(%arg0: memref<512x8xf32>, %arg1: memref<8x512xf32>) kernel attributes {VectorComputeFunctionINTEL, spirv.entry_point_abi = #spirv.entry_point_abi<>} {
      %c32 = arith.constant 32 : index
      %block_id_x = gpu.block_id  x
      %0 = arith.muli %block_id_x, %c32 : index
      %1 = xegpu.create_nd_tdesc %arg0[%0, 0] : memref<512x8xf32> -> !xegpu.tensor_desc<32x8xf32, #xegpu.layout<inst_data = [16, 8]>>
      %2 = xegpu.load_nd %1 <{layout = #xegpu.layout<inst_data = [16, 8]>}> : !xegpu.tensor_desc<32x8xf32, #xegpu.layout<inst_data = [16, 8]>> -> vector<32x8xf32>
      %3 = vector.transpose %2, [1, 0] {layout_result_0 = #xegpu.layout<inst_data = [8, 16]>} : vector<32x8xf32> to vector<8x32xf32>
      %4 = xegpu.create_nd_tdesc %arg1[0, %0] : memref<8x512xf32> -> !xegpu.tensor_desc<8x32xf32, #xegpu.layout<inst_data = [8, 16]>>
      xegpu.store_nd %3, %4 <{layout = #xegpu.layout<inst_data = [8, 16]>}> : vector<8x32xf32>, !xegpu.tensor_desc<8x32xf32, #xegpu.layout<inst_data = [8, 16]>>
      gpu.return
    }
  }
}

// -----
module {
  gpu.module @test_kernel {
    gpu.func @test_prefetch_load_store_update(%arg0: ui64) {
      %cst = arith.constant dense<[0, 8, 16, 24, 32, 40, 48, 56, 64, 72, 80, 88, 96, 104, 112, 120, 128, 136, 144, 152, 160, 168, 176, 184, 192, 200, 208, 216, 224, 232, 240, 248]> : vector<32xindex>
      %0 = xegpu.create_tdesc %arg0, %cst : ui64, vector<32xindex> -> !xegpu.tensor_desc<32xf32, #xegpu.scatter_tdesc_attr<>, #xegpu.layout<inst_data = [16]>>
      xegpu.prefetch %0 <{layout = #xegpu.layout<inst_data = [16]>}> : !xegpu.tensor_desc<32xf32, #xegpu.scatter_tdesc_attr<>, #xegpu.layout<inst_data = [16]>>
      %cst_0 = arith.constant dense<[32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 64, 128, 128, 128, 128, 128, 128, 128, 128, 128, 128, 128, 128, 128, 128, 128, 256]> : vector<32xindex>
      %1 = xegpu.update_offset %0, %cst_0 : !xegpu.tensor_desc<32xf32, #xegpu.scatter_tdesc_attr<>, #xegpu.layout<inst_data = [16]>>, vector<32xindex>
      %c17 = arith.constant 17 : index
      %2 = vector.create_mask %c17 : vector<32xi1>
      %3 = xegpu.load %1, %2 <{layout = #xegpu.layout<inst_data = [16]>}> : !xegpu.tensor_desc<32xf32, #xegpu.scatter_tdesc_attr<>, #xegpu.layout<inst_data = [16]>>, vector<32xi1> -> vector<32xf32>
      %4 = arith.addf %3, %3 : vector<32xf32>
      xegpu.store %4, %0, %2 <{layout = #xegpu.layout<inst_data = [16]>}> : vector<32xf32>, !xegpu.tensor_desc<32xf32, #xegpu.scatter_tdesc_attr<>, #xegpu.layout<inst_data = [16]>>, vector<32xi1>
      gpu.return
    }
  }
}

// -----
module {
  gpu.module @test_kernel {
    gpu.func @test_prefetch_load_store_update_chunk(%arg0: ui64) {
      %cst = arith.constant dense<[0, 8, 16, 24, 32, 40, 48, 56, 64, 72, 80, 88, 96, 104, 112, 120, 128, 136, 144, 152, 160, 168, 176, 184, 192, 200, 208, 216, 224, 232, 240, 248]> : vector<32xindex>
      %0 = xegpu.create_tdesc %arg0, %cst : ui64, vector<32xindex> -> !xegpu.tensor_desc<32x4xf32, #xegpu.scatter_tdesc_attr<chunk_size = 4 : i64>, #xegpu.layout<inst_data = [16, 2]>>
      xegpu.prefetch %0 <{layout = #xegpu.layout<inst_data = [16, 2]>}> : !xegpu.tensor_desc<32x4xf32, #xegpu.scatter_tdesc_attr<chunk_size = 4 : i64>, #xegpu.layout<inst_data = [16, 2]>>
      %cst_0 = arith.constant dense<[32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 64, 128, 128, 128, 128, 128, 128, 128, 128, 128, 128, 128, 128, 128, 128, 128, 256]> : vector<32xindex>
      %1 = xegpu.update_offset %0, %cst_0 : !xegpu.tensor_desc<32x4xf32, #xegpu.scatter_tdesc_attr<chunk_size = 4 : i64>, #xegpu.layout<inst_data = [16, 2]>>, vector<32xindex>
      %c17 = arith.constant 17 : index
      %2 = vector.create_mask %c17 : vector<32xi1>
      %3 = xegpu.load %1, %2 <{l1_hint = #xegpu.cache_hint<cached>, l2_hint = #xegpu.cache_hint<uncached>, layout = #xegpu.layout<inst_data = [16, 2]>}> : !xegpu.tensor_desc<32x4xf32, #xegpu.scatter_tdesc_attr<chunk_size = 4 : i64>, #xegpu.layout<inst_data = [16, 2]>>, vector<32xi1> -> vector<32x4xf32>
      %4 = arith.addf %3, %3 : vector<32x4xf32>
      xegpu.store %4, %0, %2 <{l1_hint = #xegpu.cache_hint<cached>, l2_hint = #xegpu.cache_hint<uncached>, layout = #xegpu.layout<inst_data = [16, 2]>}> : vector<32x4xf32>, !xegpu.tensor_desc<32x4xf32, #xegpu.scatter_tdesc_attr<chunk_size = 4 : i64>, #xegpu.layout<inst_data = [16, 2]>>, vector<32xi1>
      gpu.return
    }
  }
}

// -----
module {
  gpu.module @test_kernel {
    gpu.func @test_3d_scattered_tensor_desc(%arg0: ui64) {
      %cst = arith.constant dense<[[0, 8, 16, 24, 32, 40, 48, 56], [64, 72, 80, 88, 96, 104, 112, 120], [128, 136, 144, 152, 160, 168, 176, 184], [192, 200, 208, 216, 224, 232, 240, 248]]> : vector<4x8xindex>
      %0 = xegpu.create_tdesc %arg0, %cst : ui64, vector<4x8xindex> -> !xegpu.tensor_desc<4x8x4xf32, #xegpu.scatter_tdesc_attr<chunk_size = 4 : i64>, #xegpu.layout<inst_data = [2, 8, 2]>>
      xegpu.prefetch %0 <{layout = #xegpu.layout<inst_data = [2, 8, 2]>}> : !xegpu.tensor_desc<4x8x4xf32, #xegpu.scatter_tdesc_attr<chunk_size = 4 : i64>, #xegpu.layout<inst_data = [2, 8, 2]>>
      %cst_0 = arith.constant dense<[[32, 32, 32, 32, 32, 32, 32, 32], [32, 32, 32, 32, 32, 32, 32, 64], [128, 128, 128, 128, 128, 128, 128, 128], [128, 128, 128, 128, 128, 128, 128, 256]]> : vector<4x8xindex>
      %1 = xegpu.update_offset %0, %cst_0 : !xegpu.tensor_desc<4x8x4xf32, #xegpu.scatter_tdesc_attr<chunk_size = 4 : i64>, #xegpu.layout<inst_data = [2, 8, 2]>>, vector<4x8xindex>
      %c4 = arith.constant 4 : index
      %2 = vector.create_mask %c4, %c4 : vector<4x8xi1>
      %3 = xegpu.load %1, %2 <{l1_hint = #xegpu.cache_hint<cached>, l2_hint = #xegpu.cache_hint<uncached>, layout = #xegpu.layout<inst_data = [2, 8, 2]>}> : !xegpu.tensor_desc<4x8x4xf32, #xegpu.scatter_tdesc_attr<chunk_size = 4 : i64>, #xegpu.layout<inst_data = [2, 8, 2]>>, vector<4x8xi1> -> vector<4x8x4xf32>
      %4 = arith.addf %3, %3 {layout_result_0 = #xegpu.layout<inst_data = [2, 8, 2]>} : vector<4x8x4xf32>
      xegpu.store %4, %0, %2 <{l1_hint = #xegpu.cache_hint<cached>, l2_hint = #xegpu.cache_hint<uncached>, layout = #xegpu.layout<inst_data = [2, 8, 2]>}> : vector<4x8x4xf32>, !xegpu.tensor_desc<4x8x4xf32, #xegpu.scatter_tdesc_attr<chunk_size = 4 : i64>, #xegpu.layout<inst_data = [2, 8, 2]>>, vector<4x8xi1>
      gpu.return
    }
  }
}

// -----
module {
  gpu.module @test_kernel {
    gpu.func @convert_layout(%arg0: memref<16x16xf16>, %arg1: memref<16x16xf16>, %arg2: memref<16x16xf32>) {
      %c0 = arith.constant 0 : index
      %0 = xegpu.create_nd_tdesc %arg0[%c0, %c0] : memref<16x16xf16> -> !xegpu.tensor_desc<16x16xf16, #xegpu.layout<inst_data = [16, 16], lane_layout = [1, 16], lane_data = [16, 1]>>
      %1 = xegpu.create_nd_tdesc %arg1[%c0, %c0] : memref<16x16xf16> -> !xegpu.tensor_desc<16x16xf16, #xegpu.layout<inst_data = [16, 16], lane_layout = [1, 16], lane_data = [16, 1]>>
      %2 = xegpu.load_nd %0 <{layout = #xegpu.layout<inst_data = [16, 16], lane_layout = [1, 16], lane_data = [16, 1]>}> : !xegpu.tensor_desc<16x16xf16, #xegpu.layout<inst_data = [16, 16], lane_layout = [1, 16], lane_data = [16, 1]>> -> vector<16x16xf16>
      %3 = xegpu.load_nd %1 <{layout = #xegpu.layout<inst_data = [16, 16], lane_layout = [1, 16], lane_data = [16, 1]>}> : !xegpu.tensor_desc<16x16xf16, #xegpu.layout<inst_data = [16, 16], lane_layout = [1, 16], lane_data = [16, 1]>> -> vector<16x16xf16>
      %4 = xegpu.convert_layout %2 <{input_layout = #xegpu.layout<inst_data = [16, 16], lane_layout = [1, 16], lane_data = [16, 1]>, target_layout = #xegpu.layout<inst_data = [8, 16], lane_layout = [1, 16], lane_data = [8, 1]>}> : vector<16x16xf16>
      %5 = xegpu.dpas %4, %3 {layout_a = #xegpu.layout<inst_data = [8, 16], lane_layout = [1, 16], lane_data = [8, 1]>, layout_b = #xegpu.layout<inst_data = [16, 16], lane_layout = [1, 16], lane_data = [16, 1]>, layout_cd = #xegpu.layout<inst_data = [8, 16], lane_layout = [1, 16], lane_data = [8, 1]>, layout_result_0 = #xegpu.layout<inst_data = [8, 16], lane_layout = [1, 16], lane_data = [8, 1]>} : vector<16x16xf16>, vector<16x16xf16> -> vector<16x16xf32>
      %6 = xegpu.create_nd_tdesc %arg2[%c0, %c0] : memref<16x16xf32> -> !xegpu.tensor_desc<16x16xf32, #xegpu.layout<inst_data = [8, 16], lane_layout = [1, 16], lane_data = [8, 1]>>
      xegpu.store_nd %5, %6 <{layout = #xegpu.layout<inst_data = [8, 16], lane_layout = [1, 16], lane_data = [8, 1]>}> : vector<16x16xf32>, !xegpu.tensor_desc<16x16xf32, #xegpu.layout<inst_data = [8, 16], lane_layout = [1, 16], lane_data = [8, 1]>>
      gpu.return
    }
  }
}

// -----
module {
  gpu.module @test_kernel {
    gpu.func @convert_layout(%arg0: vector<8x32x2xf16>) -> vector<8x32x2xf16> {
      %0 = xegpu.convert_layout %arg0 <{input_layout = #xegpu.layout<inst_data = [8, 32, 2], lane_layout = [1, 16, 1], lane_data = [8, 1, 2]>, target_layout = #xegpu.layout<inst_data = [8, 16, 2], lane_layout = [1, 16, 1], lane_data = [8, 1, 2]>}> : vector<8x32x2xf16>
      %1 = math.exp %0 {layout_result_0 = #xegpu.layout<inst_data = [8, 16, 2], lane_layout = [1, 16, 1], lane_data = [8, 1, 2]>} : vector<8x32x2xf16>
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
    gpu.func @unroll_store_matrix(%arg0: vector<32x32xf32>, %arg1: memref<32768xi8, 3>) {
      %0 = xegpu.create_mem_desc %arg1 : memref<32768xi8, 3> -> !xegpu.mem_desc<64x128xf32>
      xegpu.store_matrix %arg0, %0[0, 0] <{layout = #xegpu.layout<inst_data = [8, 16]>}>: vector<32x32xf32>, !xegpu.mem_desc<64x128xf32>
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
    gpu.func @remove_unit_dim_inst_data(%arg0: ui64) -> vector<1x1x32xf32> {
      %cst = arith.constant {layout_result_0 = #xegpu.layout<inst_data = [1, 1, 16]>} dense<[[[0, 8, 16, 24, 32, 40, 48, 56, 64, 72, 80, 88, 96, 104, 112, 120, 128, 136, 144, 152, 160, 168, 176, 184, 192, 200, 208, 216, 224, 232, 240, 248]]]> : vector<1x1x32xindex>
      %cst_0 = arith.constant {layout_result_0 = #xegpu.layout<inst_data = [1, 1, 16]>} dense<true> : vector<1x1x32xi1>
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
      %5 = arith.addf %3, %4 {layout_result_0 = #xegpu.layout<inst_data = [1, 16]>} : vector<1x32xf32>
      xegpu.store_nd %5, %2[%c0, %c0] <{layout = #xegpu.layout<inst_data = [1, 16]>}> : vector<1x32xf32>, !xegpu.tensor_desc<1x32xf32, #xegpu.layout<inst_data = [1, 16]>>
      gpu.return
    }
  }
}

// -----
module {
  gpu.module @test_kernel {
    gpu.func @load_add_store_leading_unit_dims(%arg0: ui64, %arg1: ui64, %arg2: ui64) {
      %cst = arith.constant {layout_result_0 = #xegpu.layout<inst_data = [1, 1, 32]>} dense<[[[0, 8, 16, 24, 32, 40, 48, 56, 64, 72, 80, 88, 96, 104, 112, 120, 128, 136, 144, 152, 160, 168, 176, 184, 192, 200, 208, 216, 224, 232, 240, 248]]]> : vector<1x1x32xindex>
      %cst_0 = arith.constant {layout_result_0 = #xegpu.layout<inst_data = [1, 1, 32]>} dense<true> : vector<1x1x32xi1>
      %0 = xegpu.load %arg0[%cst], %cst_0 <{chunk_size = 1 : i64, l1_hint = #xegpu.cache_hint<cached>, layout = #xegpu.layout<inst_data = [1, 1, 32]>}> : ui64, vector<1x1x32xindex>, vector<1x1x32xi1> -> vector<1x1x32xf32>
      %1 = xegpu.load %arg1[%cst], %cst_0 <{chunk_size = 1 : i64, l1_hint = #xegpu.cache_hint<cached>, layout = #xegpu.layout<inst_data = [1, 1, 32]>}> : ui64, vector<1x1x32xindex>, vector<1x1x32xi1> -> vector<1x1x32xf32>
      %2 = arith.addf %0, %1 {layout_result_0 = #xegpu.layout<inst_data = [1, 1, 32]>} : vector<1x1x32xf32>
      xegpu.store %2, %arg2[%cst], %cst_0 <{chunk_size = 1 : i64, l1_hint = #xegpu.cache_hint<cached>, layout = #xegpu.layout<inst_data = [1, 1, 32]>}> : vector<1x1x32xf32>, ui64, vector<1x1x32xindex>, vector<1x1x32xi1>
      gpu.return
    }
  }
}

