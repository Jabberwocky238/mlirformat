#map = affine_map<(d0) -> (d0)>
#map1 = affine_map<(d0) -> ()>
module {
  func.func @inline_zerod(%arg0: tensor<4xf32>, %arg1: tensor<f32>) -> tensor<4xf32> {
    %0 = tensor.empty() : tensor<4xf32>
    %1 = linalg.generic {indexing_maps = [#map, #map1, #map], iterator_types = ["parallel"]} ins(%arg0, %arg1 : tensor<4xf32>, tensor<f32>) outs(%0 : tensor<4xf32>) {
    ^bb0(%in: f32, %in_0: f32, %out: f32):
      %2 = arith.divf %in, %in_0 : f32
      linalg.yield %2 : f32
    } -> tensor<4xf32>
    return %1 : tensor<4xf32>
  }
}

// -----
#map = affine_map<(d0) -> (d0)>
#map1 = affine_map<(d0) -> (0)>
module {
  func.func @inline_oned(%arg0: tensor<4xf32>, %arg1: tensor<1xf32>) -> tensor<4xf32> {
    %0 = tensor.empty() : tensor<4xf32>
    %1 = linalg.generic {indexing_maps = [#map, #map1, #map], iterator_types = ["parallel"]} ins(%arg0, %arg1 : tensor<4xf32>, tensor<1xf32>) outs(%0 : tensor<4xf32>) {
    ^bb0(%in: f32, %in_0: f32, %out: f32):
      %2 = arith.divf %in, %in_0 : f32
      linalg.yield %2 : f32
    } -> tensor<4xf32>
    return %1 : tensor<4xf32>
  }
}

// -----
#map = affine_map<(d0) -> (d0)>
#map1 = affine_map<(d0) -> ()>
module {
  func.func @inline_scalar(%arg0: tensor<4xf32>, %arg1: f32) -> tensor<4xf32> {
    %0 = tensor.empty() : tensor<4xf32>
    %1 = linalg.generic {indexing_maps = [#map, #map1, #map], iterator_types = ["parallel"]} ins(%arg0, %arg1 : tensor<4xf32>, f32) outs(%0 : tensor<4xf32>) {
    ^bb0(%in: f32, %in_0: f32, %out: f32):
      %2 = arith.divf %in, %in_0 : f32
      linalg.yield %2 : f32
    } -> tensor<4xf32>
    return %1 : tensor<4xf32>
  }
}

