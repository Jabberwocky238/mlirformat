module {
}

// -----
#map = affine_map<(d0) -> (d0 - 1)>
#map1 = affine_map<(d0, d1) -> (d0)>
#map2 = affine_map<(d0, d1) -> (d1)>
#map3 = affine_map<(d0) -> (d0 + 1)>
module {
  func.func @compose_affine_maps_1dto2d_no_symbols() {
    %alloc = memref.alloc() : memref<4x4xf32>
    affine.for %arg0 = 0 to 15 {
      %0 = affine.apply #map(%arg0)
      %1 = affine.apply #map1(%0, %0)
      %2 = affine.apply #map2(%0, %0)
      %3 = memref.load %alloc[%1, %2] : memref<4x4xf32>
      %4 = affine.apply #map3(%arg0)
      %5 = affine.apply #map1(%4, %4)
      %6 = affine.apply #map2(%4, %4)
      memref.store %3, %alloc[%5, %6] : memref<4x4xf32>
      %7 = affine.apply #map1(%0, %4)
      %8 = affine.apply #map2(%0, %4)
      memref.store %3, %alloc[%7, %8] : memref<4x4xf32>
      %9 = affine.apply #map1(%4, %0)
      %10 = affine.apply #map2(%4, %0)
      memref.store %3, %alloc[%9, %10] : memref<4x4xf32>
    }
    return
  }
}

// -----
#map = affine_map<(d0)[s0] -> (d0 - s0)>
#map1 = affine_map<(d0) -> (d0 + 1)>
#map2 = affine_map<(d0, d1) -> (d0 + d1)>
#map3 = affine_map<(d0)[s0] -> (d0 + s0)>
module {
  func.func @compose_affine_maps_1dto2d_with_symbols() {
    %alloc = memref.alloc() : memref<4x4xf32>
    affine.for %arg0 = 0 to 15 {
      %c4 = arith.constant 4 : index
      %0 = affine.apply #map(%arg0)[%c4]
      %1 = memref.load %alloc[%0, %0] : memref<4x4xf32>
      %2 = affine.apply #map1(%arg0)
      %3 = affine.apply #map2(%0, %2)
      memref.store %1, %alloc[%3, %3] : memref<4x4xf32>
      %4 = affine.apply #map2(%2, %0)
      memref.store %1, %alloc[%4, %4] : memref<4x4xf32>
      %c5 = arith.constant 5 : index
      %5 = affine.apply #map3(%arg0)[%c5]
      %6 = affine.apply #map2(%5, %0)
      memref.store %1, %alloc[%6, %6] : memref<4x4xf32>
    }
    return
  }
}

// -----
#map = affine_map<(d0)[s0] -> (d0 ceildiv s0)>
#map1 = affine_map<(d0)[s0] -> (d0 mod s0)>
#map2 = affine_map<(d0, d1, d2, d3)[s0, s1] -> (d0 * s0 + d2)>
#map3 = affine_map<(d0, d1, d2, d3)[s0, s1] -> (d1 * s1 + d3)>
module {
  func.func @compose_affine_maps_2d_tile(%arg0: memref<16x32xf32>, %arg1: memref<16x32xf32>) {
    %c4 = arith.constant 4 : index
    %c8 = arith.constant 8 : index
    affine.for %arg2 = 0 to 16 {
      %0 = affine.apply #map(%arg2)[%c4]
      affine.for %arg3 = 0 to 16 {
        %1 = affine.apply #map(%arg3)[%c8]
        affine.for %arg4 = 0 to 16 {
          %2 = affine.apply #map1(%arg4)[%c4]
          affine.for %arg5 = 0 to 16 {
            %3 = affine.apply #map1(%arg5)[%c8]
            %4 = affine.apply #map2(%0, %1, %2, %3)[%c4, %c8]
            %5 = affine.apply #map3(%0, %1, %2, %3)[%c4, %c8]
            %6 = memref.load %arg0[%4, %5] : memref<16x32xf32>
            memref.store %6, %arg1[%4, %5] : memref<16x32xf32>
          }
        }
      }
    }
    return
  }
}

// -----
#map = affine_map<(d0, d1, d2)[s0, s1] -> (d0 + s0)>
#map1 = affine_map<(d0, d1, d2)[s0, s1] -> (d1 - s1)>
#map2 = affine_map<(d0, d1, d2)[s0, s1] -> (d2 * s0)>
#map3 = affine_map<(d0, d1)[s0, s1] -> (d0 * s1)>
#map4 = affine_map<(d0, d1)[s0, s1] -> (d1 ceildiv s0)>
module {
  func.func @compose_affine_maps_dependent_loads() {
    %alloc = memref.alloc() : memref<16x32xf32>
    %alloc_0 = memref.alloc() : memref<16x32xf32>
    affine.for %arg0 = 0 to 3 {
      affine.for %arg1 = 0 to 3 {
        affine.for %arg2 = 0 to 3 {
          %c3 = arith.constant 3 : index
          %c7 = arith.constant 7 : index
          %0 = affine.apply #map(%arg0, %arg1, %arg2)[%c3, %c7]
          %1 = affine.apply #map1(%arg0, %arg1, %arg2)[%c3, %c7]
          %2 = affine.apply #map2(%arg0, %arg1, %arg2)[%c3, %c7]
          %3 = memref.load %alloc[%0, %1] : memref<16x32xf32>
          memref.store %3, %alloc[%0, %2] : memref<16x32xf32>
          memref.store %3, %alloc[%1, %0] : memref<16x32xf32>
          %4 = affine.apply #map3(%1, %0)[%c3, %c7]
          %5 = affine.apply #map4(%1, %0)[%c3, %c7]
          memref.store %3, %alloc[%4, %5] : memref<16x32xf32>
        }
      }
    }
    return
  }
}

// -----
#map = affine_map<(d0) -> (d0 - 1)>
#map1 = affine_map<(d0) -> (d0 + 7)>
#map2 = affine_map<(d0) -> (d0 * 4)>
#map3 = affine_map<(d0, d1) -> (d0 ceildiv 8)>
#map4 = affine_map<(d0, d1) -> (d1 floordiv 3)>
module {
  func.func @compose_affine_maps_diamond_dependency(%arg0: f32, %arg1: memref<4x4xf32>) {
    affine.for %arg2 = 0 to 15 {
      %0 = affine.apply #map(%arg2)
      %1 = affine.apply #map1(%0)
      %2 = affine.apply #map2(%0)
      %3 = affine.apply #map3(%1, %2)
      %4 = affine.apply #map4(%1, %2)
      memref.store %arg0, %arg1[%3, %4] : memref<4x4xf32>
    }
    return
  }
}

// -----
#map = affine_map<(d0)[s0] -> (d0 + s0)>
#map1 = affine_map<(d0) -> (d0 * 4)>
#map2 = affine_map<(d0)[s0] -> (d0 floordiv s0)>
module {
  func.func @compose_affine_maps_multiple_symbols(%arg0: index, %arg1: index) -> index {
    %0 = affine.apply #map(%arg0)[%arg1]
    %1 = affine.apply #map1(%0)
    %2 = affine.apply #map2(%1)[%arg1]
    return %2 : index
  }
}

// -----
#map = affine_map<(d0, d1)[s0, s1] -> (d1 + s0 + s1)>
#map1 = affine_map<(d0, d1, d2) -> (d2 - (d0 + d1))>
module {
  func.func @arg_used_as_dim_and_symbol(%arg0: memref<100x100xf32>, %arg1: index, %arg2: f32) -> (memref<100x100xf32, 1>, memref<1xi32>) {
    %c9 = arith.constant 9 : index
    %alloc = memref.alloc() : memref<100x100xf32, 1>
    %alloc_0 = memref.alloc() : memref<1xi32>
    affine.for %arg3 = 0 to 100 {
      affine.for %arg4 = 0 to 100 {
        %0 = affine.apply #map(%arg3, %arg4)[%arg1, %c9]
        %1 = affine.apply #map1(%arg1, %c9, %0)
        memref.store %arg2, %alloc[%1, %arg1] : memref<100x100xf32, 1>
      }
    }
    return %alloc, %alloc_0 : memref<100x100xf32, 1>, memref<1xi32>
  }
}

// -----
#map = affine_map<()[s0] -> (s0)>
#map1 = affine_map<() -> (0)>
module {
  func.func @trivial_maps() {
    %alloc = memref.alloc() : memref<10xf32>
    %c0 = arith.constant 0 : index
    %cst = arith.constant 0.000000e+00 : f32
    affine.for %arg0 = 0 to 10 {
      %0 = affine.apply #map()[%c0]
      memref.store %cst, %alloc[%0] : memref<10xf32>
      %1 = memref.load %alloc[%c0] : memref<10xf32>
      %2 = affine.apply #map1()
      memref.store %cst, %alloc[%2] : memref<10xf32>
      memref.store %1, %alloc[%c0] : memref<10xf32>
    }
    return
  }
}

// -----
#map = affine_map<(d0, d1) -> (d0 - d1)>
module {
  func.func @partial_fold_map(%arg0: index, %arg1: index) -> index {
    %c42 = arith.constant 42 : index
    %0 = affine.apply #map(%arg0, %c42)
    return %0 : index
  }
}

