#map = affine_map<(d0, d1, d2) -> (d0, d1)>
#map1 = affine_map<(d0, d1, d2) -> (d2, d1)>
#sparse = #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : dense, d1 : compressed) }>
module {
  func.func @b_ununsed(%arg0: tensor<2x4xf64>, %arg1: tensor<8x4xf64, #sparse>, %arg2: tensor<2x4xf64>) -> tensor<2x4xf64> {
    %0 = linalg.generic {doc = "C(i,j) = SUM_k A(i,j)", indexing_maps = [#map, #map1, #map], iterator_types = ["parallel", "parallel", "reduction"]} ins(%arg0, %arg1 : tensor<2x4xf64>, tensor<8x4xf64, #sparse>) outs(%arg2 : tensor<2x4xf64>) {
    ^bb0(%in: f64, %in_0: f64, %out: f64):
      %1 = arith.addf %out, %in : f64
      linalg.yield %1 : f64
    } -> tensor<2x4xf64>
    return %0 : tensor<2x4xf64>
  }
}

