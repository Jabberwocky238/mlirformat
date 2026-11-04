#sparse = #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : dense, d1 : compressed) }>
module {
  func.func @matmulCSR(%arg0: tensor<8x8xf32, #sparse>, %arg1: tensor<8x8xf32, #sparse>) -> tensor<8x8xf32, #sparse> {
    %0 = tensor.empty() : tensor<8x8xf32, #sparse>
    %1 = linalg.matmul ins(%arg0, %arg1 : tensor<8x8xf32, #sparse>, tensor<8x8xf32, #sparse>) outs(%0 : tensor<8x8xf32, #sparse>) -> tensor<8x8xf32, #sparse>
    return %1 : tensor<8x8xf32, #sparse>
  }
}