// -----
#map = affine_map<(d0) -> (d0 * 4)>
#map1 = affine_map<()[s0, s1] -> (s0 * 8)>
#map2 = affine_map<()[s0, s1] -> (s1 * 16)>
module {
  func.func @symbolic_composition_a(%arg0: index, %arg1: index) -> index {
    %0 = affine.apply #map(%arg0)
    %1 = affine.apply #map1()[%0, %arg0]
    %2 = affine.apply #map2()[%arg1, %1]
    return %2 : index
  }
}

// -----
#map = affine_map<(d0) -> (d0)>
#map1 = affine_map<()[s0, s1, s2, s3] -> (s0 + s1 + s2 + s3)>
module {
  func.func @symbolic_composition_b(%arg0: index, %arg1: index, %arg2: index, %arg3: index) -> index {
    %0 = affine.apply #map(%arg0)
    %1 = affine.apply #map1()[%0, %0, %0, %0]
    return %1 : index
  }
}

// -----
#map = affine_map<(d0) -> (d0)>
#map1 = affine_map<()[s0, s1, s2, s3] -> (s0 + s1 + s2 + s3)>
module {
  func.func @symbolic_composition_c(%arg0: index, %arg1: index, %arg2: index, %arg3: index) -> index {
    %0 = affine.apply #map(%arg0)
    %1 = affine.apply #map(%arg1)
    %2 = affine.apply #map1()[%0, %0, %0, %1]
    return %2 : index
  }
}

// -----
#map = affine_map<(d0) -> (d0)>
#map1 = affine_map<()[s0] -> (s0)>
#map2 = affine_map<()[s0, s1, s2, s3] -> (s0 + s1 + s2 + s3)>
module {
  func.func @symbolic_composition_d(%arg0: index, %arg1: index, %arg2: index, %arg3: index) -> index {
    %0 = affine.apply #map(%arg0)
    %1 = affine.apply #map1()[%arg1]
    %2 = affine.apply #map2()[%0, %0, %0, %1]
    return %2 : index
  }
}

// -----
#map = affine_map<(d0)[s0] -> (d0 + s0 * 42 - 1)>
#map1 = affine_map<(d0) -> (d0 + 7)>
module {
  func.func @mix_dims_and_symbols_b(%arg0: index, %arg1: index) -> index {
    %0 = affine.apply #map(%arg0)[%arg1]
    %1 = affine.apply #map1(%0)
    return %1 : index
  }
}

// -----
#map = affine_map<(d0)[s0] -> (d0 + s0 * 42 - 1)>
#map1 = affine_map<(d0) -> (d0 + 7)>
#map2 = affine_map<(d0) -> (d0 * 4)>
module {
  func.func @mix_dims_and_symbols_c(%arg0: index, %arg1: index) -> index {
    %0 = affine.apply #map(%arg0)[%arg1]
    %1 = affine.apply #map1(%0)
    %2 = affine.apply #map2(%0)
    return %2 : index
  }
}

// -----
#map = affine_map<(d0)[s0] -> (d0 + s0 * 42 - 1)>
#map1 = affine_map<(d0) -> (d0 + 7)>
#map2 = affine_map<(d0) -> (d0 * 4)>
#map3 = affine_map<()[s0] -> (s0 ceildiv 8)>
module {
  func.func @mix_dims_and_symbols_d(%arg0: index, %arg1: index) -> index {
    %0 = affine.apply #map(%arg0)[%arg1]
    %1 = affine.apply #map1(%0)
    %2 = affine.apply #map2(%0)
    %3 = affine.apply #map3()[%1]
    return %3 : index
  }
}

// -----
#map = affine_map<(d0)[s0] -> (d0 + s0 * 42 - 1)>
#map1 = affine_map<(d0) -> (d0 + 7)>
#map2 = affine_map<(d0) -> (d0 * 4)>
#map3 = affine_map<()[s0] -> (s0 ceildiv 8)>
#map4 = affine_map<(d0) -> (d0 floordiv 3)>
module {
  func.func @mix_dims_and_symbols_e(%arg0: index, %arg1: index) -> index {
    %0 = affine.apply #map(%arg0)[%arg1]
    %1 = affine.apply #map1(%0)
    %2 = affine.apply #map2(%0)
    %3 = affine.apply #map3()[%1]
    %4 = affine.apply #map4(%2)
    return %4 : index
  }
}

// -----
#map = affine_map<(d0)[s0] -> (d0 + s0 * 42 - 1)>
#map1 = affine_map<(d0) -> (d0 + 7)>
#map2 = affine_map<(d0) -> (d0 * 4)>
#map3 = affine_map<()[s0] -> (s0 ceildiv 8)>
#map4 = affine_map<(d0) -> (d0 floordiv 3)>
#map5 = affine_map<(d0, d1)[s0, s1] -> (d0 - s1 + d1 - s0)>
module {
  func.func @mix_dims_and_symbols_f(%arg0: index, %arg1: index) -> index {
    %0 = affine.apply #map(%arg0)[%arg1]
    %1 = affine.apply #map1(%0)
    %2 = affine.apply #map2(%0)
    %3 = affine.apply #map3()[%1]
    %4 = affine.apply #map4(%2)
    %5 = affine.apply #map5(%3, %4)[%4, %3]
    return %5 : index
  }
}

// -----
#map = affine_map<(d0) -> (d0 * 4)>
#map1 = affine_map<()[s0, s1] -> (s0 * 4)>
#map2 = affine_map<()[s0, s1] -> (s1)>
#map3 = affine_map<()[s0, s1] -> (1024)>
module {
  func.func @mix_dims_and_symbols_g(%arg0: index, %arg1: index) -> (index, index, index) {
    %0 = affine.apply #map(%arg0)
    %1 = affine.apply #map1()[%arg1, %0]
    %2 = affine.apply #map2()[%arg1, %0]
    %3 = affine.apply #map3()[%arg1, %0]
    return %1, %2, %3 : index, index, index
  }
}

// -----
#map = affine_map<()[s0] -> (s0 + 1)>
#map1 = affine_map<(d0)[s0] -> (d0 floordiv s0)>
module {
  func.func @symbolic_semi_affine(%arg0: index, %arg1: index, %arg2: memref<?xf32>) {
    %cst = arith.constant 1.000000e+00 : f32
    affine.for %arg3 = 1 to 100 {
      %0 = affine.apply #map()[%arg0]
      %1 = affine.apply #map1(%arg3)[%0]
      memref.store %cst, %arg2[%1] : memref<?xf32>
    }
    return
  }
}

// -----
#map = affine_map<(d0, d1) -> (d0 + d1)>
#map1 = affine_map<(d0, d1) -> (0, d0 + d1)>
#map2 = affine_map<(d0, d1) -> (d0 - 2, d1 * 32)>
#map3 = affine_map<(d0) -> (0, 1)>
#map4 = affine_map<(d0, d1) -> (7, 9)>
#map5 = affine_map<()[s0] -> (0, s0)>
#map6 = affine_map<()[s0] -> (100, s0)>
module {
  func.func @constant_fold_bounds(%arg0: index) {
    %c9 = arith.constant 9 : index
    %c1 = arith.constant 1 : index
    %c2 = arith.constant 2 : index
    %0 = affine.apply #map(%c1, %c2)
    %1 = "foo"() : () -> index
    affine.for %arg1 = max #map1(%c2, %0) to min #map2(%c9, %c1) {
      "foo"(%arg1, %0) : (index, index) -> ()
    }
    affine.for %arg1 = max #map3(%arg0) to min #map4(%arg0, %1) {
      "foo"(%arg1, %0) : (index, index) -> ()
    }
    affine.for %arg1 = max #map5()[%1] to min #map6()[%arg0] {
      "foo"(%arg1, %0) : (index, index) -> ()
    }
    return
  }
}

// -----
module {
  func.func @fold_empty_loops() -> index {
    %c0 = arith.constant 0 : index
    affine.for %arg0 = 0 to 10 {
    }
    %0 = affine.for %arg0 = 0 to 10 iter_args(%arg1 = %c0) -> (index) {
      affine.yield %arg1 : index
    }
    return %0 : index
  }
}

// -----
module {
  func.func @fold_empty_loop() -> (index, index) {
    %c0 = arith.constant 0 : index
    %c1 = arith.constant 1 : index
    %c2 = arith.constant 2 : index
    %0:2 = affine.for %arg0 = 0 to 10 iter_args(%arg1 = %c0, %arg2 = %c1) -> (index, index) {
      affine.yield %c2, %arg2 : index, index
    }
    return %0#0, %0#1 : index, index
  }
}

// -----
module {
  func.func @fold_empty_loops_trip_count_1() -> (index, index, index, index) {
    %c0 = arith.constant 0 : index
    %c1 = arith.constant 1 : index
    %c2 = arith.constant 2 : index
    %0:2 = affine.for %arg0 = 0 to 1 iter_args(%arg1 = %c2, %arg2 = %c0) -> (index, index) {
      affine.yield %c1, %arg1 : index, index
    }
    %1:2 = affine.for %arg0 = 0 to 2 step 3 iter_args(%arg1 = %c2, %arg2 = %c0) -> (index, index) {
      affine.yield %arg2, %arg1 : index, index
    }
    return %0#0, %0#1, %1#0, %1#1 : index, index, index, index
  }
}

