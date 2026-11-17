"builtin.module"() ({
  "gpu.module"() <{sym_name = "random_container"}> ({
    "func.func"() <{function_type = (tensor<1xi8>) -> tensor<1xi8>, sym_name = "nested"}> ({
    ^bb0(%arg0: tensor<1xi8> loc("<stdin>":4:10)):
      "func.return"(%arg0) : (tensor<1xi8>) -> () loc("<stdin>":5:7)
    }) : () -> () loc("<stdin>":3:5)
  }) : () -> () loc("<stdin>":2:3)
}) : () -> () loc("<stdin>":1:1)
