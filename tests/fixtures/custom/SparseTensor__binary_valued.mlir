#map = affine_map<(d0, d1, d2) -> (d0, d1, d2)>
#map1 = affine_map<(d0, d1, d2) -> ()>
#sparse = #sparse_tensor.encoding<{ map = (d0, d1, d2) -> (d0 : dense, d1 : dense, d2 : compressed), explicitVal = 1.000000e+00 : f32 }>
module {
  func.func @sum_squares(%arg0: tensor<2x3x8xf32, #sparse>) -> tensor<f32> {
    %cst = arith.constant 0.000000e+00 : f32
    %0 = tensor.empty() : tensor<2x3x8xf32>
    %1 = linalg.generic {indexing_maps = [#map, #map, #map], iterator_types = ["parallel", "parallel", "parallel"]} ins(%arg0, %arg0 : tensor<2x3x8xf32, #sparse>, tensor<2x3x8xf32, #sparse>) outs(%0 : tensor<2x3x8xf32>) {
    ^bb0(%in: f32, %in_0: f32, %out: f32):
      %5 = arith.mulf %in, %in_0 : f32
      linalg.yield %5 : f32
    } -> tensor<2x3x8xf32>
    %2 = tensor.empty() : tensor<f32>
    %3 = linalg.fill ins(%cst : f32) outs(%2 : tensor<f32>) -> tensor<f32>
    %4 = linalg.generic {indexing_maps = [#map, #map1], iterator_types = ["reduction", "reduction", "reduction"]} ins(%1 : tensor<2x3x8xf32>) outs(%3 : tensor<f32>) {
    ^bb0(%in: f32, %out: f32):
      %5 = arith.addf %in, %out : f32
      linalg.yield %5 : f32
    } -> tensor<f32>
    return %4 : tensor<f32>
  }
  func.func @sum_products(%arg0: tensor<2x3x8xf32, #sparse>, %arg1: tensor<2x3x8xf32>) -> tensor<f32> {
    %cst = arith.constant 0.000000e+00 : f32
    %0 = tensor.empty() : tensor<2x3x8xf32>
    %1 = linalg.generic {indexing_maps = [#map, #map, #map], iterator_types = ["parallel", "parallel", "parallel"]} ins(%arg0, %arg1 : tensor<2x3x8xf32, #sparse>, tensor<2x3x8xf32>) outs(%0 : tensor<2x3x8xf32>) {
    ^bb0(%in: f32, %in_0: f32, %out: f32):
      %5 = arith.mulf %in, %in_0 : f32
      linalg.yield %5 : f32
    } -> tensor<2x3x8xf32>
    %2 = tensor.empty() : tensor<f32>
    %3 = linalg.fill ins(%cst : f32) outs(%2 : tensor<f32>) -> tensor<f32>
    %4 = linalg.generic {indexing_maps = [#map, #map1], iterator_types = ["reduction", "reduction", "reduction"]} ins(%1 : tensor<2x3x8xf32>) outs(%3 : tensor<f32>) {
    ^bb0(%in: f32, %out: f32):
      %5 = arith.addf %in, %out : f32
      linalg.yield %5 : f32
    } -> tensor<f32>
    return %4 : tensor<f32>
  }
}

