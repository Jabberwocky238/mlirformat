module {
  func.func @fuse_empty_loops() {
    %c2 = arith.constant 2 : index
    %c0 = arith.constant 0 : index
    %c1 = arith.constant 1 : index
    scf.parallel (%arg0, %arg1) = (%c0, %c0) to (%c2, %c2) step (%c1, %c1) {
      scf.reduce 
    }
    scf.parallel (%arg0, %arg1) = (%c0, %c0) to (%c2, %c2) step (%c1, %c1) {
      scf.reduce 
    }
    return
  }
}

// -----
module {
  func.func @fuse_ops_between(%arg0: f32, %arg1: f32) -> f32 {
    %c2 = arith.constant 2 : index
    %c0 = arith.constant 0 : index
    %c1 = arith.constant 1 : index
    scf.parallel (%arg2, %arg3) = (%c0, %c0) to (%c2, %c2) step (%c1, %c1) {
      scf.reduce 
    }
    %0 = arith.addf %arg0, %arg1 : f32
    scf.parallel (%arg2, %arg3) = (%c0, %c0) to (%c2, %c2) step (%c1, %c1) {
      scf.reduce 
    }
    return %0 : f32
  }
}

// -----
module {
  func.func @fuse_two(%arg0: memref<2x2xf32>, %arg1: memref<2x2xf32>) {
    %c2 = arith.constant 2 : index
    %c0 = arith.constant 0 : index
    %c1 = arith.constant 1 : index
    %cst = arith.constant 1.000000e+00 : f32
    %alloc = memref.alloc() : memref<2x2xf32>
    scf.parallel (%arg2, %arg3) = (%c0, %c0) to (%c2, %c2) step (%c1, %c1) {
      %0 = memref.load %arg1[%arg2, %arg3] : memref<2x2xf32>
      %1 = arith.addf %0, %cst : f32
      memref.store %1, %alloc[%arg2, %arg3] : memref<2x2xf32>
      scf.reduce 
    }
    scf.parallel (%arg2, %arg3) = (%c0, %c0) to (%c2, %c2) step (%c1, %c1) {
      %0 = memref.load %alloc[%arg2, %arg3] : memref<2x2xf32>
      %1 = memref.load %arg0[%arg2, %arg3] : memref<2x2xf32>
      %2 = arith.mulf %0, %1 : f32
      memref.store %2, %arg1[%arg2, %arg3] : memref<2x2xf32>
      scf.reduce 
    }
    memref.dealloc %alloc : memref<2x2xf32>
    return
  }
}

// -----
module {
  func.func @fuse_three(%arg0: memref<2x2xf32>, %arg1: memref<2x2xf32>) {
    %c2 = arith.constant 2 : index
    %c0 = arith.constant 0 : index
    %c1 = arith.constant 1 : index
    %cst = arith.constant 1.000000e+00 : f32
    %cst_0 = arith.constant 2.000000e+00 : f32
    %alloc = memref.alloc() : memref<2x2xf32>
    %alloc_1 = memref.alloc() : memref<2x2xf32>
    scf.parallel (%arg2, %arg3) = (%c0, %c0) to (%c2, %c2) step (%c1, %c1) {
      %0 = memref.load %arg1[%arg2, %arg3] : memref<2x2xf32>
      %1 = arith.addf %0, %cst : f32
      memref.store %1, %alloc[%arg2, %arg3] : memref<2x2xf32>
      scf.reduce 
    }
    scf.parallel (%arg2, %arg3) = (%c0, %c0) to (%c2, %c2) step (%c1, %c1) {
      %0 = memref.load %alloc[%arg2, %arg3] : memref<2x2xf32>
      %1 = arith.mulf %0, %cst_0 : f32
      memref.store %1, %alloc_1[%arg2, %arg3] : memref<2x2xf32>
      scf.reduce 
    }
    scf.parallel (%arg2, %arg3) = (%c0, %c0) to (%c2, %c2) step (%c1, %c1) {
      %0 = memref.load %arg0[%arg2, %arg3] : memref<2x2xf32>
      %1 = arith.addf %0, %cst_0 : f32
      memref.store %1, %arg1[%arg2, %arg3] : memref<2x2xf32>
      scf.reduce 
    }
    memref.dealloc %alloc : memref<2x2xf32>
    memref.dealloc %alloc_1 : memref<2x2xf32>
    return
  }
}

