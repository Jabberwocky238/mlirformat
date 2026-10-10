#map = affine_map<(d0, d1) -> (d0, d1)>
module {
  func.func @linalg_generic_sum(%arg0: memref<2x2xf32>, %arg1: memref<2x2xf32>, %arg2: memref<2x2xf32>) {
    linalg.generic {indexing_maps = [#map, #map, #map], iterator_types = ["parallel", "parallel"]} ins(%arg0, %arg1 : memref<2x2xf32>, memref<2x2xf32>) outs(%arg2 : memref<2x2xf32>) {
    ^bb0(%in: f32, %in_0: f32, %out: f32):
      %0 = arith.addf %in, %in_0 : f32
      linalg.yield %0 : f32
    }
    return
  }
}

// -----
#map = affine_map<(d0, d1, d2, d3) -> (d0, d1, d2, d3)>
#map1 = affine_map<(d0, d1, d2, d3) -> (d0, d1, d3)>
module {
  func.func @lower_outer_parallel(%arg0: memref<?x?x?x?xf32>, %arg1: memref<?x?x?xf32>) {
    linalg.generic {indexing_maps = [#map, #map1], iterator_types = ["parallel", "parallel", "reduction", "parallel"]} ins(%arg0 : memref<?x?x?x?xf32>) outs(%arg1 : memref<?x?x?xf32>) {
    ^bb0(%in: f32, %out: f32):
      linalg.yield %in : f32
    }
    return
  }
}

// -----
#map = affine_map<(d0, d1, d2, d3, d4, d5) -> (d0, d1, d2, d3, d4, d5)>
#map1 = affine_map<(d0, d1, d2, d3, d4, d5) -> (d0, d1, d4, d3)>
module {
  func.func @lower_mixed_parallel(%arg0: memref<?x?x?x?x?x?xf32>, %arg1: memref<?x?x?x?xf32>) {
    linalg.generic {indexing_maps = [#map, #map1], iterator_types = ["parallel", "parallel", "reduction", "parallel", "parallel", "reduction"]} ins(%arg0 : memref<?x?x?x?x?x?xf32>) outs(%arg1 : memref<?x?x?x?xf32>) {
    ^bb0(%in: f32, %out: f32):
      linalg.yield %in : f32
    }
    return
  }
}

