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

// -----
module {
  func.func @unary_broadcasted(%arg0: tensor<8x32xf32>, %arg1: tensor<8x16x32xf32>) -> tensor<8x16x32xf32> {
    %0 = tensor.empty() : tensor<8x16x32xf32>
    %broadcasted = linalg.broadcast ins(%arg0 : tensor<8x32xf32>) outs(%0 : tensor<8x16x32xf32>) dimensions = [1] 
    %1 = linalg.elementwise kind=#linalg.elementwise_kind<exp> ins(%broadcasted : tensor<8x16x32xf32>) outs(%arg1 : tensor<8x16x32xf32>) -> tensor<8x16x32xf32>
    return %1 : tensor<8x16x32xf32>
  }
}

// -----
module {
  func.func @binary_broadcasted(%arg0: tensor<?x?xf32>, %arg1: tensor<?xf32>, %arg2: tensor<?x?xf32>) -> tensor<?x?xf32> {
    %c0 = arith.constant 0 : index
    %c1 = arith.constant 1 : index
    %dim = tensor.dim %arg0, %c0 : tensor<?x?xf32>
    %dim_0 = tensor.dim %arg0, %c1 : tensor<?x?xf32>
    %0 = tensor.empty(%dim_0, %dim) : tensor<?x?xf32>
    %broadcasted = linalg.broadcast ins(%arg1 : tensor<?xf32>) outs(%0 : tensor<?x?xf32>) dimensions = [1] 
    %1 = linalg.elementwise kind=#linalg.elementwise_kind<add> ins(%arg0, %broadcasted : tensor<?x?xf32>, tensor<?x?xf32>) outs(%arg2 : tensor<?x?xf32>) -> tensor<?x?xf32>
    return %1 : tensor<?x?xf32>
  }
}

// -----
#map = affine_map<(d0, d1) -> (d1, d0)>
#map1 = affine_map<(d0, d1) -> (d0, d1)>
module {
  func.func @fold_broadcast_after_transpose_fold(%arg0: tensor<16xf32>, %arg1: tensor<16x32xf32>) -> tensor<16x32xf32> {
    %0 = tensor.empty() : tensor<32x16xf32>
    %broadcasted = linalg.broadcast ins(%arg0 : tensor<16xf32>) outs(%0 : tensor<32x16xf32>) dimensions = [0] 
    %1 = linalg.elementwise kind=#linalg.elementwise_kind<exp> indexing_maps = [#map, #map1] ins(%broadcasted : tensor<32x16xf32>) outs(%arg1 : tensor<16x32xf32>) -> tensor<16x32xf32>
    return %1 : tensor<16x32xf32>
  }
}

// -----
#map = affine_map<(d0, d1, d2) -> (d1, d2)>
#map1 = affine_map<(d0, d1, d2) -> (d0, d1, d2)>
module {
  func.func @fold_transpose_after_broadcast_fold(%arg0: tensor<32x16xf32>, %arg1: tensor<8x16x32xf32>) -> tensor<8x16x32xf32> {
    %0 = tensor.empty() : tensor<16x32xf32>
    %transposed = linalg.transpose ins(%arg0 : tensor<32x16xf32>) outs(%0 : tensor<16x32xf32>) permutation = [1, 0] 
    %1 = linalg.elementwise kind=#linalg.elementwise_kind<exp> indexing_maps = [#map, #map1] ins(%transposed : tensor<16x32xf32>) outs(%arg1 : tensor<8x16x32xf32>) -> tensor<8x16x32xf32>
    return %1 : tensor<8x16x32xf32>
  }
}