// -----
module {
  func.func @fold_empty_loop_trip_count_0() -> (index, index) {
    %c0 = arith.constant 0 : index
    %c1 = arith.constant 1 : index
    %c2 = arith.constant 2 : index
    %0:2 = affine.for %arg0 = 0 to 0 iter_args(%arg1 = %c2, %arg2 = %c0) -> (index, index) {
      affine.yield %c1, %arg1 : index, index
    }
    return %0#0, %0#1 : index, index
  }
}

// -----
module {
  func.func @fold_empty_loop_trip_count_unknown(%arg0: index) -> (index, index) {
    %c0 = arith.constant 0 : index
    %c1 = arith.constant 1 : index
    %0:2 = affine.for %arg1 = 0 to %arg0 iter_args(%arg2 = %c0, %arg3 = %c1) -> (index, index) {
      affine.yield %arg2, %arg3 : index, index
    }
    return %0#0, %0#1 : index, index
  }
}

// -----
module {
  func.func @empty_loops_not_folded_1(%arg0: index) -> index {
    %c0 = arith.constant 0 : index
    %c1 = arith.constant 1 : index
    %0 = affine.for %arg1 = 0 to %arg0 iter_args(%arg2 = %c0) -> (index) {
      affine.yield %c1 : index
    }
    return %0 : index
  }
}

// -----
module {
  func.func @empty_loops_not_folded_2(%arg0: index) -> (index, index) {
    %c0 = arith.constant 0 : index
    %c1 = arith.constant 1 : index
    %0:2 = affine.for %arg1 = 0 to %arg0 iter_args(%arg2 = %c0, %arg3 = %c1) -> (index, index) {
      affine.yield %arg3, %arg2 : index, index
    }
    return %0#0, %0#1 : index, index
  }
}

// -----
module {
  func.func @empty_loops_not_folded_3() -> (index, index) {
    %c0 = arith.constant 0 : index
    %c1 = arith.constant 1 : index
    %0:2 = affine.for %arg0 = 0 to 10 iter_args(%arg1 = %c0, %arg2 = %c1) -> (index, index) {
      affine.yield %arg2, %arg1 : index, index
    }
    return %0#0, %0#1 : index, index
  }
}

// -----
module {
  func.func @zero_iter_loop_not_folded() {
    %alloc = memref.alloc() : memref<4xf32>
    affine.for %arg0 = 0 to 0 {
      %0 = affine.load %alloc[%arg0] : memref<4xf32>
      affine.store %0, %alloc[%arg0] : memref<4xf32>
    }
    return
  }
}

// -----
module {
  func.func @fold_zero_iter_loops(%arg0: index) -> index {
    %c1 = arith.constant 1 : index
    %0 = affine.for %arg1 = 0 to 0 iter_args(%arg2 = %arg0) -> (index) {
      %1 = arith.addi %arg2, %c1 : index
      affine.yield %1 : index
    }
    return %0 : index
  }
}

// -----
#set = affine_set<(d0, d1, d2, d3)[s0] : (d1 >= 0, d0 - d1 >= 0, d2 >= 0, d3 - d2 - 2 >= 0)>
module {
  func.func @canonicalize_affine_if(%arg0: index, %arg1: index) {
    %c1022 = arith.constant 1022 : index
    affine.for %arg2 = 0 to 1024 {
      affine.for %arg3 = 0 to %arg1 {
        affine.if #set(%c1022, %arg2, %arg3, %arg1)[%arg0] {
          "foo"() : () -> ()
        }
        "bar"() : () -> ()
      }
    }
    return
  }
}

// -----
#map = affine_map<()[s0] -> (s0 + 10)>
#map1 = affine_map<(d0) -> (d0 + 1)>
#set = affine_set<(d0, d1)[s0] : (d0 - 1 >= 0, d1 - 2 == 0, -d0 + s0 >= 0)>
module {
  func.func @canonicalize_affine_if_compose_apply(%arg0: index) {
    %0 = affine.apply #map()[%arg0]
    affine.for %arg1 = 0 to 1024 {
      affine.for %arg2 = 0 to 100 {
        %1 = affine.apply #map1(%arg2)
        affine.if #set(%arg1, %1)[%0] {
          "test.foo"() : () -> ()
        }
      }
    }
    return
  }
}

// -----
#map = affine_map<(d0, d1, d2, d3) -> (d0, d1 + d2)>
#map1 = affine_map<(d0) -> (d0 * 4)>
#map2 = affine_map<(d0, d1) -> (d0, d1)>
module {
  func.func @canonicalize_bounds(%arg0: index, %arg1: index) {
    %c0 = arith.constant 0 : index
    %c1024 = arith.constant 1024 : index
    affine.for %arg2 = 0 to min #map(%c1024, %arg0, %arg0, %arg1) {
      "foo"() : () -> ()
    }
    affine.for %arg2 = 0 to #map1(%arg0) {
      "foo"() : () -> ()
    }
    affine.for %arg2 = max #map2(%c0, %arg1) to %arg0 {
      "foo"() : () -> ()
    }
    return
  }
}

// -----
#map = affine_map<(d0, d1) -> (d0 + 1)>
#map1 = affine_map<(d0) -> (d0)>
module {
  func.func @compose_into_affine_load_store(%arg0: memref<1024xf32>, %arg1: index) {
    affine.for %arg2 = 0 to 1024 {
      %0 = affine.apply #map(%arg2, %arg1)
      %1 = affine.load %arg0[%0] : memref<1024xf32>
      affine.store %1, %arg0[%0] : memref<1024xf32>
      %2 = affine.apply #map1(%arg2)
      %3 = affine.load %arg0[%2] : memref<1024xf32>
      "prevent.dce"(%3) : (f32) -> ()
    }
    return
  }
}

// -----
#map = affine_map<(d0)[s0] -> (1000, d0 + 512, s0 + 1)>
module {
  func.func @affine_min(%arg0: index, %arg1: index, %arg2: index) {
    %c511 = arith.constant 511 : index
    %c0 = arith.constant 0 : index
    %0 = affine.min #map(%c0)[%c511]
    "op0"(%0) : (index) -> ()
    return
  }
}

// -----
#map = affine_map<(d0)[s0] -> (1000, d0 floordiv 4, s0 mod 5 + 1)>
module {
  func.func @affine_min(%arg0: index, %arg1: index, %arg2: index) {
    %c3 = arith.constant 3 : index
    %c20 = arith.constant 20 : index
    %0 = affine.min #map(%c20)[%c3]
    "op0"(%0) : (index) -> ()
    return
  }
}

// -----
#map = affine_map<(d0)[s0] -> (1000, d0 + 512, s0 + 1)>
module {
  func.func @affine_max(%arg0: index, %arg1: index, %arg2: index) {
    %c511 = arith.constant 511 : index
    %c0 = arith.constant 0 : index
    %0 = affine.max #map(%c0)[%c511]
    "op0"(%0) : (index) -> ()
    return
  }
}

// -----
#map = affine_map<(d0)[s0] -> (1000, d0 floordiv 4, s0 mod 5 + 1)>
module {
  func.func @affine_max(%arg0: index, %arg1: index, %arg2: index) {
    %c3 = arith.constant 3 : index
    %c20 = arith.constant 20 : index
    %0 = affine.max #map(%c20)[%c3]
    "op0"(%0) : (index) -> ()
    return
  }
}

// -----
#map = affine_map<(d0, d1, d2) -> (d0, d1 - d2)>
module {
  func.func @affine_min(%arg0: index) {
    affine.for %arg1 = 0 to %arg0 {
      affine.for %arg2 = 0 to %arg0 {
        %c2 = arith.constant 2 : index
        %0 = affine.min #map(%arg1, %arg2, %c2)
        "consumer"(%0) : (index) -> ()
      }
    }
    return
  }
}

// -----
#map = affine_map<(d0)[s0, s1] -> (d0 * s0 + s1)>
#map1 = affine_map<(d0)[s0] -> (1024, -d0 + s0)>
module {
  func.func @rep(%arg0: index, %arg1: index) -> index {
    %c0 = arith.constant 0 : index
    %c1024 = arith.constant 1024 : index
    %0 = affine.apply #map(%arg0)[%c1024, %c0]
    %1 = affine.min #map1(%0)[%arg1]
    return %1 : index
  }
}

// -----
#map = affine_map<(d0) -> (d0, d0)>
#map1 = affine_map<(d0) -> (d0 + 2, d0 + 2)>
module {
  func.func @drop_duplicate_bounds(%arg0: index) {
    affine.for %arg1 = max #map(%arg0) to min #map1(%arg0) {
      "foo"() : () -> ()
    }
    return
  }
}

// -----
#map = affine_map<(d0) -> (d0 * 5)>
module {
  func.func @affine_parallel_const_bounds() {
    %cst = arith.constant 1.000000e+00 : f32
    %c0 = arith.constant 0 : index
    %c4 = arith.constant 4 : index
    %alloc = memref.alloc() : memref<4xf32>
    affine.parallel (%arg0) = (%c0) to (%c0 + %c4) {
      %0 = affine.apply #map(%arg0)
      affine.parallel (%arg1) = (%c0) to (%0) {
        affine.store %cst, %alloc[%arg1] : memref<4xf32>
      }
    }
    return
  }
}

