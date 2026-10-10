"builtin.module"() ({
  "func.func"() <{function_type = (tensor<1x1x1x1x8x32xf32>, tensor<1x1x32x8xf32>) -> tensor<1x1x32x8xf32>, sym_name = "simple_KCRSsr_to_KCRS"}> ({
  ^bb0(%arg0: tensor<1x1x1x1x8x32xf32>, %arg1: tensor<1x1x32x8xf32>):
    %0 = "linalg.unpack"(%arg0, %arg1) <{inner_dims_pos = array<i64: 3, 2>, static_inner_tiles = array<i64: 8, 32>}> : (tensor<1x1x1x1x8x32xf32>, tensor<1x1x32x8xf32>) -> tensor<1x1x32x8xf32>
    "func.return"(%0) : (tensor<1x1x32x8xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<1x1x8x2xf32>, tensor<5x1xf32>) -> tensor<5x1xf32>, sym_name = "simple_unpack_static_tiles"}> ({
  ^bb0(%arg8: tensor<1x1x8x2xf32>, %arg9: tensor<5x1xf32>):
    %6 = "linalg.unpack"(%arg8, %arg9) <{inner_dims_pos = array<i64: 0, 1>, static_inner_tiles = array<i64: 8, 2>}> : (tensor<1x1x8x2xf32>, tensor<5x1xf32>) -> tensor<5x1xf32>
    "func.return"(%6) : (tensor<5x1xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<1x1x?x2xf32>, tensor<5x1xf32>, index) -> tensor<5x1xf32>, sym_name = "simple_unpack_dynamic_tile"}> ({
  ^bb0(%arg5: tensor<1x1x?x2xf32>, %arg6: tensor<5x1xf32>, %arg7: index):
    %5 = "linalg.unpack"(%arg5, %arg6, %arg7) <{inner_dims_pos = array<i64: 0, 1>, static_inner_tiles = array<i64: -9223372036854775808, 2>}> : (tensor<1x1x?x2xf32>, tensor<5x1xf32>, index) -> tensor<5x1xf32>
    "func.return"(%5) : (tensor<5x1xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<1x1x2x?xf32>, tensor<5x1xf32>, index) -> tensor<5x1xf32>, sym_name = "simple_unpack_dynamic_tile_transpose"}> ({
  ^bb0(%arg2: tensor<1x1x2x?xf32>, %arg3: tensor<5x1xf32>, %arg4: index):
    %4 = "linalg.unpack"(%arg2, %arg3, %arg4) <{inner_dims_pos = array<i64: 1, 0>, static_inner_tiles = array<i64: 2, -9223372036854775808>}> : (tensor<1x1x2x?xf32>, tensor<5x1xf32>, index) -> tensor<5x1xf32>
    "func.return"(%4) : (tensor<5x1xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<1x1x?x2xf32>, tensor<5x1xf32>) -> tensor<5x1xf32>, sym_name = "simple_unpack_scalable_tile"}> ({
  ^bb0(%arg0: tensor<1x1x?x2xf32>, %arg1: tensor<5x1xf32>):
    %0 = "arith.constant"() <{value = 8 : index}> : () -> index
    %1 = "vector.vscale"() : () -> index
    %2 = "arith.muli"(%1, %0) <{overflowFlags = #arith.overflow<none>}> : (index, index) -> index
    %3 = "linalg.unpack"(%arg0, %arg1, %2) <{inner_dims_pos = array<i64: 0, 1>, static_inner_tiles = array<i64: -9223372036854775808, 2>}> : (tensor<1x1x?x2xf32>, tensor<5x1xf32>, index) -> tensor<5x1xf32>
    "func.return"(%3) : (tensor<5x1xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<1x1x32x8xf32>, tensor<32x8xf32>) -> tensor<32x8xf32>, sym_name = "simple_CNnc_to_NC"}> ({
  ^bb0(%arg0: tensor<1x1x32x8xf32>, %arg1: tensor<32x8xf32>):
    %0 = "linalg.unpack"(%arg0, %arg1) <{inner_dims_pos = array<i64: 0, 1>, outer_dims_perm = array<i64: 1, 0>, static_inner_tiles = array<i64: 32, 8>}> : (tensor<1x1x32x8xf32>, tensor<32x8xf32>) -> tensor<32x8xf32>
    "func.return"(%0) : (tensor<32x8xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<2x1x16x8x32xf32>, tensor<2x32x16x8xf32>) -> tensor<2x32x16x8xf32>, sym_name = "simple_NCHWc_to_NCHW"}> ({
  ^bb0(%arg0: tensor<2x1x16x8x32xf32>, %arg1: tensor<2x32x16x8xf32>):
    %0 = "linalg.unpack"(%arg0, %arg1) <{inner_dims_pos = array<i64: 1>, static_inner_tiles = array<i64: 32>}> : (tensor<2x1x16x8x32xf32>, tensor<2x32x16x8xf32>) -> tensor<2x32x16x8xf32>
    "func.return"(%0) : (tensor<2x32x16x8xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<1x16x8x32xf32>, tensor<1x32x16x8xf32>) -> tensor<1x32x16x8xf32>, sym_name = "simple_NHWC_to_NCHW"}> ({
  ^bb0(%arg0: tensor<1x16x8x32xf32>, %arg1: tensor<1x32x16x8xf32>):
    %0 = "linalg.unpack"(%arg0, %arg1) <{inner_dims_pos = array<i64>, outer_dims_perm = array<i64: 0, 2, 3, 1>, static_inner_tiles = array<i64>}> : (tensor<1x16x8x32xf32>, tensor<1x32x16x8xf32>) -> tensor<1x32x16x8xf32>
    "func.return"(%0) : (tensor<1x32x16x8xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<?x1x1x1x8x32xf32>, tensor<?x1x32x8xf32>) -> tensor<?x1x32x8xf32>, sym_name = "unpack_with_dynamic_dims"}> ({
  ^bb0(%arg0: tensor<?x1x1x1x8x32xf32>, %arg1: tensor<?x1x32x8xf32>):
    %0 = "linalg.unpack"(%arg0, %arg1) <{inner_dims_pos = array<i64: 3, 2>, static_inner_tiles = array<i64: 8, 32>}> : (tensor<?x1x1x1x8x32xf32>, tensor<?x1x32x8xf32>) -> tensor<?x1x32x8xf32>
    "func.return"(%0) : (tensor<?x1x32x8xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<1x1x1x4x1xf32>, tensor<1x1x4xf32>) -> tensor<1x1x4xf32>, sym_name = "unpack_with_non_adjacent_inner_dims_pos_and_unit_outer"}> ({
  ^bb0(%arg0: tensor<1x1x1x4x1xf32>, %arg1: tensor<1x1x4xf32>):
    %0 = "linalg.unpack"(%arg0, %arg1) <{inner_dims_pos = array<i64: 2, 0>, outer_dims_perm = array<i64: 1, 2, 0>, static_inner_tiles = array<i64: 4, 1>}> : (tensor<1x1x1x4x1xf32>, tensor<1x1x4xf32>) -> tensor<1x1x4xf32>
    "func.return"(%0) : (tensor<1x1x4xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<1x1x1x4x1xf32>, tensor<1x1x4xf32>) -> tensor<1x1x4xf32>, sym_name = "unpack_with_non_trailing_dimensions_in_inner_dims"}> ({
  ^bb0(%arg0: tensor<1x1x1x4x1xf32>, %arg1: tensor<1x1x4xf32>):
    %0 = "linalg.unpack"(%arg0, %arg1) <{inner_dims_pos = array<i64: 2, 1>, outer_dims_perm = array<i64: 1, 2, 0>, static_inner_tiles = array<i64: 4, 1>}> : (tensor<1x1x1x4x1xf32>, tensor<1x1x4xf32>) -> tensor<1x1x4xf32>
    "func.return"(%0) : (tensor<1x1x4xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<1x126x1x1x8xf32>, tensor<1x1x1x1001xf32>) -> tensor<1x1x1x1001xf32>, sym_name = "negative_non_unit_tiled_outer_dim"}> ({
  ^bb0(%arg0: tensor<1x126x1x1x8xf32>, %arg1: tensor<1x1x1x1001xf32>):
    %0 = "linalg.unpack"(%arg0, %arg1) <{inner_dims_pos = array<i64: 3>, outer_dims_perm = array<i64: 0, 3, 2, 1>, static_inner_tiles = array<i64: 8>}> : (tensor<1x126x1x1x8xf32>, tensor<1x1x1x1001xf32>) -> tensor<1x1x1x1001xf32>
    "func.return"(%0) : (tensor<1x1x1x1001xf32>) -> ()
  }) : () -> ()
}) : () -> ()

