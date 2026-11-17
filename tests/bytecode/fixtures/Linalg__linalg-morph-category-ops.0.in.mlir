"builtin.module"() ({
  "func.func"() <{function_type = (tensor<16x8xf32>, tensor<16x8xf32>) -> tensor<16x8xf32>, sym_name = "exp"}> ({
  ^bb0(%arg0: tensor<16x8xf32> loc("<stdin>":3:8), %arg1: tensor<16x8xf32> loc("<stdin>":3:33)):
    %0 = "linalg.exp"(%arg0, %arg1) <{operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg2: f32 loc("<stdin>":5:10), %arg3: f32 loc("<stdin>":5:22)):
      %1 = "math.exp"(%arg2) <{fastmath = #arith.fastmath<none>}> : (f32) -> f32 loc("<stdin>":6:12)
      "linalg.yield"(%1) : (f32) -> () loc("<stdin>":7:7)
    }) : (tensor<16x8xf32>, tensor<16x8xf32>) -> tensor<16x8xf32> loc("<stdin>":4:10)
    "func.return"(%0) : (tensor<16x8xf32>) -> () loc("<stdin>":9:5)
  }) : () -> () loc("<stdin>":2:3)
}) : () -> () loc("<stdin>":1:1)