// -----
#map = affine_map<()[s0] -> (s0 * 2)>
#map1 = affine_map<()[s0] -> (s0 * 3)>
#map2 = affine_map<(d0)[s0, s1] -> (d0 mod s1 + s0 * s1 + s0 * 4)>
#map3 = affine_map<(d0)[s0, s1] -> (d0 ceildiv s1 + s0 + s0 * 3)>
module {
  func.func @compose_affine_maps_div_symbol(%arg0: memref<i64>, %arg1: index, %arg2: index) {
    %0 = affine.apply #map()[%arg1]
    %1 = affine.apply #map1()[%arg1]
    %2 = affine.apply #map2(%arg2)[%0, %1]
    %3 = arith.index_cast %2 : index to i64
    memref.store %3, %arg0[] : memref<i64>
    affine.for %arg3 = 0 to 3 {
      %4 = affine.apply #map3(%arg3)[%0, %1]
      %5 = arith.index_cast %4 : index to i64
      memref.store %5, %arg0[] : memref<i64>
    }
    return
  }
}

// -----
#map = affine_map<()[s0, s1] -> (s0 + s1, s0 * s1, s0 + s1, s0 * s1)>
module {
  func.func @deduplicate_affine_min_expressions(%arg0: index, %arg1: index) -> index {
    %0 = affine.min #map()[%arg0, %arg1]
    return %0 : index
  }
}

// -----
#map = affine_map<()[s0, s1] -> (s0 + s1, s0 * s1, s0 + s1, s0 * s1)>
module {
  func.func @deduplicate_affine_max_expressions(%arg0: index, %arg1: index) -> index {
    %0 = affine.max #map()[%arg0, %arg1]
    return %0 : index
  }
}

// -----
#map = affine_map<(d0)[s0] -> (16, d0 - s0)>
#map1 = affine_map<(d0)[s0] -> (s0 * 3, d0)>
#map2 = affine_map<(d0)[s0] -> (s0, -d0 + 5)>
module {
  func.func @merge_affine_min_ops(%arg0: index, %arg1: index, %arg2: index, %arg3: index) -> (index, index) {
    %0 = affine.min #map(%arg0)[%arg1]
    %1 = affine.min #map1(%0)[%arg2]
    %2 = affine.min #map2(%arg3)[%0]
    return %1, %2 : index, index
  }
}

// -----
#map = affine_map<()[s0] -> (s0 + 16, s0 * 8)>
#map1 = affine_map<()[s0] -> (s0 + 8, s0 * 4)>
#map2 = affine_map<()[s0, s1, s2] -> (s0, s1 + 7, s2)>
module {
  func.func @merge_multiple_affine_min_ops(%arg0: index, %arg1: index, %arg2: index) -> index {
    %0 = affine.min #map()[%arg0]
    %1 = affine.min #map1()[%arg1]
    %2 = affine.min #map2()[%0, %arg2, %1]
    return %2 : index
  }
}

// -----
#map = affine_map<()[s0] -> (s0 + 16, s0 * 8)>
#map1 = affine_map<()[s0, s1, s2] -> (s0, s1, s2 * 2)>
module {
  func.func @merge_multiple_uses_of_affine_min_ops(%arg0: index, %arg1: index) -> index {
    %0 = affine.min #map()[%arg0]
    %1 = affine.min #map1()[%0, %0, %arg1]
    return %1 : index
  }
}

// -----
#map = affine_map<()[s0] -> (s0 + 16, s0 * 8)>
#map1 = affine_map<()[s0, s1, s2] -> (s0, s1 + 1, s2 * 2)>
module {
  func.func @merge_mixed_uses_of_affine_min_ops(%arg0: index, %arg1: index) -> index {
    %0 = affine.min #map()[%arg0]
    %1 = affine.min #map1()[%0, %0, %arg1]
    return %1 : index
  }
}

// -----
#map = affine_map<()[s0] -> (s0 + 16, s0 * 8)>
#map1 = affine_map<(d0)[s0] -> (s0 + 4, d0 + 7)>
module {
  func.func @dont_merge_affine_min_if_not_single_dim(%arg0: index, %arg1: index, %arg2: index) -> index {
    %0 = affine.min #map()[%arg0]
    %1 = affine.min #map1(%0)[%arg2]
    return %1 : index
  }
}

// -----
#map = affine_map<()[s0] -> (s0 + 16, s0 * 8)>
#map1 = affine_map<()[s0, s1] -> (s0 + 4, s1 + 7)>
module {
  func.func @dont_merge_affine_min_if_not_single_sym(%arg0: index, %arg1: index, %arg2: index) -> index {
    %0 = affine.min #map()[%arg0]
    %1 = affine.min #map1()[%0, %arg2]
    return %1 : index
  }
}

// -----
#map = affine_map<(d0)[s0] -> (16, d0 - s0)>
#map1 = affine_map<(d0)[s0] -> (s0 * 3, d0)>
#map2 = affine_map<(d0)[s0] -> (s0, -d0 + 5)>
module {
  func.func @merge_affine_max_ops(%arg0: index, %arg1: index, %arg2: index, %arg3: index) -> (index, index) {
    %0 = affine.max #map(%arg0)[%arg1]
    %1 = affine.max #map1(%0)[%arg2]
    %2 = affine.max #map2(%arg3)[%0]
    return %1, %2 : index, index
  }
}

// -----
#map = affine_map<()[s0] -> (s0 + 16, s0 * 8)>
#map1 = affine_map<()[s0] -> (s0 + 8, s0 * 4)>
#map2 = affine_map<()[s0, s1, s2] -> (s0, s1 + 7, s2)>
module {
  func.func @merge_multiple_affine_max_ops(%arg0: index, %arg1: index, %arg2: index) -> index {
    %0 = affine.max #map()[%arg0]
    %1 = affine.max #map1()[%arg1]
    %2 = affine.max #map2()[%0, %arg2, %1]
    return %2 : index
  }
}

// -----
#map = affine_map<()[s0] -> (s0 + 16, s0 * 8)>
#map1 = affine_map<()[s0, s1, s2] -> (s0, s1, s2 * 2)>
module {
  func.func @merge_multiple_uses_of_affine_max_ops(%arg0: index, %arg1: index) -> index {
    %0 = affine.max #map()[%arg0]
    %1 = affine.max #map1()[%0, %0, %arg1]
    return %1 : index
  }
}

// -----
#map = affine_map<()[s0] -> (s0 + 16, s0 * 8)>
#map1 = affine_map<()[s0, s1, s2] -> (s0, s1 + 1, s2 * 2)>
module {
  func.func @merge_mixed_uses_of_affine_max_ops(%arg0: index, %arg1: index) -> index {
    %0 = affine.max #map()[%arg0]
    %1 = affine.max #map1()[%0, %0, %arg1]
    return %1 : index
  }
}

// -----
#map = affine_map<()[s0] -> (s0 + 16, s0 * 8)>
#map1 = affine_map<(d0)[s0] -> (s0 + 4, d0 + 7)>
module {
  func.func @dont_merge_affine_max_if_not_single_dim(%arg0: index, %arg1: index, %arg2: index) -> index {
    %0 = affine.max #map()[%arg0]
    %1 = affine.max #map1(%0)[%arg2]
    return %1 : index
  }
}

// -----
#map = affine_map<()[s0] -> (s0 + 16, s0 * 8)>
#map1 = affine_map<()[s0, s1] -> (s0 + 4, s1 + 7)>
module {
  func.func @dont_merge_affine_max_if_not_single_sym(%arg0: index, %arg1: index, %arg2: index) -> index {
    %0 = affine.max #map()[%arg0]
    %1 = affine.max #map1()[%0, %arg2]
    return %1 : index
  }
}

// -----
#map = affine_map<(d0) -> (d0 + 2)>
#map1 = affine_map<(d0) -> (d0 - 2)>
module {
  func.func @compose_affine_for_bounds(%arg0: index) {
    %0 = affine.apply #map(%arg0)
    %1 = affine.apply #map1(%arg0)
    affine.for %arg1 = %1 to %0 {
      "foo"() : () -> ()
    }
    return
  }
}

// -----
#map = affine_map<(d0, d1) -> (d0 + 1)>
#map1 = affine_map<(d0) -> (d0)>
module {
  func.func @compose_into_affine_vector_load_vector_store(%arg0: memref<1024xf32>, %arg1: index) {
    affine.for %arg2 = 0 to 1024 {
      %0 = affine.apply #map(%arg2, %arg1)
      %1 = affine.vector_load %arg0[%0] : memref<1024xf32>, vector<8xf32>
      affine.vector_store %1, %arg0[%0] : memref<1024xf32>, vector<8xf32>
      %2 = affine.apply #map1(%arg2)
      %3 = affine.vector_load %arg0[%2] : memref<1024xf32>, vector<8xf32>
      "prevent.dce"(%3) : (vector<8xf32>) -> ()
    }
    return
  }
}

// -----
module {
  func.func @no_fold_of_store(%arg0: memref<32xi8>, %arg1: memref<memref<?xi8>>) {
    %cast = memref.cast %arg0 : memref<32xi8> to memref<?xi8>
    affine.store %cast, %arg1[] : memref<memref<?xi8>>
    return
  }
}

