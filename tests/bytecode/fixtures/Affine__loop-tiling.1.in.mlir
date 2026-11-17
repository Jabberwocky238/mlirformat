"builtin.module"() ({
  "func.func"() <{function_type = (memref<?xi32>, index, index) -> (), sym_name = "loop_max_min_bound"}> ({
  ^bb0(%arg0: memref<?xi32> loc("<stdin>":6:8), %arg1: index loc("<stdin>":6:30), %arg2: index loc("<stdin>":6:44)):
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index loc("<stdin>":7:10)
    %1 = "memref.dim"(%arg0, %0) : (memref<?xi32>, index) -> index loc("<stdin>":8:10)
    "affine.for"(%arg1, %1, %arg2) <{lowerBoundMap = affine_map<()[s0] -> (0, s0)>, operandSegmentSizes = array<i32: 1, 2, 0>, step = 1 : index, upperBoundMap = affine_map<()[s0, s1] -> (s0, 4096 floordiv s1)>}> ({
    ^bb0(%arg3: index loc("<stdin>":10:10)):
      %2 = "arith.addi"(%arg3, %arg3) <{overflowFlags = #arith.overflow<none>}> : (index, index) -> index loc("<stdin>":11:12)
      "affine.yield"() : () -> () loc("<stdin>":12:7)
    }) : (index, index, index) -> () loc("<stdin>":9:5)
    "func.return"() : () -> () loc("<stdin>":14:5)
  }) : () -> () loc("<stdin>":5:3)
}) : () -> () loc("<stdin>":4:1)
