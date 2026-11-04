module {
  func.func @exp(%arg0: tensor<16x8xf32>, %arg1: tensor<16x8xf32>) -> tensor<16x8xf32> {
    %0 = linalg.exp ins(%arg0 : tensor<16x8xf32>) outs(%arg1 : tensor<16x8xf32>) -> tensor<16x8xf32>
    return %0 : tensor<16x8xf32>
  }
  func.func @add(%arg0: tensor<16x8xf32>, %arg1: tensor<16x8xf32>, %arg2: tensor<16x8xf32>) -> tensor<16x8xf32> {
    %0 = linalg.add ins(%arg0, %arg1 : tensor<16x8xf32>, tensor<16x8xf32>) outs(%arg2 : tensor<16x8xf32>) -> tensor<16x8xf32>
    return %0 : tensor<16x8xf32>
  }
  func.func @sub(%arg0: tensor<16x8xf32>, %arg1: tensor<16x8xf32>, %arg2: tensor<16x8xf32>) -> tensor<16x8xf32> {
    %0 = linalg.sub ins(%arg0, %arg1 : tensor<16x8xf32>, tensor<16x8xf32>) outs(%arg2 : tensor<16x8xf32>) -> tensor<16x8xf32>
    return %0 : tensor<16x8xf32>
  }
  func.func @ternary_select(%arg0: tensor<4x8x16xi1>, %arg1: tensor<4x8x16xf32>, %arg2: tensor<4x8x16xf32>) -> tensor<4x8x16xf32> {
    %0 = tensor.empty() : tensor<4x8x16xf32>
    %1 = linalg.select ins(%arg0, %arg1, %arg2 : tensor<4x8x16xi1>, tensor<4x8x16xf32>, tensor<4x8x16xf32>) outs(%0 : tensor<4x8x16xf32>) -> tensor<4x8x16xf32>
    return %1 : tensor<4x8x16xf32>
  }
}

