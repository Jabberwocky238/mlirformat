#map = affine_map<(d0) -> (d0)>
module {
  func.func @static_dims(%arg0: tensor<5xf32>, %arg1: tensor<5xf32>) -> tensor<5xf32> {
    %0 = tensor.empty() : tensor<5xf32>
    %1 = linalg.generic {indexing_maps = [#map, #map, #map], iterator_types = ["parallel"]} ins(%arg0, %arg1 : tensor<5xf32>, tensor<5xf32>) outs(%0 : tensor<5xf32>) {
    ^bb0(%in: f32, %in_0: f32, %out: f32):
      %2 = arith.addf %in, %in_0 : f32
      linalg.yield %2 : f32
    } -> tensor<5xf32>
    return %1 : tensor<5xf32>
  }
}

// -----
#map = affine_map<() -> ()>
module {
  func.func @scalars(%arg0: tensor<f32>, %arg1: tensor<f32>) -> tensor<f32> {
    %0 = tensor.empty() : tensor<f32>
    %1 = linalg.generic {indexing_maps = [#map, #map, #map], iterator_types = []} ins(%arg0, %arg1 : tensor<f32>, tensor<f32>) outs(%0 : tensor<f32>) {
    ^bb0(%in: f32, %in_0: f32, %out: f32):
      %2 = arith.addf %in, %in_0 : f32
      linalg.yield %2 : f32
    } -> tensor<f32>
    return %1 : tensor<f32>
  }
}

