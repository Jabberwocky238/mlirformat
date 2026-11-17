"builtin.module"() ({
  "func.func"() <{function_type = (tensor<2x3xf32>) -> tensor<2x3xf32>, sym_name = "simple_abs"}> ({
  ^bb0(%arg0: tensor<2x3xf32> loc("<stdin>":3:8)):
    %0 = "tosa.abs"(%arg0) : (tensor<2x3xf32>) -> tensor<2x3xf32> loc("<stdin>":4:10)
    "func.return"(%0) : (tensor<2x3xf32>) -> () loc("<stdin>":5:5)
  }) : () -> () loc("<stdin>":2:3)
}) : () -> () loc("<stdin>":1:1)
