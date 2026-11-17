"builtin.module"() ({
  "func.func"() <{function_type = (tensor<5xf32>) -> tensor<5xf32>, sym_name = "single_branch"}> ({
  ^bb0(%arg0: tensor<5xf32> loc("<stdin>":3:8)):
    "cf.br"(%arg0)[^bb1] : (tensor<5xf32>) -> () loc("<stdin>":4:5)
  ^bb1(%0: tensor<5xf32> loc("<stdin>":5:8)):  // pred: ^bb0
    "func.return"(%0) : (tensor<5xf32>) -> () loc("<stdin>":6:5)
  }) : () -> () loc("<stdin>":2:3)
}) : () -> () loc("<stdin>":1:1)
