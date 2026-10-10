module {
  func.func @normalize_parallel() {
    %cst = arith.constant 1.000000e+00 : f32
    %alloc = memref.alloc() : memref<2x4xf32>
    affine.parallel (%arg0, %arg1) = (0, 1) to (10, 5) step (3, 2) {
      affine.parallel (%arg2) = (%arg0) to (%arg1) {
        affine.store %cst, %alloc[%arg0, %arg2] : memref<2x4xf32>
      }
    }
    return
  }
}

// -----
#map = affine_map<(d0) -> (d0)>
#map1 = affine_map<(d0) -> (d0 + 4)>
module {
  func.func @relative_bounds(%arg0: index) {
    affine.for %arg1 = #map(%arg0) to #map1(%arg0) {
    }
    return
  }
}

// -----
module {
  func.func @promote_single_iter_loop(%arg0: memref<1xf32>, %arg1: memref<1xf32>) {
    affine.for %arg2 = 0 to 1 {
      %0 = affine.load %arg0[%arg2] : memref<1xf32>
      affine.store %0, %arg1[%arg2] : memref<1xf32>
    }
    return
  }
}

// -----
module {
  func.func @simple_loop_nest() {
    affine.for %arg0 = 2 to 32 step 2 {
      affine.for %arg1 = 0 to 32 step 3 {
        "test.foo"(%arg0, %arg1) : (index, index) -> ()
      }
    }
    return
  }
}

// -----
module {
  func.func @loop_with_unknown_upper_bound(%arg0: memref<?x?xf32>, %arg1: index) {
    %c0 = arith.constant 0 : index
    %dim = memref.dim %arg0, %c0 : memref<?x?xf32>
    affine.for %arg2 = 2 to %dim step 32 {
      affine.for %arg3 = 0 to %arg1 step 2 {
        "test.foo"(%arg2, %arg3) : (index, index) -> ()
      }
    }
    return
  }
}

// -----
#map = affine_map<(d0) -> (d0, 512)>
module {
  func.func @loop_with_multiple_upper_bounds(%arg0: memref<?x?xf32>, %arg1: index) {
    %c0 = arith.constant 0 : index
    %dim = memref.dim %arg0, %c0 : memref<?x?xf32>
    affine.for %arg2 = 2 to %dim step 32 {
      affine.for %arg3 = 2 to min #map(%arg1) {
        "test.foo"(%arg2, %arg3) : (index, index) -> ()
      }
    }
    return
  }
}

// -----
#map = affine_map<(d0) -> (d0)>
#map1 = affine_map<(d0)[s0] -> (d0 + 32, s0)>
module {
  func.func @tiled_matmul(%arg0: memref<1024x1024xf32>, %arg1: memref<1024x1024xf32>, %arg2: memref<1024x1024xf32>) {
    %c0 = arith.constant 0 : index
    %c1 = arith.constant 1 : index
    %dim = memref.dim %arg0, %c0 : memref<1024x1024xf32>
    %dim_0 = memref.dim %arg1, %c1 : memref<1024x1024xf32>
    %dim_1 = memref.dim %arg0, %c1 : memref<1024x1024xf32>
    affine.for %arg3 = 0 to %dim step 32 {
      affine.for %arg4 = 0 to %dim_0 step 32 {
        affine.for %arg5 = 0 to %dim_1 step 32 {
          affine.for %arg6 = #map(%arg3) to min #map1(%arg3)[%dim] {
            affine.for %arg7 = #map(%arg4) to min #map1(%arg4)[%dim_0] {
              affine.for %arg8 = #map(%arg5) to min #map1(%arg5)[%dim_1] {
                %0 = affine.load %arg0[%arg6, %arg8] : memref<1024x1024xf32>
                %1 = affine.load %arg1[%arg8, %arg7] : memref<1024x1024xf32>
                %2 = affine.load %arg2[%arg6, %arg7] : memref<1024x1024xf32>
                %3 = arith.mulf %0, %1 : f32
                %4 = arith.addf %2, %3 : f32
                affine.store %4, %arg2[%arg6, %arg7] : memref<1024x1024xf32>
              }
            }
          }
        }
      }
    }
    return
  }
}

// -----
module {
  func.func @constant_lower_bound() {
    %c0 = arith.constant 0 : index
    %c1 = arith.constant 1 : index
    scf.for %arg0 = %c0 to %c1 step %c1 {
      affine.for %arg1 = %c0 to %c1 {
      }
    }
    return
  }
}

// -----
#map = affine_map<()[s0, s1] -> (s0)>
module {
  func.func @upper_bound_by_symbol(%arg0: index, %arg1: index) {
    affine.for %arg2 = 0 to #map()[%arg0, %arg1] step 4 {
      "test.foo"(%arg2) : (index) -> ()
    }
    return
  }
}

// -----
#map = affine_map<()[s0, s1] -> (s0)>
module {
  func.func @lower_bound_by_symbol(%arg0: index, %arg1: index) {
    affine.for %arg2 = #map()[%arg0, %arg1] to 10 step 4 {
      "test.foo"(%arg2) : (index) -> ()
    }
    return
  }
}

// -----
#map = affine_map<(d0, d1) -> (d0)>
module {
  func.func @upper_bound_by_dim(%arg0: index, %arg1: index) {
    affine.for %arg2 = 0 to #map(%arg0, %arg1) step 4 {
      "test.foo"(%arg2) : (index) -> ()
    }
    return
  }
}

// -----
#map = affine_map<(d0, d1) -> (d0)>
module {
  func.func @upper_bound_by_dim(%arg0: index, %arg1: index) {
    affine.for %arg2 = #map(%arg0, %arg1) to 10 step 4 {
      "test.foo"(%arg2) : (index) -> ()
    }
    return
  }
}

// -----
#map = affine_map<(d0) -> (d0)>
#map1 = affine_map<(d0) -> (d0 + 64, 1024)>
#map2 = affine_map<(d0, d1) -> (d1 + 32, d0 + 64, 1024)>
module {
  func.func @multi_level_tiled_matmul() {
    %alloc = memref.alloc() : memref<1024xf16>
    affine.for %arg0 = 0 to 1024 step 64 {
      affine.for %arg1 = #map(%arg0) to min #map1(%arg0) step 32 {
        affine.for %arg2 = #map(%arg1) to min #map2(%arg0, %arg1) {
          %0 = affine.load %alloc[%arg2] : memref<1024xf16>
        }
      }
    }
    return
  }
}

