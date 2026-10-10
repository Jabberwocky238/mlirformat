#map = affine_map<(d0, d1, d2) -> (d2, d0, d1)>
#map1 = affine_map<(d0, d1, d2) -> (d1, d2, d0)>
#map2 = affine_map<(d0, d1, d2) -> ()>
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<?x?x4x?xf32>, tensor<?x?x?xf32>, f32) -> tensor<?x?x?xf32>, sym_name = "generic_op_reshape_producer_fusion"}> ({
  ^bb0(%arg0: tensor<?x?x4x?xf32>, %arg1: tensor<?x?x?xf32>, %arg2: f32):
    %0 = "tensor.collapse_shape"(%arg0) <{reassociation = [[0], [1, 2], [3]]}> : (tensor<?x?x4x?xf32>) -> tensor<?x?x?xf32>
    %1 = "linalg.generic"(%0, %arg1, %arg2, %arg1) <{indexing_maps = [#map, #map1, #map2, #map1], iterator_types = [#linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>], operandSegmentSizes = array<i32: 3, 1>}> ({
    ^bb0(%arg3: f32, %arg4: f32, %arg5: f32, %arg6: f32):
      %2 = "arith.mulf"(%arg3, %arg4) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      %3 = "arith.addf"(%2, %arg5) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%3) : (f32) -> ()
    }) : (tensor<?x?x?xf32>, tensor<?x?x?xf32>, f32, tensor<?x?x?xf32>) -> tensor<?x?x?xf32>
    "func.return"(%1) : (tensor<?x?x?xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1) -> (d0, d1)>
#map1 = affine_map<(d0, d1) -> ()>
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<?x?xf32>, tensor<?x?xf32>, f32, index, index) -> tensor<?x4x?x5xf32>, sym_name = "generic_op_reshape_consumer_fusion"}> ({
  ^bb0(%arg0: tensor<?x?xf32>, %arg1: tensor<?x?xf32>, %arg2: f32, %arg3: index, %arg4: index):
    %0 = "linalg.generic"(%arg0, %arg1, %arg2, %arg0) <{indexing_maps = [#map, #map, #map1, #map], iterator_types = [#linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>], operandSegmentSizes = array<i32: 3, 1>}> ({
    ^bb0(%arg5: f32, %arg6: f32, %arg7: f32, %arg8: f32):
      %2 = "arith.mulf"(%arg5, %arg6) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      %3 = "arith.addf"(%2, %arg7) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%3) : (f32) -> ()
    }) : (tensor<?x?xf32>, tensor<?x?xf32>, f32, tensor<?x?xf32>) -> tensor<?x?xf32>
    %1 = "tensor.expand_shape"(%0, %arg3, %arg4) <{reassociation = [[0], [1, 2, 3]], static_output_shape = array<i64: -9223372036854775808, 4, -9223372036854775808, 5>}> : (tensor<?x?xf32>, index, index) -> tensor<?x4x?x5xf32>
    "func.return"(%1) : (tensor<?x4x?x5xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1, d2) -> (d1, d0, d2)>
#map1 = affine_map<(d0, d1, d2) -> (d1, d2)>
#map2 = affine_map<(d0, d1, d2) -> (d0, d2, d1)>
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<?x?x?xf32>, tensor<?x?xf32>, index, index, index) -> tensor<?x2x?x3x4x?xf32>, sym_name = "reshape_as_consumer_permutation"}> ({
  ^bb0(%arg0: tensor<?x?x?xf32>, %arg1: tensor<?x?xf32>, %arg2: index, %arg3: index, %arg4: index):
    %0 = "linalg.generic"(%arg0, %arg1, %arg0) <{indexing_maps = [#map, #map1, #map2], iterator_types = [#linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>], operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg5: f32, %arg6: f32, %arg7: f32):
      %2 = "arith.addf"(%arg5, %arg6) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%2) : (f32) -> ()
    }) : (tensor<?x?x?xf32>, tensor<?x?xf32>, tensor<?x?x?xf32>) -> tensor<?x?x?xf32>
    %1 = "tensor.expand_shape"(%0, %arg2, %arg3, %arg4) <{reassociation = [[0, 1], [2], [3, 4, 5]], static_output_shape = array<i64: -9223372036854775808, 2, -9223372036854775808, 3, 4, -9223372036854775808>}> : (tensor<?x?x?xf32>, index, index, index) -> tensor<?x2x?x3x4x?xf32>
    "func.return"(%1) : (tensor<?x2x?x3x4x?xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1) -> (d0, d1)>
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<264x4xf32>) -> tensor<8x33x4xf32>, sym_name = "generic_op_reshape_consumer_static"}> ({
  ^bb0(%arg0: tensor<264x4xf32>):
    %0 = "arith.constant"() <{value = dense<2.000000e+00> : tensor<264x4xf32>}> : () -> tensor<264x4xf32>
    %1 = "tensor.empty"() : () -> tensor<264x4xf32>
    %2 = "linalg.generic"(%arg0, %0, %1) <{indexing_maps = [#map, #map, #map], iterator_types = [#linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>], operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg1: f32, %arg2: f32, %arg3: f32):
      %4 = "arith.mulf"(%arg1, %arg2) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%4) : (f32) -> ()
    }) : (tensor<264x4xf32>, tensor<264x4xf32>, tensor<264x4xf32>) -> tensor<264x4xf32>
    %3 = "tensor.expand_shape"(%2) <{reassociation = [[0, 1], [2]], static_output_shape = array<i64: 8, 33, 4>}> : (tensor<264x4xf32>) -> tensor<8x33x4xf32>
    "func.return"(%3) : (tensor<8x33x4xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<4x210x6xf32>) -> tensor<2x3x4x5x6x7xf32>, sym_name = "reshape_as_consumer_transpose"}> ({
  ^bb0(%arg0: tensor<4x210x6xf32>):
    %0 = "tensor.empty"() : () -> tensor<6x4x210xf32>
    %1 = "linalg.transpose"(%arg0, %0) <{permutation = array<i64: 2, 0, 1>}> ({
    ^bb0(%arg1: f32, %arg2: f32):
      "linalg.yield"(%arg1) : (f32) -> ()
    }) : (tensor<4x210x6xf32>, tensor<6x4x210xf32>) -> tensor<6x4x210xf32>
    %2 = "tensor.expand_shape"(%1) <{reassociation = [[0, 1], [2], [3, 4, 5]], static_output_shape = array<i64: 2, 3, 4, 5, 6, 7>}> : (tensor<6x4x210xf32>) -> tensor<2x3x4x5x6x7xf32>
    "func.return"(%2) : (tensor<2x3x4x5x6x7xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1, d2) -> (d2, d0, d1)>
#map1 = affine_map<(d0, d1, d2) -> (d1, d2, d0)>
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<?x?x4x?xi32>, tensor<?x?x?xi32>) -> tensor<?x?x?xi32>, sym_name = "indexed_consumer_reshape_producer_fusion"}> ({
  ^bb0(%arg0: tensor<?x?x4x?xi32>, %arg1: tensor<?x?x?xi32>):
    %0 = "tensor.collapse_shape"(%arg0) <{reassociation = [[0], [1, 2], [3]]}> : (tensor<?x?x4x?xi32>) -> tensor<?x?x?xi32>
    %1 = "linalg.generic"(%0, %arg1, %0) <{indexing_maps = [#map, #map1, #map1], iterator_types = [#linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>], operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg2: i32, %arg3: i32, %arg4: i32):
      %2 = "linalg.index"() <{dim = 0 : i64}> : () -> index
      %3 = "linalg.index"() <{dim = 1 : i64}> : () -> index
      %4 = "linalg.index"() <{dim = 2 : i64}> : () -> index
      %5 = "arith.muli"(%arg2, %arg3) <{overflowFlags = #arith.overflow<none>}> : (i32, i32) -> i32
      %6 = "arith.index_cast"(%2) : (index) -> i32
      %7 = "arith.addi"(%5, %6) <{overflowFlags = #arith.overflow<none>}> : (i32, i32) -> i32
      %8 = "arith.index_cast"(%3) : (index) -> i32
      %9 = "arith.addi"(%7, %8) <{overflowFlags = #arith.overflow<none>}> : (i32, i32) -> i32
      %10 = "arith.index_cast"(%4) : (index) -> i32
      %11 = "arith.addi"(%9, %10) <{overflowFlags = #arith.overflow<none>}> : (i32, i32) -> i32
      "linalg.yield"(%11) : (i32) -> ()
    }) : (tensor<?x?x?xi32>, tensor<?x?x?xi32>, tensor<?x?x?xi32>) -> tensor<?x?x?xi32>
    "func.return"(%1) : (tensor<?x?x?xi32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1) -> (d0, d1)>
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<?x?xi32>, tensor<?x?xi32>, index, index) -> tensor<?x?x4x5xi32>, sym_name = "indexed_producer_reshape_consumer_fusion"}> ({
  ^bb0(%arg0: tensor<?x?xi32>, %arg1: tensor<?x?xi32>, %arg2: index, %arg3: index):
    %0 = "linalg.generic"(%arg0, %arg1, %arg0) <{indexing_maps = [#map, #map, #map], iterator_types = [#linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>], operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg4: i32, %arg5: i32, %arg6: i32):
      %2 = "linalg.index"() <{dim = 0 : i64}> : () -> index
      %3 = "linalg.index"() <{dim = 1 : i64}> : () -> index
      %4 = "arith.muli"(%arg4, %arg5) <{overflowFlags = #arith.overflow<none>}> : (i32, i32) -> i32
      %5 = "arith.index_cast"(%2) : (index) -> i32
      %6 = "arith.addi"(%4, %5) <{overflowFlags = #arith.overflow<none>}> : (i32, i32) -> i32
      %7 = "arith.index_cast"(%3) : (index) -> i32
      %8 = "arith.addi"(%6, %7) <{overflowFlags = #arith.overflow<none>}> : (i32, i32) -> i32
      "linalg.yield"(%8) : (i32) -> ()
    }) : (tensor<?x?xi32>, tensor<?x?xi32>, tensor<?x?xi32>) -> tensor<?x?xi32>
    %1 = "tensor.expand_shape"(%0, %arg2, %arg3) <{reassociation = [[0], [1, 2, 3]], static_output_shape = array<i64: -9223372036854775808, -9223372036854775808, 4, 5>}> : (tensor<?x?xi32>, index, index) -> tensor<?x?x4x5xi32>
    "func.return"(%1) : (tensor<?x?x4x5xi32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1, d2) -> (d1, d0, d2)>
#map1 = affine_map<(d0, d1, d2) -> (d1, d2)>
#map2 = affine_map<(d0, d1, d2) -> (d0, d2, d1)>
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<210x6x4xi32>, tensor<210x4xi32>) -> tensor<2x3x4x5x6x7xi32>, sym_name = "reshape_as_consumer_permutation"}> ({
  ^bb0(%arg0: tensor<210x6x4xi32>, %arg1: tensor<210x4xi32>):
    %0 = "tensor.empty"() : () -> tensor<6x4x210xi32>
    %1 = "linalg.generic"(%arg0, %arg1, %0) <{indexing_maps = [#map, #map1, #map2], iterator_types = [#linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>], operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg2: i32, %arg3: i32, %arg4: i32):
      %3 = "linalg.index"() <{dim = 0 : i64}> : () -> index
      %4 = "linalg.index"() <{dim = 1 : i64}> : () -> index
      %5 = "linalg.index"() <{dim = 2 : i64}> : () -> index
      %6 = "arith.addi"(%arg2, %arg3) <{overflowFlags = #arith.overflow<none>}> : (i32, i32) -> i32
      %7 = "arith.index_cast"(%3) : (index) -> i32
      %8 = "arith.addi"(%6, %7) <{overflowFlags = #arith.overflow<none>}> : (i32, i32) -> i32
      %9 = "arith.index_cast"(%4) : (index) -> i32
      %10 = "arith.addi"(%8, %9) <{overflowFlags = #arith.overflow<none>}> : (i32, i32) -> i32
      %11 = "arith.index_cast"(%5) : (index) -> i32
      %12 = "arith.addi"(%10, %11) <{overflowFlags = #arith.overflow<none>}> : (i32, i32) -> i32
      "linalg.yield"(%12) : (i32) -> ()
    }) : (tensor<210x6x4xi32>, tensor<210x4xi32>, tensor<6x4x210xi32>) -> tensor<6x4x210xi32>
    %2 = "tensor.expand_shape"(%1) <{reassociation = [[0, 1], [2], [3, 4, 5]], static_output_shape = array<i64: 2, 3, 4, 5, 6, 7>}> : (tensor<6x4x210xi32>) -> tensor<2x3x4x5x6x7xi32>
    "func.return"(%2) : (tensor<2x3x4x5x6x7xi32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
^bb0:
}) : () -> ()

// -----
#map = affine_map<(d0, d1, d2) -> (d0, d1)>
#map1 = affine_map<(d0, d1, d2) -> (d0, d1, d2)>
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<33x8x?xi32>, tensor<264x?x4xi32>) -> tensor<264x?x4xi32>, sym_name = "reshape_as_producer_projected_permutation"}> ({
  ^bb0(%arg0: tensor<33x8x?xi32>, %arg1: tensor<264x?x4xi32>):
    %0 = "tensor.collapse_shape"(%arg0) <{reassociation = [[0, 1], [2]]}> : (tensor<33x8x?xi32>) -> tensor<264x?xi32>
    %1 = "linalg.generic"(%0, %arg1) <{indexing_maps = [#map, #map1], iterator_types = [#linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>], operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg2: i32, %arg3: i32):
      %2 = "linalg.index"() <{dim = 0 : i64}> : () -> index
      %3 = "linalg.index"() <{dim = 1 : i64}> : () -> index
      %4 = "linalg.index"() <{dim = 2 : i64}> : () -> index
      %5 = "arith.index_cast"(%2) : (index) -> i32
      %6 = "arith.addi"(%arg2, %5) <{overflowFlags = #arith.overflow<none>}> : (i32, i32) -> i32
      %7 = "arith.index_cast"(%3) : (index) -> i32
      %8 = "arith.addi"(%6, %7) <{overflowFlags = #arith.overflow<none>}> : (i32, i32) -> i32
      %9 = "arith.index_cast"(%4) : (index) -> i32
      %10 = "arith.addi"(%8, %9) <{overflowFlags = #arith.overflow<none>}> : (i32, i32) -> i32
      "linalg.yield"(%10) : (i32) -> ()
    }) : (tensor<264x?xi32>, tensor<264x?x4xi32>) -> tensor<264x?x4xi32>
    "func.return"(%1) : (tensor<264x?x4xi32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1) -> (d0, d1)>
#map1 = affine_map<(d0, d1) -> (d1, d0)>
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<?x?xf32>, tensor<?x?xf32>, index, index) -> tensor<?x?x4x5xf32>, sym_name = "generic_op_reshape_consumer_fusion_projected"}> ({
  ^bb0(%arg0: tensor<?x?xf32>, %arg1: tensor<?x?xf32>, %arg2: index, %arg3: index):
    %0 = "linalg.generic"(%arg0, %arg1, %arg0) <{indexing_maps = [#map, #map, #map1], iterator_types = [#linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>], operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg4: f32, %arg5: f32, %arg6: f32):
      %2 = "arith.mulf"(%arg4, %arg5) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%2) : (f32) -> ()
    }) : (tensor<?x?xf32>, tensor<?x?xf32>, tensor<?x?xf32>) -> tensor<?x?xf32>
    %1 = "tensor.expand_shape"(%0, %arg2, %arg3) <{reassociation = [[0], [1, 2, 3]], static_output_shape = array<i64: -9223372036854775808, -9223372036854775808, 4, 5>}> : (tensor<?x?xf32>, index, index) -> tensor<?x?x4x5xf32>
    "func.return"(%1) : (tensor<?x?x4x5xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1) -> (d0, d1)>
#map1 = affine_map<(d0, d1) -> (d0)>
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<10x10x20xf32>) -> tensor<100xf32>, sym_name = "fuse_collapse_reduction"}> ({
  ^bb0(%arg0: tensor<10x10x20xf32>):
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index
    %1 = "arith.constant"() <{value = 0.000000e+00 : f32}> : () -> f32
    %2 = "tensor.collapse_shape"(%arg0) <{reassociation = [[0, 1], [2]]}> : (tensor<10x10x20xf32>) -> tensor<100x20xf32>
    %3 = "tensor.empty"() : () -> tensor<100xf32>
    %4 = "linalg.fill"(%1, %3) <{operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg3: f32, %arg4: f32):
      "linalg.yield"(%arg3) : (f32) -> ()
    }) : (f32, tensor<100xf32>) -> tensor<100xf32>
    %5 = "linalg.generic"(%2, %4) <{indexing_maps = [#map, #map1], iterator_types = [#linalg.iterator_type<parallel>, #linalg.iterator_type<reduction>], operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg1: f32, %arg2: f32):
      %6 = "arith.addf"(%arg1, %arg2) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%6) : (f32) -> ()
    }) : (tensor<100x20xf32>, tensor<100xf32>) -> tensor<100xf32>
    "func.return"(%5) : (tensor<100xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0) -> (d0)>
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<?x?xf32>) -> tensor<?xf32>, sym_name = "fuse_dynamic_dims"}> ({
  ^bb0(%arg0: tensor<?x?xf32>):
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index
    %1 = "tensor.collapse_shape"(%arg0) <{reassociation = [[0, 1]]}> : (tensor<?x?xf32>) -> tensor<?xf32>
    %2 = "tensor.dim"(%1, %0) : (tensor<?xf32>, index) -> index
    %3 = "tensor.empty"(%2) : (index) -> tensor<?xf32>
    %4 = "linalg.generic"(%1, %3) <{indexing_maps = [#map, #map], iterator_types = [#linalg.iterator_type<parallel>], operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg1: f32, %arg2: f32):
      %5 = "arith.addf"(%arg1, %arg1) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%5) : (f32) -> ()
    }) : (tensor<?xf32>, tensor<?xf32>) -> tensor<?xf32>
    "func.return"(%4) : (tensor<?xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1, d2) -> (d1, d0, d2)>
#map1 = affine_map<(d0, d1, d2) -> (d1, d2)>
#map2 = affine_map<(d0, d1, d2) -> (d0, d2, d1)>
#map3 = affine_map<(d0, d1, d2) -> (d2, d0, d1)>
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<?x?x?xf32>, tensor<?x?xf32>, index, index, index, index, index) -> (tensor<?x2x?x3x4x?xf32>, tensor<?x?x2x3x4x?xf32>), sym_name = "reshape_as_consumer_permutation_with_multiple_results"}> ({
  ^bb0(%arg0: tensor<?x?x?xf32>, %arg1: tensor<?x?xf32>, %arg2: index, %arg3: index, %arg4: index, %arg5: index, %arg6: index):
    %0:2 = "linalg.generic"(%arg0, %arg1, %arg0, %arg0) <{indexing_maps = [#map, #map1, #map2, #map3], iterator_types = [#linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>], operandSegmentSizes = array<i32: 2, 2>}> ({
    ^bb0(%arg7: f32, %arg8: f32, %arg9: f32, %arg10: f32):
      %3 = "arith.addf"(%arg7, %arg8) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%3, %3) : (f32, f32) -> ()
    }) : (tensor<?x?x?xf32>, tensor<?x?xf32>, tensor<?x?x?xf32>, tensor<?x?x?xf32>) -> (tensor<?x?x?xf32>, tensor<?x?x?xf32>)
    %1 = "tensor.expand_shape"(%0#0, %arg2, %arg3, %arg4) <{reassociation = [[0, 1], [2], [3, 4, 5]], static_output_shape = array<i64: -9223372036854775808, 2, -9223372036854775808, 3, 4, -9223372036854775808>}> : (tensor<?x?x?xf32>, index, index, index) -> tensor<?x2x?x3x4x?xf32>
    %2 = "tensor.expand_shape"(%0#1, %arg5, %arg6, %arg4) <{reassociation = [[0], [1, 2], [3, 4, 5]], static_output_shape = array<i64: -9223372036854775808, -9223372036854775808, 2, 3, 4, -9223372036854775808>}> : (tensor<?x?x?xf32>, index, index, index) -> tensor<?x?x2x3x4x?xf32>
    "func.return"(%1, %2) : (tensor<?x2x?x3x4x?xf32>, tensor<?x?x2x3x4x?xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1) -> (d1)>
#map1 = affine_map<(d0, d1) -> (d0, d1)>
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<512xf32>, tensor<512xf32>, tensor<512xf32>, tensor<200x512xf32>) -> tensor<25x8x1x512xf32>, sym_name = "multi_result_op_expansion"}> ({
  ^bb0(%arg0: tensor<512xf32>, %arg1: tensor<512xf32>, %arg2: tensor<512xf32>, %arg3: tensor<200x512xf32>):
    %0:2 = "linalg.generic"(%arg0, %arg1, %arg2, %arg3) <{indexing_maps = [#map, #map, #map, #map1], iterator_types = [#linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>], operandSegmentSizes = array<i32: 2, 2>}> ({
    ^bb0(%arg4: f32, %arg5: f32, %arg6: f32, %arg7: f32):
      %2 = "arith.addf"(%arg4, %arg5) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%2, %2) : (f32, f32) -> ()
    }) : (tensor<512xf32>, tensor<512xf32>, tensor<512xf32>, tensor<200x512xf32>) -> (tensor<512xf32>, tensor<200x512xf32>)
    %1 = "tensor.expand_shape"(%0#1) <{reassociation = [[0, 1, 2], [3]], static_output_shape = array<i64: 25, 8, 1, 512>}> : (tensor<200x512xf32>) -> tensor<25x8x1x512xf32>
    "func.return"(%1) : (tensor<25x8x1x512xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1, d2) -> (d0, d2)>
#map1 = affine_map<(d0, d1, d2) -> (d1, d2)>
#map2 = affine_map<(d0, d1, d2) -> (d0, d1)>
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<?x?xf32>, tensor<?x?xf32>, tensor<?x?xf32>, index, index) -> tensor<?x?x4x5xf32>, sym_name = "generic_op_reshape_consumer_fusion_reduction"}> ({
  ^bb0(%arg0: tensor<?x?xf32>, %arg1: tensor<?x?xf32>, %arg2: tensor<?x?xf32>, %arg3: index, %arg4: index):
    %0 = "linalg.generic"(%arg0, %arg1, %arg2) <{indexing_maps = [#map, #map1, #map2], iterator_types = [#linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>, #linalg.iterator_type<reduction>], operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg5: f32, %arg6: f32, %arg7: f32):
      %2 = "arith.mulf"(%arg5, %arg6) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%2) : (f32) -> ()
    }) : (tensor<?x?xf32>, tensor<?x?xf32>, tensor<?x?xf32>) -> tensor<?x?xf32>
    %1 = "tensor.expand_shape"(%0, %arg3, %arg4) <{reassociation = [[0], [1, 2, 3]], static_output_shape = array<i64: -9223372036854775808, -9223372036854775808, 4, 5>}> : (tensor<?x?xf32>, index, index) -> tensor<?x?x4x5xf32>
    "func.return"(%1) : (tensor<?x?x4x5xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1, d2) -> (d2, d0)>
#map1 = affine_map<(d0, d1, d2) -> (d0, d1, d2)>
#map2 = affine_map<(d0, d1, d2) -> (d0, d2)>
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<?x7x?x8xf32>, tensor<?x4x?xf32>, tensor<?x?xf32>) -> tensor<?x?xf32>, sym_name = "generic_op_reshape_producer_fusion_with_reduction"}> ({
  ^bb0(%arg0: tensor<?x7x?x8xf32>, %arg1: tensor<?x4x?xf32>, %arg2: tensor<?x?xf32>):
    %0 = "tensor.collapse_shape"(%arg0) <{reassociation = [[0, 1], [2, 3]]}> : (tensor<?x7x?x8xf32>) -> tensor<?x?xf32>
    %1 = "linalg.generic"(%0, %arg1, %arg2) <{indexing_maps = [#map, #map1, #map2], iterator_types = [#linalg.iterator_type<parallel>, #linalg.iterator_type<reduction>, #linalg.iterator_type<parallel>], operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg3: f32, %arg4: f32, %arg5: f32):
      %2 = "arith.mulf"(%arg3, %arg4) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      %3 = "arith.addf"(%2, %arg5) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%3) : (f32) -> ()
    }) : (tensor<?x?xf32>, tensor<?x4x?xf32>, tensor<?x?xf32>) -> tensor<?x?xf32>
    "func.return"(%1) : (tensor<?x?xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<?x?xf32>, tensor<?x?xf32>, tensor<?x?xf32>, index, index) -> tensor<?x?x4x5xf32>, sym_name = "linalg_add_reshape_consumer_fusion"}> ({
  ^bb0(%arg0: tensor<?x?xf32>, %arg1: tensor<?x?xf32>, %arg2: tensor<?x?xf32>, %arg3: index, %arg4: index):
    %0 = "linalg.add"(%arg0, %arg1, %arg2) <{operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg5: f32, %arg6: f32, %arg7: f32):
      %2 = "arith.addf"(%arg5, %arg6) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%2) : (f32) -> ()
    }) : (tensor<?x?xf32>, tensor<?x?xf32>, tensor<?x?xf32>) -> tensor<?x?xf32>
    %1 = "tensor.expand_shape"(%0, %arg3, %arg4) <{reassociation = [[0], [1, 2, 3]], static_output_shape = array<i64: -9223372036854775808, -9223372036854775808, 4, 5>}> : (tensor<?x?xf32>, index, index) -> tensor<?x?x4x5xf32>
    "func.return"(%1) : (tensor<?x?x4x5xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<?x7x?x8xf32>, tensor<?x?xf32>, tensor<?x?xf32>) -> tensor<?x?xf32>, sym_name = "linalg_add_reshape_producer_fusion"}> ({
  ^bb0(%arg0: tensor<?x7x?x8xf32>, %arg1: tensor<?x?xf32>, %arg2: tensor<?x?xf32>):
    %0 = "tensor.collapse_shape"(%arg0) <{reassociation = [[0, 1], [2, 3]]}> : (tensor<?x7x?x8xf32>) -> tensor<?x?xf32>
    %1 = "linalg.add"(%0, %arg1, %arg2) <{operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg3: f32, %arg4: f32, %arg5: f32):
      %2 = "arith.addf"(%arg3, %arg4) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%2) : (f32) -> ()
    }) : (tensor<?x?xf32>, tensor<?x?xf32>, tensor<?x?xf32>) -> tensor<?x?xf32>
    "func.return"(%1) : (tensor<?x?xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<?x7x?x8xf32>, tensor<?x?xf32>) -> tensor<?x?xf32>, sym_name = "linalg_copy_reshape_producer_fusion"}> ({
  ^bb0(%arg0: tensor<?x7x?x8xf32>, %arg1: tensor<?x?xf32>):
    %0 = "tensor.collapse_shape"(%arg0) <{reassociation = [[0, 1], [2, 3]]}> : (tensor<?x7x?x8xf32>) -> tensor<?x?xf32>
    %1 = "linalg.copy"(%0, %arg1) <{operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg2: f32, %arg3: f32):
      "linalg.yield"(%arg2) : (f32) -> ()
    }) : (tensor<?x?xf32>, tensor<?x?xf32>) -> tensor<?x?xf32>
    "func.return"(%1) : (tensor<?x?xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<4x5x6x7x2x3xf32>) -> tensor<6x4x210xf32>, sym_name = "reshape_as_producer_transpose"}> ({
  ^bb0(%arg0: tensor<4x5x6x7x2x3xf32>):
    %0 = "tensor.empty"() : () -> tensor<6x4x210xf32>
    %1 = "tensor.collapse_shape"(%arg0) <{reassociation = [[0], [1, 2, 3], [4, 5]]}> : (tensor<4x5x6x7x2x3xf32>) -> tensor<4x210x6xf32>
    %2 = "linalg.transpose"(%1, %0) <{permutation = array<i64: 2, 0, 1>}> ({
    ^bb0(%arg1: f32, %arg2: f32):
      "linalg.yield"(%arg1) : (f32) -> ()
    }) : (tensor<4x210x6xf32>, tensor<6x4x210xf32>) -> tensor<6x4x210xf32>
    "func.return"(%2) : (tensor<6x4x210xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<2x3x4x5x6x7x8x9xi32>) -> tensor<8x12x17x336x14xi32>, sym_name = "fuse_by_expanding_pad"}> ({
  ^bb0(%arg0: tensor<2x3x4x5x6x7x8x9xi32>):
    %0 = "tensor.collapse_shape"(%arg0) <{reassociation = [[0], [1, 2], [3], [4, 5, 6], [7]]}> : (tensor<2x3x4x5x6x7x8x9xi32>) -> tensor<2x12x5x336x9xi32>
    %1 = "arith.constant"() <{value = 0 : i32}> : () -> i32
    %2 = "tensor.pad"(%0) <{operandSegmentSizes = array<i32: 1, 0, 0>, static_high = array<i64: 5, 0, 4, 0, 2>, static_low = array<i64: 1, 0, 8, 0, 3>}> ({
    ^bb0(%arg1: index, %arg2: index, %arg3: index, %arg4: index, %arg5: index):
      "tensor.yield"(%1) : (i32) -> ()
    }) : (tensor<2x12x5x336x9xi32>) -> tensor<8x12x17x336x14xi32>
    "func.return"(%2) : (tensor<8x12x17x336x14xi32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<2x3x4xi32>) -> tensor<8x12xi32>, sym_name = "no_fuse_by_expanding_pad_non_constant_padding"}> ({
  ^bb0(%arg0: tensor<2x3x4xi32>):
    %0 = "tensor.collapse_shape"(%arg0) <{reassociation = [[0], [1, 2]]}> : (tensor<2x3x4xi32>) -> tensor<2x12xi32>
    %1 = "tensor.pad"(%0) <{operandSegmentSizes = array<i32: 1, 0, 0>, static_high = array<i64: 5, 0>, static_low = array<i64: 1, 0>}> ({
    ^bb0(%arg1: index, %arg2: index):
      %2 = "arith.index_cast"(%arg1) : (index) -> i32
      "tensor.yield"(%2) : (i32) -> ()
    }) : (tensor<2x12xi32>) -> tensor<8x12xi32>
    "func.return"(%1) : (tensor<8x12xi32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<2x3x4x5x6x7x8x9xi32>) -> tensor<8x12x17x339x14xi32>, sym_name = "no_fuse_by_expanding_pad"}> ({
  ^bb0(%arg0: tensor<2x3x4x5x6x7x8x9xi32>):
    %0 = "tensor.collapse_shape"(%arg0) <{reassociation = [[0], [1, 2], [3], [4, 5, 6], [7]]}> : (tensor<2x3x4x5x6x7x8x9xi32>) -> tensor<2x12x5x336x9xi32>
    %1 = "arith.constant"() <{value = 0 : i32}> : () -> i32
    %2 = "tensor.pad"(%0) <{operandSegmentSizes = array<i32: 1, 0, 0>, static_high = array<i64: 5, 0, 4, 3, 2>, static_low = array<i64: 1, 0, 8, 0, 3>}> ({
    ^bb0(%arg1: index, %arg2: index, %arg3: index, %arg4: index, %arg5: index):
      "tensor.yield"(%1) : (i32) -> ()
    }) : (tensor<2x12x5x336x9xi32>) -> tensor<8x12x17x339x14xi32>
    "func.return"(%2) : (tensor<8x12x17x339x14xi32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<?x?x?x?x?x?xi32>, index, index, index, index) -> tensor<?x?x?x?xi32>, sym_name = "fuse_by_expanding_dynamic_pad"}> ({
  ^bb0(%arg0: tensor<?x?x?x?x?x?xi32>, %arg1: index, %arg2: index, %arg3: index, %arg4: index):
    %0 = "tensor.collapse_shape"(%arg0) <{reassociation = [[0], [1, 2], [3], [4, 5]]}> : (tensor<?x?x?x?x?x?xi32>) -> tensor<?x?x?x?xi32>
    %1 = "arith.constant"() <{value = 0 : i32}> : () -> i32
    %2 = "tensor.pad"(%0, %arg1, %arg2, %arg3, %arg4) <{operandSegmentSizes = array<i32: 1, 2, 2>, static_high = array<i64: -9223372036854775808, 0, -9223372036854775808, 0>, static_low = array<i64: -9223372036854775808, 0, -9223372036854775808, 0>}> ({
    ^bb0(%arg5: index, %arg6: index, %arg7: index, %arg8: index):
      "tensor.yield"(%1) : (i32) -> ()
    }) : (tensor<?x?x?x?xi32>, index, index, index, index) -> tensor<?x?x?x?xi32>
    "func.return"(%2) : (tensor<?x?x?x?xi32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<2x12x5x336x9xi32>) -> tensor<8x3x4x17x6x7x8x14xi32>, sym_name = "expand_shape_with_producer_pad"}> ({
  ^bb0(%arg0: tensor<2x12x5x336x9xi32>):
    %0 = "arith.constant"() <{value = 0 : i32}> : () -> i32
    %1 = "tensor.pad"(%arg0) <{operandSegmentSizes = array<i32: 1, 0, 0>, static_high = array<i64: 5, 0, 4, 0, 2>, static_low = array<i64: 1, 0, 8, 0, 3>}> ({
    ^bb0(%arg1: index, %arg2: index, %arg3: index, %arg4: index, %arg5: index):
      "tensor.yield"(%0) : (i32) -> ()
    }) : (tensor<2x12x5x336x9xi32>) -> tensor<8x12x17x336x14xi32>
    %2 = "tensor.expand_shape"(%1) <{reassociation = [[0], [1, 2], [3], [4, 5, 6], [7]], static_output_shape = array<i64: 8, 3, 4, 17, 6, 7, 8, 14>}> : (tensor<8x12x17x336x14xi32>) -> tensor<8x3x4x17x6x7x8x14xi32>
    "func.return"(%2) : (tensor<8x3x4x17x6x7x8x14xi32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<?x?x?x?xf32>, index, index, index, index, index, index, index, index, index, index) -> tensor<?x?x?x?x?x?xf32>, sym_name = "expand_shape_with_producer_pad_dynamic"}> ({
  ^bb0(%arg0: tensor<?x?x?x?xf32>, %arg1: index, %arg2: index, %arg3: index, %arg4: index, %arg5: index, %arg6: index, %arg7: index, %arg8: index, %arg9: index, %arg10: index):
    %0 = "arith.constant"() <{value = 0.000000e+00 : f32}> : () -> f32
    %1 = "tensor.pad"(%arg0, %arg7, %arg8, %arg9, %arg10) <{operandSegmentSizes = array<i32: 1, 2, 2>, static_high = array<i64: -9223372036854775808, 0, -9223372036854775808, 0>, static_low = array<i64: -9223372036854775808, 0, -9223372036854775808, 0>}> ({
    ^bb0(%arg11: index, %arg12: index, %arg13: index, %arg14: index):
      "tensor.yield"(%0) : (f32) -> ()
    }) : (tensor<?x?x?x?xf32>, index, index, index, index) -> tensor<?x?x?x?xf32>
    %2 = "tensor.expand_shape"(%1, %arg1, %arg2, %arg3, %arg4, %arg5, %arg6) <{reassociation = [[0], [1, 2], [3], [4, 5]], static_output_shape = array<i64: -9223372036854775808, -9223372036854775808, -9223372036854775808, -9223372036854775808, -9223372036854775808, -9223372036854775808>}> : (tensor<?x?x?x?xf32>, index, index, index, index, index, index) -> tensor<?x?x?x?x?x?xf32>
    "func.return"(%2) : (tensor<?x?x?x?x?x?xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<2x12xi32>) -> tensor<8x3x4xi32>, sym_name = "expand_shape_with_producer_pad_non_constant_padding"}> ({
  ^bb0(%arg0: tensor<2x12xi32>):
    %0 = "tensor.pad"(%arg0) <{operandSegmentSizes = array<i32: 1, 0, 0>, static_high = array<i64: 5, 0>, static_low = array<i64: 1, 0>}> ({
    ^bb0(%arg1: index, %arg2: index):
      %2 = "arith.index_cast"(%arg1) : (index) -> i32
      "tensor.yield"(%2) : (i32) -> ()
    }) : (tensor<2x12xi32>) -> tensor<8x12xi32>
    %1 = "tensor.expand_shape"(%0) <{reassociation = [[0], [1, 2]], static_output_shape = array<i64: 8, 3, 4>}> : (tensor<8x12xi32>) -> tensor<8x3x4xi32>
    "func.return"(%1) : (tensor<8x3x4xi32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1, d2, d3) -> (d1, d3)>
#map1 = affine_map<(d0, d1, d2, d3) -> (d0, d1, d2, d3)>
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<?x128xf16>, tensor<4x?x32x128xf16>, tensor<4x?x32x128xf16>) -> tensor<4x?x32x8x16xf16>, sym_name = "move_operand_deps"}> ({
  ^bb0(%arg0: tensor<?x128xf16>, %arg1: tensor<4x?x32x128xf16>, %arg2: tensor<4x?x32x128xf16>):
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index
    %1 = "linalg.generic"(%arg0, %arg2) <{indexing_maps = [#map, #map1], iterator_types = [#linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>], operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg3: f16, %arg4: f16):
      %4 = "linalg.index"() <{dim = 0 : i64}> : () -> index
      %5 = "linalg.index"() <{dim = 1 : i64}> : () -> index
      %6 = "linalg.index"() <{dim = 2 : i64}> : () -> index
      %7 = "linalg.index"() <{dim = 3 : i64}> : () -> index
      %8 = "tensor.extract"(%arg1, %4, %5, %6, %7) : (tensor<4x?x32x128xf16>, index, index, index, index) -> f16
      %9 = "arith.addf"(%8, %arg3) <{fastmath = #arith.fastmath<none>}> : (f16, f16) -> f16
      "linalg.yield"(%9) : (f16) -> ()
    }) : (tensor<?x128xf16>, tensor<4x?x32x128xf16>) -> tensor<4x?x32x128xf16>
    %2 = "tensor.dim"(%arg0, %0) : (tensor<?x128xf16>, index) -> index
    %3 = "tensor.expand_shape"(%1, %2) <{reassociation = [[0], [1], [2], [3, 4]], static_output_shape = array<i64: 4, -9223372036854775808, 32, 8, 16>}> : (tensor<4x?x32x128xf16>, index) -> tensor<4x?x32x8x16xf16>
    "func.return"(%3) : (tensor<4x?x32x8x16xf16>) -> ()
  }) : () -> ()
}) : () -> ()

