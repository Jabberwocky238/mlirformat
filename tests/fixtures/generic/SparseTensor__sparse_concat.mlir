#sparse = #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed, d1 : compressed) }>
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<2x4xf64, #sparse>, tensor<3x4xf64, #sparse>, tensor<4x4xf64, #sparse>) -> tensor<9x4xf64, #sparse>, sym_name = "concat_sparse_sparse"}> ({
  ^bb0(%arg6: tensor<2x4xf64, #sparse>, %arg7: tensor<3x4xf64, #sparse>, %arg8: tensor<4x4xf64, #sparse>):
    %2 = "sparse_tensor.concatenate"(%arg6, %arg7, %arg8) <{dimension = 0 : index}> : (tensor<2x4xf64, #sparse>, tensor<3x4xf64, #sparse>, tensor<4x4xf64, #sparse>) -> tensor<9x4xf64, #sparse>
    "func.return"(%2) : (tensor<9x4xf64, #sparse>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<2x4xf64, #sparse>, tensor<3x4xf64, #sparse>, tensor<4x4xf64, #sparse>) -> tensor<?x?xf64, #sparse>, sym_name = "concat_sparse_sparse_dynamic"}> ({
  ^bb0(%arg3: tensor<2x4xf64, #sparse>, %arg4: tensor<3x4xf64, #sparse>, %arg5: tensor<4x4xf64, #sparse>):
    %1 = "sparse_tensor.concatenate"(%arg3, %arg4, %arg5) <{dimension = 0 : index}> : (tensor<2x4xf64, #sparse>, tensor<3x4xf64, #sparse>, tensor<4x4xf64, #sparse>) -> tensor<?x?xf64, #sparse>
    "func.return"(%1) : (tensor<?x?xf64, #sparse>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<2x4xf64, #sparse>, tensor<3x4xf64, #sparse>, tensor<4x4xf64, #sparse>) -> tensor<?x?xf64>, sym_name = "concat_sparse_sparse_dense"}> ({
  ^bb0(%arg0: tensor<2x4xf64, #sparse>, %arg1: tensor<3x4xf64, #sparse>, %arg2: tensor<4x4xf64, #sparse>):
    %0 = "sparse_tensor.concatenate"(%arg0, %arg1, %arg2) <{dimension = 0 : index}> : (tensor<2x4xf64, #sparse>, tensor<3x4xf64, #sparse>, tensor<4x4xf64, #sparse>) -> tensor<?x?xf64>
    "func.return"(%0) : (tensor<?x?xf64>) -> ()
  }) : () -> ()
}) : () -> ()

