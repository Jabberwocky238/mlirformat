"builtin.module"() ({
  "func.func"() <{function_type = (index) -> i32, sym_name = "affine_parallel_assign_reduction_no_crash"}> ({
  ^bb0(%arg0: index loc("<stdin>":5:8)):
    %0 = "affine.parallel"(%arg0) <{lowerBoundsGroups = dense<1> : tensor<1xi32>, lowerBoundsMap = affine_map<() -> (0)>, reductions = [3], steps = [1], upperBoundsGroups = dense<1> : tensor<1xi32>, upperBoundsMap = affine_map<(d0) -> (d0)>}> ({
    ^bb0(%arg1: index loc("<stdin>":7:10)):
      %1 = "arith.constant"() <{value = 0 : i32}> : () -> i32 loc("<stdin>":8:12)
      "affine.yield"(%1) : (i32) -> () loc("<stdin>":9:7)
    }) : (index) -> i32 loc("<stdin>":6:10)
    "func.return"(%0) : (i32) -> () loc("<stdin>":11:5)
  }) : () -> () loc("<stdin>":4:3)
}) : () -> () loc("<stdin>":3:1)
