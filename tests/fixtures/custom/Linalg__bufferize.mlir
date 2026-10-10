#map = affine_map<(d0) -> (d0)>
module {
  func.func @basic(%arg0: tensor<4xf32>) -> tensor<4xf32> {
    %0 = linalg.generic {indexing_maps = [#map, #map], iterator_types = ["parallel"]} ins(%arg0 : tensor<4xf32>) outs(%arg0 : tensor<4xf32>) {
    ^bb0(%in: f32, %out: f32):
      %1 = math.exp %in : f32
      linalg.yield %1 : f32
    } -> tensor<4xf32>
    return %0 : tensor<4xf32>
  }
}

// -----
#map = affine_map<(d0) -> (d0)>
module {
  func.func @empty_tensor(%arg0: tensor<?xf32>, %arg1: index) -> tensor<?xf32> {
    %0 = tensor.empty(%arg1) : tensor<?xf32>
    %1 = linalg.generic {indexing_maps = [#map, #map], iterator_types = ["parallel"]} ins(%arg0 : tensor<?xf32>) outs(%0 : tensor<?xf32>) {
    ^bb0(%in: f32, %out: f32):
      %2 = math.exp %in : f32
      linalg.yield %2 : f32
    } -> tensor<?xf32>
    return %1 : tensor<?xf32>
  }
}

// -----
#map = affine_map<(d0) -> (d0)>
module {
  func.func @multiple_results(%arg0: tensor<4xf32>) -> (tensor<4xf32>, tensor<4xf32>) {
    %0:2 = linalg.generic {indexing_maps = [#map, #map, #map], iterator_types = ["parallel"]} ins(%arg0 : tensor<4xf32>) outs(%arg0, %arg0 : tensor<4xf32>, tensor<4xf32>) {
    ^bb0(%in: f32, %out: f32, %out_0: f32):
      %1 = math.exp %in : f32
      linalg.yield %1, %1 : f32, f32
    } -> (tensor<4xf32>, tensor<4xf32>)
    return %0#0, %0#1 : tensor<4xf32>, tensor<4xf32>
  }
}

// -----
#map = affine_map<(d0, d1) -> (d0, d1)>
module {
  func.func @dynamic_results(%arg0: tensor<?x?xf32>) -> (tensor<?x?xf32>, tensor<?x?xf32>) {
    %0:2 = linalg.generic {indexing_maps = [#map, #map, #map], iterator_types = ["parallel", "parallel"]} ins(%arg0 : tensor<?x?xf32>) outs(%arg0, %arg0 : tensor<?x?xf32>, tensor<?x?xf32>) {
    ^bb0(%in: f32, %out: f32, %out_0: f32):
      %1 = math.exp %in : f32
      linalg.yield %1, %1 : f32, f32
    } -> (tensor<?x?xf32>, tensor<?x?xf32>)
    return %0#0, %0#1 : tensor<?x?xf32>, tensor<?x?xf32>
  }
}

// -----
#map = affine_map<(d0, d1, d2) -> (d1, d0, d2)>
#map1 = affine_map<(d0, d1, d2) -> (d0, d1)>
module {
  func.func @generic_with_init_tensor(%arg0: tensor<2x3x4xvector<3x4xi4>>, %arg1: tensor<3x2xf32>) -> tensor<3x2xf32> {
    %0 = linalg.generic {indexing_maps = [#map, #map1], iterator_types = ["parallel", "parallel", "reduction"]} ins(%arg0 : tensor<2x3x4xvector<3x4xi4>>) outs(%arg1 : tensor<3x2xf32>) {
    ^bb0(%in: vector<3x4xi4>, %out: f32):
      linalg.yield %out : f32
    } -> tensor<3x2xf32>
    return %0 : tensor<3x2xf32>
  }
}

// -----
module {
  func.func @bufferize_fill(%arg0: tensor<?xf32>) -> tensor<?xf32> {
    %cst = arith.constant 0.000000e+00 : f32
    %0 = linalg.fill ins(%cst : f32) outs(%arg0 : tensor<?xf32>) -> tensor<?xf32>
    return %0 : tensor<?xf32>
  }
}

// -----
module {
  func.func @bufferize_dot(%arg0: tensor<4xf32>, %arg1: tensor<f32>) -> tensor<f32> {
    %0 = linalg.dot ins(%arg0, %arg0 : tensor<4xf32>, tensor<4xf32>) outs(%arg1 : tensor<f32>) -> tensor<f32>
    return %0 : tensor<f32>
  }
}

// -----
module {
  func.func @bufferize_softmax(%arg0: tensor<2x16x32xf32>, %arg1: tensor<2x16x32xf32>) -> tensor<2x16x32xf32> {
    %0 = linalg.softmax dimension(2) ins(%arg0 : tensor<2x16x32xf32>) outs(%arg1 : tensor<2x16x32xf32>) -> tensor<2x16x32xf32>
    return %0 : tensor<2x16x32xf32>
  }
}

