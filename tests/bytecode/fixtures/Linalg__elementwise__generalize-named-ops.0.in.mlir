"builtin.module"() ({
  "func.func"() <{function_type = (tensor<8x16x32xf32>, tensor<8x16x32xf32>) -> tensor<8x16x32xf32>, sym_name = "unary_exp"}> ({
  ^bb0(%arg0: tensor<8x16x32xf32> loc("<stdin>":4:8), %arg1: tensor<8x16x32xf32> loc("<stdin>":4:36)):
    %0 = "linalg.elementwise"(%arg0, %arg1) <{indexing_maps = [affine_map<(d0, d1, d2) -> (d0, d1, d2)>, affine_map<(d0, d1, d2) -> (d0, d1, d2)>], kind = #linalg.elementwise_kind<exp>, operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg2: f32 loc("<stdin>":6:10), %arg3: f32 loc("<stdin>":6:22)):
      %1 = "math.exp"(%arg2) <{fastmath = #arith.fastmath<none>}> : (f32) -> f32 loc("<stdin>":7:12)
      "linalg.yield"(%1) : (f32) -> () loc("<stdin>":8:7)
    }) : (tensor<8x16x32xf32>, tensor<8x16x32xf32>) -> tensor<8x16x32xf32> loc("<stdin>":5:10)
    "func.return"(%0) : (tensor<8x16x32xf32>) -> () loc("<stdin>":10:5)
  }) : () -> () loc("<stdin>":3:3)
}) : () -> () loc("<stdin>":2:1)
