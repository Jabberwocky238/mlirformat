module {
  func.func @empty_tensor_static_dim() -> (index, index) {
    %c0 = arith.constant 0 : index
    %c2 = arith.constant 2 : index
    %c6 = arith.constant 6 : index
    %0 = tensor.empty(%c6) : tensor<4x5x?xf32>
    %dim = tensor.dim %0, %c2 : tensor<4x5x?xf32>
    %dim_0 = tensor.dim %0, %c0 : tensor<4x5x?xf32>
    return %dim, %dim_0 : index, index
  }
}

// -----
module {
  func.func @empty_tensor_dynamic_dim(%arg0: index) -> index {
    %c2 = arith.constant 2 : index
    %0 = tensor.empty(%arg0) : tensor<4x5x?xf32>
    %dim = tensor.dim %0, %c2 : tensor<4x5x?xf32>
    return %dim : index
  }
}

// -----
module {
  func.func @empty_tensor_dynamic_dim2(%arg0: index, %arg1: index) -> (index, index) {
    %c0 = arith.constant 0 : index
    %c1 = arith.constant 1 : index
    %0 = tensor.empty(%arg0, %arg1) : tensor<?x?xf32>
    %dim = tensor.dim %0, %c0 : tensor<?x?xf32>
    %dim_0 = tensor.dim %0, %c1 : tensor<?x?xf32>
    return %dim, %dim_0 : index, index
  }
}

