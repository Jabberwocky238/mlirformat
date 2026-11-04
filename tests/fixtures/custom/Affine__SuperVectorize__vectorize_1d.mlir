module {
  func.func @vec1d_1(%arg0: memref<?x?xf32>, %arg1: memref<?x?x?xf32>) {
    %c0 = arith.constant 0 : index
    %c1 = arith.constant 1 : index
    %c2 = arith.constant 2 : index
    %dim = memref.dim %arg0, %c0 : memref<?x?xf32>
    %dim_0 = memref.dim %arg0, %c1 : memref<?x?xf32>
    %dim_1 = memref.dim %arg1, %c2 : memref<?x?x?xf32>
    affine.for %arg2 = 0 to %dim {
      %0 = affine.load %arg0[%c0, %c0] : memref<?x?xf32>
    }
    return
  }
}

// -----
module {
  func.func @vec1d_2(%arg0: memref<?x?xf32>, %arg1: memref<?x?x?xf32>) {
    %c0 = arith.constant 0 : index
    %c1 = arith.constant 1 : index
    %c2 = arith.constant 2 : index
    %dim = memref.dim %arg0, %c0 : memref<?x?xf32>
    %dim_0 = memref.dim %arg0, %c1 : memref<?x?xf32>
    %dim_1 = memref.dim %arg1, %c2 : memref<?x?x?xf32>
    affine.for %arg2 = 0 to %dim {
      %0 = affine.load %arg0[%c0, %arg2] : memref<?x?xf32>
    }
    return
  }
}

// -----
module {
  func.func @vec1d_3(%arg0: memref<?x?xf32>, %arg1: memref<?x?x?xf32>) {
    %c0 = arith.constant 0 : index
    %c1 = arith.constant 1 : index
    %c2 = arith.constant 2 : index
    %dim = memref.dim %arg0, %c0 : memref<?x?xf32>
    %dim_0 = memref.dim %arg0, %c1 : memref<?x?xf32>
    %dim_1 = memref.dim %arg1, %c2 : memref<?x?x?xf32>
    affine.for %arg2 = 0 to %dim {
      affine.for %arg3 = 0 to %dim_0 {
        %0 = affine.load %arg0[%arg3, %arg3 + %arg2] : memref<?x?xf32>
      }
    }
    return
  }
}

// -----
module {
  func.func @vector_add_2d(%arg0: index, %arg1: index) -> f32 {
    %alloc = memref.alloc(%arg0, %arg1) : memref<?x?xf32>
    %alloc_0 = memref.alloc(%arg0, %arg1) : memref<?x?xf32>
    %alloc_1 = memref.alloc(%arg0, %arg1) : memref<?x?xf32>
    %cst = arith.constant 1.000000e+00 : f32
    %cst_2 = arith.constant 2.000000e+00 : f32
    affine.for %arg2 = 0 to %arg0 {
      affine.for %arg3 = 0 to %arg1 {
        affine.store %cst, %alloc[%arg2, %arg3] : memref<?x?xf32>
      }
    }
    affine.for %arg2 = 0 to %arg0 {
      affine.for %arg3 = 0 to %arg1 {
        affine.store %cst_2, %alloc_0[%arg2, %arg3] : memref<?x?xf32>
      }
    }
    affine.for %arg2 = 0 to %arg0 {
      affine.for %arg3 = 0 to %arg1 {
        %1 = affine.load %alloc[%arg2, %arg3] : memref<?x?xf32>
        %2 = affine.load %alloc_0[%arg2, %arg3] : memref<?x?xf32>
        %3 = arith.addf %1, %2 : f32
        %4 = arith.addf %3, %cst : f32
        %5 = arith.addf %3, %cst_2 : f32
        %6 = arith.addf %5, %4 : f32
        affine.store %6, %alloc_1[%arg2, %arg3] : memref<?x?xf32>
      }
    }
    %c7 = arith.constant 7 : index
    %c42 = arith.constant 42 : index
    %0 = affine.load %alloc_1[%c7, %c42] : memref<?x?xf32>
    return %0 : f32
  }
}

// -----
module {
  func.func @vec_constant_with_two_users(%arg0: index, %arg1: index) -> (f32, f32) {
    %alloc = memref.alloc(%arg0, %arg1) : memref<?x?xf32>
    %alloc_0 = memref.alloc(%arg0) : memref<?xf32>
    %cst = arith.constant 1.000000e+00 : f32
    affine.for %arg2 = 0 to %arg0 {
      affine.for %arg3 = 0 to %arg1 {
        affine.store %cst, %alloc[%arg3, %arg2] : memref<?x?xf32>
      }
      affine.store %cst, %alloc_0[%arg2] : memref<?xf32>
    }
    %c12 = arith.constant 12 : index
    %0 = affine.load %alloc[%c12, %c12] : memref<?x?xf32>
    %1 = affine.load %alloc_0[%c12] : memref<?xf32>
    return %0, %1 : f32, f32
  }
}