// -----
#map = affine_map<(d0, d1) -> (d1, d0)>
#map1 = affine_map<(d0, d1) -> (d0, d1)>
module {
  func.func @fold_broadcast_after_transpose_fold_binary(%arg0: tensor<?xf32>, %arg1: tensor<?x?xf32>, %arg2: tensor<?x?xf32>) -> tensor<?x?xf32> {
    %c0 = arith.constant 0 : index
    %c1 = arith.constant 1 : index
    %dim = tensor.dim %arg1, %c0 : tensor<?x?xf32>
    %dim_0 = tensor.dim %arg1, %c1 : tensor<?x?xf32>
    %0 = tensor.empty(%dim_0, %dim) : tensor<?x?xf32>
    %broadcasted = linalg.broadcast ins(%arg0 : tensor<?xf32>) outs(%0 : tensor<?x?xf32>) dimensions = [0] 
    %1 = linalg.elementwise kind=#linalg.elementwise_kind<add> indexing_maps = [#map, #map1, #map1] ins(%broadcasted, %arg1 : tensor<?x?xf32>, tensor<?x?xf32>) outs(%arg2 : tensor<?x?xf32>) -> tensor<?x?xf32>
    return %1 : tensor<?x?xf32>
  }
}

// -----
#map = affine_map<(d0, d1, d2) -> (d1, d2)>
#map1 = affine_map<(d0, d1, d2) -> (d0, d1, d2)>
module {
  func.func @fold_transpose_after_broadcast_fold_binary(%arg0: tensor<?x?xf32>, %arg1: tensor<?x?x?xf32>, %arg2: tensor<?x?x?xf32>) -> tensor<?x?x?xf32> {
    %c0 = arith.constant 0 : index
    %c1 = arith.constant 1 : index
    %c2 = arith.constant 2 : index
    %dim = tensor.dim %arg1, %c0 : tensor<?x?x?xf32>
    %dim_0 = tensor.dim %arg1, %c1 : tensor<?x?x?xf32>
    %dim_1 = tensor.dim %arg1, %c2 : tensor<?x?x?xf32>
    %0 = tensor.empty(%dim_0, %dim_1) : tensor<?x?xf32>
    %transposed = linalg.transpose ins(%arg0 : tensor<?x?xf32>) outs(%0 : tensor<?x?xf32>) permutation = [1, 0] 
    %1 = linalg.elementwise kind=#linalg.elementwise_kind<add> indexing_maps = [#map, #map1, #map1] ins(%transposed, %arg1 : tensor<?x?xf32>, tensor<?x?x?xf32>) outs(%arg2 : tensor<?x?x?xf32>) -> tensor<?x?x?xf32>
    return %1 : tensor<?x?x?xf32>
  }
}

// -----
#map = affine_map<(d0) -> (d0)>
#map1 = affine_map<(d0) -> (d0, d0)>
module {
  func.func @fold_failed_diagonal_map(%arg0: tensor<16xf32>, %arg1: tensor<16xf32>, %arg2: tensor<16xf32>) -> tensor<16xf32> {
    %0 = tensor.empty() : tensor<16x16xf32>
    %broadcasted = linalg.broadcast ins(%arg1 : tensor<16xf32>) outs(%0 : tensor<16x16xf32>) dimensions = [0] 
    %1 = linalg.elementwise kind=#linalg.elementwise_kind<add> indexing_maps = [#map, #map1, #map] ins(%arg0, %broadcasted : tensor<16xf32>, tensor<16x16xf32>) outs(%arg2 : tensor<16xf32>) -> tensor<16xf32>
    return %1 : tensor<16xf32>
  }
}

// -----
#map = affine_map<(d0) -> (d0)>
#map1 = affine_map<(d0) -> (0, d0)>
module {
  func.func @fold_failed_constant_map(%arg0: tensor<16xf32>, %arg1: tensor<16x32xf32>, %arg2: tensor<16xf32>) -> tensor<16xf32> {
    %0 = tensor.empty() : tensor<32x16xf32>
    %transposed = linalg.transpose ins(%arg1 : tensor<16x32xf32>) outs(%0 : tensor<32x16xf32>) permutation = [1, 0] 
    %1 = linalg.elementwise kind=#linalg.elementwise_kind<add> indexing_maps = [#map, #map1, #map] ins(%arg0, %transposed : tensor<16xf32>, tensor<32x16xf32>) outs(%arg2 : tensor<16xf32>) -> tensor<16xf32>
    return %1 : tensor<16xf32>
  }
}

