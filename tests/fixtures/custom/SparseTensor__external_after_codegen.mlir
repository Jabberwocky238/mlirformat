#sparse = #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : dense, d1 : compressed) }>
module {
  func.func @storage_specifier_passthrough(%arg0: tensor<32x32xf32, #sparse>, %arg1: tensor<32x32xf32, #sparse>) -> tensor<32x32xf32> {
    %cst = arith.constant 0.000000e+00 : f32
    %0 = tensor.empty() : tensor<32x32xf32>
    %1 = linalg.fill ins(%cst : f32) outs(%0 : tensor<32x32xf32>) -> tensor<32x32xf32>
    %2 = linalg.add ins(%arg0, %arg1 : tensor<32x32xf32, #sparse>, tensor<32x32xf32, #sparse>) outs(%1 : tensor<32x32xf32>) -> tensor<32x32xf32>
    return %2 : tensor<32x32xf32>
  }
}

