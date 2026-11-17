"builtin.module"() ({
  "func.func"() <{function_type = (tensor<5xf32>) -> (), sym_name = "br"}> ({
  ^bb0(%arg0: tensor<5xf32> loc("<stdin>":3:8)):
    %0 = "scf.execute_region"() ({
      "cf.br"(%arg0)[^bb1] : (tensor<5xf32>) -> () loc("<stdin>":5:7)
    ^bb1(%1: tensor<5xf32> loc("<stdin>":6:10)):  // pred: ^bb0
      "scf.yield"(%1) : (tensor<5xf32>) -> () loc("<stdin>":7:7)
    }) : () -> tensor<5xf32> loc("<stdin>":4:10)
    "func.return"() : () -> () loc("<stdin>":9:5)
  }) : () -> () loc("<stdin>":2:3)
}) : () -> () loc("<stdin>":1:1)
