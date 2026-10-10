module {
  func.func @linalg_fill(%arg0: tensor<?xf32>, %arg1: f32) -> index {
    %0 = linalg.fill ins(%arg1 : f32) outs(%arg0 : tensor<?xf32>) -> tensor<?xf32>
    %1 = "test.reify_bound"(%0) <{dim = 0 : i64, type = "EQ"}> : (tensor<?xf32>) -> index
    return %1 : index
  }
}

// -----
#map = affine_map<(d0, d1, d2) -> (d1, d0)>
#map1 = affine_map<(d0, d1, d2) -> (d0, d2, d0 + d1)>
module {
  func.func @linalg_index(%arg0: memref<?x?xf32>, %arg1: memref<?x5x?xf32>) {
    linalg.generic {indexing_maps = [#map, #map1], iterator_types = ["parallel", "parallel", "parallel"]} ins(%arg0 : memref<?x?xf32>) outs(%arg1 : memref<?x5x?xf32>) {
    ^bb0(%in: f32, %out: f32):
      %0 = linalg.index 0 : index
      %1 = "test.reify_bound"(%0) <{type = "UB"}> : (index) -> index
      "test.some_use"(%1) : (index) -> ()
      %2 = "test.reify_bound"(%0) <{type = "LB"}> : (index) -> index
      "test.some_use"(%2) : (index) -> ()
      %3 = linalg.index 1 : index
      %4 = "test.reify_bound"(%3) <{type = "UB"}> : (index) -> index
      "test.some_use"(%4) : (index) -> ()
      %5 = linalg.index 2 : index
      %6 = "test.reify_bound"(%5) <{type = "UB"}> : (index) -> index
      "test.some_use"(%6) : (index) -> ()
      linalg.yield %out : f32
    }
    return
  }
}

