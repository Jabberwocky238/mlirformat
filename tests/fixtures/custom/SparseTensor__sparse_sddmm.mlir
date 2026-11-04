#map = affine_map<(d0, d1) -> ()>
#map1 = affine_map<(d0, d1) -> (d0, d1)>
#map2 = affine_map<(d0) -> (d0)>
#map3 = affine_map<(d0, d1, d2) -> (d1, d0)>
#map4 = affine_map<(d0, d1, d2) -> (d0, d2)>
#map5 = affine_map<(d0, d1, d2) -> (d1, d2)>
#sparse = #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed, d1 : compressed) }>
module {
  func.func @fold_yield_arg_zero() -> tensor<1024x1024xf64> {
    %cst = arith.constant 0.000000e+00 : f64
    %0 = tensor.empty() : tensor<1024x1024xf64>
    %1 = linalg.generic {indexing_maps = [#map, #map1], iterator_types = ["parallel", "parallel"]} ins(%cst : f64) outs(%0 : tensor<1024x1024xf64>) {
    ^bb0(%in: f64, %out: f64):
      linalg.yield %in : f64
    } -> tensor<1024x1024xf64>
    return %1 : tensor<1024x1024xf64>
  }
  func.func @fold_yield_direct_zero() -> tensor<32xf64> {
    %cst = arith.constant 0.000000e+00 : f64
    %0 = tensor.empty() : tensor<32xf64>
    %1 = linalg.generic {indexing_maps = [#map2], iterator_types = ["parallel"]} outs(%0 : tensor<32xf64>) {
    ^bb0(%out: f64):
      linalg.yield %cst : f64
    } -> tensor<32xf64>
    return %1 : tensor<32xf64>
  }
  func.func @sampled_dd_unfused(%arg0: tensor<8x8xf64, #sparse>, %arg1: tensor<8x8xf64>, %arg2: tensor<8x8xf64>) -> tensor<8x8xf64> {
    %cst = arith.constant dense<0.000000e+00> : tensor<8x8xf64>
    %0 = linalg.generic {indexing_maps = [#map3, #map4, #map5], iterator_types = ["reduction", "parallel", "parallel"]} ins(%arg1, %arg2 : tensor<8x8xf64>, tensor<8x8xf64>) outs(%cst : tensor<8x8xf64>) {
    ^bb0(%in: f64, %in_0: f64, %out: f64):
      %2 = arith.mulf %in, %in_0 : f64
      %3 = arith.addf %out, %2 : f64
      linalg.yield %3 : f64
    } -> tensor<8x8xf64>
    %1 = linalg.generic {indexing_maps = [#map1, #map1, #map1], iterator_types = ["parallel", "parallel"]} ins(%0, %arg0 : tensor<8x8xf64>, tensor<8x8xf64, #sparse>) outs(%cst : tensor<8x8xf64>) {
    ^bb0(%in: f64, %in_0: f64, %out: f64):
      %2 = arith.mulf %in, %in_0 : f64
      linalg.yield %2 : f64
    } -> tensor<8x8xf64>
    return %1 : tensor<8x8xf64>
  }
  func.func @sparse_sampled_dd_unfused(%arg0: tensor<8x8xf64, #sparse>, %arg1: tensor<8x8xf64>, %arg2: tensor<8x8xf64>) -> tensor<8x8xf64, #sparse> {
    %cst = arith.constant dense<0.000000e+00> : tensor<8x8xf64>
    %0 = linalg.generic {indexing_maps = [#map3, #map4, #map5], iterator_types = ["reduction", "parallel", "parallel"]} ins(%arg1, %arg2 : tensor<8x8xf64>, tensor<8x8xf64>) outs(%cst : tensor<8x8xf64>) {
    ^bb0(%in: f64, %in_0: f64, %out: f64):
      %3 = arith.mulf %in, %in_0 : f64
      %4 = arith.addf %out, %3 : f64
      linalg.yield %4 : f64
    } -> tensor<8x8xf64>
    %1 = tensor.empty() : tensor<8x8xf64, #sparse>
    %2 = linalg.generic {indexing_maps = [#map1, #map1, #map1], iterator_types = ["parallel", "parallel"]} ins(%0, %arg0 : tensor<8x8xf64>, tensor<8x8xf64, #sparse>) outs(%1 : tensor<8x8xf64, #sparse>) {
    ^bb0(%in: f64, %in_0: f64, %out: f64):
      %3 = arith.mulf %in, %in_0 : f64
      linalg.yield %3 : f64
    } -> tensor<8x8xf64, #sparse>
    return %2 : tensor<8x8xf64, #sparse>
  }
}

