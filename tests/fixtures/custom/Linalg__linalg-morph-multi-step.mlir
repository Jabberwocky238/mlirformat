module {
  func.func @exp(%arg0: tensor<16x8xf32>, %arg1: tensor<16x8xf32>) -> tensor<16x8xf32> {
    %0 = linalg.exp ins(%arg0 : tensor<16x8xf32>) outs(%arg1 : tensor<16x8xf32>) -> tensor<16x8xf32>
    return %0 : tensor<16x8xf32>
  }
}

