#sparse = #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : dense, d1 : compressed) }>
module {
  func.func @matmul(%arg0: tensor<?x?xf64, #sparse>, %arg1: tensor<?x?xf64>, %arg2: tensor<?x?xf64>) -> tensor<?x?xf64> {
    %0 = linalg.matmul ins(%arg0, %arg1 : tensor<?x?xf64, #sparse>, tensor<?x?xf64>) outs(%arg2 : tensor<?x?xf64>) -> tensor<?x?xf64>
    return %0 : tensor<?x?xf64>
  }
}

