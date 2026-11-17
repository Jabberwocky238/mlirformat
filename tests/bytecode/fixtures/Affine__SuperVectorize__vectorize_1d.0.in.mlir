"builtin.module"() ({
  "func.func"() <{function_type = (memref<?x?xf32>, memref<?x?x?xf32>) -> (), sym_name = "vec1d_1"}> ({
  ^bb0(%arg0: memref<?x?xf32> loc("<stdin>":6:8), %arg1: memref<?x?x?xf32> loc("<stdin>":6:32)):
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index loc("<stdin>":7:10)
    %1 = "arith.constant"() <{value = 1 : index}> : () -> index loc("<stdin>":8:10)
    %2 = "arith.constant"() <{value = 2 : index}> : () -> index loc("<stdin>":9:10)
    %3 = "memref.dim"(%arg0, %0) : (memref<?x?xf32>, index) -> index loc("<stdin>":10:10)
    %4 = "memref.dim"(%arg0, %1) : (memref<?x?xf32>, index) -> index loc("<stdin>":11:10)
    %5 = "memref.dim"(%arg1, %2) : (memref<?x?x?xf32>, index) -> index loc("<stdin>":12:10)
    "affine.for"(%3) <{lowerBoundMap = affine_map<() -> (0)>, operandSegmentSizes = array<i32: 0, 1, 0>, step = 1 : index, upperBoundMap = affine_map<()[s0] -> (s0)>}> ({
    ^bb0(%arg2: index loc("<stdin>":14:10)):
      %6 = "affine.load"(%arg0, %0) <{map = affine_map<(d0) -> (d0, d0)>}> : (memref<?x?xf32>, index) -> f32 loc("<stdin>":15:12)
      "affine.yield"() : () -> () loc("<stdin>":16:7)
    }) : (index) -> () loc("<stdin>":13:5)
    "func.return"() : () -> () loc("<stdin>":18:5)
  }) : () -> () loc("<stdin>":5:3)
}) : () -> () loc("<stdin>":4:1)
