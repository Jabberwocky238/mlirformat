"builtin.module"() ({
  "func.func"() <{function_type = (tensor<2x16x14x3xf32>, tensor<5x3x6x3xf32>, tensor<5xf32>) -> tensor<2x18x19x5xf32>, sym_name = "transpose_conv2d"}> ({
  ^bb0(%arg0: tensor<2x16x14x3xf32> loc("<stdin>":3:8), %arg1: tensor<5x3x6x3xf32> loc("<stdin>":3:38), %arg2: tensor<5xf32> loc("<stdin>":3:66)):
    %0 = "tosa.const"() <{values = dense<0.000000e+00> : tensor<1xf32>}> : () -> tensor<1xf32> loc("<stdin>":4:10)
    %1 = "tosa.transpose_conv2d"(%arg0, %arg1, %arg2, %0, %0) <{acc_type = f32, out_pad = array<i64: 0, 0, 0, 0>, stride = array<i64: 1, 1>}> : (tensor<2x16x14x3xf32>, tensor<5x3x6x3xf32>, tensor<5xf32>, tensor<1xf32>, tensor<1xf32>) -> tensor<2x18x19x5xf32> loc("<stdin>":5:10)
    "func.return"(%1) : (tensor<2x18x19x5xf32>) -> () loc("<stdin>":6:5)
  }) : () -> () loc("<stdin>":2:3)
}) : () -> () loc("<stdin>":1:1)