// -----
module {
  func.func @vec_block_arg(%arg0: memref<32x512xi32>) {
    affine.for %arg1 = 0 to 512 {
      affine.for %arg2 = 0 to 32 {
        %0 = arith.index_cast %arg2 : index to i32
        affine.store %0, %arg0[%arg2, %arg1] : memref<32x512xi32>
      }
    }
    return
  }
}

// -----
module {
  func.func @vec_block_arg_2(%arg0: memref<?x512xindex>) {
    %c0 = arith.constant 0 : index
    %dim = memref.dim %arg0, %c0 : memref<?x512xindex>
    affine.for %arg1 = 0 to %dim {
      affine.for %arg2 = 0 to 512 {
        affine.for %arg3 = 0 to 2 {
          %0 = affine.load %arg0[%arg1 * 2 + %arg3 - 1, %arg2] : memref<?x512xindex>
          %1 = arith.muli %arg1, %0 : index
          %2 = arith.addi %1, %arg3 : index
        }
      }
    }
    return
  }
}

// -----
module {
  func.func @vec_rejected_1(%arg0: memref<?x?xf32>, %arg1: memref<?x?x?xf32>) {
    %c0 = arith.constant 0 : index
    %c1 = arith.constant 1 : index
    %c2 = arith.constant 2 : index
    %dim = memref.dim %arg0, %c0 : memref<?x?xf32>
    %dim_0 = memref.dim %arg0, %c1 : memref<?x?xf32>
    %dim_1 = memref.dim %arg1, %c2 : memref<?x?x?xf32>
    affine.for %arg2 = 0 to %dim {
      %0 = affine.load %arg0[%arg2, %arg2] : memref<?x?xf32>
    }
    return
  }
}

// -----
module {
  func.func @vec_rejected_2(%arg0: memref<?x?xf32>, %arg1: memref<?x?x?xf32>) {
    %c0 = arith.constant 0 : index
    %c1 = arith.constant 1 : index
    %c2 = arith.constant 2 : index
    %dim = memref.dim %arg0, %c0 : memref<?x?xf32>
    %dim_0 = memref.dim %arg0, %c1 : memref<?x?xf32>
    %dim_1 = memref.dim %arg1, %c2 : memref<?x?x?xf32>
    affine.for %arg2 = 0 to %dim {
      %0 = affine.load %arg0[%arg2, %c0] : memref<?x?xf32>
    }
    return
  }
}

// -----
module {
  func.func @vec_rejected_3(%arg0: memref<?x?xf32>, %arg1: memref<?x?x?xf32>) {
    %c0 = arith.constant 0 : index
    %c1 = arith.constant 1 : index
    %c2 = arith.constant 2 : index
    %dim = memref.dim %arg0, %c0 : memref<?x?xf32>
    %dim_0 = memref.dim %arg0, %c1 : memref<?x?xf32>
    %dim_1 = memref.dim %arg1, %c2 : memref<?x?x?xf32>
    affine.for %arg2 = 0 to %dim {
      affine.for %arg3 = 0 to %dim_0 {
        %0 = affine.load %arg0[%arg3, %arg2] : memref<?x?xf32>
      }
    }
    return
  }
}

// -----
module {
  func.func @vec_rejected_4(%arg0: memref<?x?xf32>, %arg1: memref<?x?x?xf32>) {
    %c0 = arith.constant 0 : index
    %c1 = arith.constant 1 : index
    %c2 = arith.constant 2 : index
    %dim = memref.dim %arg0, %c0 : memref<?x?xf32>
    %dim_0 = memref.dim %arg0, %c1 : memref<?x?xf32>
    %dim_1 = memref.dim %arg1, %c2 : memref<?x?x?xf32>
    affine.for %arg2 = 0 to %dim {
      affine.for %arg3 = 0 to %dim_0 {
        %0 = affine.load %arg0[%arg2 + %arg3, %arg2] : memref<?x?xf32>
      }
    }
    return
  }
}

// -----
module {
  func.func @vec_rejected_5(%arg0: memref<?x?xf32>, %arg1: memref<?x?x?xf32>) {
    %c0 = arith.constant 0 : index
    %c1 = arith.constant 1 : index
    %c2 = arith.constant 2 : index
    %dim = memref.dim %arg0, %c0 : memref<?x?xf32>
    %dim_0 = memref.dim %arg0, %c1 : memref<?x?xf32>
    %dim_1 = memref.dim %arg1, %c2 : memref<?x?x?xf32>
    affine.for %arg2 = 0 to %dim {
      affine.for %arg3 = 0 to %dim_0 {
        %0 = affine.load %arg0[%arg2, %arg3] : memref<?x?xf32>
        affine.store %0, %arg0[%arg3, %arg2] : memref<?x?xf32>
      }
    }
    return
  }
}

