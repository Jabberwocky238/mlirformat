#sparse = #sparse_tensor.encoding<{ map = (d0) -> (d0 : compressed), posWidth = 64, crdWidth = 64 }>
#sparse1 = #sparse_tensor.encoding<{ map = (d0) -> (d0 : compressed), posWidth = 32, crdWidth = 32 }>
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<?xf32, #sparse>) -> tensor<?xf32, #sparse1>, sym_name = "sparse_convert"}> ({
  ^bb0(%arg1: tensor<?xf32, #sparse>):
    %1 = "sparse_tensor.convert"(%arg1) : (tensor<?xf32, #sparse>) -> tensor<?xf32, #sparse1>
    "func.return"(%1) : (tensor<?xf32, #sparse1>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<?xf32, #sparse1>) -> tensor<?xf64, #sparse1>, sym_name = "sparse_convert_value"}> ({
  ^bb0(%arg0: tensor<?xf32, #sparse1>):
    %0 = "sparse_tensor.convert"(%arg0) : (tensor<?xf32, #sparse1>) -> tensor<?xf64, #sparse1>
    "func.return"(%0) : (tensor<?xf64, #sparse1>) -> ()
  }) : () -> ()
}) : () -> ()

