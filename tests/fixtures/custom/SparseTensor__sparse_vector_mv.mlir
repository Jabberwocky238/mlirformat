#map = affine_map<(d0, d1) -> (d0, d1)>
#map1 = affine_map<(d0, d1) -> (d1)>
#map2 = affine_map<(d0, d1) -> (d0)>
#sparse = #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : dense, d1 : dense) }>
module {
  func.func @kernel_matvec(%arg0: tensor<?x?xf32, #sparse>, %arg1: tensor<?xf32>, %arg2: tensor<?xf32>) -> tensor<?xf32> {
    %0 = linalg.generic {doc = "X(i) += A(i,j) * B(j)", indexing_maps = [#map, #map1, #map2], iterator_types = ["parallel", "reduction"]} ins(%arg0, %arg1 : tensor<?x?xf32, #sparse>, tensor<?xf32>) outs(%arg2 : tensor<?xf32>) {
    ^bb0(%in: f32, %in_0: f32, %out: f32):
      %1 = arith.mulf %in, %in_0 : f32
      %2 = arith.addf %out, %1 : f32
      linalg.yield %2 : f32
    } -> tensor<?xf32>
    return %0 : tensor<?xf32>
  }
}

