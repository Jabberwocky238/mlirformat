module {
  func.func @unary_exp(%arg0: tensor<8x16x32xf32>, %arg1: tensor<8x16x32xf32>) -> tensor<8x16x32xf32> {
    %0 = linalg.elementwise kind=#linalg.elementwise_kind<exp> ins(%arg0 : tensor<8x16x32xf32>) outs(%arg1 : tensor<8x16x32xf32>) -> tensor<8x16x32xf32>
    return %0 : tensor<8x16x32xf32>
  }
}

// -----
#map = affine_map<(d0, d1, d2) -> (d2, d1)>
#map1 = affine_map<(d0, d1, d2) -> (d0, d1, d2)>
module {
  func.func @unary_transpose_broadcast_tanh(%arg0: tensor<32x16xf32>, %arg1: tensor<8x16x32xf32>) -> tensor<8x16x32xf32> {
    %0 = linalg.elementwise kind=#linalg.elementwise_kind<tanh> indexing_maps = [#map, #map1] ins(%arg0 : tensor<32x16xf32>) outs(%arg1 : tensor<8x16x32xf32>) -> tensor<8x16x32xf32>
    return %0 : tensor<8x16x32xf32>
  }
}

// -----
module {
  func.func @binary_div_on_memrefs(%arg0: memref<16x8xf32>, %arg1: memref<16x8xf32>, %arg2: memref<16x8xf32>) {
    linalg.elementwise kind=#linalg.elementwise_kind<div> ins(%arg0, %arg1 : memref<16x8xf32>, memref<16x8xf32>) outs(%arg2 : memref<16x8xf32>)
    return
  }
}

// -----
module {
  func.func @binary_mul_on_tensors(%arg0: tensor<16x8xf32>, %arg1: tensor<16x8xf32>, %arg2: tensor<16x8xf32>) -> tensor<16x8xf32> {
    %0 = linalg.elementwise kind=#linalg.elementwise_kind<mul> ins(%arg0, %arg1 : tensor<16x8xf32>, tensor<16x8xf32>) outs(%arg2 : tensor<16x8xf32>) -> tensor<16x8xf32>
    return %0 : tensor<16x8xf32>
  }
}

// -----
#map = affine_map<(d0, d1) -> (d1, d0)>
#map1 = affine_map<(d0, d1) -> (d0, d1)>
module {
  func.func @binary_transpose_a(%arg0: tensor<8x16xf32>, %arg1: tensor<16x8xf32>, %arg2: tensor<16x8xf32>) -> tensor<16x8xf32> {
    %0 = linalg.elementwise kind=#linalg.elementwise_kind<sub> indexing_maps = [#map, #map1, #map1] ins(%arg0, %arg1 : tensor<8x16xf32>, tensor<16x8xf32>) outs(%arg2 : tensor<16x8xf32>) -> tensor<16x8xf32>
    return %0 : tensor<16x8xf32>
  }
}

// -----
#map = affine_map<(d0, d1) -> (d1, d0)>
#map1 = affine_map<(d0, d1) -> (d0)>
#map2 = affine_map<(d0, d1) -> (d0, d1)>
module {
  func.func @binary_transpose_a_broadcast_b(%arg0: tensor<8x16xf32>, %arg1: tensor<16xf32>, %arg2: tensor<16x8xf32>) -> tensor<16x8xf32> {
    %0 = linalg.elementwise kind=#linalg.elementwise_kind<add> indexing_maps = [#map, #map1, #map2] ins(%arg0, %arg1 : tensor<8x16xf32>, tensor<16xf32>) outs(%arg2 : tensor<16x8xf32>) -> tensor<16x8xf32>
    return %0 : tensor<16x8xf32>
  }
}

// -----
#map = affine_map<(d0, d1, d2) -> (d2, d1)>
#map1 = affine_map<(d0, d1, d2) -> (d0, d1, d2)>
module {
  func.func @ternary(%arg0: tensor<32x16xi1>, %arg1: tensor<8x16x32xf32>, %arg2: tensor<8x16x32xf32>, %arg3: tensor<8x16x32xf32>) -> tensor<8x16x32xf32> {
    %0 = linalg.elementwise kind=#linalg.elementwise_kind<select> indexing_maps = [#map, #map1, #map1, #map1] ins(%arg0, %arg1, %arg2 : tensor<32x16xi1>, tensor<8x16x32xf32>, tensor<8x16x32xf32>) outs(%arg3 : tensor<8x16x32xf32>) -> tensor<8x16x32xf32>
    return %0 : tensor<8x16x32xf32>
  }
}

