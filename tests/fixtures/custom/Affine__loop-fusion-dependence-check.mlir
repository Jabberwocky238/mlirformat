module {
}

// -----
module {
  func.func @cannot_fuse_would_create_cycle() {
    %alloc = memref.alloc() : memref<10xf32>
    %alloc_0 = memref.alloc() : memref<10xf32>
    %alloc_1 = memref.alloc() : memref<10xf32>
    %cst = arith.constant 7.000000e+00 : f32
    affine.for %arg0 = 0 to 10 {
      %0 = affine.load %alloc[%arg0] : memref<10xf32>
      affine.store %cst, %alloc_0[%arg0] : memref<10xf32>
    }
    affine.for %arg0 = 0 to 10 {
      affine.store %cst, %alloc[%arg0] : memref<10xf32>
      %0 = affine.load %alloc_1[%arg0] : memref<10xf32>
    }
    affine.for %arg0 = 0 to 10 {
      %0 = affine.load %alloc_0[%arg0] : memref<10xf32>
      affine.store %cst, %alloc_1[%arg0] : memref<10xf32>
    }
    return
  }
}

// -----
module {
  func.func @can_fuse_rar_dependence() {
    %alloc = memref.alloc() : memref<10xf32>
    %alloc_0 = memref.alloc() : memref<10xf32>
    %alloc_1 = memref.alloc() : memref<10xf32>
    %cst = arith.constant 7.000000e+00 : f32
    affine.for %arg0 = 0 to 10 {
      %0 = affine.load %alloc[%arg0] : memref<10xf32>
      affine.store %cst, %alloc_0[%arg0] : memref<10xf32>
    }
    affine.for %arg0 = 0 to 10 {
      %0 = affine.load %alloc[%arg0] : memref<10xf32>
      %1 = affine.load %alloc_1[%arg0] : memref<10xf32>
    }
    affine.for %arg0 = 0 to 10 {
      %0 = affine.load %alloc_0[%arg0] : memref<10xf32>
      affine.store %cst, %alloc_1[%arg0] : memref<10xf32>
    }
    return
  }
}

// -----
module {
  func.func @can_fuse_different_memrefs() {
    %alloc = memref.alloc() : memref<10xf32>
    %alloc_0 = memref.alloc() : memref<10xf32>
    %alloc_1 = memref.alloc() : memref<10xf32>
    %alloc_2 = memref.alloc() : memref<10xf32>
    %cst = arith.constant 7.000000e+00 : f32
    affine.for %arg0 = 0 to 10 {
      %0 = affine.load %alloc[%arg0] : memref<10xf32>
      affine.store %cst, %alloc_0[%arg0] : memref<10xf32>
    }
    affine.for %arg0 = 0 to 10 {
      affine.store %cst, %alloc_2[%arg0] : memref<10xf32>
      %0 = affine.load %alloc_1[%arg0] : memref<10xf32>
    }
    affine.for %arg0 = 0 to 10 {
      %0 = affine.load %alloc_0[%arg0] : memref<10xf32>
      affine.store %cst, %alloc_1[%arg0] : memref<10xf32>
    }
    return
  }
}

// -----
module {
  func.func @should_not_fuse_across_intermediate_store() {
    %alloc = memref.alloc() : memref<10xf32>
    %c0 = arith.constant 0 : index
    %cst = arith.constant 7.000000e+00 : f32
    affine.for %arg0 = 0 to 10 {
      %0 = affine.load %alloc[%arg0] : memref<10xf32>
      "op0"(%0) : (f32) -> ()
    }
    affine.store %cst, %alloc[%c0] : memref<10xf32>
    affine.for %arg0 = 0 to 10 {
      %0 = affine.load %alloc[%arg0] : memref<10xf32>
      "op1"(%0) : (f32) -> ()
    }
    return
  }
}

// -----
module {
  func.func @should_not_fuse_across_intermediate_load() {
    %alloc = memref.alloc() : memref<10xf32>
    %c0 = arith.constant 0 : index
    %cst = arith.constant 7.000000e+00 : f32
    affine.for %arg0 = 0 to 10 {
      affine.store %cst, %alloc[%arg0] : memref<10xf32>
    }
    %0 = affine.load %alloc[%c0] : memref<10xf32>
    "op0"(%0) : (f32) -> ()
    affine.for %arg0 = 0 to 10 {
      affine.store %cst, %alloc[%arg0] : memref<10xf32>
    }
    return
  }
}

// -----
module {
  func.func @should_not_fuse_across_ssa_value_def() {
    %alloc = memref.alloc() : memref<10xf32>
    %alloc_0 = memref.alloc() : memref<10xf32>
    %c0 = arith.constant 0 : index
    %cst = arith.constant 7.000000e+00 : f32
    affine.for %arg0 = 0 to 10 {
      %1 = affine.load %alloc[%arg0] : memref<10xf32>
      affine.store %1, %alloc_0[%arg0] : memref<10xf32>
    }
    %0 = affine.load %alloc_0[%c0] : memref<10xf32>
    "op0"(%0) : (f32) -> ()
    %c2 = arith.constant 2 : index
    affine.for %arg0 = 0 to 10 {
      affine.store %cst, %alloc[%c2] : memref<10xf32>
    }
    return
  }
}

