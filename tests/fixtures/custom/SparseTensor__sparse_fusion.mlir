#map = affine_map<(d0) -> (d0)>
#sparse = #sparse_tensor.encoding<{ map = (d0) -> (d0 : compressed) }>
module {
  func.func @sparse_fusion(%arg0: tensor<100xf64, #sparse>) -> tensor<100xf64> {
    %cst = arith.constant 1.000000e+00 : f64
    %cst_0 = arith.constant 1.000000e+02 : f64
    %0 = tensor.empty() : tensor<100xf64>
    %1 = linalg.generic {doc = "B(i) = OP A(i)", indexing_maps = [#map, #map], iterator_types = ["parallel"]} ins(%arg0 : tensor<100xf64, #sparse>) outs(%0 : tensor<100xf64>) {
    ^bb0(%in: f64, %out: f64):
      %6 = arith.addf %in, %cst : f64
      linalg.yield %6 : f64
    } -> tensor<100xf64>
    %2 = tensor.empty() : tensor<100xf64>
    %3 = linalg.generic {doc = "B(i) = OP A(i)", indexing_maps = [#map, #map], iterator_types = ["parallel"]} ins(%1 : tensor<100xf64>) outs(%2 : tensor<100xf64>) {
    ^bb0(%in: f64, %out: f64):
      %6 = math.exp %in : f64
      linalg.yield %6 : f64
    } -> tensor<100xf64>
    %4 = tensor.empty() : tensor<100xf64>
    %5 = linalg.generic {doc = "B(i) = OP A(i)", indexing_maps = [#map, #map], iterator_types = ["parallel"]} ins(%3 : tensor<100xf64>) outs(%4 : tensor<100xf64>) {
    ^bb0(%in: f64, %out: f64):
      %6 = arith.maximumf %in, %cst_0 : f64
      linalg.yield %6 : f64
    } -> tensor<100xf64>
    return %5 : tensor<100xf64>
  }
}