// -----
#map = affine_map<()[s0] -> (s0 + 16)>
#map1 = affine_map<()[s0] -> (s0 * 4)>
module {
  func.func @canonicalize_single_min_max(%arg0: index, %arg1: index) -> (index, index) {
    %0 = affine.min #map()[%arg0]
    %1 = affine.min #map1()[%arg1]
    return %0, %1 : index, index
  }
}

// -----
#map = affine_map<()[s0, s1] -> (s0 + s1, s1 + 16, 32)>
#map1 = affine_map<()[s0, s1] -> (s0 + s1, 32, s1 + 16)>
module {
  func.func @canonicalize_multi_min_max(%arg0: index, %arg1: index) -> (index, index) {
    %0 = affine.min #map()[%arg0, %arg1]
    %1 = affine.max #map1()[%arg0, %arg1]
    return %0, %1 : index, index
  }
}

// -----
module {
  memref.global "private" constant @__constant_1x5x1xf32 : memref<1x5x1xf32> = dense<[[[6.250000e-02], [2.500000e-01], [3.750000e-01], [2.500000e-01], [6.250000e-02]]]>
  memref.global "private" constant @__constant_32x64xf32 : memref<32x64xf32> = dense<0.000000e+00>
  func.func @fold_const_init_global_memref() -> (f32, f32) {
    %0 = memref.get_global @__constant_1x5x1xf32 : memref<1x5x1xf32>
    %1 = affine.load %0[0, 0, 0] : memref<1x5x1xf32>
    %2 = affine.load %0[0, 1, 0] : memref<1x5x1xf32>
    return %1, %2 : f32, f32
  }
  func.func @fold_const_splat_global() -> memref<32x64xf32> {
    %0 = memref.get_global @__constant_32x64xf32 : memref<32x64xf32>
    %alloc = memref.alloc() : memref<32x64xf32>
    affine.for %arg0 = 0 to 32 {
      affine.for %arg1 = 0 to 64 {
        %1 = affine.load %0[%arg0, %arg1] : memref<32x64xf32>
        affine.store %1, %alloc[%arg0, %arg1] : memref<32x64xf32>
      }
    }
    return %alloc : memref<32x64xf32>
  }
}

// -----
#map = affine_map<(d0, d1, d2) -> (((d0 + d2) mod 458313) floordiv 227 + d1 floordiv 256)>
module {
  func.func @simplify_with_operands(%arg0: index, %arg1: memref<?x32xf32>) {
    affine.for %arg2 = 0 to %arg0 step 32 {
      affine.for %arg3 = 0 to 32 {
        %0 = affine.load %arg1[%arg3 floordiv 32, %arg2 mod 32] : memref<?x32xf32>
        "test.foo"(%0) : (f32) -> ()
        %1 = affine.load %arg1[(%arg2 + %arg3) floordiv 32, (%arg2 + %arg3) mod 16] : memref<?x32xf32>
        "test.foo"(%1) : (f32) -> ()
        %2 = affine.load %arg1[(%arg2 + %arg3) floordiv 64, (%arg2 + %arg3) mod 64] : memref<?x32xf32>
        "test.foo"(%2) : (f32) -> ()
        %3 = affine.load %arg1[(%arg2 + %arg3) floordiv 16, (%arg2 + %arg3) mod 16] : memref<?x32xf32>
        "test.foo"(%3) : (f32) -> ()
      }
    }
    affine.for %arg2 = -1 to 32 {
      %0 = affine.load %arg1[%arg2 floordiv 32, %arg2 mod 32] : memref<?x32xf32>
      "test.foo"(%0) : (f32) -> ()
    }
    affine.for %arg2 = 0 to %arg0 step 128 {
      affine.for %arg3 = 0 to 32 step 32 {
        affine.for %arg4 = 0 to 128 {
          %0 = affine.apply #map(%arg2, %arg3, %arg4)
          "test.foo"(%0) : (index) -> ()
        }
      }
    }
    return
  }
  func.func @simplify_div_mod_with_operands(%arg0: index, %arg1: memref<64xf32>, %arg2: index) {
    %cst = arith.constant 1.000000e+00 : f32
    affine.for %arg3 = 0 to 32 {
      affine.store %cst, %arg1[%arg3 floordiv 32] : memref<64xf32>
      affine.store %cst, %arg1[(%arg3 + 1) ceildiv 32] : memref<64xf32>
      affine.store %cst, %arg1[%arg3 mod 32] : memref<64xf32>
      affine.store %cst, %arg1[(%arg3 * 2) floordiv 64] : memref<64xf32>
      affine.store %cst, %arg1[(%arg3 mod 16) floordiv 16] : memref<64xf32>
      affine.store %cst, %arg1[%arg3 floordiv 16] : memref<64xf32>
      affine.store %cst, %arg1[%arg3 mod 16] : memref<64xf32>
      affine.store %cst, %arg1[(%arg3 mod 16) floordiv 15] : memref<64xf32>
      affine.store %cst, %arg1[%arg3 mod 31] : memref<64xf32>
    }
    affine.for %arg3 = -8 to 32 {
      affine.store %cst, %arg1[%arg3 floordiv 32] : memref<64xf32>
      affine.store %cst, %arg1[%arg3 mod 32] : memref<64xf32>
      affine.store %cst, %arg1[(%arg3 - 96) floordiv 64 + 2] : memref<64xf32>
    }
    affine.for %arg3 = 8 to 16 {
      affine.store %cst, %arg1[%arg3 floordiv 8] : memref<64xf32>
      affine.store %cst, %arg1[(%arg3 + 1) ceildiv 8] : memref<64xf32>
      affine.store %cst, %arg1[%arg3 mod 8] : memref<64xf32>
      affine.store %cst, %arg1[%arg3 mod 32] : memref<64xf32>
      affine.store %cst, %arg1[(%arg3 mod 32) floordiv 16] : memref<64xf32>
      affine.store %cst, %arg1[(%arg3 mod 16) floordiv 8] : memref<64xf32>
      affine.store %cst, %arg1[(%arg2 mod 16) floordiv 16] : memref<64xf32>
    }
    return
  }
}

// -----
#map = affine_map<(d0) -> (3, 5, d0)>
#map1 = affine_map<(d0) -> (3, 3, d0)>
#map2 = affine_map<(d0) -> (5, 5, d0)>
#map3 = affine_map<(d0) -> (32, d0 * -32 + 32)>
#map4 = affine_map<(d0) -> (32, d0 * -32 + 64)>
#map5 = affine_map<(d0) -> (16, d0 * -16 + 32)>
#map6 = affine_map<(d0) -> (5, d0 * 4)>
#map7 = affine_map<(d0) -> (d0 * 4 + 3)>
#map8 = affine_map<(d0, d1) -> (d0 * 4 - d1 * 3, -9)>
#map9 = affine_map<(d0, d1) -> (d0 * 4 - d1 * 3, -9, d0 * 4 - d1 * 4)>
#map10 = affine_map<(d0) -> (d0 floordiv 2, 0)>
#map11 = affine_map<(d0) -> (d0 * 2, 2)>
#map12 = affine_map<(d0)[s0] -> (d0, s0)>
module {
  func.func @simplify_min_max_bounds_simple(%arg0: index) {
    affine.for %arg1 = 0 to min #map(%arg0) {
      "test.foo"() : () -> ()
    }
    affine.for %arg1 = 0 to min #map1(%arg0) {
      "test.foo"() : () -> ()
    }
    affine.for %arg1 = max #map(%arg0) to 10 {
      "test.foo"() : () -> ()
    }
    affine.for %arg1 = max #map2(%arg0) to 10 {
      "test.foo"() : () -> ()
    }
    return
  }
  func.func @simplify_bounds_tiled() {
    affine.for %arg0 = 0 to 1 {
      affine.for %arg1 = 0 to 2 {
        affine.for %arg2 = 0 to min #map3(%arg0) step 16 {
          affine.for %arg3 = 0 to min #map4(%arg1) step 16 {
            affine.for %arg4 = 0 to 2 {
              affine.for %arg5 = 0 to min #map5(%arg4) step 16 {
                "test.foo"() : () -> ()
              }
            }
          }
        }
      }
    }
    return
  }
  func.func @simplify_min_max_multi_expr() {
    affine.for %arg0 = 0 to 2 {
      affine.for %arg1 = max #map6(%arg0) to #map7(%arg0) {
        "test.foo"() : () -> ()
      }
    }
    affine.for %arg0 = 0 to 2 {
      affine.for %arg1 = 0 to 4 {
        affine.for %arg2 = -10 to min #map8(%arg0, %arg1) {
          "test.foo"() : () -> ()
        }
      }
    }
    affine.for %arg0 = 0 to 2 {
      affine.for %arg1 = 0 to 4 {
        affine.for %arg2 = -10 to min #map9(%arg0, %arg1) {
          "test.foo"() : () -> ()
        }
      }
    }
    affine.for %arg0 = 0 to 2 {
      affine.for %arg1 = max #map10(%arg0) to 1 {
        "test.foo"() : () -> ()
      }
    }
    affine.for %arg0 = 0 to 8 {
      affine.for %arg1 = max #map10(%arg0) to 10 {
        "test.foo"() : () -> ()
      }
    }
    return
  }
  func.func @no_simplify_min_max(%arg0: index) {
    affine.for %arg1 = 0 to 4 {
      affine.for %arg2 = 0 to min #map11(%arg1) {
        "test.foo"() : () -> ()
      }
      affine.for %arg2 = 0 to min #map12(%arg1)[%arg0] {
        "test.foo"() : () -> ()
      }
    }
    return
  }
}

