"builtin.module"() ({
  "func.func"() <{function_type = (tensor<16x8x32xf32>, tensor<8x16x32xf32>) -> tensor<8x16x32xf32>, sym_name = "unary_transpose"}> ({
  ^bb0(%arg0: tensor<16x8x32xf32> loc("<stdin>":4:8), %arg1: tensor<8x16x32xf32> loc("<stdin>":4:36)):
    %0 = "tensor.empty"() : () -> tensor<8x16x32xf32> loc("<stdin>":5:10)
    %1 = "linalg.transpose"(%arg0, %0) <{permutation = array<i64: 1, 0, 2>}> ({
    ^bb0(%arg4: f32 loc("<stdin>":7:10), %arg5: f32 loc("<stdin>":7:22)):
      "linalg.yield"(%arg4) : (f32) -> () loc("<stdin>":8:7)
    }) : (tensor<16x8x32xf32>, tensor<8x16x32xf32>) -> tensor<8x16x32xf32> loc("<stdin>":6:10)
    %2 = "linalg.elementwise"(%1, %arg1) <{indexing_maps = [affine_map<(d0, d1, d2) -> (d0, d1, d2)>, affine_map<(d0, d1, d2) -> (d0, d1, d2)>], kind = #linalg.elementwise_kind<exp>, operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg2: f32 loc("<stdin>":11:10), %arg3: f32 loc("<stdin>":11:22)):
      %3 = "math.exp"(%arg2) <{fastmath = #arith.fastmath<none>}> : (f32) -> f32 loc("<stdin>":12:12)
      "linalg.yield"(%3) : (f32) -> () loc("<stdin>":13:7)
    }) : (tensor<8x16x32xf32>, tensor<8x16x32xf32>) -> tensor<8x16x32xf32> loc("<stdin>":10:10)
    "func.return"(%2) : (tensor<8x16x32xf32>) -> () loc("<stdin>":15:5)
  }) : () -> () loc("<stdin>":3:3)
}) : () -> () loc("<stdin>":2:1)
