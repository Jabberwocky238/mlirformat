module {
  gpu.module @xevm_module {
    gpu.func @load_1D_vector(%arg0: memref<8x16x32xf32>, %arg1: index) -> vector<8xf32> {
      %cst = arith.constant 0.000000e+00 : f32
      %0 = vector.transfer_read %arg0[%arg1, %arg1, %arg1], %cst {in_bounds = [true]} : memref<8x16x32xf32>, vector<8xf32>
      gpu.return %0 : vector<8xf32>
    }
  }
}

// -----
module {
  gpu.module @xevm_module {
    gpu.func @load_2D_vector(%arg0: memref<8x16x32xf32>, %arg1: index) -> vector<8x16xf32> {
      %cst = arith.constant 0.000000e+00 : f32
      %0 = vector.transfer_read %arg0[%arg1, %arg1, %arg1], %cst {in_bounds = [true, true]} : memref<8x16x32xf32>, vector<8x16xf32>
      gpu.return %0 : vector<8x16xf32>
    }
  }
}

// -----
module {
  gpu.module @xevm_module {
    gpu.func @load_zero_pad_out_of_bounds(%arg0: memref<32x64xf32>, %arg1: index) -> vector<8x16xf32> {
      %cst = arith.constant 0.000000e+00 : f32
      %0 = vector.transfer_read %arg0[%arg1, %arg1], %cst {in_bounds = [false, true]} : memref<32x64xf32>, vector<8x16xf32>
      gpu.return %0 : vector<8x16xf32>
    }
  }
}

