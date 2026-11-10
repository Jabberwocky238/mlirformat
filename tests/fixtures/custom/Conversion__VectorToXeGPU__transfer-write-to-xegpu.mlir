module {
  gpu.module @xevm_module {
    gpu.func @store_1D_vector(%arg0: vector<8xf32>, %arg1: memref<8x16x32xf32>, %arg2: index) {
      vector.transfer_write %arg0, %arg1[%arg2, %arg2, %arg2] {in_bounds = [true]} : vector<8xf32>, memref<8x16x32xf32>
      gpu.return
    }
  }
}

// -----
module {
  gpu.module @xevm_module {
    gpu.func @store_2D_vector(%arg0: vector<8x16xf32>, %arg1: memref<8x16x32xf32>, %arg2: index) {
      vector.transfer_write %arg0, %arg1[%arg2, %arg2, %arg2] {in_bounds = [true, true]} : vector<8x16xf32>, memref<8x16x32xf32>
      gpu.return
    }
  }
}

// -----
module {
  gpu.module @xevm_module {
    gpu.func @store_dynamic_source(%arg0: vector<8x16xf32>, %arg1: memref<?x?x?xf32>, %arg2: index, %arg3: index, %arg4: index) {
      vector.transfer_write %arg0, %arg1[%arg2, %arg3, %arg4] {in_bounds = [true, true]} : vector<8x16xf32>, memref<?x?x?xf32>
      gpu.return
    }
  }
}

// -----
module {
  gpu.module @xevm_module {
    gpu.func @store_out_of_bounds(%arg0: vector<8x16xf32>, %arg1: memref<7x64xf32>, %arg2: index) {
      vector.transfer_write %arg0, %arg1[%arg2, %arg2] {in_bounds = [false, true]} : vector<8x16xf32>, memref<7x64xf32>
      gpu.return
    }
  }
}

// -----
#map = affine_map<(d0, d1) -> (d1, d0)>
module {
  gpu.module @xevm_module {
    gpu.func @no_store_transposed(%arg0: vector<8x16xf32>, %arg1: memref<32x64xf32>, %arg2: index) {
      vector.transfer_write %arg0, %arg1[%arg2, %arg2] {in_bounds = [true, true], permutation_map = #map} : vector<8x16xf32>, memref<32x64xf32>
      gpu.return
    }
  }
}

// -----
module {
  gpu.module @xevm_module {
    gpu.func @store_high_dim_vector(%arg0: vector<8x16x32xf32>, %arg1: memref<16x32x64xf32>, %arg2: index) {
      vector.transfer_write %arg0, %arg1[%arg2, %arg2, %arg2] {in_bounds = [true, true, true]} : vector<8x16x32xf32>, memref<16x32x64xf32>
      gpu.return
    }
  }
}

// -----
module {
  gpu.module @xevm_module {
    gpu.func @store_8D_vector(%arg0: vector<2x2x2x2x2x2x2x2xf32>, %arg1: memref<2x2x2x2x2x2x2x2xf32>, %arg2: index) {
      vector.transfer_write %arg0, %arg1[%arg2, %arg2, %arg2, %arg2, %arg2, %arg2, %arg2, %arg2] {in_bounds = [true, true, true, true, true, true, true, true]} : vector<2x2x2x2x2x2x2x2xf32>, memref<2x2x2x2x2x2x2x2xf32>
      gpu.return
    }
  }
}

// -----
module {
  gpu.module @xevm_module {
    gpu.func @no_store_masked(%arg0: vector<4xf32>, %arg1: memref<4xf32>, %arg2: index) {
      %cst = arith.constant dense<[false, true, false, true]> : vector<4xi1>
      vector.transfer_write %arg0, %arg1[%arg2], %cst {in_bounds = [true]} : vector<4xf32>, memref<4xf32>
      gpu.return
    }
  }
}

// -----
module {
  gpu.module @xevm_module {
    gpu.func @no_store_tensor(%arg0: vector<8x16xf32>, %arg1: tensor<32x64xf32>, %arg2: index) -> tensor<32x64xf32> {
      %0 = vector.transfer_write %arg0, %arg1[%arg2, %arg2] {in_bounds = [true, true]} : vector<8x16xf32>, tensor<32x64xf32>
      gpu.return %0 : tensor<32x64xf32>
    }
  }
}

// -----
module {
  gpu.module @xevm_module {
    gpu.func @no_store_non_unit_inner_stride(%arg0: vector<8xf32>, %arg1: memref<32xf32, strided<[?], offset: ?>>, %arg2: index) {
      vector.transfer_write %arg0, %arg1[%arg2] {in_bounds = [true]} : vector<8xf32>, memref<32xf32, strided<[?], offset: ?>>
      gpu.return
    }
  }
}

// -----
#map = affine_map<(d0, d1, d2) -> (d0, d2)>
module {
  gpu.module @xevm_module {
    gpu.func @no_store_unsupported_map(%arg0: vector<8x16xf32>, %arg1: memref<16x32x64xf32>, %arg2: index) {
      vector.transfer_write %arg0, %arg1[%arg2, %arg2, %arg2] {in_bounds = [true, true], permutation_map = #map} : vector<8x16xf32>, memref<16x32x64xf32>
      gpu.return
    }
  }
}

// -----
module {
  gpu.module @xevm_module {
    gpu.func @no_store_out_of_bounds_1D_vector(%arg0: vector<8xf32>, %arg1: memref<8x16x32xf32>, %arg2: index) {
      vector.transfer_write %arg0, %arg1[%arg2, %arg2, %arg2] : vector<8xf32>, memref<8x16x32xf32>
      gpu.return
    }
  }
}

// -----
module {
  gpu.module @xevm_module {
    gpu.func @store_to_subview(%arg0: vector<8xf16>, %arg1: memref<4096x4096xf16>, %arg2: index, %arg3: index) {
      %subview = memref.subview %arg1[%arg2, %arg3] [256, 256] [1, 1] : memref<4096x4096xf16> to memref<256x256xf16, strided<[4096, 1], offset: ?>>
      vector.transfer_write %arg0, %subview[%arg3, %arg3] {in_bounds = [true]} : vector<8xf16>, memref<256x256xf16, strided<[4096, 1], offset: ?>>
      gpu.return
    }
  }
}

// -----
module {
  gpu.module @xevm_module {
    gpu.func @store_2D_vector_addrspace3(%arg0: vector<8x16xf32>, %arg1: memref<16x32xf32, 3>, %arg2: index) {
      vector.transfer_write %arg0, %arg1[%arg2, %arg2] {in_bounds = [true, true]} : vector<8x16xf32>, memref<16x32xf32, 3>
      gpu.return
    }
  }
}

// -----
module {
  gpu.module @xevm_module {
    gpu.func @store_1D_vector_addrspace3(%arg0: vector<8xf32>, %arg1: memref<32xf32, 3>, %arg2: index) {
      vector.transfer_write %arg0, %arg1[%arg2] {in_bounds = [true]} : vector<8xf32>, memref<32xf32, 3>
      gpu.return
    }
  }
}

// -----
module {
  gpu.module @xevm_module {
    gpu.func @store_0D_vector_unsupported(%arg0: vector<f32>, %arg1: memref<3xf32>, %arg2: index) {
      vector.transfer_write %arg0, %arg1[%arg2] : vector<f32>, memref<3xf32>
      gpu.return
    }
  }
}