// -----
module {
  func.func @should_not_fuse_store_before_load() {
    %alloc = memref.alloc() : memref<10xf32>
    %c0 = arith.constant 0 : index
    %cst = arith.constant 7.000000e+00 : f32
    affine.for %arg0 = 0 to 10 {
      affine.store %cst, %alloc[%arg0] : memref<10xf32>
      %0 = affine.load %alloc[%arg0] : memref<10xf32>
    }
    affine.for %arg0 = 0 to 10 {
      %0 = affine.load %alloc[%arg0] : memref<10xf32>
    }
    affine.for %arg0 = 0 to 10 {
      affine.store %cst, %alloc[%arg0] : memref<10xf32>
      %0 = affine.load %alloc[%arg0] : memref<10xf32>
    }
    return
  }
}

// -----
module {
  func.func @should_not_fuse_across_load_at_depth1() {
    %alloc = memref.alloc() : memref<10x10xf32>
    %c0 = arith.constant 0 : index
    %cst = arith.constant 7.000000e+00 : f32
    affine.for %arg0 = 0 to 10 {
      affine.for %arg1 = 0 to 10 {
        affine.store %cst, %alloc[%arg0, %arg1] : memref<10x10xf32>
      }
      %0 = affine.load %alloc[%arg0, %c0] : memref<10x10xf32>
      affine.for %arg1 = 0 to 10 {
        affine.store %cst, %alloc[%arg0, %arg1] : memref<10x10xf32>
      }
    }
    return
  }
}

// -----
module {
  func.func @should_not_fuse_across_load_in_loop_at_depth1() {
    %alloc = memref.alloc() : memref<10x10xf32>
    %c0 = arith.constant 0 : index
    %cst = arith.constant 7.000000e+00 : f32
    affine.for %arg0 = 0 to 10 {
      affine.for %arg1 = 0 to 10 {
        affine.store %cst, %alloc[%arg0, %arg1] : memref<10x10xf32>
      }
      affine.for %arg1 = 0 to 10 {
        %0 = affine.load %alloc[%arg0, %arg1] : memref<10x10xf32>
      }
      affine.for %arg1 = 0 to 10 {
        affine.store %cst, %alloc[%arg0, %arg1] : memref<10x10xf32>
      }
    }
    return
  }
}

// -----
module {
  func.func @should_not_fuse_across_store_at_depth1() {
    %alloc = memref.alloc() : memref<10x10xf32>
    %c0 = arith.constant 0 : index
    %cst = arith.constant 7.000000e+00 : f32
    affine.for %arg0 = 0 to 10 {
      affine.for %arg1 = 0 to 10 {
        %0 = affine.load %alloc[%arg0, %arg1] : memref<10x10xf32>
      }
      affine.store %cst, %alloc[%arg0, %c0] : memref<10x10xf32>
      affine.for %arg1 = 0 to 10 {
        %0 = affine.load %alloc[%arg0, %arg1] : memref<10x10xf32>
      }
    }
    return
  }
}

// -----
module {
  func.func @should_not_fuse_across_store_in_loop_at_depth1() {
    %alloc = memref.alloc() : memref<10x10xf32>
    %c0 = arith.constant 0 : index
    %cst = arith.constant 7.000000e+00 : f32
    affine.for %arg0 = 0 to 10 {
      affine.for %arg1 = 0 to 10 {
        %0 = affine.load %alloc[%arg0, %arg1] : memref<10x10xf32>
      }
      affine.for %arg1 = 0 to 10 {
        affine.store %cst, %alloc[%arg0, %arg1] : memref<10x10xf32>
      }
      affine.for %arg1 = 0 to 10 {
        %0 = affine.load %alloc[%arg0, %arg1] : memref<10x10xf32>
      }
    }
    return
  }
}

// -----
module {
  func.func @should_not_fuse_across_ssa_value_def_at_depth1() {
    %alloc = memref.alloc() : memref<10x10xf32>
    %alloc_0 = memref.alloc() : memref<10x10xf32>
    %c0 = arith.constant 0 : index
    %cst = arith.constant 7.000000e+00 : f32
    affine.for %arg0 = 0 to 10 {
      affine.for %arg1 = 0 to 10 {
        %1 = affine.load %alloc[%arg0, %arg1] : memref<10x10xf32>
        affine.store %1, %alloc_0[%arg0, %arg1] : memref<10x10xf32>
      }
      %0 = affine.load %alloc_0[%arg0, %c0] : memref<10x10xf32>
      "op0"(%0) : (f32) -> ()
      %c2 = arith.constant 2 : index
      affine.for %arg1 = 0 to 10 {
        affine.store %cst, %alloc[%arg0, %c2] : memref<10x10xf32>
      }
    }
    return
  }
}

