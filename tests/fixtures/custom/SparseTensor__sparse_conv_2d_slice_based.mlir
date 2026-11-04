#map = affine_map<(d0, d1, d2, d3) -> (d0 + d2, d1 + d3)>
#map1 = affine_map<(d0, d1, d2, d3) -> (d2, d3)>
#map2 = affine_map<(d0, d1, d2, d3) -> (d0, d1)>
#sparse = #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed, d1 : compressed) }>
module {
  func.func @conv2d_all_sparse_CSR(%arg0: tensor<8x8xi32, #sparse>, %arg1: tensor<3x3xi32>) -> tensor<6x6xi32, #sparse> {
    %0 = tensor.empty() : tensor<6x6xi32, #sparse>
    %1 = linalg.generic {indexing_maps = [#map, #map1, #map2], iterator_types = ["parallel", "parallel", "reduction", "reduction"]} ins(%arg0, %arg1 : tensor<8x8xi32, #sparse>, tensor<3x3xi32>) outs(%0 : tensor<6x6xi32, #sparse>) {
    ^bb0(%in: i32, %in_0: i32, %out: i32):
      %2 = arith.muli %in, %in_0 : i32
      %3 = arith.addi %out, %2 : i32
      linalg.yield %3 : i32
    } -> tensor<6x6xi32, #sparse>
    return %1 : tensor<6x6xi32, #sparse>
  }
}

