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
  func.func @do_not_fuse_loops_with_nonfull_alias_defined_in_loop_bodies() {
    %c2 = arith.constant 2 : index
    %c0 = arith.constant 0 : index
    %c1 = arith.constant 1 : index
    %cst = arith.constant 1.000000e+00 : f32
    %alloc = memref.alloc() : memref<2x2xf32>
    scf.parallel (%arg0, %arg1) = (%c0, %c0) to (%c2, %c1) step (%c1, %c1) {
      memref.store %cst, %alloc[%arg0, %arg1] : memref<2x2xf32>
      scf.reduce 
    }
    scf.parallel (%arg0, %arg1) = (%c0, %c0) to (%c2, %c1) step (%c1, %c1) {
      %subview = memref.subview %alloc[%arg0, %c0] [2, 1] [1, 1] : memref<2x2xf32> to memref<2x1xf32, strided<[2, 1], offset: ?>>
      %0 = memref.load %subview[%arg0, %arg1] : memref<2x1xf32, strided<[2, 1], offset: ?>>
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
  func.func @fuse_trivial_rank_reducing_subview() {
    %c0 = arith.constant 0 : index
    %c1 = arith.constant 1 : index
    %c2 = arith.constant 2 : index
    %cst = arith.constant 1.000000e+00 : f32
    %alloc = memref.alloc() : memref<1x2x2xf32>
    scf.parallel (%arg0, %arg1) = (%c0, %c0) to (%c2, %c2) step (%c1, %c1) {
      memref.store %cst, %alloc[%c0, %arg0, %arg1] : memref<1x2x2xf32>
      scf.reduce 
    }
    %subview = memref.subview %alloc[0, 0, 0] [1, 2, 2] [1, 1, 1] : memref<1x2x2xf32> to memref<2x2xf32>
    scf.parallel (%arg0, %arg1) = (%c0, %c0) to (%c2, %c2) step (%c1, %c1) {
      %0 = memref.load %subview[%arg0, %arg1] : memref<2x2xf32>
      memref.store %0, %alloc[%c0, %arg0, %arg1] : memref<1x2x2xf32>
      scf.reduce 
    }
    memref.dealloc %alloc : memref<1x2x2xf32>
    return
  }
}

// -----
module {
  func.func @do_not_fuse_nontrivial_subview_offset() {
    %c0 = arith.constant 0 : index
    %c1 = arith.constant 1 : index
    %c2 = arith.constant 2 : index
    %cst = arith.constant 1.000000e+00 : f32
    %alloc = memref.alloc() : memref<2x2x2xf32>
    scf.parallel (%arg0, %arg1) = (%c0, %c0) to (%c2, %c2) step (%c1, %c1) {
      memref.store %cst, %alloc[%c0, %arg0, %arg1] : memref<2x2x2xf32>
      scf.reduce 
    }
    %subview = memref.subview %alloc[1, 0, 0] [1, 2, 2] [1, 1, 1] : memref<2x2x2xf32> to memref<2x2xf32, strided<[2, 1], offset: 4>>
    scf.parallel (%arg0, %arg1) = (%c0, %c0) to (%c2, %c2) step (%c1, %c1) {
      %0 = memref.load %subview[%arg0, %arg1] : memref<2x2xf32, strided<[2, 1], offset: 4>>
      memref.store %0, %alloc[%c0, %arg0, %arg1] : memref<2x2x2xf32>
      scf.reduce 
    }
    memref.dealloc %alloc : memref<2x2x2xf32>
    return
  }
}

// -----
module {
  func.func @fuse_vector_load_store(%arg0: memref<4x4xf32>) {
    %c0 = arith.constant 0 : index
    %c1 = arith.constant 1 : index
    %c4 = arith.constant 4 : index
    %cst = arith.constant dense<0.000000e+00> : vector<4xf32>
    scf.parallel (%arg1) = (%c0) to (%c4) step (%c1) {
      vector.store %cst, %arg0[%arg1, %c0] : memref<4x4xf32>, vector<4xf32>
      scf.reduce 
    }
    scf.parallel (%arg1) = (%c0) to (%c4) step (%c1) {
      %0 = vector.load %arg0[%arg1, %c0] : memref<4x4xf32>, vector<4xf32>
      vector.store %0, %arg0[%arg1, %c0] : memref<4x4xf32>, vector<4xf32>
      scf.reduce 
    }
    return
  }
}

// -----
#map = affine_map<(d0) -> (d0 + 1)>
module {
  func.func @do_not_fuse_vector_different_indices(%arg0: memref<4x4xf32>) {
    %c0 = arith.constant 0 : index
    %c1 = arith.constant 1 : index
    %c4 = arith.constant 4 : index
    %cst = arith.constant dense<0.000000e+00> : vector<4xf32>
    scf.parallel (%arg1) = (%c0) to (%c4) step (%c1) {
      vector.store %cst, %arg0[%arg1, %c0] : memref<4x4xf32>, vector<4xf32>
      scf.reduce 
    }
    scf.parallel (%arg1) = (%c0) to (%c4) step (%c1) {
      %0 = affine.apply #map(%arg1)
      %1 = vector.load %arg0[%0, %c0] : memref<4x4xf32>, vector<4xf32>
      vector.store %1, %arg0[%arg1, %c0] : memref<4x4xf32>, vector<4xf32>
      scf.reduce 
    }
    return
  }
}

// -----
module {
  func.func @fuse_vector_transfer_same_indices(%arg0: memref<4x4xf32>) {
    %c0 = arith.constant 0 : index
    %c1 = arith.constant 1 : index
    %c4 = arith.constant 4 : index
    %cst = arith.constant 0.000000e+00 : f32
    scf.parallel (%arg1) = (%c0) to (%c4) step (%c1) {
      %0 = vector.transfer_read %arg0[%arg1, %c0], %cst {in_bounds = [true]} : memref<4x4xf32>, vector<4xf32>
      vector.transfer_write %0, %arg0[%arg1, %c0] {in_bounds = [true]} : vector<4xf32>, memref<4x4xf32>
      scf.reduce 
    }
    scf.parallel (%arg1) = (%c0) to (%c4) step (%c1) {
      %0 = vector.transfer_read %arg0[%arg1, %c0], %cst {in_bounds = [true]} : memref<4x4xf32>, vector<4xf32>
      vector.transfer_write %0, %arg0[%arg1, %c0] {in_bounds = [true]} : vector<4xf32>, memref<4x4xf32>
      scf.reduce 
    }
    return
  }
}

// -----
#map = affine_map<(d0) -> (d0 + 1)>
module {
  func.func @do_not_fuse_vector_transfer_different_indices(%arg0: memref<4x4xf32>) {
    %c0 = arith.constant 0 : index
    %c1 = arith.constant 1 : index
    %c4 = arith.constant 4 : index
    %cst = arith.constant 0.000000e+00 : f32
    scf.parallel (%arg1) = (%c0) to (%c4) step (%c1) {
      %0 = vector.transfer_read %arg0[%arg1, %c0], %cst {in_bounds = [true]} : memref<4x4xf32>, vector<4xf32>
      vector.transfer_write %0, %arg0[%arg1, %c0] {in_bounds = [true]} : vector<4xf32>, memref<4x4xf32>
      scf.reduce 
    }
    scf.parallel (%arg1) = (%c0) to (%c4) step (%c1) {
      %0 = affine.apply #map(%arg1)
      %1 = vector.transfer_read %arg0[%0, %c0], %cst {in_bounds = [true]} : memref<4x4xf32>, vector<4xf32>
      vector.transfer_write %1, %arg0[%arg1, %c0] {in_bounds = [true]} : vector<4xf32>, memref<4x4xf32>
      scf.reduce 
    }
    return
  }
}

// -----
module {
  func.func @fuse_vector_transfer_with_subview(%arg0: memref<1x4xf32>) {
    %c0 = arith.constant 0 : index
    %c1 = arith.constant 1 : index
    %c4 = arith.constant 4 : index
    %cst = arith.constant 0.000000e+00 : f32
    %cst_0 = arith.constant dense<1.000000e+00> : vector<4xf32>
    scf.parallel (%arg1) = (%c0) to (%c1) step (%c1) {
      %subview = memref.subview %arg0[0, 0] [1, 4] [1, 1] : memref<1x4xf32> to memref<4xf32>
      vector.transfer_write %cst_0, %subview[%c0] {in_bounds = [true]} : vector<4xf32>, memref<4xf32>
      scf.reduce 
    }
    scf.parallel (%arg1) = (%c0) to (%c1) step (%c1) {
      %0 = scf.for %arg2 = %c0 to %c4 step %c1 iter_args(%arg3 = %cst) -> (f32) {
        %1 = memref.load %arg0[%c0, %arg2] : memref<1x4xf32>
        %2 = arith.addf %1, %arg3 : f32
        scf.yield %2 : f32
      }
      memref.store %0, %arg0[%c0, %c0] : memref<1x4xf32>
      scf.reduce 
    }
    return
  }
}

// -----
module {
  func.func @do_not_fuse_vector_transfer_nontrivial_subview(%arg0: memref<2x4xf32>) {
    %c0 = arith.constant 0 : index
    %c1 = arith.constant 1 : index
    %cst = arith.constant 0.000000e+00 : f32
    scf.parallel (%arg1) = (%c0) to (%c1) step (%c1) {
      %0 = vector.transfer_read %arg0[%c0, %arg1], %cst {in_bounds = [true]} : memref<2x4xf32>, vector<1xf32>
      vector.transfer_write %0, %arg0[%c0, %arg1] {in_bounds = [true]} : vector<1xf32>, memref<2x4xf32>
      scf.reduce 
    }
    %subview = memref.subview %arg0[1, 0] [1, 4] [1, 1] : memref<2x4xf32> to memref<4xf32, strided<[1], offset: 4>>
    scf.parallel (%arg1) = (%c0) to (%c1) step (%c1) {
      %0 = vector.transfer_read %subview[%arg1], %cst {in_bounds = [true]} : memref<4xf32, strided<[1], offset: 4>>, vector<1xf32>
      vector.transfer_write %0, %subview[%arg1] {in_bounds = [true]} : vector<1xf32>, memref<4xf32, strided<[1], offset: 4>>
      scf.reduce 
    }
    return
  }
}

// -----
module {
  func.func @do_not_fuse_vector_transfer_different_masks(%arg0: memref<1x4xf32>) {
    %c0 = arith.constant 0 : index
    %c1 = arith.constant 1 : index
    %cst = arith.constant 0.000000e+00 : f32
    %0 = vector.create_mask %c1 : vector<1xi1>
    %1 = vector.create_mask %c0 : vector<1xi1>
    scf.parallel (%arg1) = (%c0) to (%c1) step (%c1) {
      %2 = vector.transfer_read %arg0[%c0, %arg1], %cst, %0 {in_bounds = [true]} : memref<1x4xf32>, vector<1xf32>
      vector.transfer_write %2, %arg0[%c0, %arg1], %0 {in_bounds = [true]} : vector<1xf32>, memref<1x4xf32>
      scf.reduce 
    }
    scf.parallel (%arg1) = (%c0) to (%c1) step (%c1) {
      %2 = vector.transfer_read %arg0[%c0, %arg1], %cst, %1 {in_bounds = [true]} : memref<1x4xf32>, vector<1xf32>
      vector.transfer_write %2, %arg0[%c0, %arg1], %1 {in_bounds = [true]} : vector<1xf32>, memref<1x4xf32>
      scf.reduce 
    }
    return
  }
}

// -----
module {
  func.func @fuse_vector_transfer_subview_rank_reducing(%arg0: memref<1x4xf32>, %arg1: memref<1x4xf32>) {
    %c0 = arith.constant 0 : index
    %c1 = arith.constant 1 : index
    %c4 = arith.constant 4 : index
    %cst = arith.constant 0.000000e+00 : f32
    %cst_0 = arith.constant dense<1.000000e+00> : vector<4xf32>
    scf.parallel (%arg2) = (%c0) to (%c1) step (%c1) {
      %subview = memref.subview %arg0[%arg2, %c0] [1, 4] [1, 1] : memref<1x4xf32> to memref<4xf32, strided<[1], offset: ?>>
      vector.transfer_write %cst_0, %subview[%c0] {in_bounds = [true]} : vector<4xf32>, memref<4xf32, strided<[1], offset: ?>>
      scf.reduce 
    }
    scf.parallel (%arg2) = (%c0) to (%c1) step (%c1) {
      %0 = scf.for %arg3 = %c0 to %c4 step %c1 iter_args(%arg4 = %cst) -> (f32) {
        %1 = memref.load %arg0[%arg2, %arg3] : memref<1x4xf32>
        %2 = arith.addf %1, %arg4 : f32
        scf.yield %2 : f32
      }
      memref.store %0, %arg1[%arg2, %c0] : memref<1x4xf32>
      scf.reduce 
    }
    return
  }
}

// -----
module {
  func.func @do_not_fuse_vector_transfer_subview_offset(%arg0: memref<1x4xf32>, %arg1: memref<1x4xf32>) {
    %c0 = arith.constant 0 : index
    %c1 = arith.constant 1 : index
    %c4 = arith.constant 4 : index
    %cst = arith.constant 0.000000e+00 : f32
    %cst_0 = arith.constant dense<1.000000e+00> : vector<4xf32>
    scf.parallel (%arg2) = (%c0) to (%c1) step (%c1) {
      %subview = memref.subview %arg0[%arg2, %c0] [1, 4] [1, 1] : memref<1x4xf32> to memref<4xf32, strided<[1], offset: ?>>
      vector.transfer_write %cst_0, %subview[%c0] {in_bounds = [true]} : vector<4xf32>, memref<4xf32, strided<[1], offset: ?>>
      scf.reduce 
    }
    scf.parallel (%arg2) = (%c0) to (%c1) step (%c1) {
      %0 = scf.for %arg3 = %c0 to %c4 step %c1 iter_args(%arg4 = %cst) -> (f32) {
        %3 = memref.load %arg0[%arg2, %arg3] : memref<1x4xf32>
        %4 = arith.addf %3, %arg4 : f32
        scf.yield %4 : f32
      }
      %subview = memref.subview %arg0[%arg2, %c1] [1, 3] [1, 1] : memref<1x4xf32> to memref<3xf32, strided<[1], offset: ?>>
      %1 = memref.load %subview[%c0] : memref<3xf32, strided<[1], offset: ?>>
      %2 = arith.addf %0, %1 : f32
      memref.store %2, %arg1[%arg2, %c0] : memref<1x4xf32>
      scf.reduce 
    }
    return
  }
}

// -----
module {
  func.func @fuse_vector_transfer_no_subview(%arg0: memref<1x4xf32>, %arg1: memref<1x4xf32>) {
    %c0 = arith.constant 0 : index
    %c1 = arith.constant 1 : index
    %c4 = arith.constant 4 : index
    %cst = arith.constant 0.000000e+00 : f32
    %cst_0 = arith.constant dense<2.000000e+00> : vector<4xf32>
    scf.parallel (%arg2) = (%c0) to (%c1) step (%c1) {
      vector.transfer_write %cst_0, %arg0[%c0, %arg2] {in_bounds = [true]} : vector<4xf32>, memref<1x4xf32>
      scf.reduce 
    }
    scf.parallel (%arg2) = (%c0) to (%c1) step (%c1) {
      %0 = scf.for %arg3 = %c0 to %c4 step %c1 iter_args(%arg4 = %cst) -> (f32) {
        %1 = memref.load %arg0[%c0, %arg3] : memref<1x4xf32>
        %2 = arith.addf %1, %arg4 : f32
        scf.yield %2 : f32
      }
      memref.store %0, %arg1[%c0, %c0] : memref<1x4xf32>
      scf.reduce 
    }
    return
  }
}

// -----
module {
  func.func @fuse_vector_transfer_scalar_load_rank2(%arg0: memref<2x4xf32>, %arg1: memref<2x4xf32>) {
    %c0 = arith.constant 0 : index
    %c1 = arith.constant 1 : index
    %c2 = arith.constant 2 : index
    %cst = arith.constant dense<1.000000e+00> : vector<2x4xf32>
    scf.parallel (%arg2) = (%c0) to (%c1) step (%c1) {
      vector.transfer_write %cst, %arg0[%c0, %c0] {in_bounds = [true, true]} : vector<2x4xf32>, memref<2x4xf32>
      scf.reduce 
    }
    scf.parallel (%arg2) = (%c0) to (%c1) step (%c1) {
      %0 = memref.load %arg0[%c0, %c1] : memref<2x4xf32>
      %1 = memref.load %arg0[%c1, %c2] : memref<2x4xf32>
      %2 = arith.addf %0, %1 : f32
      memref.store %2, %arg1[%c0, %c0] : memref<2x4xf32>
      scf.reduce 
    }
    return
  }
}

// -----
module {
  func.func @fuse_vector_transfer_scalar_load_loop_rank2(%arg0: memref<2x4xf32>, %arg1: memref<2x4xf32>) {
    %c0 = arith.constant 0 : index
    %c1 = arith.constant 1 : index
    %c4 = arith.constant 4 : index
    %cst = arith.constant 0.000000e+00 : f32
    %cst_0 = arith.constant dense<2.000000e+00> : vector<2x4xf32>
    scf.parallel (%arg2) = (%c0) to (%c1) step (%c1) {
      vector.transfer_write %cst_0, %arg0[%c0, %c0] {in_bounds = [true, true]} : vector<2x4xf32>, memref<2x4xf32>
      scf.reduce 
    }
    scf.parallel (%arg2) = (%c0) to (%c1) step (%c1) {
      %0 = scf.for %arg3 = %c0 to %c4 step %c1 iter_args(%arg4 = %cst) -> (f32) {
        %1 = memref.load %arg0[%c1, %arg3] : memref<2x4xf32>
        %2 = arith.addf %1, %arg4 : f32
        scf.yield %2 : f32
      }
      memref.store %0, %arg1[%c0, %c0] : memref<2x4xf32>
      scf.reduce 
    }
    return
  }
}

// -----
module {
  func.func @fuse_vector_store_scalar_load_rank2(%arg0: memref<2x4xf32>, %arg1: memref<2x4xf32>) {
    %c0 = arith.constant 0 : index
    %c1 = arith.constant 1 : index
    %c2 = arith.constant 2 : index
    %c3 = arith.constant 3 : index
    %cst = arith.constant dense<3.000000e+00> : vector<2x4xf32>
    scf.parallel (%arg2) = (%c0) to (%c1) step (%c1) {
      vector.store %cst, %arg0[%c0, %c0] : memref<2x4xf32>, vector<2x4xf32>
      scf.reduce 
    }
    scf.parallel (%arg2) = (%c0) to (%c1) step (%c1) {
      %0 = memref.load %arg0[%c1, %c2] : memref<2x4xf32>
      %1 = memref.load %arg0[%c0, %c3] : memref<2x4xf32>
      %2 = arith.addf %0, %1 : f32
      memref.store %2, %arg1[%c0, %c0] : memref<2x4xf32>
      scf.reduce 
    }
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

// -----
#map = affine_map<(d0, d1) -> (d0 * 8 + d1)>
module {
  func.func @test_fuse_interchanged_loops(%arg0: memref<1x64xf32>) {
    %c8 = arith.constant 8 : index
    %c1 = arith.constant 1 : index
    %c0 = arith.constant 0 : index
    %alloc = memref.alloc() : memref<1x8x8xf32>
    %alloc_0 = memref.alloc() {alignment = 64 : i64} : memref<8x8x1xf32>
    scf.parallel (%arg1, %arg2) = (%c0, %c0) to (%c8, %c8) step (%c1, %c1) {
      %0 = memref.load %alloc[%c0, %arg1, %arg2] : memref<1x8x8xf32>
      memref.store %0, %alloc_0[%arg2, %arg1, %c0] : memref<8x8x1xf32>
      scf.reduce 
    }
    scf.parallel (%arg1, %arg2) = (%c0, %c0) to (%c8, %c8) step (%c1, %c1) {
      %0 = memref.load %alloc_0[%arg1, %arg2, %c0] : memref<8x8x1xf32>
      %1 = affine.apply #map(%arg1, %arg2)
      memref.store %0, %arg0[%c0, %1] : memref<1x64xf32>
      scf.reduce 
    }
    return
  }
}

// -----
module {
  func.func @fuse_three_cycle_permutation(%arg0: memref<2x3x5xf32>) {
    %alloc = memref.alloc() : memref<2x3x5xf32>
    %alloc_0 = memref.alloc() : memref<2x3x5xf32>
    %c0 = arith.constant 0 : index
    %c1 = arith.constant 1 : index
    %c2 = arith.constant 2 : index
    %c3 = arith.constant 3 : index
    %c5 = arith.constant 5 : index
    %cst = arith.constant 1.000000e+00 : f32
    scf.parallel (%arg1, %arg2, %arg3) = (%c0, %c0, %c0) to (%c2, %c3, %c5) step (%c1, %c1, %c1) {
      %0 = memref.load %alloc[%arg1, %arg2, %arg3] : memref<2x3x5xf32>
      %1 = arith.addf %0, %cst : f32
      memref.store %1, %alloc_0[%arg1, %arg2, %arg3] : memref<2x3x5xf32>
      scf.reduce 
    }
    scf.parallel (%arg1, %arg2, %arg3) = (%c0, %c0, %c0) to (%c5, %c2, %c3) step (%c1, %c1, %c1) {
      %0 = memref.load %alloc_0[%arg2, %arg3, %arg1] : memref<2x3x5xf32>
      memref.store %0, %arg0[%arg2, %arg3, %arg1] : memref<2x3x5xf32>
      scf.reduce 
    }
    return
  }
}

// -----
module {
  func.func @fuse_duplicate_axes_permutation(%arg0: memref<2x2x3x3xf32>) {
    %alloc = memref.alloc() : memref<2x2x3x3xf32>
    %c0 = arith.constant 0 : index
    %c1 = arith.constant 1 : index
    %c2 = arith.constant 2 : index
    %c3 = arith.constant 3 : index
    %cst = arith.constant 1.000000e+00 : f32
    scf.parallel (%arg1, %arg2, %arg3, %arg4) = (%c0, %c0, %c0, %c0) to (%c2, %c2, %c3, %c3) step (%c1, %c1, %c1, %c1) {
      memref.store %cst, %alloc[%arg1, %arg2, %arg3, %arg4] : memref<2x2x3x3xf32>
      scf.reduce 
    }
    scf.parallel (%arg1, %arg2, %arg3, %arg4) = (%c0, %c0, %c0, %c0) to (%c3, %c3, %c2, %c2) step (%c1, %c1, %c1, %c1) {
      %0 = memref.load %alloc[%arg4, %arg3, %arg1, %arg2] : memref<2x2x3x3xf32>
      memref.store %0, %arg0[%arg4, %arg3, %arg1, %arg2] : memref<2x2x3x3xf32>
      scf.reduce 
    }
    return
  }
}

// -----
module {
  func.func @fuse_interchanged_reductions(%arg0: memref<2x3xf32>, %arg1: memref<2x3xf32>) -> (f32, f32) {
    %c0 = arith.constant 0 : index
    %c1 = arith.constant 1 : index
    %c2 = arith.constant 2 : index
    %c3 = arith.constant 3 : index
    %cst = arith.constant 1.000000e+00 : f32
    %cst_0 = arith.constant 2.000000e+00 : f32
    %0 = scf.parallel (%arg2, %arg3) = (%c0, %c0) to (%c2, %c3) step (%c1, %c1) init (%cst) -> f32 {
      %2 = memref.load %arg0[%arg2, %arg3] : memref<2x3xf32>
      scf.reduce(%2 : f32) {
      ^bb0(%arg4: f32, %arg5: f32):
        %3 = arith.addf %arg4, %arg5 : f32
        scf.reduce.return %3 : f32
      }
    }
    %1 = scf.parallel (%arg2, %arg3) = (%c0, %c0) to (%c3, %c2) step (%c1, %c1) init (%cst_0) -> f32 {
      %2 = memref.load %arg1[%arg3, %arg2] : memref<2x3xf32>
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
  func.func @fuse_three_cycle_reductions(%arg0: memref<2x3x5xf32>, %arg1: memref<2x3x5xf32>) -> (f32, f32) {
    %c0 = arith.constant 0 : index
    %c1 = arith.constant 1 : index
    %c2 = arith.constant 2 : index
    %c3 = arith.constant 3 : index
    %c5 = arith.constant 5 : index
    %cst = arith.constant 1.000000e+00 : f32
    %cst_0 = arith.constant 2.000000e+00 : f32
    %0 = scf.parallel (%arg2, %arg3, %arg4) = (%c0, %c0, %c0) to (%c2, %c3, %c5) step (%c1, %c1, %c1) init (%cst) -> f32 {
      %2 = memref.load %arg0[%arg2, %arg3, %arg4] : memref<2x3x5xf32>
      scf.reduce(%2 : f32) {
      ^bb0(%arg5: f32, %arg6: f32):
        %3 = arith.addf %arg5, %arg6 : f32
        scf.reduce.return %3 : f32
      }
    }
    %1 = scf.parallel (%arg2, %arg3, %arg4) = (%c0, %c0, %c0) to (%c5, %c2, %c3) step (%c1, %c1, %c1) init (%cst_0) -> f32 {
      %2 = memref.load %arg1[%arg3, %arg4, %arg2] : memref<2x3x5xf32>
      scf.reduce(%2 : f32) {
      ^bb0(%arg5: f32, %arg6: f32):
        %3 = arith.mulf %arg5, %arg6 : f32
        scf.reduce.return %3 : f32
      }
    }
    return %0, %1 : f32, f32
  }
}

// -----
module {
  func.func @fuse_interleaved_duplicate_axes_permutation(%arg0: memref<2x3x2x3xf32>) {
    %alloc = memref.alloc() : memref<2x3x2x3xf32>
    %c0 = arith.constant 0 : index
    %c1 = arith.constant 1 : index
    %c2 = arith.constant 2 : index
    %c3 = arith.constant 3 : index
    %cst = arith.constant 1.000000e+00 : f32
    scf.parallel (%arg1, %arg2, %arg3, %arg4) = (%c0, %c0, %c0, %c0) to (%c2, %c3, %c2, %c3) step (%c1, %c1, %c1, %c1) {
      memref.store %cst, %alloc[%arg1, %arg2, %arg3, %arg4] : memref<2x3x2x3xf32>
      scf.reduce 
    }
    scf.parallel (%arg1, %arg2, %arg3, %arg4) = (%c0, %c0, %c0, %c0) to (%c3, %c2, %c3, %c2) step (%c1, %c1, %c1, %c1) {
      %0 = memref.load %alloc[%arg2, %arg1, %arg4, %arg3] : memref<2x3x2x3xf32>
      memref.store %0, %arg0[%arg2, %arg1, %arg4, %arg3] : memref<2x3x2x3xf32>
      scf.reduce 
    }
    return
  }
}

// -----
module {
  func.func @permuted_dominance_bail_chain(%arg0: memref<2x3xf32>, %arg1: memref<2x3xf32>) -> f32 {
    %alloc = memref.alloc() : memref<2x3xf32>
    %c0 = arith.constant 0 : index
    %c1 = arith.constant 1 : index
    %c2 = arith.constant 2 : index
    %c3 = arith.constant 3 : index
    %cst = arith.constant 1.000000e+00 : f32
    %0 = scf.parallel (%arg2, %arg3) = (%c0, %c0) to (%c2, %c3) step (%c1, %c1) init (%cst) -> f32 {
      %2 = memref.load %arg0[%arg2, %arg3] : memref<2x3xf32>
      scf.reduce(%2 : f32) {
      ^bb0(%arg4: f32, %arg5: f32):
        %3 = arith.addf %arg4, %arg5 : f32
        scf.reduce.return %3 : f32
      }
    }
    %1 = arith.addf %0, %cst : f32
    scf.parallel (%arg2, %arg3) = (%c0, %c0) to (%c3, %c2) step (%c1, %c1) {
      memref.store %1, %alloc[%arg3, %arg2] : memref<2x3xf32>
      scf.reduce 
    }
    scf.parallel (%arg2, %arg3) = (%c0, %c0) to (%c2, %c3) step (%c1, %c1) {
      %2 = memref.load %alloc[%arg2, %arg3] : memref<2x3xf32>
      memref.store %2, %arg1[%arg2, %arg3] : memref<2x3xf32>
      scf.reduce 
    }
    return %1 : f32
  }
}

// -----
module {
  func.func @fuse_chain_after_interchanged_reduction(%arg0: memref<2x3xf32>, %arg1: memref<2x3xf32>) -> (f32, f32) {
    %alloc = memref.alloc() : memref<2x3xf32>
    %alloc_0 = memref.alloc() : memref<2x3xf32>
    %c0 = arith.constant 0 : index
    %c1 = arith.constant 1 : index
    %c2 = arith.constant 2 : index
    %c3 = arith.constant 3 : index
    %cst = arith.constant 1.000000e+00 : f32
    %cst_1 = arith.constant 2.000000e+00 : f32
    %0 = scf.parallel (%arg2, %arg3) = (%c0, %c0) to (%c2, %c3) step (%c1, %c1) init (%cst) -> f32 {
      %2 = memref.load %arg0[%arg2, %arg3] : memref<2x3xf32>
      memref.store %2, %alloc[%arg2, %arg3] : memref<2x3xf32>
      scf.reduce(%2 : f32) {
      ^bb0(%arg4: f32, %arg5: f32):
        %3 = arith.addf %arg4, %arg5 : f32
        scf.reduce.return %3 : f32
      }
    }
    %1 = scf.parallel (%arg2, %arg3) = (%c0, %c0) to (%c3, %c2) step (%c1, %c1) init (%cst_1) -> f32 {
      %2 = memref.load %alloc[%arg3, %arg2] : memref<2x3xf32>
      memref.store %2, %alloc_0[%arg3, %arg2] : memref<2x3xf32>
      scf.reduce(%2 : f32) {
      ^bb0(%arg4: f32, %arg5: f32):
        %3 = arith.mulf %arg4, %arg5 : f32
        scf.reduce.return %3 : f32
      }
    }
    scf.parallel (%arg2, %arg3) = (%c0, %c0) to (%c2, %c3) step (%c1, %c1) {
      %2 = memref.load %alloc_0[%arg2, %arg3] : memref<2x3xf32>
      memref.store %2, %arg1[%arg2, %arg3] : memref<2x3xf32>
      scf.reduce 
    }
    return %0, %1 : f32, f32
  }
}

