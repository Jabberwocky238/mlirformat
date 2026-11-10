"builtin.module"() ({
  "func.func"() <{function_type = (index, index, index) -> (index, index), sym_name = "many_to_one_static_tail"}> ({
  ^bb0(%arg0: index, %arg1: index, %arg2: index):
    %0 = "affine.linearize_index"(%arg0, %arg1, %arg2) <{disjoint, operandSegmentSizes = array<i32: 3, 0>, static_basis = array<i64: 4, 8, 8>}> : (index, index, index) -> index
    %1:2 = "affine.delinearize_index"(%0) <{static_basis = array<i64: 4, 64>}> : (index) -> (index, index)
    "func.return"(%1#0, %1#1) : (index, index) -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<()[s0] -> (s0 * 8)>
"builtin.module"() ({
  "func.func"() <{function_type = (index, index, index, index) -> (index, index), sym_name = "many_to_one_dynamic_tail"}> ({
  ^bb0(%arg0: index, %arg1: index, %arg2: index, %arg3: index):
    %0 = "affine.apply"(%arg3) <{map = #map}> : (index) -> index
    %1 = "affine.linearize_index"(%arg0, %arg1, %arg2, %arg3) <{disjoint, operandSegmentSizes = array<i32: 3, 1>, static_basis = array<i64: 4, -9223372036854775808, 8>}> : (index, index, index, index) -> index
    %2:2 = "affine.delinearize_index"(%1, %0) <{static_basis = array<i64: 4, -9223372036854775808>}> : (index, index) -> (index, index)
    "func.return"(%2#0, %2#1) : (index, index) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (index, index) -> (index, index, index), sym_name = "one_to_many_static_tail"}> ({
  ^bb0(%arg0: index, %arg1: index):
    %0 = "affine.linearize_index"(%arg0, %arg1) <{disjoint, operandSegmentSizes = array<i32: 2, 0>, static_basis = array<i64: 4, 64>}> : (index, index) -> index
    %1:3 = "affine.delinearize_index"(%0) <{static_basis = array<i64: 4, 8, 8>}> : (index) -> (index, index, index)
    "func.return"(%1#0, %1#1, %1#2) : (index, index, index) -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<()[s0] -> (s0 * 8)>
"builtin.module"() ({
  "func.func"() <{function_type = (index, index, index) -> (index, index, index), sym_name = "one_to_many_dynamic_tail"}> ({
  ^bb0(%arg0: index, %arg1: index, %arg2: index):
    %0 = "affine.apply"(%arg2) <{map = #map}> : (index) -> index
    %1 = "affine.linearize_index"(%arg0, %arg1, %0) <{disjoint, operandSegmentSizes = array<i32: 2, 1>, static_basis = array<i64: 4, -9223372036854775808>}> : (index, index, index) -> index
    %2:3 = "affine.delinearize_index"(%1, %arg2) <{static_basis = array<i64: 4, -9223372036854775808, 8>}> : (index, index) -> (index, index, index)
    "func.return"(%2#0, %2#1, %2#2) : (index, index, index) -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<()[s0] -> (s0 ceildiv 128)>
"builtin.module"() ({
  "func.func"() <{function_type = (index, index, index) -> (index, index), sym_name = "one_to_one_dynamic_tail"}> ({
  ^bb0(%arg0: index, %arg1: index, %arg2: index):
    %0 = "affine.apply"(%arg2) <{map = #map}> : (index) -> index
    %1 = "affine.apply"(%arg2) <{map = #map}> : (index) -> index
    %2 = "affine.linearize_index"(%arg0, %arg1, %0) <{disjoint, operandSegmentSizes = array<i32: 2, 1>, static_basis = array<i64: 4, -9223372036854775808>}> : (index, index, index) -> index
    %3:2 = "affine.delinearize_index"(%2, %1) <{static_basis = array<i64: 4, -9223372036854775808>}> : (index, index) -> (index, index)
    "func.return"(%3#0, %3#1) : (index, index) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (index, index, index, index) -> (index, index, index), sym_name = "mixed_many_to_one_and_one_to_one"}> ({
  ^bb0(%arg0: index, %arg1: index, %arg2: index, %arg3: index):
    %0 = "affine.linearize_index"(%arg0, %arg1, %arg2, %arg3) <{disjoint, operandSegmentSizes = array<i32: 4, 0>, static_basis = array<i64: 2, 3, 4, 8>}> : (index, index, index, index) -> index
    %1:3 = "affine.delinearize_index"(%0) <{static_basis = array<i64: 2, 3, 32>}> : (index) -> (index, index, index)
    "func.return"(%1#0, %1#1, %1#2) : (index, index, index) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (index, index, index, index) -> (index, index, index), sym_name = "partial_tail_many_to_one"}> ({
  ^bb0(%arg0: index, %arg1: index, %arg2: index, %arg3: index):
    %0 = "affine.linearize_index"(%arg0, %arg1, %arg2, %arg3) <{disjoint, operandSegmentSizes = array<i32: 4, 0>, static_basis = array<i64: 5, 3, 4, 8>}> : (index, index, index, index) -> index
    %1:3 = "affine.delinearize_index"(%0) <{static_basis = array<i64: 7, 9, 32>}> : (index) -> (index, index, index)
    "func.return"(%1#0, %1#1, %1#2) : (index, index, index) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (index, index, index) -> (index, index), sym_name = "many_to_one_no_outer_bound"}> ({
  ^bb0(%arg0: index, %arg1: index, %arg2: index):
    %0 = "affine.linearize_index"(%arg0, %arg1, %arg2) <{disjoint, operandSegmentSizes = array<i32: 3, 0>, static_basis = array<i64: 8, 8>}> : (index, index, index) -> index
    %1:2 = "affine.delinearize_index"(%0) <{static_basis = array<i64: 64>}> : (index) -> (index, index)
    "func.return"(%1#0, %1#1) : (index, index) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (index, index) -> (index, index, index), sym_name = "one_to_many_no_outer_bound"}> ({
  ^bb0(%arg0: index, %arg1: index):
    %0 = "affine.linearize_index"(%arg0, %arg1) <{disjoint, operandSegmentSizes = array<i32: 2, 0>, static_basis = array<i64: 64>}> : (index, index) -> index
    %1:3 = "affine.delinearize_index"(%0) <{static_basis = array<i64: 8, 8>}> : (index) -> (index, index, index)
    "func.return"(%1#0, %1#1, %1#2) : (index, index, index) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (index, index) -> (index, index, index), sym_name = "partial_match_empty_residual_lin"}> ({
  ^bb0(%arg0: index, %arg1: index):
    %0 = "affine.linearize_index"(%arg0, %arg1) <{disjoint, operandSegmentSizes = array<i32: 2, 0>, static_basis = array<i64: 4, 8>}> : (index, index) -> index
    %1:3 = "affine.delinearize_index"(%0) <{static_basis = array<i64: 10, 4, 8>}> : (index) -> (index, index, index)
    "func.return"(%1#0, %1#1, %1#2) : (index, index, index) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (index, index, index) -> (index, index), sym_name = "no_disjoint"}> ({
  ^bb0(%arg0: index, %arg1: index, %arg2: index):
    %0 = "affine.linearize_index"(%arg0, %arg1, %arg2) <{disjoint = false, operandSegmentSizes = array<i32: 3, 0>, static_basis = array<i64: 4, 8, 8>}> : (index, index, index) -> index
    %1:2 = "affine.delinearize_index"(%0) <{static_basis = array<i64: 4, 64>}> : (index) -> (index, index)
    "func.return"(%1#0, %1#1) : (index, index) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (index, index, index) -> (index, index), sym_name = "products_dont_match"}> ({
  ^bb0(%arg0: index, %arg1: index, %arg2: index):
    %0 = "affine.linearize_index"(%arg0, %arg1, %arg2) <{disjoint, operandSegmentSizes = array<i32: 3, 0>, static_basis = array<i64: 4, 8, 8>}> : (index, index, index) -> index
    %1:2 = "affine.delinearize_index"(%0) <{static_basis = array<i64: 4, 63>}> : (index) -> (index, index)
    "func.return"(%1#0, %1#1) : (index, index) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (index) -> (index, index), sym_name = "input_not_linearize"}> ({
  ^bb0(%arg0: index):
    %0:2 = "affine.delinearize_index"(%arg0) <{static_basis = array<i64: 4, 8>}> : (index) -> (index, index)
    "func.return"(%0#0, %0#1) : (index, index) -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1, d2) -> (d0, d1, d2)>
"builtin.module"() ({
  "func.func"() <{function_type = () -> index, sym_name = "simplify_loop_bound"}> ({
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index
    %1 = "arith.constant"() <{value = 1 : index}> : () -> index
    %2 = "test.value_with_bounds"() <{max = 1 : index, min = 0 : index}> : () -> index
    %3 = "test.value_with_bounds"() <{max = 3 : index, min = 2 : index}> : () -> index
    %4 = "test.value_with_bounds"() <{max = 3 : index, min = 2 : index}> : () -> index
    %5 = "affine.for"(%2, %3, %4, %2, %3, %4, %0) <{lowerBoundMap = #map, operandSegmentSizes = array<i32: 3, 3, 1>, step = 2 : index, upperBoundMap = #map}> ({
    ^bb0(%arg0: index, %arg1: index):
      %6 = "arith.addi"(%arg1, %1) <{overflowFlags = #arith.overflow<none>}> : (index, index) -> index
      "affine.yield"(%6) : (index) -> ()
    }) : (index, index, index, index, index, index, index) -> index
    "func.return"(%5) : (index) -> ()
  }) : () -> ()
}) : () -> ()

