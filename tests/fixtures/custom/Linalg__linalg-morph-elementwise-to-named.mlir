module {
  func.func @unary_ops(%arg0: tensor<16x8xf32>, %arg1: tensor<16x8xf32>) -> tensor<16x8xf32> {
    %0 = linalg.elementwise kind=#linalg.elementwise_kind<exp> ins(%arg0 : tensor<16x8xf32>) outs(%arg1 : tensor<16x8xf32>) -> tensor<16x8xf32>
    %1 = linalg.elementwise kind=#linalg.elementwise_kind<log> ins(%0 : tensor<16x8xf32>) outs(%arg1 : tensor<16x8xf32>) -> tensor<16x8xf32>
    %2 = linalg.elementwise kind=#linalg.elementwise_kind<abs> ins(%1 : tensor<16x8xf32>) outs(%arg1 : tensor<16x8xf32>) -> tensor<16x8xf32>
    %3 = linalg.elementwise kind=#linalg.elementwise_kind<ceil> ins(%2 : tensor<16x8xf32>) outs(%arg1 : tensor<16x8xf32>) -> tensor<16x8xf32>
    %4 = linalg.elementwise kind=#linalg.elementwise_kind<floor> ins(%3 : tensor<16x8xf32>) outs(%arg1 : tensor<16x8xf32>) -> tensor<16x8xf32>
    %5 = linalg.elementwise kind=#linalg.elementwise_kind<negf> ins(%4 : tensor<16x8xf32>) outs(%arg1 : tensor<16x8xf32>) -> tensor<16x8xf32>
    %6 = linalg.elementwise kind=#linalg.elementwise_kind<reciprocal> ins(%5 : tensor<16x8xf32>) outs(%arg1 : tensor<16x8xf32>) -> tensor<16x8xf32>
    %7 = linalg.elementwise kind=#linalg.elementwise_kind<round> ins(%6 : tensor<16x8xf32>) outs(%arg1 : tensor<16x8xf32>) -> tensor<16x8xf32>
    %8 = linalg.elementwise kind=#linalg.elementwise_kind<sqrt> ins(%7 : tensor<16x8xf32>) outs(%arg1 : tensor<16x8xf32>) -> tensor<16x8xf32>
    %9 = linalg.elementwise kind=#linalg.elementwise_kind<rsqrt> ins(%8 : tensor<16x8xf32>) outs(%arg1 : tensor<16x8xf32>) -> tensor<16x8xf32>
    %10 = linalg.elementwise kind=#linalg.elementwise_kind<square> ins(%9 : tensor<16x8xf32>) outs(%arg1 : tensor<16x8xf32>) -> tensor<16x8xf32>
    %11 = linalg.elementwise kind=#linalg.elementwise_kind<tanh> ins(%10 : tensor<16x8xf32>) outs(%arg1 : tensor<16x8xf32>) -> tensor<16x8xf32>
    %12 = linalg.elementwise kind=#linalg.elementwise_kind<erf> ins(%11 : tensor<16x8xf32>) outs(%arg1 : tensor<16x8xf32>) -> tensor<16x8xf32>
    return %12 : tensor<16x8xf32>
  }
}

// -----
module {
  func.func @binary_ops_int(%arg0: tensor<?x?xi32>, %arg1: tensor<?x?xi32>, %arg2: tensor<?x?xi32>) -> tensor<?x?xi32> {
    %0 = linalg.elementwise kind=#linalg.elementwise_kind<add> ins(%arg0, %arg1 : tensor<?x?xi32>, tensor<?x?xi32>) outs(%arg2 : tensor<?x?xi32>) -> tensor<?x?xi32>
    %1 = linalg.elementwise kind=#linalg.elementwise_kind<sub> ins(%0, %arg1 : tensor<?x?xi32>, tensor<?x?xi32>) outs(%arg2 : tensor<?x?xi32>) -> tensor<?x?xi32>
    %2 = linalg.elementwise kind=#linalg.elementwise_kind<mul> ins(%1, %arg1 : tensor<?x?xi32>, tensor<?x?xi32>) outs(%arg2 : tensor<?x?xi32>) -> tensor<?x?xi32>
    %3 = linalg.elementwise kind=#linalg.elementwise_kind<div> ins(%2, %arg1 : tensor<?x?xi32>, tensor<?x?xi32>) outs(%arg2 : tensor<?x?xi32>) -> tensor<?x?xi32>
    %4 = linalg.elementwise kind=#linalg.elementwise_kind<div_unsigned> ins(%3, %arg1 : tensor<?x?xi32>, tensor<?x?xi32>) outs(%arg2 : tensor<?x?xi32>) -> tensor<?x?xi32>
    %5 = linalg.elementwise kind=#linalg.elementwise_kind<max_signed> ins(%4, %arg1 : tensor<?x?xi32>, tensor<?x?xi32>) outs(%arg2 : tensor<?x?xi32>) -> tensor<?x?xi32>
    %6 = linalg.elementwise kind=#linalg.elementwise_kind<min_signed> ins(%5, %arg1 : tensor<?x?xi32>, tensor<?x?xi32>) outs(%arg2 : tensor<?x?xi32>) -> tensor<?x?xi32>
    return %6 : tensor<?x?xi32>
  }
}