// -----
module {
  func.func @do_not_fuse_nested_ploop1() {
    %c2 = arith.constant 2 : index
    %c0 = arith.constant 0 : index
    %c1 = arith.constant 1 : index
    scf.parallel (%arg0, %arg1) = (%c0, %c0) to (%c2, %c2) step (%c1, %c1) {
      scf.parallel (%arg2, %arg3) = (%c0, %c0) to (%c2, %c2) step (%c1, %c1) {
        scf.reduce 
      }
      scf.reduce 
    }
    scf.parallel (%arg0, %arg1) = (%c0, %c0) to (%c2, %c2) step (%c1, %c1) {
      scf.reduce 
    }
    return
  }
}

// -----
module {
  func.func @do_not_fuse_nested_ploop2() {
    %c2 = arith.constant 2 : index
    %c0 = arith.constant 0 : index
    %c1 = arith.constant 1 : index
    scf.parallel (%arg0, %arg1) = (%c0, %c0) to (%c2, %c2) step (%c1, %c1) {
      scf.reduce 
    }
    scf.parallel (%arg0, %arg1) = (%c0, %c0) to (%c2, %c2) step (%c1, %c1) {
      scf.parallel (%arg2, %arg3) = (%c0, %c0) to (%c2, %c2) step (%c1, %c1) {
        scf.reduce 
      }
      scf.reduce 
    }
    return
  }
}

// -----
module {
  func.func @do_not_fuse_loops_unmatching_num_loops() {
    %c2 = arith.constant 2 : index
    %c0 = arith.constant 0 : index
    %c1 = arith.constant 1 : index
    scf.parallel (%arg0, %arg1) = (%c0, %c0) to (%c2, %c2) step (%c1, %c1) {
      scf.reduce 
    }
    scf.parallel (%arg0) = (%c0) to (%c2) step (%c1) {
      scf.reduce 
    }
    return
  }
}

// -----
module {
  func.func @do_not_fuse_loops_with_side_effecting_ops_in_between() {
    %c2 = arith.constant 2 : index
    %c0 = arith.constant 0 : index
    %c1 = arith.constant 1 : index
    scf.parallel (%arg0, %arg1) = (%c0, %c0) to (%c2, %c2) step (%c1, %c1) {
      scf.reduce 
    }
    %alloc = memref.alloc() : memref<2x2xf32>
    scf.parallel (%arg0, %arg1) = (%c0, %c0) to (%c2, %c2) step (%c1, %c1) {
      scf.reduce 
    }
    return
  }
}

// -----
module {
  func.func @do_not_fuse_loops_unmatching_iteration_space() {
    %c0 = arith.constant 0 : index
    %c1 = arith.constant 1 : index
    %c2 = arith.constant 2 : index
    %c4 = arith.constant 4 : index
    scf.parallel (%arg0, %arg1) = (%c0, %c0) to (%c4, %c4) step (%c2, %c2) {
      scf.reduce 
    }
    scf.parallel (%arg0, %arg1) = (%c0, %c0) to (%c2, %c2) step (%c1, %c1) {
      scf.reduce 
    }
    return
  }
}

