module {
  gpu.module @test_kernel {
    gpu.func @test_kernel(%arg0: memref<4x64x256xf16>, %arg1: memref<4x256x64xf16>, %arg2: memref<4x64x64xf32>) kernel {
      %c0 = arith.constant 0 : index
      %c32 = arith.constant 32 : index
      %c64 = arith.constant 64 : index
      %c96 = arith.constant 96 : index
      %c256 = arith.constant 256 : index
      %block_id_x = gpu.block_id x
      %block_id_y = gpu.block_id y
      %block_id_z = gpu.block_id z
      %0 = arith.muli %block_id_x, %c64 : index
      %1 = arith.muli %block_id_y, %c64 : index
      %2 = xegpu.create_nd_tdesc %arg2 : memref<4x64x64xf32> -> !xegpu.tensor_desc<4x64x64xf32, #xegpu.layout<sg_layout = [1, 8, 4], sg_data = [4, 8, 16], inst_data = [1, 8, 16]>>
      %3 = xegpu.load_nd %2[%block_id_z, %0, %1] <{layout = #xegpu.layout<sg_layout = [1, 8, 4], sg_data = [4, 8, 16], inst_data = [1, 8, 16]>}> : !xegpu.tensor_desc<4x64x64xf32, #xegpu.layout<sg_layout = [1, 8, 4], sg_data = [4, 8, 16], inst_data = [1, 8, 16]>> -> vector<4x64x64xf32>
      %4 = xegpu.create_nd_tdesc %arg0 : memref<4x64x256xf16> -> !xegpu.tensor_desc<4x64x32xf16, #xegpu.layout<sg_layout = [1, 8, 4], sg_data = [4, 8, 32], inst_data = [1, 8, 16]>>
      %5 = xegpu.create_nd_tdesc %arg1 : memref<4x256x64xf16> -> !xegpu.tensor_desc<4x32x64xf16, #xegpu.layout<sg_layout = [1, 8, 4], sg_data = [4, 32, 16], inst_data = [1, 16, 16]>>
      %6 = xegpu.create_nd_tdesc %arg0 : memref<4x64x256xf16> -> !xegpu.tensor_desc<4x64x32xf16, #xegpu.layout<sg_layout = [4, 8, 1], sg_data = [1, 8, 32], inst_data = [1, 8, 16]>>
      xegpu.prefetch_nd %6[%block_id_z, %0, %c0] <{layout = #xegpu.layout<sg_layout = [4, 8, 1], sg_data = [1, 8, 32], inst_data = [1, 8, 16]>}> : !xegpu.tensor_desc<4x64x32xf16, #xegpu.layout<sg_layout = [4, 8, 1], sg_data = [1, 8, 32], inst_data = [1, 8, 16]>>
      xegpu.prefetch_nd %6[%block_id_z, %0, %c32] <{layout = #xegpu.layout<sg_layout = [4, 8, 1], sg_data = [1, 8, 32], inst_data = [1, 8, 16]>}> : !xegpu.tensor_desc<4x64x32xf16, #xegpu.layout<sg_layout = [4, 8, 1], sg_data = [1, 8, 32], inst_data = [1, 8, 16]>>
      xegpu.prefetch_nd %6[%block_id_z, %0, %c64] <{layout = #xegpu.layout<sg_layout = [4, 8, 1], sg_data = [1, 8, 32], inst_data = [1, 8, 16]>}> : !xegpu.tensor_desc<4x64x32xf16, #xegpu.layout<sg_layout = [4, 8, 1], sg_data = [1, 8, 32], inst_data = [1, 8, 16]>>
      %7 = xegpu.create_nd_tdesc %arg1 : memref<4x256x64xf16> -> !xegpu.tensor_desc<4x32x64xf16, #xegpu.layout<sg_layout = [4, 4, 2], sg_data = [1, 8, 32], inst_data = [1, 8, 16]>>
      xegpu.prefetch_nd %7[%block_id_z, %c0, %1] <{layout = #xegpu.layout<sg_layout = [4, 4, 2], sg_data = [1, 8, 32], inst_data = [1, 8, 16]>}> : !xegpu.tensor_desc<4x32x64xf16, #xegpu.layout<sg_layout = [4, 4, 2], sg_data = [1, 8, 32], inst_data = [1, 8, 16]>>
      xegpu.prefetch_nd %7[%block_id_z, %c32, %1] <{layout = #xegpu.layout<sg_layout = [4, 4, 2], sg_data = [1, 8, 32], inst_data = [1, 8, 16]>}> : !xegpu.tensor_desc<4x32x64xf16, #xegpu.layout<sg_layout = [4, 4, 2], sg_data = [1, 8, 32], inst_data = [1, 8, 16]>>
      xegpu.prefetch_nd %7[%block_id_z, %c64, %1] <{layout = #xegpu.layout<sg_layout = [4, 4, 2], sg_data = [1, 8, 32], inst_data = [1, 8, 16]>}> : !xegpu.tensor_desc<4x32x64xf16, #xegpu.layout<sg_layout = [4, 4, 2], sg_data = [1, 8, 32], inst_data = [1, 8, 16]>>
      %8 = scf.for %arg3 = %c0 to %c256 step %c32 iter_args(%arg4 = %3) -> (vector<4x64x64xf32>) {
        %9 = xegpu.load_nd %4[%block_id_z, %0, %arg3] <{layout = #xegpu.layout<sg_layout = [1, 8, 4], sg_data = [4, 8, 32], inst_data = [1, 8, 16]>}> : !xegpu.tensor_desc<4x64x32xf16, #xegpu.layout<sg_layout = [1, 8, 4], sg_data = [4, 8, 32], inst_data = [1, 8, 16]>> -> vector<4x64x32xf16>
        %10 = xegpu.load_nd %5[%block_id_z, %arg3, %1] <{layout = #xegpu.layout<sg_layout = [1, 8, 4], sg_data = [4, 32, 16], inst_data = [1, 16, 16]>}> : !xegpu.tensor_desc<4x32x64xf16, #xegpu.layout<sg_layout = [1, 8, 4], sg_data = [4, 32, 16], inst_data = [1, 16, 16]>> -> vector<4x32x64xf16>
        %11 = arith.addi %arg3, %c96 : index
        xegpu.prefetch_nd %6[%block_id_z, %0, %11] <{layout = #xegpu.layout<sg_layout = [4, 8, 1], sg_data = [1, 8, 32], inst_data = [1, 8, 16]>}> : !xegpu.tensor_desc<4x64x32xf16, #xegpu.layout<sg_layout = [4, 8, 1], sg_data = [1, 8, 32], inst_data = [1, 8, 16]>>
        xegpu.prefetch_nd %7[%block_id_z, %11, %1] <{layout = #xegpu.layout<sg_layout = [4, 4, 2], sg_data = [1, 8, 32], inst_data = [1, 8, 16]>}> : !xegpu.tensor_desc<4x32x64xf16, #xegpu.layout<sg_layout = [4, 4, 2], sg_data = [1, 8, 32], inst_data = [1, 8, 16]>>
        %12 = xegpu.dpas %9, %10, %arg4 {layout_a = #xegpu.layout<sg_layout = [1, 8, 4], sg_data = [4, 8, 32], inst_data = [1, 8, 16]>, layout_b = #xegpu.layout<sg_layout = [1, 8, 4], sg_data = [4, 32, 16], inst_data = [1, 16, 16]>, layout_cd = #xegpu.layout<sg_layout = [1, 8, 4], sg_data = [4, 8, 16], inst_data = [1, 8, 16]>} : vector<4x64x32xf16>, vector<4x32x64xf16>, vector<4x64x64xf32> -> vector<4x64x64xf32>
        scf.yield %12 : vector<4x64x64xf32>
      }
      xegpu.store_nd %8, %2[%block_id_z, %0, %1] <{layout = #xegpu.layout<sg_layout = [1, 8, 4], sg_data = [4, 8, 16], inst_data = [1, 8, 16]>}> : vector<4x64x64xf32>, !xegpu.tensor_desc<4x64x64xf32, #xegpu.layout<sg_layout = [1, 8, 4], sg_data = [4, 8, 16], inst_data = [1, 8, 16]>>
      gpu.return
    }
  }
}

