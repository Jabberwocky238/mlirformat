#map = affine_map<() -> (0)>
#map1 = affine_map<(d0) -> (d0)>
"builtin.module"() ({
  "func.func"() <{function_type = (index) -> i32, sym_name = "affine_parallel_assign_reduction_no_crash"}> ({
  ^bb0(%arg0: index):
    %0 = "affine.parallel"(%arg0) <{lowerBoundsGroups = dense<1> : tensor<1xi32>, lowerBoundsMap = #map, reductions = [3], steps = [1], upperBoundsGroups = dense<1> : tensor<1xi32>, upperBoundsMap = #map1}> ({
    ^bb0(%arg1: index):
      %1 = "arith.constant"() <{value = 0 : i32}> : () -> i32
      "affine.yield"(%1) : (i32) -> ()
    }) : (index) -> i32
    "func.return"(%0) : (i32) -> ()
  }) : () -> ()
}) : () -> ()

