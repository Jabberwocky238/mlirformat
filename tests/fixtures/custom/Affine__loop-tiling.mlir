module {
  func.func @loop_tiling() {
    affine.for %arg0 = 0 to 256 {
      affine.for %arg1 = 0 to 512 {
        affine.for %arg2 = 0 to 1024 {
          "test.foo"(%arg0, %arg1, %arg2) : (index, index, index) -> ()
        }
      }
    }
    affine.for %arg0 = 0 to 50 {
      "test.bar"(%arg0, %arg0) : (index, index) -> ()
    }
    affine.for %arg0 = 0 to 21 {
      "test.foobar"(%arg0) : (index) -> ()
    }
    return
  }
}

// -----
#map = affine_map<()[s0] -> (0, s0)>
#map1 = affine_map<()[s0, s1] -> (s0, 4096 floordiv s1)>
module {
  func.func @loop_max_min_bound(%arg0: memref<?xi32>, %arg1: index, %arg2: index) {
    %c0 = arith.constant 0 : index
    %dim = memref.dim %arg0, %c0 : memref<?xi32>
    affine.for %arg3 = max #map()[%arg1] to min #map1()[%dim, %arg2] {
      %0 = arith.addi %arg3, %arg3 : index
    }
    return
  }
}

// -----
module {
  func.func @simple_matmul(%arg0: memref<256x256xvector<64xf32>>, %arg1: memref<256x256xvector<64xf32>>, %arg2: memref<256x256xvector<64xf32>>) -> memref<256x256xvector<64xf32>> {
    affine.for %arg3 = 0 to 256 {
      affine.for %arg4 = 0 to 256 {
        affine.for %arg5 = 0 to 250 {
          %0 = affine.load %arg0[%arg3, %arg5] : memref<256x256xvector<64xf32>>
          %1 = affine.load %arg1[%arg5, %arg4] : memref<256x256xvector<64xf32>>
          %2 = affine.load %arg2[%arg3, %arg4] : memref<256x256xvector<64xf32>>
          %3 = arith.mulf %0, %1 : vector<64xf32>
          %4 = arith.addf %2, %3 : vector<64xf32>
          affine.store %4, %arg2[%arg3, %arg4] : memref<256x256xvector<64xf32>>
        }
      }
    }
    return %arg2 : memref<256x256xvector<64xf32>>
  }
}

// -----
module {
  func.func @tile_using_symbolic_loop_upper_bounds(%arg0: memref<?x?xf32>, %arg1: memref<?x?xf32>, %arg2: memref<?x?xf32>) {
    %cst = arith.constant 0.000000e+00 : f32
    %c0 = arith.constant 0 : index
    %dim = memref.dim %arg0, %c0 : memref<?x?xf32>
    affine.for %arg3 = 0 to %dim {
      affine.for %arg4 = 0 to %dim {
        affine.store %cst, %arg2[%arg3, %arg4] : memref<?x?xf32>
        affine.for %arg5 = 0 to %dim {
          %0 = affine.load %arg0[%arg3, %arg5] : memref<?x?xf32>
          %1 = affine.load %arg1[%arg5, %arg4] : memref<?x?xf32>
          %2 = arith.mulf %0, %1 : f32
          %3 = affine.load %arg2[%arg3, %arg4] : memref<?x?xf32>
          %4 = arith.addf %3, %2 : f32
          affine.store %4, %arg2[%arg3, %arg4] : memref<?x?xf32>
        }
      }
    }
    return
  }
}

// -----
#map = affine_map<()[s0, s1] -> (s0 + s1)>
module {
  func.func @tile_using_loop_upper_bounds_in_two_symbols(%arg0: memref<?xf32>, %arg1: index) {
    %c0 = arith.constant 0 : index
    %dim = memref.dim %arg0, %c0 : memref<?xf32>
    affine.for %arg2 = 0 to #map()[%dim, %arg1] {
      %0 = affine.load %arg0[%arg2] : memref<?xf32>
    }
    return
  }
}

// -----
module {
  func.func @tile_loop_with_non_unit_step(%arg0: memref<50xf32>, %arg1: index) {
    affine.for %arg2 = 0 to %arg1 step 5 {
      %0 = affine.load %arg0[%arg2] : memref<50xf32>
    }
    return
  }
}

// -----
#map = affine_map<(d0) -> (d0)>
#map1 = affine_map<(d0) -> (d0 + 2)>
#map2 = affine_map<(d0) -> (d0 + 4)>
module {
  func.func @tile_size_larger_than_trip_count_symbolic_bound(%arg0: index, %arg1: index) {
    affine.for %arg2 = #map(%arg0) to #map1(%arg0) {
      affine.for %arg3 = #map(%arg1) to #map2(%arg1) {
        "test.foo"() : () -> ()
      }
    }
    return
  }
}

// -----
module {
  func.func @trip_count_one(%arg0: memref<196608x1xf32>, %arg1: memref<196608x1xf32>) -> memref<196608x1xf32> {
    affine.for %arg2 = 0 to 196608 {
      affine.for %arg3 = 0 to 1 {
        %0 = affine.load %arg0[%arg2, %arg3] : memref<196608x1xf32>
        affine.store %0, %arg1[%arg2, %arg3] : memref<196608x1xf32>
      }
    }
    return %arg1 : memref<196608x1xf32>
  }
}

// -----
module {
  func.func @separate_full_tile_2d(%arg0: index, %arg1: index) {
    affine.for %arg2 = 0 to %arg0 {
      affine.for %arg3 = 0 to %arg1 {
        "test.foo"() : () -> ()
      }
    }
    return
  }
}

// -----
#map = affine_map<(d0)[s0] -> (d0, s0)>
module {
  func.func @non_hyperrectangular_loop() {
    %c128 = arith.constant 128 : index
    affine.for %arg0 = 0 to %c128 {
      affine.for %arg1 = 0 to min #map(%arg0)[%c128] {
        "test.foo"() : () -> ()
      }
    }
    return
  }
}

// -----
module {
  func.func @yield_values(%arg0: index) {
    %0 = affine.for %arg1 = 0 to 10 iter_args(%arg2 = %arg0) -> (index) {
      "test.foo"() : () -> ()
      affine.yield %arg2 : index
    }
    return
  }
}

// -----
module {
}

// -----
#map = affine_map<(d0, d1) -> (d0, d1)>
module {
  func.func @separate_full_tile_1d_max_min(%arg0: index, %arg1: index, %arg2: index, %arg3: index) {
    affine.for %arg4 = max #map(%arg0, %arg1) to min #map(%arg2, %arg3) {
    }
    return
  }
}

