#map = affine_map<(d0, d1) -> (d1, d0)>
#map1 = affine_map<(d0, d1) -> (d0, d1)>
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<3x2xf32>) -> tensor<3x2xf32>, sym_name = "transpose_fold_2d_fp32"}> ({
  ^bb0(%arg0: tensor<3x2xf32>):
    %0 = "arith.constant"() <{value = dense<[[0.000000e+00, 1.000000e+00, 2.000000e+00], [3.000000e+00, 4.000000e+00, 5.000000e+00]]> : tensor<2x3xf32>}> : () -> tensor<2x3xf32>
    %1 = "linalg.generic"(%0, %arg0) <{indexing_maps = [#map, #map1], iterator_types = [#linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>], operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg1: f32, %arg2: f32):
      "linalg.yield"(%arg1) : (f32) -> ()
    }) : (tensor<2x3xf32>, tensor<3x2xf32>) -> tensor<3x2xf32>
    "func.return"(%1) : (tensor<3x2xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1) -> (d1, d0)>
#map1 = affine_map<(d0, d1) -> (d0, d1)>
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<3x2xf64>) -> tensor<3x2xf64>, sym_name = "transpose_fold_2d_fp64"}> ({
  ^bb0(%arg0: tensor<3x2xf64>):
    %0 = "arith.constant"() <{value = dense<[[0.000000e+00, 1.000000e+00, 2.000000e+00], [3.000000e+00, 4.000000e+00, 5.000000e+00]]> : tensor<2x3xf64>}> : () -> tensor<2x3xf64>
    %1 = "linalg.generic"(%0, %arg0) <{indexing_maps = [#map, #map1], iterator_types = [#linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>], operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg1: f64, %arg2: f64):
      "linalg.yield"(%arg1) : (f64) -> ()
    }) : (tensor<2x3xf64>, tensor<3x2xf64>) -> tensor<3x2xf64>
    "func.return"(%1) : (tensor<3x2xf64>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1, d2, d3) -> (d0, d1, d2, d3)>
#map1 = affine_map<(d0, d1, d2, d3) -> (d2, d0, d3, d1)>
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<3x1x4x2xi32>) -> tensor<3x1x4x2xi32>, sym_name = "transpose_fold_4d_i32"}> ({
  ^bb0(%arg0: tensor<3x1x4x2xi32>):
    %0 = "arith.constant"() <{value = dense<[[[[0, 1, 2, 3], [4, 5, 6, 7], [8, 9, 10, 11]], [[12, 13, 14, 15], [16, 17, 18, 19], [20, 21, 22, 23]]]]> : tensor<1x2x3x4xi32>}> : () -> tensor<1x2x3x4xi32>
    %1 = "linalg.generic"(%0, %arg0) <{indexing_maps = [#map, #map1], iterator_types = [#linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>], operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg1: i32, %arg2: i32):
      "linalg.yield"(%arg1) : (i32) -> ()
    }) : (tensor<1x2x3x4xi32>, tensor<3x1x4x2xi32>) -> tensor<3x1x4x2xi32>
    "func.return"(%1) : (tensor<3x1x4x2xi32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1, d2, d3) -> (d0, d1, d2, d3)>
#map1 = affine_map<(d0, d1, d2, d3) -> (d2, d0, d3, d1)>
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<3x1x4x2xi16>) -> tensor<3x1x4x2xi16>, sym_name = "transpose_fold_4d_i16"}> ({
  ^bb0(%arg0: tensor<3x1x4x2xi16>):
    %0 = "arith.constant"() <{value = dense<[[[[0, 1, 2, 3], [4, 5, 6, 7], [8, 9, 10, 11]], [[12, 13, 14, 15], [16, 17, 18, 19], [20, 21, 22, 23]]]]> : tensor<1x2x3x4xi16>}> : () -> tensor<1x2x3x4xi16>
    %1 = "linalg.generic"(%0, %arg0) <{indexing_maps = [#map, #map1], iterator_types = [#linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>], operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg1: i16, %arg2: i16):
      "linalg.yield"(%arg1) : (i16) -> ()
    }) : (tensor<1x2x3x4xi16>, tensor<3x1x4x2xi16>) -> tensor<3x1x4x2xi16>
    "func.return"(%1) : (tensor<3x1x4x2xi16>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1) -> (d1, d0)>
#map1 = affine_map<(d0, d1) -> (d0, d1)>
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<2x3xf32>, tensor<3x2xf32>) -> tensor<3x2xf32>, sym_name = "transpose_nofold_non_cst_input"}> ({
  ^bb0(%arg0: tensor<2x3xf32>, %arg1: tensor<3x2xf32>):
    %0 = "linalg.generic"(%arg0, %arg1) <{indexing_maps = [#map, #map1], iterator_types = [#linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>], operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg2: f32, %arg3: f32):
      "linalg.yield"(%arg2) : (f32) -> ()
    }) : (tensor<2x3xf32>, tensor<3x2xf32>) -> tensor<3x2xf32>
    "func.return"(%0) : (tensor<3x2xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1) -> (d1, d0)>
#map1 = affine_map<(d0, d1) -> (d0, d1)>
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<3x2xf32>) -> tensor<3x2xf32>, sym_name = "transpose_nofold_yield_const"}> ({
  ^bb0(%arg0: tensor<3x2xf32>):
    %0 = "arith.constant"() <{value = dense<[[0.000000e+00, 1.000000e+00, 2.000000e+00], [3.000000e+00, 4.000000e+00, 5.000000e+00]]> : tensor<2x3xf32>}> : () -> tensor<2x3xf32>
    %1 = "arith.constant"() <{value = 8.000000e+00 : f32}> : () -> f32
    %2 = "linalg.generic"(%0, %arg0) <{indexing_maps = [#map, #map1], iterator_types = [#linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>], operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg1: f32, %arg2: f32):
      "linalg.yield"(%1) : (f32) -> ()
    }) : (tensor<2x3xf32>, tensor<3x2xf32>) -> tensor<3x2xf32>
    "func.return"(%2) : (tensor<3x2xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1) -> (d1, d0)>
#map1 = affine_map<(d0, d1) -> (d0, d1)>
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<3x2xf32>) -> tensor<3x2xf32>, sym_name = "transpose_nofold_multi_ops_in_region"}> ({
  ^bb0(%arg0: tensor<3x2xf32>):
    %0 = "arith.constant"() <{value = dense<[[0.000000e+00, 1.000000e+00, 2.000000e+00], [3.000000e+00, 4.000000e+00, 5.000000e+00]]> : tensor<2x3xf32>}> : () -> tensor<2x3xf32>
    %1 = "linalg.generic"(%0, %arg0) <{indexing_maps = [#map, #map1], iterator_types = [#linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>], operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg1: f32, %arg2: f32):
      %2 = "arith.addf"(%arg1, %arg1) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%2) : (f32) -> ()
    }) : (tensor<2x3xf32>, tensor<3x2xf32>) -> tensor<3x2xf32>
    "func.return"(%1) : (tensor<3x2xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<3x2xf32>) -> tensor<3x2xf32>, sym_name = "named_transpose_fold_2d_fp32"}> ({
  ^bb0(%arg0: tensor<3x2xf32>):
    %0 = "arith.constant"() <{value = dense<[[0.000000e+00, 1.000000e+00, 2.000000e+00], [3.000000e+00, 4.000000e+00, 5.000000e+00]]> : tensor<2x3xf32>}> : () -> tensor<2x3xf32>
    %1 = "linalg.transpose"(%0, %arg0) <{permutation = array<i64: 1, 0>}> ({
    ^bb0(%arg1: f32, %arg2: f32):
      "linalg.yield"(%arg1) : (f32) -> ()
    }) : (tensor<2x3xf32>, tensor<3x2xf32>) -> tensor<3x2xf32>
    "func.return"(%1) : (tensor<3x2xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
^bb0:
}) : () -> ()

