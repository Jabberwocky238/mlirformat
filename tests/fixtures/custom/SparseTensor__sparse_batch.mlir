#map = affine_map<(d0, d1, d2) -> (d0, d1, d2)>
#sparse = #sparse_tensor.encoding<{ map = (d0, d1, d2) -> (d0 : batch, d1 : dense, d2 : compressed) }>
module {
  func.func @main(%arg0: tensor<8x4x2xf32, #sparse>) -> tensor<8x4x2xf32> {
    %0 = tensor.empty() : tensor<8x4x2xf32>
    %1 = linalg.generic {indexing_maps = [#map, #map], iterator_types = ["parallel", "parallel", "parallel"]} ins(%arg0 : tensor<8x4x2xf32, #sparse>) outs(%0 : tensor<8x4x2xf32>) {
    ^bb0(%in: f32, %out: f32):
      %2 = arith.negf %in : f32
      linalg.yield %2 : f32
    } -> tensor<8x4x2xf32>
    return %1 : tensor<8x4x2xf32>
  }
}

