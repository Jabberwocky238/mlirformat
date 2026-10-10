"builtin.module"() ({
  "func.func"() <{function_type = (tensor<?x?xi32>, tensor<1x1x?x1xi32>) -> tensor<1x1x?x1xi32>, sym_name = "simple_KCRS_to_KCRSsr"}> ({
  ^bb0(%arg0: tensor<?x?xi32>, %arg1: tensor<1x1x?x1xi32>):
    %0 = "arith.constant"() <{value = 8 : index}> : () -> index
    %1 = "arith.constant"() <{value = 5 : i32}> : () -> i32
    %2 = "linalg.pack"(%arg0, %arg1, %1, %0) <{inner_dims_pos = array<i64: 0, 1>, operandSegmentSizes = array<i32: 1, 1, 1, 1>, static_inner_tiles = array<i64: -9223372036854775808, 1>}> : (tensor<?x?xi32>, tensor<1x1x?x1xi32>, i32, index) -> tensor<1x1x?x1xi32>
    "func.return"(%2) : (tensor<1x1x?x1xi32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<2x32x16x8xf32>, tensor<2x1x16x8x32xf32>) -> tensor<2x1x16x8x32xf32>, sym_name = "NCHW_to_NCHWc"}> ({
  ^bb0(%arg0: tensor<2x32x16x8xf32>, %arg1: tensor<2x1x16x8x32xf32>):
    %0 = "linalg.pack"(%arg0, %arg1) <{inner_dims_pos = array<i64: 1>, operandSegmentSizes = array<i32: 1, 1, 0, 0>, static_inner_tiles = array<i64: 32>}> : (tensor<2x32x16x8xf32>, tensor<2x1x16x8x32xf32>) -> tensor<2x1x16x8x32xf32>
    "func.return"(%0) : (tensor<2x1x16x8x32xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<5x1xf32>, tensor<1x1x8x2xf32>, f32) -> tensor<1x1x8x2xf32>, sym_name = "simple_pad_and_pack_static_tiles"}> ({
  ^bb0(%arg19: tensor<5x1xf32>, %arg20: tensor<1x1x8x2xf32>, %arg21: f32):
    %9 = "linalg.pack"(%arg19, %arg20, %arg21) <{inner_dims_pos = array<i64: 0, 1>, operandSegmentSizes = array<i32: 1, 1, 1, 0>, static_inner_tiles = array<i64: 8, 2>}> : (tensor<5x1xf32>, tensor<1x1x8x2xf32>, f32) -> tensor<1x1x8x2xf32>
    "func.return"(%9) : (tensor<1x1x8x2xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<5x1xf32>, tensor<1x1x?x2xf32>, f32, index) -> tensor<1x1x?x2xf32>, sym_name = "simple_pad_and_pack_dynamic_tile"}> ({
  ^bb0(%arg15: tensor<5x1xf32>, %arg16: tensor<1x1x?x2xf32>, %arg17: f32, %arg18: index):
    %8 = "linalg.pack"(%arg15, %arg16, %arg17, %arg18) <{inner_dims_pos = array<i64: 0, 1>, operandSegmentSizes = array<i32: 1, 1, 1, 1>, static_inner_tiles = array<i64: -9223372036854775808, 2>}> : (tensor<5x1xf32>, tensor<1x1x?x2xf32>, f32, index) -> tensor<1x1x?x2xf32>
    "func.return"(%8) : (tensor<1x1x?x2xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<5x1xf32>, tensor<1x1x?x2xf32>, f32) -> tensor<1x1x?x2xf32>, sym_name = "simple_pad_and_pack_dynamic_tile_cst"}> ({
  ^bb0(%arg12: tensor<5x1xf32>, %arg13: tensor<1x1x?x2xf32>, %arg14: f32):
    %6 = "arith.constant"() <{value = 8 : index}> : () -> index
    %7 = "linalg.pack"(%arg12, %arg13, %arg14, %6) <{inner_dims_pos = array<i64: 0, 1>, operandSegmentSizes = array<i32: 1, 1, 1, 1>, static_inner_tiles = array<i64: -9223372036854775808, 2>}> : (tensor<5x1xf32>, tensor<1x1x?x2xf32>, f32, index) -> tensor<1x1x?x2xf32>
    "func.return"(%7) : (tensor<1x1x?x2xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<5x1xf32>, tensor<1x1x2x?xf32>, f32, index) -> tensor<1x1x2x?xf32>, sym_name = "simple_pad_and_pack_dynamic_tile_transpose"}> ({
  ^bb0(%arg8: tensor<5x1xf32>, %arg9: tensor<1x1x2x?xf32>, %arg10: f32, %arg11: index):
    %5 = "linalg.pack"(%arg8, %arg9, %arg10, %arg11) <{inner_dims_pos = array<i64: 1, 0>, operandSegmentSizes = array<i32: 1, 1, 1, 1>, static_inner_tiles = array<i64: 2, -9223372036854775808>}> : (tensor<5x1xf32>, tensor<1x1x2x?xf32>, f32, index) -> tensor<1x1x2x?xf32>
    "func.return"(%5) : (tensor<1x1x2x?xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<5x1xf32>, tensor<1x1x?x2xf32>, f32) -> tensor<1x1x?x2xf32>, sym_name = "simple_pad_and_pack_scalable_tile"}> ({
  ^bb0(%arg5: tensor<5x1xf32>, %arg6: tensor<1x1x?x2xf32>, %arg7: f32):
    %1 = "arith.constant"() <{value = 8 : index}> : () -> index
    %2 = "vector.vscale"() : () -> index
    %3 = "arith.muli"(%2, %1) <{overflowFlags = #arith.overflow<none>}> : (index, index) -> index
    %4 = "linalg.pack"(%arg5, %arg6, %arg7, %3) <{inner_dims_pos = array<i64: 0, 1>, operandSegmentSizes = array<i32: 1, 1, 1, 1>, static_inner_tiles = array<i64: -9223372036854775808, 2>}> : (tensor<5x1xf32>, tensor<1x1x?x2xf32>, f32, index) -> tensor<1x1x?x2xf32>
    "func.return"(%4) : (tensor<1x1x?x2xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<5x1xf32>, tensor<1x1x?x?xf32>, f32, index, index) -> tensor<1x1x?x?xf32>, sym_name = "simple_pad_and_pack_dynamic_tiles"}> ({
  ^bb0(%arg0: tensor<5x1xf32>, %arg1: tensor<1x1x?x?xf32>, %arg2: f32, %arg3: index, %arg4: index):
    %0 = "linalg.pack"(%arg0, %arg1, %arg2, %arg3, %arg4) <{inner_dims_pos = array<i64: 0, 1>, operandSegmentSizes = array<i32: 1, 1, 1, 2>, static_inner_tiles = array<i64: -9223372036854775808, -9223372036854775808>}> : (tensor<5x1xf32>, tensor<1x1x?x?xf32>, f32, index, index) -> tensor<1x1x?x?xf32>
    "func.return"(%0) : (tensor<1x1x?x?xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<1x1x5x1xf32>, tensor<1x1x1x1x2x?xf32>, f32, index) -> tensor<1x1x1x1x2x?xf32>, sym_name = "simple_pad_and_pack_dynamic_tile_not_all_dims_tiled"}> ({
  ^bb0(%arg0: tensor<1x1x5x1xf32>, %arg1: tensor<1x1x1x1x2x?xf32>, %arg2: f32, %arg3: index):
    %0 = "linalg.pack"(%arg0, %arg1, %arg2, %arg3) <{inner_dims_pos = array<i64: 3, 2>, operandSegmentSizes = array<i32: 1, 1, 1, 1>, outer_dims_perm = array<i64: 1, 0, 2, 3>, static_inner_tiles = array<i64: 2, -9223372036854775808>}> : (tensor<1x1x5x1xf32>, tensor<1x1x1x1x2x?xf32>, f32, index) -> tensor<1x1x1x1x2x?xf32>
    "func.return"(%0) : (tensor<1x1x1x1x2x?xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<7x1x5x1xf32>, tensor<1x7x1x1x2x?xf32>, f32, index) -> tensor<1x7x1x1x2x?xf32>, sym_name = "negative_not_all_dims_tiled_outer_dim_0_permuted"}> ({
  ^bb0(%arg0: tensor<7x1x5x1xf32>, %arg1: tensor<1x7x1x1x2x?xf32>, %arg2: f32, %arg3: index):
    %0 = "linalg.pack"(%arg0, %arg1, %arg2, %arg3) <{inner_dims_pos = array<i64: 3, 2>, operandSegmentSizes = array<i32: 1, 1, 1, 1>, outer_dims_perm = array<i64: 1, 0, 2, 3>, static_inner_tiles = array<i64: 2, -9223372036854775808>}> : (tensor<7x1x5x1xf32>, tensor<1x7x1x1x2x?xf32>, f32, index) -> tensor<1x7x1x1x2x?xf32>
    "func.return"(%0) : (tensor<1x7x1x1x2x?xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<1x7x5x1xf32>, tensor<7x1x1x1x2x?xf32>, f32, index) -> tensor<7x1x1x1x2x?xf32>, sym_name = "negative_not_all_dims_tiled_outer_dim_1_permuted"}> ({
  ^bb0(%arg0: tensor<1x7x5x1xf32>, %arg1: tensor<7x1x1x1x2x?xf32>, %arg2: f32, %arg3: index):
    %0 = "linalg.pack"(%arg0, %arg1, %arg2, %arg3) <{inner_dims_pos = array<i64: 3, 2>, operandSegmentSizes = array<i32: 1, 1, 1, 1>, outer_dims_perm = array<i64: 1, 0, 2, 3>, static_inner_tiles = array<i64: 2, -9223372036854775808>}> : (tensor<1x7x5x1xf32>, tensor<7x1x1x1x2x?xf32>, f32, index) -> tensor<7x1x1x1x2x?xf32>
    "func.return"(%0) : (tensor<7x1x1x1x2x?xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<32x8xf32>, tensor<1x1x32x8xf32>) -> tensor<1x1x32x8xf32>, sym_name = "simple_NC_to_CNnc"}> ({
  ^bb0(%arg0: tensor<32x8xf32>, %arg1: tensor<1x1x32x8xf32>):
    %0 = "linalg.pack"(%arg0, %arg1) <{inner_dims_pos = array<i64: 0, 1>, operandSegmentSizes = array<i32: 1, 1, 0, 0>, outer_dims_perm = array<i64: 1, 0>, static_inner_tiles = array<i64: 32, 8>}> : (tensor<32x8xf32>, tensor<1x1x32x8xf32>) -> tensor<1x1x32x8xf32>
    "func.return"(%0) : (tensor<1x1x32x8xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<3x5x7xf32>, tensor<1x1x1x5x7x3xf32>) -> tensor<1x1x1x5x7x3xf32>, sym_name = "simple_CHW_to_CHWhwc"}> ({
  ^bb0(%arg0: tensor<3x5x7xf32>, %arg1: tensor<1x1x1x5x7x3xf32>):
    %0 = "linalg.pack"(%arg0, %arg1) <{inner_dims_pos = array<i64: 1, 2, 0>, operandSegmentSizes = array<i32: 1, 1, 0, 0>, static_inner_tiles = array<i64: 5, 7, 3>}> : (tensor<3x5x7xf32>, tensor<1x1x1x5x7x3xf32>) -> tensor<1x1x1x5x7x3xf32>
    "func.return"(%0) : (tensor<1x1x1x5x7x3xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<1x1x32x8xf32>, tensor<1x1x1x1x8x32xf32>) -> tensor<1x1x1x1x8x32xf32>, sym_name = "simple_KCRS_to_KRSCsr"}> ({
  ^bb0(%arg0: tensor<1x1x32x8xf32>, %arg1: tensor<1x1x1x1x8x32xf32>):
    %0 = "linalg.pack"(%arg0, %arg1) <{inner_dims_pos = array<i64: 3, 2>, operandSegmentSizes = array<i32: 1, 1, 0, 0>, outer_dims_perm = array<i64: 0, 2, 3, 1>, static_inner_tiles = array<i64: 8, 32>}> : (tensor<1x1x32x8xf32>, tensor<1x1x1x1x8x32xf32>) -> tensor<1x1x1x1x8x32xf32>
    "func.return"(%0) : (tensor<1x1x1x1x8x32xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<1x1x4xf32>, tensor<1x1x1x4x1xf32>) -> tensor<1x1x1x4x1xf32>, sym_name = "pack_with_non_adjacent_inner_dims_pos_and_unit_outer"}> ({
  ^bb0(%arg0: tensor<1x1x4xf32>, %arg1: tensor<1x1x1x4x1xf32>):
    %0 = "linalg.pack"(%arg0, %arg1) <{inner_dims_pos = array<i64: 2, 0>, operandSegmentSizes = array<i32: 1, 1, 0, 0>, outer_dims_perm = array<i64: 1, 2, 0>, static_inner_tiles = array<i64: 4, 1>}> : (tensor<1x1x4xf32>, tensor<1x1x1x4x1xf32>) -> tensor<1x1x1x4x1xf32>
    "func.return"(%0) : (tensor<1x1x1x4x1xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<1x1x4xf32>, tensor<1x1x1x4x1xf32>) -> tensor<1x1x1x4x1xf32>, sym_name = "pack_with_adjacent_trailing_dimensions_inner_dims_pos_and_unit_outer"}> ({
  ^bb0(%arg0: tensor<1x1x4xf32>, %arg1: tensor<1x1x1x4x1xf32>):
    %0 = "linalg.pack"(%arg0, %arg1) <{inner_dims_pos = array<i64: 2, 1>, operandSegmentSizes = array<i32: 1, 1, 0, 0>, outer_dims_perm = array<i64: 1, 2, 0>, static_inner_tiles = array<i64: 4, 1>}> : (tensor<1x1x4xf32>, tensor<1x1x1x4x1xf32>) -> tensor<1x1x1x4x1xf32>
    "func.return"(%0) : (tensor<1x1x1x4x1xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<8x1x1x1xf32>, tensor<1x1x1x1x8x1xf32>) -> tensor<1x1x1x1x8x1xf32>, sym_name = "pack_with_non_adjacent_and_non_permuted_inner_dims"}> ({
  ^bb0(%arg0: tensor<8x1x1x1xf32>, %arg1: tensor<1x1x1x1x8x1xf32>):
    %0 = "linalg.pack"(%arg0, %arg1) <{inner_dims_pos = array<i64: 0, 3>, operandSegmentSizes = array<i32: 1, 1, 0, 0>, outer_dims_perm = array<i64: 0, 1, 2, 3>, static_inner_tiles = array<i64: 8, 1>}> : (tensor<8x1x1x1xf32>, tensor<1x1x1x1x8x1xf32>) -> tensor<1x1x1x1x8x1xf32>
    "func.return"(%0) : (tensor<1x1x1x1x8x1xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<1x126x1x1x8xf32>, tensor<1x1x1x1001xf32>, f32) -> tensor<1x126x1x1x8xf32>, sym_name = "negative_non_unit_tiled_outer_dim"}> ({
  ^bb0(%arg0: tensor<1x126x1x1x8xf32>, %arg1: tensor<1x1x1x1001xf32>, %arg2: f32):
    %0 = "linalg.pack"(%arg1, %arg0, %arg2) <{inner_dims_pos = array<i64: 3>, operandSegmentSizes = array<i32: 1, 1, 1, 0>, outer_dims_perm = array<i64: 0, 3, 2, 1>, static_inner_tiles = array<i64: 8>}> : (tensor<1x1x1x1001xf32>, tensor<1x126x1x1x8xf32>, f32) -> tensor<1x126x1x1x8xf32>
    "func.return"(%0) : (tensor<1x126x1x1x8xf32>) -> ()
  }) : () -> ()
}) : () -> ()