// -----
module {
  func.func @do_not_fuse_unmatching_write_read_patterns(%arg0: memref<2x2xf32>, %arg1: memref<2x2xf32>, %arg2: memref<2x2xf32>, %arg3: memref<2x2xf32>) {
    %c2 = arith.constant 2 : index
    %c0 = arith.constant 0 : index
    %c1 = arith.constant 1 : index
    %alloc = memref.alloc() : memref<2x2xf32>
    scf.parallel (%arg4, %arg5) = (%c0, %c0) to (%c2, %c2) step (%c1, %c1) {
      %0 = memref.load %arg1[%arg4, %arg5] : memref<2x2xf32>
      %1 = memref.load %arg2[%arg4, %arg5] : memref<2x2xf32>
      %2 = arith.addf %0, %1 : f32
      memref.store %2, %alloc[%arg4, %arg5] : memref<2x2xf32>
      scf.reduce 
    }
    scf.parallel (%arg4, %arg5) = (%c0, %c0) to (%c2, %c2) step (%c1, %c1) {
      %0 = arith.addi %arg4, %c1 : index
      %1 = memref.load %alloc[%0, %arg5] : memref<2x2xf32>
      %2 = memref.load %arg0[%arg4, %arg5] : memref<2x2xf32>
      %3 = arith.mulf %1, %2 : f32
      memref.store %3, %arg3[%arg4, %arg5] : memref<2x2xf32>
      scf.reduce 
    }
    memref.dealloc %alloc : memref<2x2xf32>
    return
  }
}

// -----
module {
  func.func @do_not_fuse_unmatching_read_write_patterns(%arg0: memref<2x2xf32>, %arg1: memref<2x2xf32>, %arg2: memref<2x2xf32>) {
    %c2 = arith.constant 2 : index
    %c0 = arith.constant 0 : index
    %c1 = arith.constant 1 : index
    %alloc = memref.alloc() : memref<2x2xf32>
    scf.parallel (%arg3, %arg4) = (%c0, %c0) to (%c2, %c2) step (%c1, %c1) {
      %0 = memref.load %arg1[%arg3, %arg4] : memref<2x2xf32>
      %1 = memref.load %arg2[%arg3, %arg4] : memref<2x2xf32>
      %2 = arith.addf %0, %1 : f32
      memref.store %2, %alloc[%arg3, %arg4] : memref<2x2xf32>
      scf.reduce 
    }
    scf.parallel (%arg3, %arg4) = (%c0, %c0) to (%c2, %c2) step (%c1, %c1) {
      %0 = arith.addi %arg3, %c1 : index
      %1 = memref.load %alloc[%0, %arg4] : memref<2x2xf32>
      %2 = memref.load %arg0[%arg3, %arg4] : memref<2x2xf32>
      %3 = arith.mulf %1, %2 : f32
      memref.store %3, %arg2[%arg4, %arg3] : memref<2x2xf32>
      scf.reduce 
    }
    memref.dealloc %alloc : memref<2x2xf32>
    return
  }
}

// -----
module {
  func.func @do_not_fuse_loops_with_memref_defined_in_loop_bodies() {
    %c2 = arith.constant 2 : index
    %c0 = arith.constant 0 : index
    %c1 = arith.constant 1 : index
    %alloc = memref.alloc() : memref<2x2xf32>
    scf.parallel (%arg0, %arg1) = (%c0, %c0) to (%c2, %c2) step (%c1, %c1) {
      scf.reduce 
    }
    scf.parallel (%arg0, %arg1) = (%c0, %c0) to (%c2, %c2) step (%c1, %c1) {
      %subview = memref.subview %alloc[%c0, %c0] [%c2, %c2] [%c1, %c1] : memref<2x2xf32> to memref<?x?xf32, strided<[?, ?], offset: ?>>
      %0 = memref.load %subview[%arg0, %arg1] : memref<?x?xf32, strided<[?, ?], offset: ?>>
      scf.reduce 
    }
    return
  }
}

