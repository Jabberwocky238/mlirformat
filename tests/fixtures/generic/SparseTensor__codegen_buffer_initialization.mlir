#sparse = #sparse_tensor.encoding<{ map = (d0) -> (d0 : compressed) }>
"builtin.module"() ({
  "func.func"() <{function_type = (index) -> tensor<?xf64, #sparse>, sym_name = "empty_sparse_vector"}> ({
  ^bb0(%arg0: index):
    %0 = "tensor.empty"(%arg0) : (index) -> tensor<?xf64, #sparse>
    %1 = "sparse_tensor.load"(%0) : (tensor<?xf64, #sparse>) -> tensor<?xf64, #sparse>
    "func.return"(%1) : (tensor<?xf64, #sparse>) -> ()
  }) : () -> ()
}) : () -> ()

