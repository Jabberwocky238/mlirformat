"builtin.module"() ({
  "func.func"() <{function_type = (tensor<2xf32>, tensor<2xf32>) -> tensor<2xf32>, sym_name = "add", sym_visibility = "private"}> ({
  ^bb0(%arg0: tensor<2xf32> loc("<stdin>":3:8), %arg1: tensor<2xf32> loc("<stdin>":3:30)):
    %0 = "tosa.add"(%arg0, %arg1) : (tensor<2xf32>, tensor<2xf32>) -> tensor<2xf32> loc("<stdin>":4:10)
    "func.return"(%0) : (tensor<2xf32>) -> () loc("<stdin>":5:5)
  }) : () -> () loc("<stdin>":2:3)
}) : () -> () loc("<stdin>":1:1)
