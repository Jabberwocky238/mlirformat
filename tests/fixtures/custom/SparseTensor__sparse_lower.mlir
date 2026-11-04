#map = affine_map<(d0, d1) -> (d0, d1)>
#map1 = affine_map<(d0, d1) -> (d1)>
#map2 = affine_map<(d0, d1) -> (d0)>
#sparse = #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : dense, d1 : compressed) }>
module {
  func.func @matvec(%arg0: tensor<32x64xf64, #sparse>, %arg1: tensor<64xf64>, %arg2: tensor<32xf64>) -> tensor<32xf64> {
    %0 = linalg.generic {doc = "x(i) += A(i,j) * b(j)", indexing_maps = [#map, #map1, #map2], iterator_types = ["parallel", "reduction"]} ins(%arg0, %arg1 : tensor<32x64xf64, #sparse>, tensor<64xf64>) outs(%arg2 : tensor<32xf64>) {
    ^bb0(%in: f64, %in_0: f64, %out: f64):
      %1 = arith.mulf %in, %in_0 : f64
      %2 = arith.addf %out, %1 : f64
      linalg.yield %2 : f64
    } -> tensor<32xf64>
    return %0 : tensor<32xf64>
  }
}

