#map = affine_map<(d0, d1, d2, d3, d4, d5, d6, d7, d8) -> (d3, d4, d5)>
#map1 = affine_map<(d0, d1, d2, d3, d4, d5, d6, d7, d8) -> (d6, d7, d8)>
#map2 = affine_map<(d0, d1, d2, d3, d4, d5, d6, d7, d8) -> (d0, d1, d2)>
#sparse = #sparse_tensor.encoding<{ map = (d0, d1, d2) -> (d0 : dense, d1 : compressed, d2 : singleton) }>
#sparse1 = #sparse_tensor.encoding<{ map = (d0, d1, d2) -> (d0 : compressed, d1 : singleton, d2 : dense) }>
module {
  func.func @sparse_loop_ordering(%arg0: tensor<?x?x?xf32, #sparse>, %arg1: tensor<?x?x?xf32, #sparse1>, %arg2: tensor<?x?x?xf32, #sparse>) -> tensor<?x?x?xf32, #sparse> {
    %0 = linalg.generic {indexing_maps = [#map, #map1, #map2], iterator_types = ["parallel", "parallel", "parallel", "parallel", "parallel", "parallel", "parallel", "parallel", "parallel"]} ins(%arg0, %arg1 : tensor<?x?x?xf32, #sparse>, tensor<?x?x?xf32, #sparse1>) outs(%arg2 : tensor<?x?x?xf32, #sparse>) {
    ^bb0(%in: f32, %in_0: f32, %out: f32):
      %1 = arith.mulf %in, %in_0 : f32
      %2 = arith.addf %out, %1 : f32
      linalg.yield %2 : f32
    } -> tensor<?x?x?xf32, #sparse>
    return %0 : tensor<?x?x?xf32, #sparse>
  }
  func.func @sparse_loop_ordering_lowered(%arg0: tensor<?x?x?xf32, #sparse>, %arg1: tensor<?x?x?xf32, #sparse1>, %arg2: tensor<?x?x?xf32>) -> tensor<?x?x?xf32> {
    %0 = linalg.generic {indexing_maps = [#map, #map1, #map2], iterator_types = ["parallel", "parallel", "parallel", "parallel", "parallel", "parallel", "parallel", "parallel", "parallel"]} ins(%arg0, %arg1 : tensor<?x?x?xf32, #sparse>, tensor<?x?x?xf32, #sparse1>) outs(%arg2 : tensor<?x?x?xf32>) {
    ^bb0(%in: f32, %in_0: f32, %out: f32):
      %1 = arith.mulf %in, %in_0 : f32
      %2 = arith.addf %out, %1 : f32
      linalg.yield %2 : f32
    } -> tensor<?x?x?xf32>
    return %0 : tensor<?x?x?xf32>
  }
}

