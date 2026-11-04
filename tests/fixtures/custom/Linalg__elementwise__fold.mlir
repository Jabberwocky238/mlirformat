module {
  func.func @unary_transpose(%arg0: tensor<16x8x32xf32>, %arg1: tensor<8x16x32xf32>) -> tensor<8x16x32xf32> {
    %0 = tensor.empty() : tensor<8x16x32xf32>
    %transposed = linalg.transpose ins(%arg0 : tensor<16x8x32xf32>) outs(%0 : tensor<8x16x32xf32>) permutation = [1, 0, 2] 
    %1 = linalg.elementwise kind=#linalg.elementwise_kind<exp> ins(%transposed : tensor<8x16x32xf32>) outs(%arg1 : tensor<8x16x32xf32>) -> tensor<8x16x32xf32>
    return %1 : tensor<8x16x32xf32>
  }
}

// -----
module {
  func.func @binary_transposed(%arg0: tensor<?x?xf32>, %arg1: tensor<?x?xf32>, %arg2: tensor<?x?xf32>) -> tensor<?x?xf32> {
    %c0 = arith.constant 0 : index
    %c1 = arith.constant 1 : index
    %dim = tensor.dim %arg0, %c0 : tensor<?x?xf32>
    %dim_0 = tensor.dim %arg0, %c1 : tensor<?x?xf32>
    %0 = tensor.empty(%dim_0, %dim) : tensor<?x?xf32>
    %transposed = linalg.transpose ins(%arg1 : tensor<?x?xf32>) outs(%0 : tensor<?x?xf32>) permutation = [1, 0] 
    %1 = linalg.elementwise kind=#linalg.elementwise_kind<add> ins(%arg0, %transposed : tensor<?x?xf32>, tensor<?x?xf32>) outs(%arg2 : tensor<?x?xf32>) -> tensor<?x?xf32>
    return %1 : tensor<?x?xf32>
  }
}

