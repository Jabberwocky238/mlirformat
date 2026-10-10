#map = affine_map<(d0, d1)[s0] -> (s0, d0 - d1)>
module {
  func.func @fully_dynamic_bounds(%arg0: index, %arg1: index, %arg2: index) -> i32 {
    %c0_i32 = arith.constant 0 : i32
    %0 = scf.for %arg3 = %arg0 to %arg1 step %arg2 iter_args(%arg4 = %c0_i32) -> (i32) {
      %1 = affine.min #map(%arg1, %arg3)[%arg2]
      %2 = arith.index_cast %1 : index to i32
      %3 = arith.addi %arg4, %2 : i32
      scf.yield %3 : i32
    }
    return %0 : i32
  }
}

// -----
#map = affine_map<(d0, d1)[s0] -> (s0, d0 - d1)>
module {
  func.func @static_two_iterations_ub_used_in_loop(%arg0: memref<1xi32>) -> i32 {
    %c0_i32 = arith.constant 0 : i32
    %c0 = arith.constant 0 : index
    %c4 = arith.constant 4 : index
    %c7 = arith.constant 7 : index
    %0 = scf.for %arg1 = %c0 to %c7 step %c4 iter_args(%arg2 = %c0_i32) -> (i32) {
      %1 = affine.min #map(%c7, %arg1)[%c4]
      %2 = arith.index_cast %1 : index to i32
      %3 = arith.addi %arg2, %2 : i32
      %4 = memref.load %arg0[%c7] : memref<1xi32>
      %5 = arith.addi %3, %4 : i32
      scf.yield %5 : i32
    }
    return %0 : i32
  }
}

// -----
#map = affine_map<(d0, d1)[s0] -> (s0, d0 - d1)>
module {
  func.func @fully_static_bounds() -> i32 {
    %c0_i32 = arith.constant 0 : i32
    %c0 = arith.constant 0 : index
    %c4 = arith.constant 4 : index
    %c17 = arith.constant 17 : index
    %0 = scf.for %arg0 = %c0 to %c17 step %c4 iter_args(%arg1 = %c0_i32) -> (i32) {
      %1 = affine.min #map(%c17, %arg0)[%c4]
      %2 = arith.index_cast %1 : index to i32
      %3 = arith.addi %arg1, %2 : i32
      scf.yield %3 : i32
    }
    return %0 : i32
  }
}

// -----
#map = affine_map<(d0, d1)[s0] -> (s0, d0 - d1)>
module {
  func.func @fully_static_bounds_integers() -> i32 {
    %c0_i32 = arith.constant 0 : i32
    %c0_i32_0 = arith.constant 0 : i32
    %c4_i32 = arith.constant 4 : i32
    %c17_i32 = arith.constant 17 : i32
    %0 = scf.for %arg0 = %c0_i32_0 to %c17_i32 step %c4_i32 iter_args(%arg1 = %c0_i32) -> (i32)  : i32 {
      %1 = arith.index_cast %c17_i32 : i32 to index
      %2 = arith.index_cast %arg0 : i32 to index
      %3 = arith.index_cast %c4_i32 : i32 to index
      %4 = affine.min #map(%1, %2)[%3]
      %5 = arith.index_cast %4 : index to i32
      %6 = arith.addi %arg1, %5 : i32
      scf.yield %6 : i32
    }
    return %0 : i32
  }
}

// -----
#map = affine_map<(d0, d1)[s0] -> (s0, d0 - d1)>
module {
  func.func @dynamic_upper_bound(%arg0: index) -> i32 {
    %c0_i32 = arith.constant 0 : i32
    %c0 = arith.constant 0 : index
    %c4 = arith.constant 4 : index
    %0 = scf.for %arg1 = %c0 to %arg0 step %c4 iter_args(%arg2 = %c0_i32) -> (i32) {
      %1 = affine.min #map(%arg0, %arg1)[%c4]
      %2 = arith.index_cast %1 : index to i32
      %3 = arith.addi %arg2, %2 : i32
      scf.yield %3 : i32
    }
    return %0 : i32
  }
}

