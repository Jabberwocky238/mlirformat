module {
  func.func @dot(%arg0: memref<?xf32, strided<[1], offset: ?>>, %arg1: memref<?xf32, strided<[1], offset: ?>>, %arg2: memref<f32>) {
    linalg.dot ins(%arg0, %arg1 : memref<?xf32, strided<[1], offset: ?>>, memref<?xf32, strided<[1], offset: ?>>) outs(%arg2 : memref<f32>)
    return
  }
}

// -----
#map = affine_map<(d0, d1, d2) -> (d0, d2)>
#map1 = affine_map<(d0, d1, d2) -> (d2, d1)>
#map2 = affine_map<(d0, d1, d2) -> (d0, d1)>
module {
  func.func @matmul_vec_impl(%arg0: memref<?x?xvector<4xf32>>, %arg1: memref<?x?xvector<4xf32>>, %arg2: memref<?x?xvector<4x4xf32>>) {
    linalg.generic {indexing_maps = [#map, #map1, #map2], iterator_types = ["parallel", "parallel", "reduction"], library_call = "external_outerproduct_matmul"} ins(%arg0, %arg1 : memref<?x?xvector<4xf32>>, memref<?x?xvector<4xf32>>) outs(%arg2 : memref<?x?xvector<4x4xf32>>) {
    ^bb0(%in: vector<4xf32>, %in_0: vector<4xf32>, %out: vector<4x4xf32>):
      %0 = vector.outerproduct %in, %in_0, %out {kind = #vector.kind<add>} : vector<4xf32>, vector<4xf32>
      linalg.yield %0 : vector<4x4xf32>
    }
    return
  }
}

// -----
#map = affine_map<(d0, d1) -> (d0, d1)>
#map1 = affine_map<(d0, d1) -> (d0)>
module {
  func.func @func(%arg0: tensor<?x?xf32>, %arg1: tensor<?xf32>) {
    %0 = linalg.generic {indexing_maps = [#map, #map1], iterator_types = ["parallel", "reduction"]} ins(%arg0 : tensor<?x?xf32>) outs(%arg1 : tensor<?xf32>) {
    ^bb0(%in: f32, %out: f32):
      linalg.yield %in : f32
    } -> tensor<?xf32>
    return
  }
}

// -----
module {
  func.func @func(%arg0: tensor<4x8xf32>, %arg1: tensor<4x8xf32>) -> tensor<4x8xf32> {
    %0 = linalg.copy ins(%arg0 : tensor<4x8xf32>) outs(%arg1 : tensor<4x8xf32>) -> tensor<4x8xf32>
    return %0 : tensor<4x8xf32>
  }
}

