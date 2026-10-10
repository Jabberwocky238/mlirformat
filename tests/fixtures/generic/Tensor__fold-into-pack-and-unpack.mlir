"builtin.module"() ({
  "func.func"() <{function_type = (tensor<28x2x1x16x16xf32>) -> tensor<28x28x10xf32>, sym_name = "fold_extract_slice_into_unpack_slicing_trailing_dim"}> ({
  ^bb0(%arg0: tensor<28x2x1x16x16xf32>):
    %0 = "tensor.empty"() : () -> tensor<28x28x15xf32>
    %1 = "linalg.unpack"(%arg0, %0) <{inner_dims_pos = array<i64: 1, 2>, static_inner_tiles = array<i64: 16, 16>}> : (tensor<28x2x1x16x16xf32>, tensor<28x28x15xf32>) -> tensor<28x28x15xf32>
    %2 = "tensor.extract_slice"(%1) <{operandSegmentSizes = array<i32: 1, 0, 0, 0>, static_offsets = array<i64: 0, 0, 0>, static_sizes = array<i64: 28, 28, 10>, static_strides = array<i64: 1, 1, 1>}> : (tensor<28x28x15xf32>) -> tensor<28x28x10xf32>
    "func.return"(%2) : (tensor<28x28x10xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<28x2x1x16x16xf32>) -> tensor<28x17x15xf32>, sym_name = "fold_extract_slice_into_unpack_slicing_dim_1"}> ({
  ^bb0(%arg0: tensor<28x2x1x16x16xf32>):
    %0 = "tensor.empty"() : () -> tensor<28x28x15xf32>
    %1 = "linalg.unpack"(%arg0, %0) <{inner_dims_pos = array<i64: 1, 2>, static_inner_tiles = array<i64: 16, 16>}> : (tensor<28x2x1x16x16xf32>, tensor<28x28x15xf32>) -> tensor<28x28x15xf32>
    %2 = "tensor.extract_slice"(%1) <{operandSegmentSizes = array<i32: 1, 0, 0, 0>, static_offsets = array<i64: 0, 0, 0>, static_sizes = array<i64: 28, 17, 15>, static_strides = array<i64: 1, 1, 1>}> : (tensor<28x28x15xf32>) -> tensor<28x17x15xf32>
    "func.return"(%2) : (tensor<28x17x15xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<28x2x1x16x16xf32>) -> tensor<28x16x15xf32>, sym_name = "no_fold_extract_slice_into_unpack_artificial_padding"}> ({
  ^bb0(%arg0: tensor<28x2x1x16x16xf32>):
    %0 = "tensor.empty"() : () -> tensor<28x28x15xf32>
    %1 = "linalg.unpack"(%arg0, %0) <{inner_dims_pos = array<i64: 1, 2>, static_inner_tiles = array<i64: 16, 16>}> : (tensor<28x2x1x16x16xf32>, tensor<28x28x15xf32>) -> tensor<28x28x15xf32>
    %2 = "tensor.extract_slice"(%1) <{operandSegmentSizes = array<i32: 1, 0, 0, 0>, static_offsets = array<i64: 0, 0, 0>, static_sizes = array<i64: 28, 16, 15>, static_strides = array<i64: 1, 1, 1>}> : (tensor<28x28x15xf32>) -> tensor<28x16x15xf32>
    "func.return"(%2) : (tensor<28x16x15xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<28x2x?x16x16xf32>, tensor<28x32x?xf32>, index) -> tensor<28x28x?xf32>, sym_name = "no_fold_extract_slice_into_unpack_dynamic"}> ({
  ^bb0(%arg0: tensor<28x2x?x16x16xf32>, %arg1: tensor<28x32x?xf32>, %arg2: index):
    %0 = "linalg.unpack"(%arg0, %arg1) <{inner_dims_pos = array<i64: 1, 2>, outer_dims_perm = array<i64: 0, 1, 2>, static_inner_tiles = array<i64: 16, 16>}> : (tensor<28x2x?x16x16xf32>, tensor<28x32x?xf32>) -> tensor<28x32x?xf32>
    %1 = "tensor.extract_slice"(%0, %arg2) <{operandSegmentSizes = array<i32: 1, 0, 1, 0>, static_offsets = array<i64: 0, 0, 0>, static_sizes = array<i64: 28, 28, -9223372036854775808>, static_strides = array<i64: 1, 1, 1>}> : (tensor<28x32x?xf32>, index) -> tensor<28x28x?xf32>
    "func.return"(%1) : (tensor<28x28x?xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<?x?x8x4xf32>, tensor<?x?xf32>, index, index) -> tensor<?x?xf32>, sym_name = "nofold_dynamic_unpack_slice"}> ({
  ^bb0(%arg0: tensor<?x?x8x4xf32>, %arg1: tensor<?x?xf32>, %arg2: index, %arg3: index):
    %0 = "linalg.unpack"(%arg0, %arg1) <{inner_dims_pos = array<i64: 0, 1>, static_inner_tiles = array<i64: 8, 4>}> : (tensor<?x?x8x4xf32>, tensor<?x?xf32>) -> tensor<?x?xf32>
    %1 = "tensor.extract_slice"(%0, %arg2, %arg3) <{operandSegmentSizes = array<i32: 1, 0, 2, 0>, static_offsets = array<i64: 0, 0>, static_sizes = array<i64: -9223372036854775808, -9223372036854775808>, static_strides = array<i64: 1, 1>}> : (tensor<?x?xf32>, index, index) -> tensor<?x?xf32>
    "func.return"(%1) : (tensor<?x?xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<?x?x8x4xf32>, tensor<?x?xf32>, index, index, index) -> tensor<?x?xf32>, sym_name = "nofold_unpack_slice_non_zero_offset"}> ({
  ^bb0(%arg0: tensor<?x?x8x4xf32>, %arg1: tensor<?x?xf32>, %arg2: index, %arg3: index, %arg4: index):
    %0 = "linalg.unpack"(%arg0, %arg1) <{inner_dims_pos = array<i64: 0, 1>, static_inner_tiles = array<i64: 8, 4>}> : (tensor<?x?x8x4xf32>, tensor<?x?xf32>) -> tensor<?x?xf32>
    %1 = "tensor.extract_slice"(%0, %arg4, %arg2, %arg3) <{operandSegmentSizes = array<i32: 1, 1, 2, 0>, static_offsets = array<i64: 0, -9223372036854775808>, static_sizes = array<i64: -9223372036854775808, -9223372036854775808>, static_strides = array<i64: 1, 1>}> : (tensor<?x?xf32>, index, index, index) -> tensor<?x?xf32>
    "func.return"(%1) : (tensor<?x?xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<?x?x8x4xf32>, tensor<?x?xf32>, index, index, index) -> tensor<?x?xf32>, sym_name = "nofold_unpack_slice_non_unit_stride"}> ({
  ^bb0(%arg0: tensor<?x?x8x4xf32>, %arg1: tensor<?x?xf32>, %arg2: index, %arg3: index, %arg4: index):
    %0 = "linalg.unpack"(%arg0, %arg1) <{inner_dims_pos = array<i64: 0, 1>, static_inner_tiles = array<i64: 8, 4>}> : (tensor<?x?x8x4xf32>, tensor<?x?xf32>) -> tensor<?x?xf32>
    %1 = "tensor.extract_slice"(%0, %arg2, %arg3, %arg4) <{operandSegmentSizes = array<i32: 1, 0, 2, 1>, static_offsets = array<i64: 0, 0>, static_sizes = array<i64: -9223372036854775808, -9223372036854775808>, static_strides = array<i64: -9223372036854775808, 1>}> : (tensor<?x?xf32>, index, index, index) -> tensor<?x?xf32>
    "func.return"(%1) : (tensor<?x?xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<?x?x8x4xf32>, tensor<?x?xf32>, index, index) -> tensor<f32>, sym_name = "nofold_unpack_slice_rank_reduced"}> ({
  ^bb0(%arg0: tensor<?x?x8x4xf32>, %arg1: tensor<?x?xf32>, %arg2: index, %arg3: index):
    %0 = "linalg.unpack"(%arg0, %arg1) <{inner_dims_pos = array<i64: 0, 1>, static_inner_tiles = array<i64: 8, 4>}> : (tensor<?x?x8x4xf32>, tensor<?x?xf32>) -> tensor<?x?xf32>
    %1 = "tensor.extract_slice"(%0) <{operandSegmentSizes = array<i32: 1, 0, 0, 0>, static_offsets = array<i64: 0, 0>, static_sizes = array<i64: 1, 1>, static_strides = array<i64: 1, 1>}> : (tensor<?x?xf32>) -> tensor<f32>
    "func.return"(%1) : (tensor<f32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<9x16xf32>) -> tensor<2x1x8x32xf32>, sym_name = "fold_pad_pack"}> ({
  ^bb0(%arg0: tensor<9x16xf32>):
    %0 = "arith.constant"() <{value = 0.000000e+00 : f32}> : () -> f32
    %1 = "tensor.pad"(%arg0) <{operandSegmentSizes = array<i32: 1, 0, 0>, static_high = array<i64: 7, 0>, static_low = array<i64: 0, 0>}> ({
    ^bb0(%arg1: index, %arg2: index):
      "tensor.yield"(%0) : (f32) -> ()
    }) : (tensor<9x16xf32>) -> tensor<16x16xf32>
    %2 = "tensor.empty"() : () -> tensor<2x1x8x32xf32>
    %3 = "linalg.pack"(%1, %2, %0) <{inner_dims_pos = array<i64: 0, 1>, operandSegmentSizes = array<i32: 1, 1, 1, 0>, static_inner_tiles = array<i64: 8, 32>}> : (tensor<16x16xf32>, tensor<2x1x8x32xf32>, f32) -> tensor<2x1x8x32xf32>
    "func.return"(%3) : (tensor<2x1x8x32xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<9x16xf32>) -> tensor<3x1x8x32xf32>, sym_name = "nofold_pad_pack_artificial_padding"}> ({
  ^bb0(%arg0: tensor<9x16xf32>):
    %0 = "arith.constant"() <{value = 0.000000e+00 : f32}> : () -> f32
    %1 = "tensor.pad"(%arg0) <{operandSegmentSizes = array<i32: 1, 0, 0>, static_high = array<i64: 8, 0>, static_low = array<i64: 0, 0>}> ({
    ^bb0(%arg1: index, %arg2: index):
      "tensor.yield"(%0) : (f32) -> ()
    }) : (tensor<9x16xf32>) -> tensor<17x16xf32>
    %2 = "tensor.empty"() : () -> tensor<3x1x8x32xf32>
    %3 = "linalg.pack"(%1, %2, %0) <{inner_dims_pos = array<i64: 0, 1>, operandSegmentSizes = array<i32: 1, 1, 1, 0>, static_inner_tiles = array<i64: 8, 32>}> : (tensor<17x16xf32>, tensor<3x1x8x32xf32>, f32) -> tensor<3x1x8x32xf32>
    "func.return"(%3) : (tensor<3x1x8x32xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<16649x16xf32>) -> tensor<2082x1x8x32xf32>, sym_name = "nofold_pad_pack_with_nofold_attribute"}> ({
  ^bb0(%arg0: tensor<16649x16xf32>):
    %0 = "arith.constant"() <{value = 0.000000e+00 : f32}> : () -> f32
    %1 = "tensor.pad"(%arg0) <{nofold, operandSegmentSizes = array<i32: 1, 0, 0>, static_high = array<i64: 7, 0>, static_low = array<i64: 0, 0>}> ({
    ^bb0(%arg1: index, %arg2: index):
      "tensor.yield"(%0) : (f32) -> ()
    }) : (tensor<16649x16xf32>) -> tensor<16656x16xf32>
    %2 = "tensor.empty"() : () -> tensor<2082x1x8x32xf32>
    %3 = "linalg.pack"(%1, %2, %0) <{inner_dims_pos = array<i64: 0, 1>, operandSegmentSizes = array<i32: 1, 1, 1, 0>, static_inner_tiles = array<i64: 8, 32>}> : (tensor<16656x16xf32>, tensor<2082x1x8x32xf32>, f32) -> tensor<2082x1x8x32xf32>
    "func.return"(%3) : (tensor<2082x1x8x32xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<16641x16xf32>) -> tensor<2082x1x8x32xf32>, sym_name = "pad_pack_different_padding_value"}> ({
  ^bb0(%arg0: tensor<16641x16xf32>):
    %0 = "arith.constant"() <{value = 0.000000e+00 : f32}> : () -> f32
    %1 = "arith.constant"() <{value = 1.000000e+00 : f32}> : () -> f32
    %2 = "tensor.pad"(%arg0) <{operandSegmentSizes = array<i32: 1, 0, 0>, static_high = array<i64: 15, 0>, static_low = array<i64: 0, 0>}> ({
    ^bb0(%arg1: index, %arg2: index):
      "tensor.yield"(%0) : (f32) -> ()
    }) : (tensor<16641x16xf32>) -> tensor<16656x16xf32>
    %3 = "tensor.empty"() : () -> tensor<2082x1x8x32xf32>
    %4 = "linalg.pack"(%2, %3, %1) <{inner_dims_pos = array<i64: 0, 1>, operandSegmentSizes = array<i32: 1, 1, 1, 0>, static_inner_tiles = array<i64: 8, 32>}> : (tensor<16656x16xf32>, tensor<2082x1x8x32xf32>, f32) -> tensor<2082x1x8x32xf32>
    "func.return"(%4) : (tensor<2082x1x8x32xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<56x57x1x64xf32>) -> tensor<1x57x56x2x32xf32>, sym_name = "linalg.pack_linalg_transpose_fold"}> ({
  ^bb0(%arg0: tensor<56x57x1x64xf32>):
    %0 = "tensor.empty"() : () -> tensor<56x2x1x57x32xf32>
    %1 = "linalg.pack"(%arg0, %0) <{inner_dims_pos = array<i64: 3>, operandSegmentSizes = array<i32: 1, 1, 0, 0>, outer_dims_perm = array<i64: 0, 3, 2, 1>, static_inner_tiles = array<i64: 32>}> : (tensor<56x57x1x64xf32>, tensor<56x2x1x57x32xf32>) -> tensor<56x2x1x57x32xf32>
    %2 = "tensor.empty"() : () -> tensor<1x57x56x2x32xf32>
    %3 = "linalg.transpose"(%1, %2) <{permutation = array<i64: 2, 3, 0, 1, 4>}> ({
    ^bb0(%arg1: f32, %arg2: f32):
      "linalg.yield"(%arg1) : (f32) -> ()
    }) : (tensor<56x2x1x57x32xf32>, tensor<1x57x56x2x32xf32>) -> tensor<1x57x56x2x32xf32>
    "func.return"(%3) : (tensor<1x57x56x2x32xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<56x57x1x55xf32>, f32) -> tensor<1x57x56x2x32xf32>, sym_name = "linalg.pack_linalg_transpose_fold_with_padding"}> ({
  ^bb0(%arg0: tensor<56x57x1x55xf32>, %arg1: f32):
    %0 = "tensor.empty"() : () -> tensor<56x2x1x57x32xf32>
    %1 = "linalg.pack"(%arg0, %0, %arg1) <{inner_dims_pos = array<i64: 3>, operandSegmentSizes = array<i32: 1, 1, 1, 0>, outer_dims_perm = array<i64: 0, 3, 2, 1>, static_inner_tiles = array<i64: 32>}> : (tensor<56x57x1x55xf32>, tensor<56x2x1x57x32xf32>, f32) -> tensor<56x2x1x57x32xf32>
    %2 = "tensor.empty"() : () -> tensor<1x57x56x2x32xf32>
    %3 = "linalg.transpose"(%1, %2) <{permutation = array<i64: 2, 3, 0, 1, 4>}> ({
    ^bb0(%arg2: f32, %arg3: f32):
      "linalg.yield"(%arg2) : (f32) -> ()
    }) : (tensor<56x2x1x57x32xf32>, tensor<1x57x56x2x32xf32>) -> tensor<1x57x56x2x32xf32>
    "func.return"(%3) : (tensor<1x57x56x2x32xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<56x57x1x64xf32>) -> tensor<1x2x56x57x32xf32>, sym_name = "linalg.pack_linalg_transpose_fold_no_outer_dims_perm"}> ({
  ^bb0(%arg0: tensor<56x57x1x64xf32>):
    %0 = "tensor.empty"() : () -> tensor<56x57x1x2x32xf32>
    %1 = "linalg.pack"(%arg0, %0) <{inner_dims_pos = array<i64: 3>, operandSegmentSizes = array<i32: 1, 1, 0, 0>, static_inner_tiles = array<i64: 32>}> : (tensor<56x57x1x64xf32>, tensor<56x57x1x2x32xf32>) -> tensor<56x57x1x2x32xf32>
    %2 = "tensor.empty"() : () -> tensor<1x2x56x57x32xf32>
    %3 = "linalg.transpose"(%1, %2) <{permutation = array<i64: 2, 3, 0, 1, 4>}> ({
    ^bb0(%arg1: f32, %arg2: f32):
      "linalg.yield"(%arg1) : (f32) -> ()
    }) : (tensor<56x57x1x2x32xf32>, tensor<1x2x56x57x32xf32>) -> tensor<1x2x56x57x32xf32>
    "func.return"(%3) : (tensor<1x2x56x57x32xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<56x72x24x128xf32>) -> tensor<12x56x4x9x32x8x2xf32>, sym_name = "linalg.pack_linalg_transpose_fold_tile_dims_transpose"}> ({
  ^bb0(%arg0: tensor<56x72x24x128xf32>):
    %0 = "tensor.empty"() : () -> tensor<4x9x12x56x8x2x32xf32>
    %1 = "linalg.pack"(%arg0, %0) <{inner_dims_pos = array<i64: 1, 2, 3>, operandSegmentSizes = array<i32: 1, 1, 0, 0>, outer_dims_perm = array<i64: 3, 1, 2, 0>, static_inner_tiles = array<i64: 8, 2, 32>}> : (tensor<56x72x24x128xf32>, tensor<4x9x12x56x8x2x32xf32>) -> tensor<4x9x12x56x8x2x32xf32>
    %2 = "tensor.empty"() : () -> tensor<12x56x4x9x32x8x2xf32>
    %3 = "linalg.transpose"(%1, %2) <{permutation = array<i64: 2, 3, 0, 1, 6, 4, 5>}> ({
    ^bb0(%arg1: f32, %arg2: f32):
      "linalg.yield"(%arg1) : (f32) -> ()
    }) : (tensor<4x9x12x56x8x2x32xf32>, tensor<12x56x4x9x32x8x2xf32>) -> tensor<12x56x4x9x32x8x2xf32>
    "func.return"(%3) : (tensor<12x56x4x9x32x8x2xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<56x72x24x128xf32>) -> tensor<9x56x2x12x32x8x4xf32>, sym_name = "linalg.pack_linalg_transpose_fold_tile_dims_outer_dims_transpose"}> ({
  ^bb0(%arg0: tensor<56x72x24x128xf32>):
    %0 = "tensor.empty"() : () -> tensor<4x12x9x56x8x2x32xf32>
    %1 = "linalg.pack"(%arg0, %0) <{inner_dims_pos = array<i64: 1, 2, 3>, operandSegmentSizes = array<i32: 1, 1, 0, 0>, outer_dims_perm = array<i64: 3, 2, 1, 0>, static_inner_tiles = array<i64: 8, 2, 32>}> : (tensor<56x72x24x128xf32>, tensor<4x12x9x56x8x2x32xf32>) -> tensor<4x12x9x56x8x2x32xf32>
    %2 = "tensor.empty"() : () -> tensor<9x56x2x12x32x8x4xf32>
    %3 = "linalg.transpose"(%1, %2) <{permutation = array<i64: 2, 3, 5, 1, 6, 4, 0>}> ({
    ^bb0(%arg1: f32, %arg2: f32):
      "linalg.yield"(%arg1) : (f32) -> ()
    }) : (tensor<4x12x9x56x8x2x32xf32>, tensor<9x56x2x12x32x8x4xf32>) -> tensor<9x56x2x12x32x8x4xf32>
    "func.return"(%3) : (tensor<9x56x2x12x32x8x4xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<56x?x?x64xf32>) -> tensor<?x?x56x2x32xf32>, sym_name = "linalg.pack_linalg_transpose_fold_dynamic_outer_dims"}> ({
  ^bb0(%arg0: tensor<56x?x?x64xf32>):
    %0 = "tensor.empty"() : () -> tensor<56x2x1x57x32xf32>
    %1 = "linalg.pack"(%arg0, %0) <{inner_dims_pos = array<i64: 3>, operandSegmentSizes = array<i32: 1, 1, 0, 0>, outer_dims_perm = array<i64: 0, 3, 2, 1>, static_inner_tiles = array<i64: 32>}> : (tensor<56x?x?x64xf32>, tensor<56x2x1x57x32xf32>) -> tensor<56x2x1x57x32xf32>
    %2 = "tensor.empty"() : () -> tensor<1x57x56x2x32xf32>
    %3 = "linalg.transpose"(%1, %2) <{permutation = array<i64: 2, 3, 0, 1, 4>}> ({
    ^bb0(%arg1: f32, %arg2: f32):
      "linalg.yield"(%arg1) : (f32) -> ()
    }) : (tensor<56x2x1x57x32xf32>, tensor<1x57x56x2x32xf32>) -> tensor<1x57x56x2x32xf32>
    %4 = "tensor.cast"(%3) : (tensor<1x57x56x2x32xf32>) -> tensor<?x?x56x2x32xf32>
    "func.return"(%4) : (tensor<?x?x56x2x32xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<56x?x?x128xf32>) -> tensor<?x?x56x9x32x8x2xf32>, sym_name = "linalg.pack_linalg_transpose_fold_dynamic_outer_and_tile_dims"}> ({
  ^bb0(%arg0: tensor<56x?x?x128xf32>):
    %0 = "tensor.empty"() : () -> tensor<56x9x12x4x8x2x32xf32>
    %1 = "linalg.pack"(%arg0, %0) <{inner_dims_pos = array<i64: 1, 2, 3>, operandSegmentSizes = array<i32: 1, 1, 0, 0>, static_inner_tiles = array<i64: 8, 2, 32>}> : (tensor<56x?x?x128xf32>, tensor<56x9x12x4x8x2x32xf32>) -> tensor<56x9x12x4x8x2x32xf32>
    %2 = "tensor.empty"() : () -> tensor<12x4x56x9x32x8x2xf32>
    %3 = "linalg.transpose"(%1, %2) <{permutation = array<i64: 2, 3, 0, 1, 6, 4, 5>}> ({
    ^bb0(%arg1: f32, %arg2: f32):
      "linalg.yield"(%arg1) : (f32) -> ()
    }) : (tensor<56x9x12x4x8x2x32xf32>, tensor<12x4x56x9x32x8x2xf32>) -> tensor<12x4x56x9x32x8x2xf32>
    %4 = "tensor.cast"(%3) : (tensor<12x4x56x9x32x8x2xf32>) -> tensor<?x?x56x9x32x8x2xf32>
    "func.return"(%4) : (tensor<?x?x56x9x32x8x2xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<?x?x?x?xf32>, tensor<?x?x?x?x?x?x?xf32>, tensor<?x?x?x?x?x?x?xf32>, index, index, index) -> tensor<?x?x?x?x?x?x?xf32>, sym_name = "linalg.pack_linalg_transpose_fold_dynamic_outer_dims_tile_dims_tile_sizes"}> ({
  ^bb0(%arg0: tensor<?x?x?x?xf32>, %arg1: tensor<?x?x?x?x?x?x?xf32>, %arg2: tensor<?x?x?x?x?x?x?xf32>, %arg3: index, %arg4: index, %arg5: index):
    %0 = "linalg.pack"(%arg0, %arg1, %arg3, %arg4, %arg5) <{inner_dims_pos = array<i64: 1, 2, 3>, operandSegmentSizes = array<i32: 1, 1, 0, 3>, outer_dims_perm = array<i64: 3, 0, 2, 1>, static_inner_tiles = array<i64: -9223372036854775808, -9223372036854775808, -9223372036854775808>}> : (tensor<?x?x?x?xf32>, tensor<?x?x?x?x?x?x?xf32>, index, index, index) -> tensor<?x?x?x?x?x?x?xf32>
    %1 = "linalg.transpose"(%0, %arg2) <{permutation = array<i64: 2, 3, 0, 1, 6, 4, 5>}> ({
    ^bb0(%arg6: f32, %arg7: f32):
      "linalg.yield"(%arg6) : (f32) -> ()
    }) : (tensor<?x?x?x?x?x?x?xf32>, tensor<?x?x?x?x?x?x?xf32>) -> tensor<?x?x?x?x?x?x?xf32>
    "func.return"(%1) : (tensor<?x?x?x?x?x?x?xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<56x57x1x64xf32>) -> tensor<1x57x56x2x32xf32>, sym_name = "linalg_transpose_linalg.pack_fold"}> ({
  ^bb0(%arg0: tensor<56x57x1x64xf32>):
    %0 = "tensor.empty"() : () -> tensor<1x56x57x64xf32>
    %1 = "linalg.transpose"(%arg0, %0) <{permutation = array<i64: 2, 0, 1, 3>}> ({
    ^bb0(%arg1: f32, %arg2: f32):
      "linalg.yield"(%arg1) : (f32) -> ()
    }) : (tensor<56x57x1x64xf32>, tensor<1x56x57x64xf32>) -> tensor<1x56x57x64xf32>
    %2 = "tensor.empty"() : () -> tensor<1x57x56x2x32xf32>
    %3 = "linalg.pack"(%1, %2) <{inner_dims_pos = array<i64: 3>, operandSegmentSizes = array<i32: 1, 1, 0, 0>, outer_dims_perm = array<i64: 0, 2, 1, 3>, static_inner_tiles = array<i64: 32>}> : (tensor<1x56x57x64xf32>, tensor<1x57x56x2x32xf32>) -> tensor<1x57x56x2x32xf32>
    "func.return"(%3) : (tensor<1x57x56x2x32xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<56x57x1x64xf32>) -> (tensor<1x56x57x64xf32>, tensor<1x57x56x2x32xf32>), sym_name = "linalg_transpose_linalg.pack_fold_multi_result"}> ({
  ^bb0(%arg0: tensor<56x57x1x64xf32>):
    %0 = "tensor.empty"() : () -> tensor<1x56x57x64xf32>
    %1 = "linalg.transpose"(%arg0, %0) <{permutation = array<i64: 2, 0, 1, 3>}> ({
    ^bb0(%arg1: f32, %arg2: f32):
      "linalg.yield"(%arg1) : (f32) -> ()
    }) : (tensor<56x57x1x64xf32>, tensor<1x56x57x64xf32>) -> tensor<1x56x57x64xf32>
    %2 = "tensor.empty"() : () -> tensor<1x57x56x2x32xf32>
    %3 = "linalg.pack"(%1, %2) <{inner_dims_pos = array<i64: 3>, operandSegmentSizes = array<i32: 1, 1, 0, 0>, outer_dims_perm = array<i64: 0, 2, 1, 3>, static_inner_tiles = array<i64: 32>}> : (tensor<1x56x57x64xf32>, tensor<1x57x56x2x32xf32>) -> tensor<1x57x56x2x32xf32>
    "func.return"(%1, %3) : (tensor<1x56x57x64xf32>, tensor<1x57x56x2x32xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<56x57x1x55xf32>, f32) -> tensor<1x57x56x2x32xf32>, sym_name = "linalg_transpose_linalg.pack_fold_with_padding"}> ({
  ^bb0(%arg0: tensor<56x57x1x55xf32>, %arg1: f32):
    %0 = "tensor.empty"() : () -> tensor<1x56x57x55xf32>
    %1 = "linalg.transpose"(%arg0, %0) <{permutation = array<i64: 2, 0, 1, 3>}> ({
    ^bb0(%arg2: f32, %arg3: f32):
      "linalg.yield"(%arg2) : (f32) -> ()
    }) : (tensor<56x57x1x55xf32>, tensor<1x56x57x55xf32>) -> tensor<1x56x57x55xf32>
    %2 = "tensor.empty"() : () -> tensor<1x57x56x2x32xf32>
    %3 = "linalg.pack"(%1, %2, %arg1) <{inner_dims_pos = array<i64: 3>, operandSegmentSizes = array<i32: 1, 1, 1, 0>, outer_dims_perm = array<i64: 0, 2, 1, 3>, static_inner_tiles = array<i64: 32>}> : (tensor<1x56x57x55xf32>, tensor<1x57x56x2x32xf32>, f32) -> tensor<1x57x56x2x32xf32>
    "func.return"(%3) : (tensor<1x57x56x2x32xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<56x57x1x64xf32>) -> tensor<1x56x57x2x32xf32>, sym_name = "linalg_transpose_linalg.pack_fold_no_outer_dims_perm"}> ({
  ^bb0(%arg0: tensor<56x57x1x64xf32>):
    %0 = "tensor.empty"() : () -> tensor<1x56x57x64xf32>
    %1 = "linalg.transpose"(%arg0, %0) <{permutation = array<i64: 2, 0, 1, 3>}> ({
    ^bb0(%arg1: f32, %arg2: f32):
      "linalg.yield"(%arg1) : (f32) -> ()
    }) : (tensor<56x57x1x64xf32>, tensor<1x56x57x64xf32>) -> tensor<1x56x57x64xf32>
    %2 = "tensor.empty"() : () -> tensor<1x56x57x2x32xf32>
    %3 = "linalg.pack"(%1, %2) <{inner_dims_pos = array<i64: 3>, operandSegmentSizes = array<i32: 1, 1, 0, 0>, static_inner_tiles = array<i64: 32>}> : (tensor<1x56x57x64xf32>, tensor<1x56x57x2x32xf32>) -> tensor<1x56x57x2x32xf32>
    "func.return"(%3) : (tensor<1x56x57x2x32xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<25x30x35x40xf32>, tensor<35x40x25x30xf32>, tensor<3x35x5x8x5x10x5xf32>) -> tensor<3x35x5x8x5x10x5xf32>, sym_name = "linalg_transpose_linalg.pack_fold_complex_inner_dims_change"}> ({
  ^bb0(%arg0: tensor<25x30x35x40xf32>, %arg1: tensor<35x40x25x30xf32>, %arg2: tensor<3x35x5x8x5x10x5xf32>):
    %0 = "linalg.transpose"(%arg0, %arg1) <{permutation = array<i64: 2, 3, 0, 1>}> ({
    ^bb0(%arg3: f32, %arg4: f32):
      "linalg.yield"(%arg3) : (f32) -> ()
    }) : (tensor<25x30x35x40xf32>, tensor<35x40x25x30xf32>) -> tensor<35x40x25x30xf32>
    %1 = "linalg.pack"(%0, %arg2) <{inner_dims_pos = array<i64: 1, 3, 2>, operandSegmentSizes = array<i32: 1, 1, 0, 0>, outer_dims_perm = array<i64: 3, 0, 2, 1>, static_inner_tiles = array<i64: 5, 10, 5>}> : (tensor<35x40x25x30xf32>, tensor<3x35x5x8x5x10x5xf32>) -> tensor<3x35x5x8x5x10x5xf32>
    "func.return"(%1) : (tensor<3x35x5x8x5x10x5xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<?x?x?x?xf32>, tensor<?x?x?x?xf32>, tensor<?x?x?x?x?x?x?xf32>, index, index, index) -> tensor<?x?x?x?x?x?x?xf32>, sym_name = "linalg_transpose_linalg.pack_fold_dynamic_outer_dims_tile_dims_tile_sizes"}> ({
  ^bb0(%arg0: tensor<?x?x?x?xf32>, %arg1: tensor<?x?x?x?xf32>, %arg2: tensor<?x?x?x?x?x?x?xf32>, %arg3: index, %arg4: index, %arg5: index):
    %0 = "linalg.transpose"(%arg0, %arg1) <{permutation = array<i64: 2, 3, 0, 1>}> ({
    ^bb0(%arg6: f32, %arg7: f32):
      "linalg.yield"(%arg6) : (f32) -> ()
    }) : (tensor<?x?x?x?xf32>, tensor<?x?x?x?xf32>) -> tensor<?x?x?x?xf32>
    %1 = "linalg.pack"(%0, %arg2, %arg3, %arg4, %arg5) <{inner_dims_pos = array<i64: 1, 3, 2>, operandSegmentSizes = array<i32: 1, 1, 0, 3>, outer_dims_perm = array<i64: 3, 0, 2, 1>, static_inner_tiles = array<i64: -9223372036854775808, -9223372036854775808, -9223372036854775808>}> : (tensor<?x?x?x?xf32>, tensor<?x?x?x?x?x?x?xf32>, index, index, index) -> tensor<?x?x?x?x?x?x?xf32>
    "func.return"(%1) : (tensor<?x?x?x?x?x?x?xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<?x32x128xbf16>) -> tensor<32x?x64x16x2xbf16>, sym_name = "linalg_transpose_linalg.pack_multiple_tiles"}> ({
  ^bb0(%arg0: tensor<?x32x128xbf16>):
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index
    %1 = "arith.constant"() <{value = 0.000000e+00 : bf16}> : () -> bf16
    %2 = "tensor.dim"(%arg0, %0) : (tensor<?x32x128xbf16>, index) -> index
    %3 = "tensor.empty"(%2) : (index) -> tensor<32x128x?xbf16>
    %4 = "linalg.transpose"(%arg0, %3) <{permutation = array<i64: 1, 2, 0>}> ({
    ^bb0(%arg1: bf16, %arg2: bf16):
      "linalg.yield"(%arg1) : (bf16) -> ()
    }) : (tensor<?x32x128xbf16>, tensor<32x128x?xbf16>) -> tensor<32x128x?xbf16>
    %5 = "tensor.empty"(%2) : (index) -> tensor<32x?x64x16x2xbf16>
    %6 = "linalg.pack"(%4, %5, %1) <{inner_dims_pos = array<i64: 2, 1>, operandSegmentSizes = array<i32: 1, 1, 1, 0>, outer_dims_perm = array<i64: 0, 2, 1>, static_inner_tiles = array<i64: 16, 2>}> : (tensor<32x128x?xbf16>, tensor<32x?x64x16x2xbf16>, bf16) -> tensor<32x?x64x16x2xbf16>
    "func.return"(%6) : (tensor<32x?x64x16x2xbf16>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<1x1x4x16xi32>) -> tensor<16x4xi32>, sym_name = "linalg_transpose_linalg.unpack_fold"}> ({
  ^bb0(%arg0: tensor<1x1x4x16xi32>):
    %0 = "tensor.empty"() : () -> tensor<1x1x16x4xi32>
    %1 = "linalg.transpose"(%arg0, %0) <{permutation = array<i64: 1, 0, 3, 2>}> ({
    ^bb0(%arg1: i32, %arg2: i32):
      "linalg.yield"(%arg1) : (i32) -> ()
    }) : (tensor<1x1x4x16xi32>, tensor<1x1x16x4xi32>) -> tensor<1x1x16x4xi32>
    %2 = "tensor.empty"() : () -> tensor<16x4xi32>
    %3 = "linalg.unpack"(%1, %2) <{inner_dims_pos = array<i64: 0, 1>, outer_dims_perm = array<i64: 0, 1>, static_inner_tiles = array<i64: 16, 4>}> : (tensor<1x1x16x4xi32>, tensor<16x4xi32>) -> tensor<16x4xi32>
    "func.return"(%3) : (tensor<16x4xi32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<1x1x4x16xi32>) -> (tensor<1x1x16x4xi32>, tensor<16x4xi32>), sym_name = "linalg_transpose_linalg.unpack_fold_multi_result"}> ({
  ^bb0(%arg0: tensor<1x1x4x16xi32>):
    %0 = "tensor.empty"() : () -> tensor<1x1x16x4xi32>
    %1 = "linalg.transpose"(%arg0, %0) <{permutation = array<i64: 1, 0, 3, 2>}> ({
    ^bb0(%arg1: i32, %arg2: i32):
      "linalg.yield"(%arg1) : (i32) -> ()
    }) : (tensor<1x1x4x16xi32>, tensor<1x1x16x4xi32>) -> tensor<1x1x16x4xi32>
    %2 = "tensor.empty"() : () -> tensor<16x4xi32>
    %3 = "linalg.unpack"(%1, %2) <{inner_dims_pos = array<i64: 0, 1>, outer_dims_perm = array<i64: 0, 1>, static_inner_tiles = array<i64: 16, 4>}> : (tensor<1x1x16x4xi32>, tensor<16x4xi32>) -> tensor<16x4xi32>
    "func.return"(%1, %3) : (tensor<1x1x16x4xi32>, tensor<16x4xi32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<1x1x4x16xi32>) -> tensor<15x3xi32>, sym_name = "linalg_transpose_linalg.unpack_fold_partial_tile"}> ({
  ^bb0(%arg0: tensor<1x1x4x16xi32>):
    %0 = "tensor.empty"() : () -> tensor<1x1x16x4xi32>
    %1 = "linalg.transpose"(%arg0, %0) <{permutation = array<i64: 1, 0, 3, 2>}> ({
    ^bb0(%arg1: i32, %arg2: i32):
      "linalg.yield"(%arg1) : (i32) -> ()
    }) : (tensor<1x1x4x16xi32>, tensor<1x1x16x4xi32>) -> tensor<1x1x16x4xi32>
    %2 = "tensor.empty"() : () -> tensor<15x3xi32>
    %3 = "linalg.unpack"(%1, %2) <{inner_dims_pos = array<i64: 0, 1>, outer_dims_perm = array<i64: 0, 1>, static_inner_tiles = array<i64: 16, 4>}> : (tensor<1x1x16x4xi32>, tensor<15x3xi32>) -> tensor<15x3xi32>
    "func.return"(%3) : (tensor<15x3xi32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<?x?x?x?xf32>, tensor<?x?x?x?xf32>, tensor<?x?xf32>, index, index) -> tensor<?x?xf32>, sym_name = "linalg_transpose_linalg.unpack_fold_dynamic_outer_dims_tile_dims_tile_sizes"}> ({
  ^bb0(%arg0: tensor<?x?x?x?xf32>, %arg1: tensor<?x?x?x?xf32>, %arg2: tensor<?x?xf32>, %arg3: index, %arg4: index):
    %0 = "linalg.transpose"(%arg0, %arg1) <{permutation = array<i64: 1, 0, 3, 2>}> ({
    ^bb0(%arg5: f32, %arg6: f32):
      "linalg.yield"(%arg5) : (f32) -> ()
    }) : (tensor<?x?x?x?xf32>, tensor<?x?x?x?xf32>) -> tensor<?x?x?x?xf32>
    %1 = "linalg.unpack"(%0, %arg2, %arg3, %arg4) <{inner_dims_pos = array<i64: 0, 1>, outer_dims_perm = array<i64: 1, 0>, static_inner_tiles = array<i64: -9223372036854775808, -9223372036854775808>}> : (tensor<?x?x?x?xf32>, tensor<?x?xf32>, index, index) -> tensor<?x?xf32>
    "func.return"(%1) : (tensor<?x?xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<56x57x1x64xf32>) -> tensor<3648x56xf32>, sym_name = "linalg.unpack_linalg_transpose_fold"}> ({
  ^bb0(%arg0: tensor<56x57x1x64xf32>):
    %0 = "tensor.empty"() : () -> tensor<56x3648xf32>
    %1 = "linalg.unpack"(%arg0, %0) <{inner_dims_pos = array<i64: 0, 1>, outer_dims_perm = array<i64: 0, 1>, static_inner_tiles = array<i64: 1, 64>}> : (tensor<56x57x1x64xf32>, tensor<56x3648xf32>) -> tensor<56x3648xf32>
    %2 = "tensor.empty"() : () -> tensor<3648x56xf32>
    %3 = "linalg.transpose"(%1, %2) <{permutation = array<i64: 1, 0>}> ({
    ^bb0(%arg1: f32, %arg2: f32):
      "linalg.yield"(%arg1) : (f32) -> ()
    }) : (tensor<56x3648xf32>, tensor<3648x56xf32>) -> tensor<3648x56xf32>
    "func.return"(%3) : (tensor<3648x56xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<71x7x4x16x16xf32>) -> tensor<100x71x64xf32>, sym_name = "tensor_padded_unpack_linalg_transpose_fold"}> ({
  ^bb0(%arg0: tensor<71x7x4x16x16xf32>):
    %0 = "tensor.empty"() : () -> tensor<71x100x64xf32>
    %1 = "linalg.unpack"(%arg0, %0) <{inner_dims_pos = array<i64: 1, 2>, static_inner_tiles = array<i64: 16, 16>}> : (tensor<71x7x4x16x16xf32>, tensor<71x100x64xf32>) -> tensor<71x100x64xf32>
    %2 = "tensor.empty"() : () -> tensor<100x71x64xf32>
    %3 = "linalg.transpose"(%1, %2) <{permutation = array<i64: 1, 0, 2>}> ({
    ^bb0(%arg1: f32, %arg2: f32):
      "linalg.yield"(%arg1) : (f32) -> ()
    }) : (tensor<71x100x64xf32>, tensor<100x71x64xf32>) -> tensor<100x71x64xf32>
    "func.return"(%3) : (tensor<100x71x64xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<2x3x5x4x16xi32>) -> tensor<5x48x8xi32>, sym_name = "non_involution_transpose_unpack_fold"}> ({
  ^bb0(%arg0: tensor<2x3x5x4x16xi32>):
    %0 = "tensor.empty"() : () -> tensor<5x2x3x16x4xi32>
    %1 = "linalg.transpose"(%arg0, %0) <{permutation = array<i64: 2, 0, 1, 4, 3>}> ({
    ^bb0(%arg1: i32, %arg2: i32):
      "linalg.yield"(%arg1) : (i32) -> ()
    }) : (tensor<2x3x5x4x16xi32>, tensor<5x2x3x16x4xi32>) -> tensor<5x2x3x16x4xi32>
    %2 = "tensor.empty"() : () -> tensor<5x48x8xi32>
    %3 = "linalg.unpack"(%1, %2) <{inner_dims_pos = array<i64: 1, 2>, outer_dims_perm = array<i64: 0, 2, 1>, static_inner_tiles = array<i64: 16, 4>}> : (tensor<5x2x3x16x4xi32>, tensor<5x48x8xi32>) -> tensor<5x48x8xi32>
    "func.return"(%3) : (tensor<5x48x8xi32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<57x3x56x1x64xf32>) -> tensor<3648x3x56xf32>, sym_name = "unpack_non_involution_transpose_fold"}> ({
  ^bb0(%arg0: tensor<57x3x56x1x64xf32>):
    %0 = "tensor.empty"() : () -> tensor<3x56x3648xf32>
    %1 = "linalg.unpack"(%arg0, %0) <{inner_dims_pos = array<i64: 1, 2>, outer_dims_perm = array<i64: 2, 0, 1>, static_inner_tiles = array<i64: 1, 64>}> : (tensor<57x3x56x1x64xf32>, tensor<3x56x3648xf32>) -> tensor<3x56x3648xf32>
    %2 = "tensor.empty"() : () -> tensor<3648x3x56xf32>
    %3 = "linalg.transpose"(%1, %2) <{permutation = array<i64: 2, 0, 1>}> ({
    ^bb0(%arg1: f32, %arg2: f32):
      "linalg.yield"(%arg1) : (f32) -> ()
    }) : (tensor<3x56x3648xf32>, tensor<3648x3x56xf32>) -> tensor<3648x3x56xf32>
    "func.return"(%3) : (tensor<3648x3x56xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<2x16x5x4x3xi32>) -> tensor<5x32x12xi32>, sym_name = "transpose_unpacked_dims_no_fold"}> ({
  ^bb0(%arg0: tensor<2x16x5x4x3xi32>):
    %0 = "tensor.empty"() : () -> tensor<5x2x3x16x4xi32>
    %1 = "linalg.transpose"(%arg0, %0) <{permutation = array<i64: 2, 0, 4, 1, 3>}> ({
    ^bb0(%arg1: i32, %arg2: i32):
      "linalg.yield"(%arg1) : (i32) -> ()
    }) : (tensor<2x16x5x4x3xi32>, tensor<5x2x3x16x4xi32>) -> tensor<5x2x3x16x4xi32>
    %2 = "tensor.empty"() : () -> tensor<5x32x12xi32>
    %3 = "linalg.unpack"(%1, %2) <{inner_dims_pos = array<i64: 1, 2>, static_inner_tiles = array<i64: 16, 4>}> : (tensor<5x2x3x16x4xi32>, tensor<5x32x12xi32>) -> tensor<5x32x12xi32>
    "func.return"(%3) : (tensor<5x32x12xi32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1, d2, d3, d4) -> (d1, d2, d0, d4, d3)>
#map1 = affine_map<(d0, d1, d2, d3, d4) -> (d0, d1, d2, d3, d4)>
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<2x3x5x4x16xi32>) -> tensor<5x48x8xi32>, sym_name = "generic_transpose_unpack_fold"}> ({
  ^bb0(%arg0: tensor<2x3x5x4x16xi32>):
    %0 = "tensor.empty"() : () -> tensor<5x2x3x16x4xi32>
    %1 = "linalg.generic"(%arg0, %0) <{indexing_maps = [#map, #map1], iterator_types = [#linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>], operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg1: i32, %arg2: i32):
      "linalg.yield"(%arg1) : (i32) -> ()
    }) : (tensor<2x3x5x4x16xi32>, tensor<5x2x3x16x4xi32>) -> tensor<5x2x3x16x4xi32>
    %2 = "tensor.empty"() : () -> tensor<5x48x8xi32>
    %3 = "linalg.unpack"(%1, %2) <{inner_dims_pos = array<i64: 1, 2>, outer_dims_perm = array<i64: 0, 2, 1>, static_inner_tiles = array<i64: 16, 4>}> : (tensor<5x2x3x16x4xi32>, tensor<5x48x8xi32>) -> tensor<5x48x8xi32>
    "func.return"(%3) : (tensor<5x48x8xi32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1, d2) -> (d1, d2, d0)>
#map1 = affine_map<(d0, d1, d2) -> (d0, d1, d2)>
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<57x3x56x1x64xf32>) -> tensor<3648x3x56xf32>, sym_name = "unpack_generic_transpose_fold"}> ({
  ^bb0(%arg0: tensor<57x3x56x1x64xf32>):
    %0 = "tensor.empty"() : () -> tensor<3x56x3648xf32>
    %1 = "linalg.unpack"(%arg0, %0) <{inner_dims_pos = array<i64: 1, 2>, outer_dims_perm = array<i64: 2, 0, 1>, static_inner_tiles = array<i64: 1, 64>}> : (tensor<57x3x56x1x64xf32>, tensor<3x56x3648xf32>) -> tensor<3x56x3648xf32>
    %2 = "tensor.empty"() : () -> tensor<3648x3x56xf32>
    %3 = "linalg.generic"(%1, %2) <{indexing_maps = [#map, #map1], iterator_types = [#linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>], operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg1: f32, %arg2: f32):
      "linalg.yield"(%arg1) : (f32) -> ()
    }) : (tensor<3x56x3648xf32>, tensor<3648x3x56xf32>) -> tensor<3648x3x56xf32>
    "func.return"(%3) : (tensor<3648x3x56xf32>) -> ()
  }) : () -> ()
}) : () -> ()

