#map = affine_map<(d0, d1, d2) -> (d0, d1, d2)>
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<8x16x32xf32>, tensor<8x16x32xf32>) -> tensor<8x16x32xf32>, sym_name = "unary_identity_exp"}> ({
  ^bb0(%arg0: tensor<8x16x32xf32>, %arg1: tensor<8x16x32xf32>):
    %0 = "linalg.elementwise"(%arg0, %arg1) <{indexing_maps = [#map, #map], kind = #linalg.elementwise_kind<exp>, operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg2: f32, %arg3: f32):
      %1 = "math.exp"(%arg2) <{fastmath = #arith.fastmath<none>}> : (f32) -> f32
      "linalg.yield"(%1) : (f32) -> ()
    }) : (tensor<8x16x32xf32>, tensor<8x16x32xf32>) -> tensor<8x16x32xf32>
    "func.return"(%0) : (tensor<8x16x32xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1, d2) -> (d2, d1)>
#map1 = affine_map<(d0, d1, d2) -> (d0, d1, d2)>
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<?x16xf32>, tensor<8x16x?xf32>) -> tensor<8x16x?xf32>, sym_name = "unary_projection_tanh"}> ({
  ^bb0(%arg0: tensor<?x16xf32>, %arg1: tensor<8x16x?xf32>):
    %0 = "linalg.elementwise"(%arg0, %arg1) <{indexing_maps = [#map, #map1], kind = #linalg.elementwise_kind<tanh>, operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg2: f32, %arg3: f32):
      %1 = "math.tanh"(%arg2) <{fastmath = #arith.fastmath<none>}> : (f32) -> f32
      "linalg.yield"(%1) : (f32) -> ()
    }) : (tensor<?x16xf32>, tensor<8x16x?xf32>) -> tensor<8x16x?xf32>
    "func.return"(%0) : (tensor<8x16x?xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1) -> (d0, d1)>
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<16x8xf32>, tensor<16x8xf32>, tensor<16x8xf32>) -> tensor<16x8xf32>, sym_name = "binary_identity_div"}> ({
  ^bb0(%arg0: tensor<16x8xf32>, %arg1: tensor<16x8xf32>, %arg2: tensor<16x8xf32>):
    %0 = "linalg.elementwise"(%arg0, %arg1, %arg2) <{indexing_maps = [#map, #map, #map], kind = #linalg.elementwise_kind<div>, operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg3: f32, %arg4: f32, %arg5: f32):
      %1 = "arith.divf"(%arg3, %arg4) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%1) : (f32) -> ()
    }) : (tensor<16x8xf32>, tensor<16x8xf32>, tensor<16x8xf32>) -> tensor<16x8xf32>
    "func.return"(%0) : (tensor<16x8xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1, d2, d3, d4) -> (d0, d1, d2, d3, d4)>
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<1x2x3x4x5xi32>, tensor<1x2x3x4x5xi32>, tensor<1x2x3x4x5xi32>) -> tensor<1x2x3x4x5xi32>, sym_name = "binary_identity_mul_5Di"}> ({
  ^bb0(%arg0: tensor<1x2x3x4x5xi32>, %arg1: tensor<1x2x3x4x5xi32>, %arg2: tensor<1x2x3x4x5xi32>):
    %0 = "linalg.elementwise"(%arg0, %arg1, %arg2) <{indexing_maps = [#map, #map, #map], kind = #linalg.elementwise_kind<mul>, operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg3: i32, %arg4: i32, %arg5: i32):
      %1 = "arith.muli"(%arg3, %arg4) <{overflowFlags = #arith.overflow<none>}> : (i32, i32) -> i32
      "linalg.yield"(%1) : (i32) -> ()
    }) : (tensor<1x2x3x4x5xi32>, tensor<1x2x3x4x5xi32>, tensor<1x2x3x4x5xi32>) -> tensor<1x2x3x4x5xi32>
    "func.return"(%0) : (tensor<1x2x3x4x5xi32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1, d2, d3, d4) -> (d0, d1, d2, d3, d4)>
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<1x2x3x4x5xi32>, tensor<1x2x3x4x5xi32>, tensor<1x2x3x4x5xi32>) -> tensor<1x2x3x4x5xi32>, sym_name = "redundant_maps"}> ({
  ^bb0(%arg0: tensor<1x2x3x4x5xi32>, %arg1: tensor<1x2x3x4x5xi32>, %arg2: tensor<1x2x3x4x5xi32>):
    %0 = "linalg.elementwise"(%arg0, %arg1, %arg2) <{indexing_maps = [#map, #map, #map], kind = #linalg.elementwise_kind<mul>, operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg3: i32, %arg4: i32, %arg5: i32):
      %1 = "arith.muli"(%arg3, %arg4) <{overflowFlags = #arith.overflow<none>}> : (i32, i32) -> i32
      "linalg.yield"(%1) : (i32) -> ()
    }) : (tensor<1x2x3x4x5xi32>, tensor<1x2x3x4x5xi32>, tensor<1x2x3x4x5xi32>) -> tensor<1x2x3x4x5xi32>
    "func.return"(%0) : (tensor<1x2x3x4x5xi32>) -> ()
  }) : () -> ()
}) : () -> ()

