#map = affine_map<(d0, d1, d2, d3, d4) -> (d2, d3, d1)>
#map1 = affine_map<(d0, d1, d2, d3, d4) -> (d0, d1, d2, d3, d4)>
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<7x8x9xf32>, tensor<5x9x7x8x10xf32>, tensor<5x9x7x8x10xf32>) -> tensor<5x9x7x8x10xf32>, sym_name = "transpose_and_broadcast"}> ({
  ^bb0(%arg0: tensor<7x8x9xf32>, %arg1: tensor<5x9x7x8x10xf32>, %arg2: tensor<5x9x7x8x10xf32>):
    %0 = "linalg.generic"(%arg0, %arg1, %arg2) <{indexing_maps = [#map, #map1, #map1], iterator_types = [#linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>], operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg3: f32, %arg4: f32, %arg5: f32):
      %1 = "arith.divf"(%arg3, %arg4) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%1) : (f32) -> ()
    }) : (tensor<7x8x9xf32>, tensor<5x9x7x8x10xf32>, tensor<5x9x7x8x10xf32>) -> tensor<5x9x7x8x10xf32>
    "func.return"(%0) : (tensor<5x9x7x8x10xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1, d2) -> (d2, d0, d1)>
#map1 = affine_map<(d0, d1, d2) -> (d0, d1, d2)>
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<32x2x16xf32>, tensor<2x16x32xf32>, tensor<2x16x32xf32>) -> tensor<2x16x32xf32>, sym_name = "transpose_only"}> ({
  ^bb0(%arg0: tensor<32x2x16xf32>, %arg1: tensor<2x16x32xf32>, %arg2: tensor<2x16x32xf32>):
    %0 = "linalg.generic"(%arg0, %arg1, %arg2) <{indexing_maps = [#map, #map1, #map1], iterator_types = [#linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>], operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg3: f32, %arg4: f32, %arg5: f32):
      %1 = "arith.divf"(%arg3, %arg4) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%1) : (f32) -> ()
    }) : (tensor<32x2x16xf32>, tensor<2x16x32xf32>, tensor<2x16x32xf32>) -> tensor<2x16x32xf32>
    "func.return"(%0) : (tensor<2x16x32xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1, d2) -> (d0, d1, d2)>
#map1 = affine_map<(d0, d1, d2) -> (d0, d2)>
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<2x16x32xf32>, tensor<2x32xf32>, tensor<2x16x32xf32>) -> tensor<2x16x32xf32>, sym_name = "broadcast_only"}> ({
  ^bb0(%arg0: tensor<2x16x32xf32>, %arg1: tensor<2x32xf32>, %arg2: tensor<2x16x32xf32>):
    %0 = "linalg.generic"(%arg0, %arg1, %arg2) <{indexing_maps = [#map, #map1, #map], iterator_types = [#linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>], operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg3: f32, %arg4: f32, %arg5: f32):
      %1 = "arith.divf"(%arg3, %arg4) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%1) : (f32) -> ()
    }) : (tensor<2x16x32xf32>, tensor<2x32xf32>, tensor<2x16x32xf32>) -> tensor<2x16x32xf32>
    "func.return"(%0) : (tensor<2x16x32xf32>) -> ()
  }) : () -> ()
}) : () -> ()

