#map = affine_map<(d0, d1) -> (d1, d0)>
#map1 = affine_map<(d0, d1) -> (d0, d1)>
module {
  func.func @transpose_fold_2d_fp32(%arg0: tensor<3x2xf32>) -> tensor<3x2xf32> {
    %cst = arith.constant dense<[[0.000000e+00, 1.000000e+00, 2.000000e+00], [3.000000e+00, 4.000000e+00, 5.000000e+00]]> : tensor<2x3xf32>
    %0 = linalg.generic {indexing_maps = [#map, #map1], iterator_types = ["parallel", "parallel"]} ins(%cst : tensor<2x3xf32>) outs(%arg0 : tensor<3x2xf32>) {
    ^bb0(%in: f32, %out: f32):
      linalg.yield %in : f32
    } -> tensor<3x2xf32>
    return %0 : tensor<3x2xf32>
  }
}

// -----
#map = affine_map<(d0, d1) -> (d1, d0)>
#map1 = affine_map<(d0, d1) -> (d0, d1)>
module {
  func.func @transpose_fold_2d_fp64(%arg0: tensor<3x2xf64>) -> tensor<3x2xf64> {
    %cst = arith.constant dense<[[0.000000e+00, 1.000000e+00, 2.000000e+00], [3.000000e+00, 4.000000e+00, 5.000000e+00]]> : tensor<2x3xf64>
    %0 = linalg.generic {indexing_maps = [#map, #map1], iterator_types = ["parallel", "parallel"]} ins(%cst : tensor<2x3xf64>) outs(%arg0 : tensor<3x2xf64>) {
    ^bb0(%in: f64, %out: f64):
      linalg.yield %in : f64
    } -> tensor<3x2xf64>
    return %0 : tensor<3x2xf64>
  }
}

// -----
#map = affine_map<(d0, d1, d2, d3) -> (d0, d1, d2, d3)>
#map1 = affine_map<(d0, d1, d2, d3) -> (d2, d0, d3, d1)>
module {
  func.func @transpose_fold_4d_i32(%arg0: tensor<3x1x4x2xi32>) -> tensor<3x1x4x2xi32> {
    %cst = arith.constant dense<[[[[0, 1, 2, 3], [4, 5, 6, 7], [8, 9, 10, 11]], [[12, 13, 14, 15], [16, 17, 18, 19], [20, 21, 22, 23]]]]> : tensor<1x2x3x4xi32>
    %0 = linalg.generic {indexing_maps = [#map, #map1], iterator_types = ["parallel", "parallel", "parallel", "parallel"]} ins(%cst : tensor<1x2x3x4xi32>) outs(%arg0 : tensor<3x1x4x2xi32>) {
    ^bb0(%in: i32, %out: i32):
      linalg.yield %in : i32
    } -> tensor<3x1x4x2xi32>
    return %0 : tensor<3x1x4x2xi32>
  }
}

// -----
#map = affine_map<(d0, d1, d2, d3) -> (d0, d1, d2, d3)>
#map1 = affine_map<(d0, d1, d2, d3) -> (d2, d0, d3, d1)>
module {
  func.func @transpose_fold_4d_i16(%arg0: tensor<3x1x4x2xi16>) -> tensor<3x1x4x2xi16> {
    %cst = arith.constant dense<[[[[0, 1, 2, 3], [4, 5, 6, 7], [8, 9, 10, 11]], [[12, 13, 14, 15], [16, 17, 18, 19], [20, 21, 22, 23]]]]> : tensor<1x2x3x4xi16>
    %0 = linalg.generic {indexing_maps = [#map, #map1], iterator_types = ["parallel", "parallel", "parallel", "parallel"]} ins(%cst : tensor<1x2x3x4xi16>) outs(%arg0 : tensor<3x1x4x2xi16>) {
    ^bb0(%in: i16, %out: i16):
      linalg.yield %in : i16
    } -> tensor<3x1x4x2xi16>
    return %0 : tensor<3x1x4x2xi16>
  }
}

// -----
#map = affine_map<(d0, d1) -> (d1, d0)>
#map1 = affine_map<(d0, d1) -> (d0, d1)>
module {
  func.func @transpose_nofold_non_cst_input(%arg0: tensor<2x3xf32>, %arg1: tensor<3x2xf32>) -> tensor<3x2xf32> {
    %0 = linalg.generic {indexing_maps = [#map, #map1], iterator_types = ["parallel", "parallel"]} ins(%arg0 : tensor<2x3xf32>) outs(%arg1 : tensor<3x2xf32>) {
    ^bb0(%in: f32, %out: f32):
      linalg.yield %in : f32
    } -> tensor<3x2xf32>
    return %0 : tensor<3x2xf32>
  }
}

// -----
#map = affine_map<(d0, d1) -> (d1, d0)>
#map1 = affine_map<(d0, d1) -> (d0, d1)>
module {
  func.func @transpose_nofold_yield_const(%arg0: tensor<3x2xf32>) -> tensor<3x2xf32> {
    %cst = arith.constant dense<[[0.000000e+00, 1.000000e+00, 2.000000e+00], [3.000000e+00, 4.000000e+00, 5.000000e+00]]> : tensor<2x3xf32>
    %cst_0 = arith.constant 8.000000e+00 : f32
    %0 = linalg.generic {indexing_maps = [#map, #map1], iterator_types = ["parallel", "parallel"]} ins(%cst : tensor<2x3xf32>) outs(%arg0 : tensor<3x2xf32>) {
    ^bb0(%in: f32, %out: f32):
      linalg.yield %cst_0 : f32
    } -> tensor<3x2xf32>
    return %0 : tensor<3x2xf32>
  }
}

// -----
#map = affine_map<(d0, d1) -> (d1, d0)>
#map1 = affine_map<(d0, d1) -> (d0, d1)>
module {
  func.func @transpose_nofold_multi_ops_in_region(%arg0: tensor<3x2xf32>) -> tensor<3x2xf32> {
    %cst = arith.constant dense<[[0.000000e+00, 1.000000e+00, 2.000000e+00], [3.000000e+00, 4.000000e+00, 5.000000e+00]]> : tensor<2x3xf32>
    %0 = linalg.generic {indexing_maps = [#map, #map1], iterator_types = ["parallel", "parallel"]} ins(%cst : tensor<2x3xf32>) outs(%arg0 : tensor<3x2xf32>) {
    ^bb0(%in: f32, %out: f32):
      %1 = arith.addf %in, %in : f32
      linalg.yield %1 : f32
    } -> tensor<3x2xf32>
    return %0 : tensor<3x2xf32>
  }
}

// -----
module {
  func.func @named_transpose_fold_2d_fp32(%arg0: tensor<3x2xf32>) -> tensor<3x2xf32> {
    %cst = arith.constant dense<[[0.000000e+00, 1.000000e+00, 2.000000e+00], [3.000000e+00, 4.000000e+00, 5.000000e+00]]> : tensor<2x3xf32>
    %transposed = linalg.transpose ins(%cst : tensor<2x3xf32>) outs(%arg0 : tensor<3x2xf32>) permutation = [1, 0] 
    return %transposed : tensor<3x2xf32>
  }
}

// -----
module {
}

