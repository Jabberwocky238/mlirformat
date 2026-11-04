#map = affine_map<(d0, d1) -> (d1, d0)>
#map1 = affine_map<(d0, d1) -> (d0, d1)>
#sparse = #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed, d1 : compressed) }>
module {
  func.func @sparse_transpose_auto(%arg0: tensor<3x4xf64, #sparse>) -> tensor<4x3xf64, #sparse> {
    %0 = tensor.empty() : tensor<4x3xf64, #sparse>
    %1 = linalg.generic {doc = "X(i,j) = A(j,i)", indexing_maps = [#map, #map1], iterator_types = ["parallel", "parallel"]} ins(%arg0 : tensor<3x4xf64, #sparse>) outs(%0 : tensor<4x3xf64, #sparse>) {
    ^bb0(%in: f64, %out: f64):
      linalg.yield %in : f64
    } -> tensor<4x3xf64, #sparse>
    return %1 : tensor<4x3xf64, #sparse>
  }
}

