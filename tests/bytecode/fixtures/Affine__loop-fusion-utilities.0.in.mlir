"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "slice_depth1_loop_nest"}> ({
    %0 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<100xf32> loc("<stdin>":7:10)
    %1 = "arith.constant"() <{value = 7.000000e+00 : f32}> : () -> f32 loc("<stdin>":8:10)
    "affine.for"() <{lowerBoundMap = affine_map<() -> (0)>, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = affine_map<() -> (16)>}> ({
    ^bb0(%arg1: index loc("<stdin>":10:10)):
      "affine.store"(%1, %0, %arg1) <{map = affine_map<(d0) -> (d0)>}> : (f32, memref<100xf32>, index) -> () loc("<stdin>":11:7)
      "affine.yield"() : () -> () loc("<stdin>":12:7)
    }) : () -> () loc("<stdin>":9:5)
    "affine.for"() <{lowerBoundMap = affine_map<() -> (0)>, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = affine_map<() -> (5)>}> ({
    ^bb0(%arg0: index loc("<stdin>":15:10)):
      %2 = "affine.load"(%0, %arg0) <{map = affine_map<(d0) -> (d0)>}> : (memref<100xf32>, index) -> f32 loc("<stdin>":16:12)
      "prevent.dce"(%2) : (f32) -> () loc("<stdin>":17:7)
      "affine.yield"() : () -> () loc("<stdin>":18:7)
    }) : () -> () loc("<stdin>":14:5)
    "func.return"() : () -> () loc("<stdin>":20:5)
  }) : () -> () loc("<stdin>":6:3)
}) : () -> () loc("<stdin>":5:1)
