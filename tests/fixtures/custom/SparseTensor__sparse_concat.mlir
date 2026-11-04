#sparse = #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed, d1 : compressed) }>
module {
  func.func @concat_sparse_sparse(%arg0: tensor<2x4xf64, #sparse>, %arg1: tensor<3x4xf64, #sparse>, %arg2: tensor<4x4xf64, #sparse>) -> tensor<9x4xf64, #sparse> {
    %0 = sparse_tensor.concatenate %arg0, %arg1, %arg2 {dimension = 0 : index} : tensor<2x4xf64, #sparse>, tensor<3x4xf64, #sparse>, tensor<4x4xf64, #sparse> to tensor<9x4xf64, #sparse>
    return %0 : tensor<9x4xf64, #sparse>
  }
  func.func @concat_sparse_sparse_dynamic(%arg0: tensor<2x4xf64, #sparse>, %arg1: tensor<3x4xf64, #sparse>, %arg2: tensor<4x4xf64, #sparse>) -> tensor<?x?xf64, #sparse> {
    %0 = sparse_tensor.concatenate %arg0, %arg1, %arg2 {dimension = 0 : index} : tensor<2x4xf64, #sparse>, tensor<3x4xf64, #sparse>, tensor<4x4xf64, #sparse> to tensor<?x?xf64, #sparse>
    return %0 : tensor<?x?xf64, #sparse>
  }
  func.func @concat_sparse_sparse_dense(%arg0: tensor<2x4xf64, #sparse>, %arg1: tensor<3x4xf64, #sparse>, %arg2: tensor<4x4xf64, #sparse>) -> tensor<?x?xf64> {
    %0 = sparse_tensor.concatenate %arg0, %arg1, %arg2 {dimension = 0 : index} : tensor<2x4xf64, #sparse>, tensor<3x4xf64, #sparse>, tensor<4x4xf64, #sparse> to tensor<?x?xf64>
    return %0 : tensor<?x?xf64>
  }
}

