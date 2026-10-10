#map = affine_map<()[s0, s1] -> (s0, 192, s1)>
#map1 = affine_map<()[s0, s1] -> (s0, 32, s1)>
#map2 = affine_map<()[s0, s1] -> (s0, 256, s1)>
#map3 = affine_map<()[s0, s1, s2] -> (s0, s1, s2)>
"builtin.module"() ({
  "func.func"() <{function_type = () -> (index, index), sym_name = "min_max_full_simplify"}> ({
    %13 = "test.value_with_bounds"() <{max = 128 : index, min = 0 : index}> : () -> index
    %14 = "test.value_with_bounds"() <{max = 512 : index, min = 256 : index}> : () -> index
    %15 = "affine.min"(%13, %14) <{map = #map}> : (index, index) -> index
    %16 = "affine.max"(%13, %14) <{map = #map}> : (index, index) -> index
    "func.return"(%15, %16) : (index, index) -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> (index, index), sym_name = "min_only_simplify"}> ({
    %9 = "test.value_with_bounds"() <{max = 512 : index, min = 0 : index}> : () -> index
    %10 = "test.value_with_bounds"() <{max = 512 : index, min = 256 : index}> : () -> index
    %11 = "affine.min"(%9, %10) <{map = #map1}> : (index, index) -> index
    %12 = "affine.max"(%9, %10) <{map = #map1}> : (index, index) -> index
    "func.return"(%11, %12) : (index, index) -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> (index, index), sym_name = "max_only_simplify"}> ({
    %5 = "test.value_with_bounds"() <{max = 128 : index, min = 0 : index}> : () -> index
    %6 = "test.value_with_bounds"() <{max = 512 : index, min = 0 : index}> : () -> index
    %7 = "affine.min"(%5, %6) <{map = #map2}> : (index, index) -> index
    %8 = "affine.max"(%5, %6) <{map = #map2}> : (index, index) -> index
    "func.return"(%7, %8) : (index, index) -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> (index, index), sym_name = "overlapping_constraints"}> ({
    %0 = "test.value_with_bounds"() <{max = 192 : index, min = 0 : index}> : () -> index
    %1 = "test.value_with_bounds"() <{max = 384 : index, min = 128 : index}> : () -> index
    %2 = "test.value_with_bounds"() <{max = 512 : index, min = 256 : index}> : () -> index
    %3 = "affine.min"(%0, %1, %2) <{map = #map3}> : (index, index, index) -> index
    %4 = "affine.max"(%0, %1, %2) <{map = #map3}> : (index, index, index) -> index
    "func.return"(%3, %4) : (index, index) -> ()
  }) : () -> ()
}) : () -> ()

