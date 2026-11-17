"builtin.module"() ({
  "func.func"() <{function_type = (tensor<4xf32>) -> tensor<4xf32>, sym_name = "basic"}> ({
  ^bb0(%arg0: tensor<4xf32> loc("<stdin>":4:8)):
    %0 = "linalg.generic"(%arg0, %arg0) <{indexing_maps = [affine_map<(d0) -> (d0)>, affine_map<(d0) -> (d0)>], iterator_types = [#linalg.iterator_type<parallel>], operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg1: f32 loc("<stdin>":6:10), %arg2: f32 loc("<stdin>":6:22)):
      %1 = "math.exp"(%arg1) <{fastmath = #arith.fastmath<none>}> : (f32) -> f32 loc("<stdin>":7:12)
      "linalg.yield"(%1) : (f32) -> () loc("<stdin>":8:7)
    }) : (tensor<4xf32>, tensor<4xf32>) -> tensor<4xf32> loc("<stdin>":5:10)
    "func.return"(%0) : (tensor<4xf32>) -> () loc("<stdin>":10:5)
  }) : () -> () loc("<stdin>":3:3)
}) : () -> () loc("<stdin>":2:1)
