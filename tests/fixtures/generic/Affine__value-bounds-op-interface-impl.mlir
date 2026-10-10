#map = affine_map<()[s0, s1] -> (s0 + s1)>
"builtin.module"() ({
  "func.func"() <{function_type = (index, index) -> index, sym_name = "affine_apply"}> ({
  ^bb0(%arg0: index, %arg1: index):
    %0 = "affine.apply"(%arg0, %arg1) <{map = #map}> : (index, index) -> index
    %1 = "test.reify_bound"(%0) <{type = "EQ"}> : (index) -> index
    "func.return"(%1) : (index) -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<()[s0] -> (s0, 2)>
"builtin.module"() ({
  "func.func"() <{function_type = (index) -> index, sym_name = "affine_max_lb"}> ({
  ^bb0(%arg0: index):
    %0 = "affine.max"(%arg0) <{map = #map}> : (index) -> index
    %1 = "test.reify_bound"(%0) <{type = "LB"}> : (index) -> index
    "func.return"(%1) : (index) -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<()[s0] -> (s0, 2)>
"builtin.module"() ({
  "func.func"() <{function_type = (index) -> index, sym_name = "affine_max_ub"}> ({
  ^bb0(%arg0: index):
    %0 = "affine.max"(%arg0) <{map = #map}> : (index) -> index
    %1 = "test.reify_bound"(%0) <{type = "UB"}> : (index) -> index
    "func.return"(%1) : (index) -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<()[s0] -> (s0, 2)>
"builtin.module"() ({
  "func.func"() <{function_type = (index) -> index, sym_name = "affine_min_ub"}> ({
  ^bb0(%arg0: index):
    %0 = "affine.min"(%arg0) <{map = #map}> : (index) -> index
    %1 = "test.reify_bound"(%0) <{type = "UB"}> : (index) -> index
    "func.return"(%1) : (index) -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<()[s0] -> (s0, 2)>
"builtin.module"() ({
  "func.func"() <{function_type = (index) -> index, sym_name = "affine_min_lb"}> ({
  ^bb0(%arg0: index):
    %0 = "affine.min"(%arg0) <{map = #map}> : (index) -> index
    %1 = "test.reify_bound"(%0) <{type = "LB"}> : (index) -> index
    "func.return"(%1) : (index) -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0) -> ((d0 floordiv 32) * 16)>
#map1 = affine_map<(d0) -> ((d0 floordiv 32) * 16 + 8)>
#map2 = affine_map<()[s0, s1] -> (s0 - s1)>
"builtin.module"() ({
  "func.func"() <{function_type = (index) -> index, sym_name = "composed_affine_apply"}> ({
  ^bb0(%arg0: index):
    %0 = "affine.apply"(%arg0) <{map = #map}> : (index) -> index
    %1 = "affine.apply"(%arg0) <{map = #map1}> : (index) -> index
    %2 = "affine.apply"(%0, %1) <{map = #map2}> : (index, index) -> index
    %3 = "test.reify_bound"(%2) <{constant, type = "EQ"}> : (index) -> index
    "func.return"(%3) : (index) -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0) -> ((d0 floordiv 32) * 16)>
#map1 = affine_map<(d0) -> ((d0 floordiv 32) * 16 + 8)>
#map2 = affine_map<()[s0, s1] -> (s0 - s1)>
"builtin.module"() ({
  "func.func"() <{function_type = (index) -> (), sym_name = "are_equal"}> ({
  ^bb0(%arg0: index):
    %0 = "affine.apply"(%arg0) <{map = #map}> : (index) -> index
    %1 = "affine.apply"(%arg0) <{map = #map1}> : (index) -> index
    %2 = "affine.apply"(%0, %1) <{map = #map2}> : (index, index) -> index
    "test.compare"(%0, %1) <{cmp = "EQ"}> : (index, index) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0) -> ((d0 floordiv 32) * 16)>
#map1 = affine_map<(d0) -> ((d0 floordiv 32) * 16 + 8)>
#map2 = affine_map<()[s0, s1] -> (s0 - s1)>
"builtin.module"() ({
  "func.func"() <{function_type = (index) -> (), sym_name = "composed_are_equal"}> ({
  ^bb0(%arg0: index):
    %0 = "affine.apply"(%arg0) <{map = #map}> : (index) -> index
    %1 = "affine.apply"(%arg0) <{map = #map1}> : (index) -> index
    %2 = "affine.apply"(%0, %1) <{map = #map2}> : (index, index) -> index
    "test.compare"(%0, %1) <{cmp = "EQ", compose}> : (index, index) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<()[s0, s1] -> (s0, s1)>
"builtin.module"() ({
  "func.func"() <{function_type = (index, index) -> (), sym_name = "compare_affine_max"}> ({
  ^bb0(%arg0: index, %arg1: index):
    %0 = "affine.max"(%arg0, %arg1) <{map = #map}> : (index, index) -> index
    "test.compare"(%0, %arg0) <{cmp = "GE"}> : (index, index) -> ()
    "test.compare"(%0, %arg0) <{cmp = "GT"}> : (index, index) -> ()
    "test.compare"(%0, %arg0) <{cmp = "LT"}> : (index, index) -> ()
    "test.compare"(%0, %arg0) <{cmp = "LE"}> : (index, index) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<()[s0, s1] -> (s0, s1)>
"builtin.module"() ({
  "func.func"() <{function_type = (index, index) -> (), sym_name = "compare_affine_min"}> ({
  ^bb0(%arg0: index, %arg1: index):
    %0 = "affine.min"(%arg0, %arg1) <{map = #map}> : (index, index) -> index
    "test.compare"(%0, %arg0) <{cmp = "GE"}> : (index, index) -> ()
    "test.compare"(%0, %arg0) <{cmp = "GT"}> : (index, index) -> ()
    "test.compare"(%0, %arg0) <{cmp = "LT"}> : (index, index) -> ()
    "test.compare"(%0, %arg0) <{cmp = "LE"}> : (index, index) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<() -> (4)>
"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "compare_const_map"}> ({
    %0 = "arith.constant"() <{value = 5 : index}> : () -> index
    "test.compare"(%0) <{cmp = "GT", rhs_map = #map}> : (index) -> ()
    "test.compare"(%0) <{cmp = "LT", lhs_map = #map}> : (index) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1) -> (d0 + d1 + 1)>
#map1 = affine_map<(d0, d1) -> (d0 + d1)>
"builtin.module"() ({
  "func.func"() <{function_type = (index, index) -> (), sym_name = "compare_maps"}> ({
  ^bb0(%arg0: index, %arg1: index):
    "test.compare"(%arg0, %arg1, %arg1, %arg0) <{cmp = "GT", lhs_map = #map, rhs_map = #map1}> : (index, index, index, index) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (index) -> (index, index, index), sym_name = "delinearize_static"}> ({
  ^bb0(%arg0: index):
    %0 = "arith.constant"() <{value = 2 : index}> : () -> index
    %1 = "arith.constant"() <{value = 3 : index}> : () -> index
    %2:3 = "affine.delinearize_index"(%arg0) <{static_basis = array<i64: 2, 3, 5>}> : (index) -> (index, index, index)
    %3 = "test.reify_bound"(%2#0) <{type = "EQ"}> : (index) -> index
    %4 = "test.reify_bound"(%2#1) <{type = "EQ"}> : (index) -> index
    %5 = "test.reify_bound"(%2#2) <{type = "EQ"}> : (index) -> index
    "test.compare"(%2#0, %0) <{cmp = "LT"}> : (index, index) -> ()
    "test.compare"(%2#1, %1) <{cmp = "LT"}> : (index, index) -> ()
    "func.return"(%3, %4, %5) : (index, index, index) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (index) -> (index, index, index), sym_name = "delinearize_static_no_outer_bound"}> ({
  ^bb0(%arg0: index):
    %0 = "arith.constant"() <{value = 2 : index}> : () -> index
    %1 = "arith.constant"() <{value = 3 : index}> : () -> index
    %2:3 = "affine.delinearize_index"(%arg0) <{static_basis = array<i64: 3, 5>}> : (index) -> (index, index, index)
    %3 = "test.reify_bound"(%2#0) <{type = "EQ"}> : (index) -> index
    %4 = "test.reify_bound"(%2#1) <{type = "EQ"}> : (index) -> index
    %5 = "test.reify_bound"(%2#2) <{type = "EQ"}> : (index) -> index
    "test.compaare"(%2#0, %0) {cmp = "LT"} : (index, index) -> ()
    "test.compare"(%2#1, %1) <{cmp = "LT"}> : (index, index) -> ()
    "func.return"(%3, %4, %5) : (index, index, index) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (index, index) -> index, sym_name = "linearize_static"}> ({
  ^bb0(%arg0: index, %arg1: index):
    %0 = "arith.constant"() <{value = 6 : index}> : () -> index
    %1 = "affine.linearize_index"(%arg0, %arg1) <{disjoint, operandSegmentSizes = array<i32: 2, 0>, static_basis = array<i64: 2, 3>}> : (index, index) -> index
    %2 = "test.reify_bound"(%1) <{type = "EQ"}> : (index) -> index
    "test.compare"(%1, %0) <{cmp = "LT"}> : (index, index) -> ()
    "func.return"(%2) : (index) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (index, index) -> index, sym_name = "linearize_static_no_outer_bound"}> ({
  ^bb0(%arg0: index, %arg1: index):
    %0 = "arith.constant"() <{value = 6 : index}> : () -> index
    %1 = "affine.linearize_index"(%arg0, %arg1) <{disjoint, operandSegmentSizes = array<i32: 2, 0>, static_basis = array<i64: 3>}> : (index, index) -> index
    %2 = "test.reify_bound"(%1) <{type = "EQ"}> : (index) -> index
    "test.compare"(%1, %0) <{cmp = "LT"}> : (index, index) -> ()
    "func.return"(%2) : (index) -> ()
  }) : () -> ()
}) : () -> ()

