#map = affine_map<(d0, d1, d2) -> (d1, d0)>
#map1 = affine_map<(d0, d1, d2) -> (d0, d1, d2)>
module {
  func.func @transpose_and_broadcast(%arg0: tensor<7x8xf32>, %arg1: tensor<8x7x9xf32>) -> tensor<8x7x9xf32> {
    %0 = linalg.generic {indexing_maps = [#map, #map1], iterator_types = ["parallel", "parallel", "parallel"]} ins(%arg0 : tensor<7x8xf32>) outs(%arg1 : tensor<8x7x9xf32>) {
    ^bb0(%in: f32, %out: f32):
      linalg.yield %in : f32
    } -> tensor<8x7x9xf32>
    return %0 : tensor<8x7x9xf32>
  }
}

// -----
#map = affine_map<(d0) -> (d0)>
module {
  func.func @neither_permutation_nor_broadcast(%arg0: tensor<8xi32>) -> tensor<8xi32> {
    %0 = linalg.generic {indexing_maps = [#map], iterator_types = ["parallel"]} outs(%arg0 : tensor<8xi32>) {
    ^bb0(%out: i32):
      linalg.yield %out : i32
    } -> tensor<8xi32>
    return %0 : tensor<8xi32>
  }
}

// -----
#map = affine_map<(d0) -> (d0)>
module {
  func.func @not_copy(%arg0: tensor<8xi32>, %arg1: tensor<8xi32>) -> tensor<8xi32> {
    %c0_i32 = arith.constant 0 : i32
    %0 = linalg.generic {indexing_maps = [#map, #map], iterator_types = ["parallel"]} ins(%arg0 : tensor<8xi32>) outs(%arg1 : tensor<8xi32>) {
    ^bb0(%in: i32, %out: i32):
      linalg.yield %c0_i32 : i32
    } -> tensor<8xi32>
    return %0 : tensor<8xi32>
  }
}

