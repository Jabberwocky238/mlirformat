"builtin.module"() ({
  "func.func"() <{function_type = (memref<5x4xf32, strided<[4, 1], offset: 2>>) -> (memref<f32>, index, index, index, index, index), sym_name = "extract_strided_metadata_constants"}> ({
  ^bb0(%arg0: memref<5x4xf32, strided<[4, 1], offset: 2>>):
    %0:6 = "memref.extract_strided_metadata"(%arg0) : (memref<5x4xf32, strided<[4, 1], offset: 2>>) -> (memref<f32>, index, index, index, index, index)
    "func.return"(%0#0, %0#1, %0#2, %0#3, %0#4, %0#5) : (memref<f32>, index, index, index, index, index) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (memref<?x?x?xf32, strided<[?, ?, ?], offset: ?>>, index, index, index, index, index, index, index, index, index) -> memref<?x?x?xf32, strided<[?, ?, ?], offset: ?>>, sym_name = "simplify_subview_all_dynamic"}> ({
  ^bb0(%arg0: memref<?x?x?xf32, strided<[?, ?, ?], offset: ?>>, %arg1: index, %arg2: index, %arg3: index, %arg4: index, %arg5: index, %arg6: index, %arg7: index, %arg8: index, %arg9: index):
    %0 = "memref.subview"(%arg0, %arg1, %arg2, %arg3, %arg4, %arg5, %arg6, %arg7, %arg8, %arg9) <{operandSegmentSizes = array<i32: 1, 3, 3, 3>, static_offsets = array<i64: -9223372036854775808, -9223372036854775808, -9223372036854775808>, static_sizes = array<i64: -9223372036854775808, -9223372036854775808, -9223372036854775808>, static_strides = array<i64: -9223372036854775808, -9223372036854775808, -9223372036854775808>}> : (memref<?x?x?xf32, strided<[?, ?, ?], offset: ?>>, index, index, index, index, index, index, index, index, index) -> memref<?x?x?xf32, strided<[?, ?, ?], offset: ?>>
    "func.return"(%0) : (memref<?x?x?xf32, strided<[?, ?, ?], offset: ?>>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (memref<5x4xf32>) -> (memref<f32>, index, index, index, index, index), sym_name = "extract_strided_metadata_of_subview"}> ({
  ^bb0(%arg0: memref<5x4xf32>):
    %0 = "memref.subview"(%arg0) <{operandSegmentSizes = array<i32: 1, 0, 0, 0>, static_offsets = array<i64: 0, 2>, static_sizes = array<i64: 2, 2>, static_strides = array<i64: 1, 1>}> : (memref<5x4xf32>) -> memref<2x2xf32, strided<[4, 1], offset: 2>>
    %1:6 = "memref.extract_strided_metadata"(%0) : (memref<2x2xf32, strided<[4, 1], offset: 2>>) -> (memref<f32>, index, index, index, index, index)
    "func.return"(%1#0, %1#1, %1#2, %1#3, %1#4, %1#5) : (memref<f32>, index, index, index, index, index) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (memref<8x16x24xf32>, index) -> (memref<f32>, index, index, index, index, index, index, index), sym_name = "extract_strided_metadata_of_subview_with_dynamic_size"}> ({
  ^bb0(%arg0: memref<8x16x24xf32>, %arg1: index):
    %0 = "memref.subview"(%arg0, %arg1) <{operandSegmentSizes = array<i32: 1, 0, 1, 0>, static_offsets = array<i64: 3, 4, 2>, static_sizes = array<i64: -9223372036854775808, 6, 3>, static_strides = array<i64: 1, 1, 1>}> : (memref<8x16x24xf32>, index) -> memref<?x6x3xf32, strided<[384, 24, 1], offset: 1250>>
    %1:8 = "memref.extract_strided_metadata"(%0) : (memref<?x6x3xf32, strided<[384, 24, 1], offset: 1250>>) -> (memref<f32>, index, index, index, index, index, index, index)
    "func.return"(%1#0, %1#1, %1#2, %1#3, %1#4, %1#5, %1#6, %1#7) : (memref<f32>, index, index, index, index, index, index, index) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (memref<8x16x24xf32>) -> (memref<f32>, index, index, index, index, index), sym_name = "extract_strided_metadata_of_rank_reduced_subview"}> ({
  ^bb0(%arg0: memref<8x16x24xf32>):
    %0 = "memref.subview"(%arg0) <{operandSegmentSizes = array<i32: 1, 0, 0, 0>, static_offsets = array<i64: 3, 4, 2>, static_sizes = array<i64: 1, 6, 3>, static_strides = array<i64: 1, 1, 1>}> : (memref<8x16x24xf32>) -> memref<6x3xf32, strided<[24, 1], offset: 1250>>
    %1:6 = "memref.extract_strided_metadata"(%0) : (memref<6x3xf32, strided<[24, 1], offset: 1250>>) -> (memref<f32>, index, index, index, index, index)
    "func.return"(%1#0, %1#1, %1#2, %1#3, %1#4, %1#5) : (memref<f32>, index, index, index, index, index) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (memref<8x16x24xf32>, index) -> (memref<f32>, index, index, index, index, index), sym_name = "extract_strided_metadata_of_rank_reduced_subview_w_variable_strides"}> ({
  ^bb0(%arg0: memref<8x16x24xf32>, %arg1: index):
    %0 = "memref.subview"(%arg0, %arg1) <{operandSegmentSizes = array<i32: 1, 0, 0, 1>, static_offsets = array<i64: 3, 4, 2>, static_sizes = array<i64: 1, 6, 3>, static_strides = array<i64: 1, -9223372036854775808, 1>}> : (memref<8x16x24xf32>, index) -> memref<6x3xf32, strided<[?, 1], offset: 1250>>
    %1:6 = "memref.extract_strided_metadata"(%0) : (memref<6x3xf32, strided<[?, 1], offset: 1250>>) -> (memref<f32>, index, index, index, index, index)
    "func.return"(%1#0, %1#1, %1#2, %1#3, %1#4, %1#5) : (memref<f32>, index, index, index, index, index) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (memref<384x128xf32>, index, index) -> (memref<f32>, index, index, index, index, index), sym_name = "extract_strided_metadata_of_subview_w_variable_offset"}> ({
  ^bb0(%arg0: memref<384x128xf32>, %arg1: index, %arg2: index):
    %0 = "memref.subview"(%arg0, %arg1, %arg2) <{operandSegmentSizes = array<i32: 1, 2, 0, 0>, static_offsets = array<i64: -9223372036854775808, -9223372036854775808>, static_sizes = array<i64: 64, 64>, static_strides = array<i64: 1, 1>}> : (memref<384x128xf32>, index, index) -> memref<64x64xf32, strided<[128, 1], offset: ?>>
    %1:6 = "memref.extract_strided_metadata"(%0) : (memref<64x64xf32, strided<[128, 1], offset: ?>>) -> (memref<f32>, index, index, index, index, index)
    "func.return"(%1#0, %1#1, %1#2, %1#3, %1#4, %1#5) : (memref<f32>, index, index, index, index, index) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (memref<?x?x?xf32, strided<[?, ?, ?], offset: ?>>, index, index, index, index, index, index, index, index, index) -> (memref<f32>, index, index, index, index, index, index, index), sym_name = "extract_strided_metadata_of_subview_all_dynamic"}> ({
  ^bb0(%arg0: memref<?x?x?xf32, strided<[?, ?, ?], offset: ?>>, %arg1: index, %arg2: index, %arg3: index, %arg4: index, %arg5: index, %arg6: index, %arg7: index, %arg8: index, %arg9: index):
    %0 = "memref.subview"(%arg0, %arg1, %arg2, %arg3, %arg4, %arg5, %arg6, %arg7, %arg8, %arg9) <{operandSegmentSizes = array<i32: 1, 3, 3, 3>, static_offsets = array<i64: -9223372036854775808, -9223372036854775808, -9223372036854775808>, static_sizes = array<i64: -9223372036854775808, -9223372036854775808, -9223372036854775808>, static_strides = array<i64: -9223372036854775808, -9223372036854775808, -9223372036854775808>}> : (memref<?x?x?xf32, strided<[?, ?, ?], offset: ?>>, index, index, index, index, index, index, index, index, index) -> memref<?x?x?xf32, strided<[?, ?, ?], offset: ?>>
    %1:8 = "memref.extract_strided_metadata"(%0) : (memref<?x?x?xf32, strided<[?, ?, ?], offset: ?>>) -> (memref<f32>, index, index, index, index, index, index, index)
    "func.return"(%1#0, %1#1, %1#2, %1#3, %1#4, %1#5, %1#6, %1#7) : (memref<f32>, index, index, index, index, index, index, index) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (memref<?x?xf32, strided<[?, ?], offset: ?>>, index, index, index, index, index, index, index, index, index, index, index) -> memref<?x7x8x9x10x2x?x3xf32, strided<[?, ?, ?, ?, ?, ?, ?, ?], offset: ?>>, sym_name = "simplify_expand_shape"}> ({
  ^bb0(%arg0: memref<?x?xf32, strided<[?, ?], offset: ?>>, %arg1: index, %arg2: index, %arg3: index, %arg4: index, %arg5: index, %arg6: index, %arg7: index, %arg8: index, %arg9: index, %arg10: index, %arg11: index):
    %0 = "memref.expand_shape"(%arg0, %arg10, %arg11) <{reassociation = [[0, 1, 2, 3], [4, 5, 6, 7]], static_output_shape = array<i64: -9223372036854775808, 7, 8, 9, 10, 2, -9223372036854775808, 3>}> : (memref<?x?xf32, strided<[?, ?], offset: ?>>, index, index) -> memref<?x7x8x9x10x2x?x3xf32, strided<[?, ?, ?, ?, ?, ?, ?, ?], offset: ?>>
    "func.return"(%0) : (memref<?x7x8x9x10x2x?x3xf32, strided<[?, ?, ?, ?, ?, ?, ?, ?], offset: ?>>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (memref<30x4xi16>) -> (memref<i16>, index, index, index, index, index, index, index, index, index, index, index), sym_name = "extract_strided_metadata_of_expand_shape_all_static"}> ({
  ^bb0(%arg0: memref<30x4xi16>):
    %0 = "memref.expand_shape"(%arg0) <{reassociation = [[0, 1, 2], [3, 4]], static_output_shape = array<i64: 3, 5, 2, 2, 2>}> : (memref<30x4xi16>) -> memref<3x5x2x2x2xi16>
    %1:12 = "memref.extract_strided_metadata"(%0) : (memref<3x5x2x2x2xi16>) -> (memref<i16>, index, index, index, index, index, index, index, index, index, index, index)
    "func.return"(%1#0, %1#1, %1#2, %1#3, %1#4, %1#5, %1#6, %1#7, %1#8, %1#9, %1#10, %1#11) : (memref<i16>, index, index, index, index, index, index, index, index, index, index, index) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (memref<?x?xf32, strided<[?, ?], offset: ?>>, index, index, index, index, index, index, index, index, index, index, index) -> (memref<f32>, index, index, index, index, index, index, index, index, index, index, index, index, index, index, index, index, index), sym_name = "extract_strided_metadata_of_expand_shape_all_dynamic"}> ({
  ^bb0(%arg0: memref<?x?xf32, strided<[?, ?], offset: ?>>, %arg1: index, %arg2: index, %arg3: index, %arg4: index, %arg5: index, %arg6: index, %arg7: index, %arg8: index, %arg9: index, %arg10: index, %arg11: index):
    %0 = "memref.expand_shape"(%arg0, %arg10, %arg11) <{reassociation = [[0, 1, 2, 3], [4, 5, 6, 7]], static_output_shape = array<i64: -9223372036854775808, 7, 8, 9, 10, 2, -9223372036854775808, 3>}> : (memref<?x?xf32, strided<[?, ?], offset: ?>>, index, index) -> memref<?x7x8x9x10x2x?x3xf32, strided<[?, ?, ?, ?, ?, ?, ?, ?], offset: ?>>
    %1:18 = "memref.extract_strided_metadata"(%0) : (memref<?x7x8x9x10x2x?x3xf32, strided<[?, ?, ?, ?, ?, ?, ?, ?], offset: ?>>) -> (memref<f32>, index, index, index, index, index, index, index, index, index, index, index, index, index, index, index, index, index)
    "func.return"(%1#0, %1#1, %1#2, %1#3, %1#4, %1#5, %1#6, %1#7, %1#8, %1#9, %1#10, %1#11, %1#12, %1#13, %1#14, %1#15, %1#16, %1#17) : (memref<f32>, index, index, index, index, index, index, index, index, index, index, index, index, index, index, index, index, index) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (memref<i16, strided<[], offset: ?>>) -> (memref<i16>, index, index, index, index, index, index, index, index, index, index, index), sym_name = "extract_strided_metadata_of_expand_shape_all_static_0_rank"}> ({
  ^bb0(%arg0: memref<i16, strided<[], offset: ?>>):
    %0 = "memref.expand_shape"(%arg0) <{reassociation = [], static_output_shape = array<i64: 1, 1, 1, 1, 1>}> : (memref<i16, strided<[], offset: ?>>) -> memref<1x1x1x1x1xi16, strided<[1, 1, 1, 1, 1], offset: ?>>
    %1:12 = "memref.extract_strided_metadata"(%0) : (memref<1x1x1x1x1xi16, strided<[1, 1, 1, 1, 1], offset: ?>>) -> (memref<i16>, index, index, index, index, index, index, index, index, index, index, index)
    "func.return"(%1#0, %1#1, %1#2, %1#3, %1#4, %1#5, %1#6, %1#7, %1#8, %1#9, %1#10, %1#11) : (memref<i16>, index, index, index, index, index, index, index, index, index, index, index) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = () -> (memref<i16>, index), sym_name = "extract_strided_metadata_of_alloc_all_static_0_rank"}> ({
    %0 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<i16>
    %1:2 = "memref.extract_strided_metadata"(%0) : (memref<i16>) -> (memref<i16>, index)
    "func.return"(%1#0, %1#1) : (memref<i16>, index) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (index, index, index) -> (memref<i16>, index, index, index, index, index, index, index, index, index), sym_name = "extract_strided_metadata_of_alloc_dyn_size"}> ({
  ^bb0(%arg0: index, %arg1: index, %arg2: index):
    %0 = "memref.alloc"(%arg0, %arg1, %arg2) <{operandSegmentSizes = array<i32: 3, 0>}> : (index, index, index) -> memref<?x4x?x?xi16>
    %1:10 = "memref.extract_strided_metadata"(%0) : (memref<?x4x?x?xi16>) -> (memref<i16>, index, index, index, index, index, index, index, index, index)
    "func.return"(%1#0, %1#1, %1#2, %1#3, %1#4, %1#5, %1#6, %1#7, %1#8, %1#9) : (memref<i16>, index, index, index, index, index, index, index, index, index) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (index, index, index) -> (memref<i16>, index, index, index, index, index, index, index, index, index), sym_name = "extract_strided_metadata_of_alloca_dyn_size"}> ({
  ^bb0(%arg0: index, %arg1: index, %arg2: index):
    %0 = "memref.alloca"(%arg0, %arg1, %arg2) <{operandSegmentSizes = array<i32: 3, 0>}> : (index, index, index) -> memref<?x?x4x?xi16>
    %1:10 = "memref.extract_strided_metadata"(%0) : (memref<?x?x4x?xi16>) -> (memref<i16>, index, index, index, index, index, index, index, index, index)
    "func.return"(%1#0, %1#1, %1#2, %1#3, %1#4, %1#5, %1#6, %1#7, %1#8, %1#9) : (memref<i16>, index, index, index, index, index, index, index, index, index) -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0)[s0] -> (d0 + s0)>
"builtin.module"() ({
  "func.func"() <{function_type = (index) -> (memref<i16>, index, index, index), sym_name = "extract_strided_metadata_of_alloc_with_variable_offset"}> ({
  ^bb0(%arg0: index):
    %0 = "memref.alloc"(%arg0) <{operandSegmentSizes = array<i32: 0, 1>}> : (index) -> memref<4xi16, #map>
    %1:4 = "memref.extract_strided_metadata"(%0) : (memref<4xi16, #map>) -> (memref<i16>, index, index, index)
    "func.return"(%1#0, %1#1, %1#2, %1#3) : (memref<i16>, index, index, index) -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0) -> (d0 + 12)>
"builtin.module"() ({
  "func.func"() <{function_type = (index) -> (memref<i16>, index, index, index), sym_name = "extract_strided_metadata_of_alloc_with_cst_offset"}> ({
  ^bb0(%arg0: index):
    %0 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<4xi16, #map>
    %1:4 = "memref.extract_strided_metadata"(%0) : (memref<4xi16, #map>) -> (memref<i16>, index, index, index)
    "func.return"(%1#0, %1#1, %1#2, %1#3) : (memref<i16>, index, index, index) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (index) -> (memref<i16>, index, index, index), sym_name = "extract_strided_metadata_of_alloc_with_cst_offset_in_type"}> ({
  ^bb0(%arg0: index):
    %0 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<4xi16, strided<[1], offset: 10>>
    %1:4 = "memref.extract_strided_metadata"(%0) : (memref<4xi16, strided<[1], offset: 10>>) -> (memref<i16>, index, index, index)
    "func.return"(%1#0, %1#1, %1#2, %1#3) : (memref<i16>, index, index, index) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (index) -> (memref<i16>, index, index, index), sym_name = "extract_strided_metadata_of_alloc_with_strided"}> ({
  ^bb0(%arg0: index):
    %0 = "memref.alloc"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<4xi16, strided<[12]>>
    %1:4 = "memref.extract_strided_metadata"(%0) : (memref<4xi16, strided<[12]>>) -> (memref<i16>, index, index, index)
    "func.return"(%1#0, %1#1, %1#2, %1#3) : (memref<i16>, index, index, index) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (memref<f32>) -> index, sym_name = "extract_aligned_pointer_as_index"}> ({
  ^bb0(%arg0: memref<f32>):
    %0 = "memref.subview"(%arg0) <{operandSegmentSizes = array<i32: 1, 0, 0, 0>, static_offsets = array<i64>, static_sizes = array<i64>, static_strides = array<i64>}> : (memref<f32>) -> memref<f32>
    %1 = "memref.extract_aligned_pointer_as_index"(%arg0) : (memref<f32>) -> index
    "func.return"(%1) : (index) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (memref<*xf32>) -> index, sym_name = "extract_aligned_pointer_as_index_of_unranked_source"}> ({
  ^bb0(%arg0: memref<*xf32>):
    %0 = "memref.reinterpret_cast"(%arg0) <{operandSegmentSizes = array<i32: 1, 0, 0, 0>, static_offsets = array<i64: 0>, static_sizes = array<i64>, static_strides = array<i64>}> : (memref<*xf32>) -> memref<f32>
    %1 = "memref.extract_aligned_pointer_as_index"(%0) : (memref<f32>) -> index
    "func.return"(%1) : (index) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (memref<?x?x4x?x6x7xi32>) -> memref<?x?x42xi32>, sym_name = "simplify_collapse"}> ({
  ^bb0(%arg0: memref<?x?x4x?x6x7xi32>):
    %0 = "memref.collapse_shape"(%arg0) <{reassociation = [[0], [1, 2, 3], [4, 5]]}> : (memref<?x?x4x?x6x7xi32>) -> memref<?x?x42xi32>
    "func.return"(%0) : (memref<?x?x42xi32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (memref<3x1xf32, strided<[2, 1]>>, memref<3xf32>) -> (), sym_name = "simplify_collapse_with_dim_of_size1"}> ({
  ^bb0(%arg0: memref<3x1xf32, strided<[2, 1]>>, %arg1: memref<3xf32>):
    %0 = "memref.collapse_shape"(%arg0) <{reassociation = [[0, 1]]}> : (memref<3x1xf32, strided<[2, 1]>>) -> memref<3xf32, strided<[2]>>
    "memref.copy"(%0, %arg1) : (memref<3xf32, strided<[2]>>, memref<3xf32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (memref<1x1xi32, strided<[2, 1], offset: ?>>) -> memref<1xi32, strided<[2], offset: ?>>, sym_name = "simplify_collapse_with_dim_of_size1_and_non_1_stride"}> ({
  ^bb0(%arg0: memref<1x1xi32, strided<[2, 1], offset: ?>>):
    %0 = "memref.collapse_shape"(%arg0) <{reassociation = [[0, 1]]}> : (memref<1x1xi32, strided<[2, 1], offset: ?>>) -> memref<1xi32, strided<[2], offset: ?>>
    "func.return"(%0) : (memref<1xi32, strided<[2], offset: ?>>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (memref<2x3x1x1x1xi32, strided<[?, ?, ?, ?, 2], offset: ?>>) -> memref<6x1xi32, strided<[?, ?], offset: ?>>, sym_name = "simplify_collapse_with_dim_of_size1_and_resulting_dyn_stride"}> ({
  ^bb0(%arg0: memref<2x3x1x1x1xi32, strided<[?, ?, ?, ?, 2], offset: ?>>):
    %0 = "memref.collapse_shape"(%arg0) <{reassociation = [[0, 1], [2, 3, 4]]}> : (memref<2x3x1x1x1xi32, strided<[?, ?, ?, ?, 2], offset: ?>>) -> memref<6x1xi32, strided<[?, ?], offset: ?>>
    "func.return"(%0) : (memref<6x1xi32, strided<[?, ?], offset: ?>>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (memref<?x?x4x?x6x7xi32>) -> (memref<i32>, index, index, index, index, index, index, index), sym_name = "extract_strided_metadata_of_collapse"}> ({
  ^bb0(%arg0: memref<?x?x4x?x6x7xi32>):
    %0 = "memref.collapse_shape"(%arg0) <{reassociation = [[0], [1, 2, 3], [4, 5]]}> : (memref<?x?x4x?x6x7xi32>) -> memref<?x?x42xi32>
    %1:8 = "memref.extract_strided_metadata"(%0) : (memref<?x?x42xi32>) -> (memref<i32>, index, index, index, index, index, index, index)
    "func.return"(%1#0, %1#1, %1#2, %1#3, %1#4, %1#5, %1#6, %1#7) : (memref<i32>, index, index, index, index, index, index, index) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (memref<1x1x1x1x1x1xi32>) -> (memref<i32>, index), sym_name = "extract_strided_metadata_of_collapse_to_rank0"}> ({
  ^bb0(%arg0: memref<1x1x1x1x1x1xi32>):
    %0 = "memref.collapse_shape"(%arg0) <{reassociation = []}> : (memref<1x1x1x1x1x1xi32>) -> memref<i32>
    %1:2 = "memref.extract_strided_metadata"(%0) : (memref<i32>) -> (memref<i32>, index)
    "func.return"(%1#0, %1#1) : (memref<i32>, index) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (memref<i32>) -> (memref<i32>, index), sym_name = "extract_strided_metadata_of_extract_strided_metadata"}> ({
  ^bb0(%arg0: memref<i32>):
    %0:2 = "memref.extract_strided_metadata"(%arg0) : (memref<i32>) -> (memref<i32>, index)
    %1:2 = "memref.extract_strided_metadata"(%0#0) : (memref<i32>) -> (memref<i32>, index)
    "func.return"(%1#0, %1#1) : (memref<i32>, index) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (memref<?x?xi32, strided<[?, ?], offset: ?>>, index, index, index, index, index) -> (memref<i32>, index, index, index, index, index), sym_name = "extract_strided_metadata_of_reinterpret_cast"}> ({
  ^bb0(%arg0: memref<?x?xi32, strided<[?, ?], offset: ?>>, %arg1: index, %arg2: index, %arg3: index, %arg4: index, %arg5: index):
    %0 = "memref.reinterpret_cast"(%arg0, %arg1, %arg2, %arg3, %arg4, %arg5) <{operandSegmentSizes = array<i32: 1, 1, 2, 2>, static_offsets = array<i64: -9223372036854775808>, static_sizes = array<i64: -9223372036854775808, -9223372036854775808>, static_strides = array<i64: -9223372036854775808, -9223372036854775808>}> : (memref<?x?xi32, strided<[?, ?], offset: ?>>, index, index, index, index, index) -> memref<?x?xi32, strided<[?, ?], offset: ?>>
    %1:6 = "memref.extract_strided_metadata"(%0) : (memref<?x?xi32, strided<[?, ?], offset: ?>>) -> (memref<i32>, index, index, index, index, index)
    "func.return"(%1#0, %1#1, %1#2, %1#3, %1#4, %1#5) : (memref<i32>, index, index, index, index, index) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (memref<*xi32>, index, index, index, index, index) -> (memref<i32>, index, index, index, index, index), sym_name = "extract_strided_metadata_of_reinterpret_cast_unranked"}> ({
  ^bb0(%arg0: memref<*xi32>, %arg1: index, %arg2: index, %arg3: index, %arg4: index, %arg5: index):
    %0 = "memref.reinterpret_cast"(%arg0, %arg1, %arg2, %arg3, %arg4, %arg5) <{operandSegmentSizes = array<i32: 1, 1, 2, 2>, static_offsets = array<i64: -9223372036854775808>, static_sizes = array<i64: -9223372036854775808, -9223372036854775808>, static_strides = array<i64: -9223372036854775808, -9223372036854775808>}> : (memref<*xi32>, index, index, index, index, index) -> memref<?x?xi32, strided<[?, ?], offset: ?>>
    %1:6 = "memref.extract_strided_metadata"(%0) : (memref<?x?xi32, strided<[?, ?], offset: ?>>) -> (memref<i32>, index, index, index, index, index)
    "func.return"(%1#0, %1#1, %1#2, %1#3, %1#4, %1#5) : (memref<i32>, index, index, index, index, index) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (memref<i32, strided<[], offset: ?>>, index, index, index, index, index) -> (memref<i32>, index, index, index, index, index), sym_name = "extract_strided_metadata_of_reinterpret_cast_rank0"}> ({
  ^bb0(%arg0: memref<i32, strided<[], offset: ?>>, %arg1: index, %arg2: index, %arg3: index, %arg4: index, %arg5: index):
    %0 = "memref.reinterpret_cast"(%arg0, %arg1, %arg2, %arg3, %arg4, %arg5) <{operandSegmentSizes = array<i32: 1, 1, 2, 2>, static_offsets = array<i64: -9223372036854775808>, static_sizes = array<i64: -9223372036854775808, -9223372036854775808>, static_strides = array<i64: -9223372036854775808, -9223372036854775808>}> : (memref<i32, strided<[], offset: ?>>, index, index, index, index, index) -> memref<?x?xi32, strided<[?, ?], offset: ?>>
    %1:6 = "memref.extract_strided_metadata"(%0) : (memref<?x?xi32, strided<[?, ?], offset: ?>>) -> (memref<i32>, index, index, index, index, index)
    "func.return"(%1#0, %1#1, %1#2, %1#3, %1#4, %1#5) : (memref<i32>, index, index, index, index, index) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "memref.global"() <{constant, initial_value = dense<42> : tensor<512x384xi32>, sym_name = "const_i32", sym_visibility = "private", type = memref<512x384xi32>}> : () -> ()
  "func.func"() <{function_type = () -> (memref<i32>, index, index, index, index, index), sym_name = "extract_strided_metadata_of_get_global"}> ({
    %0 = "memref.get_global"() <{name = @const_i32}> : () -> memref<512x384xi32>
    %1:6 = "memref.extract_strided_metadata"(%0) : (memref<512x384xi32>) -> (memref<i32>, index, index, index, index, index)
    "func.return"(%1#0, %1#1, %1#2, %1#3, %1#4, %1#5) : (memref<i32>, index, index, index, index, index) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "memref.global"() <{constant, initial_value = dense<42> : tensor<512x384xi32>, sym_name = "const_i32", sym_visibility = "private", type = memref<512x384xi32, strided<[420, 1]>>}> : () -> ()
  "func.func"() <{function_type = () -> (memref<i32>, index, index, index, index, index), sym_name = "extract_strided_metadata_of_get_global_with_strides"}> ({
    %0 = "memref.get_global"() <{name = @const_i32}> : () -> memref<512x384xi32, strided<[420, 1]>>
    %1:6 = "memref.extract_strided_metadata"(%0) : (memref<512x384xi32, strided<[420, 1]>>) -> (memref<i32>, index, index, index, index, index)
    "func.return"(%1#0, %1#1, %1#2, %1#3, %1#4, %1#5) : (memref<i32>, index, index, index, index, index) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "memref.global"() <{constant, initial_value = dense<42> : tensor<512x384xi32>, sym_name = "const_i32", sym_visibility = "private", type = memref<512x384xi32, strided<[384, 1], offset: 20>>}> : () -> ()
  "func.func"() <{function_type = () -> (memref<i32>, index, index, index, index, index), sym_name = "extract_strided_metadata_of_get_global_with_offset"}> ({
    %0 = "memref.get_global"() <{name = @const_i32}> : () -> memref<512x384xi32, strided<[384, 1], offset: 20>>
    %1:6 = "memref.extract_strided_metadata"(%0) : (memref<512x384xi32, strided<[384, 1], offset: 20>>) -> (memref<i32>, index, index, index, index, index)
    "func.return"(%1#0, %1#1, %1#2, %1#3, %1#4, %1#5) : (memref<i32>, index, index, index, index, index) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "memref.global"() <{sym_name = "dynamicShmem", sym_visibility = "private", type = memref<0xf16, 3>}> : () -> ()
  "func.func"() <{function_type = (f32) -> (memref<f16, 3>, index, index, index), sym_name = "zero_sized_memred"}> ({
  ^bb0(%arg0: f32):
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index
    %1 = "memref.get_global"() <{name = @dynamicShmem}> : () -> memref<0xf16, 3>
    %2:4 = "memref.extract_strided_metadata"(%1) : (memref<0xf16, 3>) -> (memref<f16, 3>, index, index, index)
    "func.return"(%2#0, %2#1, %2#2, %2#3) : (memref<f16, 3>, index, index, index) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (memref<5x4xf32>) -> (memref<f32>, index, index, index), sym_name = "extract_strided_metadata_of_collapse_shape"}> ({
  ^bb0(%arg0: memref<5x4xf32>):
    %0 = "memref.collapse_shape"(%arg0) <{reassociation = [[0, 1]]}> : (memref<5x4xf32>) -> memref<20xf32>
    %1:4 = "memref.extract_strided_metadata"(%0) : (memref<20xf32>) -> (memref<f32>, index, index, index)
    "func.return"(%1#0, %1#1, %1#2, %1#3) : (memref<f32>, index, index, index) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (memref<20xf32>) -> (memref<f32, 1>, index, index, index), sym_name = "extract_strided_metadata_of_memory_space_cast"}> ({
  ^bb0(%arg0: memref<20xf32>):
    %0 = "memref.memory_space_cast"(%arg0) : (memref<20xf32>) -> memref<20xf32, 1>
    %1:4 = "memref.extract_strided_metadata"(%0) : (memref<20xf32, 1>) -> (memref<f32, 1>, index, index, index)
    "func.return"(%1#0, %1#1, %1#2, %1#3) : (memref<f32, 1>, index, index, index) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (memref<20xf32>) -> (index, index, index), sym_name = "extract_strided_metadata_of_memory_space_cast_no_base"}> ({
  ^bb0(%arg0: memref<20xf32>):
    %0 = "memref.memory_space_cast"(%arg0) : (memref<20xf32>) -> memref<20xf32, 1>
    %1:4 = "memref.extract_strided_metadata"(%0) : (memref<20xf32, 1>) -> (memref<f32, 1>, index, index, index)
    "func.return"(%1#1, %1#2, %1#3) : (index, index, index) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (memref<?xi8>) -> index, sym_name = "negative_memref_view_extract_aligned_pointer"}> ({
  ^bb0(%arg0: memref<?xi8>):
    %0 = "arith.constant"() <{value = 10 : index}> : () -> index
    %1 = "memref.view"(%arg0, %0) : (memref<?xi8>, index) -> memref<f32>
    %2 = "memref.extract_aligned_pointer_as_index"(%1) : (memref<f32>) -> index
    "func.return"(%2) : (index) -> ()
  }) : () -> ()
}) : () -> ()

