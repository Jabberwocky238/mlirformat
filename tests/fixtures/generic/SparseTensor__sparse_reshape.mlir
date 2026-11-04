#sparse = #sparse_tensor.encoding<{ map = (d0) -> (d0 : compressed) }>
#sparse1 = #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed, d1 : compressed) }>
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<100xf64, #sparse>) -> tensor<10x10xf64, #sparse1>, sym_name = "sparse_expand"}> ({
  ^bb0(%arg4: tensor<100xf64, #sparse>):
    %3 = "tensor.expand_shape"(%arg4) <{reassociation = [[0, 1]], static_output_shape = array<i64: 10, 10>}> : (tensor<100xf64, #sparse>) -> tensor<10x10xf64, #sparse1>
    "func.return"(%3) : (tensor<10x10xf64, #sparse1>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<10x10xf64, #sparse1>) -> tensor<100xf64, #sparse>, sym_name = "sparse_collapse"}> ({
  ^bb0(%arg3: tensor<10x10xf64, #sparse1>):
    %2 = "tensor.collapse_shape"(%arg3) <{reassociation = [[0, 1]]}> : (tensor<10x10xf64, #sparse1>) -> tensor<100xf64, #sparse>
    "func.return"(%2) : (tensor<100xf64, #sparse>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<?xf64, #sparse>, index) -> tensor<?x10xf64, #sparse1>, sym_name = "dynamic_sparse_expand"}> ({
  ^bb0(%arg1: tensor<?xf64, #sparse>, %arg2: index):
    %1 = "tensor.expand_shape"(%arg1, %arg2) <{reassociation = [[0, 1]], static_output_shape = array<i64: -9223372036854775808, 10>}> : (tensor<?xf64, #sparse>, index) -> tensor<?x10xf64, #sparse1>
    "func.return"(%1) : (tensor<?x10xf64, #sparse1>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<10x?xf64, #sparse1>) -> tensor<?xf64, #sparse>, sym_name = "dynamic_sparse_collapse"}> ({
  ^bb0(%arg0: tensor<10x?xf64, #sparse1>):
    %0 = "tensor.collapse_shape"(%arg0) <{reassociation = [[0, 1]]}> : (tensor<10x?xf64, #sparse1>) -> tensor<?xf64, #sparse>
    "func.return"(%0) : (tensor<?xf64, #sparse>) -> ()
  }) : () -> ()
}) : () -> ()