// -----
module {
  func.func @vec_rejected_6(%arg0: memref<?x?xf32>, %arg1: memref<?x?x?xf32>) {
    %c0 = arith.constant 0 : index
    %c1 = arith.constant 1 : index
    %c2 = arith.constant 2 : index
    %dim = memref.dim %arg0, %c0 : memref<?x?xf32>
    %dim_0 = memref.dim %arg0, %c1 : memref<?x?xf32>
    %dim_1 = memref.dim %arg1, %c2 : memref<?x?x?xf32>
    affine.for %arg2 = 0 to %dim {
      affine.for %arg3 = 0 to %dim_0 {
        affine.for %arg4 = 0 to %dim_1 {
          %0 = affine.load %arg1[%arg3, %arg3 + %arg2, %arg2 + %arg4] : memref<?x?x?xf32>
        }
      }
    }
    return
  }
}

// -----
module {
  func.func @vec_rejected_7(%arg0: memref<?x?xf32>, %arg1: memref<?x?x?xf32>) {
    %c0 = arith.constant 0 : index
    %c1 = arith.constant 1 : index
    %c2 = arith.constant 2 : index
    %dim = memref.dim %arg0, %c0 : memref<?x?xf32>
    %dim_0 = memref.dim %arg0, %c1 : memref<?x?xf32>
    %dim_1 = memref.dim %arg1, %c2 : memref<?x?x?xf32>
    affine.for %arg2 = 0 to %dim {
      %alloc = memref.alloc(%dim) : memref<?xvector<2xf32>>
      %0 = affine.load %alloc[%arg2] : memref<?xvector<2xf32>>
    }
    return
  }
}

// -----
module {
  func.func @vec_rejected_8(%arg0: memref<?x?xf32>, %arg1: memref<?x?x?xf32>) {
    %c0 = arith.constant 0 : index
    %c1 = arith.constant 1 : index
    %c2 = arith.constant 2 : index
    %dim = memref.dim %arg0, %c0 : memref<?x?xf32>
    %dim_0 = memref.dim %arg0, %c1 : memref<?x?xf32>
    %dim_1 = memref.dim %arg1, %c2 : memref<?x?x?xf32>
    affine.for %arg2 = 0 to %dim {
      affine.for %arg3 = 0 to %dim {
        %0 = affine.load %arg0[%c0, %c0] : memref<?x?xf32>
      }
    }
    return
  }
}

// -----
module {
  func.func @vec_rejected_9(%arg0: memref<?x?xf32>, %arg1: memref<?x?x?xf32>) {
    %c0 = arith.constant 0 : index
    %c1 = arith.constant 1 : index
    %c2 = arith.constant 2 : index
    %dim = memref.dim %arg0, %c0 : memref<?x?xf32>
    %dim_0 = memref.dim %arg0, %c1 : memref<?x?xf32>
    %dim_1 = memref.dim %arg1, %c2 : memref<?x?x?xf32>
    affine.for %arg2 = 0 to %dim {
      affine.for %arg3 = 0 to %dim {
        %0 = affine.load %arg0[%c0, %c0] : memref<?x?xf32>
      }
    }
    return
  }
}

// -----
#set = affine_set<(d0) : (d0 >= 0)>
module {
  func.func @vec_rejected_10(%arg0: memref<?x?xf32>, %arg1: memref<?x?x?xf32>) {
    %c0 = arith.constant 0 : index
    %c1 = arith.constant 1 : index
    %c2 = arith.constant 2 : index
    %dim = memref.dim %arg0, %c0 : memref<?x?xf32>
    %dim_0 = memref.dim %arg0, %c1 : memref<?x?xf32>
    %dim_1 = memref.dim %arg1, %c2 : memref<?x?x?xf32>
    affine.for %arg2 = 0 to %dim {
      affine.if #set(%arg2) {
        %0 = affine.load %arg0[%c0, %c0] : memref<?x?xf32>
      }
    }
    return
  }
}

// -----
module {
  func.func @vec_rejected_11(%arg0: memref<?x?xf32>, %arg1: memref<?x?x?xf32>) {
    %c0 = arith.constant 0 : index
    %c1 = arith.constant 1 : index
    %c2 = arith.constant 2 : index
    %dim = memref.dim %arg0, %c0 : memref<?x?xf32>
    %dim_0 = memref.dim %arg0, %c1 : memref<?x?xf32>
    %dim_1 = memref.dim %arg1, %c2 : memref<?x?x?xf32>
    affine.for %arg2 = 0 to %dim {
      affine.for %arg3 = 0 to %dim_0 {
        %0 = affine.load %arg0[%arg3, %arg2] : memref<?x?xf32>
        affine.store %0, %arg0[%arg2, %arg3] : memref<?x?xf32>
      }
    }
    return
  }
}

