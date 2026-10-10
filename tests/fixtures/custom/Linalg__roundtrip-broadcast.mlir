module {
  func.func @broadcast_first_dimension(%arg0: tensor<?x?xf32>, %arg1: tensor<?x?x?xf32>) -> tensor<?x?x?xf32> {
    %broadcasted = linalg.broadcast ins(%arg0 : tensor<?x?xf32>) outs(%arg1 : tensor<?x?x?xf32>) dimensions = [0] 
    return %broadcasted : tensor<?x?x?xf32>
  }
  func.func @broadcast_mid_dimension(%arg0: tensor<3x5xf32>, %arg1: tensor<3x4x5xf32>) -> tensor<3x4x5xf32> {
    %broadcasted = linalg.broadcast ins(%arg0 : tensor<3x5xf32>) outs(%arg1 : tensor<3x4x5xf32>) dimensions = [1] 
    return %broadcasted : tensor<3x4x5xf32>
  }
  func.func @broadcast_multiple_dimensions(%arg0: tensor<4x5x7xf32>, %arg1: tensor<3x4x5x6x7x8x9xf32>) -> tensor<3x4x5x6x7x8x9xf32> {
    %broadcasted = linalg.broadcast ins(%arg0 : tensor<4x5x7xf32>) outs(%arg1 : tensor<3x4x5x6x7x8x9xf32>) dimensions = [0, 3, 5, 6] 
    return %broadcasted : tensor<3x4x5x6x7x8x9xf32>
  }
}

