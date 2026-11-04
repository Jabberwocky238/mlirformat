module {
  gpu.module @xevm_module {
    gpu.func @no_scf(%arg0: memref<64x64xf16>, %arg1: vector<8x16xf16>) -> vector<8x16xf32> {
      %c0 = arith.constant 0 : index
      %c32 = arith.constant 32 : index
      %0 = xegpu.create_nd_tdesc %arg0 : memref<64x64xf16> -> !xegpu.tensor_desc<16x16xf16, #xegpu.layout<lane_layout = [16, 1], lane_data = [1, 2]>>
      %1 = xegpu.load_nd %0[%c0, %c32]  {result_layout = #xegpu.layout<lane_layout = [16, 1], lane_data = [1, 2]>} : !xegpu.tensor_desc<16x16xf16, #xegpu.layout<lane_layout = [16, 1], lane_data = [1, 2]>> -> vector<16x16xf16>
      %2 = vector.transpose %1, [1, 0] {layout_result_0 = #xegpu.layout<lane_layout = [1, 16], lane_data = [2, 1]>} : vector<16x16xf16> to vector<16x16xf16>
      %3 = xegpu.dpas %arg1, %2 {layout_result_0 = #xegpu.layout<lane_layout = [1, 16], lane_data = [1, 1]>} : vector<8x16xf16>, vector<16x16xf16> -> vector<8x16xf32>
      gpu.return %3 : vector<8x16xf32>
    }
  }
}

// -----
module {
  gpu.module @xevm_module {
    gpu.func @no_scf_i8(%arg0: memref<64x64xi8>, %arg1: vector<8x32xi8>) -> vector<8x16xi32> {
      %c0 = arith.constant 0 : index
      %c64 = arith.constant 64 : index
      %0 = xegpu.create_nd_tdesc %arg0 : memref<64x64xi8> -> !xegpu.tensor_desc<16x32xi8, #xegpu.layout<lane_layout = [16, 1], lane_data = [1, 4]>>
      %1 = xegpu.load_nd %0[%c0, %c64]  {result_layout = #xegpu.layout<lane_layout = [16, 1], lane_data = [1, 4]>} : !xegpu.tensor_desc<16x32xi8, #xegpu.layout<lane_layout = [16, 1], lane_data = [1, 4]>> -> vector<16x32xi8>
      %2 = vector.transpose %1, [1, 0] {layout_result_0 = #xegpu.layout<lane_layout = [1, 16], lane_data = [4, 1]>} : vector<16x32xi8> to vector<32x16xi8>
      %3 = xegpu.dpas %arg1, %2 {layout_result_0 = #xegpu.layout<lane_layout = [1, 16], lane_data = [1, 1]>} : vector<8x32xi8>, vector<32x16xi8> -> vector<8x16xi32>
      gpu.return %3 : vector<8x16xi32>
    }
  }
}

// -----
module {
  gpu.module @xevm_module {
    gpu.func @gemm_b_transpose(%arg0: memref<256x256xf16>, %arg1: memref<256x256xf16>, %arg2: memref<256x256xf32>) {
      %c0 = arith.constant 0 : index
      %c16 = arith.constant 16 : index
      %c256 = arith.constant 256 : index
      %0 = xegpu.create_nd_tdesc %arg2 : memref<256x256xf32> -> !xegpu.tensor_desc<8x16xf32, #xegpu.layout<lane_layout = [1, 16], lane_data = [1, 1]>>
      %1 = xegpu.load_nd %0[%c0, %c0]  {layout_result_0 = #xegpu.layout<lane_layout = [1, 16], lane_data = [1, 1]>} : !xegpu.tensor_desc<8x16xf32, #xegpu.layout<lane_layout = [1, 16], lane_data = [1, 1]>> -> vector<8x16xf32>
      %2 = xegpu.create_nd_tdesc %arg0 : memref<256x256xf16> -> !xegpu.tensor_desc<8x16xf16, #xegpu.layout<lane_layout = [1, 16], lane_data = [1, 1]>>
      %3 = xegpu.create_nd_tdesc %arg1 : memref<256x256xf16> -> !xegpu.tensor_desc<16x16xf16, #xegpu.layout<lane_layout = [16, 1], lane_data = [1, 2]>>
      %4 = scf.for %arg3 = %c0 to %c256 step %c16 iter_args(%arg4 = %1) -> (vector<8x16xf32>) {
        %5 = xegpu.load_nd %2[%c0, %arg3]  {layout_result_0 = #xegpu.layout<lane_layout = [1, 16], lane_data = [1, 1]>} : !xegpu.tensor_desc<8x16xf16, #xegpu.layout<lane_layout = [1, 16], lane_data = [1, 1]>> -> vector<8x16xf16>
        %6 = xegpu.load_nd %3[%c0, %arg3]  {layout_result_0 = #xegpu.layout<lane_layout = [16, 1], lane_data = [1, 2]>} : !xegpu.tensor_desc<16x16xf16, #xegpu.layout<lane_layout = [16, 1], lane_data = [1, 2]>> -> vector<16x16xf16>
        %7 = vector.transpose %6, [1, 0] {layout_result_0 = #xegpu.layout<lane_layout = [1, 16], lane_data = [2, 1]>} : vector<16x16xf16> to vector<16x16xf16>
        %8 = xegpu.dpas %5, %7, %arg4 {layout_result_0 = #xegpu.layout<lane_layout = [1, 16], lane_data = [1, 1]>} : vector<8x16xf16>, vector<16x16xf16>, vector<8x16xf32> -> vector<8x16xf32>
        scf.yield %8 : vector<8x16xf32>
      } {layout_result_0 = #xegpu.layout<lane_layout = [1, 16], lane_data = [1, 1]>}
      xegpu.store_nd %4, %0[%c0, %c0]  : vector<8x16xf32>, !xegpu.tensor_desc<8x16xf32, #xegpu.layout<lane_layout = [1, 16], lane_data = [1, 1]>>
      gpu.return
    }
  }
}

// -----
module {
  gpu.module @xevm_module {
    gpu.func @nested_scf(%arg0: memref<256x256xf16>, %arg1: memref<256x256xf16>, %arg2: memref<256x256xf32>) {
      %c0 = arith.constant 0 : index
      %c16 = arith.constant 16 : index
      %c256 = arith.constant 256 : index
      scf.for %arg3 = %c0 to %c256 step %c16 {
        %0 = xegpu.create_nd_tdesc %arg2 : memref<256x256xf32> -> !xegpu.tensor_desc<8x16xf32, #xegpu.layout<lane_layout = [1, 16], lane_data = [1, 1]>>
        %1 = xegpu.load_nd %0[%arg3, %c0]  {layout_result_0 = #xegpu.layout<lane_layout = [1, 16], lane_data = [1, 1]>} : !xegpu.tensor_desc<8x16xf32, #xegpu.layout<lane_layout = [1, 16], lane_data = [1, 1]>> -> vector<8x16xf32>
        %2 = xegpu.create_nd_tdesc %arg0 : memref<256x256xf16> -> !xegpu.tensor_desc<8x16xf16, #xegpu.layout<lane_layout = [1, 16], lane_data = [1, 1]>>
        %3 = xegpu.create_nd_tdesc %arg1 : memref<256x256xf16> -> !xegpu.tensor_desc<16x16xf16, #xegpu.layout<lane_layout = [16, 1], lane_data = [1, 2]>>
        %4 = scf.for %arg4 = %c0 to %c256 step %c16 iter_args(%arg5 = %1) -> (vector<8x16xf32>) {
          %5 = xegpu.load_nd %2[%arg3, %arg4]  {layout_result_0 = #xegpu.layout<lane_layout = [1, 16], lane_data = [1, 1]>} : !xegpu.tensor_desc<8x16xf16, #xegpu.layout<lane_layout = [1, 16], lane_data = [1, 1]>> -> vector<8x16xf16>
          %6 = xegpu.load_nd %3[%arg3, %arg4]  {layout_result_0 = #xegpu.layout<lane_layout = [16, 1], lane_data = [1, 2]>} : !xegpu.tensor_desc<16x16xf16, #xegpu.layout<lane_layout = [16, 1], lane_data = [1, 2]>> -> vector<16x16xf16>
          %7 = vector.transpose %6, [1, 0] {layout_result_0 = #xegpu.layout<lane_layout = [1, 16], lane_data = [2, 1]>} : vector<16x16xf16> to vector<16x16xf16>
          %8 = xegpu.dpas %5, %7, %arg5 {layout_result_0 = #xegpu.layout<lane_layout = [1, 16], lane_data = [1, 1]>} : vector<8x16xf16>, vector<16x16xf16>, vector<8x16xf32> -> vector<8x16xf32>
          scf.yield %8 : vector<8x16xf32>
        } {layout_result_0 = #xegpu.layout<lane_layout = [1, 16], lane_data = [1, 1]>}
        xegpu.store_nd %4, %0[%c0, %c0]  : vector<8x16xf32>, !xegpu.tensor_desc<8x16xf32, #xegpu.layout<lane_layout = [1, 16], lane_data = [1, 1]>>
      }
      gpu.return
    }
  }
}

// -----
module {
  gpu.module @xevm_module {
    gpu.func @large_loads(%arg0: vector<8x16xf16>, %arg1: memref<256x256xf16>, %arg2: memref<256x256xf32>) {
      %c0 = arith.constant 0 : index
      %c16 = arith.constant 16 : index
      %c32 = arith.constant 32 : index
      %c256 = arith.constant 256 : index
      %0 = xegpu.create_nd_tdesc %arg2 : memref<256x256xf32> -> !xegpu.tensor_desc<8x16xf32, #xegpu.layout<lane_layout = [1, 16], lane_data = [1, 1]>>
      %1 = xegpu.load_nd %0[%c0, %c0]  {layout_result_0 = #xegpu.layout<lane_layout = [1, 16], lane_data = [1, 1]>} : !xegpu.tensor_desc<8x16xf32, #xegpu.layout<lane_layout = [1, 16], lane_data = [1, 1]>> -> vector<8x16xf32>
      %2 = xegpu.create_nd_tdesc %arg1 : memref<256x256xf16> -> !xegpu.tensor_desc<32x32xf16, #xegpu.layout<lane_layout = [16, 1], lane_data = [1, 2]>>
      %3:4 = scf.for %arg3 = %c0 to %c256 step %c32 iter_args(%arg4 = %1, %arg5 = %1, %arg6 = %1, %arg7 = %1) -> (vector<8x16xf32>, vector<8x16xf32>, vector<8x16xf32>, vector<8x16xf32>) {
        %4 = xegpu.load_nd %2[%c0, %arg3]  {layout_result_0 = #xegpu.layout<lane_layout = [16, 1], lane_data = [1, 2]>} : !xegpu.tensor_desc<32x32xf16, #xegpu.layout<lane_layout = [16, 1], lane_data = [1, 2]>> -> vector<32x32xf16>
        %5 = vector.extract_strided_slice %4 {layout_result_0 = #xegpu.layout<lane_layout = [16, 1], lane_data = [1, 2]>, offsets = [0, 0], sizes = [16, 16], strides = [1, 1]} : vector<32x32xf16> to vector<16x16xf16>
        %6 = vector.extract_strided_slice %4 {layout_result_0 = #xegpu.layout<lane_layout = [16, 1], lane_data = [1, 2]>, offsets = [0, 16], sizes = [16, 16], strides = [1, 1]} : vector<32x32xf16> to vector<16x16xf16>
        %7 = vector.extract_strided_slice %4 {layout_result_0 = #xegpu.layout<lane_layout = [16, 1], lane_data = [1, 2]>, offsets = [16, 0], sizes = [16, 16], strides = [1, 1]} : vector<32x32xf16> to vector<16x16xf16>
        %8 = vector.extract_strided_slice %4 {layout_result_0 = #xegpu.layout<lane_layout = [16, 1], lane_data = [1, 2]>, offsets = [16, 16], sizes = [16, 16], strides = [1, 1]} : vector<32x32xf16> to vector<16x16xf16>
        %9 = vector.transpose %5, [1, 0] {layout_result_0 = #xegpu.layout<lane_layout = [1, 16], lane_data = [2, 1]>} : vector<16x16xf16> to vector<16x16xf16>
        %10 = vector.transpose %6, [1, 0] {layout_result_0 = #xegpu.layout<lane_layout = [1, 16], lane_data = [2, 1]>} : vector<16x16xf16> to vector<16x16xf16>
        %11 = vector.transpose %7, [1, 0] {layout_result_0 = #xegpu.layout<lane_layout = [1, 16], lane_data = [2, 1]>} : vector<16x16xf16> to vector<16x16xf16>
        %12 = vector.transpose %8, [1, 0] {layout_result_0 = #xegpu.layout<lane_layout = [1, 16], lane_data = [2, 1]>} : vector<16x16xf16> to vector<16x16xf16>
        %13 = xegpu.dpas %arg0, %9, %arg4 {layout_result_0 = #xegpu.layout<lane_layout = [1, 16], lane_data = [1, 1]>} : vector<8x16xf16>, vector<16x16xf16>, vector<8x16xf32> -> vector<8x16xf32>
        %14 = xegpu.dpas %arg0, %10, %arg5 {layout_result_0 = #xegpu.layout<lane_layout = [1, 16], lane_data = [1, 1]>} : vector<8x16xf16>, vector<16x16xf16>, vector<8x16xf32> -> vector<8x16xf32>
        %15 = xegpu.dpas %arg0, %11, %arg6 {layout_result_0 = #xegpu.layout<lane_layout = [1, 16], lane_data = [1, 1]>} : vector<8x16xf16>, vector<16x16xf16>, vector<8x16xf32> -> vector<8x16xf32>
        %16 = xegpu.dpas %arg0, %12, %arg7 {layout_result_0 = #xegpu.layout<lane_layout = [1, 16], lane_data = [1, 1]>} : vector<8x16xf16>, vector<16x16xf16>, vector<8x16xf32> -> vector<8x16xf32>
        scf.yield %13, %14, %15, %16 : vector<8x16xf32>, vector<8x16xf32>, vector<8x16xf32>, vector<8x16xf32>
      } {layout_result_0 = #xegpu.layout<lane_layout = [1, 16], lane_data = [1, 1]>, layout_result_1 = #xegpu.layout<lane_layout = [1, 16], lane_data = [1, 1]>, layout_result_2 = #xegpu.layout<lane_layout = [1, 16], lane_data = [1, 1]>, layout_result_3 = #xegpu.layout<lane_layout = [1, 16], lane_data = [1, 1]>}
      xegpu.store_nd %3#0, %0[%c0, %c0]  : vector<8x16xf32>, !xegpu.tensor_desc<8x16xf32, #xegpu.layout<lane_layout = [1, 16], lane_data = [1, 1]>>
      xegpu.store_nd %3#1, %0[%c0, %c16]  : vector<8x16xf32>, !xegpu.tensor_desc<8x16xf32, #xegpu.layout<lane_layout = [1, 16], lane_data = [1, 1]>>
      xegpu.store_nd %3#2, %0[%c16, %c0]  : vector<8x16xf32>, !xegpu.tensor_desc<8x16xf32, #xegpu.layout<lane_layout = [1, 16], lane_data = [1, 1]>>
      xegpu.store_nd %3#3, %0[%c16, %c16]  : vector<8x16xf32>, !xegpu.tensor_desc<8x16xf32, #xegpu.layout<lane_layout = [1, 16], lane_data = [1, 1]>>
      gpu.return
    }
  }
}

// -----
module {
  gpu.module @xevm_module {
    gpu.func @array_length(%arg0: vector<8x16xf16>, %arg1: memref<256x256xf16>, %arg2: memref<256x256xf32>) {
      %c0 = arith.constant 0 : index
      %c16 = arith.constant 16 : index
      %c32 = arith.constant 32 : index
      %c256 = arith.constant 256 : index
      %0 = xegpu.create_nd_tdesc %arg2 : memref<256x256xf32> -> !xegpu.tensor_desc<8x16xf32, #xegpu.layout<lane_layout = [1, 16], lane_data = [1, 1]>>
      %1 = xegpu.load_nd %0[%c0, %c0] <{layout = #xegpu.layout<lane_layout = [1, 16], lane_data = [1, 1]>}> : !xegpu.tensor_desc<8x16xf32, #xegpu.layout<lane_layout = [1, 16], lane_data = [1, 1]>> -> vector<8x16xf32>
      %2 = xegpu.create_nd_tdesc %arg1 : memref<256x256xf16> -> !xegpu.tensor_desc<32x16xf16, #xegpu.block_tdesc_attr<array_length = 2 : i64>, #xegpu.layout<lane_layout = [16, 1], lane_data = [1, 2]>>
      %3:4 = scf.for %arg3 = %c0 to %c256 step %c32 iter_args(%arg4 = %1, %arg5 = %1, %arg6 = %1, %arg7 = %1) -> (vector<8x16xf32>, vector<8x16xf32>, vector<8x16xf32>, vector<8x16xf32>) {
        %4 = xegpu.load_nd %2[%c0, %arg3] <{layout = #xegpu.layout<lane_layout = [16, 1], lane_data = [1, 2]>}> : !xegpu.tensor_desc<32x16xf16, #xegpu.block_tdesc_attr<array_length = 2 : i64>, #xegpu.layout<lane_layout = [16, 1], lane_data = [1, 2]>> -> vector<2x32x16xf16>
        %5 = vector.extract %4[0] {layout_result_0 = #xegpu.layout<lane_layout = [16, 1], lane_data = [1, 2]>} : vector<32x16xf16> from vector<2x32x16xf16>
        %6 = vector.extract %4[1] {layout_result_0 = #xegpu.layout<lane_layout = [16, 1], lane_data = [1, 2]>} : vector<32x16xf16> from vector<2x32x16xf16>
        %7 = vector.extract_strided_slice %5 {layout_result_0 = #xegpu.layout<lane_layout = [16, 1], lane_data = [1, 2]>, offsets = [0, 0], sizes = [16, 16], strides = [1, 1]} : vector<32x16xf16> to vector<16x16xf16>
        %8 = vector.extract_strided_slice %5 {layout_result_0 = #xegpu.layout<lane_layout = [16, 1], lane_data = [1, 2]>, offsets = [16, 0], sizes = [16, 16], strides = [1, 1]} : vector<32x16xf16> to vector<16x16xf16>
        %9 = vector.extract_strided_slice %6 {layout_result_0 = #xegpu.layout<lane_layout = [16, 1], lane_data = [1, 2]>, offsets = [0, 0], sizes = [16, 16], strides = [1, 1]} : vector<32x16xf16> to vector<16x16xf16>
        %10 = vector.extract_strided_slice %6 {layout_result_0 = #xegpu.layout<lane_layout = [16, 1], lane_data = [1, 2]>, offsets = [16, 0], sizes = [16, 16], strides = [1, 1]} : vector<32x16xf16> to vector<16x16xf16>
        %11 = vector.transpose %7, [1, 0] {layout_result_0 = #xegpu.layout<lane_layout = [1, 16], lane_data = [2, 1]>} : vector<16x16xf16> to vector<16x16xf16>
        %12 = vector.transpose %8, [1, 0] {layout_result_0 = #xegpu.layout<lane_layout = [1, 16], lane_data = [2, 1]>} : vector<16x16xf16> to vector<16x16xf16>
        %13 = vector.transpose %9, [1, 0] {layout_result_0 = #xegpu.layout<lane_layout = [1, 16], lane_data = [2, 1]>} : vector<16x16xf16> to vector<16x16xf16>
        %14 = vector.transpose %10, [1, 0] {layout_result_0 = #xegpu.layout<lane_layout = [1, 16], lane_data = [2, 1]>} : vector<16x16xf16> to vector<16x16xf16>
        %15 = xegpu.dpas %arg0, %11, %arg4 {layout = #xegpu.layout<lane_layout = [1, 16], lane_data = [1, 1]>} : vector<8x16xf16>, vector<16x16xf16>, vector<8x16xf32> -> vector<8x16xf32>
        %16 = xegpu.dpas %arg0, %12, %arg5 {layout = #xegpu.layout<lane_layout = [1, 16], lane_data = [1, 1]>} : vector<8x16xf16>, vector<16x16xf16>, vector<8x16xf32> -> vector<8x16xf32>
        %17 = xegpu.dpas %arg0, %13, %arg6 {layout = #xegpu.layout<lane_layout = [1, 16], lane_data = [1, 1]>} : vector<8x16xf16>, vector<16x16xf16>, vector<8x16xf32> -> vector<8x16xf32>
        %18 = xegpu.dpas %arg0, %14, %arg7 {layout = #xegpu.layout<lane_layout = [1, 16], lane_data = [1, 1]>} : vector<8x16xf16>, vector<16x16xf16>, vector<8x16xf32> -> vector<8x16xf32>
        scf.yield %15, %16, %17, %18 : vector<8x16xf32>, vector<8x16xf32>, vector<8x16xf32>, vector<8x16xf32>
      } {layout_result_0 = #xegpu.layout<lane_layout = [1, 16], lane_data = [1, 1]>, layout_result_1 = #xegpu.layout<lane_layout = [1, 16], lane_data = [1, 1]>, layout_result_2 = #xegpu.layout<lane_layout = [1, 16], lane_data = [1, 1]>, layout_result_3 = #xegpu.layout<lane_layout = [1, 16], lane_data = [1, 1]>}
      xegpu.store_nd %3#0, %0[%c0, %c0]  : vector<8x16xf32>, !xegpu.tensor_desc<8x16xf32, #xegpu.layout<lane_layout = [1, 16], lane_data = [1, 1]>>
      xegpu.store_nd %3#1, %0[%c0, %c16]  : vector<8x16xf32>, !xegpu.tensor_desc<8x16xf32, #xegpu.layout<lane_layout = [1, 16], lane_data = [1, 1]>>
      xegpu.store_nd %3#2, %0[%c16, %c0]  : vector<8x16xf32>, !xegpu.tensor_desc<8x16xf32, #xegpu.layout<lane_layout = [1, 16], lane_data = [1, 1]>>
      xegpu.store_nd %3#3, %0[%c16, %c16]  : vector<8x16xf32>, !xegpu.tensor_desc<8x16xf32, #xegpu.layout<lane_layout = [1, 16], lane_data = [1, 1]>>
      gpu.return
    }
  }
}