// -----
module {
  func.func @nested_fuse(%arg0: memref<2x2xf32>, %arg1: memref<2x2xf32>) {
    %c2 = arith.constant 2 : index
    %c0 = arith.constant 0 : index
    %c1 = arith.constant 1 : index
    %cst = arith.constant 1.000000e+00 : f32
    %alloc = memref.alloc() : memref<2x2xf32>
    scf.parallel (%arg2) = (%c0) to (%c2) step (%c1) {
      scf.parallel (%arg3, %arg4) = (%c0, %c0) to (%c2, %c2) step (%c1, %c1) {
        %0 = memref.load %arg1[%arg3, %arg4] : memref<2x2xf32>
        %1 = arith.addf %0, %cst : f32
        memref.store %1, %alloc[%arg3, %arg4] : memref<2x2xf32>
        scf.reduce 
      }
      scf.parallel (%arg3, %arg4) = (%c0, %c0) to (%c2, %c2) step (%c1, %c1) {
        %0 = memref.load %alloc[%arg3, %arg4] : memref<2x2xf32>
        %1 = memref.load %arg0[%arg3, %arg4] : memref<2x2xf32>
        %2 = arith.mulf %0, %1 : f32
        memref.store %2, %arg1[%arg3, %arg4] : memref<2x2xf32>
        scf.reduce 
      }
      scf.reduce 
    }
    memref.dealloc %alloc : memref<2x2xf32>
    return
  }
}

// -----
module {
  func.func @do_not_fuse_alias(%arg0: memref<2x2xf32>, %arg1: memref<2x2xf32>, %arg2: memref<2x2xf32>, %arg3: memref<2x2xf32>, %arg4: memref<2x2xf32>) {
    %c2 = arith.constant 2 : index
    %c0 = arith.constant 0 : index
    %c1 = arith.constant 1 : index
    scf.parallel (%arg5, %arg6) = (%c0, %c0) to (%c2, %c2) step (%c1, %c1) {
      %0 = memref.load %arg1[%arg5, %arg6] : memref<2x2xf32>
      %1 = memref.load %arg2[%arg5, %arg6] : memref<2x2xf32>
      %2 = arith.addf %0, %1 : f32
      memref.store %2, %arg4[%arg5, %arg6] : memref<2x2xf32>
      scf.reduce 
    }
    scf.parallel (%arg5, %arg6) = (%c0, %c0) to (%c2, %c2) step (%c1, %c1) {
      %0 = memref.load %arg4[%arg5, %arg6] : memref<2x2xf32>
      %1 = memref.load %arg0[%arg5, %arg6] : memref<2x2xf32>
      %2 = arith.mulf %0, %1 : f32
      memref.store %2, %arg3[%arg5, %arg6] : memref<2x2xf32>
      scf.reduce 
    }
    return
  }
}

// -----
module {
  func.func @fuse_when_1st_has_multiple_stores(%arg0: memref<2x2xf32>, %arg1: memref<2x2xf32>) {
    %c0 = arith.constant 0 : index
    %c1 = arith.constant 1 : index
    %c2 = arith.constant 2 : index
    %cst = arith.constant 0.000000e+00 : f32
    %alloc = memref.alloc() : memref<2x2xf32>
    scf.parallel (%arg2, %arg3) = (%c0, %c0) to (%c2, %c2) step (%c1, %c1) {
      memref.store %cst, %alloc[%arg2, %arg3] : memref<2x2xf32>
      %0 = memref.load %arg1[%arg2, %arg3] : memref<2x2xf32>
      %1 = arith.addf %0, %0 : f32
      memref.store %1, %alloc[%arg2, %arg3] : memref<2x2xf32>
      scf.reduce 
    }
    scf.parallel (%arg2, %arg3) = (%c0, %c0) to (%c2, %c2) step (%c1, %c1) {
      %0 = memref.load %alloc[%arg2, %arg3] : memref<2x2xf32>
      %1 = memref.load %arg0[%arg2, %arg3] : memref<2x2xf32>
      %2 = arith.mulf %0, %1 : f32
      memref.store %2, %arg1[%arg2, %arg3] : memref<2x2xf32>
      scf.reduce 
    }
    memref.dealloc %alloc : memref<2x2xf32>
    return
  }
}