// -----
#map = affine_map<(d0, d1, d2) -> (d0, d2)>
#map1 = affine_map<(d0, d1, d2) -> (d2, d1)>
#map2 = affine_map<(d0, d1, d2) -> (d0 + d1, d1 - d0)>
module {
  func.func @remove_dim_result_uses(%arg0: tensor<?x?xf32>, %arg1: tensor<?x?xf32>, %arg2: tensor<?x?xf32>) -> (index, index) {
    %c0 = arith.constant 0 : index
    %c1 = arith.constant 1 : index
    %0 = linalg.generic {indexing_maps = [#map, #map1, #map2], iterator_types = ["parallel", "parallel", "reduction"]} ins(%arg0, %arg1 : tensor<?x?xf32>, tensor<?x?xf32>) outs(%arg2 : tensor<?x?xf32>) {
    ^bb0(%in: f32, %in_1: f32, %out: f32):
      %1 = arith.mulf %in, %in_1 : f32
      %2 = arith.addf %1, %out : f32
      linalg.yield %2 : f32
    } -> tensor<?x?xf32>
    %dim = tensor.dim %0, %c0 : tensor<?x?xf32>
    %dim_0 = tensor.dim %0, %c1 : tensor<?x?xf32>
    return %dim, %dim_0 : index, index
  }
}

// -----
#map = affine_map<(d0, d1) -> (d0)>
#map1 = affine_map<(d0, d1) -> (d0, d1)>
module {
  func.func @remove_dim_result_uses_outs(%arg0: tensor<?xf32>, %arg1: index) -> index {
    %c0 = arith.constant 0 : index
    %c1 = arith.constant 1 : index
    %dim = tensor.dim %arg0, %c0 : tensor<?xf32>
    %0 = tensor.empty(%dim, %arg1) : tensor<?x?xf32>
    %1 = linalg.generic {indexing_maps = [#map, #map1], iterator_types = ["parallel", "parallel"]} ins(%arg0 : tensor<?xf32>) outs(%0 : tensor<?x?xf32>) {
    ^bb0(%in: f32, %out: f32):
      linalg.yield %in : f32
    } -> tensor<?x?xf32>
    %dim_0 = tensor.dim %1, %c1 : tensor<?x?xf32>
    return %dim_0 : index
  }
}

// -----
#map = affine_map<(d0, d1, d2) -> (d1, d0)>
#map1 = affine_map<(d0, d1, d2) -> (d0, d2)>
module {
  func.func @remove_dim_result_uses_sequence(%arg0: tensor<?x?xf32>, %arg1: tensor<?x?xf32>, %arg2: tensor<?x?xf32>) -> (index, index, index, index) {
    %c0 = arith.constant 0 : index
    %c1 = arith.constant 1 : index
    %0 = linalg.matmul ins(%arg0, %arg1 : tensor<?x?xf32>, tensor<?x?xf32>) outs(%arg2 : tensor<?x?xf32>) -> tensor<?x?xf32>
    %dim = tensor.dim %0, %c0 : tensor<?x?xf32>
    %dim_0 = tensor.dim %0, %c1 : tensor<?x?xf32>
    %1 = linalg.generic {indexing_maps = [#map, #map1, #map1], iterator_types = ["parallel", "reduction", "parallel"]} ins(%arg0, %arg1 : tensor<?x?xf32>, tensor<?x?xf32>) outs(%0 : tensor<?x?xf32>) {
    ^bb0(%in: f32, %in_3: f32, %out: f32):
      %2 = arith.mulf %in, %in_3 : f32
      %3 = arith.addf %2, %out : f32
      linalg.yield %3 : f32
    } -> tensor<?x?xf32>
    %dim_1 = tensor.dim %1, %c0 : tensor<?x?xf32>
    %dim_2 = tensor.dim %1, %c1 : tensor<?x?xf32>
    return %dim, %dim_0, %dim_1, %dim_2 : index, index, index, index
  }
}

// -----
#map = affine_map<(d0, d1) -> (d0)>
#map1 = affine_map<(d0, d1) -> (d0, d1)>
module {
  func.func @keep_result_dim_uses_sequence2(%arg0: tensor<?xf32>, %arg1: index) -> (index, index) {
    %c0 = arith.constant 0 : index
    %c1 = arith.constant 1 : index
    %dim = tensor.dim %arg0, %c0 : tensor<?xf32>
    %0 = tensor.empty(%dim, %arg1) : tensor<?x?xf32>
    %1 = linalg.generic {indexing_maps = [#map, #map1], iterator_types = ["parallel", "parallel"]} ins(%arg0 : tensor<?xf32>) outs(%0 : tensor<?x?xf32>) {
    ^bb0(%in: f32, %out: f32):
      linalg.yield %in : f32
    } -> tensor<?x?xf32>
    %dim_0 = tensor.dim %1, %c0 : tensor<?x?xf32>
    %dim_1 = tensor.dim %1, %c1 : tensor<?x?xf32>
    return %dim_0, %dim_1 : index, index
  }
}

// -----
#map = affine_map<(d0) -> (d0)>
module {
  func.func @empty_tensor_dim_of_linalg_result(%arg0: tensor<?xf32>, %arg1: tensor<?xf32>) -> (index, index) {
    %0:2 = linalg.generic {indexing_maps = [#map, #map, #map], iterator_types = ["parallel"]} ins(%arg0 : tensor<?xf32>) outs(%arg0, %arg1 : tensor<?xf32>, tensor<?xf32>) {
    ^bb0(%in: f32, %out: f32, %out_1: f32):
      linalg.yield %in, %in : f32, f32
    } -> (tensor<?xf32>, tensor<?xf32>)
    %c0 = arith.constant 0 : index
    %dim = tensor.dim %0#0, %c0 : tensor<?xf32>
    %dim_0 = tensor.dim %0#1, %c0 : tensor<?xf32>
    return %dim, %dim_0 : index, index
  }
}

// -----
module {
  func.func @dim_reshape_expansion(%arg0: tensor<6x5x?xf32>, %arg1: index) -> (index, index, index) {
    %c1 = arith.constant 1 : index
    %c3 = arith.constant 3 : index
    %c4 = arith.constant 4 : index
    %expanded = tensor.expand_shape %arg0 [[0, 1], [2], [3, 4, 5]] output_shape [2, 3, 5, 4, %arg1, 7] : tensor<6x5x?xf32> into tensor<2x3x5x4x?x7xf32>
    %dim = tensor.dim %expanded, %c1 : tensor<2x3x5x4x?x7xf32>
    %dim_0 = tensor.dim %expanded, %c3 : tensor<2x3x5x4x?x7xf32>
    %dim_1 = tensor.dim %expanded, %c4 : tensor<2x3x5x4x?x7xf32>
    return %dim, %dim_0, %dim_1 : index, index, index
  }
}

// -----
module {
  func.func @dim_reshape_collapse(%arg0: tensor<2x3x5x4x?x7xf32>) -> (index, index) {
    %c1 = arith.constant 1 : index
    %c2 = arith.constant 2 : index
    %collapsed = tensor.collapse_shape %arg0 [[0, 1], [2], [3, 4, 5]] : tensor<2x3x5x4x?x7xf32> into tensor<6x5x?xf32>
    %dim = tensor.dim %collapsed, %c1 : tensor<6x5x?xf32>
    %dim_0 = tensor.dim %collapsed, %c2 : tensor<6x5x?xf32>
    return %dim, %dim_0 : index, index
  }
}

// -----
module {
  func.func @dim_of_pad_op(%arg0: tensor<2x?x?xf32>, %arg1: index, %arg2: index, %arg3: f32) -> (index, index, index) {
    %c0 = arith.constant 0 : index
    %c1 = arith.constant 1 : index
    %c2 = arith.constant 2 : index
    %c3 = arith.constant 3 : index
    %c4 = arith.constant 4 : index
    %c5 = arith.constant 5 : index
    %padded = tensor.pad %arg0 low[%c3, %arg1, %c4] high[7, %c5, %arg2] {
    ^bb0(%arg4: index, %arg5: index, %arg6: index):
      tensor.yield %arg3 : f32
    } : tensor<2x?x?xf32> to tensor<?x?x?xf32>
    %dim = tensor.dim %padded, %c0 : tensor<?x?x?xf32>
    %dim_0 = tensor.dim %padded, %c1 : tensor<?x?x?xf32>
    %dim_1 = tensor.dim %padded, %c2 : tensor<?x?x?xf32>
    return %dim, %dim_0, %dim_1 : index, index, index
  }
}

// -----
module {
  func.func @dim_of_softmax_op(%arg0: tensor<?x16x?xf32>, %arg1: tensor<2x?x?xf32>) -> (index, index, index) {
    %c0 = arith.constant 0 : index
    %c1 = arith.constant 1 : index
    %c2 = arith.constant 2 : index
    %0 = linalg.softmax dimension(2) ins(%arg0 : tensor<?x16x?xf32>) outs(%arg1 : tensor<2x?x?xf32>) -> tensor<2x?x?xf32>
    %dim = tensor.dim %0, %c0 : tensor<2x?x?xf32>
    %dim_0 = tensor.dim %0, %c1 : tensor<2x?x?xf32>
    %dim_1 = tensor.dim %0, %c2 : tensor<2x?x?xf32>
    return %dim, %dim_0, %dim_1 : index, index, index
  }
}

