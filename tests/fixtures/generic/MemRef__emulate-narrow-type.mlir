"builtin.module"() ({
  "func.func"() <{function_type = () -> i8, sym_name = "memref_i8"}> ({
    %0 = "arith.constant"() <{value = 3 : index}> : () -> index
    %1 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<4xi8, 1>
    %2 = "memref.load"(%1, %0) : (memref<4xi8, 1>, index) -> i8
    "memref.dealloc"(%1) : (memref<4xi8, 1>) -> ()
    "func.return"(%2) : (i8) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (index) -> i4, sym_name = "memref_load_i4"}> ({
  ^bb0(%arg0: index):
    %0 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<5xi4>
    %1 = "memref.load"(%0, %arg0) : (memref<5xi4>, index) -> i4
    "func.return"(%1) : (i4) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (index) -> f4E2M1FN, sym_name = "memref_load_f4"}> ({
  ^bb0(%arg0: index):
    %0 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<5xf4E2M1FN>
    %1 = "memref.load"(%0, %arg0) : (memref<5xf4E2M1FN>, index) -> f4E2M1FN
    "func.return"(%1) : (f4E2M1FN) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (index, index) -> i4, sym_name = "memref_load_i4_rank2"}> ({
  ^bb0(%arg0: index, %arg1: index):
    %0 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<3x125xi4>
    %1 = "memref.assume_alignment"(%0) <{alignment = 64 : i32}> : (memref<3x125xi4>) -> memref<3x125xi4>
    %2 = "memref.load"(%1, %arg0, %arg1) : (memref<3x125xi4>, index, index) -> i4
    "func.return"(%2) : (i4) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (index, index, index, index) -> i4, sym_name = "memref_load_i4_dynamic"}> ({
  ^bb0(%arg0: index, %arg1: index, %arg2: index, %arg3: index):
    %0 = "memref.alloc"(%arg0, %arg1) <{operandSegmentSizes = array<i32: 2, 0>}> : (index, index) -> memref<?x?xi4>
    %1 = "memref.load"(%0, %arg2, %arg3) : (memref<?x?xi4>, index, index) -> i4
    "func.return"(%1) : (i4) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = () -> i4, sym_name = "rank_zero_memref"}> ({
    %0 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<i4>
    %1 = "memref.load"(%0) : (memref<i4>) -> i4
    "func.return"(%1) : (i4) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (index) -> i4, sym_name = "memref_strided_i4"}> ({
  ^bb0(%arg0: index):
    %0 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<128xi4>
    %1 = "memref.subview"(%0) <{operandSegmentSizes = array<i32: 1, 0, 0, 0>, static_offsets = array<i64: 32>, static_sizes = array<i64: 32>, static_strides = array<i64: 1>}> : (memref<128xi4>) -> memref<32xi4, strided<[1], offset: 32>>
    %2 = "memref.load"(%1, %arg0) : (memref<32xi4, strided<[1], offset: 32>>, index) -> i4
    "func.return"(%2) : (i4) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (index) -> i4, sym_name = "memref_subview_dynamic_offset_i4"}> ({
  ^bb0(%arg0: index):
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index
    %1 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<512x64x8x16xi4>
    %2 = "memref.subview"(%1, %arg0) <{operandSegmentSizes = array<i32: 1, 1, 0, 0>, static_offsets = array<i64: -9223372036854775808, 0, 0, 0>, static_sizes = array<i64: 16, 64, 8, 16>, static_strides = array<i64: 1, 1, 1, 1>}> : (memref<512x64x8x16xi4>, index) -> memref<16x64x8x16xi4, strided<[8192, 128, 16, 1], offset: ?>>
    %3 = "memref.load"(%2, %0, %0, %0, %0) : (memref<16x64x8x16xi4, strided<[8192, 128, 16, 1], offset: ?>>, index, index, index, index) -> i4
    "func.return"(%3) : (i4) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (index) -> i4, sym_name = "negative_memref_subview_non_contiguous"}> ({
  ^bb0(%arg0: index):
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index
    %1 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<40x40xi4>
    %2 = "memref.subview"(%1, %arg0) <{operandSegmentSizes = array<i32: 1, 1, 0, 0>, static_offsets = array<i64: -9223372036854775808, 0>, static_sizes = array<i64: 4, 8>, static_strides = array<i64: 1, 1>}> : (memref<40x40xi4>, index) -> memref<4x8xi4, strided<[40, 1], offset: ?>>
    %3 = "memref.load"(%2, %0, %0) : (memref<4x8xi4, strided<[40, 1], offset: ?>>, index, index) -> i4
    "func.return"(%3) : (i4) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = () -> i4, sym_name = "reinterpret_cast_memref_load_0D"}> ({
    %0 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<5xi4>
    %1 = "memref.reinterpret_cast"(%0) <{operandSegmentSizes = array<i32: 1, 0, 0, 0>, static_offsets = array<i64: 0>, static_sizes = array<i64>, static_strides = array<i64>}> : (memref<5xi4>) -> memref<i4>
    %2 = "memref.load"(%1) : (memref<i4>) -> i4
    "func.return"(%2) : (i4) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (index) -> i4, sym_name = "reinterpret_cast_memref_load_1D"}> ({
  ^bb0(%arg0: index):
    %0 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<5x5xi4>
    %1 = "memref.reinterpret_cast"(%0) <{operandSegmentSizes = array<i32: 1, 0, 0, 0>, static_offsets = array<i64: 8>, static_sizes = array<i64: 25>, static_strides = array<i64: 1>}> : (memref<5x5xi4>) -> memref<25xi4, strided<[1], offset: 8>>
    %2 = "memref.load"(%1, %arg0) : (memref<25xi4, strided<[1], offset: 8>>, index) -> i4
    "func.return"(%2) : (i4) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (index) -> i4, sym_name = "memref_alloca_load_i4"}> ({
  ^bb0(%arg0: index):
    %0 = "memref.alloca"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<5xi4>
    %1 = "memref.load"(%0, %arg0) : (memref<5xi4>, index) -> i4
    "func.return"(%1) : (i4) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (index, i4) -> (), sym_name = "memref_store_i4"}> ({
  ^bb0(%arg0: index, %arg1: i4):
    %0 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<5xi4>
    "memref.store"(%arg1, %0, %arg0) : (i4, memref<5xi4>, index) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (index, index, i4) -> (), sym_name = "memref_store_i4_rank2"}> ({
  ^bb0(%arg0: index, %arg1: index, %arg2: i4):
    %0 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<3x125xi4>
    %1 = "memref.assume_alignment"(%0) <{alignment = 64 : i32}> : (memref<3x125xi4>) -> memref<3x125xi4>
    "memref.store"(%arg2, %1, %arg0, %arg1) : (i4, memref<3x125xi4>, index, index) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (index, index, index, index, i4) -> (), sym_name = "memref_store_i4_dynamic"}> ({
  ^bb0(%arg0: index, %arg1: index, %arg2: index, %arg3: index, %arg4: i4):
    %0 = "memref.alloc"(%arg0, %arg1) <{operandSegmentSizes = array<i32: 2, 0>}> : (index, index) -> memref<?x?xi4>
    "memref.store"(%arg4, %0, %arg2, %arg3) : (i4, memref<?x?xi4>, index, index) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (i4) -> (), sym_name = "rank_zero_memref_store"}> ({
  ^bb0(%arg0: i4):
    %0 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<i4>
    "memref.store"(%arg0, %0) : (i4, memref<i4>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (f4E2M1FN) -> (), sym_name = "rank_zero_memref_store_f4"}> ({
  ^bb0(%arg0: f4E2M1FN):
    %0 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<f4E2M1FN>
    "memref.store"(%arg0, %0) : (f4E2M1FN, memref<f4E2M1FN>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (index, index) -> i4, sym_name = "memref_collapse_shape_i4"}> ({
  ^bb0(%arg0: index, %arg1: index):
    %0 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<32x8x128xi4>
    %1 = "memref.collapse_shape"(%0) <{reassociation = [[0, 1], [2]]}> : (memref<32x8x128xi4>) -> memref<256x128xi4>
    %2 = "memref.load"(%1, %arg0, %arg1) : (memref<256x128xi4>, index, index) -> i4
    "func.return"(%2) : (i4) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (index, index, index) -> i4, sym_name = "memref_expand_shape_i4"}> ({
  ^bb0(%arg0: index, %arg1: index, %arg2: index):
    %0 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<256x128xi4>
    %1 = "memref.expand_shape"(%0) <{reassociation = [[0, 1], [2]], static_output_shape = array<i64: 32, 8, 128>}> : (memref<256x128xi4>) -> memref<32x8x128xi4>
    %2 = "memref.load"(%1, %arg0, %arg1, %arg2) : (memref<32x8x128xi4>, index, index, index) -> i4
    "func.return"(%2) : (i4) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (memref<32x128xi4, 1>) -> memref<32x128xi4>, sym_name = "memref_memory_space_cast_i4"}> ({
  ^bb0(%arg0: memref<32x128xi4, 1>):
    %0 = "memref.memory_space_cast"(%arg0) : (memref<32x128xi4, 1>) -> memref<32x128xi4>
    "func.return"(%0) : (memref<32x128xi4>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (memref<32x128xi4, 1>, memref<32x128xi4>) -> (), sym_name = "memref_copy_i4"}> ({
  ^bb0(%arg0: memref<32x128xi4, 1>, %arg1: memref<32x128xi4>):
    "memref.copy"(%arg0, %arg1) : (memref<32x128xi4, 1>, memref<32x128xi4>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "alloc_non_contiguous"}> ({
    %0 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<8x8xi4, strided<[1, 8]>>
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (memref<8x8xi4, strided<[1, 8]>>) -> (), sym_name = "argument_non_contiguous"}> ({
  ^bb0(%arg0: memref<8x8xi4, strided<[1, 8]>>):
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

