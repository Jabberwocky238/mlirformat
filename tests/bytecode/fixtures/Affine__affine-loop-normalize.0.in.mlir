"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "normalize_parallel"}> ({
    %0 = "arith.constant"() <{value = 1.000000e+00 : f32}> : () -> f32 loc("<stdin>":7:10)
    %1 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<2x4xf32> loc("<stdin>":8:10)
    "affine.parallel"() <{lowerBoundsGroups = dense<1> : tensor<2xi32>, lowerBoundsMap = affine_map<() -> (0, 1)>, reductions = [], steps = [3, 2], upperBoundsGroups = dense<1> : tensor<2xi32>, upperBoundsMap = affine_map<() -> (10, 5)>}> ({
    ^bb0(%arg0: index loc("<stdin>":10:10), %arg1: index loc("<stdin>":10:24)):
      "affine.parallel"(%arg0, %arg1) <{lowerBoundsGroups = dense<1> : tensor<1xi32>, lowerBoundsMap = affine_map<(d0) -> (d0)>, reductions = [], steps = [1], upperBoundsGroups = dense<1> : tensor<1xi32>, upperBoundsMap = affine_map<(d0) -> (d0)>}> ({
      ^bb0(%arg2: index loc("<stdin>":12:12)):
        "affine.store"(%0, %1, %arg0, %arg2) <{map = affine_map<(d0, d1) -> (d0, d1)>}> : (f32, memref<2x4xf32>, index, index) -> () loc("<stdin>":13:9)
        "affine.yield"() : () -> () loc("<stdin>":14:9)
      }) : (index, index) -> () loc("<stdin>":11:7)
      "affine.yield"() : () -> () loc("<stdin>":16:7)
    }) : () -> () loc("<stdin>":9:5)
    "func.return"() : () -> () loc("<stdin>":18:5)
  }) : () -> () loc("<stdin>":6:3)
}) : () -> () loc("<stdin>":5:1)
