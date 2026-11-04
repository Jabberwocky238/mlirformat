#map = affine_map<(d0) -> (d0)>
#sparse = #sparse_tensor.encoding<{ map = (d0) -> (d0 : compressed), posWidth = 64, crdWidth = 64 }>
#sparse1 = #sparse_tensor.encoding<{ map = (d0) -> (d0 : compressed), posWidth = 32, crdWidth = 32 }>
module {
  func.func @mul64(%arg0: tensor<32xf64, #sparse>, %arg1: tensor<32xf64>, %arg2: tensor<32xf64>) -> tensor<32xf64> {
    %0 = linalg.generic {doc = "x(i) = a(i) * b(i)", indexing_maps = [#map, #map, #map], iterator_types = ["parallel"]} ins(%arg0, %arg1 : tensor<32xf64, #sparse>, tensor<32xf64>) outs(%arg2 : tensor<32xf64>) {
    ^bb0(%in: f64, %in_0: f64, %out: f64):
      %1 = arith.mulf %in, %in_0 : f64
      linalg.yield %1 : f64
    } -> tensor<32xf64>
    return %0 : tensor<32xf64>
  }
  func.func @mul32(%arg0: tensor<32xf64, #sparse1>, %arg1: tensor<32xf64>, %arg2: tensor<32xf64>) -> tensor<32xf64> {
    %0 = linalg.generic {doc = "x(i) = a(i) * b(i)", indexing_maps = [#map, #map, #map], iterator_types = ["parallel"]} ins(%arg0, %arg1 : tensor<32xf64, #sparse1>, tensor<32xf64>) outs(%arg2 : tensor<32xf64>) {
    ^bb0(%in: f64, %in_0: f64, %out: f64):
      %1 = arith.mulf %in, %in_0 : f64
      linalg.yield %1 : f64
    } -> tensor<32xf64>
    return %0 : tensor<32xf64>
  }
}

