#map = affine_map<(d0, d1, d2) -> (d2, d0, d1)>
#map1 = affine_map<(d0, d1, d2) -> ()>
#sparse = #sparse_tensor.encoding<{ map = (d0, d1, d2) -> (d2 : dense, d0 : dense, d1 : dense) }>
module {
  func.func @sparse_dynamic_dims(%arg0: tensor<?x?x?xf32, #sparse>, %arg1: tensor<f32>) -> tensor<f32> {
    %0 = linalg.generic {indexing_maps = [#map, #map1], iterator_types = ["reduction", "reduction", "reduction"]} ins(%arg0 : tensor<?x?x?xf32, #sparse>) outs(%arg1 : tensor<f32>) {
    ^bb0(%in: f32, %out: f32):
      %1 = arith.addf %out, %in : f32
      linalg.yield %1 : f32
    } -> tensor<f32>
    return %0 : tensor<f32>
  }
}

