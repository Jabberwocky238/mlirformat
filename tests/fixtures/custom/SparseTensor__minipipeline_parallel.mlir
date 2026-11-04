#map = affine_map<(d0, d1) -> (d0, d1)>
#sparse = #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed, d1 : compressed) }>
module {
  func.func @scale_ss(%arg0: f32, %arg1: tensor<?x?xf32, #sparse>, %arg2: tensor<?x?xf32>) -> tensor<?x?xf32> {
    %0 = linalg.generic {doc = "X(i,j) = A(i,j) * SCALE", indexing_maps = [#map, #map], iterator_types = ["parallel", "parallel"]} ins(%arg1 : tensor<?x?xf32, #sparse>) outs(%arg2 : tensor<?x?xf32>) {
    ^bb0(%in: f32, %out: f32):
      %1 = arith.mulf %in, %arg0 : f32
      linalg.yield %1 : f32
    } -> tensor<?x?xf32>
    return %0 : tensor<?x?xf32>
  }
}

