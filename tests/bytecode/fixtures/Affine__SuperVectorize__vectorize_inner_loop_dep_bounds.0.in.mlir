"builtin.module"() ({
  "func.func"() <{function_type = (memref<32xf32>) -> (), sym_name = "inner_loop_dep_bounds"}> ({
  ^bb0(%arg3: memref<32xf32> loc("<stdin>":8:8)):
    %1 = "arith.constant"() <{value = 1.000000e+00 : f32}> : () -> f32 loc("<stdin>":9:10)
    "affine.for"() <{lowerBoundMap = affine_map<() -> (0)>, operandSegmentSizes = array<i32: 0, 0, 0>, step = 32 : index, upperBoundMap = affine_map<() -> (6)>}> ({
    ^bb0(%arg4: index loc("<stdin>":11:10)):
      "affine.for"(%arg4, %arg4) <{lowerBoundMap = affine_map<(d0) -> (d0)>, operandSegmentSizes = array<i32: 1, 1, 0>, step = 1 : index, upperBoundMap = affine_map<(d0) -> (d0 + 6)>}> ({
      ^bb0(%arg5: index loc("<stdin>":13:12)):
        "affine.store"(%1, %arg3, %arg5) <{map = affine_map<(d0) -> (d0)>}> : (f32, memref<32xf32>, index) -> () loc("<stdin>":14:9)
        "affine.yield"() : () -> () loc("<stdin>":15:9)
      }) : (index, index) -> () loc("<stdin>":12:7)
      "affine.yield"() : () -> () loc("<stdin>":17:7)
    }) : () -> () loc("<stdin>":10:5)
    "func.return"() : () -> () loc("<stdin>":19:5)
  }) : () -> () loc("<stdin>":7:3)
  "func.func"() <{function_type = (memref<64xf32>) -> (), sym_name = "inner_loop_dep_upper_bound"}> ({
  ^bb0(%arg0: memref<64xf32> loc("<stdin>":22:8)):
    %0 = "arith.constant"() <{value = 1.000000e+00 : f32}> : () -> f32 loc("<stdin>":23:10)
    "affine.for"() <{lowerBoundMap = affine_map<() -> (0)>, operandSegmentSizes = array<i32: 0, 0, 0>, step = 32 : index, upperBoundMap = affine_map<() -> (64)>}> ({
    ^bb0(%arg1: index loc("<stdin>":25:10)):
      "affine.for"(%arg1) <{lowerBoundMap = affine_map<() -> (0)>, operandSegmentSizes = array<i32: 0, 1, 0>, step = 1 : index, upperBoundMap = affine_map<(d0) -> (d0 + 6)>}> ({
      ^bb0(%arg2: index loc("<stdin>":27:12)):
        "affine.store"(%0, %arg0, %arg2) <{map = affine_map<(d0) -> (d0)>}> : (f32, memref<64xf32>, index) -> () loc("<stdin>":28:9)
        "affine.yield"() : () -> () loc("<stdin>":29:9)
      }) : (index) -> () loc("<stdin>":26:7)
      "affine.yield"() : () -> () loc("<stdin>":31:7)
    }) : () -> () loc("<stdin>":24:5)
    "func.return"() : () -> () loc("<stdin>":33:5)
  }) : () -> () loc("<stdin>":21:3)
}) : () -> () loc("<stdin>":6:1)
