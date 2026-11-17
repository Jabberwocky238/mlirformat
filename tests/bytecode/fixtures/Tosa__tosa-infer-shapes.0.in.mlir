"builtin.module"() ({
  "func.func"() <{function_type = (tensor<4xf32>) -> tensor<*xf32>, sym_name = "test_return"}> ({
  ^bb0(%arg0: tensor<4xf32> loc("<stdin>":3:8)):
    %0 = "tosa.log"(%arg0) : (tensor<4xf32>) -> tensor<*xf32> loc("<stdin>":4:10)
    "func.return"(%0) : (tensor<*xf32>) -> () loc("<stdin>":5:5)
  }) : () -> () loc("<stdin>":2:3)
}) : () -> () loc("<stdin>":1:1)
