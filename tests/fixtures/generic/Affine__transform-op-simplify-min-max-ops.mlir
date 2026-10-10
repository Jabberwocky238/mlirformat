#map = affine_map<()[s0, s1] -> (s0, 192, s1)>
#map1 = affine_map<()[s0, s1] -> (s0, 32, s1)>
#map2 = affine_map<()[s0, s1] -> (s0, 256, s1)>
#map3 = affine_map<()[s0, s1, s2] -> (s0, s1, s2)>
"builtin.module"() ({
  "func.func"() <{function_type = () -> (index, index), sym_name = "min_max_full_simplify"}> ({
    %14 = "test.value_with_bounds"() <{max = 128 : index, min = 0 : index}> : () -> index
    %15 = "test.value_with_bounds"() <{max = 512 : index, min = 256 : index}> : () -> index
    %16 = "affine.min"(%14, %15) <{map = #map}> : (index, index) -> index
    %17 = "affine.max"(%14, %15) <{map = #map}> : (index, index) -> index
    "func.return"(%16, %17) : (index, index) -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> (index, index), sym_name = "min_only_simplify"}> ({
    %10 = "test.value_with_bounds"() <{max = 512 : index, min = 0 : index}> : () -> index
    %11 = "test.value_with_bounds"() <{max = 512 : index, min = 256 : index}> : () -> index
    %12 = "affine.min"(%10, %11) <{map = #map1}> : (index, index) -> index
    %13 = "affine.max"(%10, %11) <{map = #map1}> : (index, index) -> index
    "func.return"(%12, %13) : (index, index) -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> (index, index), sym_name = "max_only_simplify"}> ({
    %6 = "test.value_with_bounds"() <{max = 128 : index, min = 0 : index}> : () -> index
    %7 = "test.value_with_bounds"() <{max = 512 : index, min = 0 : index}> : () -> index
    %8 = "affine.min"(%6, %7) <{map = #map2}> : (index, index) -> index
    %9 = "affine.max"(%6, %7) <{map = #map2}> : (index, index) -> index
    "func.return"(%8, %9) : (index, index) -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> (index, index), sym_name = "overlapping_constraints"}> ({
    %1 = "test.value_with_bounds"() <{max = 192 : index, min = 0 : index}> : () -> index
    %2 = "test.value_with_bounds"() <{max = 384 : index, min = 128 : index}> : () -> index
    %3 = "test.value_with_bounds"() <{max = 512 : index, min = 256 : index}> : () -> index
    %4 = "affine.min"(%1, %2, %3) <{map = #map3}> : (index, index, index) -> index
    %5 = "affine.max"(%1, %2, %3) <{map = #map3}> : (index, index, index) -> index
    "func.return"(%4, %5) : (index, index) -> ()
  }) : () -> ()
  "builtin.module"() ({
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg0: !transform.any_op):
      %0 = "transform.structured.match"(%arg0) <{ops = ["affine.min", "affine.max"]}> : (!transform.any_op) -> !transform.any_op
      "transform.affine.simplify_min_max_affine_ops"(%0) : (!transform.any_op) -> ()
      "transform.yield"() : () -> ()
    }) : () -> ()
  }) {transform.with_named_sequence} : () -> ()
}) : () -> ()

