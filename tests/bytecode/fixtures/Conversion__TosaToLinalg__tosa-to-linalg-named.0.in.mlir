"builtin.module"() ({
  "func.func"() <{function_type = (tensor<1x5x3xf32>, tensor<1x3x6xf32>) -> tensor<1x5x6xf32>, sym_name = "matmul"}> ({
  ^bb0(%arg0: tensor<1x5x3xf32> loc("<stdin>":3:8), %arg1: tensor<1x3x6xf32> loc("<stdin>":3:34)):
    %0 = "tosa.const"() <{values = dense<0.000000e+00> : tensor<1xf32>}> : () -> tensor<1xf32> loc("<stdin>":4:10)
    %1 = "tosa.const"() <{values = dense<0.000000e+00> : tensor<1xf32>}> : () -> tensor<1xf32> loc("<stdin>":5:10)
    %2 = "tosa.matmul"(%arg0, %arg1, %0, %1) : (tensor<1x5x3xf32>, tensor<1x3x6xf32>, tensor<1xf32>, tensor<1xf32>) -> tensor<1x5x6xf32> loc("<stdin>":6:10)
    "func.return"(%2) : (tensor<1x5x6xf32>) -> () loc("<stdin>":7:5)
  }) : () -> () loc("<stdin>":2:3)
}) : () -> () loc("<stdin>":1:1)
