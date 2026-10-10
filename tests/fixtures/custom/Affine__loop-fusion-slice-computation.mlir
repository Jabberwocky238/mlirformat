module {
}

// -----
module {
  func.func @slice_depth1_loop_nest() {
    %alloc = memref.alloc() : memref<100xf32>
    %cst = arith.constant 7.000000e+00 : f32
    affine.for %arg0 = 0 to 16 {
      affine.store %cst, %alloc[%arg0] : memref<100xf32>
    }
    affine.for %arg0 = 0 to 5 {
      %0 = affine.load %alloc[%arg0] : memref<100xf32>
    }
    return
  }
}

// -----
module {
  func.func @forward_slice_slice_depth1_loop_nest() {
    %alloc = memref.alloc() : memref<100xf32>
    %cst = arith.constant 7.000000e+00 : f32
    affine.for %arg0 = 0 to 5 {
      affine.store %cst, %alloc[%arg0] : memref<100xf32>
    }
    affine.for %arg0 = 0 to 16 {
      %0 = affine.load %alloc[%arg0] : memref<100xf32>
    }
    return
  }
}

// -----
#map = affine_map<(d0) -> (d0 + 2)>
#map1 = affine_map<(d0) -> (d0 - 1)>
module {
  func.func @slice_depth1_loop_nest_with_offsets() {
    %alloc = memref.alloc() : memref<100xf32>
    %cst = arith.constant 7.000000e+00 : f32
    affine.for %arg0 = 0 to 16 {
      %0 = affine.apply #map(%arg0)
      affine.store %cst, %alloc[%0] : memref<100xf32>
    }
    affine.for %arg0 = 4 to 8 {
      %0 = affine.apply #map1(%arg0)
      %1 = affine.load %alloc[%0] : memref<100xf32>
    }
    return
  }
}

// -----
module {
  func.func @slice_depth2_loop_nest() {
    %alloc = memref.alloc() : memref<100x100xf32>
    %cst = arith.constant 7.000000e+00 : f32
    affine.for %arg0 = 0 to 16 {
      affine.for %arg1 = 0 to 16 {
        affine.store %cst, %alloc[%arg0, %arg1] : memref<100x100xf32>
      }
    }
    affine.for %arg0 = 0 to 10 {
      affine.for %arg1 = 0 to 8 {
        %0 = affine.load %alloc[%arg0, %arg1] : memref<100x100xf32>
      }
    }
    return
  }
}

// -----
module {
  func.func @slice_depth2_loop_nest_two_loads() {
    %alloc = memref.alloc() : memref<100x100xf32>
    %c0 = arith.constant 0 : index
    %cst = arith.constant 7.000000e+00 : f32
    affine.for %arg0 = 0 to 16 {
      affine.for %arg1 = 0 to 16 {
        affine.store %cst, %alloc[%arg0, %arg1] : memref<100x100xf32>
      }
    }
    affine.for %arg0 = 0 to 10 {
      affine.for %arg1 = 0 to 8 {
        %1 = affine.load %alloc[%arg0, %arg1] : memref<100x100xf32>
      }
      %0 = affine.load %alloc[%arg0, %c0] : memref<100x100xf32>
    }
    return
  }
}

// -----
module {
  func.func @slice_depth2_loop_nest_two_stores() {
    %alloc = memref.alloc() : memref<100x100xf32>
    %c0 = arith.constant 0 : index
    %cst = arith.constant 7.000000e+00 : f32
    affine.for %arg0 = 0 to 16 {
      affine.for %arg1 = 0 to 16 {
        affine.store %cst, %alloc[%arg0, %arg1] : memref<100x100xf32>
      }
      affine.store %cst, %alloc[%arg0, %c0] : memref<100x100xf32>
    }
    affine.for %arg0 = 0 to 10 {
      affine.for %arg1 = 0 to 8 {
        %0 = affine.load %alloc[%arg0, %arg1] : memref<100x100xf32>
      }
    }
    return
  }
}

// -----
module {
  func.func @slice_loop_nest_with_smaller_outer_trip_count() {
    %alloc = memref.alloc() : memref<100x100xf32>
    %c0 = arith.constant 0 : index
    %cst = arith.constant 7.000000e+00 : f32
    affine.for %arg0 = 0 to 16 {
      affine.for %arg1 = 0 to 16 {
        affine.store %cst, %alloc[%arg0, %arg1] : memref<100x100xf32>
      }
    }
    affine.for %arg0 = 0 to 8 {
      affine.for %arg1 = 0 to 10 {
        %0 = affine.load %alloc[%arg0, %arg1] : memref<100x100xf32>
      }
    }
    return
  }
}

