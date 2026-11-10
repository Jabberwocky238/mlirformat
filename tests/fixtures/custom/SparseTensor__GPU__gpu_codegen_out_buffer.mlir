#map = affine_map<(d0, d1) -> (d0, d1)>
#sparse = #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : dense, d1 : compressed) }>
module {
  func.func @tensor_add(%arg0: tensor<32x32xf32, #sparse>, %arg1: tensor<32x32xf32, #sparse>) -> tensor<32x32xf32> {
    %0 = tensor.empty() : tensor<32x32xf32>
    %1 = linalg.generic {indexing_maps = [#map, #map, #map], iterator_types = ["parallel", "parallel"]} ins(%arg0, %arg1 : tensor<32x32xf32, #sparse>, tensor<32x32xf32, #sparse>) outs(%0 : tensor<32x32xf32>) {
    ^bb0(%in: f32, %in_0: f32, %out: f32):
      %2 = arith.addf %in, %in_0 : f32
      linalg.yield %2 : f32
    } -> tensor<32x32xf32>
    return %1 : tensor<32x32xf32>
  }
}

