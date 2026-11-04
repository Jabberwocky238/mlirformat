#map = affine_map<(d0, d1, d2) -> (d1, d0)>
#map1 = affine_map<(d0, d1, d2) -> (d0, d2)>
#map2 = affine_map<(d0, d1, d2) -> (d1, d2)>
#map3 = affine_map<(d0, d1) -> (d0, d1)>
#sparse = #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed, d1 : compressed) }>
module {
  func.func @sparse_sampled_dd_unfused(%arg0: tensor<8x8xf64, #sparse>, %arg1: tensor<8x8xf64>, %arg2: tensor<8x8xf64>) -> tensor<8x8xf64, #sparse> {
    %cst = arith.constant dense<0.000000e+00> : tensor<8x8xf64>
    %0 = linalg.generic {indexing_maps = [#map, #map1, #map2], iterator_types = ["reduction", "parallel", "parallel"]} ins(%arg1, %arg2 : tensor<8x8xf64>, tensor<8x8xf64>) outs(%cst : tensor<8x8xf64>) {
    ^bb0(%in: f64, %in_0: f64, %out: f64):
      %3 = arith.mulf %in, %in_0 : f64
      %4 = arith.addf %out, %3 : f64
      linalg.yield %4 : f64
    } -> tensor<8x8xf64>
    %1 = tensor.empty() : tensor<8x8xf64, #sparse>
    %2 = linalg.generic {indexing_maps = [#map3, #map3, #map3], iterator_types = ["parallel", "parallel"]} ins(%0, %arg0 : tensor<8x8xf64>, tensor<8x8xf64, #sparse>) outs(%1 : tensor<8x8xf64, #sparse>) {
    ^bb0(%in: f64, %in_0: f64, %out: f64):
      %3 = arith.mulf %in, %in_0 : f64
      linalg.yield %3 : f64
    } -> tensor<8x8xf64, #sparse>
    return %2 : tensor<8x8xf64, #sparse>
  }
}

