module {
  gpu.module @xevm_module {
    gpu.func @store_1D_vector(%arg0: vector<8xf32>, %arg1: memref<8x16x32xf32>, %arg2: index, %arg3: index, %arg4: index, %arg5: vector<8xindex>, %arg6: vector<8xi1>) {
      vector.scatter %arg1[%arg2, %arg3, %arg4] [%arg5], %arg6, %arg0 : memref<8x16x32xf32>, vector<8xindex>, vector<8xi1>, vector<8xf32>
      gpu.return
    }
  }
}

// -----
module {
  gpu.module @xevm_module {
    gpu.func @store_2D_memref(%arg0: vector<8xf32>, %arg1: memref<8x32xf32>, %arg2: index, %arg3: index, %arg4: vector<8xindex>, %arg5: vector<8xi1>) {
      vector.scatter %arg1[%arg2, %arg3] [%arg4], %arg5, %arg0 : memref<8x32xf32>, vector<8xindex>, vector<8xi1>, vector<8xf32>
      gpu.return
    }
  }
}

// -----
module {
  gpu.module @xevm_module {
    gpu.func @store_2D_vector(%arg0: vector<8x16xf32>, %arg1: memref<8x16x32xf32>, %arg2: index, %arg3: index, %arg4: index, %arg5: vector<8x16xindex>, %arg6: vector<8x16xi1>) {
      vector.scatter %arg1[%arg2, %arg3, %arg4] [%arg5], %arg6, %arg0 : memref<8x16x32xf32>, vector<8x16xindex>, vector<8x16xi1>, vector<8x16xf32>
      gpu.return
    }
  }
}

// -----
module {
  gpu.module @xevm_module {
    gpu.func @store_dynamic_source(%arg0: vector<8x16xf32>, %arg1: memref<?x?x?xf32>, %arg2: index, %arg3: index, %arg4: index, %arg5: vector<8x16xindex>, %arg6: vector<8x16xi1>) {
      vector.scatter %arg1[%arg2, %arg3, %arg4] [%arg5], %arg6, %arg0 : memref<?x?x?xf32>, vector<8x16xindex>, vector<8x16xi1>, vector<8x16xf32>
      gpu.return
    }
  }
}

// -----
module {
  gpu.module @xevm_module {
    gpu.func @store_dynamic_source2(%arg0: vector<8x16xf32>, %arg1: memref<?x8x16xf32>, %arg2: index, %arg3: index, %arg4: index, %arg5: vector<8x16xindex>, %arg6: vector<8x16xi1>) {
      vector.scatter %arg1[%arg2, %arg3, %arg4] [%arg5], %arg6, %arg0 : memref<?x8x16xf32>, vector<8x16xindex>, vector<8x16xi1>, vector<8x16xf32>
      gpu.return
    }
  }
}

// -----
module {
  gpu.module @xevm_module {
    gpu.func @non_unit_inner_stride_1D(%arg0: vector<8xf32>, %arg1: memref<32xf32, strided<[?], offset: ?>>, %arg2: index, %arg3: vector<8xindex>, %arg4: vector<8xi1>) {
      vector.scatter %arg1[%arg2] [%arg3], %arg4, %arg0 : memref<32xf32, strided<[?], offset: ?>>, vector<8xindex>, vector<8xi1>, vector<8xf32>
      gpu.return
    }
  }
}

// -----
module {
  gpu.module @xevm_module {
    gpu.func @non_unit_inner_stride_3D(%arg0: vector<8xf32>, %arg1: memref<4x8x32xf32, strided<[?, 128, 2], offset: ?>>, %arg2: index, %arg3: index, %arg4: index, %arg5: vector<8xindex>, %arg6: vector<8xi1>) {
      vector.scatter %arg1[%arg2, %arg3, %arg4] [%arg5], %arg6, %arg0 : memref<4x8x32xf32, strided<[?, 128, 2], offset: ?>>, vector<8xindex>, vector<8xi1>, vector<8xf32>
      gpu.return
    }
  }
}

// -----
module {
  gpu.module @xevm_module {
    gpu.func @scatter_into_subview(%arg0: vector<8xf16>, %arg1: memref<4096x4096xf16>, %arg2: index, %arg3: index, %arg4: index, %arg5: vector<8xindex>, %arg6: vector<8xi1>) {
      %subview = memref.subview %arg1[%arg2, %arg2] [256, 256] [1, 1] : memref<4096x4096xf16> to memref<256x256xf16, strided<[4096, 1], offset: ?>>
      vector.scatter %subview[%arg3, %arg4] [%arg5], %arg6, %arg0 : memref<256x256xf16, strided<[4096, 1], offset: ?>>, vector<8xindex>, vector<8xi1>, vector<8xf16>
      gpu.return
    }
  }
}

