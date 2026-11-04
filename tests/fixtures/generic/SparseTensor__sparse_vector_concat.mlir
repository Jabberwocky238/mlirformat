#sparse = #sparse_tensor.encoding<{ map = (d0, d1) -> (d1 : compressed, d0 : compressed) }>
#sparse1 = #sparse_tensor.encoding<{ map = (d0, d1) -> (d1 : compressed, d0 : dense) }>
#sparse2 = #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : dense, d1 : compressed) }>
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<2x4xf64, #sparse>, tensor<3x4xf64, #sparse1>, tensor<4x4xf64, #sparse2>) -> tensor<9x4xf64>, sym_name = "foo"}> ({
  ^bb0(%arg0: tensor<2x4xf64, #sparse>, %arg1: tensor<3x4xf64, #sparse1>, %arg2: tensor<4x4xf64, #sparse2>):
    %0 = "sparse_tensor.concatenate"(%arg0, %arg1, %arg2) <{dimension = 0 : index}> : (tensor<2x4xf64, #sparse>, tensor<3x4xf64, #sparse1>, tensor<4x4xf64, #sparse2>) -> tensor<9x4xf64>
    "func.return"(%0) : (tensor<9x4xf64>) -> ()
  }) : () -> ()
}) : () -> ()