// -----
#map = affine_map<(d0) -> (-d0 + 40961)>
#map1 = affine_map<(d0)[s0] -> (d0 * (s0 ceildiv 512))>
module {
  func.func @regression_do_not_perform_invalid_replacements(%arg0: index) {
    %0 = affine.apply #map(%arg0)
    %1 = affine.apply #map1(%arg0)[%0]
    "test.foo"(%1) : (index) -> ()
    return
  }
}

// -----
#map = affine_map<()[s0] -> (s0)>
module {
  func.func @min.oneval(%arg0: index) -> index {
    %0 = affine.min #map()[%arg0]
    return %0 : index
  }
}

// -----
#map = affine_map<()[s0] -> (s0)>
module {
  func.func @max.oneval(%arg0: index) -> index {
    %0 = affine.max #map()[%arg0]
    return %0 : index
  }
}

// -----
#map = affine_map<()[s0, s1] -> ((s0 - s0 mod s1) mod s1)>
#map1 = affine_map<()[s0, s1, s2] -> ((s0 - (s0 - s2) mod s1 - s2) mod s1)>
module {
  func.func @mod_of_mod(%arg0: index, %arg1: index, %arg2: index) -> (index, index) {
    %0 = affine.apply #map()[%arg1, %arg2]
    %1 = affine.apply #map1()[%arg1, %arg2, %arg0]
    return %0, %1 : index, index
  }
}

// -----
#map = affine_map<(d0) -> (d0 * 64)>
module {
  func.func @prefetch_canonicalize(%arg0: memref<512xf32>) {
    affine.for %arg1 = 0 to 8 {
      %0 = affine.apply #map(%arg1)
      affine.prefetch %arg0[%0], read, locality<3>, data : memref<512xf32>
    }
    return
  }
}

// -----
module {
  func.func @delinearize_fold_constant() -> (index, index, index) {
    %c22 = arith.constant 22 : index
    %0:3 = affine.delinearize_index %c22 into (2, 3, 5) : index, index, index
    return %0#0, %0#1, %0#2 : index, index, index
  }
}

// -----
module {
  func.func @delinearize_fold_negative_constant() -> (index, index, index) {
    %c-22 = arith.constant -22 : index
    %0:3 = affine.delinearize_index %c-22 into (2, 3, 5) : index, index, index
    return %0#0, %0#1, %0#2 : index, index, index
  }
}

// -----
module {
  func.func @delinearize_fold_negative_constant_no_outer_bound() -> (index, index, index) {
    %c-22 = arith.constant -22 : index
    %0:3 = affine.delinearize_index %c-22 into (3, 5) : index, index, index
    return %0#0, %0#1, %0#2 : index, index, index
  }
}

// -----
module {
  func.func @delinearize_dont_fold_constant_dynamic_basis(%arg0: index) -> (index, index, index) {
    %c22 = arith.constant 22 : index
    %0:3 = affine.delinearize_index %c22 into (2, %arg0, 5) : index, index, index
    return %0#0, %0#1, %0#2 : index, index, index
  }
}

// -----
module {
  func.func @drop_unit_basis_in_delinearize(%arg0: index, %arg1: index, %arg2: index) -> (index, index, index, index, index, index) {
    %c1 = arith.constant 1 : index
    %0:6 = affine.delinearize_index %arg0 into (1, %arg1, 1, 1, %arg2, %c1) : index, index, index, index, index, index
    return %0#0, %0#1, %0#2, %0#3, %0#4, %0#5 : index, index, index, index, index, index
  }
}

// -----
module {
  func.func @drop_unit_basis_in_delinearize_no_outer_bound(%arg0: index, %arg1: index, %arg2: index) -> (index, index, index, index, index, index) {
    %c1 = arith.constant 1 : index
    %0:6 = affine.delinearize_index %arg0 into (%arg1, 1, 1, %arg2, %c1) : index, index, index, index, index, index
    return %0#0, %0#1, %0#2, %0#3, %0#4, %0#5 : index, index, index, index, index, index
  }
}

// -----
module {
  func.func @drop_all_unit_bases(%arg0: index) -> (index, index) {
    %0:2 = affine.delinearize_index %arg0 into (1, 1) : index, index
    return %0#0, %0#1 : index, index
  }
}

// -----
module {
  func.func @drop_all_unit_bases_no_outer_bound(%arg0: index) -> (index, index, index) {
    %0:3 = affine.delinearize_index %arg0 into (1, 1) : index, index, index
    return %0#0, %0#1, %0#2 : index, index, index
  }
}

// -----
module {
  func.func @drop_single_loop_delinearize(%arg0: index, %arg1: index) -> index {
    %c0 = arith.constant 0 : index
    %c1 = arith.constant 1 : index
    %0 = scf.for %arg2 = %c0 to %arg1 step %c1 iter_args(%arg3 = %c0) -> (index) {
      %1 = affine.delinearize_index %arg2 into (%arg1) : index
      %2 = "some_use"(%arg3, %1) : (index, index) -> index
      scf.yield %2 : index
    }
    return %0 : index
  }
}

// -----
#map = affine_map<(d0)[s0, s1, s2] -> (d0 + s0 + s1 * 64 + s2 * 128)>
module {
  func.func @delinearize_non_induction_variable(%arg0: memref<?xi32>, %arg1: index, %arg2: index, %arg3: index, %arg4: index) -> index {
    %0 = affine.apply #map(%arg1)[%arg2, %arg3, %arg4]
    %1 = affine.delinearize_index %0 into (1024) : index
    return %1 : index
  }
}

// -----
module {
  func.func @delinearize_non_loop_like(%arg0: memref<?xi32>, %arg1: index) -> index {
    %0 = affine.delinearize_index %arg1 into (1024) : index
    return %0 : index
  }
}

// -----
module {
  func.func @delinearize_empty_basis(%arg0: index) -> index {
    %0 = affine.delinearize_index %arg0 into () : index
    return %0 : index
  }
}

// -----
module {
  func.func @linearize_fold_constants() -> index {
    %c2 = arith.constant 2 : index
    %c1 = arith.constant 1 : index
    %0 = affine.linearize_index [%c1, %c1, %c2] by (2, 3, 5) : index
    return %0 : index
  }
}

// -----
module {
  func.func @linearize_fold_constants_no_outer_bound() -> index {
    %c2 = arith.constant 2 : index
    %c1 = arith.constant 1 : index
    %0 = affine.linearize_index [%c1, %c1, %c2] by (3, 5) : index
    return %0 : index
  }
}

// -----
module {
  func.func @linearize_fold_empty_basis(%arg0: index) -> index {
    %0 = affine.linearize_index [%arg0] by () : index
    return %0 : index
  }
}

// -----
module {
  func.func @linearize_fold_only_outer_bound(%arg0: index) -> index {
    %0 = affine.linearize_index [%arg0] by (2) : index
    return %0 : index
  }
}

// -----
module {
  func.func @linearize_dont_fold_dynamic_basis(%arg0: index) -> index {
    %c2 = arith.constant 2 : index
    %c1 = arith.constant 1 : index
    %0 = affine.linearize_index [%c1, %c1, %c2] by (2, %arg0, 5) : index
    return %0 : index
  }
}

// -----
module {
  func.func @cancel_delinearize_linearize_disjoint_exact(%arg0: index, %arg1: index, %arg2: index, %arg3: index, %arg4: index) -> (index, index, index) {
    %0 = affine.linearize_index disjoint [%arg0, %arg1, %arg2] by (%arg3, 4, %arg4) : index
    %1:3 = affine.delinearize_index %0 into (%arg3, 4, %arg4) : index, index, index
    return %1#0, %1#1, %1#2 : index, index, index
  }
}

// -----
module {
  func.func @cancel_delinearize_linearize_disjoint_linearize_extra_bound(%arg0: index, %arg1: index, %arg2: index, %arg3: index, %arg4: index) -> (index, index, index) {
    %0 = affine.linearize_index disjoint [%arg0, %arg1, %arg2] by (4, %arg4) : index
    %1:3 = affine.delinearize_index %0 into (4, %arg4) : index, index, index
    return %1#0, %1#1, %1#2 : index, index, index
  }
}

// -----
module {
  func.func @cancel_delinearize_linearize_disjoint_delinearize_extra_bound(%arg0: index, %arg1: index, %arg2: index, %arg3: index, %arg4: index) -> (index, index, index) {
    %0 = affine.linearize_index disjoint [%arg0, %arg1, %arg2] by (4, %arg4) : index
    %1:3 = affine.delinearize_index %0 into (%arg3, 4, %arg4) : index, index, index
    return %1#0, %1#1, %1#2 : index, index, index
  }
}

// -----
module {
  func.func @cancel_delinearize_linearize_disjoint_partial(%arg0: index, %arg1: index, %arg2: index, %arg3: index, %arg4: index) -> (index, index, index) {
    %0 = affine.linearize_index disjoint [%arg0, %arg1, %arg2] by (%arg3, 4, %arg4) : index
    %1:3 = affine.delinearize_index %0 into (8, %arg4) : index, index, index
    return %1#0, %1#1, %1#2 : index, index, index
  }
}

