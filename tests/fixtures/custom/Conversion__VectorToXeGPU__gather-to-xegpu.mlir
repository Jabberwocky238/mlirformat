module {
  gpu.module @xevm_module {
    gpu.func @load_1D_vector(%arg0: memref<8x16x32xf32>, %arg1: index, %arg2: index, %arg3: index, %arg4: vector<8xindex>, %arg5: vector<8xi1>, %arg6: vector<8xf32>) -> vector<8xf32> {
      %0 = vector.gather %arg0[%arg1, %arg2, %arg3] [%arg4], %arg5, %arg6 : memref<8x16x32xf32>, vector<8xindex>, vector<8xi1>, vector<8xf32> into vector<8xf32>
      gpu.return %0 : vector<8xf32>
    }
  }
}

// -----
module {
  gpu.module @xevm_module {
    gpu.func @load_2D_memref(%arg0: memref<8x32xf32>, %arg1: index, %arg2: index, %arg3: vector<8xindex>, %arg4: vector<8xi1>, %arg5: vector<8xf32>) -> vector<8xf32> {
      %0 = vector.gather %arg0[%arg1, %arg2] [%arg3], %arg4, %arg5 : memref<8x32xf32>, vector<8xindex>, vector<8xi1>, vector<8xf32> into vector<8xf32>
      gpu.return %0 : vector<8xf32>
    }
  }
}

// -----
module {
  gpu.module @xevm_module {
    gpu.func @load_2D_vector(%arg0: memref<8x16x32xf32>, %arg1: index, %arg2: index, %arg3: index, %arg4: vector<8x16xindex>, %arg5: vector<8x16xi1>, %arg6: vector<8x16xf32>) -> vector<8x16xf32> {
      %0 = vector.gather %arg0[%arg1, %arg2, %arg3] [%arg4], %arg5, %arg6 : memref<8x16x32xf32>, vector<8x16xindex>, vector<8x16xi1>, vector<8x16xf32> into vector<8x16xf32>
      gpu.return %0 : vector<8x16xf32>
    }
  }
}

// -----
module {
  gpu.module @xevm_module {
    gpu.func @load_dynamic_source(%arg0: memref<?x?x?xf32>, %arg1: index, %arg2: index, %arg3: index, %arg4: vector<8x16xindex>, %arg5: vector<8x16xi1>, %arg6: vector<8x16xf32>) -> vector<8x16xf32> {
      %0 = vector.gather %arg0[%arg1, %arg2, %arg3] [%arg4], %arg5, %arg6 : memref<?x?x?xf32>, vector<8x16xindex>, vector<8x16xi1>, vector<8x16xf32> into vector<8x16xf32>
      gpu.return %0 : vector<8x16xf32>
    }
  }
}

// -----
module {
  gpu.module @xevm_module {
    gpu.func @load_dynamic_source2(%arg0: memref<?x8x16xf32>, %arg1: index, %arg2: index, %arg3: index, %arg4: vector<8x16xindex>, %arg5: vector<8x16xi1>, %arg6: vector<8x16xf32>) -> vector<8x16xf32> {
      %0 = vector.gather %arg0[%arg1, %arg2, %arg3] [%arg4], %arg5, %arg6 : memref<?x8x16xf32>, vector<8x16xindex>, vector<8x16xi1>, vector<8x16xf32> into vector<8x16xf32>
      gpu.return %0 : vector<8x16xf32>
    }
  }
}

// -----
module {
  gpu.module @xevm_module {
    gpu.func @no_load_tensor(%arg0: tensor<32x64xf32>, %arg1: index, %arg2: vector<8x16xindex>, %arg3: vector<8x16xi1>, %arg4: vector<8x16xf32>) -> vector<8x16xf32> {
      %0 = vector.gather %arg0[%arg1, %arg1] [%arg2], %arg3, %arg4 : tensor<32x64xf32>, vector<8x16xindex>, vector<8x16xi1>, vector<8x16xf32> into vector<8x16xf32>
      gpu.return %0 : vector<8x16xf32>
    }
  }
}

// -----
module {
  gpu.module @xevm_module {
    gpu.func @gather_from_subview(%arg0: memref<4096x4096xf16>, %arg1: index, %arg2: index, %arg3: index, %arg4: vector<8xindex>, %arg5: vector<8xi1>, %arg6: vector<8xf16>) -> vector<8xf16> {
      %subview = memref.subview %arg0[%arg1, %arg1] [256, 256] [1, 1] : memref<4096x4096xf16> to memref<256x256xf16, strided<[4096, 1], offset: ?>>
      %0 = vector.gather %subview[%arg2, %arg3] [%arg4], %arg5, %arg6 : memref<256x256xf16, strided<[4096, 1], offset: ?>>, vector<8xindex>, vector<8xi1>, vector<8xf16> into vector<8xf16>
      gpu.return %0 : vector<8xf16>
    }
  }
}

// -----
module {
  gpu.module @xevm_module {
    gpu.func @non_unit_inner_stride_1D(%arg0: memref<32xf32, strided<[?], offset: ?>>, %arg1: index, %arg2: vector<8xindex>, %arg3: vector<8xi1>, %arg4: vector<8xf32>) -> vector<8xf32> {
      %0 = vector.gather %arg0[%arg1] [%arg2], %arg3, %arg4 : memref<32xf32, strided<[?], offset: ?>>, vector<8xindex>, vector<8xi1>, vector<8xf32> into vector<8xf32>
      gpu.return %0 : vector<8xf32>
    }
  }
}

// -----
module {
  gpu.module @xevm_module {
    gpu.func @non_unit_inner_stride_3D(%arg0: memref<4x8x32xf32, strided<[?, 128, 2], offset: ?>>, %arg1: index, %arg2: index, %arg3: index, %arg4: vector<8xindex>, %arg5: vector<8xi1>, %arg6: vector<8xf32>) -> vector<8xf32> {
      %0 = vector.gather %arg0[%arg1, %arg2, %arg3] [%arg4], %arg5, %arg6 : memref<4x8x32xf32, strided<[?, 128, 2], offset: ?>>, vector<8xindex>, vector<8xi1>, vector<8xf32> into vector<8xf32>
      gpu.return %0 : vector<8xf32>
    }
  }
}

