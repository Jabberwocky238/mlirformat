"builtin.module"() ({
  "func.func"() <{function_type = () -> tensor<2xf32>, sym_name = "rewrite_f32_tensor"}> ({
    %0 = "arith.constant"() <{value = dense<[1.000000e+00, 2.000000e+00]> : tensor<2xf32>}> : () -> tensor<2xf32> loc("<stdin>":3:10)
    "func.return"(%0) : (tensor<2xf32>) -> () loc("<stdin>":4:5)
  }) : () -> () loc("<stdin>":2:3)
}) : () -> () loc("<stdin>":1:1)
