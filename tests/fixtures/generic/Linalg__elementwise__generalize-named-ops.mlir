#map = affine_map<(d0, d1, d2) -> (d0, d1, d2)>
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<8x16x32xf32>, tensor<8x16x32xf32>) -> tensor<8x16x32xf32>, sym_name = "unary_exp"}> ({
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
  "func.func"() <{function_type = (tensor<32x16xf32>, tensor<8x16x32xf32>) -> tensor<8x16x32xf32>, sym_name = "unary_transpose_broadcast_tanh"}> ({
  ^bb0(%arg0: tensor<32x16xf32>, %arg1: tensor<8x16x32xf32>):
    %0 = "linalg.elementwise"(%arg0, %arg1) <{indexing_maps = [#map, #map1], kind = #linalg.elementwise_kind<tanh>, operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg2: f32, %arg3: f32):
      %1 = "math.tanh"(%arg2) <{fastmath = #arith.fastmath<none>}> : (f32) -> f32
      "linalg.yield"(%1) : (f32) -> ()
    }) : (tensor<32x16xf32>, tensor<8x16x32xf32>) -> tensor<8x16x32xf32>
    "func.return"(%0) : (tensor<8x16x32xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1) -> (d0, d1)>
"builtin.module"() ({
  "func.func"() <{function_type = (memref<16x8xf32>, memref<16x8xf32>, memref<16x8xf32>) -> (), sym_name = "binary_div_on_memrefs"}> ({
  ^bb0(%arg0: memref<16x8xf32>, %arg1: memref<16x8xf32>, %arg2: memref<16x8xf32>):
    "linalg.elementwise"(%arg0, %arg1, %arg2) <{indexing_maps = [#map, #map, #map], kind = #linalg.elementwise_kind<div>, operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg3: f32, %arg4: f32, %arg5: f32):
      %0 = "arith.divf"(%arg3, %arg4) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%0) : (f32) -> ()
    }) : (memref<16x8xf32>, memref<16x8xf32>, memref<16x8xf32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1) -> (d0, d1)>
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<16x8xf32>, tensor<16x8xf32>, tensor<16x8xf32>) -> tensor<16x8xf32>, sym_name = "binary_mul_on_tensors"}> ({
  ^bb0(%arg0: tensor<16x8xf32>, %arg1: tensor<16x8xf32>, %arg2: tensor<16x8xf32>):
    %0 = "linalg.elementwise"(%arg0, %arg1, %arg2) <{indexing_maps = [#map, #map, #map], kind = #linalg.elementwise_kind<mul>, operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg3: f32, %arg4: f32, %arg5: f32):
      %1 = "arith.mulf"(%arg3, %arg4) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%1) : (f32) -> ()
    }) : (tensor<16x8xf32>, tensor<16x8xf32>, tensor<16x8xf32>) -> tensor<16x8xf32>
    "func.return"(%0) : (tensor<16x8xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1) -> (d1, d0)>
#map1 = affine_map<(d0, d1) -> (d0, d1)>
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<8x16xf32>, tensor<16x8xf32>, tensor<16x8xf32>) -> tensor<16x8xf32>, sym_name = "binary_transpose_a"}> ({
  ^bb0(%arg0: tensor<8x16xf32>, %arg1: tensor<16x8xf32>, %arg2: tensor<16x8xf32>):
    %0 = "linalg.elementwise"(%arg0, %arg1, %arg2) <{indexing_maps = [#map, #map1, #map1], kind = #linalg.elementwise_kind<sub>, operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg3: f32, %arg4: f32, %arg5: f32):
      %1 = "arith.subf"(%arg3, %arg4) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%1) : (f32) -> ()
    }) : (tensor<8x16xf32>, tensor<16x8xf32>, tensor<16x8xf32>) -> tensor<16x8xf32>
    "func.return"(%0) : (tensor<16x8xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1) -> (d1, d0)>
#map1 = affine_map<(d0, d1) -> (d0)>
#map2 = affine_map<(d0, d1) -> (d0, d1)>
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<8x16xf32>, tensor<16xf32>, tensor<16x8xf32>) -> tensor<16x8xf32>, sym_name = "binary_transpose_a_broadcast_b"}> ({
  ^bb0(%arg0: tensor<8x16xf32>, %arg1: tensor<16xf32>, %arg2: tensor<16x8xf32>):
    %0 = "linalg.elementwise"(%arg0, %arg1, %arg2) <{indexing_maps = [#map, #map1, #map2], kind = #linalg.elementwise_kind<add>, operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg3: f32, %arg4: f32, %arg5: f32):
      %1 = "arith.addf"(%arg3, %arg4) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%1) : (f32) -> ()
    }) : (tensor<8x16xf32>, tensor<16xf32>, tensor<16x8xf32>) -> tensor<16x8xf32>
    "func.return"(%0) : (tensor<16x8xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1, d2) -> (d2, d1)>
#map1 = affine_map<(d0, d1, d2) -> (d0, d1, d2)>
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<32x16xi1>, tensor<8x16x32xf32>, tensor<8x16x32xf32>, tensor<8x16x32xf32>) -> tensor<8x16x32xf32>, sym_name = "ternary"}> ({
  ^bb0(%arg0: tensor<32x16xi1>, %arg1: tensor<8x16x32xf32>, %arg2: tensor<8x16x32xf32>, %arg3: tensor<8x16x32xf32>):
    %0 = "linalg.elementwise"(%arg0, %arg1, %arg2, %arg3) <{indexing_maps = [#map, #map1, #map1, #map1], kind = #linalg.elementwise_kind<select>, operandSegmentSizes = array<i32: 3, 1>}> ({
    ^bb0(%arg4: i1, %arg5: f32, %arg6: f32, %arg7: f32):
      %1 = "arith.select"(%arg4, %arg5, %arg6) : (i1, f32, f32) -> f32
      "linalg.yield"(%1) : (f32) -> ()
    }) : (tensor<32x16xi1>, tensor<8x16x32xf32>, tensor<8x16x32xf32>, tensor<8x16x32xf32>) -> tensor<8x16x32xf32>
    "func.return"(%0) : (tensor<8x16x32xf32>) -> ()
  }) : () -> ()
}) : () -> ()