// -----
module {
  func.func @do_not_fuse_multiple_stores_on_diff_indices(%arg0: memref<2x2xf32>, %arg1: memref<2x2xf32>) {
    %c0 = arith.constant 0 : index
    %c1 = arith.constant 1 : index
    %c2 = arith.constant 2 : index
    %cst = arith.constant 0.000000e+00 : f32
    %alloc = memref.alloc() : memref<2x2xf32>
    scf.parallel (%arg2, %arg3) = (%c0, %c0) to (%c2, %c2) step (%c1, %c1) {
      memref.store %cst, %alloc[%arg2, %arg3] : memref<2x2xf32>
      %0 = memref.load %arg1[%arg2, %arg3] : memref<2x2xf32>
      %1 = arith.addf %0, %0 : f32
      memref.store %1, %alloc[%c0, %arg3] : memref<2x2xf32>
      scf.reduce 
    }
    scf.parallel (%arg2, %arg3) = (%c0, %c0) to (%c2, %c2) step (%c1, %c1) {
      %0 = memref.load %alloc[%arg2, %arg3] : memref<2x2xf32>
      %1 = memref.load %arg0[%arg2, %arg3] : memref<2x2xf32>
      %2 = arith.mulf %0, %1 : f32
      memref.store %2, %arg1[%arg2, %arg3] : memref<2x2xf32>
      scf.reduce 
    }
    memref.dealloc %alloc : memref<2x2xf32>
    return
  }
}

// -----
#map = affine_map<(d0, d1) -> (d0 + d1)>
module {
  func.func @fuse_same_indices_by_affine_apply(%arg0: memref<2x2xf32>, %arg1: memref<2x2xf32>) {
    %c0 = arith.constant 0 : index
    %c1 = arith.constant 1 : index
    %c2 = arith.constant 2 : index
    %alloc = memref.alloc() : memref<2x3xf32>
    scf.parallel (%arg2, %arg3) = (%c0, %c0) to (%c2, %c2) step (%c1, %c1) {
      %0 = memref.load %arg1[%arg2, %arg3] : memref<2x2xf32>
      %1 = affine.apply #map(%arg2, %arg3)
      memref.store %0, %alloc[%arg2, %1] : memref<2x3xf32>
      scf.reduce 
    }
    scf.parallel (%arg2, %arg3) = (%c0, %c0) to (%c2, %c2) step (%c1, %c1) {
      %0 = affine.apply #map(%arg2, %arg3)
      %1 = memref.load %alloc[%arg2, %0] : memref<2x3xf32>
      %2 = memref.load %arg0[%arg2, %arg3] : memref<2x2xf32>
      %3 = arith.mulf %1, %2 : f32
      memref.store %3, %arg1[%arg2, %arg3] : memref<2x2xf32>
      scf.reduce 
    }
    memref.dealloc %alloc : memref<2x3xf32>
    return
  }
}

// -----
#map = affine_map<(d0, d1) -> (d0 + d1)>
module {
  func.func @do_not_fuse_affine_apply_to_non_ind_var(%arg0: memref<2x2xf32>, %arg1: memref<2x2xf32>, %arg2: index, %arg3: index) {
    %c0 = arith.constant 0 : index
    %c1 = arith.constant 1 : index
    %c2 = arith.constant 2 : index
    %alloc = memref.alloc() : memref<2x3xf32>
    scf.parallel (%arg4, %arg5) = (%c0, %c0) to (%c2, %c2) step (%c1, %c1) {
      %0 = memref.load %arg1[%arg4, %arg5] : memref<2x2xf32>
      %1 = affine.apply #map(%arg4, %arg2)
      memref.store %0, %alloc[%arg4, %1] : memref<2x3xf32>
      scf.reduce 
    }
    scf.parallel (%arg4, %arg5) = (%c0, %c0) to (%c2, %c2) step (%c1, %c1) {
      %0 = affine.apply #map(%arg4, %arg3)
      %1 = memref.load %alloc[%arg4, %0] : memref<2x3xf32>
      %2 = memref.load %arg0[%arg4, %arg5] : memref<2x2xf32>
      %3 = arith.mulf %1, %2 : f32
      memref.store %3, %arg1[%arg4, %arg5] : memref<2x2xf32>
      scf.reduce 
    }
    memref.dealloc %alloc : memref<2x3xf32>
    return
  }
}

