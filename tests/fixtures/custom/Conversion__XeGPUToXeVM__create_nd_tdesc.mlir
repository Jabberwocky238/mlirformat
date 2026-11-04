module {
  gpu.module @create_nd_tdesc {
    gpu.func @create_nd_tdesc(%arg0: memref<16x32xf32, 1>, %arg1: ui64, %arg2: index, %arg3: index, %arg4: index, %arg5: index, %arg6: index, %arg7: index, %arg8: memref<?x?xf16>) kernel {
      %0 = xegpu.create_nd_tdesc %arg1, shape : [%arg2, %arg3], strides : [%arg4, %arg5] : ui64 -> !xegpu.tensor_desc<8x16xf32>
      %memspacecast = memref.memory_space_cast %arg0 : memref<16x32xf32, 1> to memref<16x32xf32>
      %1 = xegpu.create_nd_tdesc %memspacecast : memref<16x32xf32> -> !xegpu.tensor_desc<8x16xf32>
      %c1 = arith.constant 1 : index
      %c64 = arith.constant 64 : index
      %c16 = arith.constant 16 : index
      %2 = xegpu.create_nd_tdesc %arg8, shape : [%c64, %c16], strides : [%c16, %c1] : memref<?x?xf16> -> !xegpu.tensor_desc<16x16xf16>
      gpu.return
    }
  }
}

