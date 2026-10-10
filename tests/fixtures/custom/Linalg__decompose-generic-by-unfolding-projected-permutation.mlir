#map = affine_map<(d0, d1, d2, d3, d4) -> (d2, d3, d1)>
#map1 = affine_map<(d0, d1, d2, d3, d4) -> (d0, d1, d2, d3, d4)>
module {
  func.func @transpose_and_broadcast(%arg0: tensor<7x8x9xf32>, %arg1: tensor<5x9x7x8x10xf32>, %arg2: tensor<5x9x7x8x10xf32>) -> tensor<5x9x7x8x10xf32> {
    %0 = linalg.generic {indexing_maps = [#map, #map1, #map1], iterator_types = ["parallel", "parallel", "parallel", "parallel", "parallel"]} ins(%arg0, %arg1 : tensor<7x8x9xf32>, tensor<5x9x7x8x10xf32>) outs(%arg2 : tensor<5x9x7x8x10xf32>) {
    ^bb0(%in: f32, %in_0: f32, %out: f32):
      %1 = arith.divf %in, %in_0 : f32
      linalg.yield %1 : f32
    } -> tensor<5x9x7x8x10xf32>
    return %0 : tensor<5x9x7x8x10xf32>
  }
}

// -----
#map = affine_map<(d0, d1, d2) -> (d2, d0, d1)>
#map1 = affine_map<(d0, d1, d2) -> (d0, d1, d2)>
module {
  func.func @transpose_only(%arg0: tensor<32x2x16xf32>, %arg1: tensor<2x16x32xf32>, %arg2: tensor<2x16x32xf32>) -> tensor<2x16x32xf32> {
    %0 = linalg.generic {indexing_maps = [#map, #map1, #map1], iterator_types = ["parallel", "parallel", "parallel"]} ins(%arg0, %arg1 : tensor<32x2x16xf32>, tensor<2x16x32xf32>) outs(%arg2 : tensor<2x16x32xf32>) {
    ^bb0(%in: f32, %in_0: f32, %out: f32):
      %1 = arith.divf %in, %in_0 : f32
      linalg.yield %1 : f32
    } -> tensor<2x16x32xf32>
    return %0 : tensor<2x16x32xf32>
  }
}

// -----
#map = affine_map<(d0, d1, d2) -> (d0, d1, d2)>
#map1 = affine_map<(d0, d1, d2) -> (d0, d2)>
module {
  func.func @broadcast_only(%arg0: tensor<2x16x32xf32>, %arg1: tensor<2x32xf32>, %arg2: tensor<2x16x32xf32>) -> tensor<2x16x32xf32> {
    %0 = linalg.generic {indexing_maps = [#map, #map1, #map], iterator_types = ["parallel", "parallel", "parallel"]} ins(%arg0, %arg1 : tensor<2x16x32xf32>, tensor<2x32xf32>) outs(%arg2 : tensor<2x16x32xf32>) {
    ^bb0(%in: f32, %in_0: f32, %out: f32):
      %1 = arith.divf %in, %in_0 : f32
      linalg.yield %1 : f32
    } -> tensor<2x16x32xf32>
    return %0 : tensor<2x16x32xf32>
  }
}

