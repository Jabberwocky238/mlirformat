"builtin.module"() ({
  "func.func"() <{function_type = (tensor<2x4xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d1 : compressed, d0 : compressed) }>>, tensor<3x4xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d1 : compressed, d0 : dense) }>>, tensor<4x4xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : dense, d1 : compressed) }>>) -> tensor<9x4xf64>, sym_name = "foo"}> ({
  ^bb0(%arg0: tensor<2x4xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d1 : compressed, d0 : compressed) }>> loc("<stdin>":6:8), %arg1: tensor<3x4xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d1 : compressed, d0 : dense) }>> loc("<stdin>":6:41), %arg2: tensor<4x4xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : dense, d1 : compressed) }>> loc("<stdin>":6:75)):
    %0 = "sparse_tensor.concatenate"(%arg0, %arg1, %arg2) <{dimension = 0 : index}> : (tensor<2x4xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d1 : compressed, d0 : compressed) }>>, tensor<3x4xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d1 : compressed, d0 : dense) }>>, tensor<4x4xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : dense, d1 : compressed) }>>) -> tensor<9x4xf64> loc("<stdin>":7:10)
    "func.return"(%0) : (tensor<9x4xf64>) -> () loc("<stdin>":8:5)
  }) : () -> () loc("<stdin>":5:3)
}) : () -> () loc("<stdin>":4:1)
