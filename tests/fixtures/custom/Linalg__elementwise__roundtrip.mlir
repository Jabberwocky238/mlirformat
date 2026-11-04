module {
  func.func @unary_identity_exp(%arg0: tensor<8x16x32xf32>, %arg1: tensor<8x16x32xf32>) -> tensor<8x16x32xf32> {
    %0 = linalg.elementwise kind=#linalg.elementwise_kind<exp> ins(%arg0 : tensor<8x16x32xf32>) outs(%arg1 : tensor<8x16x32xf32>) -> tensor<8x16x32xf32>
    return %0 : tensor<8x16x32xf32>
  }
}

// -----
#map = affine_map<(d0, d1, d2) -> (d2, d1)>
#map1 = affine_map<(d0, d1, d2) -> (d0, d1, d2)>
module {
  func.func @unary_projection_tanh(%arg0: tensor<?x16xf32>, %arg1: tensor<8x16x?xf32>) -> tensor<8x16x?xf32> {
    %0 = linalg.elementwise kind=#linalg.elementwise_kind<tanh> indexing_maps = [#map, #map1] ins(%arg0 : tensor<?x16xf32>) outs(%arg1 : tensor<8x16x?xf32>) -> tensor<8x16x?xf32>
    return %0 : tensor<8x16x?xf32>
  }
}

// -----
module {
  func.func @binary_identity_div(%arg0: tensor<16x8xf32>, %arg1: tensor<16x8xf32>, %arg2: tensor<16x8xf32>) -> tensor<16x8xf32> {
    %0 = linalg.elementwise kind=#linalg.elementwise_kind<div> ins(%arg0, %arg1 : tensor<16x8xf32>, tensor<16x8xf32>) outs(%arg2 : tensor<16x8xf32>) -> tensor<16x8xf32>
    return %0 : tensor<16x8xf32>
  }
}

// -----
module {
  func.func @binary_identity_mul_5Di(%arg0: tensor<1x2x3x4x5xi32>, %arg1: tensor<1x2x3x4x5xi32>, %arg2: tensor<1x2x3x4x5xi32>) -> tensor<1x2x3x4x5xi32> {
    %0 = linalg.elementwise kind=#linalg.elementwise_kind<mul> ins(%arg0, %arg1 : tensor<1x2x3x4x5xi32>, tensor<1x2x3x4x5xi32>) outs(%arg2 : tensor<1x2x3x4x5xi32>) -> tensor<1x2x3x4x5xi32>
    return %0 : tensor<1x2x3x4x5xi32>
  }
}

// -----
module {
  func.func @redundant_maps(%arg0: tensor<1x2x3x4x5xi32>, %arg1: tensor<1x2x3x4x5xi32>, %arg2: tensor<1x2x3x4x5xi32>) -> tensor<1x2x3x4x5xi32> {
    %0 = linalg.elementwise kind=#linalg.elementwise_kind<mul> ins(%arg0, %arg1 : tensor<1x2x3x4x5xi32>, tensor<1x2x3x4x5xi32>) outs(%arg2 : tensor<1x2x3x4x5xi32>) -> tensor<1x2x3x4x5xi32>
    return %0 : tensor<1x2x3x4x5xi32>
  }
}

