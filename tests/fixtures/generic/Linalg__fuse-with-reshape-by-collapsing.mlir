#map = affine_map<(d0, d1, d2, d3, d4, d5, d6, d7) -> (d0, d1, d2, d3, d4, d5, d6, d7)>
#map1 = affine_map<(d0, d1, d2, d3, d4, d5, d6, d7) -> (d0, d1, d2)>
#map2 = affine_map<(d0, d1, d2, d3, d4, d5, d6, d7) -> (d3, d4, d5, d6)>
#map3 = affine_map<(d0, d1, d2, d3, d4, d5, d6, d7) -> (d1, d2, d0, d7, d3, d4, d5, d6)>
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<2x12x5x336x9xi32>, tensor<2x3x4xi32>, tensor<5x6x7x8xi32>) -> (tensor<2x3x4x5x6x7x8x9xi32>, tensor<3x4x2x9x5x6x7x8xi32>), sym_name = "fuse_by_collapsing"}> ({
  ^bb0(%arg0: tensor<2x12x5x336x9xi32>, %arg1: tensor<2x3x4xi32>, %arg2: tensor<5x6x7x8xi32>):
    %0 = "tensor.expand_shape"(%arg0) <{reassociation = [[0], [1, 2], [3], [4, 5, 6], [7]], static_output_shape = array<i64: 2, 3, 4, 5, 6, 7, 8, 9>}> : (tensor<2x12x5x336x9xi32>) -> tensor<2x3x4x5x6x7x8x9xi32>
    %1 = "tensor.empty"() : () -> tensor<2x3x4x5x6x7x8x9xi32>
    %2 = "tensor.empty"() : () -> tensor<3x4x2x9x5x6x7x8xi32>
    %3:2 = "linalg.generic"(%0, %arg1, %arg2, %1, %2) <{indexing_maps = [#map, #map1, #map2, #map, #map3], iterator_types = [#linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>], operandSegmentSizes = array<i32: 3, 2>}> ({
    ^bb0(%arg3: i32, %arg4: i32, %arg5: i32, %arg6: i32, %arg7: i32):
      %4 = "arith.addi"(%arg3, %arg4) <{overflowFlags = #arith.overflow<none>}> : (i32, i32) -> i32
      %5 = "arith.addi"(%4, %arg5) <{overflowFlags = #arith.overflow<none>}> : (i32, i32) -> i32
      "linalg.yield"(%5, %5) : (i32, i32) -> ()
    }) : (tensor<2x3x4x5x6x7x8x9xi32>, tensor<2x3x4xi32>, tensor<5x6x7x8xi32>, tensor<2x3x4x5x6x7x8x9xi32>, tensor<3x4x2x9x5x6x7x8xi32>) -> (tensor<2x3x4x5x6x7x8x9xi32>, tensor<3x4x2x9x5x6x7x8xi32>)
    "func.return"(%3#0, %3#1) : (tensor<2x3x4x5x6x7x8x9xi32>, tensor<3x4x2x9x5x6x7x8xi32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1, d2, d3, d4, d5, d6, d7) -> (d0, d1, d2, d3, d4, d5, d6, d7)>
#map1 = affine_map<(d0, d1, d2, d3, d4, d5, d6, d7) -> (d0, d1, d2)>
#map2 = affine_map<(d0, d1, d2, d3, d4, d5, d6, d7) -> (d3, d4, d5, d6)>
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<2x12x5x336x9xi32>, tensor<2x3x4xi32>, tensor<5x6x7x8xi32>) -> tensor<2x3x4x5x6x7x8x9xi32>, sym_name = "fuse_by_collapsing_indexing_op"}> ({
  ^bb0(%arg0: tensor<2x12x5x336x9xi32>, %arg1: tensor<2x3x4xi32>, %arg2: tensor<5x6x7x8xi32>):
    %0 = "tensor.expand_shape"(%arg0) <{reassociation = [[0], [1, 2], [3], [4, 5, 6], [7]], static_output_shape = array<i64: 2, 3, 4, 5, 6, 7, 8, 9>}> : (tensor<2x12x5x336x9xi32>) -> tensor<2x3x4x5x6x7x8x9xi32>
    %1 = "tensor.empty"() : () -> tensor<2x3x4x5x6x7x8x9xi32>
    %2 = "linalg.generic"(%0, %arg1, %arg2, %1) <{indexing_maps = [#map, #map1, #map2, #map], iterator_types = [#linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>], operandSegmentSizes = array<i32: 3, 1>}> ({
    ^bb0(%arg3: i32, %arg4: i32, %arg5: i32, %arg6: i32):
      %3 = "linalg.index"() <{dim = 0 : i64}> : () -> index
      %4 = "linalg.index"() <{dim = 1 : i64}> : () -> index
      %5 = "arith.addi"(%3, %4) <{overflowFlags = #arith.overflow<none>}> : (index, index) -> index
      %6 = "linalg.index"() <{dim = 2 : i64}> : () -> index
      %7 = "arith.addi"(%5, %6) <{overflowFlags = #arith.overflow<none>}> : (index, index) -> index
      %8 = "linalg.index"() <{dim = 3 : i64}> : () -> index
      %9 = "arith.addi"(%7, %8) <{overflowFlags = #arith.overflow<none>}> : (index, index) -> index
      %10 = "linalg.index"() <{dim = 4 : i64}> : () -> index
      %11 = "arith.addi"(%9, %10) <{overflowFlags = #arith.overflow<none>}> : (index, index) -> index
      %12 = "linalg.index"() <{dim = 5 : i64}> : () -> index
      %13 = "arith.addi"(%11, %12) <{overflowFlags = #arith.overflow<none>}> : (index, index) -> index
      %14 = "linalg.index"() <{dim = 6 : i64}> : () -> index
      %15 = "arith.addi"(%13, %14) <{overflowFlags = #arith.overflow<none>}> : (index, index) -> index
      %16 = "linalg.index"() <{dim = 7 : i64}> : () -> index
      %17 = "arith.addi"(%15, %16) <{overflowFlags = #arith.overflow<none>}> : (index, index) -> index
      %18 = "arith.index_cast"(%17) : (index) -> i32
      "linalg.yield"(%18) : (i32) -> ()
    }) : (tensor<2x3x4x5x6x7x8x9xi32>, tensor<2x3x4xi32>, tensor<5x6x7x8xi32>, tensor<2x3x4x5x6x7x8x9xi32>) -> tensor<2x3x4x5x6x7x8x9xi32>
    "func.return"(%2) : (tensor<2x3x4x5x6x7x8x9xi32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1, d2, d3, d4, d5, d6, d7) -> (d7, d5, d6, d0, d1, d2, d3, d4)>
#map1 = affine_map<(d0, d1, d2, d3, d4, d5, d6, d7) -> (d5, d6, d0)>
#map2 = affine_map<(d0, d1, d2, d3, d4, d5, d6, d7) -> (d4, d1, d2, d3)>
#map3 = affine_map<(d0, d1, d2, d3, d4, d5, d6, d7) -> (d0, d1, d2, d3, d4, d5, d6, d7)>
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<9x56x2x60x6xi32>, tensor<7x8x2xi32>, tensor<6x3x4x5xi32>) -> tensor<2x3x4x5x6x7x8x9xi32>, sym_name = "fuse_by_collapsing_change_reshape_order"}> ({
  ^bb0(%arg0: tensor<9x56x2x60x6xi32>, %arg1: tensor<7x8x2xi32>, %arg2: tensor<6x3x4x5xi32>):
    %0 = "tensor.expand_shape"(%arg0) <{reassociation = [[0], [1, 2], [3], [4, 5, 6], [7]], static_output_shape = array<i64: 9, 7, 8, 2, 3, 4, 5, 6>}> : (tensor<9x56x2x60x6xi32>) -> tensor<9x7x8x2x3x4x5x6xi32>
    %1 = "tensor.empty"() : () -> tensor<2x3x4x5x6x7x8x9xi32>
    %2 = "linalg.generic"(%0, %arg1, %arg2, %1) <{indexing_maps = [#map, #map1, #map2, #map3], iterator_types = [#linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>], operandSegmentSizes = array<i32: 3, 1>}> ({
    ^bb0(%arg3: i32, %arg4: i32, %arg5: i32, %arg6: i32):
      %3 = "arith.addi"(%arg3, %arg4) <{overflowFlags = #arith.overflow<none>}> : (i32, i32) -> i32
      %4 = "arith.addi"(%3, %arg5) <{overflowFlags = #arith.overflow<none>}> : (i32, i32) -> i32
      "linalg.yield"(%4) : (i32) -> ()
    }) : (tensor<9x7x8x2x3x4x5x6xi32>, tensor<7x8x2xi32>, tensor<6x3x4x5xi32>, tensor<2x3x4x5x6x7x8x9xi32>) -> tensor<2x3x4x5x6x7x8x9xi32>
    "func.return"(%2) : (tensor<2x3x4x5x6x7x8x9xi32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1, d2, d3, d4, d5, d6, d7) -> (d7, d5, d6, d0, d1, d2, d3, d4)>
#map1 = affine_map<(d0, d1, d2, d3, d4, d5, d6, d7) -> (d5, d6, d0)>
#map2 = affine_map<(d0, d1, d2, d3, d4, d5, d6, d7) -> (d4, d1, d2, d3)>
#map3 = affine_map<(d0, d1, d2, d3, d4, d5, d6, d7) -> (d0, d1, d2, d3, d4, d5, d6, d7)>
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<?x?x?x?x?xi32>, tensor<?x?x?xi32>, tensor<?x?x?x?xi32>, index, index, index, index, index) -> tensor<?x3x?x5x?x7x?x?xi32>, sym_name = "fuse_by_collapsing_dynamic"}> ({
  ^bb0(%arg0: tensor<?x?x?x?x?xi32>, %arg1: tensor<?x?x?xi32>, %arg2: tensor<?x?x?x?xi32>, %arg3: index, %arg4: index, %arg5: index, %arg6: index, %arg7: index):
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index
    %1 = "arith.constant"() <{value = 1 : index}> : () -> index
    %2 = "arith.constant"() <{value = 2 : index}> : () -> index
    %3 = "tensor.expand_shape"(%arg0, %arg3, %arg4, %arg5, %arg6, %arg7) <{reassociation = [[0], [1, 2], [3], [4, 5, 6], [7]], static_output_shape = array<i64: -9223372036854775808, 7, -9223372036854775808, -9223372036854775808, 3, -9223372036854775808, 5, -9223372036854775808>}> : (tensor<?x?x?x?x?xi32>, index, index, index, index, index) -> tensor<?x7x?x?x3x?x5x?xi32>
    %4 = "tensor.dim"(%arg1, %2) : (tensor<?x?x?xi32>, index) -> index
    %5 = "tensor.dim"(%arg2, %2) : (tensor<?x?x?x?xi32>, index) -> index
    %6 = "tensor.dim"(%arg2, %0) : (tensor<?x?x?x?xi32>, index) -> index
    %7 = "tensor.dim"(%arg1, %1) : (tensor<?x?x?xi32>, index) -> index
    %8 = "tensor.dim"(%arg0, %0) : (tensor<?x?x?x?x?xi32>, index) -> index
    %9 = "tensor.empty"(%4, %5, %6, %7, %8) : (index, index, index, index, index) -> tensor<?x3x?x5x?x7x?x?xi32>
    %10 = "linalg.generic"(%3, %arg1, %arg2, %9) <{indexing_maps = [#map, #map1, #map2, #map3], iterator_types = [#linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>], operandSegmentSizes = array<i32: 3, 1>}> ({
    ^bb0(%arg8: i32, %arg9: i32, %arg10: i32, %arg11: i32):
      %11 = "linalg.index"() <{dim = 0 : i64}> : () -> index
      %12 = "linalg.index"() <{dim = 1 : i64}> : () -> index
      %13 = "arith.addi"(%11, %12) <{overflowFlags = #arith.overflow<none>}> : (index, index) -> index
      %14 = "linalg.index"() <{dim = 2 : i64}> : () -> index
      %15 = "arith.addi"(%13, %14) <{overflowFlags = #arith.overflow<none>}> : (index, index) -> index
      %16 = "linalg.index"() <{dim = 3 : i64}> : () -> index
      %17 = "arith.addi"(%15, %16) <{overflowFlags = #arith.overflow<none>}> : (index, index) -> index
      %18 = "linalg.index"() <{dim = 4 : i64}> : () -> index
      %19 = "arith.addi"(%17, %18) <{overflowFlags = #arith.overflow<none>}> : (index, index) -> index
      %20 = "linalg.index"() <{dim = 5 : i64}> : () -> index
      %21 = "arith.addi"(%19, %20) <{overflowFlags = #arith.overflow<none>}> : (index, index) -> index
      %22 = "linalg.index"() <{dim = 6 : i64}> : () -> index
      %23 = "arith.addi"(%21, %22) <{overflowFlags = #arith.overflow<none>}> : (index, index) -> index
      %24 = "linalg.index"() <{dim = 7 : i64}> : () -> index
      %25 = "arith.addi"(%23, %24) <{overflowFlags = #arith.overflow<none>}> : (index, index) -> index
      %26 = "arith.index_cast"(%25) : (index) -> i32
      "linalg.yield"(%26) : (i32) -> ()
    }) : (tensor<?x7x?x?x3x?x5x?xi32>, tensor<?x?x?xi32>, tensor<?x?x?x?xi32>, tensor<?x3x?x5x?x7x?x?xi32>) -> tensor<?x3x?x5x?x7x?x?xi32>
    "func.return"(%10) : (tensor<?x3x?x5x?x7x?x?xi32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1) -> (d0, d1)>
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<?xf32>, index, index) -> tensor<?x?xf32>, sym_name = "fuse_by_collapsing_dynamic_2"}> ({
  ^bb0(%arg0: tensor<?xf32>, %arg1: index, %arg2: index):
    %0 = "tensor.expand_shape"(%arg0, %arg1, %arg2) <{reassociation = [[0, 1]], static_output_shape = array<i64: -9223372036854775808, -9223372036854775808>}> : (tensor<?xf32>, index, index) -> tensor<?x?xf32>
    %1 = "tensor.empty"(%arg2, %arg1) : (index, index) -> tensor<?x?xf32>
    %2 = "linalg.generic"(%0, %1) <{indexing_maps = [#map, #map], iterator_types = [#linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>], operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg3: f32, %arg4: f32):
      %3 = "arith.negf"(%arg3) <{fastmath = #arith.fastmath<none>}> : (f32) -> f32
      "linalg.yield"(%3) : (f32) -> ()
    }) : (tensor<?x?xf32>, tensor<?x?xf32>) -> tensor<?x?xf32>
    "func.return"(%2) : (tensor<?x?xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1, d2, d3) -> (d0, d1, d2, d3)>
#map1 = affine_map<(d0, d1, d2, d3) -> (d0, d3)>
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<2x?x5xf32>, tensor<2x5xf32>, index) -> tensor<2x5xf32>, sym_name = "fuse_reductions"}> ({
  ^bb0(%arg0: tensor<2x?x5xf32>, %arg1: tensor<2x5xf32>, %arg2: index):
    %0 = "tensor.expand_shape"(%arg0, %arg2) <{reassociation = [[0], [1, 2], [3]], static_output_shape = array<i64: 2, 6, -9223372036854775808, 5>}> : (tensor<2x?x5xf32>, index) -> tensor<2x6x?x5xf32>
    %1 = "linalg.generic"(%0, %arg1) <{indexing_maps = [#map, #map1], iterator_types = [#linalg.iterator_type<parallel>, #linalg.iterator_type<reduction>, #linalg.iterator_type<reduction>, #linalg.iterator_type<parallel>], operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg3: f32, %arg4: f32):
      %2 = "arith.addf"(%arg3, %arg4) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%2) : (f32) -> ()
    }) : (tensor<2x6x?x5xf32>, tensor<2x5xf32>) -> tensor<2x5xf32>
    "func.return"(%1) : (tensor<2x5xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1, d2, d3) -> (d0, d1, d2, d3)>
#map1 = affine_map<(d0, d1, d2, d3) -> (d0, d1)>
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<2x12x5xf32>, tensor<2x3xf32>) -> tensor<2x3x4x5xf32>, sym_name = "no_fuse_unpreserved_folding"}> ({
  ^bb0(%arg0: tensor<2x12x5xf32>, %arg1: tensor<2x3xf32>):
    %0 = "tensor.expand_shape"(%arg0) <{reassociation = [[0], [1, 2], [3]], static_output_shape = array<i64: 2, 3, 4, 5>}> : (tensor<2x12x5xf32>) -> tensor<2x3x4x5xf32>
    %1 = "tensor.empty"() : () -> tensor<2x3x4x5xf32>
    %2 = "linalg.generic"(%0, %arg1, %1) <{indexing_maps = [#map, #map1, #map], iterator_types = [#linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>], operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg2: f32, %arg3: f32, %arg4: f32):
      %3 = "arith.addf"(%arg2, %arg3) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%3) : (f32) -> ()
    }) : (tensor<2x3x4x5xf32>, tensor<2x3xf32>, tensor<2x3x4x5xf32>) -> tensor<2x3x4x5xf32>
    "func.return"(%2) : (tensor<2x3x4x5xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1, d2, d3) -> (d0, d1, d2, d3)>
#map1 = affine_map<(d0, d1, d2, d3) -> (d0)>
#map2 = affine_map<(d0, d1, d2, d3) -> (d0, d2, d1, d3)>
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<2x12x5xf32>, tensor<2xf32>) -> tensor<2x4x3x5xf32>, sym_name = "no_fuse_unpreserved_folding_transpose"}> ({
  ^bb0(%arg0: tensor<2x12x5xf32>, %arg1: tensor<2xf32>):
    %0 = "tensor.expand_shape"(%arg0) <{reassociation = [[0], [1, 2], [3]], static_output_shape = array<i64: 2, 3, 4, 5>}> : (tensor<2x12x5xf32>) -> tensor<2x3x4x5xf32>
    %1 = "tensor.empty"() : () -> tensor<2x4x3x5xf32>
    %2 = "linalg.generic"(%0, %arg1, %1) <{indexing_maps = [#map, #map1, #map2], iterator_types = [#linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>], operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg2: f32, %arg3: f32, %arg4: f32):
      %3 = "arith.addf"(%arg2, %arg3) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%3) : (f32) -> ()
    }) : (tensor<2x3x4x5xf32>, tensor<2xf32>, tensor<2x4x3x5xf32>) -> tensor<2x4x3x5xf32>
    "func.return"(%2) : (tensor<2x4x3x5xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1, d2, d3) -> (d0, d1, d2, d3)>
#map1 = affine_map<(d0, d1, d2, d3) -> (d0, d1)>
#map2 = affine_map<(d0, d1, d2, d3) -> (d0, d3)>
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<2x12x5xf32>, tensor<2x3xf32>) -> tensor<2x5xf32>, sym_name = "no_fuse_mismatched_iterator_types"}> ({
  ^bb0(%arg0: tensor<2x12x5xf32>, %arg1: tensor<2x3xf32>):
    %0 = "tensor.expand_shape"(%arg0) <{reassociation = [[0], [1, 2], [3]], static_output_shape = array<i64: 2, 3, 4, 5>}> : (tensor<2x12x5xf32>) -> tensor<2x3x4x5xf32>
    %1 = "tensor.empty"() : () -> tensor<2x5xf32>
    %2 = "linalg.generic"(%0, %arg1, %1) <{indexing_maps = [#map, #map1, #map2], iterator_types = [#linalg.iterator_type<parallel>, #linalg.iterator_type<reduction>, #linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>], operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg2: f32, %arg3: f32, %arg4: f32):
      %3 = "arith.addf"(%arg2, %arg3) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%3) : (f32) -> ()
    }) : (tensor<2x3x4x5xf32>, tensor<2x3xf32>, tensor<2x5xf32>) -> tensor<2x5xf32>
    "func.return"(%2) : (tensor<2x5xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1, d2, d3) -> (d0, d1)>
#map1 = affine_map<(d0, d1, d2, d3) -> (d2, d3)>
#map2 = affine_map<(d0, d1, d2, d3) -> (d0, d1, d2, d3)>
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<6xf32>, tensor<20xf32>) -> tensor<2x3x4x5xf32>, sym_name = "control_fusion"}> ({
  ^bb0(%arg0: tensor<6xf32>, %arg1: tensor<20xf32>):
    %0 = "tensor.expand_shape"(%arg0) <{reassociation = [[0, 1]], static_output_shape = array<i64: 2, 3>}> : (tensor<6xf32>) -> tensor<2x3xf32>
    %1 = "tensor.expand_shape"(%arg1) <{reassociation = [[0, 1]], static_output_shape = array<i64: 4, 5>}> : (tensor<20xf32>) -> tensor<4x5xf32>
    %2 = "tensor.empty"() : () -> tensor<2x3x4x5xf32>
    %3 = "linalg.generic"(%0, %1, %2) <{indexing_maps = [#map, #map1, #map2], iterator_types = [#linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>], operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg2: f32, %arg3: f32, %arg4: f32):
      %4 = "arith.addf"(%arg2, %arg3) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%4) : (f32) -> ()
    }) : (tensor<2x3xf32>, tensor<4x5xf32>, tensor<2x3x4x5xf32>) -> tensor<2x3x4x5xf32>
    "func.return"(%3) : (tensor<2x3x4x5xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0) -> (d0)>
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<f32>) -> tensor<1xf32>, sym_name = "zero_D_test"}> ({
  ^bb0(%arg0: tensor<f32>):
    %0 = "tensor.expand_shape"(%arg0) <{reassociation = [], static_output_shape = array<i64: 1>}> : (tensor<f32>) -> tensor<1xf32>
    %1 = "tensor.empty"() : () -> tensor<1xf32>
    %2 = "linalg.generic"(%0, %1) <{indexing_maps = [#map, #map], iterator_types = [#linalg.iterator_type<parallel>], operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg1: f32, %arg2: f32):
      "linalg.yield"(%arg1) : (f32) -> ()
    }) : (tensor<1xf32>, tensor<1xf32>) -> tensor<1xf32>
    "func.return"(%2) : (tensor<1xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1, d2, d3) -> (d1, d0, d2, d3)>
#map1 = affine_map<(d0, d1, d2, d3) -> (d0, d1, d2, d3)>
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<?x?xf32>, tensor<4x?x?x8xf32>, index, index) -> tensor<4x?x?x8xf32>, sym_name = "fuse_only_one_reassociation"}> ({
  ^bb0(%arg0: tensor<?x?xf32>, %arg1: tensor<4x?x?x8xf32>, %arg2: index, %arg3: index):
    %0 = "tensor.expand_shape"(%arg0, %arg2, %arg3) <{reassociation = [[0, 1], [2, 3]], static_output_shape = array<i64: -9223372036854775808, 4, -9223372036854775808, 8>}> : (tensor<?x?xf32>, index, index) -> tensor<?x4x?x8xf32>
    %1 = "linalg.generic"(%0, %arg1, %arg1) <{indexing_maps = [#map, #map1, #map1], iterator_types = [#linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>], operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg4: f32, %arg5: f32, %arg6: f32):
      %2 = "arith.addf"(%arg4, %arg5) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%2) : (f32) -> ()
    }) : (tensor<?x4x?x8xf32>, tensor<4x?x?x8xf32>, tensor<4x?x?x8xf32>) -> tensor<4x?x?x8xf32>
    "func.return"(%1) : (tensor<4x?x?x8xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1, d2, d3) -> (d0, d2, d3, d1)>
#map1 = affine_map<(d0, d1, d2, d3) -> (d3, d1, d0, d2)>
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<?x?xi32>, index, index) -> tensor<?x8x?x4xi32>, sym_name = "fold_non_consecutive_dims"}> ({
  ^bb0(%arg0: tensor<?x?xi32>, %arg1: index, %arg2: index):
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index
    %1 = "arith.constant"() <{value = 2 : index}> : () -> index
    %2 = "tensor.expand_shape"(%arg0, %arg1, %arg2) <{reassociation = [[0, 1], [2, 3]], static_output_shape = array<i64: -9223372036854775808, 4, -9223372036854775808, 8>}> : (tensor<?x?xi32>, index, index) -> tensor<?x4x?x8xi32>
    %3 = "tensor.dim"(%2, %0) : (tensor<?x4x?x8xi32>, index) -> index
    %4 = "tensor.dim"(%2, %1) : (tensor<?x4x?x8xi32>, index) -> index
    %5 = "tensor.empty"(%4, %3) : (index, index) -> tensor<?x8x?x4xi32>
    %6 = "linalg.generic"(%2, %5) <{indexing_maps = [#map, #map1], iterator_types = [#linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>], operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg3: i32, %arg4: i32):
      %7 = "linalg.index"() <{dim = 0 : i64}> : () -> index
      %8 = "linalg.index"() <{dim = 1 : i64}> : () -> index
      %9 = "linalg.index"() <{dim = 2 : i64}> : () -> index
      %10 = "linalg.index"() <{dim = 3 : i64}> : () -> index
      %11 = "arith.addi"(%7, %8) <{overflowFlags = #arith.overflow<none>}> : (index, index) -> index
      %12 = "arith.addi"(%11, %9) <{overflowFlags = #arith.overflow<none>}> : (index, index) -> index
      %13 = "arith.addi"(%12, %10) <{overflowFlags = #arith.overflow<none>}> : (index, index) -> index
      %14 = "arith.index_cast"(%13) : (index) -> i32
      "linalg.yield"(%14) : (i32) -> ()
    }) : (tensor<?x4x?x8xi32>, tensor<?x8x?x4xi32>) -> tensor<?x8x?x4xi32>
    "func.return"(%6) : (tensor<?x8x?x4xi32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1, d2, d3) -> (d0, d2, d3, d1)>
#map1 = affine_map<(d0, d1, d2, d3) -> ()>
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<?x?xi32>, index, index) -> tensor<i32>, sym_name = "no_fold_non_consecutive_reduction_dims"}> ({
  ^bb0(%arg0: tensor<?x?xi32>, %arg1: index, %arg2: index):
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index
    %1 = "arith.constant"() <{value = 2 : index}> : () -> index
    %2 = "tensor.expand_shape"(%arg0, %arg1, %arg2) <{reassociation = [[0, 1], [2, 3]], static_output_shape = array<i64: -9223372036854775808, 4, -9223372036854775808, 8>}> : (tensor<?x?xi32>, index, index) -> tensor<?x4x?x8xi32>
    %3 = "tensor.empty"() : () -> tensor<i32>
    %4 = "linalg.generic"(%2, %3) <{indexing_maps = [#map, #map1], iterator_types = [#linalg.iterator_type<reduction>, #linalg.iterator_type<reduction>, #linalg.iterator_type<reduction>, #linalg.iterator_type<reduction>], operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg3: i32, %arg4: i32):
      %5 = "linalg.index"() <{dim = 0 : i64}> : () -> index
      %6 = "linalg.index"() <{dim = 1 : i64}> : () -> index
      %7 = "linalg.index"() <{dim = 2 : i64}> : () -> index
      %8 = "linalg.index"() <{dim = 3 : i64}> : () -> index
      %9 = "arith.addi"(%5, %6) <{overflowFlags = #arith.overflow<none>}> : (index, index) -> index
      %10 = "arith.addi"(%9, %7) <{overflowFlags = #arith.overflow<none>}> : (index, index) -> index
      %11 = "arith.addi"(%10, %8) <{overflowFlags = #arith.overflow<none>}> : (index, index) -> index
      %12 = "arith.index_cast"(%11) : (index) -> i32
      "linalg.yield"(%12) : (i32) -> ()
    }) : (tensor<?x4x?x8xi32>, tensor<i32>) -> tensor<i32>
    "func.return"(%4) : (tensor<i32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<2x12x5x336x9xi32>) -> tensor<8x3x4x17x6x7x8x14xi32>, sym_name = "fuse_by_collapsing_pad"}> ({
  ^bb0(%arg0: tensor<2x12x5x336x9xi32>):
    %0 = "tensor.expand_shape"(%arg0) <{reassociation = [[0], [1, 2], [3], [4, 5, 6], [7]], static_output_shape = array<i64: 2, 3, 4, 5, 6, 7, 8, 9>}> : (tensor<2x12x5x336x9xi32>) -> tensor<2x3x4x5x6x7x8x9xi32>
    %1 = "arith.constant"() <{value = 0 : i32}> : () -> i32
    %2 = "tensor.pad"(%0) <{operandSegmentSizes = array<i32: 1, 0, 0>, static_high = array<i64: 5, 0, 0, 4, 0, 0, 0, 2>, static_low = array<i64: 1, 0, 0, 8, 0, 0, 0, 3>}> ({
    ^bb0(%arg1: index, %arg2: index, %arg3: index, %arg4: index, %arg5: index, %arg6: index, %arg7: index, %arg8: index):
      "tensor.yield"(%1) : (i32) -> ()
    }) : (tensor<2x3x4x5x6x7x8x9xi32>) -> tensor<8x3x4x17x6x7x8x14xi32>
    "func.return"(%2) : (tensor<8x3x4x17x6x7x8x14xi32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<2x12xi32>) -> tensor<8x3x4xi32>, sym_name = "no_fuse_by_collapsing_pad_non_constant_padding"}> ({
  ^bb0(%arg0: tensor<2x12xi32>):
    %0 = "tensor.expand_shape"(%arg0) <{reassociation = [[0], [1, 2]], static_output_shape = array<i64: 2, 3, 4>}> : (tensor<2x12xi32>) -> tensor<2x3x4xi32>
    %1 = "arith.constant"() <{value = 0 : i32}> : () -> i32
    %2 = "tensor.pad"(%0) <{operandSegmentSizes = array<i32: 1, 0, 0>, static_high = array<i64: 5, 0, 0>, static_low = array<i64: 1, 0, 0>}> ({
    ^bb0(%arg1: index, %arg2: index, %arg3: index):
      %3 = "arith.index_cast"(%arg1) : (index) -> i32
      "tensor.yield"(%3) : (i32) -> ()
    }) : (tensor<2x3x4xi32>) -> tensor<8x3x4xi32>
    "func.return"(%2) : (tensor<8x3x4xi32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<2x12x5x336x9xi32>) -> tensor<8x5x4x17x6x7x8x14xi32>, sym_name = "no_fuse_by_collapsing_pad"}> ({
  ^bb0(%arg0: tensor<2x12x5x336x9xi32>):
    %0 = "tensor.expand_shape"(%arg0) <{reassociation = [[0], [1, 2], [3], [4, 5, 6], [7]], static_output_shape = array<i64: 2, 3, 4, 5, 6, 7, 8, 9>}> : (tensor<2x12x5x336x9xi32>) -> tensor<2x3x4x5x6x7x8x9xi32>
    %1 = "arith.constant"() <{value = 0 : i32}> : () -> i32
    %2 = "tensor.pad"(%0) <{operandSegmentSizes = array<i32: 1, 0, 0>, static_high = array<i64: 5, 0, 0, 4, 0, 0, 0, 2>, static_low = array<i64: 1, 2, 0, 8, 0, 0, 0, 3>}> ({
    ^bb0(%arg1: index, %arg2: index, %arg3: index, %arg4: index, %arg5: index, %arg6: index, %arg7: index, %arg8: index):
      "tensor.yield"(%1) : (i32) -> ()
    }) : (tensor<2x3x4x5x6x7x8x9xi32>) -> tensor<8x5x4x17x6x7x8x14xi32>
    "func.return"(%2) : (tensor<8x5x4x17x6x7x8x14xi32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<?x?x?x?xf32>, index, index, index, index, index, index, index, index, index, index) -> tensor<?x?x?x?x?x?xf32>, sym_name = "fuse_by_collapsing_dynamic_pad"}> ({
  ^bb0(%arg0: tensor<?x?x?x?xf32>, %arg1: index, %arg2: index, %arg3: index, %arg4: index, %arg5: index, %arg6: index, %arg7: index, %arg8: index, %arg9: index, %arg10: index):
    %0 = "tensor.expand_shape"(%arg0, %arg1, %arg2, %arg3, %arg4, %arg5, %arg6) <{reassociation = [[0], [1, 2], [3], [4, 5]], static_output_shape = array<i64: -9223372036854775808, -9223372036854775808, -9223372036854775808, -9223372036854775808, -9223372036854775808, -9223372036854775808>}> : (tensor<?x?x?x?xf32>, index, index, index, index, index, index) -> tensor<?x?x?x?x?x?xf32>
    %1 = "arith.constant"() <{value = 0.000000e+00 : f32}> : () -> f32
    %2 = "tensor.pad"(%0, %arg7, %arg8, %arg9, %arg10) <{operandSegmentSizes = array<i32: 1, 2, 2>, static_high = array<i64: -9223372036854775808, 0, 0, -9223372036854775808, 0, 0>, static_low = array<i64: -9223372036854775808, 0, 0, -9223372036854775808, 0, 0>}> ({
    ^bb0(%arg11: index, %arg12: index, %arg13: index, %arg14: index, %arg15: index, %arg16: index):
      "tensor.yield"(%1) : (f32) -> ()
    }) : (tensor<?x?x?x?x?x?xf32>, index, index, index, index) -> tensor<?x?x?x?x?x?xf32>
    "func.return"(%2) : (tensor<?x?x?x?x?x?xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<2x3x4x5x6x7x8x9xi32>) -> tensor<8x12x17x336x14xi32>, sym_name = "collapse_shape_with_producer_pad"}> ({
  ^bb0(%arg0: tensor<2x3x4x5x6x7x8x9xi32>):
    %0 = "arith.constant"() <{value = 0 : i32}> : () -> i32
    %1 = "tensor.pad"(%arg0) <{operandSegmentSizes = array<i32: 1, 0, 0>, static_high = array<i64: 5, 0, 0, 4, 0, 0, 0, 2>, static_low = array<i64: 1, 0, 0, 8, 0, 0, 0, 3>}> ({
    ^bb0(%arg1: index, %arg2: index, %arg3: index, %arg4: index, %arg5: index, %arg6: index, %arg7: index, %arg8: index):
      "tensor.yield"(%0) : (i32) -> ()
    }) : (tensor<2x3x4x5x6x7x8x9xi32>) -> tensor<8x3x4x17x6x7x8x14xi32>
    %2 = "tensor.collapse_shape"(%1) <{reassociation = [[0], [1, 2], [3], [4, 5, 6], [7]]}> : (tensor<8x3x4x17x6x7x8x14xi32>) -> tensor<8x12x17x336x14xi32>
    "func.return"(%2) : (tensor<8x12x17x336x14xi32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<?x?x?x?x?x?xf32>, index, index, index, index) -> tensor<?x?x?x?xf32>, sym_name = "collapse_shape_with_producer_pad_dynamic"}> ({
  ^bb0(%arg0: tensor<?x?x?x?x?x?xf32>, %arg1: index, %arg2: index, %arg3: index, %arg4: index):
    %0 = "arith.constant"() <{value = 0.000000e+00 : f32}> : () -> f32
    %1 = "tensor.pad"(%arg0, %arg1, %arg2, %arg3, %arg4) <{operandSegmentSizes = array<i32: 1, 2, 2>, static_high = array<i64: -9223372036854775808, 0, 0, -9223372036854775808, 0, 0>, static_low = array<i64: -9223372036854775808, 0, 0, -9223372036854775808, 0, 0>}> ({
    ^bb0(%arg5: index, %arg6: index, %arg7: index, %arg8: index, %arg9: index, %arg10: index):
      "tensor.yield"(%0) : (f32) -> ()
    }) : (tensor<?x?x?x?x?x?xf32>, index, index, index, index) -> tensor<?x?x?x?x?x?xf32>
    %2 = "tensor.collapse_shape"(%1) <{reassociation = [[0], [1, 2], [3], [4, 5]]}> : (tensor<?x?x?x?x?x?xf32>) -> tensor<?x?x?x?xf32>
    "func.return"(%2) : (tensor<?x?x?x?xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<2x3x4xi32>) -> tensor<8x12xi32>, sym_name = "collapse_shape_with_producer_pad_non_constant_padding"}> ({
  ^bb0(%arg0: tensor<2x3x4xi32>):
    %0 = "arith.constant"() <{value = 0 : i32}> : () -> i32
    %1 = "tensor.pad"(%arg0) <{operandSegmentSizes = array<i32: 1, 0, 0>, static_high = array<i64: 5, 0, 0>, static_low = array<i64: 1, 0, 0>}> ({
    ^bb0(%arg1: index, %arg2: index, %arg3: index):
      %3 = "arith.index_cast"(%arg1) : (index) -> i32
      "tensor.yield"(%3) : (i32) -> ()
    }) : (tensor<2x3x4xi32>) -> tensor<8x3x4xi32>
    %2 = "tensor.collapse_shape"(%1) <{reassociation = [[0], [1, 2]]}> : (tensor<8x3x4xi32>) -> tensor<8x12xi32>
    "func.return"(%2) : (tensor<8x12xi32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1, d2, d3, d4, d5, d6, d7) -> (d0, d1, d2, d3, d4, d5, d6, d7)>
#map1 = affine_map<(d0, d1, d2, d3, d4, d5, d6, d7) -> (d0, d1, d2)>
#map2 = affine_map<(d0, d1, d2, d3, d4, d5, d6, d7) -> (d3, d4, d5, d6)>
#map3 = affine_map<(d0, d1, d2, d3, d4, d5, d6, d7) -> (d1, d2, d0, d7, d3, d4, d5, d6)>
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<2x3x4x5x6x7x8x9xi32>, tensor<2x3x4xi32>, tensor<5x6x7x8xi32>) -> (tensor<2x12x5x336x9xi32>, tensor<12x2x9x5x336xi32>), sym_name = "fuse_by_collapsing_bubblecollapse"}> ({
  ^bb0(%arg0: tensor<2x3x4x5x6x7x8x9xi32>, %arg1: tensor<2x3x4xi32>, %arg2: tensor<5x6x7x8xi32>):
    %0 = "tensor.empty"() : () -> tensor<2x3x4x5x6x7x8x9xi32>
    %1 = "tensor.empty"() : () -> tensor<3x4x2x9x5x6x7x8xi32>
    %2:2 = "linalg.generic"(%arg0, %arg1, %arg2, %0, %1) <{indexing_maps = [#map, #map1, #map2, #map, #map3], iterator_types = [#linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>], operandSegmentSizes = array<i32: 3, 2>}> ({
    ^bb0(%arg3: i32, %arg4: i32, %arg5: i32, %arg6: i32, %arg7: i32):
      %5 = "arith.addi"(%arg3, %arg4) <{overflowFlags = #arith.overflow<none>}> : (i32, i32) -> i32
      %6 = "arith.addi"(%5, %arg5) <{overflowFlags = #arith.overflow<none>}> : (i32, i32) -> i32
      "linalg.yield"(%6, %6) : (i32, i32) -> ()
    }) : (tensor<2x3x4x5x6x7x8x9xi32>, tensor<2x3x4xi32>, tensor<5x6x7x8xi32>, tensor<2x3x4x5x6x7x8x9xi32>, tensor<3x4x2x9x5x6x7x8xi32>) -> (tensor<2x3x4x5x6x7x8x9xi32>, tensor<3x4x2x9x5x6x7x8xi32>)
    %3 = "tensor.collapse_shape"(%2#0) <{reassociation = [[0], [1, 2], [3], [4, 5, 6], [7]]}> : (tensor<2x3x4x5x6x7x8x9xi32>) -> tensor<2x12x5x336x9xi32>
    %4 = "tensor.collapse_shape"(%2#1) <{reassociation = [[0, 1], [2], [3], [4], [5, 6, 7]]}> : (tensor<3x4x2x9x5x6x7x8xi32>) -> tensor<12x2x9x5x336xi32>
    "func.return"(%3, %4) : (tensor<2x12x5x336x9xi32>, tensor<12x2x9x5x336xi32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1, d2, d3, d4, d5, d6, d7) -> (d0, d1, d2, d3, d4, d5, d6, d7)>
#map1 = affine_map<(d0, d1, d2, d3, d4, d5, d6, d7) -> (d0, d1, d2)>
#map2 = affine_map<(d0, d1, d2, d3, d4, d5, d6, d7) -> (d3, d4, d5, d6)>
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<2x3x4x5x6x7x8x9xi32>, tensor<2x3x4xi32>, tensor<5x6x7x8xi32>) -> tensor<2x12x5x336x9xi32>, sym_name = "fuse_by_collapsing_indexing_op_bubblecollapse"}> ({
  ^bb0(%arg0: tensor<2x3x4x5x6x7x8x9xi32>, %arg1: tensor<2x3x4xi32>, %arg2: tensor<5x6x7x8xi32>):
    %0 = "tensor.empty"() : () -> tensor<2x3x4x5x6x7x8x9xi32>
    %1 = "linalg.generic"(%arg0, %arg1, %arg2, %0) <{indexing_maps = [#map, #map1, #map2, #map], iterator_types = [#linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>], operandSegmentSizes = array<i32: 3, 1>}> ({
    ^bb0(%arg3: i32, %arg4: i32, %arg5: i32, %arg6: i32):
      %3 = "linalg.index"() <{dim = 0 : i64}> : () -> index
      %4 = "linalg.index"() <{dim = 1 : i64}> : () -> index
      %5 = "arith.addi"(%3, %4) <{overflowFlags = #arith.overflow<none>}> : (index, index) -> index
      %6 = "linalg.index"() <{dim = 2 : i64}> : () -> index
      %7 = "arith.addi"(%5, %6) <{overflowFlags = #arith.overflow<none>}> : (index, index) -> index
      %8 = "linalg.index"() <{dim = 3 : i64}> : () -> index
      %9 = "arith.addi"(%7, %8) <{overflowFlags = #arith.overflow<none>}> : (index, index) -> index
      %10 = "linalg.index"() <{dim = 4 : i64}> : () -> index
      %11 = "arith.addi"(%9, %10) <{overflowFlags = #arith.overflow<none>}> : (index, index) -> index
      %12 = "linalg.index"() <{dim = 5 : i64}> : () -> index
      %13 = "arith.addi"(%11, %12) <{overflowFlags = #arith.overflow<none>}> : (index, index) -> index
      %14 = "linalg.index"() <{dim = 6 : i64}> : () -> index
      %15 = "arith.addi"(%13, %14) <{overflowFlags = #arith.overflow<none>}> : (index, index) -> index
      %16 = "linalg.index"() <{dim = 7 : i64}> : () -> index
      %17 = "arith.addi"(%15, %16) <{overflowFlags = #arith.overflow<none>}> : (index, index) -> index
      %18 = "arith.index_cast"(%17) : (index) -> i32
      "linalg.yield"(%18) : (i32) -> ()
    }) : (tensor<2x3x4x5x6x7x8x9xi32>, tensor<2x3x4xi32>, tensor<5x6x7x8xi32>, tensor<2x3x4x5x6x7x8x9xi32>) -> tensor<2x3x4x5x6x7x8x9xi32>
    %2 = "tensor.collapse_shape"(%1) <{reassociation = [[0], [1, 2], [3], [4, 5, 6], [7]]}> : (tensor<2x3x4x5x6x7x8x9xi32>) -> tensor<2x12x5x336x9xi32>
    "func.return"(%2) : (tensor<2x12x5x336x9xi32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1, d2, d3, d4, d5, d6, d7) -> (d7, d5, d6, d0, d1, d2, d3, d4)>
#map1 = affine_map<(d0, d1, d2, d3, d4, d5, d6, d7) -> (d5, d6, d0)>
#map2 = affine_map<(d0, d1, d2, d3, d4, d5, d6, d7) -> (d4, d1, d2, d3)>
#map3 = affine_map<(d0, d1, d2, d3, d4, d5, d6, d7) -> (d0, d1, d2, d3, d4, d5, d6, d7)>
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<9x7x8x2x3x4x5x6xi32>, tensor<7x8x2xi32>, tensor<6x3x4x5xi32>) -> tensor<2x60x6x56x9xi32>, sym_name = "fuse_by_collapsing_change_reshape_order_bubblecollapse"}> ({
  ^bb0(%arg0: tensor<9x7x8x2x3x4x5x6xi32>, %arg1: tensor<7x8x2xi32>, %arg2: tensor<6x3x4x5xi32>):
    %0 = "tensor.empty"() : () -> tensor<2x3x4x5x6x7x8x9xi32>
    %1 = "linalg.generic"(%arg0, %arg1, %arg2, %0) <{indexing_maps = [#map, #map1, #map2, #map3], iterator_types = [#linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>], operandSegmentSizes = array<i32: 3, 1>}> ({
    ^bb0(%arg3: i32, %arg4: i32, %arg5: i32, %arg6: i32):
      %3 = "arith.addi"(%arg3, %arg4) <{overflowFlags = #arith.overflow<none>}> : (i32, i32) -> i32
      %4 = "arith.addi"(%3, %arg5) <{overflowFlags = #arith.overflow<none>}> : (i32, i32) -> i32
      "linalg.yield"(%4) : (i32) -> ()
    }) : (tensor<9x7x8x2x3x4x5x6xi32>, tensor<7x8x2xi32>, tensor<6x3x4x5xi32>, tensor<2x3x4x5x6x7x8x9xi32>) -> tensor<2x3x4x5x6x7x8x9xi32>
    %2 = "tensor.collapse_shape"(%1) <{reassociation = [[0], [1, 2, 3], [4], [5, 6], [7]]}> : (tensor<2x3x4x5x6x7x8x9xi32>) -> tensor<2x60x6x56x9xi32>
    "func.return"(%2) : (tensor<2x60x6x56x9xi32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1) -> (d0, d1)>
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<?x?xf32>, index, index) -> (tensor<?xf32>, index), sym_name = "fuse_by_collapsing_correct_insertion"}> ({
  ^bb0(%arg0: tensor<?x?xf32>, %arg1: index, %arg2: index):
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index
    %1 = "tensor.empty"(%arg2, %arg1) : (index, index) -> tensor<?x?xf32>
    %2 = "linalg.generic"(%arg0, %1) <{indexing_maps = [#map, #map], iterator_types = [#linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>], operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg3: f32, %arg4: f32):
      %5 = "arith.negf"(%arg3) <{fastmath = #arith.fastmath<none>}> : (f32) -> f32
      "linalg.yield"(%5) : (f32) -> ()
    }) : (tensor<?x?xf32>, tensor<?x?xf32>) -> tensor<?x?xf32>
    %3 = "tensor.dim"(%2, %0) : (tensor<?x?xf32>, index) -> index
    %4 = "tensor.collapse_shape"(%2) <{reassociation = [[0, 1]]}> : (tensor<?x?xf32>) -> tensor<?xf32>
    "func.return"(%4, %3) : (tensor<?xf32>, index) -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1, d2, d3, d4) -> (d0, d1, d2, d3, d4)>
#map1 = affine_map<(d0, d1, d2, d3, d4) -> (d0, d3, d4, d1, d2)>
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<4x?x32x128x192xf16>, tensor<4x128x192x?x32xf32>) -> tensor<512x192x?xf32>, sym_name = "partial_fuse_by_collapsing"}> ({
  ^bb0(%arg0: tensor<4x?x32x128x192xf16>, %arg1: tensor<4x128x192x?x32xf32>):
    %0 = "linalg.generic"(%arg0, %arg1) <{indexing_maps = [#map, #map1], iterator_types = [#linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>], operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg2: f16, %arg3: f32):
      "linalg.yield"(%arg3) : (f32) -> ()
    }) : (tensor<4x?x32x128x192xf16>, tensor<4x128x192x?x32xf32>) -> tensor<4x128x192x?x32xf32>
    %1 = "tensor.collapse_shape"(%0) <{reassociation = [[0, 1], [2], [3, 4]]}> : (tensor<4x128x192x?x32xf32>) -> tensor<512x192x?xf32>
    "func.return"(%1) : (tensor<512x192x?xf32>) -> ()
  }) : () -> ()
}) : () -> ()

