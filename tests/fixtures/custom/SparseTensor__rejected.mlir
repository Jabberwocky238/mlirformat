#map = affine_map<(d0) -> (d0)>
#map1 = affine_map<(d0) -> ()>
#sparse = #sparse_tensor.encoding<{ map = (d0) -> (d0 : compressed) }>
module {
  func.func @sparse_reduction_subi(%arg0: tensor<i32>, %arg1: tensor<?xi32, #sparse>) -> tensor<i32> {
    %0 = linalg.generic {indexing_maps = [#map, #map1], iterator_types = ["reduction"]} ins(%arg1 : tensor<?xi32, #sparse>) outs(%arg0 : tensor<i32>) {
    ^bb0(%in: i32, %out: i32):
      %1 = arith.subi %in, %out : i32
      linalg.yield %1 : i32
    } -> tensor<i32>
    return %0 : tensor<i32>
  }
}

