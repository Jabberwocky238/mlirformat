module {
  func.func @vecdim_reduction(%arg0: memref<256x512xf32>, %arg1: memref<256xf32>) {
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
  func.func @vecdim_reduction_minf(%arg0: memref<256x512xf32>, %arg1: memref<256xf32>) {
    %cst = arith.constant 0x7F800000 : f32
    affine.for %arg2 = 0 to 256 {
      %0 = affine.for %arg3 = 0 to 512 iter_args(%arg4 = %cst) -> (f32) {
        %1 = affine.load %arg0[%arg2, %arg3] : memref<256x512xf32>
        %2 = arith.minimumf %arg4, %1 : f32
        affine.yield %2 : f32
      }
      affine.store %0, %arg1[%arg2] : memref<256xf32>
    }
    return
  }
}

// -----
module {
  func.func @vecdim_reduction_maxf(%arg0: memref<256x512xf32>, %arg1: memref<256xf32>) {
    %cst = arith.constant 0xFF800000 : f32
    affine.for %arg2 = 0 to 256 {
      %0 = affine.for %arg3 = 0 to 512 iter_args(%arg4 = %cst) -> (f32) {
        %1 = affine.load %arg0[%arg2, %arg3] : memref<256x512xf32>
        %2 = arith.maximumf %arg4, %1 : f32
        affine.yield %2 : f32
      }
      affine.store %0, %arg1[%arg2] : memref<256xf32>
    }
    return
  }
}

// -----
module {
  func.func @vecdim_reduction_minsi(%arg0: memref<256x512xi32>, %arg1: memref<256xi32>) {
    %c2147483647_i32 = arith.constant 2147483647 : i32
    affine.for %arg2 = 0 to 256 {
      %0 = affine.for %arg3 = 0 to 512 iter_args(%arg4 = %c2147483647_i32) -> (i32) {
        %1 = affine.load %arg0[%arg2, %arg3] : memref<256x512xi32>
        %2 = arith.minsi %arg4, %1 : i32
        affine.yield %2 : i32
      }
      affine.store %0, %arg1[%arg2] : memref<256xi32>
    }
    return
  }
}

// -----
module {
  func.func @vecdim_reduction_maxsi(%arg0: memref<256x512xi32>, %arg1: memref<256xi32>) {
    %c-2147483648_i32 = arith.constant -2147483648 : i32
    affine.for %arg2 = 0 to 256 {
      %0 = affine.for %arg3 = 0 to 512 iter_args(%arg4 = %c-2147483648_i32) -> (i32) {
        %1 = affine.load %arg0[%arg2, %arg3] : memref<256x512xi32>
        %2 = arith.maxsi %arg4, %1 : i32
        affine.yield %2 : i32
      }
      affine.store %0, %arg1[%arg2] : memref<256xi32>
    }
    return
  }
}

// -----
module {
  func.func @vecdim_reduction_minui(%arg0: memref<256x512xi32>, %arg1: memref<256xi32>) {
    %c-1_i32 = arith.constant -1 : i32
    affine.for %arg2 = 0 to 256 {
      %0 = affine.for %arg3 = 0 to 512 iter_args(%arg4 = %c-1_i32) -> (i32) {
        %1 = affine.load %arg0[%arg2, %arg3] : memref<256x512xi32>
        %2 = arith.minui %arg4, %1 : i32
        affine.yield %2 : i32
      }
      affine.store %0, %arg1[%arg2] : memref<256xi32>
    }
    return
  }
}

// -----
module {
  func.func @vecdim_reduction_maxui(%arg0: memref<256x512xi32>, %arg1: memref<256xi32>) {
    %c0_i32 = arith.constant 0 : i32
    affine.for %arg2 = 0 to 256 {
      %0 = affine.for %arg3 = 0 to 512 iter_args(%arg4 = %c0_i32) -> (i32) {
        %1 = affine.load %arg0[%arg2, %arg3] : memref<256x512xi32>
        %2 = arith.maxui %arg4, %1 : i32
        affine.yield %2 : i32
      }
      affine.store %0, %arg1[%arg2] : memref<256xi32>
    }
    return
  }
}

// -----
module {
  func.func @vecdim_reduction_andi(%arg0: memref<256x512xi32>, %arg1: memref<256xi32>) {
    %c-1_i32 = arith.constant -1 : i32
    affine.for %arg2 = 0 to 256 {
      %0 = affine.for %arg3 = 0 to 512 iter_args(%arg4 = %c-1_i32) -> (i32) {
        %1 = affine.load %arg0[%arg2, %arg3] : memref<256x512xi32>
        %2 = arith.andi %arg4, %1 : i32
        affine.yield %2 : i32
      }
      affine.store %0, %arg1[%arg2] : memref<256xi32>
    }
    return
  }
}

// -----
module {
  func.func @vecdim_reduction_ori(%arg0: memref<256x512xi32>, %arg1: memref<256xi32>) {
    %c0_i32 = arith.constant 0 : i32
    affine.for %arg2 = 0 to 256 {
      %0 = affine.for %arg3 = 0 to 512 iter_args(%arg4 = %c0_i32) -> (i32) {
        %1 = affine.load %arg0[%arg2, %arg3] : memref<256x512xi32>
        %2 = arith.ori %arg4, %1 : i32
        affine.yield %2 : i32
      }
      affine.store %0, %arg1[%arg2] : memref<256xi32>
    }
    return
  }
}

// -----
module {
  func.func @vecdim_reduction_xori(%arg0: memref<256x512xi32>, %arg1: memref<256xi32>) {
    %c0_i32 = arith.constant 0 : i32
    affine.for %arg2 = 0 to 256 {
      %0 = affine.for %arg3 = 0 to 512 iter_args(%arg4 = %c0_i32) -> (i32) {
        %1 = affine.load %arg0[%arg2, %arg3] : memref<256x512xi32>
        %2 = arith.xori %arg4, %1 : i32
        affine.yield %2 : i32
      }
      affine.store %0, %arg1[%arg2] : memref<256xi32>
    }
    return
  }
}

// -----
module {
  func.func @vecdim_reduction_minnumf(%arg0: memref<256x512xf32>, %arg1: memref<256xf32>) {
    %cst = arith.constant 0xFF800000 : f32
    affine.for %arg2 = 0 to 256 {
      %0 = affine.for %arg3 = 0 to 512 iter_args(%arg4 = %cst) -> (f32) {
        %1 = affine.load %arg0[%arg2, %arg3] : memref<256x512xf32>
        %2 = arith.minnumf %arg4, %1 : f32
        affine.yield %2 : f32
      }
      affine.store %0, %arg1[%arg2] : memref<256xf32>
    }
    return
  }
}

// -----
module {
  func.func @vecdim_reduction_maxnumf(%arg0: memref<256x512xf32>, %arg1: memref<256xf32>) {
    %cst = arith.constant 0xFF800000 : f32
    affine.for %arg2 = 0 to 256 {
      %0 = affine.for %arg3 = 0 to 512 iter_args(%arg4 = %cst) -> (f32) {
        %1 = affine.load %arg0[%arg2, %arg3] : memref<256x512xf32>
        %2 = arith.maxnumf %arg4, %1 : f32
        affine.yield %2 : f32
      }
      affine.store %0, %arg1[%arg2] : memref<256xf32>
    }
    return
  }
}

// -----
module {
  func.func @vecdim_reduction_comm(%arg0: memref<256x512xf32>, %arg1: memref<256xf32>) {
    %cst = arith.constant 0.000000e+00 : f32
    affine.for %arg2 = 0 to 256 {
      %0 = affine.for %arg3 = 0 to 512 iter_args(%arg4 = %cst) -> (f32) {
        %1 = affine.load %arg0[%arg2, %arg3] : memref<256x512xf32>
        %2 = arith.addf %1, %arg4 : f32
        affine.yield %2 : f32
      }
      affine.store %0, %arg1[%arg2] : memref<256xf32>
    }
    return
  }
}

// -----
module {
  func.func @vecdim_reduction_expsin(%arg0: memref<256x512xf32>, %arg1: memref<256xf32>) {
    %cst = arith.constant 0.000000e+00 : f32
    affine.for %arg2 = 0 to 256 {
      %0 = affine.for %arg3 = 0 to 512 iter_args(%arg4 = %cst) -> (f32) {
        %1 = affine.load %arg0[%arg2, %arg3] : memref<256x512xf32>
        %2 = math.sin %1 : f32
        %3 = math.exp %2 : f32
        %4 = arith.addf %arg4, %3 : f32
        affine.yield %4 : f32
      }
      affine.store %0, %arg1[%arg2] : memref<256xf32>
    }
    return
  }
}

// -----
module {
  func.func @two_vecdim_reductions(%arg0: memref<256x512xf32>, %arg1: memref<256xf32>, %arg2: memref<256xf32>) {
    %cst = arith.constant 1.000000e+00 : f32
    affine.for %arg3 = 0 to 256 {
      %0:2 = affine.for %arg4 = 0 to 512 iter_args(%arg5 = %cst, %arg6 = %cst) -> (f32, f32) {
        %1 = affine.load %arg0[%arg3, %arg4] : memref<256x512xf32>
        %2 = arith.addf %arg5, %1 : f32
        %3 = arith.mulf %arg6, %1 : f32
        affine.yield %2, %3 : f32, f32
      }
      affine.store %0#0, %arg1[%arg3] : memref<256xf32>
      affine.store %0#1, %arg2[%arg3] : memref<256xf32>
    }
    return
  }
}

// -----
module {
  func.func @two_vecdim_reductions_int(%arg0: memref<256x512xi64>, %arg1: memref<256xi64>, %arg2: memref<256xi64>) {
    %c0_i64 = arith.constant 0 : i64
    %c1_i64 = arith.constant 1 : i64
    affine.for %arg3 = 0 to 256 {
      %0:2 = affine.for %arg4 = 0 to 512 iter_args(%arg5 = %c0_i64, %arg6 = %c1_i64) -> (i64, i64) {
        %1 = affine.load %arg0[%arg3, %arg4] : memref<256x512xi64>
        %2 = arith.addi %arg5, %1 : i64
        %3 = arith.muli %arg6, %1 : i64
        affine.yield %2, %3 : i64, i64
      }
      affine.store %0#0, %arg1[%arg3] : memref<256xi64>
      affine.store %0#1, %arg2[%arg3] : memref<256xi64>
    }
    return
  }
}

// -----
module {
  func.func @vecdim_reduction_nested(%arg0: memref<256x512xf32>, %arg1: memref<1xf32>) {
    %cst = arith.constant 0.000000e+00 : f32
    %0 = affine.for %arg2 = 0 to 512 iter_args(%arg3 = %cst) -> (f32) {
      %1 = affine.for %arg4 = 0 to 256 iter_args(%arg5 = %cst) -> (f32) {
        %3 = affine.load %arg0[%arg4, %arg2] : memref<256x512xf32>
        %4 = arith.addf %arg5, %3 : f32
        affine.yield %4 : f32
      }
      %2 = arith.addf %arg3, %1 : f32
      affine.yield %2 : f32
    }
    affine.store %0, %arg1[0] : memref<1xf32>
    return
  }
}

// -----
module {
  func.func @vecdim_partial_sums_1_rejected(%arg0: memref<256x512xf32>, %arg1: memref<256xf32>, %arg2: memref<256xf32>, %arg3: memref<256x512xf32>) {
    %cst = arith.constant 1.000000e+00 : f32
    affine.for %arg4 = 0 to 256 {
      %0:2 = affine.for %arg5 = 0 to 512 iter_args(%arg6 = %cst, %arg7 = %cst) -> (f32, f32) {
        %1 = affine.load %arg0[%arg4, %arg5] : memref<256x512xf32>
        %2 = arith.addf %arg6, %1 : f32
        %3 = arith.mulf %arg7, %1 : f32
        affine.store %2, %arg3[%arg4, %arg5] : memref<256x512xf32>
        affine.yield %2, %3 : f32, f32
      }
      affine.store %0#0, %arg1[%arg4] : memref<256xf32>
      affine.store %0#1, %arg2[%arg4] : memref<256xf32>
    }
    return
  }
}

// -----
module {
  func.func @vecdim_partial_sums_2_rejected(%arg0: memref<256x512xf32>, %arg1: memref<256xf32>, %arg2: memref<256xf32>, %arg3: memref<256x512xf32>) {
    %cst = arith.constant 1.000000e+00 : f32
    affine.for %arg4 = 0 to 256 {
      %0:2 = affine.for %arg5 = 0 to 512 iter_args(%arg6 = %cst, %arg7 = %cst) -> (f32, f32) {
        affine.store %arg6, %arg3[%arg4, %arg5] : memref<256x512xf32>
        %1 = affine.load %arg0[%arg4, %arg5] : memref<256x512xf32>
        %2 = arith.addf %arg6, %1 : f32
        %3 = arith.mulf %arg7, %1 : f32
        affine.yield %2, %3 : f32, f32
      }
      affine.store %0#0, %arg1[%arg4] : memref<256xf32>
      affine.store %0#1, %arg2[%arg4] : memref<256xf32>
    }
    return
  }
}

// -----
module {
  func.func @vecdim_unknown_reduction_rejected(%arg0: memref<256x512xf32>, %arg1: memref<256xf32>) {
    %cst = arith.constant 1.000000e+00 : f32
    %0 = affine.for %arg2 = 0 to 512 iter_args(%arg3 = %cst) -> (f32) {
      %1 = arith.addf %arg3, %arg3 : f32
      affine.yield %1 : f32
    }
    affine.store %0, %arg1[0] : memref<256xf32>
    return
  }
}

// -----
module {
  func.func @vecdim_none_reduction_rejected(%arg0: memref<256x512xf32>, %arg1: memref<256xf32>) {
    %cst = arith.constant 1.000000e+00 : f32
    %0 = affine.for %arg2 = 0 to 512 iter_args(%arg3 = %cst) -> (f32) {
      affine.yield %arg3 : f32
    }
    affine.store %0, %arg1[0] : memref<256xf32>
    return
  }
}

// -----
module {
  func.func @vecdim_reduction_masked(%arg0: memref<256x512xf32>, %arg1: memref<256xf32>) {
    %cst = arith.constant 0.000000e+00 : f32
    affine.for %arg2 = 0 to 256 {
      %0 = affine.for %arg3 = 0 to 500 iter_args(%arg4 = %cst) -> (f32) {
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
  func.func @vecdim_reduction_masked_unknown_ub(%arg0: memref<256x512xf32>, %arg1: memref<256xf32>, %arg2: index) {
    %cst = arith.constant 0.000000e+00 : f32
    affine.for %arg3 = 0 to 256 {
      %0 = affine.for %arg4 = 0 to %arg2 iter_args(%arg5 = %cst) -> (f32) {
        %1 = affine.load %arg0[%arg3, %arg4] : memref<256x512xf32>
        %2 = arith.addf %arg5, %1 : f32
        affine.yield %2 : f32
      }
      affine.store %0, %arg1[%arg3] : memref<256xf32>
    }
    return
  }
}

// -----
module {
  func.func @vecdim_reduction_nonzero_lb(%arg0: memref<256x512xf32>, %arg1: memref<256xf32>) {
    %cst = arith.constant 0.000000e+00 : f32
    affine.for %arg2 = 0 to 256 {
      %0 = affine.for %arg3 = 127 to 511 iter_args(%arg4 = %cst) -> (f32) {
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
  func.func @vecdim_reduction_masked_unknown_lb(%arg0: memref<256x512xf32>, %arg1: memref<256xf32>, %arg2: index) {
    %cst = arith.constant 0.000000e+00 : f32
    affine.for %arg3 = 0 to 256 {
      %0 = affine.for %arg4 = %arg2 to 512 iter_args(%arg5 = %cst) -> (f32) {
        %1 = affine.load %arg0[%arg3, %arg4] : memref<256x512xf32>
        %2 = arith.addf %arg5, %1 : f32
        affine.yield %2 : f32
      }
      affine.store %0, %arg1[%arg3] : memref<256xf32>
    }
    return
  }
}

// -----
#map = affine_map<(d0, d1) -> (d0, d1 * 2)>
module {
  func.func @vecdim_reduction_complex_ub(%arg0: memref<256x512xf32>, %arg1: memref<256xf32>, %arg2: index, %arg3: index) {
    %cst = arith.constant 0.000000e+00 : f32
    affine.for %arg4 = 0 to 256 {
      %0 = affine.for %arg5 = 0 to min #map(%arg2, %arg3) iter_args(%arg6 = %cst) -> (f32) {
        %1 = affine.load %arg0[%arg4, %arg5] : memref<256x512xf32>
        %2 = arith.addf %arg6, %1 : f32
        affine.yield %2 : f32
      }
      affine.store %0, %arg1[%arg4] : memref<256xf32>
    }
    return
  }
}

// -----
module {
  func.func @vecdim_two_reductions_masked(%arg0: memref<256x512xf32>, %arg1: memref<512xf32>) {
    %cst = arith.constant 0.000000e+00 : f32
    affine.for %arg2 = 0 to 256 {
      %0:2 = affine.for %arg3 = 0 to 500 iter_args(%arg4 = %cst, %arg5 = %cst) -> (f32, f32) {
        %1 = affine.load %arg0[%arg2, %arg3] : memref<256x512xf32>
        %2 = math.exp %1 : f32
        %3 = arith.addf %arg4, %1 : f32
        %4 = arith.addf %arg5, %2 : f32
        affine.yield %3, %4 : f32, f32
      }
      affine.store %0#0, %arg1[%arg2 * 2] : memref<512xf32>
      affine.store %0#1, %arg1[%arg2 * 2 + 1] : memref<512xf32>
    }
    return
  }
}

