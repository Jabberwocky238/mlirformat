"builtin.module"() ({
  "ml_program.global"() <{sym_name = "global", sym_visibility = "private", type = tensor<4xi32>, value = dense<4> : tensor<4xi32>}> : () -> ()
  "func.func"() <{function_type = () -> tensor<4xi32>, sym_name = "inline_into"}> ({
    %1 = "func.call"() <{callee = @inline_from}> : () -> tensor<4xi32>
    "func.return"(%1) : (tensor<4xi32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> tensor<4xi32>, sym_name = "inline_from"}> ({
    %0 = "ml_program.global_load_const"() <{global = @global}> : () -> tensor<4xi32>
    "func.return"(%0) : (tensor<4xi32>) -> ()
  }) : () -> ()
}) : () -> ()

