module {
  func.func @block_matmul(%arg0: tensor<64x128xf32>, %arg1: tensor<128x64xf32>, %arg2: tensor<64x64xf32>) -> tensor<64x64xf32> {
    %0 = linalg.matmul ins(%arg0, %arg1 : tensor<64x128xf32>, tensor<128x64xf32>) outs(%arg2 : tensor<64x64xf32>) -> tensor<64x64xf32>
    return %0 : tensor<64x64xf32>
  }
}