// -----
module {
  func.func @no_cancel_delinearize_linearize_exact(%arg0: index, %arg1: index, %arg2: index, %arg3: index, %arg4: index) -> (index, index, index) {
    %0 = affine.linearize_index [%arg0, %arg1, %arg2] by (%arg3, 4, %arg4) : index
    %1:3 = affine.delinearize_index %0 into (%arg3, 4, %arg4) : index, index, index
    return %1#0, %1#1, %1#2 : index, index, index
  }
}

// -----
module {
  func.func @no_cancel_delinearize_linearize_different_basis(%arg0: index, %arg1: index, %arg2: index, %arg3: index, %arg4: index) -> (index, index, index) {
    %0 = affine.linearize_index [%arg0, %arg1, %arg2] by (%arg3, 4, %arg4) : index
    %1:3 = affine.delinearize_index %0 into (%arg3, 8, %arg4) : index, index, index
    return %1#0, %1#1, %1#2 : index, index, index
  }
}

// -----
module {
  func.func @split_delinearize_spanning_final_part(%arg0: index, %arg1: index, %arg2: index) -> (index, index, index, index) {
    %0 = affine.linearize_index disjoint [%arg0, %arg1, %arg2] by (2, 4, 64) : index
    %1:4 = affine.delinearize_index %0 into (2, 8, 8) : index, index, index, index
    return %1#0, %1#1, %1#2, %1#3 : index, index, index, index
  }
}

// -----
module {
  func.func @split_delinearize_spanning_final_part_and_cancel(%arg0: index, %arg1: index, %arg2: index) -> (index, index, index, index) {
    %0 = affine.linearize_index disjoint [%arg0, %arg1, %arg2] by (2, 4, 64) : index
    %1:4 = affine.delinearize_index %0 into (2, 4, 8, 8) : index, index, index, index
    return %1#0, %1#1, %1#2, %1#3 : index, index, index, index
  }
}

// -----
module {
  func.func @dont_split_delinearize_overshooting_target(%arg0: index, %arg1: index, %arg2: index) -> (index, index, index, index) {
    %0 = affine.linearize_index disjoint [%arg0, %arg1, %arg2] by (2, 4, 64) : index
    %1:4 = affine.delinearize_index %0 into (2, 16, 8) : index, index, index, index
    return %1#0, %1#1, %1#2, %1#3 : index, index, index, index
  }
}

// -----
module {
  func.func @dont_split_delinearize_undershooting_target(%arg0: index, %arg1: index) -> (index, index, index) {
    %0 = affine.linearize_index disjoint [%arg0, %arg1] by (2, 64) : index
    %1:3 = affine.delinearize_index %0 into (4, 8) : index, index, index
    return %1#0, %1#1, %1#2 : index, index, index
  }
}

// -----
module {
  func.func @linearize_unit_basis_disjoint(%arg0: index, %arg1: index, %arg2: index, %arg3: index) -> index {
    %0 = affine.linearize_index disjoint [%arg0, %arg1, %arg2] by (3, 1, %arg3) : index
    return %0 : index
  }
}

// -----
module {
  func.func @linearize_unit_basis_disjoint_no_outer_bound(%arg0: index, %arg1: index, %arg2: index, %arg3: index) -> index {
    %0 = affine.linearize_index disjoint [%arg0, %arg1, %arg2] by (1, %arg3) : index
    return %0 : index
  }
}

// -----
module {
  func.func @linearize_unit_basis_zero(%arg0: index, %arg1: index, %arg2: index) -> index {
    %c0 = arith.constant 0 : index
    %0 = affine.linearize_index [%arg0, %c0, %arg1] by (3, 1, %arg2) : index
    return %0 : index
  }
}

// -----
module {
  func.func @linearize_all_zero_unit_basis() -> index {
    %c0 = arith.constant 0 : index
    %0 = affine.linearize_index [%c0, %c0] by (1, 1) : index
    return %0 : index
  }
}

// -----
module {
  func.func @linearize_one_element_basis(%arg0: index, %arg1: index) -> index {
    %0 = affine.linearize_index [%arg0] by (%arg1) : index
    return %0 : index
  }
}

