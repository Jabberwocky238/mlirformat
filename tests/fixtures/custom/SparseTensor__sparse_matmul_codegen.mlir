#sparse = #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : dense, d1 : compressed) }>
module {
  func.func @matmul(%arg0: tensor<4x8xf64, #sparse>, %arg1: tensor<8x4xf64, #sparse>) -> tensor<4x4xf64, #sparse> {
    %0 = tensor.empty() : tensor<4x4xf64, #sparse>
    %1 = linalg.matmul ins(%arg0, %arg1 : tensor<4x8xf64, #sparse>, tensor<8x4xf64, #sparse>) outs(%0 : tensor<4x4xf64, #sparse>) -> tensor<4x4xf64, #sparse>
    return %1 : tensor<4x4xf64, #sparse>
  }
}

