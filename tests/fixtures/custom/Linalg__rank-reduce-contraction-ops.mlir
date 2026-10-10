module {
  func.func @singleton_batch_matmul_tensor(%arg0: tensor<1x128x512xf32>, %arg1: tensor<1x512x256xf32>, %arg2: tensor<1x128x256xf32>) -> tensor<1x128x256xf32> {
    %0 = linalg.batch_matmul ins(%arg0, %arg1 : tensor<1x128x512xf32>, tensor<1x512x256xf32>) outs(%arg2 : tensor<1x128x256xf32>) -> tensor<1x128x256xf32>
    return %0 : tensor<1x128x256xf32>
  }
}

// -----
module {
  func.func @singleton_batch_matmul_memref(%arg0: memref<1x?x?xf32>, %arg1: memref<1x?x?xf32>, %arg2: memref<1x?x?xf32>) {
    linalg.batch_matmul ins(%arg0, %arg1 : memref<1x?x?xf32>, memref<1x?x?xf32>) outs(%arg2 : memref<1x?x?xf32>)
    return
  }
}

// -----
#map = affine_map<(d0, d1, d2, d3) -> (d0, d1, d3)>
#map1 = affine_map<(d0, d1, d2, d3) -> (d0, d2, d3)>
#map2 = affine_map<(d0, d1, d2, d3) -> (d0, d1, d2)>
module {
  func.func @negative_singleton_batch_matmul_to_matmul_memref(%arg0: memref<1x?x?xf32>, %arg1: memref<1x?x?xf32>, %arg2: memref<1x?x?xf32>) {
    linalg.batch_matmul indexing_maps = [#map, #map1, #map2] ins(%arg0, %arg1 : memref<1x?x?xf32>, memref<1x?x?xf32>) outs(%arg2 : memref<1x?x?xf32>)
    return
  }
}

// -----
module {
  func.func @singleton_batch_matvec(%arg0: tensor<1x128x512xf32>, %arg1: tensor<1x512xf32>, %arg2: tensor<1x128xf32>) -> tensor<1x128xf32> {
    %0 = linalg.batch_matvec ins(%arg0, %arg1 : tensor<1x128x512xf32>, tensor<1x512xf32>) outs(%arg2 : tensor<1x128xf32>) -> tensor<1x128xf32>
    return %0 : tensor<1x128xf32>
  }
}

// -----
module {
  func.func @singleton_batch_vecmat(%arg0: tensor<1x?xf32>, %arg1: tensor<1x?x?xf32>, %arg2: tensor<1x?xf32>) -> tensor<1x?xf32> {
    %0 = linalg.batch_vecmat ins(%arg0, %arg1 : tensor<1x?xf32>, tensor<1x?x?xf32>) outs(%arg2 : tensor<1x?xf32>) -> tensor<1x?xf32>
    return %0 : tensor<1x?xf32>
  }
}

// -----
module {
  func.func @matmul_to_matvec_tensor(%arg0: tensor<?x?xf32>, %arg1: tensor<?x1xf32>, %arg2: tensor<?x1xf32>) -> tensor<?x1xf32> {
    %0 = linalg.matmul ins(%arg0, %arg1 : tensor<?x?xf32>, tensor<?x1xf32>) outs(%arg2 : tensor<?x1xf32>) -> tensor<?x1xf32>
    return %0 : tensor<?x1xf32>
  }
}

// -----
module {
  func.func @matmul_to_matvec(%arg0: memref<?x?xf32>, %arg1: memref<?x1xf32>, %arg2: memref<?x1xf32>) {
    linalg.matmul ins(%arg0, %arg1 : memref<?x?xf32>, memref<?x1xf32>) outs(%arg2 : memref<?x1xf32>)
    return
  }
}

// -----
#map = affine_map<(d0, d1, d2) -> (d2)>
#map1 = affine_map<(d0, d1, d2) -> (d2, d1)>
#map2 = affine_map<(d0, d1, d2) -> (d0, d1)>
module {
  func.func @negative_matmul_to_matvec(%arg0: memref<?xf32>, %arg1: memref<?x1xf32>, %arg2: memref<?x1xf32>) {
    linalg.matmul indexing_maps = [#map, #map1, #map2] ins(%arg0, %arg1 : memref<?xf32>, memref<?x1xf32>) outs(%arg2 : memref<?x1xf32>)
    return
  }
}

// -----
module {
  func.func @matmul_to_vecmat_tensor(%arg0: tensor<1x?xf32>, %arg1: tensor<?x?xf32>, %arg2: tensor<1x?xf32>) -> tensor<1x?xf32> {
    %0 = linalg.matmul ins(%arg0, %arg1 : tensor<1x?xf32>, tensor<?x?xf32>) outs(%arg2 : tensor<1x?xf32>) -> tensor<1x?xf32>
    return %0 : tensor<1x?xf32>
  }
}

// -----
module {
  func.func @batch_matmul_to_vecmat(%arg0: memref<1x1x?xf32>, %arg1: memref<1x?x?xf32>, %arg2: memref<1x1x?xf32>) {
    linalg.batch_matmul ins(%arg0, %arg1 : memref<1x1x?xf32>, memref<1x?x?xf32>) outs(%arg2 : memref<1x1x?xf32>)
    return
  }
}

// -----
module {
  func.func @matvec_to_dot(%arg0: memref<1x?xf32>, %arg1: memref<?xf32>, %arg2: memref<1xf32>) {
    linalg.matvec ins(%arg0, %arg1 : memref<1x?xf32>, memref<?xf32>) outs(%arg2 : memref<1xf32>)
    return
  }
}

// -----
module {
  func.func @vecmat_to_dot(%arg0: memref<?xf32>, %arg1: memref<?x1xf32>, %arg2: memref<1xf32>) {
    linalg.vecmat ins(%arg0, %arg1 : memref<?xf32>, memref<?x1xf32>) outs(%arg2 : memref<1xf32>)
    return
  }
}

// -----
module {
  func.func @matvec_to_dot_tensor(%arg0: tensor<1x?xf32>, %arg1: tensor<?xf32>, %arg2: tensor<1xf32>) -> tensor<1xf32> {
    %0 = linalg.matvec ins(%arg0, %arg1 : tensor<1x?xf32>, tensor<?xf32>) outs(%arg2 : tensor<1xf32>) -> tensor<1xf32>
    return %0 : tensor<1xf32>
  }
}

// -----
module {
  func.func @nonsingleton_batch_matmul(%arg0: tensor<2x?x?xf32>, %arg1: tensor<2x?x?xf32>, %arg2: tensor<2x?x?xf32>) -> tensor<2x?x?xf32> {
    %0 = linalg.batch_matmul ins(%arg0, %arg1 : tensor<2x?x?xf32>, tensor<2x?x?xf32>) outs(%arg2 : tensor<2x?x?xf32>) -> tensor<2x?x?xf32>
    return %0 : tensor<2x?x?xf32>
  }
}

// -----
module {
  func.func @nonsingleton_batch_matmul_dynamic(%arg0: tensor<?x?x?xf32>, %arg1: tensor<?x?x?xf32>, %arg2: tensor<?x?x?xf32>) -> tensor<?x?x?xf32> {
    %0 = linalg.batch_matmul ins(%arg0, %arg1 : tensor<?x?x?xf32>, tensor<?x?x?xf32>) outs(%arg2 : tensor<?x?x?xf32>) -> tensor<?x?x?xf32>
    return %0 : tensor<?x?x?xf32>
  }
}

