"builtin.module"() ({
  "func.func"() <{function_type = (vector<4xf32>, vector<4xf32>) -> (), sym_name = "invalid_operand"}> ({
  ^bb0(%arg4: vector<4xf32> loc("<stdin>":7:8), %arg5: vector<4xf32> loc("<stdin>":7:30)):
    "affine.for"() <{lowerBoundMap = affine_map<() -> (0)>, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = affine_map<() -> (10)>}> ({
    ^bb0(%arg6: index loc("<stdin>":9:10)):
      %1 = "vector.reduction"(%arg4) <{fastmath = #arith.fastmath<none>, kind = #vector.kind<add>}> : (vector<4xf32>) -> f32 loc("<stdin>":10:12)
      "affine.yield"() : () -> () loc("<stdin>":11:7)
    }) : () -> () loc("<stdin>":8:5)
    "func.return"() : () -> () loc("<stdin>":13:5)
  }) : () -> () loc("<stdin>":6:3)
  "func.func"() <{function_type = (memref<10x20xf32>, memref<10x20xf32>) -> (), sym_name = "invalid_result"}> ({
  ^bb0(%arg0: memref<10x20xf32> loc("<stdin>":16:8), %arg1: memref<10x20xf32> loc("<stdin>":16:34)):
    "affine.for"() <{lowerBoundMap = affine_map<() -> (0)>, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = affine_map<() -> (10)>}> ({
    ^bb0(%arg2: index loc("<stdin>":18:10)):
      "affine.for"() <{lowerBoundMap = affine_map<() -> (0)>, operandSegmentSizes = array<i32: 0, 0, 0>, step = 1 : index, upperBoundMap = affine_map<() -> (5)>}> ({
      ^bb0(%arg3: index loc("<stdin>":20:12)):
        %0 = "affine.vector_load"(%arg0, %arg2, %arg3) <{map = affine_map<(d0, d1) -> (d0, d1)>}> : (memref<10x20xf32>, index, index) -> vector<4xf32> loc("<stdin>":21:14)
        "affine.vector_store"(%0, %arg1, %arg2, %arg3) <{map = affine_map<(d0, d1) -> (d0, d1)>}> : (vector<4xf32>, memref<10x20xf32>, index, index) -> () loc("<stdin>":22:9)
        "affine.yield"() : () -> () loc("<stdin>":23:9)
      }) : () -> () loc("<stdin>":19:7)
      "affine.yield"() : () -> () loc("<stdin>":25:7)
    }) : () -> () loc("<stdin>":17:5)
    "func.return"() : () -> () loc("<stdin>":27:5)
  }) : () -> () loc("<stdin>":15:3)
}) : () -> () loc("<stdin>":5:1)
