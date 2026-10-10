module {
}

// -----
module {
  func.func @loop_tiling_3d(%arg0: index, %arg1: index, %arg2: index) {
    affine.for %arg3 = 0 to 256 {
      affine.for %arg4 = 0 to 512 {
        affine.for %arg5 = 0 to 1024 {
          "test.foo"(%arg3, %arg4, %arg5) : (index, index, index) -> ()
        }
      }
    }
    return
  }
}

// -----
module {
  func.func @loop_tiling_non_unit_step(%arg0: index, %arg1: index, %arg2: index) {
    affine.for %arg3 = 0 to 256 step 4 {
      affine.for %arg4 = 0 to 512 step 3 {
        affine.for %arg5 = 0 to 1024 step 2 {
          "test.foo"(%arg3, %arg4, %arg5) : (index, index, index) -> ()
        }
      }
    }
    return
  }
}

// -----
#map = affine_map<()[s0, s1] -> (s0, 4096 floordiv s1)>
module {
  func.func @tile_loop_with_div_in_upper_bound(%arg0: index, %arg1: memref<?xi32>, %arg2: index, %arg3: index) {
    %c0 = arith.constant 0 : index
    %dim = memref.dim %arg1, %c0 : memref<?xi32>
    affine.for %arg4 = 0 to min #map()[%dim, %arg3] {
      %0 = arith.addi %arg4, %arg4 : index
    }
    return
  }
}

// -----
#map = affine_map<()[s0, s1] -> (s0, 4096 floordiv s1)>
module {
  func.func @tile_loop_with_div_in_upper_bound_non_unit_step(%arg0: index, %arg1: memref<?xi32>, %arg2: index, %arg3: index) {
    %c0 = arith.constant 0 : index
    %dim = memref.dim %arg1, %c0 : memref<?xi32>
    affine.for %arg4 = 0 to min #map()[%dim, %arg3] step 4 {
      %0 = arith.addi %arg4, %arg4 : index
    }
    return
  }
}

// -----
#map = affine_map<()[s0] -> (s0 + 16)>
module {
  func.func @tile_loop_with_non_zero_lb(%arg0: index, %arg1: index, %arg2: index, %arg3: index) {
    affine.for %arg4 = 8 to 256 {
      affine.for %arg5 = 8 to #map()[%arg3] {
        affine.for %arg6 = 8 to #map()[%arg3] step 4 {
          "test.foo"(%arg4, %arg5, %arg6) : (index, index, index) -> ()
        }
      }
    }
    return
  }
}

// -----
module {
  func.func @simple_matmul(%arg0: index, %arg1: index, %arg2: index, %arg3: memref<256x256xvector<64xf32>>, %arg4: memref<256x256xvector<64xf32>>, %arg5: memref<256x256xvector<64xf32>>) -> memref<256x256xvector<64xf32>> {
    affine.for %arg6 = 0 to 256 {
      affine.for %arg7 = 0 to 256 {
        affine.for %arg8 = 0 to 250 {
          %0 = affine.load %arg3[%arg6, %arg8] : memref<256x256xvector<64xf32>>
          %1 = affine.load %arg4[%arg8, %arg7] : memref<256x256xvector<64xf32>>
          %2 = affine.load %arg5[%arg6, %arg7] : memref<256x256xvector<64xf32>>
          %3 = arith.mulf %0, %1 : vector<64xf32>
          %4 = arith.addf %2, %3 : vector<64xf32>
          affine.store %4, %arg5[%arg6, %arg7] : memref<256x256xvector<64xf32>>
        }
      }
    }
    return %arg5 : memref<256x256xvector<64xf32>>
  }
}

// -----
module {
  func.func @tile_using_symbolic_loop_upper_bounds(%arg0: index, %arg1: index, %arg2: memref<?x?xf32>, %arg3: memref<?x?xf32>, %arg4: memref<?x?xf32>) {
    %cst = arith.constant 0.000000e+00 : f32
    %c0 = arith.constant 0 : index
    %dim = memref.dim %arg2, %c0 : memref<?x?xf32>
    affine.for %arg5 = 0 to %dim {
      affine.for %arg6 = 0 to %dim {
        affine.store %cst, %arg4[%arg5, %arg6] : memref<?x?xf32>
        affine.for %arg7 = 0 to %dim {
          %0 = affine.load %arg2[%arg5, %arg7] : memref<?x?xf32>
          %1 = affine.load %arg3[%arg7, %arg6] : memref<?x?xf32>
          %2 = arith.mulf %0, %1 : f32
          %3 = affine.load %arg4[%arg5, %arg6] : memref<?x?xf32>
          %4 = arith.addf %3, %2 : f32
          affine.store %4, %arg4[%arg5, %arg6] : memref<?x?xf32>
        }
      }
    }
    return
  }
}

// -----
#map = affine_map<()[s0, s1] -> (s0 + s1)>
module {
  func.func @tile_using_loop_upper_bounds_in_two_symbols(%arg0: index, %arg1: memref<?xf32>, %arg2: index) {
    %c0 = arith.constant 0 : index
    %dim = memref.dim %arg1, %c0 : memref<?xf32>
    affine.for %arg3 = 0 to #map()[%dim, %arg2] {
      %0 = affine.load %arg1[%arg3] : memref<?xf32>
    }
    return
  }
}

// -----
#map = affine_map<(d0)[s0] -> (d0 + s0 + 2)>
#map1 = affine_map<(d0)[s0] -> (d0 + s0 + 4)>
module {
  func.func @tile_using_upper_bounds_in_dimensions_and_symbols(%arg0: index, %arg1: index, %arg2: index, %arg3: index, %arg4: index) {
    affine.for %arg5 = 0 to #map(%arg2)[%arg4] {
      affine.for %arg6 = 0 to #map1(%arg3)[%arg4] {
        "test.foo"() : () -> ()
      }
    }
    return
  }
}

// -----
#map = affine_map<(d0)[s0] -> (d0 + s0 + 2)>
#map1 = affine_map<(d0)[s0] -> (d0 + s0 + 4)>
module {
  func.func @tile_using_upper_bounds_in_dimensions_and_symbols_non_unit_steps(%arg0: index, %arg1: index, %arg2: index, %arg3: index, %arg4: index) {
    affine.for %arg5 = 0 to #map(%arg2)[%arg4] step 2 {
      affine.for %arg6 = 0 to #map1(%arg3)[%arg4] step 4 {
        "test.foo"() : () -> ()
      }
    }
    return
  }
}

// -----
module {
  func.func @too_few_tile_size_params() {
    affine.for %arg0 = 0 to 256 {
      affine.for %arg1 = 0 to 512 {
        affine.for %arg2 = 0 to 1024 {
          "test.foo"(%arg0, %arg1, %arg2) : (index, index, index) -> ()
        }
      }
    }
    return
  }
}

// -----
module {
  func.func @invalid_type_for_tile_size_params(%arg0: f32, %arg1: f32, %arg2: f32) {
    affine.for %arg3 = 0 to 256 {
      affine.for %arg4 = 0 to 512 {
        affine.for %arg5 = 0 to 1024 {
          "test.foo"(%arg3, %arg4, %arg5) : (index, index, index) -> ()
        }
      }
    }
    return
  }
}

