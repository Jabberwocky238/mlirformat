"builtin.module"() ({
  "func.func"() <{function_type = (tensor<256xf32>) -> tensor<8x32xf32>, sym_name = "single_dim_packing"}> ({
  ^bb0(%arg0: tensor<256xf32>):
    %0 = "tensor.empty"() : () -> tensor<8x32xf32>
    %1 = "linalg.pack"(%arg0, %0) <{inner_dims_pos = array<i64: 0>, operandSegmentSizes = array<i32: 1, 1, 0, 0>, static_inner_tiles = array<i64: 32>}> : (tensor<256xf32>, tensor<8x32xf32>) -> tensor<8x32xf32>
    "func.return"(%1) : (tensor<8x32xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<255xf32>) -> tensor<8x32xf32>, sym_name = "single_dim_packing_with_padding"}> ({
  ^bb0(%arg0: tensor<255xf32>):
    %0 = "tensor.empty"() : () -> tensor<8x32xf32>
    %1 = "arith.constant"() <{value = 0.000000e+00 : f32}> : () -> f32
    %2 = "linalg.pack"(%arg0, %0, %1) <{inner_dims_pos = array<i64: 0>, operandSegmentSizes = array<i32: 1, 1, 1, 0>, static_inner_tiles = array<i64: 32>}> : (tensor<255xf32>, tensor<8x32xf32>, f32) -> tensor<8x32xf32>
    "func.return"(%2) : (tensor<8x32xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<5x256xf32>) -> tensor<5x8x32xf32>, sym_name = "single_last_inner_dim_packing"}> ({
  ^bb0(%arg0: tensor<5x256xf32>):
    %0 = "tensor.empty"() : () -> tensor<5x8x32xf32>
    %1 = "linalg.pack"(%arg0, %0) <{inner_dims_pos = array<i64: 1>, operandSegmentSizes = array<i32: 1, 1, 0, 0>, static_inner_tiles = array<i64: 32>}> : (tensor<5x256xf32>, tensor<5x8x32xf32>) -> tensor<5x8x32xf32>
    "func.return"(%1) : (tensor<5x8x32xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<64xf32>) -> tensor<2x32xf32>, sym_name = "pack_1d_with_outer_dims_perm"}> ({
  ^bb0(%arg0: tensor<64xf32>):
    %0 = "tensor.empty"() : () -> tensor<2x32xf32>
    %1 = "linalg.pack"(%arg0, %0) <{inner_dims_pos = array<i64: 0>, operandSegmentSizes = array<i32: 1, 1, 0, 0>, outer_dims_perm = array<i64: 0>, static_inner_tiles = array<i64: 32>}> : (tensor<64xf32>, tensor<2x32xf32>) -> tensor<2x32xf32>
    "func.return"(%1) : (tensor<2x32xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<5x256xf32>) -> tensor<5x8x32xf32>, sym_name = "single_last_inner_dim_packing_with_identity_outer_dims_perm"}> ({
  ^bb0(%arg0: tensor<5x256xf32>):
    %0 = "tensor.empty"() : () -> tensor<5x8x32xf32>
    %1 = "linalg.pack"(%arg0, %0) <{inner_dims_pos = array<i64: 1>, operandSegmentSizes = array<i32: 1, 1, 0, 0>, outer_dims_perm = array<i64: 0, 1>, static_inner_tiles = array<i64: 32>}> : (tensor<5x256xf32>, tensor<5x8x32xf32>) -> tensor<5x8x32xf32>
    "func.return"(%1) : (tensor<5x8x32xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<5x256xf32>) -> tensor<8x5x32xf32>, sym_name = "packing_with_outer_dims_perm"}> ({
  ^bb0(%arg0: tensor<5x256xf32>):
    %0 = "tensor.empty"() : () -> tensor<8x5x32xf32>
    %1 = "linalg.pack"(%arg0, %0) <{inner_dims_pos = array<i64: 1>, operandSegmentSizes = array<i32: 1, 1, 0, 0>, outer_dims_perm = array<i64: 1, 0>, static_inner_tiles = array<i64: 32>}> : (tensor<5x256xf32>, tensor<8x5x32xf32>) -> tensor<8x5x32xf32>
    "func.return"(%1) : (tensor<8x5x32xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<256x5xf32>) -> tensor<8x5x32xf32>, sym_name = "single_first_inner_dim_packing"}> ({
  ^bb0(%arg0: tensor<256x5xf32>):
    %0 = "tensor.empty"() : () -> tensor<8x5x32xf32>
    %1 = "linalg.pack"(%arg0, %0) <{inner_dims_pos = array<i64: 0>, operandSegmentSizes = array<i32: 1, 1, 0, 0>, static_inner_tiles = array<i64: 32>}> : (tensor<256x5xf32>, tensor<8x5x32xf32>) -> tensor<8x5x32xf32>
    "func.return"(%1) : (tensor<8x5x32xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<1x32xf32>) -> tensor<1x32x1x1xf32>, sym_name = "pack_1x32_to_1x32x1x1"}> ({
  ^bb0(%arg0: tensor<1x32xf32>):
    %0 = "tensor.empty"() : () -> tensor<1x32x1x1xf32>
    %1 = "linalg.pack"(%arg0, %0) <{inner_dims_pos = array<i64: 0, 1>, operandSegmentSizes = array<i32: 1, 1, 0, 0>, static_inner_tiles = array<i64: 1, 1>}> : (tensor<1x32xf32>, tensor<1x32x1x1xf32>) -> tensor<1x32x1x1xf32>
    "func.return"(%1) : (tensor<1x32x1x1xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<1x32xf32>) -> tensor<1x16x1x2xf32>, sym_name = "pack_1x32_to_1x16x1x2"}> ({
  ^bb0(%arg0: tensor<1x32xf32>):
    %0 = "tensor.empty"() : () -> tensor<1x16x1x2xf32>
    %1 = "linalg.pack"(%arg0, %0) <{inner_dims_pos = array<i64: 0, 1>, operandSegmentSizes = array<i32: 1, 1, 0, 0>, static_inner_tiles = array<i64: 1, 2>}> : (tensor<1x32xf32>, tensor<1x16x1x2xf32>) -> tensor<1x16x1x2xf32>
    "func.return"(%1) : (tensor<1x16x1x2xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<32x1xf32>) -> tensor<1x16x2x1xf32>, sym_name = "pack_32x1_to_16x1x2x1"}> ({
  ^bb0(%arg0: tensor<32x1xf32>):
    %0 = "tensor.empty"() : () -> tensor<1x16x2x1xf32>
    %1 = "linalg.pack"(%arg0, %0) <{inner_dims_pos = array<i64: 0, 1>, operandSegmentSizes = array<i32: 1, 1, 0, 0>, outer_dims_perm = array<i64: 1, 0>, static_inner_tiles = array<i64: 2, 1>}> : (tensor<32x1xf32>, tensor<1x16x2x1xf32>) -> tensor<1x16x2x1xf32>
    "func.return"(%1) : (tensor<1x16x2x1xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<32x1xf32>) -> tensor<16x1x1x2xf32>, sym_name = "pack_32x1_to_16x1x1x2"}> ({
  ^bb0(%arg0: tensor<32x1xf32>):
    %0 = "tensor.empty"() : () -> tensor<16x1x1x2xf32>
    %1 = "linalg.pack"(%arg0, %0) <{inner_dims_pos = array<i64: 1, 0>, operandSegmentSizes = array<i32: 1, 1, 0, 0>, static_inner_tiles = array<i64: 1, 2>}> : (tensor<32x1xf32>, tensor<16x1x1x2xf32>) -> tensor<16x1x1x2xf32>
    "func.return"(%1) : (tensor<16x1x1x2xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<8x32xf32>) -> tensor<256xf32>, sym_name = "unpack_1d_to_collapse"}> ({
  ^bb0(%arg0: tensor<8x32xf32>):
    %0 = "tensor.empty"() : () -> tensor<256xf32>
    %1 = "linalg.unpack"(%arg0, %0) <{inner_dims_pos = array<i64: 0>, static_inner_tiles = array<i64: 32>}> : (tensor<8x32xf32>, tensor<256xf32>) -> tensor<256xf32>
    "func.return"(%1) : (tensor<256xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<8x32xf32>) -> tensor<255xf32>, sym_name = "unpack_to_partial_slice"}> ({
  ^bb0(%arg0: tensor<8x32xf32>):
    %0 = "tensor.empty"() : () -> tensor<255xf32>
    %1 = "linalg.unpack"(%arg0, %0) <{inner_dims_pos = array<i64: 0>, static_inner_tiles = array<i64: 32>}> : (tensor<8x32xf32>, tensor<255xf32>) -> tensor<255xf32>
    "func.return"(%1) : (tensor<255xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<?x32xf32>) -> tensor<?xf32>, sym_name = "unpack_dynamic"}> ({
  ^bb0(%arg0: tensor<?x32xf32>):
    %0 = "arith.constant"() <{value = 32 : index}> : () -> index
    %1 = "arith.constant"() <{value = 0 : index}> : () -> index
    %2 = "tensor.dim"(%arg0, %1) : (tensor<?x32xf32>, index) -> index
    %3 = "arith.muli"(%2, %0) <{overflowFlags = #arith.overflow<none>}> : (index, index) -> index
    %4 = "tensor.empty"(%3) : (index) -> tensor<?xf32>
    %5 = "linalg.unpack"(%arg0, %4) <{inner_dims_pos = array<i64: 0>, static_inner_tiles = array<i64: 32>}> : (tensor<?x32xf32>, tensor<?xf32>) -> tensor<?xf32>
    "func.return"(%5) : (tensor<?xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<5x8x32xf32>) -> tensor<5x256xf32>, sym_name = "single_last_inner_dim_unpacking"}> ({
  ^bb0(%arg0: tensor<5x8x32xf32>):
    %0 = "tensor.empty"() : () -> tensor<5x256xf32>
    %1 = "linalg.unpack"(%arg0, %0) <{inner_dims_pos = array<i64: 1>, static_inner_tiles = array<i64: 32>}> : (tensor<5x8x32xf32>, tensor<5x256xf32>) -> tensor<5x256xf32>
    "func.return"(%1) : (tensor<5x256xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<5x8x32xf32>) -> tensor<5x256xf32>, sym_name = "single_last_inner_dim_unpacking_with_identity_outer_dims_perm"}> ({
  ^bb0(%arg0: tensor<5x8x32xf32>):
    %0 = "tensor.empty"() : () -> tensor<5x256xf32>
    %1 = "linalg.unpack"(%arg0, %0) <{inner_dims_pos = array<i64: 1>, outer_dims_perm = array<i64: 0, 1>, static_inner_tiles = array<i64: 32>}> : (tensor<5x8x32xf32>, tensor<5x256xf32>) -> tensor<5x256xf32>
    "func.return"(%1) : (tensor<5x256xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<8x5x32xf32>) -> tensor<5x256xf32>, sym_name = "unpacking_with_outer_dims_perm"}> ({
  ^bb0(%arg0: tensor<8x5x32xf32>):
    %0 = "tensor.empty"() : () -> tensor<5x256xf32>
    %1 = "linalg.unpack"(%arg0, %0) <{inner_dims_pos = array<i64: 1>, outer_dims_perm = array<i64: 1, 0>, static_inner_tiles = array<i64: 32>}> : (tensor<8x5x32xf32>, tensor<5x256xf32>) -> tensor<5x256xf32>
    "func.return"(%1) : (tensor<5x256xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<8x5x32xf32>) -> tensor<256x5xf32>, sym_name = "single_first_inner_dim_unpacking"}> ({
  ^bb0(%arg0: tensor<8x5x32xf32>):
    %0 = "tensor.empty"() : () -> tensor<256x5xf32>
    %1 = "linalg.unpack"(%arg0, %0) <{inner_dims_pos = array<i64: 0>, static_inner_tiles = array<i64: 32>}> : (tensor<8x5x32xf32>, tensor<256x5xf32>) -> tensor<256x5xf32>
    "func.return"(%1) : (tensor<256x5xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<1x32x1x1xf32>) -> tensor<1x32xf32>, sym_name = "unpack_1x32x1x1_to_1x32"}> ({
  ^bb0(%arg0: tensor<1x32x1x1xf32>):
    %0 = "tensor.empty"() : () -> tensor<1x32xf32>
    %1 = "linalg.unpack"(%arg0, %0) <{inner_dims_pos = array<i64: 0, 1>, static_inner_tiles = array<i64: 1, 1>}> : (tensor<1x32x1x1xf32>, tensor<1x32xf32>) -> tensor<1x32xf32>
    "func.return"(%1) : (tensor<1x32xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<1x2x1x16xf32>) -> tensor<1x32xf32>, sym_name = "unpack_1x2x1x16_to_1x32"}> ({
  ^bb0(%arg0: tensor<1x2x1x16xf32>):
    %0 = "tensor.empty"() : () -> tensor<1x32xf32>
    %1 = "linalg.unpack"(%arg0, %0) <{inner_dims_pos = array<i64: 0, 1>, outer_dims_perm = array<i64: 0, 1>, static_inner_tiles = array<i64: 1, 16>}> : (tensor<1x2x1x16xf32>, tensor<1x32xf32>) -> tensor<1x32xf32>
    "func.return"(%1) : (tensor<1x32xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<1x16x2x1xf32>) -> tensor<32x1xf32>, sym_name = "unpack_16x1x2x1_to_32x1"}> ({
  ^bb0(%arg0: tensor<1x16x2x1xf32>):
    %0 = "tensor.empty"() : () -> tensor<32x1xf32>
    %1 = "linalg.unpack"(%arg0, %0) <{inner_dims_pos = array<i64: 0, 1>, outer_dims_perm = array<i64: 1, 0>, static_inner_tiles = array<i64: 2, 1>}> : (tensor<1x16x2x1xf32>, tensor<32x1xf32>) -> tensor<32x1xf32>
    "func.return"(%1) : (tensor<32x1xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<16x1x1x2xf32>) -> tensor<32x1xf32>, sym_name = "unpack_16x1x1x2_to_32x1"}> ({
  ^bb0(%arg0: tensor<16x1x1x2xf32>):
    %0 = "tensor.empty"() : () -> tensor<32x1xf32>
    %1 = "linalg.unpack"(%arg0, %0) <{inner_dims_pos = array<i64: 1, 0>, static_inner_tiles = array<i64: 1, 2>}> : (tensor<16x1x1x2xf32>, tensor<32x1xf32>) -> tensor<32x1xf32>
    "func.return"(%1) : (tensor<32x1xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<32x64xf32>) -> tensor<1x1x32x64xf32>, sym_name = "pad_like_pack"}> ({
  ^bb0(%arg0: tensor<32x64xf32>):
    %0 = "tensor.empty"() : () -> tensor<1x1x32x64xf32>
    %1 = "linalg.pack"(%arg0, %0) <{inner_dims_pos = array<i64: 0, 1>, operandSegmentSizes = array<i32: 1, 1, 0, 0>, static_inner_tiles = array<i64: 32, 64>}> : (tensor<32x64xf32>, tensor<1x1x32x64xf32>) -> tensor<1x1x32x64xf32>
    "func.return"(%1) : (tensor<1x1x32x64xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<32x64xf32>) -> tensor<1x1x32x64xf32>, sym_name = "pad_like_pack_with_outer_dims_perm"}> ({
  ^bb0(%arg0: tensor<32x64xf32>):
    %0 = "tensor.empty"() : () -> tensor<1x1x32x64xf32>
    %1 = "linalg.pack"(%arg0, %0) <{inner_dims_pos = array<i64: 0, 1>, operandSegmentSizes = array<i32: 1, 1, 0, 0>, outer_dims_perm = array<i64: 1, 0>, static_inner_tiles = array<i64: 32, 64>}> : (tensor<32x64xf32>, tensor<1x1x32x64xf32>) -> tensor<1x1x32x64xf32>
    "func.return"(%1) : (tensor<1x1x32x64xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<32x64xf32>) -> tensor<32x1x64xf32>, sym_name = "inner_pad_like_pack"}> ({
  ^bb0(%arg0: tensor<32x64xf32>):
    %0 = "tensor.empty"() : () -> tensor<32x1x64xf32>
    %1 = "linalg.pack"(%arg0, %0) <{inner_dims_pos = array<i64: 1>, operandSegmentSizes = array<i32: 1, 1, 0, 0>, static_inner_tiles = array<i64: 64>}> : (tensor<32x64xf32>, tensor<32x1x64xf32>) -> tensor<32x1x64xf32>
    "func.return"(%1) : (tensor<32x1x64xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<32x64xf32>) -> tensor<1x1x64x32xf32>, sym_name = "pad_and_inner_dim_shuffle_pack"}> ({
  ^bb0(%arg0: tensor<32x64xf32>):
    %0 = "tensor.empty"() : () -> tensor<1x1x64x32xf32>
    %1 = "linalg.pack"(%arg0, %0) <{inner_dims_pos = array<i64: 1, 0>, operandSegmentSizes = array<i32: 1, 1, 0, 0>, static_inner_tiles = array<i64: 64, 32>}> : (tensor<32x64xf32>, tensor<1x1x64x32xf32>) -> tensor<1x1x64x32xf32>
    "func.return"(%1) : (tensor<1x1x64x32xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<32x64x16xf32>) -> tensor<32x1x16x64xf32>, sym_name = "pad_like_pack_with_transpose"}> ({
  ^bb0(%arg0: tensor<32x64x16xf32>):
    %0 = "tensor.empty"() : () -> tensor<32x1x16x64xf32>
    %1 = "linalg.pack"(%arg0, %0) <{inner_dims_pos = array<i64: 1>, operandSegmentSizes = array<i32: 1, 1, 0, 0>, static_inner_tiles = array<i64: 64>}> : (tensor<32x64x16xf32>, tensor<32x1x16x64xf32>) -> tensor<32x1x16x64xf32>
    "func.return"(%1) : (tensor<32x1x16x64xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<1x1x32x64xf32>) -> tensor<32x64xf32>, sym_name = "unpad_like_unpack"}> ({
  ^bb0(%arg0: tensor<1x1x32x64xf32>):
    %0 = "tensor.empty"() : () -> tensor<32x64xf32>
    %1 = "linalg.unpack"(%arg0, %0) <{inner_dims_pos = array<i64: 0, 1>, static_inner_tiles = array<i64: 32, 64>}> : (tensor<1x1x32x64xf32>, tensor<32x64xf32>) -> tensor<32x64xf32>
    "func.return"(%1) : (tensor<32x64xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<1x1x32x64xf32>) -> tensor<32x64xf32>, sym_name = "unpad_like_unpack_with_outer_dims_perm"}> ({
  ^bb0(%arg0: tensor<1x1x32x64xf32>):
    %0 = "tensor.empty"() : () -> tensor<32x64xf32>
    %1 = "linalg.unpack"(%arg0, %0) <{inner_dims_pos = array<i64: 0, 1>, outer_dims_perm = array<i64: 1, 0>, static_inner_tiles = array<i64: 32, 64>}> : (tensor<1x1x32x64xf32>, tensor<32x64xf32>) -> tensor<32x64xf32>
    "func.return"(%1) : (tensor<32x64xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<32x1x64xf32>) -> tensor<32x64xf32>, sym_name = "inner_unpad_like_unpack"}> ({
  ^bb0(%arg0: tensor<32x1x64xf32>):
    %0 = "tensor.empty"() : () -> tensor<32x64xf32>
    %1 = "linalg.unpack"(%arg0, %0) <{inner_dims_pos = array<i64: 1>, static_inner_tiles = array<i64: 64>}> : (tensor<32x1x64xf32>, tensor<32x64xf32>) -> tensor<32x64xf32>
    "func.return"(%1) : (tensor<32x64xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<1x1x32x64xf32>) -> tensor<64x32xf32>, sym_name = "unpad_and_inner_dim_shuffle_pack"}> ({
  ^bb0(%arg0: tensor<1x1x32x64xf32>):
    %0 = "tensor.empty"() : () -> tensor<64x32xf32>
    %1 = "linalg.unpack"(%arg0, %0) <{inner_dims_pos = array<i64: 1, 0>, static_inner_tiles = array<i64: 32, 64>}> : (tensor<1x1x32x64xf32>, tensor<64x32xf32>) -> tensor<64x32xf32>
    "func.return"(%1) : (tensor<64x32xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<32x1x16x64xf32>) -> tensor<32x64x16xf32>, sym_name = "unpad_like_unpack_with_transpose"}> ({
  ^bb0(%arg0: tensor<32x1x16x64xf32>):
    %0 = "tensor.empty"() : () -> tensor<32x64x16xf32>
    %1 = "linalg.unpack"(%arg0, %0) <{inner_dims_pos = array<i64: 1>, static_inner_tiles = array<i64: 64>}> : (tensor<32x1x16x64xf32>, tensor<32x64x16xf32>) -> tensor<32x64x16xf32>
    "func.return"(%1) : (tensor<32x64x16xf32>) -> ()
  }) : () -> ()
}) : () -> ()