// -----
module {
  func.func @binary_ops_float(%arg0: tensor<?x?xf32>, %arg1: tensor<?x?xf32>, %arg2: tensor<?x?xf32>) -> tensor<?x?xf32> {
    %0 = linalg.elementwise kind=#linalg.elementwise_kind<add> ins(%arg0, %arg1 : tensor<?x?xf32>, tensor<?x?xf32>) outs(%arg2 : tensor<?x?xf32>) -> tensor<?x?xf32>
    %1 = linalg.elementwise kind=#linalg.elementwise_kind<sub> ins(%0, %arg1 : tensor<?x?xf32>, tensor<?x?xf32>) outs(%arg2 : tensor<?x?xf32>) -> tensor<?x?xf32>
    %2 = linalg.elementwise kind=#linalg.elementwise_kind<mul> ins(%1, %arg1 : tensor<?x?xf32>, tensor<?x?xf32>) outs(%arg2 : tensor<?x?xf32>) -> tensor<?x?xf32>
    %3 = linalg.elementwise kind=#linalg.elementwise_kind<div> ins(%2, %arg1 : tensor<?x?xf32>, tensor<?x?xf32>) outs(%arg2 : tensor<?x?xf32>) -> tensor<?x?xf32>
    %4 = linalg.elementwise kind=#linalg.elementwise_kind<max_signed> ins(%3, %arg1 : tensor<?x?xf32>, tensor<?x?xf32>) outs(%arg2 : tensor<?x?xf32>) -> tensor<?x?xf32>
    %5 = linalg.elementwise kind=#linalg.elementwise_kind<min_signed> ins(%4, %arg1 : tensor<?x?xf32>, tensor<?x?xf32>) outs(%arg2 : tensor<?x?xf32>) -> tensor<?x?xf32>
    %6 = linalg.elementwise kind=#linalg.elementwise_kind<powf> ins(%5, %arg1 : tensor<?x?xf32>, tensor<?x?xf32>) outs(%arg2 : tensor<?x?xf32>) -> tensor<?x?xf32>
    return %6 : tensor<?x?xf32>
  }
}

// -----
module {
  func.func @ternary_select(%arg0: tensor<?x?xi1>, %arg1: tensor<?x?xf32>, %arg2: tensor<?x?xf32>, %arg3: tensor<?x?xf32>) -> tensor<?x?xf32> {
    %0 = linalg.elementwise kind=#linalg.elementwise_kind<select> ins(%arg0, %arg1, %arg2 : tensor<?x?xi1>, tensor<?x?xf32>, tensor<?x?xf32>) outs(%arg3 : tensor<?x?xf32>) -> tensor<?x?xf32>
    return %0 : tensor<?x?xf32>
  }
}

// -----
#map = affine_map<(d0, d1) -> (d1)>
#map1 = affine_map<(d0, d1) -> (d0, d1)>
module {
  func.func @non_identity_maps(%arg0: tensor<?xf32>, %arg1: tensor<?x?xf32>) -> tensor<?x?xf32> {
    %0 = linalg.elementwise kind=#linalg.elementwise_kind<exp> indexing_maps = [#map, #map1] ins(%arg0 : tensor<?xf32>) outs(%arg1 : tensor<?x?xf32>) -> tensor<?x?xf32>
    return %0 : tensor<?x?xf32>
  }
}

// -----
module {
  func.func @no_named_op(%arg0: tensor<?x?xf32>, %arg1: tensor<?x?xf32>) -> tensor<?x?xf32> {
    %0 = linalg.elementwise kind=#linalg.elementwise_kind<sin> ins(%arg0 : tensor<?x?xf32>) outs(%arg1 : tensor<?x?xf32>) -> tensor<?x?xf32>
    return %0 : tensor<?x?xf32>
  }
}

