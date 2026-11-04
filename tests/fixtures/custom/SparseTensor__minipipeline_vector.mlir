#map = affine_map<(d0) -> (d0)>
#map1 = affine_map<(d0) -> ()>
#sparse = #sparse_tensor.encoding<{ map = (d0) -> (d0 : compressed) }>
module {
  func.func @sum_reduction(%arg0: tensor<?xf32, #sparse>, %arg1: tensor<f32>) -> tensor<f32> {
    %0 = linalg.generic {doc = "x += SUM_i a(i)", indexing_maps = [#map, #map1], iterator_types = ["reduction"]} ins(%arg0 : tensor<?xf32, #sparse>) outs(%arg1 : tensor<f32>) {
    ^bb0(%in: f32, %out: f32):
      %1 = arith.addf %out, %in : f32
      linalg.yield %1 : f32
    } -> tensor<f32>
    return %0 : tensor<f32>
  }
}

