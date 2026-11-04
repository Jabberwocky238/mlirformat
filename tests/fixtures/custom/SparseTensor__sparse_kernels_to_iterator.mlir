#map = affine_map<(d0, d1, d2, d3) -> (d0, d1, d2, d3)>
#map1 = affine_map<(d0, d1, d2, d3) -> ()>
#map2 = affine_map<(d0) -> (d0)>
#sparse = #sparse_tensor.encoding<{ map = (d0, d1, d2, d3) -> (d0 : compressed(nonunique), d1 : singleton(nonunique, soa), d2 : singleton(nonunique, soa), d3 : singleton(soa)) }>
#sparse1 = #sparse_tensor.encoding<{ map = (d0) -> (d0 : compressed) }>
module {
  func.func @sqsum(%arg0: tensor<?x?x?x?xi32, #sparse>) -> tensor<i32> {
    %cst = arith.constant dense<0> : tensor<i32>
    %0 = linalg.generic {indexing_maps = [#map, #map1], iterator_types = ["reduction", "reduction", "reduction", "reduction"]} ins(%arg0 : tensor<?x?x?x?xi32, #sparse>) outs(%cst : tensor<i32>) {
    ^bb0(%in: i32, %out: i32):
      %1 = arith.muli %in, %in : i32
      %2 = arith.addi %out, %1 : i32
      linalg.yield %2 : i32
    } -> tensor<i32>
    return %0 : tensor<i32>
  }
  func.func @add(%arg0: tensor<10xi32, #sparse1>, %arg1: tensor<10xi32, #sparse1>) -> tensor<10xi32> {
    %cst = arith.constant dense<0> : tensor<10xi32>
    %0 = linalg.generic {indexing_maps = [#map2, #map2, #map2], iterator_types = ["parallel"]} ins(%arg0, %arg1 : tensor<10xi32, #sparse1>, tensor<10xi32, #sparse1>) outs(%cst : tensor<10xi32>) {
    ^bb0(%in: i32, %in_0: i32, %out: i32):
      %1 = arith.addi %in, %in_0 : i32
      linalg.yield %1 : i32
    } -> tensor<10xi32>
    return %0 : tensor<10xi32>
  }
}