// -----
module {
  func.func @fuse_reductions_two(%arg0: memref<2x2xf32>, %arg1: memref<2x2xf32>) -> (f32, f32) {
    %c2 = arith.constant 2 : index
    %c0 = arith.constant 0 : index
    %c1 = arith.constant 1 : index
    %cst = arith.constant 1.000000e+00 : f32
    %cst_0 = arith.constant 2.000000e+00 : f32
    %0 = scf.parallel (%arg2, %arg3) = (%c0, %c0) to (%c2, %c2) step (%c1, %c1) init (%cst) -> f32 {
      %2 = memref.load %arg0[%arg2, %arg3] : memref<2x2xf32>
      scf.reduce(%2 : f32) {
      ^bb0(%arg4: f32, %arg5: f32):
        %3 = arith.addf %arg4, %arg5 : f32
        scf.reduce.return %3 : f32
      }
    }
    %1 = scf.parallel (%arg2, %arg3) = (%c0, %c0) to (%c2, %c2) step (%c1, %c1) init (%cst_0) -> f32 {
      %2 = memref.load %arg1[%arg2, %arg3] : memref<2x2xf32>
      scf.reduce(%2 : f32) {
      ^bb0(%arg4: f32, %arg5: f32):
        %3 = arith.mulf %arg4, %arg5 : f32
        scf.reduce.return %3 : f32
      }
    }
    return %0, %1 : f32, f32
  }
}

// -----
module {
  func.func @fuse_reductions_three(%arg0: memref<2x2xf32>, %arg1: memref<2x2xf32>, %arg2: memref<2x2xf32>) -> (f32, f32, f32) {
    %c2 = arith.constant 2 : index
    %c0 = arith.constant 0 : index
    %c1 = arith.constant 1 : index
    %cst = arith.constant 1.000000e+00 : f32
    %cst_0 = arith.constant 2.000000e+00 : f32
    %cst_1 = arith.constant 3.000000e+00 : f32
    %0 = scf.parallel (%arg3, %arg4) = (%c0, %c0) to (%c2, %c2) step (%c1, %c1) init (%cst) -> f32 {
      %3 = memref.load %arg0[%arg3, %arg4] : memref<2x2xf32>
      scf.reduce(%3 : f32) {
      ^bb0(%arg5: f32, %arg6: f32):
        %4 = arith.addf %arg5, %arg6 : f32
        scf.reduce.return %4 : f32
      }
    }
    %1 = scf.parallel (%arg3, %arg4) = (%c0, %c0) to (%c2, %c2) step (%c1, %c1) init (%cst_0) -> f32 {
      %3 = memref.load %arg1[%arg3, %arg4] : memref<2x2xf32>
      scf.reduce(%3 : f32) {
      ^bb0(%arg5: f32, %arg6: f32):
        %4 = arith.mulf %arg5, %arg6 : f32
        scf.reduce.return %4 : f32
      }
    }
    %2 = scf.parallel (%arg3, %arg4) = (%c0, %c0) to (%c2, %c2) step (%c1, %c1) init (%cst_1) -> f32 {
      %3 = memref.load %arg2[%arg3, %arg4] : memref<2x2xf32>
      scf.reduce(%3 : f32) {
      ^bb0(%arg5: f32, %arg6: f32):
        %4 = arith.addf %arg5, %arg6 : f32
        scf.reduce.return %4 : f32
      }
    }
    return %0, %1, %2 : f32, f32, f32
  }
}

