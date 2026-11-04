#sparse = #sparse_tensor.encoding<{ map = (d0) -> (d0 : compressed) }>
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<?xf64, #sparse>) -> tensor<?xf64, #sparse>, sym_name = "sparse_nop"}> ({
  ^bb0(%arg0: tensor<?xf64, #sparse>):
    "func.return"(%arg0) : (tensor<?xf64, #sparse>) -> ()
  }) : () -> ()
}) : () -> ()

