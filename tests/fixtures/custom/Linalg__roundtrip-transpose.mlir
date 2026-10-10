module {
  func.func @transpose2D(%arg0: tensor<16x64xf32>, %arg1: tensor<64x16xf32>) -> tensor<64x16xf32> {
    %transposed = linalg.transpose ins(%arg0 : tensor<16x64xf32>) outs(%arg1 : tensor<64x16xf32>) permutation = [1, 0] 
    return %transposed : tensor<64x16xf32>
  }
  func.func @transpose3D(%arg0: tensor<7x8x9xf32>, %arg1: tensor<9x7x8xf32>) -> tensor<9x7x8xf32> {
    %transposed = linalg.transpose ins(%arg0 : tensor<7x8x9xf32>) outs(%arg1 : tensor<9x7x8xf32>) permutation = [2, 0, 1] 
    return %transposed : tensor<9x7x8xf32>
  }
}