// -----
module {
  func.func @vec_rejected_sequential(%arg0: memref<?xf32>) {
    %c0 = arith.constant 0 : index
    %dim = memref.dim %arg0, %c0 : memref<?xf32>
    affine.for %arg1 = 0 to %dim {
      %0 = affine.load %arg0[%arg1] : memref<?xf32>
      affine.store %0, %arg0[%arg1 + 1] : memref<?xf32>
    }
    return
  }
}

// -----
module {
  func.func @vec_no_load_store_ops(%arg0: f32, %arg1: f32) {
    %cst = arith.constant 0.000000e+00 : f32
    affine.for %arg2 = 0 to 128 {
      %0 = arith.addf %arg0, %arg1 : f32
    }
    return
  }
}

// -----
module {
  func.func @vec_rejected_unsupported_block_arg(%arg0: memref<512xi32>) {
    affine.for %arg1 = 0 to 512 {
      %0 = arith.index_cast %arg1 : index to i32
      affine.store %0, %arg0[%arg1] : memref<512xi32>
    }
    return
  }
}

// -----
module {
  func.func @vec_non_vecdim_reduction(%arg0: memref<128x256xf32>, %arg1: memref<256xf32>) {
    %cst = arith.constant 0.000000e+00 : f32
    affine.for %arg2 = 0 to 256 {
      %0 = affine.for %arg3 = 0 to 128 iter_args(%arg4 = %cst) -> (f32) {
        %1 = affine.load %arg0[%arg3, %arg2] : memref<128x256xf32>
        %2 = arith.addf %arg4, %1 : f32
        affine.yield %2 : f32
      }
      affine.store %0, %arg1[%arg2] : memref<256xf32>
    }
    return
  }
}

// -----
module {
  func.func @vec_non_vecdim_reductions(%arg0: memref<128x256xf32>, %arg1: memref<128x256xi32>, %arg2: memref<256xf32>, %arg3: memref<256xi32>) {
    %cst = arith.constant 0.000000e+00 : f32
    %c1_i32 = arith.constant 1 : i32
    affine.for %arg4 = 0 to 256 {
      %0:2 = affine.for %arg5 = 0 to 128 iter_args(%arg6 = %cst, %arg7 = %c1_i32) -> (f32, i32) {
        %1 = affine.load %arg0[%arg5, %arg4] : memref<128x256xf32>
        %2 = arith.addf %arg6, %1 : f32
        %3 = affine.load %arg1[%arg5, %arg4] : memref<128x256xi32>
        %4 = arith.muli %arg7, %3 : i32
        affine.yield %2, %4 : f32, i32
      }
      affine.store %0#0, %arg2[%arg4] : memref<256xf32>
      affine.store %0#1, %arg3[%arg4] : memref<256xi32>
    }
    return
  }
}

// -----
module {
  func.func @vec_no_vecdim_last_value(%arg0: memref<128x256xf32>, %arg1: memref<256xf32>) {
    %cst = arith.constant 0.000000e+00 : f32
    affine.for %arg2 = 0 to 256 {
      %0 = affine.for %arg3 = 0 to 128 iter_args(%arg4 = %cst) -> (f32) {
        %1 = affine.load %arg0[%arg3, %arg2] : memref<128x256xf32>
        affine.yield %1 : f32
      }
      affine.store %0, %arg1[%arg2] : memref<256xf32>
    }
    return
  }
}

// -----
module {
  func.func @vec_vecdim_reduction_rejected(%arg0: memref<256x512xf32>, %arg1: memref<256xf32>) {
    %cst = arith.constant 0.000000e+00 : f32
    affine.for %arg2 = 0 to 256 {
      %0 = affine.for %arg3 = 0 to 512 iter_args(%arg4 = %cst) -> (f32) {
        %1 = affine.load %arg0[%arg2, %arg3] : memref<256x512xf32>
        %2 = arith.addf %arg4, %1 : f32
        affine.yield %2 : f32
      }
      affine.store %0, %arg1[%arg2] : memref<256xf32>
    }
    return
  }
}

// -----
module {
  func.func @vec_non_scalar_type() {
    %idx0 = index.constant 0
    %alloc = memref.alloc() : memref<1xi64>
    affine.for %arg0 = 0 to 78 {
      %dim = memref.dim %alloc, %idx0 : memref<1xi64>
    }
    return
  }
}

