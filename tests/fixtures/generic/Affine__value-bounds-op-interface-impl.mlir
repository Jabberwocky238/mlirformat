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
  "func.func"() <{function_type = (index) -> index, sym_name = "affine_min_ub"}> ({
  ^bb0(%arg0: index):
    %0 = "affine.min"(%arg0) <{map = #map}> : (index) -> index
    %1 = "test.reify_bound"(%0) <{type = "UB"}> : (index) -> index
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

