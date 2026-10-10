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
  func.func @two_iteration_example() -> i32 {
    %c0_i32 = arith.constant 0 : i32
    %c2 = arith.constant 2 : index
    %c4 = arith.constant 4 : index
    %c8 = arith.constant 8 : index
    %0 = scf.for %arg0 = %c2 to %c8 step %c4 iter_args(%arg1 = %c0_i32) -> (i32) {
      %1 = affine.min #map(%c8, %arg0)[%c4]
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
  func.func @no_peeling_front() -> i32 {
    %c0_i32 = arith.constant 0 : i32
    %c0 = arith.constant 0 : index
    %c4 = arith.constant 4 : index
    %c4_0 = arith.constant 4 : index
    %0 = scf.for %arg0 = %c0 to %c4_0 step %c4 iter_args(%arg1 = %c0_i32) -> (i32) {
      %1 = affine.min #map(%c4_0, %arg0)[%c4]
      %2 = arith.index_cast %1 : index to i32
      %3 = arith.addi %arg1, %2 : i32
      scf.yield %3 : i32
    }
    return %0 : i32
  }
}