// -----
#map = affine_map<(d0, d1)[s0] -> (s0, d0 - d1)>
module {
  func.func @no_loop_results(%arg0: index, %arg1: memref<i32>) {
    %c0_i32 = arith.constant 0 : i32
    %c0 = arith.constant 0 : index
    %c4 = arith.constant 4 : index
    scf.for %arg2 = %c0 to %arg0 step %c4 {
      %0 = affine.min #map(%arg0, %arg2)[%c4]
      %1 = memref.load %arg1[] : memref<i32>
      %2 = arith.index_cast %0 : index to i32
      %3 = arith.addi %1, %2 : i32
      memref.store %3, %arg1[] : memref<i32>
    }
    return
  }
}

// -----
#map = affine_map<(d0, d1)[s0] -> (s0, d0 - d1)>
#map1 = affine_map<(d0, d1)[s0] -> (d0 - d1 + 1, s0)>
#map2 = affine_map<(d0, d1)[s0] -> (s0 + 1, d0 - d1 + 1)>
#map3 = affine_map<(d0, d1)[s0] -> (s0, d0 - d1 - 1)>
#map4 = affine_map<(d0, d1, d2)[s0] -> (s0, d0 - d1, d2)>
#map5 = affine_map<(d0, d1)[s0] -> (-s0, -d0 + d1)>
module {
  func.func @test_affine_op_rewrite(%arg0: index, %arg1: index, %arg2: index, %arg3: memref<?xindex>, %arg4: index) {
    %c0 = arith.constant 0 : index
    %c1 = arith.constant 1 : index
    %c2 = arith.constant 2 : index
    %c3 = arith.constant 3 : index
    %c4 = arith.constant 4 : index
    %c5 = arith.constant 5 : index
    scf.for %arg5 = %arg0 to %arg1 step %arg2 {
      %0 = affine.min #map(%arg1, %arg5)[%arg2]
      memref.store %0, %arg3[%c0] : memref<?xindex>
      %1 = affine.min #map1(%arg1, %arg5)[%arg2]
      memref.store %1, %arg3[%c1] : memref<?xindex>
      %2 = affine.min #map2(%arg1, %arg5)[%arg2]
      memref.store %2, %arg3[%c2] : memref<?xindex>
      %3 = affine.min #map3(%arg1, %arg5)[%arg2]
      memref.store %3, %arg3[%c3] : memref<?xindex>
      %4 = affine.min #map4(%arg1, %arg5, %arg4)[%arg2]
      memref.store %4, %arg3[%c4] : memref<?xindex>
      %5 = affine.max #map5(%arg1, %arg5)[%arg2]
      memref.store %5, %arg3[%c5] : memref<?xindex>
    }
    return
  }
}

// -----
#map = affine_map<(d0, d1)[s0] -> (s0, d0 - d1)>
module {
  func.func @nested_loops(%arg0: index, %arg1: index, %arg2: index, %arg3: index, %arg4: index) -> i32 {
    %c0_i32 = arith.constant 0 : i32
    %0 = scf.for %arg5 = %arg0 to %arg2 step %arg4 iter_args(%arg6 = %c0_i32) -> (i32) {
      %1 = scf.for %arg7 = %arg1 to %arg3 step %arg4 iter_args(%arg8 = %arg6) -> (i32) {
        %3 = affine.min #map(%arg3, %arg7)[%arg4]
        %4 = arith.index_cast %3 : index to i32
        %5 = arith.addi %arg8, %4 : i32
        scf.yield %5 : i32
      }
      %2 = arith.addi %arg6, %1 : i32
      scf.yield %2 : i32
    }
    return %0 : i32
  }
}

// -----
#map = affine_map<()[s0] -> (s0 * s0)>
#map1 = affine_map<(d0)[s0] -> (s0, -d0 + s0 * s0)>
module {
  func.func @regression(%arg0: memref<i64>, %arg1: index) {
    %c0 = arith.constant 0 : index
    %0 = affine.apply #map()[%arg1]
    scf.for %arg2 = %c0 to %0 step %arg1 {
      %1 = affine.min #map1(%arg2)[%arg1]
      %2 = arith.index_cast %0 : index to i64
      memref.store %2, %arg0[] : memref<i64>
    }
    return
  }
}

// -----
module {
  func.func @zero_step(%arg0: memref<i64>) {
    %c0 = arith.constant 0 : index
    %c1 = arith.constant 1 : index
    %0 = arith.subi %c1, %c1 : index
    scf.for %arg1 = %c0 to %c1 step %0 {
      %1 = arith.index_cast %arg1 : index to i64
      memref.store %1, %arg0[] : memref<i64>
    }
    return
  }
}

