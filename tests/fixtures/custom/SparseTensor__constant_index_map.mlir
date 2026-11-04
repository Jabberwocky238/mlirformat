#map = affine_map<(d0) -> (0, d0)>
#map1 = affine_map<(d0) -> (d0)>
#sparse = #sparse_tensor.encoding<{ map = (d0) -> (d0 : compressed) }>
module {
  func.func @main(%arg0: tensor<1x77xi1>, %arg1: tensor<1x77xi1>) -> tensor<77xi1, #sparse> {
    %0 = tensor.empty() : tensor<77xi1, #sparse>
    %1 = linalg.generic {indexing_maps = [#map, #map, #map1], iterator_types = ["parallel"]} ins(%arg0, %arg1 : tensor<1x77xi1>, tensor<1x77xi1>) outs(%0 : tensor<77xi1, #sparse>) {
    ^bb0(%in: i1, %in_0: i1, %out: i1):
      %2 = arith.addi %in, %in_0 : i1
      linalg.yield %2 : i1
    } -> tensor<77xi1, #sparse>
    return %1 : tensor<77xi1, #sparse>
  }
}

