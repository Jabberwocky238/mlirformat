#map = affine_map<(d0, d1, d2) -> (d0, d2)>
#map1 = affine_map<(d0, d1, d2) -> (d0, d1, d2)>
#sparse = #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed, d1 : compressed) }>
#sparse1 = #sparse_tensor.encoding<{ map = (d0, d1, d2) -> (d0 : compressed, d1 : compressed, d2 : compressed) }>
module @func_sparse {
  func.func public @main(%arg0: tensor<4x5xi32, #sparse>) -> tensor<4x3x5xi32, #sparse1> {
    %0 = tensor.empty() : tensor<4x3x5xi32, #sparse1>
    %1 = linalg.generic {indexing_maps = [#map, #map1], iterator_types = ["parallel", "parallel", "parallel"]} ins(%arg0 : tensor<4x5xi32, #sparse>) outs(%0 : tensor<4x3x5xi32, #sparse1>) {
    ^bb0(%in: i32, %out: i32):
      linalg.yield %in : i32
    } -> tensor<4x3x5xi32, #sparse1>
    return %1 : tensor<4x3x5xi32, #sparse1>
  }
}

