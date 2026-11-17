"builtin.module"() ({
  "func.func"() <{function_type = (tensor<64xf32>) -> (), sym_name = "callee", sym_visibility = "private"}> ({
  }) : () -> () loc("<stdin>":2:3)
  "func.func"() <{function_type = (tensor<64xf32>) -> (), sym_name = "caller"}> ({
  ^bb0(%arg0: tensor<64xf32> loc("<stdin>":5:8)):
    "func.call"(%arg0) <{callee = @callee}> : (tensor<64xf32>) -> () loc("<stdin>":6:5)
    "func.return"() : () -> () loc("<stdin>":7:5)
  }) : () -> () loc("<stdin>":4:3)
}) : () -> () loc("<stdin>":1:1)