// -----
module {
  func.func @reductions_use_res(%arg0: memref<2x2xf32>, %arg1: memref<2x2xf32>) -> (f32, f32) {
    %c2 = arith.constant 2 : index
    %c0 = arith.constant 0 : index
    %c1 = arith.constant 1 : index
    %cst = arith.constant 1.000000e+00 : f32
    %0 = scf.parallel (%arg2, %arg3) = (%c0, %c0) to (%c2, %c2) step (%c1, %c1) init (%cst) -> f32 {
      %2 = memref.load %arg0[%arg2, %arg3] : memref<2x2xf32>
      scf.reduce(%2 : f32) {
      ^bb0(%arg4: f32, %arg5: f32):
        %3 = arith.addf %arg4, %arg5 : f32
        scf.reduce.return %3 : f32
      }
    }
    %1 = scf.parallel (%arg2, %arg3) = (%c0, %c0) to (%c2, %c2) step (%c1, %c1) init (%0) -> f32 {
      %2 = memref.load %arg1[%arg2, %arg3] : memref<2x2xf32>
      scf.reduce(%2 : f32) {
      ^bb0(%arg4: f32, %arg5: f32):
        %3 = arith.mulf %arg4, %arg5 : f32
        scf.reduce.return %3 : f32
      }
    }
    return %0, %1 : f32, f32
  }
}

// -----
module {
  func.func @reductions_use_res_inside(%arg0: memref<2x2xf32>, %arg1: memref<2x2xf32>) -> (f32, f32) {
    %c2 = arith.constant 2 : index
    %c0 = arith.constant 0 : index
    %c1 = arith.constant 1 : index
    %cst = arith.constant 1.000000e+00 : f32
    %cst_0 = arith.constant 2.000000e+00 : f32
    %0 = scf.parallel (%arg2, %arg3) = (%c0, %c0) to (%c2, %c2) step (%c1, %c1) init (%cst) -> f32 {
      %2 = memref.load %arg0[%arg2, %arg3] : memref<2x2xf32>
      scf.reduce(%2 : f32) {
      ^bb0(%arg4: f32, %arg5: f32):
        %3 = arith.addf %arg4, %arg5 : f32
        scf.reduce.return %3 : f32
      }
    }
    %1 = scf.parallel (%arg2, %arg3) = (%c0, %c0) to (%c2, %c2) step (%c1, %c1) init (%cst_0) -> f32 {
      %2 = memref.load %arg1[%arg2, %arg3] : memref<2x2xf32>
      %3 = arith.addf %2, %0 : f32
      scf.reduce(%3 : f32) {
      ^bb0(%arg4: f32, %arg5: f32):
        %4 = arith.mulf %arg4, %arg5 : f32
        scf.reduce.return %4 : f32
      }
    }
    return %0, %1 : f32, f32
  }
}

// -----
module {
  func.func @reductions_use_res_between(%arg0: memref<2x2xf32>, %arg1: memref<2x2xf32>) -> (f32, f32, f32) {
    %c2 = arith.constant 2 : index
    %c0 = arith.constant 0 : index
    %c1 = arith.constant 1 : index
    %cst = arith.constant 1.000000e+00 : f32
    %cst_0 = arith.constant 2.000000e+00 : f32
    %0 = scf.parallel (%arg2, %arg3) = (%c0, %c0) to (%c2, %c2) step (%c1, %c1) init (%cst) -> f32 {
      %3 = memref.load %arg0[%arg2, %arg3] : memref<2x2xf32>
      scf.reduce(%3 : f32) {
      ^bb0(%arg4: f32, %arg5: f32):
        %4 = arith.addf %arg4, %arg5 : f32
        scf.reduce.return %4 : f32
      }
    }
    %1 = arith.addf %0, %cst_0 : f32
    %2 = scf.parallel (%arg2, %arg3) = (%c0, %c0) to (%c2, %c2) step (%c1, %c1) init (%cst_0) -> f32 {
      %3 = memref.load %arg1[%arg2, %arg3] : memref<2x2xf32>
      scf.reduce(%3 : f32) {
      ^bb0(%arg4: f32, %arg5: f32):
        %4 = arith.mulf %arg4, %arg5 : f32
        scf.reduce.return %4 : f32
      }
    }
    return %0, %2, %1 : f32, f32, f32
  }
}

