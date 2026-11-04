#map = affine_map<(d0, d1) -> (d0, d1)>
#map1 = affine_map<(d0, d1) -> ()>
#sparse = #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : dense, d1 : compressed) }>
module {
  func.func @sparse_matrix_sum(%arg0: tensor<f64>, %arg1: tensor<64x32xf64, #sparse>, %arg2: tensor<64x32xf64, #sparse>) -> tensor<f64> {
    %0 = linalg.generic {indexing_maps = [#map, #map, #map1], iterator_types = ["reduction", "reduction"]} ins(%arg1, %arg2 : tensor<64x32xf64, #sparse>, tensor<64x32xf64, #sparse>) outs(%arg0 : tensor<f64>) {
    ^bb0(%in: f64, %in_0: f64, %out: f64):
      %1 = arith.addf %in, %in_0 : f64
      %2 = arith.addf %out, %1 : f64
      linalg.yield %2 : f64
    } -> tensor<f64>
    return %0 : tensor<f64>
  }
}

