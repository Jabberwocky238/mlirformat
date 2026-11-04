"builtin.module"() ({
  "func.func"() <{function_type = (memref<45x24x256xf32, 1>, memref<24x256xf32, 1>, memref<256xf32, 1>) -> (), sym_name = "optimize_alloc_location", sym_visibility = "private"}> ({
  ^bb0(%arg0: memref<45x24x256xf32, 1>, %arg1: memref<24x256xf32, 1>, %arg2: memref<256xf32, 1>):
    %0 = "arith.constant"() <{value = 1 : index}> : () -> index
    %1 = "memref.alloc"() <{alignment = 64 : i64, operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<45x6144xf32, 1>
    %2 = "memref.expand_shape"(%1) <{reassociation = [[0], [1, 2]], static_output_shape = array<i64: 45, 24, 256>}> : (memref<45x6144xf32, 1>) -> memref<45x24x256xf32, 1>
    %3 = "memref.alloc"() <{alignment = 64 : i64, operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<24x256xf32, 1>
    %4 = "arith.constant"() <{value = 1.000000e+00 : f32}> : () -> f32
    "memref.store"(%4, %3, %0, %0) : (f32, memref<24x256xf32, 1>, index, index) -> ()
    "memref.dealloc"(%1) : (memref<45x6144xf32, 1>) -> ()
    "memref.dealloc"(%3) : (memref<24x256xf32, 1>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (memref<45x24x256xf32, 1>, memref<24x256xf32, 1>, memref<256xf32, 1>) -> (), sym_name = "test_multiple_deallocation_moves", sym_visibility = "private"}> ({
  ^bb0(%arg0: memref<45x24x256xf32, 1>, %arg1: memref<24x256xf32, 1>, %arg2: memref<256xf32, 1>):
    %0 = "arith.constant"() <{value = 1 : index}> : () -> index
    %1 = "memref.alloc"() <{alignment = 64 : i64, operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<45x6144xf32, 1>
    %2 = "memref.expand_shape"(%1) <{reassociation = [[0], [1, 2]], static_output_shape = array<i64: 45, 24, 256>}> : (memref<45x6144xf32, 1>) -> memref<45x24x256xf32, 1>
    %3 = "memref.alloc"() <{alignment = 64 : i64, operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<24x256xf32, 1>
    %4 = "memref.alloc"() <{alignment = 64 : i64, operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<45x6144xf32, 1>
    %5 = "memref.expand_shape"(%4) <{reassociation = [[0], [1, 2]], static_output_shape = array<i64: 45, 24, 256>}> : (memref<45x6144xf32, 1>) -> memref<45x24x256xf32, 1>
    %6 = "memref.alloc"() <{alignment = 64 : i64, operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<45x6144xf32, 1>
    %7 = "memref.expand_shape"(%6) <{reassociation = [[0], [1, 2]], static_output_shape = array<i64: 45, 24, 256>}> : (memref<45x6144xf32, 1>) -> memref<45x24x256xf32, 1>
    %8 = "memref.alloc"() <{alignment = 64 : i64, operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<45x6144xf32, 1>
    %9 = "memref.expand_shape"(%8) <{reassociation = [[0], [1, 2]], static_output_shape = array<i64: 45, 24, 256>}> : (memref<45x6144xf32, 1>) -> memref<45x24x256xf32, 1>
    %10 = "arith.constant"() <{value = 1.000000e+00 : f32}> : () -> f32
    "memref.store"(%10, %3, %0, %0) : (f32, memref<24x256xf32, 1>, index, index) -> ()
    "memref.dealloc"(%1) : (memref<45x6144xf32, 1>) -> ()
    "memref.dealloc"(%3) : (memref<24x256xf32, 1>) -> ()
    "memref.dealloc"(%4) : (memref<45x6144xf32, 1>) -> ()
    "memref.dealloc"(%6) : (memref<45x6144xf32, 1>) -> ()
    "memref.dealloc"(%8) : (memref<45x6144xf32, 1>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1, d2, d3, d4) -> (d0, d1, d2, d3, d4)>
"builtin.module"() ({
  "func.func"() <{function_type = (memref<1x20x20xf32, 1>) -> memref<1x32x32xf32, 1>, sym_name = "test_users_in_different_blocks_linalig_generic", sym_visibility = "private"}> ({
  ^bb0(%arg0: memref<1x20x20xf32, 1>):
    %0 = "arith.constant"() <{value = 0.000000e+00 : f32}> : () -> f32
    %1 = "arith.constant"() <{value = 0 : index}> : () -> index
    %2 = "memref.alloc"() <{alignment = 64 : i64, operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<1x32x32xf32, 1>
    %3 = "memref.subview"(%2) <{operandSegmentSizes = array<i32: 1, 0, 0, 0>, static_offsets = array<i64: 0, 0, 0>, static_sizes = array<i64: 1, 20, 20>, static_strides = array<i64: 1, 1, 1>}> : (memref<1x32x32xf32, 1>) -> memref<1x20x20xf32, strided<[1024, 32, 1]>, 1>
    "memref.copy"(%arg0, %3) : (memref<1x20x20xf32, 1>, memref<1x20x20xf32, strided<[1024, 32, 1]>, 1>) -> ()
    %4 = "memref.alloc"() <{alignment = 64 : i64, operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<1x32x32x1xf32, 1>
    %5 = "memref.alloc"() <{alignment = 64 : i64, operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<1x8x32x1x4xf32, 1>
    "linalg.generic"(%5) <{indexing_maps = [#map], iterator_types = [#linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>], operandSegmentSizes = array<i32: 0, 1>}> ({
    ^bb0(%arg1: f32):
      %7 = "linalg.index"() <{dim = 0 : i64}> : () -> index
      %8 = "memref.load"(%4, %7, %7, %7, %1) : (memref<1x32x32x1xf32, 1>, index, index, index, index) -> f32
      "linalg.yield"(%8) : (f32) -> ()
    }) : (memref<1x8x32x1x4xf32, 1>) -> ()
    %6 = "memref.collapse_shape"(%5) <{reassociation = [[0, 1], [2], [3], [4]]}> : (memref<1x8x32x1x4xf32, 1>) -> memref<8x32x1x4xf32, 1>
    "memref.dealloc"(%4) : (memref<1x32x32x1xf32, 1>) -> ()
    "memref.dealloc"(%5) : (memref<1x8x32x1x4xf32, 1>) -> ()
    "func.return"(%2) : (memref<1x32x32xf32, 1>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (memref<45x24x256xf32, 1>, memref<24x256xf32, 1>, memref<256xf32, 1>) -> (), sym_name = "test_deallocs_in_different_block_forops", sym_visibility = "private"}> ({
  ^bb0(%arg0: memref<45x24x256xf32, 1>, %arg1: memref<24x256xf32, 1>, %arg2: memref<256xf32, 1>):
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index
    %1 = "arith.constant"() <{value = 1 : index}> : () -> index
    %2 = "arith.constant"() <{value = 8 : index}> : () -> index
    %3 = "arith.constant"() <{value = 45 : index}> : () -> index
    %4 = "arith.constant"() <{value = 24 : index}> : () -> index
    %5 = "memref.alloc"() <{alignment = 64 : i64, operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<45x6144xf32, 1>
    %6 = "memref.expand_shape"(%5) <{reassociation = [[0], [1, 2]], static_output_shape = array<i64: 45, 24, 256>}> : (memref<45x6144xf32, 1>) -> memref<45x24x256xf32, 1>
    %7 = "memref.alloc"() <{alignment = 64 : i64, operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<24x256xf32, 1>
    %8 = "memref.alloc"() <{alignment = 64 : i64, operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<45x6144xf32, 1>
    %9 = "memref.expand_shape"(%8) <{reassociation = [[0], [1, 2]], static_output_shape = array<i64: 45, 24, 256>}> : (memref<45x6144xf32, 1>) -> memref<45x24x256xf32, 1>
    "scf.for"(%0, %3, %1) ({
    ^bb0(%arg3: index):
      "scf.for"(%0, %4, %2) ({
      ^bb0(%arg4: index):
        %10 = "memref.subview"(%6, %arg3, %arg4) <{operandSegmentSizes = array<i32: 1, 2, 0, 0>, static_offsets = array<i64: -9223372036854775808, -9223372036854775808, 0>, static_sizes = array<i64: 1, 8, 256>, static_strides = array<i64: 1, 1, 1>}> : (memref<45x24x256xf32, 1>, index, index) -> memref<1x8x256xf32, strided<[6144, 256, 1], offset: ?>, 1>
        %11 = "memref.subview"(%7, %arg4) <{operandSegmentSizes = array<i32: 1, 1, 0, 0>, static_offsets = array<i64: -9223372036854775808, 0>, static_sizes = array<i64: 8, 256>, static_strides = array<i64: 1, 1>}> : (memref<24x256xf32, 1>, index) -> memref<8x256xf32, strided<[256, 1], offset: ?>, 1>
        "scf.yield"() : () -> ()
      }) : (index, index, index) -> ()
      "scf.yield"() : () -> ()
    }) : (index, index, index) -> ()
    "memref.dealloc"(%5) : (memref<45x6144xf32, 1>) -> ()
    "memref.dealloc"(%7) : (memref<24x256xf32, 1>) -> ()
    "memref.dealloc"(%8) : (memref<45x6144xf32, 1>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = () -> memref<32xf32, 1>, sym_name = "test_conditional_deallocation", sym_visibility = "private"}> ({
    %0 = "memref.alloc"() <{alignment = 64 : i64, operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<32xf32, 1>
    %1 = "arith.constant"() <{value = true}> : () -> i1
    %2 = "scf.if"(%1) ({
      "memref.dealloc"(%0) : (memref<32xf32, 1>) -> ()
      %3 = "memref.alloc"() <{alignment = 64 : i64, operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<32xf32, 1>
      "scf.yield"(%3) : (memref<32xf32, 1>) -> ()
    }, {
      "scf.yield"(%0) : (memref<32xf32, 1>) -> ()
    }) : (i1) -> memref<32xf32, 1>
    "func.return"(%2) : (memref<32xf32, 1>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "test_alloc_with_multiple_results", sym_visibility = "private"}> ({
    %0:2 = "test.alloc_with_multiple_results"() : () -> (index, memref<64xf32>)
    %1 = "memref.expand_shape"(%0#1) <{reassociation = [[0, 1]], static_output_shape = array<i64: 8, 8>}> : (memref<64xf32>) -> memref<8x8xf32>
    %2:2 = "test.alloc_with_multiple_results"() : () -> (index, memref<64xf32>)
    %3 = "memref.expand_shape"(%2#1) <{reassociation = [[0, 1]], static_output_shape = array<i64: 8, 8>}> : (memref<64xf32>) -> memref<8x8xf32>
    "memref.dealloc"(%0#1) : (memref<64xf32>) -> ()
    "memref.dealloc"(%2#1) : (memref<64xf32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

