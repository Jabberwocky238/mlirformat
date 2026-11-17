"builtin.module"() ({
  "func.func"() <{function_type = (tensor<16xf16>, tensor<16xf8E8M0FNU>) -> tensor<16xf4E2M1FN>, sym_name = "m0"}> ({
  ^bb0(%arg1: tensor<16xf16> loc("<stdin>":3:8), %arg2: tensor<16xf8E8M0FNU> loc("<stdin>":3:31)):
    %2 = "arith.scaling_truncf"(%arg1, %arg2) : (tensor<16xf16>, tensor<16xf8E8M0FNU>) -> tensor<16xf4E2M1FN> loc("<stdin>":4:10)
    "func.return"(%2) : (tensor<16xf4E2M1FN>) -> () loc("<stdin>":5:5)
  }) : () -> () loc("<stdin>":2:3)
  "func.func"() <{function_type = (tensor<4xf32>) -> tensor<4xf4E2M1FN>, sym_name = "m1"}> ({
  ^bb0(%arg0: tensor<4xf32> loc("<stdin>":8:8)):
    %0 = "arith.constant"() <{value = dense<1.000000e+00> : tensor<4xf8E8M0FNU>}> : () -> tensor<4xf8E8M0FNU> loc("<stdin>":9:10)
    %1 = "arith.scaling_truncf"(%arg0, %0) : (tensor<4xf32>, tensor<4xf8E8M0FNU>) -> tensor<4xf4E2M1FN> loc("<stdin>":10:10)
    "func.return"(%1) : (tensor<4xf4E2M1FN>) -> () loc("<stdin>":11:5)
  }) : () -> () loc("<stdin>":7:3)
}) : () -> () loc("<stdin>":1:1)
