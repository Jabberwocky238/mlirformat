#sparse = #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : dense, d1 floordiv 4 : dense, d1 mod 4 : structured[2, 4]) }>
module {
  func.func @matmul(%arg0: tensor<?x?xf16>, %arg1: tensor<?x?xf16>, %arg2: tensor<?x?xf16>) -> tensor<?x?xf16> {
    %0 = sparse_tensor.convert %arg0 : tensor<?x?xf16> to tensor<?x?xf16, #sparse>
    %1 = linalg.matmul ins(%0, %arg1 : tensor<?x?xf16, #sparse>, tensor<?x?xf16>) outs(%arg2 : tensor<?x?xf16>) -> tensor<?x?xf16>
    return %1 : tensor<?x?xf16>
  }
}