// -----
module {
  func.func @cancel_linearize_delinearize_exact(%arg0: index, %arg1: index, %arg2: index) -> index {
    %0:3 = affine.delinearize_index %arg0 into (%arg1, 4, %arg2) : index, index, index
    %1 = affine.linearize_index [%0#0, %0#1, %0#2] by (%arg1, 4, %arg2) : index
    return %1 : index
  }
}

// -----
module {
  func.func @cancel_linearize_delinearize_linearize_extra_bound(%arg0: index, %arg1: index, %arg2: index) -> index {
    %0:3 = affine.delinearize_index %arg0 into (4, %arg2) : index, index, index
    %1 = affine.linearize_index [%0#0, %0#1, %0#2] by (%arg1, 4, %arg2) : index
    return %1 : index
  }
}

// -----
module {
  func.func @cancel_linearize_delinearize_delinearize_extra_bound(%arg0: index, %arg1: index, %arg2: index) -> index {
    %0:3 = affine.delinearize_index %arg0 into (%arg1, 4, %arg2) : index, index, index
    %1 = affine.linearize_index [%0#0, %0#1, %0#2] by (4, %arg2) : index
    return %1 : index
  }
}

// -----
module {
  func.func @cancel_linearize_delinearize_head(%arg0: index, %arg1: index) -> index {
    %0:3 = affine.delinearize_index %arg0 into (3, 4, 8) : index, index, index
    %1 = affine.linearize_index [%0#0, %0#1, %arg1] by (3, 4, 16) : index
    return %1 : index
  }
}

// -----
module {
  func.func @cancel_linearize_delinearize_head_delinearize_unbounded(%arg0: index, %arg1: index) -> index {
    %0:3 = affine.delinearize_index %arg0 into (4, 8) : index, index, index
    %1 = affine.linearize_index [%0#0, %0#1, %arg1] by (3, 4, 16) : index
    return %1 : index
  }
}

// -----
module {
  func.func @cancel_linearize_delinearize_head_linearize_unbounded(%arg0: index, %arg1: index) -> index {
    %0:3 = affine.delinearize_index %arg0 into (3, 4, 8) : index, index, index
    %1 = affine.linearize_index [%0#0, %0#1, %arg1] by (4, 16) : index
    return %1 : index
  }
}

// -----
module {
  func.func @cancel_linearize_delinearize_head_both_unbounded(%arg0: index, %arg1: index) -> index {
    %0:3 = affine.delinearize_index %arg0 into (4, 8) : index, index, index
    %1 = affine.linearize_index [%0#0, %0#1, %arg1] by (4, 16) : index
    return %1 : index
  }
}

// -----
module {
  func.func @cancel_linearize_delinearize_tail(%arg0: index, %arg1: index) -> index {
    %0:3 = affine.delinearize_index %arg0 into (3, 4, 8) : index, index, index
    %1 = affine.linearize_index [%arg1, %0#1, %0#2] by (5, 4, 8) : index
    return %1 : index
  }
}

// -----
module {
  func.func @cancel_linearize_delinearize_middle_exact(%arg0: index, %arg1: index, %arg2: index) -> index {
    %0:3 = affine.delinearize_index %arg0 into (2, 3, 5) : index, index, index
    %1 = affine.linearize_index [%arg1, %0#0, %0#1, %0#2, %arg2] by (9, 2, 3, 5, 7) : index
    return %1 : index
  }
}

// -----
module {
  func.func @cancel_linearize_delinearize_middle_exact_dynamic_basis(%arg0: index, %arg1: index, %arg2: index) -> index {
    %c1 = arith.constant 1 : index
    %0:4 = affine.delinearize_index %arg0 into (2, %arg1, %arg2, 8) : index, index, index, index
    %1 = affine.linearize_index [%c1, %0#0, %0#1, %0#2, %0#3, %c1] by (3, 2, %arg1, %arg2, 8, 4) : index
    return %1 : index
  }
}

// -----
module {
  func.func @cancel_linearize_delinearize_middle_exact_delinearize_unbounded_disjoint(%arg0: index, %arg1: index, %arg2: index) -> index {
    %0:3 = affine.delinearize_index %arg0 into (3, 5) : index, index, index
    %1 = affine.linearize_index disjoint [%arg1, %0#0, %0#1, %0#2, %arg2] by (9, 2, 3, 5, 7) : index
    return %1 : index
  }
}

// -----
module {
  func.func @dont_cancel_linearize_delinearize_middle_exact_delinearize_unbounded(%arg0: index, %arg1: index, %arg2: index) -> index {
    %0:2 = affine.delinearize_index %arg0 into (3) : index, index
    %1 = affine.linearize_index [%arg1, %0#0, %0#1, %arg2] by (9, 2, 3, 7) : index
    return %1 : index
  }
}

// -----
module {
  func.func @cancel_linearize_delinearize_middle_delinearize_unbounded_disjoint_implied_bound(%arg0: index, %arg1: index, %arg2: index) -> index {
    %0:3 = affine.delinearize_index %arg0 into (3, 5) : index, index, index
    %1 = affine.linearize_index disjoint [%arg1, %0#0, %0#1, %arg2] by (9, 2, 3, 7) : index
    return %1 : index
  }
}

// -----
module {
  func.func @cancel_linearize_delinearize_multiple_matches(%arg0: index, %arg1: index) -> index {
    %c0 = arith.constant 0 : index
    %0:7 = affine.delinearize_index %arg0 into (4, 4, 4, 4, 4, 4, 4) : index, index, index, index, index, index, index
    %1 = affine.linearize_index [%arg1, %0#1, %0#2, %c0, %0#4, %0#5, %0#6] by (4, 4, 4, 4, 4, 4, 4) : index
    return %1 : index
  }
}

// -----
module {
  func.func @cancel_linearize_delinearize_multiple_delinearizes(%arg0: index, %arg1: index) -> index {
    %0:2 = affine.delinearize_index %arg0 into (4, 8) : index, index
    %1:2 = affine.delinearize_index %arg1 into (2, 16) : index, index
    %2 = affine.linearize_index [%0#0, %0#1, %1#0, %1#1] by (4, 8, 2, 16) : index
    return %2 : index
  }
}

// -----
module {
  func.func @no_cancel_linearize_delinearize_permuted(%arg0: index, %arg1: index, %arg2: index) -> index {
    %0:3 = affine.delinearize_index %arg0 into (%arg1, 4, %arg2) : index, index, index
    %1 = affine.linearize_index [%0#0, %0#2, %0#1] by (%arg1, %arg2, 4) : index
    return %1 : index
  }
}

// -----
module {
  func.func @partial_cancel_linearize_delinearize_not_fully_permuted(%arg0: index, %arg1: index, %arg2: index) -> index {
    %0:4 = affine.delinearize_index %arg0 into (%arg1, 4, %arg2, 3) : index, index, index, index
    %1 = affine.linearize_index [%0#0, %0#2, %0#3, %0#1] by (%arg1, %arg2, 3, 4) : index
    return %1 : index
  }
}

// -----
module {
  func.func @cancel_linearize_delinearize_placement(%arg0: index) -> (index, index, index) {
    %c0 = arith.constant 0 : index
    %0:3 = affine.delinearize_index %arg0 into (8, 8, 4) : index, index, index
    %1 = affine.linearize_index disjoint [%0#2, %0#0, %c0, %c0] by (4, 8, 4, 8) : index
    %2 = affine.linearize_index disjoint [%0#1, %0#2, %c0, %c0] by (8, 4, 8, 4) : index
    %3 = affine.linearize_index disjoint [%0#1, %0#0, %c0, %c0] by (8, 8, 4, 4) : index
    return %1, %2, %3 : index, index, index
  }
}

// -----
module {
  func.func @no_cancel_linearize_delinearize_different_basis(%arg0: index, %arg1: index, %arg2: index) -> index {
    %0:3 = affine.delinearize_index %arg0 into (%arg1, 4, %arg2) : index, index, index
    %1 = affine.linearize_index [%0#0, %0#1, %0#2] by (%arg1, 8, %arg2) : index
    return %1 : index
  }
}

// -----
module {
  func.func @affine_leading_zero(%arg0: index, %arg1: index) -> index {
    %c0 = arith.constant 0 : index
    %0 = affine.linearize_index [%c0, %arg0, %arg1] by (2, 3, 5) : index
    return %0 : index
  }
}

// -----
module {
  func.func @affine_leading_zero_no_outer_bound(%arg0: index, %arg1: index) -> index {
    %c0 = arith.constant 0 : index
    %0 = affine.linearize_index [%c0, %arg0, %arg1] by (3, 5) : index
    return %0 : index
  }
}

// -----
#map = affine_map<()[s0, s1, s2] -> (s0 + s1 * 5 + s2 * 20)>
#map1 = affine_map<()[s0, s1, s2] -> (s0 + s2 * 20 + s1 * 5)>
#map2 = affine_map<()[s0, s1, s2] -> (s1 * 20 + s2 * 5 + s0)>
#map3 = affine_map<()[s0, s1] -> (s0 + s1 * 20)>
#map4 = affine_map<()[s0, s1] -> (s1 * 20 + s0)>
module {
  func.func @delin_apply_cancel_exact(%arg0: index, %arg1: memref<?xindex>) {
    %0:3 = affine.delinearize_index %arg0 into (4, 5) : index, index, index
    %1:3 = affine.delinearize_index %arg0 into (3, 4, 5) : index, index, index
    %2:2 = affine.delinearize_index %arg0 into (20) : index, index
    %3 = affine.apply #map()[%0#2, %0#1, %0#0]
    memref.store %3, %arg1[%3] : memref<?xindex>
    %4 = affine.apply #map1()[%0#2, %0#1, %0#0]
    memref.store %4, %arg1[%4] : memref<?xindex>
    %5 = affine.apply #map2()[%0#2, %0#0, %0#1]
    memref.store %5, %arg1[%5] : memref<?xindex>
    %6 = affine.apply #map()[%1#2, %1#1, %1#0]
    memref.store %6, %arg1[%6] : memref<?xindex>
    %7 = affine.apply #map3()[%2#1, %2#0]
    memref.store %7, %arg1[%7] : memref<?xindex>
    %8 = affine.apply #map4()[%2#1, %2#0]
    memref.store %8, %arg1[%7] : memref<?xindex>
    return
  }
}

// -----
#map = affine_map<(d0, d1, d2) -> (d0 + d1 * 128 + d2 * 64)>
module {
  func.func @delin_apply_cancel_exact_dim(%arg0: memref<?xindex>) {
    affine.for %arg1 = 0 to 256 {
      %0:3 = affine.delinearize_index %arg1 into (2, 2, 64) : index, index, index
      %1 = affine.apply #map(%0#2, %0#0, %0#1)
      memref.store %1, %arg0[%1] : memref<?xindex>
    }
    return
  }
}

// -----
#map = affine_map<()[s0, s1, s2] -> (s0 + s1 * 128 + s2 * 64 + 512)>
module {
  func.func @delin_apply_cancel_const_term(%arg0: index, %arg1: memref<?xindex>) {
    %0:3 = affine.delinearize_index %arg0 into (2, 2, 64) : index, index, index
    %1 = affine.apply #map()[%0#2, %0#0, %0#1]
    memref.store %1, %arg1[%1] : memref<?xindex>
    return
  }
}

// -----
#map = affine_map<()[s0, s1, s2, s3] -> (s0 + s1 * 128 + s2 * 64 + s3 + 512)>
module {
  func.func @delin_apply_cancel_var_term(%arg0: index, %arg1: memref<?xindex>, %arg2: index) {
    %0:3 = affine.delinearize_index %arg0 into (2, 2, 64) : index, index, index
    %1 = affine.apply #map()[%0#2, %0#0, %0#1, %arg2]
    memref.store %1, %arg1[%1] : memref<?xindex>
    return
  }
}

// -----
#map = affine_map<()[s0, s1] -> ((s0 + s1 * 20) ceildiv 4 + (s1 * 20 + s0) * 2)>
module {
  func.func @delin_apply_cancel_nested_exprs(%arg0: index, %arg1: memref<?xindex>) {
    %0:2 = affine.delinearize_index %arg0 into (20) : index, index
    %1 = affine.apply #map()[%0#1, %0#0]
    memref.store %1, %arg1[%1] : memref<?xindex>
    return
  }
}

// -----
#map = affine_map<()[s0, s1] -> (s0 + s1 * 20 + s0)>
module {
  func.func @delin_apply_cancel_preserve_rotation(%arg0: index, %arg1: memref<?xindex>) {
    %0:2 = affine.delinearize_index %arg0 into (20) : index, index
    %1 = affine.apply #map()[%0#1, %0#0]
    memref.store %1, %arg1[%1] : memref<?xindex>
    return
  }
}

// -----
#map = affine_map<()[s0, s1] -> (s0 + s1 * 5)>
module {
  func.func @delin_apply_dont_cancel_partial(%arg0: index, %arg1: memref<?xindex>) {
    %0:3 = affine.delinearize_index %arg0 into (3, 4, 5) : index, index, index
    %1 = affine.apply #map()[%0#2, %0#1]
    memref.store %1, %arg1[%1] : memref<?xindex>
    return
  }
}

// -----
module {
  func.func @cst_value_to_cst_attr_basis_delinearize_index(%arg0: index) -> (index, index, index) {
    %c4 = arith.constant 4 : index
    %c3 = arith.constant 3 : index
    %c2 = arith.constant 2 : index
    %0:3 = affine.delinearize_index %arg0 into (%c3, %c4, %c2) : index, index, index
    return %0#0, %0#1, %0#2 : index, index, index
  }
}

// -----
module {
  func.func @cst_value_to_cst_attr_basis_linearize_index(%arg0: index, %arg1: index, %arg2: index) -> index {
    %c4 = arith.constant 4 : index
    %c2 = arith.constant 2 : index
    %0 = affine.linearize_index disjoint [%arg0, %arg1, %arg2] by (%c2, 3, %c4) : index
    return %0 : index
  }
  func.func @for_empty_body_folder_iv_yield() -> index {
    %c18 = arith.constant 18 : index
    %0 = affine.for %arg0 = 0 to 114 iter_args(%arg1 = %c18) -> (index) {
      affine.yield %arg0 : index
    }
    return %0 : index
  }
}