// -----
#map = affine_map<(d0, d1) -> (d1, d0)>
module {
  gpu.module @xevm_module {
    gpu.func @load_transposed(%arg0: memref<32x64xf32>, %arg1: index, %arg2: index) -> vector<8x16xf32> {
      %cst = arith.constant 0.000000e+00 : f32
      %0 = vector.transfer_read %arg0[%arg1, %arg2], %cst {in_bounds = [true, true], permutation_map = #map} : memref<32x64xf32>, vector<8x16xf32>
      gpu.return %0 : vector<8x16xf32>
    }
  }
}

// -----
module {
  gpu.module @xevm_module {
    gpu.func @load_dynamic_source(%arg0: memref<?x?x?xf32>, %arg1: index, %arg2: index, %arg3: index) -> vector<8x16xf32> {
      %cst = arith.constant 0.000000e+00 : f32
      %0 = vector.transfer_read %arg0[%arg1, %arg2, %arg3], %cst {in_bounds = [true, true]} : memref<?x?x?xf32>, vector<8x16xf32>
      gpu.return %0 : vector<8x16xf32>
    }
  }
}

// -----
module {
  gpu.module @xevm_module {
    gpu.func @load_dynamic_source2(%arg0: memref<?x8x16xf32>, %arg1: index, %arg2: index, %arg3: index) -> vector<8x16xf32> {
      %cst = arith.constant 0.000000e+00 : f32
      %0 = vector.transfer_read %arg0[%arg1, %arg2, %arg3], %cst {in_bounds = [true, true]} : memref<?x8x16xf32>, vector<8x16xf32>
      gpu.return %0 : vector<8x16xf32>
    }
  }
}

// -----
module {
  gpu.module @xevm_module {
    gpu.func @load_dynamic_source3(%arg0: memref<?x?x?x?x?xf32>, %arg1: index, %arg2: index, %arg3: index, %arg4: index, %arg5: index) -> vector<2x4x8x16xf32> {
      %cst = arith.constant 0.000000e+00 : f32
      %0 = vector.transfer_read %arg0[%arg1, %arg2, %arg3, %arg4, %arg5], %cst {in_bounds = [true, true, true, true]} : memref<?x?x?x?x?xf32>, vector<2x4x8x16xf32>
      gpu.return %0 : vector<2x4x8x16xf32>
    }
  }
}

// -----
module {
  gpu.module @xevm_module {
    gpu.func @load_high_dim_vector(%arg0: memref<16x32x64xf32>, %arg1: index, %arg2: index) -> vector<8x16x32xf32> {
      %cst = arith.constant 0.000000e+00 : f32
      %0 = vector.transfer_read %arg0[%arg1, %arg2, %arg1], %cst {in_bounds = [true, true, true]} : memref<16x32x64xf32>, vector<8x16x32xf32>
      gpu.return %0 : vector<8x16x32xf32>
    }
  }
}

// -----
#map = affine_map<(d0, d1) -> (d1, d0)>
module {
  gpu.module @xevm_module {
    gpu.func @load_transpose_f16(%arg0: memref<32x64xf16>, %arg1: index) -> vector<8x16xf16> {
      %cst = arith.constant 0.000000e+00 : f16
      %0 = vector.transfer_read %arg0[%arg1, %arg1], %cst {in_bounds = [true, true], permutation_map = #map} : memref<32x64xf16>, vector<8x16xf16>
      gpu.return %0 : vector<8x16xf16>
    }
  }
}

// -----
module {
  gpu.module @xevm_module {
    gpu.func @no_load_out_of_bounds_non_zero_pad(%arg0: memref<32x64xf32>, %arg1: index, %arg2: index, %arg3: f32) -> (vector<8x16xf32>, vector<8x16xf32>) {
      %cst = arith.constant 1.000000e+00 : f32
      %0 = vector.transfer_read %arg0[%arg1, %arg2], %cst {in_bounds = [true, false]} : memref<32x64xf32>, vector<8x16xf32>
      %1 = vector.transfer_read %arg0[%arg2, %arg1], %arg3 {in_bounds = [false, true]} : memref<32x64xf32>, vector<8x16xf32>
      gpu.return %0, %1 : vector<8x16xf32>, vector<8x16xf32>
    }
  }
}

// -----
module {
  gpu.module @xevm_module {
    gpu.func @no_load_out_of_bounds_1D_vector(%arg0: memref<8x16x32xf32>, %arg1: index) -> vector<8xf32> {
      %cst = arith.constant 0.000000e+00 : f32
      %0 = vector.transfer_read %arg0[%arg1, %arg1, %arg1], %cst : memref<8x16x32xf32>, vector<8xf32>
      gpu.return %0 : vector<8xf32>
    }
  }
}

// -----
module {
  gpu.module @xevm_module {
    gpu.func @no_load_masked(%arg0: memref<4xf32>, %arg1: index) -> vector<4xf32> {
      %cst = arith.constant 0.000000e+00 : f32
      %cst_0 = arith.constant dense<[false, true, false, true]> : vector<4xi1>
      %0 = vector.transfer_read %arg0[%arg1], %cst, %cst_0 {in_bounds = [true]} : memref<4xf32>, vector<4xf32>
      gpu.return %0 : vector<4xf32>
    }
  }
}

// -----
module {
  gpu.module @xevm_module {
    gpu.func @no_load_tensor(%arg0: tensor<32x64xf32>, %arg1: index, %arg2: index) -> vector<8x16xf32> {
      %cst = arith.constant 0.000000e+00 : f32
      %0 = vector.transfer_read %arg0[%arg1, %arg2], %cst {in_bounds = [true, true]} : tensor<32x64xf32>, vector<8x16xf32>
      gpu.return %0 : vector<8x16xf32>
    }
  }
}

// -----
module {
  gpu.module @xevm_module {
    gpu.func @no_load_non_unit_inner_stride(%arg0: memref<32xf32, strided<[?], offset: ?>>, %arg1: index) -> vector<8xf32> {
      %cst = arith.constant 0.000000e+00 : f32
      %0 = vector.transfer_read %arg0[%arg1], %cst {in_bounds = [true]} : memref<32xf32, strided<[?], offset: ?>>, vector<8xf32>
      gpu.return %0 : vector<8xf32>
    }
  }
}

// -----
#map = affine_map<(d0, d1, d2) -> (d0, d2)>
module {
  gpu.module @xevm_module {
    gpu.func @no_load_unsupported_map(%arg0: memref<16x32x64xf32>, %arg1: index) -> vector<8x16xf32> {
      %cst = arith.constant 0.000000e+00 : f32
      %0 = vector.transfer_read %arg0[%arg1, %arg1, %arg1], %cst {in_bounds = [true, true], permutation_map = #map} : memref<16x32x64xf32>, vector<8x16xf32>
      gpu.return %0 : vector<8x16xf32>
    }
  }
}

// -----
module {
  gpu.module @xevm_module {
    gpu.func @load_from_subview_1D(%arg0: memref<4096x4096xf16>, %arg1: index, %arg2: index) -> vector<8xf16> {
      %cst = arith.constant 0.000000e+00 : f16
      %subview = memref.subview %arg0[%arg1, %arg2] [256, 256] [1, 1] : memref<4096x4096xf16> to memref<256x256xf16, strided<[4096, 1], offset: ?>>
      %0 = vector.transfer_read %subview[%arg2, %arg2], %cst {in_bounds = [true]} : memref<256x256xf16, strided<[4096, 1], offset: ?>>, vector<8xf16>
      gpu.return %0 : vector<8xf16>
    }
  }
}

// -----
module {
  gpu.module @xevm_module {
    gpu.func @load_from_subview_2D(%arg0: memref<4096x4096xf16>, %arg1: index, %arg2: index) -> vector<8x16xf16> {
      %cst = arith.constant 0.000000e+00 : f16
      %subview = memref.subview %arg0[%arg1, %arg2] [256, 256] [1, 1] : memref<4096x4096xf16> to memref<256x256xf16, strided<[4096, 1], offset: ?>>
      %0 = vector.transfer_read %subview[%arg2, %arg2], %cst {in_bounds = [true, true]} : memref<256x256xf16, strided<[4096, 1], offset: ?>>, vector<8x16xf16>
      gpu.return %0 : vector<8x16xf16>
    }
  }
}

