#map = affine_map<(d0, d1) -> (d0, d1)>
#map1 = affine_map<(d0, d1) -> (d1)>
#map2 = affine_map<(d0, d1) -> (d0)>
#sparse = #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : dense, d1 : dense) }>
#sparse1 = #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed, d1 : compressed) }>
#sparse2 = #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : dense, d1 : compressed) }>
module {
  func.func @scale_dd(%arg0: f32, %arg1: tensor<?x?xf32, #sparse>, %arg2: tensor<?x?xf32>) -> tensor<?x?xf32> {
    %0 = linalg.generic {doc = "X(i,j) = A(i,j) * SCALE", indexing_maps = [#map, #map], iterator_types = ["parallel", "parallel"]} ins(%arg1 : tensor<?x?xf32, #sparse>) outs(%arg2 : tensor<?x?xf32>) {
    ^bb0(%in: f32, %out: f32):
      %1 = arith.mulf %in, %arg0 : f32
      linalg.yield %1 : f32
    } -> tensor<?x?xf32>
    return %0 : tensor<?x?xf32>
  }
  func.func @scale_ss(%arg0: f32, %arg1: tensor<?x?xf32, #sparse1>, %arg2: tensor<?x?xf32>) -> tensor<?x?xf32> {
    %0 = linalg.generic {doc = "X(i,j) = A(i,j) * SCALE", indexing_maps = [#map, #map], iterator_types = ["parallel", "parallel"]} ins(%arg1 : tensor<?x?xf32, #sparse1>) outs(%arg2 : tensor<?x?xf32>) {
    ^bb0(%in: f32, %out: f32):
      %1 = arith.mulf %in, %arg0 : f32
      linalg.yield %1 : f32
    } -> tensor<?x?xf32>
    return %0 : tensor<?x?xf32>
  }
  func.func @matvec(%arg0: tensor<16x32xf32, #sparse2>, %arg1: tensor<32xf32>, %arg2: tensor<16xf32>) -> tensor<16xf32> {
    %0 = linalg.generic {doc = "x(i) += A(i,j) * b(j)", indexing_maps = [#map, #map1, #map2], iterator_types = ["parallel", "reduction"]} ins(%arg0, %arg1 : tensor<16x32xf32, #sparse2>, tensor<32xf32>) outs(%arg2 : tensor<16xf32>) {
    ^bb0(%in: f32, %in_0: f32, %out: f32):
      %1 = arith.mulf %in, %in_0 : f32
      %2 = arith.addf %1, %out : f32
      linalg.yield %2 : f32
    } -> tensor<16xf32>
    return %0 : tensor<16xf32>
  }
}

