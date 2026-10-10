#map = affine_map<(d0, d1, d2) -> (d1, d0)>
#map1 = affine_map<(d0, d1, d2) -> (d0, d1, d2)>
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<7x8xf32>, tensor<8x7x9xf32>) -> tensor<8x7x9xf32>, sym_name = "transpose_and_broadcast"}> ({
  ^bb0(%arg0: tensor<7x8xf32>, %arg1: tensor<8x7x9xf32>):
    %0 = "linalg.generic"(%arg0, %arg1) <{indexing_maps = [#map, #map1], iterator_types = [#linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>], operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg2: f32, %arg3: f32):
      "linalg.yield"(%arg2) : (f32) -> ()
    }) : (tensor<7x8xf32>, tensor<8x7x9xf32>) -> tensor<8x7x9xf32>
    "func.return"(%0) : (tensor<8x7x9xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0) -> (d0)>
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<8xi32>) -> tensor<8xi32>, sym_name = "neither_permutation_nor_broadcast"}> ({
  ^bb0(%arg0: tensor<8xi32>):
    %0 = "linalg.generic"(%arg0) <{indexing_maps = [#map], iterator_types = [#linalg.iterator_type<parallel>], operandSegmentSizes = array<i32: 0, 1>}> ({
    ^bb0(%arg1: i32):
      "linalg.yield"(%arg1) : (i32) -> ()
    }) : (tensor<8xi32>) -> tensor<8xi32>
    "func.return"(%0) : (tensor<8xi32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0) -> (d0)>
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<8xi32>, tensor<8xi32>) -> tensor<8xi32>, sym_name = "not_copy"}> ({
  ^bb0(%arg0: tensor<8xi32>, %arg1: tensor<8xi32>):
    %0 = "arith.constant"() <{value = 0 : i32}> : () -> i32
    %1 = "linalg.generic"(%arg0, %arg1) <{indexing_maps = [#map, #map], iterator_types = [#linalg.iterator_type<parallel>], operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg2: i32, %arg3: i32):
      "linalg.yield"(%0) : (i32) -> ()
    }) : (tensor<8xi32>, tensor<8xi32>) -> tensor<8xi32>
    "func.return"(%1) : (tensor<8xi32>) -> ()
  }) : () -> ()
}) : () -> ()

