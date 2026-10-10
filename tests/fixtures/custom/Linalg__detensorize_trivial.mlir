#map = affine_map<() -> ()>
module {
  func.func @main(%arg0: tensor<i32>) -> tensor<i1> {
    %c10_i32 = arith.constant 10 : i32
    %from_elements = tensor.from_elements %c10_i32 : tensor<i32>
    %0 = tensor.empty() : tensor<i1>
    %1 = linalg.generic {indexing_maps = [#map, #map, #map], iterator_types = []} ins(%arg0, %from_elements : tensor<i32>, tensor<i32>) outs(%0 : tensor<i1>) {
    ^bb0(%in: i32, %in_0: i32, %out: i1):
      %2 = arith.cmpi slt, %in, %in_0 : i32
      linalg.yield %2 : i1
    } -> tensor<i1>
    return %1 : tensor<i1>
  }
}

