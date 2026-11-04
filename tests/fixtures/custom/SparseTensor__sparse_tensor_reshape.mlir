#sparse = #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed, d1 : compressed) }>
module {
  func.func @sparse_reshape(%arg0: tensor<4x25xf64, #sparse>) -> tensor<10x10xf64, #sparse> {
    %cst = arith.constant dense<10> : tensor<2xi32>
    %reshape = tensor.reshape %arg0(%cst) : (tensor<4x25xf64, #sparse>, tensor<2xi32>) -> tensor<10x10xf64, #sparse>
    return %reshape : tensor<10x10xf64, #sparse>
  }
}

