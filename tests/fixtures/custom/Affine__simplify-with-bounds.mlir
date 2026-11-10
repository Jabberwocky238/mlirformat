module {
  func.func @many_to_one_static_tail(%arg0: index, %arg1: index, %arg2: index) -> (index, index) {
    %0 = affine.linearize_index disjoint [%arg0, %arg1, %arg2] by (4, 8, 8) : index
    %1:2 = affine.delinearize_index %0 into (4, 64) : index, index
    return %1#0, %1#1 : index, index
  }
}

// -----
#map = affine_map<()[s0] -> (s0 * 8)>
module {
  func.func @many_to_one_dynamic_tail(%arg0: index, %arg1: index, %arg2: index, %arg3: index) -> (index, index) {
    %0 = affine.apply #map()[%arg3]
    %1 = affine.linearize_index disjoint [%arg0, %arg1, %arg2] by (4, %arg3, 8) : index
    %2:2 = affine.delinearize_index %1 into (4, %0) : index, index
    return %2#0, %2#1 : index, index
  }
}

// -----
module {
  func.func @one_to_many_static_tail(%arg0: index, %arg1: index) -> (index, index, index) {
    %0 = affine.linearize_index disjoint [%arg0, %arg1] by (4, 64) : index
    %1:3 = affine.delinearize_index %0 into (4, 8, 8) : index, index, index
    return %1#0, %1#1, %1#2 : index, index, index
  }
}

// -----
#map = affine_map<()[s0] -> (s0 * 8)>
module {
  func.func @one_to_many_dynamic_tail(%arg0: index, %arg1: index, %arg2: index) -> (index, index, index) {
    %0 = affine.apply #map()[%arg2]
    %1 = affine.linearize_index disjoint [%arg0, %arg1] by (4, %0) : index
    %2:3 = affine.delinearize_index %1 into (4, %arg2, 8) : index, index, index
    return %2#0, %2#1, %2#2 : index, index, index
  }
}

// -----
#map = affine_map<()[s0] -> (s0 ceildiv 128)>
module {
  func.func @one_to_one_dynamic_tail(%arg0: index, %arg1: index, %arg2: index) -> (index, index) {
    %0 = affine.apply #map()[%arg2]
    %1 = affine.apply #map()[%arg2]
    %2 = affine.linearize_index disjoint [%arg0, %arg1] by (4, %0) : index
    %3:2 = affine.delinearize_index %2 into (4, %1) : index, index
    return %3#0, %3#1 : index, index
  }
}

// -----
module {
  func.func @mixed_many_to_one_and_one_to_one(%arg0: index, %arg1: index, %arg2: index, %arg3: index) -> (index, index, index) {
    %0 = affine.linearize_index disjoint [%arg0, %arg1, %arg2, %arg3] by (2, 3, 4, 8) : index
    %1:3 = affine.delinearize_index %0 into (2, 3, 32) : index, index, index
    return %1#0, %1#1, %1#2 : index, index, index
  }
}

// -----
module {
  func.func @partial_tail_many_to_one(%arg0: index, %arg1: index, %arg2: index, %arg3: index) -> (index, index, index) {
    %0 = affine.linearize_index disjoint [%arg0, %arg1, %arg2, %arg3] by (5, 3, 4, 8) : index
    %1:3 = affine.delinearize_index %0 into (7, 9, 32) : index, index, index
    return %1#0, %1#1, %1#2 : index, index, index
  }
}

// -----
module {
  func.func @many_to_one_no_outer_bound(%arg0: index, %arg1: index, %arg2: index) -> (index, index) {
    %0 = affine.linearize_index disjoint [%arg0, %arg1, %arg2] by (8, 8) : index
    %1:2 = affine.delinearize_index %0 into (64) : index, index
    return %1#0, %1#1 : index, index
  }
}

// -----
module {
  func.func @one_to_many_no_outer_bound(%arg0: index, %arg1: index) -> (index, index, index) {
    %0 = affine.linearize_index disjoint [%arg0, %arg1] by (64) : index
    %1:3 = affine.delinearize_index %0 into (8, 8) : index, index, index
    return %1#0, %1#1, %1#2 : index, index, index
  }
}

// -----
module {
  func.func @partial_match_empty_residual_lin(%arg0: index, %arg1: index) -> (index, index, index) {
    %0 = affine.linearize_index disjoint [%arg0, %arg1] by (4, 8) : index
    %1:3 = affine.delinearize_index %0 into (10, 4, 8) : index, index, index
    return %1#0, %1#1, %1#2 : index, index, index
  }
}

// -----
module {
  func.func @no_disjoint(%arg0: index, %arg1: index, %arg2: index) -> (index, index) {
    %0 = affine.linearize_index [%arg0, %arg1, %arg2] by (4, 8, 8) : index
    %1:2 = affine.delinearize_index %0 into (4, 64) : index, index
    return %1#0, %1#1 : index, index
  }
}

// -----
module {
  func.func @products_dont_match(%arg0: index, %arg1: index, %arg2: index) -> (index, index) {
    %0 = affine.linearize_index disjoint [%arg0, %arg1, %arg2] by (4, 8, 8) : index
    %1:2 = affine.delinearize_index %0 into (4, 63) : index, index
    return %1#0, %1#1 : index, index
  }
}

// -----
module {
  func.func @input_not_linearize(%arg0: index) -> (index, index) {
    %0:2 = affine.delinearize_index %arg0 into (4, 8) : index, index
    return %0#0, %0#1 : index, index
  }
}

// -----
#map = affine_map<(d0, d1, d2) -> (d0, d1, d2)>
module {
  func.func @simplify_loop_bound() -> index {
    %c0 = arith.constant 0 : index
    %c1 = arith.constant 1 : index
    %0 = test.value_with_bounds {max = 1 : index, min = 0 : index}
    %1 = test.value_with_bounds {max = 3 : index, min = 2 : index}
    %2 = test.value_with_bounds {max = 3 : index, min = 2 : index}
    %3 = affine.for %arg0 = max #map(%0, %1, %2) to min #map(%0, %1, %2) step 2 iter_args(%arg1 = %c0) -> (index) {
      %4 = arith.addi %arg1, %c1 : index
      affine.yield %4 : index
    }
    return %3 : index
  }
}

