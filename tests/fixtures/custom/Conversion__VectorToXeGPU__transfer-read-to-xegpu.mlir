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
#map = affine_map<(d0, d1, d2) -> (d2, d1)>
module {
  gpu.module @xevm_module {
    gpu.func @load_transpose_3d_memref(%arg0: memref<32x64x128xf32>, %arg1: index, %arg2: index, %arg3: index) -> vector<8x16xf32> {
      %cst = arith.constant 0.000000e+00 : f32
      %0 = vector.transfer_read %arg0[%arg1, %arg2, %arg3], %cst {in_bounds = [true, true], permutation_map = #map} : memref<32x64x128xf32>, vector<8x16xf32>
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
module {
  gpu.module @xevm_module {
    gpu.func @load_8D_vector(%arg0: memref<2x2x2x2x2x2x2x2xf32>, %arg1: index) -> vector<2x2x2x2x2x2x2x2xf32> {
      %cst = arith.constant 0.000000e+00 : f32
      %0 = vector.transfer_read %arg0[%arg1, %arg1, %arg1, %arg1, %arg1, %arg1, %arg1, %arg1], %cst {in_bounds = [true, true, true, true, true, true, true, true]} : memref<2x2x2x2x2x2x2x2xf32>, vector<2x2x2x2x2x2x2x2xf32>
      gpu.return %0 : vector<2x2x2x2x2x2x2x2xf32>
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

// -----
module {
  gpu.module @xevm_module {
    gpu.func @load_2D_vector_addrspace3(%arg0: memref<16x32xf32, 3>, %arg1: index) -> vector<8x16xf32> {
      %cst = arith.constant 0.000000e+00 : f32
      %0 = vector.transfer_read %arg0[%arg1, %arg1], %cst {in_bounds = [true, true]} : memref<16x32xf32, 3>, vector<8x16xf32>
      gpu.return %0 : vector<8x16xf32>
    }
  }
}

// -----
module {
  gpu.module @xevm_module {
    gpu.func @load_1D_vector_addrspace3(%arg0: memref<32xf32, 3>, %arg1: index) -> vector<8xf32> {
      %cst = arith.constant 0.000000e+00 : f32
      %0 = vector.transfer_read %arg0[%arg1], %cst {in_bounds = [true]} : memref<32xf32, 3>, vector<8xf32>
      gpu.return %0 : vector<8xf32>
    }
  }
}

// -----
module {
  gpu.module @xevm_module {
    gpu.func @load_2D_vector_alloca_promoted_to_slm(%arg0: index) -> vector<8x16xf32> {
      %alloca = memref.alloca() : memref<16x32xf32>
      %cst = arith.constant 0.000000e+00 : f32
      %0 = vector.transfer_read %alloca[%arg0, %arg0], %cst {in_bounds = [true, true]} : memref<16x32xf32>, vector<8x16xf32>
      gpu.return %0 : vector<8x16xf32>
    }
  }
}

// -----
module {
  gpu.module @xevm_module {
    gpu.func @load_1D_vector_alloca_promoted_to_slm(%arg0: index) -> vector<8xf32> {
      %alloca = memref.alloca() : memref<16xf32>
      %cst = arith.constant 0.000000e+00 : f32
      %0 = vector.transfer_read %alloca[%arg0], %cst {in_bounds = [true]} : memref<16xf32>, vector<8xf32>
      gpu.return %0 : vector<8xf32>
    }
  }
}

// -----
module {
  gpu.module @xevm_module {
    gpu.func @load_0D_memref_unsupported(%arg0: memref<f16>) -> vector<f16> {
      %cst = arith.constant 0.000000e+00 : f16
      %0 = vector.transfer_read %arg0[], %cst : memref<f16>, vector<f16>
      gpu.return %0 : vector<f16>
    }
  }
}

// -----
module {
  gpu.module @xevm_module {
    gpu.func @load_0D_vector_unsupported(%arg0: memref<3xf32>, %arg1: index) -> vector<f32> {
      %cst = arith.constant 0.000000e+00 : f32
      %0 = vector.transfer_read %arg0[%arg1], %cst : memref<3xf32>, vector<f32>
      gpu.return %0 : vector<f32>
    }
  }
}

// -----
#map = affine_map<()[s0] -> (s0 * 16)>
#map1 = affine_map<()[s0] -> (s0 * 8)>
module {
  gpu.module @xevm_module {
    gpu.func @transpose_1x1024x24x64(%arg0: memref<1x1024x24x64xf16>, %arg1: memref<1x24x1024x64xf16>) kernel attributes {known_block_size = array<i32: 256, 1, 1>} {
      %0 = ub.poison : f16
      %c0 = arith.constant 0 : index
      %block_id_x = gpu.block_id x
      %block_id_y = gpu.block_id y
      %block_id_z = gpu.block_id z
      %1 = affine.apply #map()[%block_id_y]
      %2 = affine.apply #map1()[%block_id_z]
      %3 = vector.transfer_read %arg0[%c0, %1, %block_id_x, %2], %0 {in_bounds = [true, true, true, true]} : memref<1x1024x24x64xf16>, vector<1x16x1x8xf16>
      %4 = vector.transpose %3, [0, 2, 1, 3] : vector<1x16x1x8xf16> to vector<1x1x16x8xf16>
      vector.transfer_write %4, %arg1[%c0, %block_id_x, %1, %2] {in_bounds = [true, true, true, true]} : vector<1x1x16x8xf16>, memref<1x24x1024x64xf16>
      gpu.return
    }
  }
}

