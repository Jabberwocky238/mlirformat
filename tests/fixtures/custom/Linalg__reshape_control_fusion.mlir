#map = affine_map<(d0, d1) -> (d0, d1)>
#map1 = affine_map<(d0, d1) -> (d1)>
module {
  func.func @control_producer_reshape_fusion(%arg0: tensor<?x?x?xf32>, %arg1: tensor<?xf32>) -> tensor<?x?xf32> {
    %c0 = arith.constant 0 : index
    %c1 = arith.constant 1 : index
    %collapsed = tensor.collapse_shape %arg0 [[0, 1], [2]] : tensor<?x?x?xf32> into tensor<?x?xf32>
    %dim = tensor.dim %collapsed, %c0 : tensor<?x?xf32>
    %dim_0 = tensor.dim %collapsed, %c1 : tensor<?x?xf32>
    %0 = tensor.empty(%dim, %dim_0) : tensor<?x?xf32>
    %1 = linalg.generic {indexing_maps = [#map, #map1, #map], iterator_types = ["parallel", "parallel"]} ins(%collapsed, %arg1 : tensor<?x?xf32>, tensor<?xf32>) outs(%0 : tensor<?x?xf32>) {
    ^bb0(%in: f32, %in_1: f32, %out: f32):
      %2 = arith.addf %in, %in_1 : f32
      linalg.yield %2 : f32
    } -> tensor<?x?xf32>
    return %1 : tensor<?x?xf32>
  }
}

// -----
#map = affine_map<(d0, d1) -> (d0, d1)>
module {
  func.func @control_consumer_reshape_fusion(%arg0: tensor<1x?x?xf32>, %arg1: tensor<1x?x?xf32>) -> tensor<1x?x?xf32> {
    %c1 = arith.constant 1 : index
    %c2 = arith.constant 2 : index
    %cst = arith.constant 0.000000e+00 : f32
    %dim = tensor.dim %arg0, %c1 : tensor<1x?x?xf32>
    %dim_0 = tensor.dim %arg1, %c2 : tensor<1x?x?xf32>
    %0 = tensor.empty(%dim, %dim_0) : tensor<?x?xf32>
    %1 = linalg.generic {indexing_maps = [#map], iterator_types = ["parallel", "parallel"]} outs(%0 : tensor<?x?xf32>) {
    ^bb0(%out: f32):
      linalg.yield %cst : f32
    } -> tensor<?x?xf32>
    %expanded = tensor.expand_shape %1 [[0, 1], [2]] output_shape [1, %dim, %dim_0] : tensor<?x?xf32> into tensor<1x?x?xf32>
    %2 = linalg.batch_matmul ins(%arg0, %arg1 : tensor<1x?x?xf32>, tensor<1x?x?xf32>) outs(%expanded : tensor<1x?x?xf32>) -> tensor<1x?x?xf32>
    return %2 : tensor<1x?x?xf32>
  }
}

