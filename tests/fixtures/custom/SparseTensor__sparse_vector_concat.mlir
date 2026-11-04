#sparse = #sparse_tensor.encoding<{ map = (d0, d1) -> (d1 : compressed, d0 : compressed) }>
#sparse1 = #sparse_tensor.encoding<{ map = (d0, d1) -> (d1 : compressed, d0 : dense) }>
#sparse2 = #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : dense, d1 : compressed) }>
module {
  func.func @foo(%arg0: tensor<2x4xf64, #sparse>, %arg1: tensor<3x4xf64, #sparse1>, %arg2: tensor<4x4xf64, #sparse2>) -> tensor<9x4xf64> {
    %0 = sparse_tensor.concatenate %arg0, %arg1, %arg2 {dimension = 0 : index} : tensor<2x4xf64, #sparse>, tensor<3x4xf64, #sparse1>, tensor<4x4xf64, #sparse2> to tensor<9x4xf64>
    return %0 : tensor<9x4xf64>
  }
}

