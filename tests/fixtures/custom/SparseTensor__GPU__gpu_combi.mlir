#sparse = #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : dense, d1 : compressed) }>
module {
  func.func @matmuls(%arg0: tensor<1024x8xf64>, %arg1: tensor<8x1024xf64, #sparse>, %arg2: tensor<1024x1024xf64, #sparse>) -> tensor<1024x1024xf64> {
    %cst = arith.constant dense<0.000000e+00> : tensor<1024x1024xf64>
    %0 = linalg.matmul ins(%arg0, %arg1 : tensor<1024x8xf64>, tensor<8x1024xf64, #sparse>) outs(%cst : tensor<1024x1024xf64>) -> tensor<1024x1024xf64>
    %1 = linalg.matmul ins(%0, %arg2 : tensor<1024x1024xf64>, tensor<1024x1024xf64, #sparse>) outs(%cst : tensor<1024x1024xf64>) -> tensor<1024x1024xf64>
    return %1 : tensor<1024x1024xf64>
  }
}

