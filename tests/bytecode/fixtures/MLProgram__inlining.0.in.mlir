"builtin.module"() ({
  "ml_program.global"() <{sym_name = "global", sym_visibility = "private", type = tensor<4xi32>, value = dense<4> : tensor<4xi32>}> : () -> () loc("<stdin>":2:3)
  "func.func"() <{function_type = () -> tensor<4xi32>, sym_name = "inline_into"}> ({
    %1 = "func.call"() <{callee = @inline_from}> : () -> tensor<4xi32> loc("<stdin>":4:10)
    "func.return"(%1) : (tensor<4xi32>) -> () loc("<stdin>":5:5)
  }) : () -> () loc("<stdin>":3:3)
  "func.func"() <{function_type = () -> tensor<4xi32>, sym_name = "inline_from"}> ({
    %0 = "ml_program.global_load_const"() <{global = @global}> : () -> tensor<4xi32> loc("<stdin>":8:10)
    "func.return"(%0) : (tensor<4xi32>) -> () loc("<stdin>":9:5)
  }) : () -> () loc("<stdin>":7:3)
}) : () -> () loc("<stdin>":1:1)
