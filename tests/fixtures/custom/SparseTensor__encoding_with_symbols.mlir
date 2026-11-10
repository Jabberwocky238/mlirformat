#sparse = #sparse_tensor.encoding<{ map = [s0](d0, d1) -> (d0 * (s0 * 3) : dense, d0 : dense, d1 : compressed) }>
module {
  func.func @tensor_add(%arg0: tensor<8x8xf32, #sparse>) -> tensor<8x8xf32> {
    %0 = tensor.empty() : tensor<8x8xf32>
    %1 = linalg.add ins(%arg0, %arg0 : tensor<8x8xf32, #sparse>, tensor<8x8xf32, #sparse>) outs(%0 : tensor<8x8xf32>) -> tensor<8x8xf32>
    return %1 : tensor<8x8xf32>
  }
}

