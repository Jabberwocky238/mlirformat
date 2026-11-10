"builtin.module"() ({
  "func.func"() <{function_type = (memref<f32>, memref<f32>) -> (), sym_name = "copy_scalar_into_0D_strided_zero_offset", sym_visibility = "private"}> ({
  ^bb0(%arg59: memref<f32>, %arg60: memref<f32>):
    %25 = "memref.reinterpret_cast"(%arg60) <{operandSegmentSizes = array<i32: 1, 0, 0, 0>, static_offsets = array<i64: 0>, static_sizes = array<i64>, static_strides = array<i64>}> : (memref<f32>) -> memref<f32>
    "memref.copy"(%arg59, %25) : (memref<f32>, memref<f32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (memref<1x1xf32>, memref<1x108xf32>) -> (), sym_name = "copy_scalar_into_1D_strided_zero_offset", sym_visibility = "private"}> ({
  ^bb0(%arg57: memref<1x1xf32>, %arg58: memref<1x108xf32>):
    %24 = "memref.reinterpret_cast"(%arg58) <{operandSegmentSizes = array<i32: 1, 0, 0, 0>, static_offsets = array<i64: 0>, static_sizes = array<i64: 1, 1>, static_strides = array<i64: 1, 1>}> : (memref<1x108xf32>) -> memref<1x1xf32>
    "memref.copy"(%arg57, %24) : (memref<1x1xf32>, memref<1x1xf32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (memref<1x1xf32>, memref<1x108xf32, strided<[54, 2]>>) -> (), sym_name = "negative_copy_scalar_into_1D_strided_zero_offset_base_non_identity_layout", sym_visibility = "private"}> ({
  ^bb0(%arg55: memref<1x1xf32>, %arg56: memref<1x108xf32, strided<[54, 2]>>):
    %23 = "memref.reinterpret_cast"(%arg56) <{operandSegmentSizes = array<i32: 1, 0, 0, 0>, static_offsets = array<i64: 0>, static_sizes = array<i64: 1, 1>, static_strides = array<i64: 54, 2>}> : (memref<1x108xf32, strided<[54, 2]>>) -> memref<1x1xf32, strided<[54, 2]>>
    "memref.copy"(%arg55, %23) : (memref<1x1xf32>, memref<1x1xf32, strided<[54, 2]>>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (memref<1x1xf32>, memref<1x108xf32>) -> (), sym_name = "copy_scalar_into_1D_strided_nonzero_offset", sym_visibility = "private"}> ({
  ^bb0(%arg53: memref<1x1xf32>, %arg54: memref<1x108xf32>):
    %22 = "memref.reinterpret_cast"(%arg54) <{operandSegmentSizes = array<i32: 1, 0, 0, 0>, static_offsets = array<i64: 1>, static_sizes = array<i64: 1, 1>, static_strides = array<i64: 1, 1>}> : (memref<1x108xf32>) -> memref<1x1xf32, strided<[1, 1], offset: 1>>
    "memref.copy"(%arg53, %22) : (memref<1x1xf32>, memref<1x1xf32, strided<[1, 1], offset: 1>>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (index, memref<1x1xf32>, memref<1x108xf32>) -> (), sym_name = "copy_scalar_into_1D_strided_dynamic_offset", sym_visibility = "private"}> ({
  ^bb0(%arg50: index, %arg51: memref<1x1xf32>, %arg52: memref<1x108xf32>):
    %21 = "memref.reinterpret_cast"(%arg52, %arg50) <{operandSegmentSizes = array<i32: 1, 1, 0, 0>, static_offsets = array<i64: -9223372036854775808>, static_sizes = array<i64: 1, 1>, static_strides = array<i64: 1, 1>}> : (memref<1x108xf32>, index) -> memref<1x1xf32, strided<[1, 1], offset: ?>>
    "memref.copy"(%arg51, %21) : (memref<1x1xf32>, memref<1x1xf32, strided<[1, 1], offset: ?>>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (memref<1x1xf32>, memref<1x108xf32>) -> (), sym_name = "copy_scalar_into_1D_strided_zero_offset_non_identity_stride", sym_visibility = "private"}> ({
  ^bb0(%arg48: memref<1x1xf32>, %arg49: memref<1x108xf32>):
    %20 = "memref.reinterpret_cast"(%arg49) <{operandSegmentSizes = array<i32: 1, 0, 0, 0>, static_offsets = array<i64: 0>, static_sizes = array<i64: 1, 1>, static_strides = array<i64: 54, 2>}> : (memref<1x108xf32>) -> memref<1x1xf32, strided<[54, 2]>>
    "memref.copy"(%arg48, %20) : (memref<1x1xf32>, memref<1x1xf32, strided<[54, 2]>>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (index, index, memref<1x1xf32>, memref<1x108xf32>) -> (), sym_name = "copy_scalar_into_1D_strided_zero_offset_dynamic_stride", sym_visibility = "private"}> ({
  ^bb0(%arg44: index, %arg45: index, %arg46: memref<1x1xf32>, %arg47: memref<1x108xf32>):
    %19 = "memref.reinterpret_cast"(%arg47, %arg44, %arg45) <{operandSegmentSizes = array<i32: 1, 0, 0, 2>, static_offsets = array<i64: 0>, static_sizes = array<i64: 1, 1>, static_strides = array<i64: -9223372036854775808, -9223372036854775808>}> : (memref<1x108xf32>, index, index) -> memref<1x1xf32, strided<[?, ?]>>
    "memref.copy"(%arg46, %19) : (memref<1x1xf32>, memref<1x1xf32, strided<[?, ?]>>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (memref<1x1x1xf32>, memref<1x3x11xf32>) -> (), sym_name = "copy_scalar_into_2D_strided_zero_offset_non_identity_stride", sym_visibility = "private"}> ({
  ^bb0(%arg42: memref<1x1x1xf32>, %arg43: memref<1x3x11xf32>):
    %18 = "memref.reinterpret_cast"(%arg43) <{operandSegmentSizes = array<i32: 1, 0, 0, 0>, static_offsets = array<i64: 0>, static_sizes = array<i64: 1, 1, 1>, static_strides = array<i64: 1, 1, 1>}> : (memref<1x3x11xf32>) -> memref<1x1x1xf32>
    "memref.copy"(%arg42, %18) : (memref<1x1x1xf32>, memref<1x1x1xf32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (memref<1x1x1xf32>, memref<1x3x11xf32>) -> (), sym_name = "copy_scalar_into_2D_scalar_strided_nonzero_offset_delinearized_v1", sym_visibility = "private"}> ({
  ^bb0(%arg40: memref<1x1x1xf32>, %arg41: memref<1x3x11xf32>):
    %17 = "memref.reinterpret_cast"(%arg41) <{operandSegmentSizes = array<i32: 1, 0, 0, 0>, static_offsets = array<i64: 10>, static_sizes = array<i64: 1, 1, 1>, static_strides = array<i64: 1, 1, 1>}> : (memref<1x3x11xf32>) -> memref<1x1x1xf32, strided<[1, 1, 1], offset: 10>>
    "memref.copy"(%arg40, %17) : (memref<1x1x1xf32>, memref<1x1x1xf32, strided<[1, 1, 1], offset: 10>>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (memref<1x1x1xf32>, memref<1x3x11xf32>) -> (), sym_name = "copy_scalar_into_2D_scalar_strided_nonzero_offset_delinearized_v2", sym_visibility = "private"}> ({
  ^bb0(%arg38: memref<1x1x1xf32>, %arg39: memref<1x3x11xf32>):
    %16 = "memref.reinterpret_cast"(%arg39) <{operandSegmentSizes = array<i32: 1, 0, 0, 0>, static_offsets = array<i64: 23>, static_sizes = array<i64: 1, 1, 1>, static_strides = array<i64: 1, 1, 1>}> : (memref<1x3x11xf32>) -> memref<1x1x1xf32, strided<[1, 1, 1], offset: 23>>
    "memref.copy"(%arg38, %16) : (memref<1x1x1xf32>, memref<1x1x1xf32, strided<[1, 1, 1], offset: 23>>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (index, memref<1x1x1xf32>, memref<1x3x11xf32>) -> (), sym_name = "negative_copy_scalar_into_2D_strided_dynamic_offset", sym_visibility = "private"}> ({
  ^bb0(%arg35: index, %arg36: memref<1x1x1xf32>, %arg37: memref<1x3x11xf32>):
    %15 = "memref.reinterpret_cast"(%arg37, %arg35) <{operandSegmentSizes = array<i32: 1, 1, 0, 0>, static_offsets = array<i64: -9223372036854775808>, static_sizes = array<i64: 1, 1, 1>, static_strides = array<i64: 33, 11, 1>}> : (memref<1x3x11xf32>, index) -> memref<1x1x1xf32, strided<[33, 11, 1], offset: ?>>
    "memref.copy"(%arg36, %15) : (memref<1x1x1xf32>, memref<1x1x1xf32, strided<[33, 11, 1], offset: ?>>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (memref<4xf32>, memref<108xf32>) -> (), sym_name = "negative_copy_1D_into_1D_strided", sym_visibility = "private"}> ({
  ^bb0(%arg33: memref<4xf32>, %arg34: memref<108xf32>):
    %14 = "memref.reinterpret_cast"(%arg34) <{operandSegmentSizes = array<i32: 1, 0, 0, 0>, static_offsets = array<i64: 0>, static_sizes = array<i64: 4>, static_strides = array<i64: 1>}> : (memref<108xf32>) -> memref<4xf32, strided<[1]>>
    "memref.copy"(%arg33, %14) : (memref<4xf32>, memref<4xf32, strided<[1]>>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (memref<1x3x1xf32>, memref<1x3x11xf32>) -> (), sym_name = "copy_1D_into_2D_strided_zero_offset", sym_visibility = "private"}> ({
  ^bb0(%arg31: memref<1x3x1xf32>, %arg32: memref<1x3x11xf32>):
    %13 = "memref.reinterpret_cast"(%arg32) <{operandSegmentSizes = array<i32: 1, 0, 0, 0>, static_offsets = array<i64: 0>, static_sizes = array<i64: 1, 3, 1>, static_strides = array<i64: 33, 11, 1>}> : (memref<1x3x11xf32>) -> memref<1x3x1xf32, strided<[33, 11, 1]>>
    "memref.copy"(%arg31, %13) : (memref<1x3x1xf32>, memref<1x3x1xf32, strided<[33, 11, 1]>>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (memref<1x1x11xf32>, memref<1x3x11xf32>) -> (), sym_name = "copy_1D_into_2D_strided_zero_offset_loop_trailing_dim", sym_visibility = "private"}> ({
  ^bb0(%arg29: memref<1x1x11xf32>, %arg30: memref<1x3x11xf32>):
    %12 = "memref.reinterpret_cast"(%arg30) <{operandSegmentSizes = array<i32: 1, 0, 0, 0>, static_offsets = array<i64: 0>, static_sizes = array<i64: 1, 1, 11>, static_strides = array<i64: 33, 11, 1>}> : (memref<1x3x11xf32>) -> memref<1x1x11xf32, strided<[33, 11, 1]>>
    "memref.copy"(%arg29, %12) : (memref<1x1x11xf32>, memref<1x1x11xf32, strided<[33, 11, 1]>>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (memref<1x3x1xf32>, memref<1x3x11xf32>) -> (), sym_name = "copy_1D_into_2D_strided_nonzero_offset", sym_visibility = "private"}> ({
  ^bb0(%arg27: memref<1x3x1xf32>, %arg28: memref<1x3x11xf32>):
    %11 = "memref.reinterpret_cast"(%arg28) <{operandSegmentSizes = array<i32: 1, 0, 0, 0>, static_offsets = array<i64: 10>, static_sizes = array<i64: 1, 3, 1>, static_strides = array<i64: 33, 11, 1>}> : (memref<1x3x11xf32>) -> memref<1x3x1xf32, strided<[33, 11, 1], offset: 10>>
    "memref.copy"(%arg27, %11) : (memref<1x3x1xf32>, memref<1x3x1xf32, strided<[33, 11, 1], offset: 10>>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (index, memref<1x3x1xf32>, memref<1x3x11xf32>) -> (), sym_name = "negative_copy_1D_into_2D_strided_dynamic_offset", sym_visibility = "private"}> ({
  ^bb0(%arg24: index, %arg25: memref<1x3x1xf32>, %arg26: memref<1x3x11xf32>):
    %10 = "memref.reinterpret_cast"(%arg26, %arg24) <{operandSegmentSizes = array<i32: 1, 1, 0, 0>, static_offsets = array<i64: -9223372036854775808>, static_sizes = array<i64: 1, 3, 1>, static_strides = array<i64: 33, 11, 1>}> : (memref<1x3x11xf32>, index) -> memref<1x3x1xf32, strided<[33, 11, 1], offset: ?>>
    "memref.copy"(%arg25, %10) : (memref<1x3x1xf32>, memref<1x3x1xf32, strided<[33, 11, 1], offset: ?>>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (memref<1x3x1xf32>, memref<1x3x4xf32>) -> (), sym_name = "negative_copy_1D_into_2D_strided_zero_offset_non_identity_strides", sym_visibility = "private"}> ({
  ^bb0(%arg22: memref<1x3x1xf32>, %arg23: memref<1x3x4xf32>):
    %9 = "memref.reinterpret_cast"(%arg23) <{operandSegmentSizes = array<i32: 1, 0, 0, 0>, static_offsets = array<i64: 0>, static_sizes = array<i64: 1, 3, 1>, static_strides = array<i64: 12, 4, 4>}> : (memref<1x3x4xf32>) -> memref<1x3x1xf32, strided<[12, 4, 4]>>
    "memref.copy"(%arg22, %9) : (memref<1x3x1xf32>, memref<1x3x1xf32, strided<[12, 4, 4]>>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (index, memref<1x3x1xf32>, memref<1x3x4xf32>) -> (), sym_name = "negative_copy_1D_into_2D_strided_zero_offset_dynamic_stride", sym_visibility = "private"}> ({
  ^bb0(%arg19: index, %arg20: memref<1x3x1xf32>, %arg21: memref<1x3x4xf32>):
    %8 = "memref.reinterpret_cast"(%arg21, %arg19) <{operandSegmentSizes = array<i32: 1, 0, 0, 1>, static_offsets = array<i64: 0>, static_sizes = array<i64: 1, 3, 1>, static_strides = array<i64: 12, -9223372036854775808, 1>}> : (memref<1x3x4xf32>, index) -> memref<1x3x1xf32, strided<[12, ?, 1]>>
    "memref.copy"(%arg20, %8) : (memref<1x3x1xf32>, memref<1x3x1xf32, strided<[12, ?, 1]>>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (memref<1x3x1xf32>, memref<1x4x11xf32>) -> (), sym_name = "negative_copy_1D_into_2D_strided_diff_dim_sizes", sym_visibility = "private"}> ({
  ^bb0(%arg17: memref<1x3x1xf32>, %arg18: memref<1x4x11xf32>):
    %7 = "memref.reinterpret_cast"(%arg18) <{operandSegmentSizes = array<i32: 1, 0, 0, 0>, static_offsets = array<i64: 0>, static_sizes = array<i64: 1, 3, 1>, static_strides = array<i64: 44, 11, 1>}> : (memref<1x4x11xf32>) -> memref<1x3x1xf32, strided<[44, 11, 1]>>
    "memref.copy"(%arg17, %7) : (memref<1x3x1xf32>, memref<1x3x1xf32, strided<[44, 11, 1]>>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (memref<3x1x4x1xf32>, memref<3x1x4x11xf32>) -> (), sym_name = "copy_2D_into_3D_strided_zero_offset", sym_visibility = "private"}> ({
  ^bb0(%arg15: memref<3x1x4x1xf32>, %arg16: memref<3x1x4x11xf32>):
    %6 = "memref.reinterpret_cast"(%arg16) <{operandSegmentSizes = array<i32: 1, 0, 0, 0>, static_offsets = array<i64: 0>, static_sizes = array<i64: 3, 1, 4, 1>, static_strides = array<i64: 44, 44, 11, 1>}> : (memref<3x1x4x11xf32>) -> memref<3x1x4x1xf32, strided<[44, 44, 11, 1]>>
    "memref.copy"(%arg15, %6) : (memref<3x1x4x1xf32>, memref<3x1x4x1xf32, strided<[44, 44, 11, 1]>>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (memref<3x1x4x1xf32>, memref<3x1x4x11xf32>) -> (), sym_name = "copy_2D_into_3D_strided_nonzero_offset", sym_visibility = "private"}> ({
  ^bb0(%arg13: memref<3x1x4x1xf32>, %arg14: memref<3x1x4x11xf32>):
    %5 = "memref.reinterpret_cast"(%arg14) <{operandSegmentSizes = array<i32: 1, 0, 0, 0>, static_offsets = array<i64: 10>, static_sizes = array<i64: 3, 1, 4, 1>, static_strides = array<i64: 44, 44, 11, 1>}> : (memref<3x1x4x11xf32>) -> memref<3x1x4x1xf32, strided<[44, 44, 11, 1], offset: 10>>
    "memref.copy"(%arg13, %5) : (memref<3x1x4x1xf32>, memref<3x1x4x1xf32, strided<[44, 44, 11, 1], offset: 10>>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (memref<1x1xf32>, memref<1x1xf32>) -> (), sym_name = "negative_no_rc", sym_visibility = "private"}> ({
  ^bb0(%arg11: memref<1x1xf32>, %arg12: memref<1x1xf32>):
    "memref.copy"(%arg11, %arg12) : (memref<1x1xf32>, memref<1x1xf32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (memref<4xf32>, memref<*xf32>) -> (), sym_name = "negative_copy_into_strided_unranked_rc_base", sym_visibility = "private"}> ({
  ^bb0(%arg9: memref<4xf32>, %arg10: memref<*xf32>):
    %4 = "memref.reinterpret_cast"(%arg10) <{operandSegmentSizes = array<i32: 1, 0, 0, 0>, static_offsets = array<i64: 0>, static_sizes = array<i64: 4>, static_strides = array<i64: 1>}> : (memref<*xf32>) -> memref<4xf32>
    "memref.copy"(%arg9, %4) : (memref<4xf32>, memref<4xf32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (memref<3x4xf32>, memref<12xf32>) -> (), sym_name = "negative_copy_into_strided_rank_change", sym_visibility = "private"}> ({
  ^bb0(%arg7: memref<3x4xf32>, %arg8: memref<12xf32>):
    %3 = "memref.reinterpret_cast"(%arg8) <{operandSegmentSizes = array<i32: 1, 0, 0, 0>, static_offsets = array<i64: 0>, static_sizes = array<i64: 3, 4>, static_strides = array<i64: 1, 1>}> : (memref<12xf32>) -> memref<3x4xf32, strided<[1, 1]>>
    "memref.copy"(%arg7, %3) : (memref<3x4xf32>, memref<3x4xf32, strided<[1, 1]>>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (memref<?xf32>, memref<4xf32>) -> (), sym_name = "negative_copy_into_strided_dynamic_copy_source_shape", sym_visibility = "private"}> ({
  ^bb0(%arg5: memref<?xf32>, %arg6: memref<4xf32>):
    %2 = "memref.reinterpret_cast"(%arg6) <{operandSegmentSizes = array<i32: 1, 0, 0, 0>, static_offsets = array<i64: 0>, static_sizes = array<i64: 4>, static_strides = array<i64: 1>}> : (memref<4xf32>) -> memref<4xf32>
    "memref.copy"(%arg5, %2) : (memref<?xf32>, memref<4xf32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (memref<4xf32>, memref<?xf32>) -> (), sym_name = "negative_copy_into_strided_dynamic_rc_source_shape", sym_visibility = "private"}> ({
  ^bb0(%arg3: memref<4xf32>, %arg4: memref<?xf32>):
    %1 = "memref.reinterpret_cast"(%arg4) <{operandSegmentSizes = array<i32: 1, 0, 0, 0>, static_offsets = array<i64: 0>, static_sizes = array<i64: 4>, static_strides = array<i64: 1>}> : (memref<?xf32>) -> memref<4xf32, strided<[1]>>
    "memref.copy"(%arg3, %1) : (memref<4xf32>, memref<4xf32, strided<[1]>>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (index, memref<4xf32>, memref<12xf32>) -> (), sym_name = "negative_copy_into_strided_dynamic_rc_result_shape", sym_visibility = "private"}> ({
  ^bb0(%arg0: index, %arg1: memref<4xf32>, %arg2: memref<12xf32>):
    %0 = "memref.reinterpret_cast"(%arg2, %arg0) <{operandSegmentSizes = array<i32: 1, 0, 1, 0>, static_offsets = array<i64: 0>, static_sizes = array<i64: -9223372036854775808>, static_strides = array<i64: 1>}> : (memref<12xf32>, index) -> memref<?xf32, strided<[1]>>
    "memref.copy"(%arg1, %0) : (memref<4xf32>, memref<?xf32, strided<[1]>>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (memref<1xi64>) -> (), sym_name = "expand_scalar", sym_visibility = "private"}> ({
  ^bb0(%arg36: memref<1xi64>):
    %85 = "arith.constant"() <{value = 0 : index}> : () -> index
    %86 = "memref.reinterpret_cast"(%arg36) <{operandSegmentSizes = array<i32: 1, 0, 0, 0>, static_offsets = array<i64: 0>, static_sizes = array<i64: 1, 1, 1>, static_strides = array<i64: 1, 1, 1>}> : (memref<1xi64>) -> memref<1x1x1xi64>
    %87 = "memref.load"(%86, %85, %85, %85) : (memref<1x1x1xi64>, index, index, index) -> i64
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (memref<1x1x1xi64>) -> (), sym_name = "collapse_scalar", sym_visibility = "private"}> ({
  ^bb0(%arg35: memref<1x1x1xi64>):
    %82 = "arith.constant"() <{value = 0 : index}> : () -> index
    %83 = "memref.reinterpret_cast"(%arg35) <{operandSegmentSizes = array<i32: 1, 0, 0, 0>, static_offsets = array<i64: 0>, static_sizes = array<i64: 1, 1>, static_strides = array<i64: 1, 1>}> : (memref<1x1x1xi64>) -> memref<1x1xi64>
    %84 = "memref.load"(%83, %82, %82) : (memref<1x1xi64>, index, index) -> i64
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (memref<999xi64>) -> (), sym_name = "expand_left_vector", sym_visibility = "private"}> ({
  ^bb0(%arg34: memref<999xi64>):
    %78 = "arith.constant"() <{value = 0 : index}> : () -> index
    %79 = "arith.constant"() <{value = 13 : index}> : () -> index
    %80 = "memref.reinterpret_cast"(%arg34) <{operandSegmentSizes = array<i32: 1, 0, 0, 0>, static_offsets = array<i64: 0>, static_sizes = array<i64: 1, 1, 999>, static_strides = array<i64: 999, 999, 1>}> : (memref<999xi64>) -> memref<1x1x999xi64>
    %81 = "memref.load"(%80, %78, %78, %79) : (memref<1x1x999xi64>, index, index, index) -> i64
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (index, memref<999xi64>) -> (), sym_name = "expand_left_vector_dynamic_index", sym_visibility = "private"}> ({
  ^bb0(%arg32: index, %arg33: memref<999xi64>):
    %75 = "arith.constant"() <{value = 0 : index}> : () -> index
    %76 = "memref.reinterpret_cast"(%arg33) <{operandSegmentSizes = array<i32: 1, 0, 0, 0>, static_offsets = array<i64: 0>, static_sizes = array<i64: 1, 1, 999>, static_strides = array<i64: 999, 999, 1>}> : (memref<999xi64>) -> memref<1x1x999xi64>
    %77 = "memref.load"(%76, %75, %75, %arg32) : (memref<1x1x999xi64>, index, index, index) -> i64
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (memref<1x1x999xi64>) -> (), sym_name = "collapse_left_vector", sym_visibility = "private"}> ({
  ^bb0(%arg31: memref<1x1x999xi64>):
    %72 = "arith.constant"() <{value = 13 : index}> : () -> index
    %73 = "memref.reinterpret_cast"(%arg31) <{operandSegmentSizes = array<i32: 1, 0, 0, 0>, static_offsets = array<i64: 0>, static_sizes = array<i64: 999>, static_strides = array<i64: 1>}> : (memref<1x1x999xi64>) -> memref<999xi64>
    %74 = "memref.load"(%73, %72) : (memref<999xi64>, index) -> i64
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (memref<1x999xf32>) -> (), sym_name = "partial_expand_left_vector", sym_visibility = "private"}> ({
  ^bb0(%arg30: memref<1x999xf32>):
    %68 = "arith.constant"() <{value = 0 : index}> : () -> index
    %69 = "arith.constant"() <{value = 13 : index}> : () -> index
    %70 = "memref.reinterpret_cast"(%arg30) <{operandSegmentSizes = array<i32: 1, 0, 0, 0>, static_offsets = array<i64: 0>, static_sizes = array<i64: 1, 1, 999>, static_strides = array<i64: 999, 999, 1>}> : (memref<1x999xf32>) -> memref<1x1x999xf32>
    %71 = "memref.load"(%70, %68, %68, %69) : (memref<1x1x999xf32>, index, index, index) -> f32
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (memref<1x1x999xf32>) -> (), sym_name = "partial_collapse_left_vector", sym_visibility = "private"}> ({
  ^bb0(%arg29: memref<1x1x999xf32>):
    %64 = "arith.constant"() <{value = 0 : index}> : () -> index
    %65 = "arith.constant"() <{value = 13 : index}> : () -> index
    %66 = "memref.reinterpret_cast"(%arg29) <{operandSegmentSizes = array<i32: 1, 0, 0, 0>, static_offsets = array<i64: 0>, static_sizes = array<i64: 1, 999>, static_strides = array<i64: 999, 1>}> : (memref<1x1x999xf32>) -> memref<1x999xf32>
    %67 = "memref.load"(%66, %64, %65) : (memref<1x999xf32>, index, index) -> f32
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (memref<999xi64>) -> (), sym_name = "expand_right_vector", sym_visibility = "private"}> ({
  ^bb0(%arg28: memref<999xi64>):
    %60 = "arith.constant"() <{value = 0 : index}> : () -> index
    %61 = "arith.constant"() <{value = 13 : index}> : () -> index
    %62 = "memref.reinterpret_cast"(%arg28) <{operandSegmentSizes = array<i32: 1, 0, 0, 0>, static_offsets = array<i64: 0>, static_sizes = array<i64: 999, 1, 1>, static_strides = array<i64: 1, 999, 999>}> : (memref<999xi64>) -> memref<999x1x1xi64, strided<[1, 999, 999]>>
    %63 = "memref.load"(%62, %61, %60, %60) : (memref<999x1x1xi64, strided<[1, 999, 999]>>, index, index, index) -> i64
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (memref<999x1x1xi64>) -> (), sym_name = "collapse_right_vector", sym_visibility = "private"}> ({
  ^bb0(%arg27: memref<999x1x1xi64>):
    %57 = "arith.constant"() <{value = 13 : index}> : () -> index
    %58 = "memref.reinterpret_cast"(%arg27) <{operandSegmentSizes = array<i32: 1, 0, 0, 0>, static_offsets = array<i64: 0>, static_sizes = array<i64: 999>, static_strides = array<i64: 1>}> : (memref<999x1x1xi64>) -> memref<999xi64>
    %59 = "memref.load"(%58, %57) : (memref<999xi64>, index) -> i64
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (index, memref<999x1x1xi64>) -> (), sym_name = "collapse_right_vector_dynamic_index", sym_visibility = "private"}> ({
  ^bb0(%arg25: index, %arg26: memref<999x1x1xi64>):
    %55 = "memref.reinterpret_cast"(%arg26) <{operandSegmentSizes = array<i32: 1, 0, 0, 0>, static_offsets = array<i64: 0>, static_sizes = array<i64: 999>, static_strides = array<i64: 1>}> : (memref<999x1x1xi64>) -> memref<999xi64>
    %56 = "memref.load"(%55, %arg25) : (memref<999xi64>, index) -> i64
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (memref<999x1xf32>) -> (), sym_name = "partial_expand_right_vector", sym_visibility = "private"}> ({
  ^bb0(%arg24: memref<999x1xf32>):
    %51 = "arith.constant"() <{value = 0 : index}> : () -> index
    %52 = "arith.constant"() <{value = 13 : index}> : () -> index
    %53 = "memref.reinterpret_cast"(%arg24) <{operandSegmentSizes = array<i32: 1, 0, 0, 0>, static_offsets = array<i64: 0>, static_sizes = array<i64: 999, 1, 1>, static_strides = array<i64: 1, 999, 999>}> : (memref<999x1xf32>) -> memref<999x1x1xf32, strided<[1, 999, 999]>>
    %54 = "memref.load"(%53, %52, %51, %51) : (memref<999x1x1xf32, strided<[1, 999, 999]>>, index, index, index) -> f32
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (memref<999x1x1xf32>) -> (), sym_name = "partial_collapse_right_vector", sym_visibility = "private"}> ({
  ^bb0(%arg23: memref<999x1x1xf32>):
    %47 = "arith.constant"() <{value = 0 : index}> : () -> index
    %48 = "arith.constant"() <{value = 13 : index}> : () -> index
    %49 = "memref.reinterpret_cast"(%arg23) <{operandSegmentSizes = array<i32: 1, 0, 0, 0>, static_offsets = array<i64: 0>, static_sizes = array<i64: 999, 1>, static_strides = array<i64: 1, 999>}> : (memref<999x1x1xf32>) -> memref<999x1xf32, strided<[1, 999]>>
    %50 = "memref.load"(%49, %48, %47) : (memref<999x1xf32, strided<[1, 999]>>, index, index) -> f32
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (memref<17x100xf32>) -> (), sym_name = "expand_multiple_non_unit_dims", sym_visibility = "private"}> ({
  ^bb0(%arg22: memref<17x100xf32>):
    %43 = "arith.constant"() <{value = 0 : index}> : () -> index
    %44 = "arith.constant"() <{value = 13 : index}> : () -> index
    %45 = "memref.reinterpret_cast"(%arg22) <{operandSegmentSizes = array<i32: 1, 0, 0, 0>, static_offsets = array<i64: 0>, static_sizes = array<i64: 17, 1, 1, 100>, static_strides = array<i64: 100, 100, 100, 1>}> : (memref<17x100xf32>) -> memref<17x1x1x100xf32, strided<[100, 100, 100, 1]>>
    %46 = "memref.load"(%45, %44, %43, %43, %44) : (memref<17x1x1x100xf32, strided<[100, 100, 100, 1]>>, index, index, index, index) -> f32
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (memref<17x1x1x100xf32>) -> (), sym_name = "collapse_multiple_non_unit_dims", sym_visibility = "private"}> ({
  ^bb0(%arg21: memref<17x1x1x100xf32>):
    %40 = "arith.constant"() <{value = 13 : index}> : () -> index
    %41 = "memref.reinterpret_cast"(%arg21) <{operandSegmentSizes = array<i32: 1, 0, 0, 0>, static_offsets = array<i64: 0>, static_sizes = array<i64: 17, 100>, static_strides = array<i64: 100, 1>}> : (memref<17x1x1x100xf32>) -> memref<17x100xf32>
    %42 = "memref.load"(%41, %40, %40) : (memref<17x100xf32>, index, index) -> f32
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (index, memref<1x33xf32>) -> (), sym_name = "expand_inner_non_unit_dims", sym_visibility = "private"}> ({
  ^bb0(%arg19: index, %arg20: memref<1x33xf32>):
    %37 = "arith.constant"() <{value = 0 : index}> : () -> index
    %38 = "memref.reinterpret_cast"(%arg20) <{operandSegmentSizes = array<i32: 1, 0, 0, 0>, static_offsets = array<i64: 0>, static_sizes = array<i64: 1, 33, 1, 1>, static_strides = array<i64: 33, 1, 1, 1>}> : (memref<1x33xf32>) -> memref<1x33x1x1xf32>
    %39 = "memref.load"(%38, %37, %arg19, %37, %37) : (memref<1x33x1x1xf32>, index, index, index, index) -> f32
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (memref<1x1x1x100xf32>) -> (), sym_name = "collapse_inner_non_unit_dims", sym_visibility = "private"}> ({
  ^bb0(%arg18: memref<1x1x1x100xf32>):
    %33 = "arith.constant"() <{value = 0 : index}> : () -> index
    %34 = "arith.constant"() <{value = 13 : index}> : () -> index
    %35 = "memref.reinterpret_cast"(%arg18) <{operandSegmentSizes = array<i32: 1, 0, 0, 0>, static_offsets = array<i64: 0>, static_sizes = array<i64: 1, 100, 1>, static_strides = array<i64: 100, 1, 100>}> : (memref<1x1x1x100xf32>) -> memref<1x100x1xf32, strided<[100, 1, 100]>>
    %36 = "memref.load"(%35, %33, %34, %33) : (memref<1x100x1xf32, strided<[100, 1, 100]>>, index, index, index) -> f32
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (index, memref<1x33xf32>) -> (), sym_name = "expand_diff_non_unit_boundary", sym_visibility = "private"}> ({
  ^bb0(%arg16: index, %arg17: memref<1x33xf32>):
    %29 = "arith.constant"() <{value = 0 : index}> : () -> index
    %30 = "arith.constant"() <{value = 13 : index}> : () -> index
    %31 = "memref.reinterpret_cast"(%arg17) <{operandSegmentSizes = array<i32: 1, 0, 0, 0>, static_offsets = array<i64: 0>, static_sizes = array<i64: 33, 1, 1>, static_strides = array<i64: 1, 33, 33>}> : (memref<1x33xf32>) -> memref<33x1x1xf32, strided<[1, 33, 33]>>
    %32 = "memref.load"(%31, %30, %29, %29) : (memref<33x1x1xf32, strided<[1, 33, 33]>>, index, index, index) -> f32
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (memref<1x1x1x100xf32>) -> (), sym_name = "collapse_diff_non_unit_boundary", sym_visibility = "private"}> ({
  ^bb0(%arg15: memref<1x1x1x100xf32>):
    %25 = "arith.constant"() <{value = 0 : index}> : () -> index
    %26 = "arith.constant"() <{value = 13 : index}> : () -> index
    %27 = "memref.reinterpret_cast"(%arg15) <{operandSegmentSizes = array<i32: 1, 0, 0, 0>, static_offsets = array<i64: 0>, static_sizes = array<i64: 100, 1, 1>, static_strides = array<i64: 1, 100, 100>}> : (memref<1x1x1x100xf32>) -> memref<100x1x1xf32, strided<[1, 100, 100]>>
    %28 = "memref.load"(%27, %26, %25, %25) : (memref<100x1x1xf32, strided<[1, 100, 100]>>, index, index, index) -> f32
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (index, index, index, memref<1x3x22x3xf32>) -> (), sym_name = "expand_3d_moved_unit_dims", sym_visibility = "private"}> ({
  ^bb0(%arg11: index, %arg12: index, %arg13: index, %arg14: memref<1x3x22x3xf32>):
    %22 = "arith.constant"() <{value = 0 : index}> : () -> index
    %23 = "memref.reinterpret_cast"(%arg14) <{operandSegmentSizes = array<i32: 1, 0, 0, 0>, static_offsets = array<i64: 0>, static_sizes = array<i64: 3, 1, 1, 22, 1, 3>, static_strides = array<i64: 66, 66, 66, 3, 3, 1>}> : (memref<1x3x22x3xf32>) -> memref<3x1x1x22x1x3xf32, strided<[66, 66, 66, 3, 3, 1]>>
    %24 = "memref.load"(%23, %arg11, %22, %22, %arg12, %22, %arg13) : (memref<3x1x1x22x1x3xf32, strided<[66, 66, 66, 3, 3, 1]>>, index, index, index, index, index, index) -> f32
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (index, index, index, memref<1x3x1x1x22x1x3xf32>) -> (), sym_name = "collapse_3d_moved_unit_dims", sym_visibility = "private"}> ({
  ^bb0(%arg7: index, %arg8: index, %arg9: index, %arg10: memref<1x3x1x1x22x1x3xf32>):
    %19 = "arith.constant"() <{value = 0 : index}> : () -> index
    %20 = "memref.reinterpret_cast"(%arg10) <{operandSegmentSizes = array<i32: 1, 0, 0, 0>, static_offsets = array<i64: 0>, static_sizes = array<i64: 3, 1, 22, 3, 1, 1>, static_strides = array<i64: 66, 66, 3, 1, 1, 1>}> : (memref<1x3x1x1x22x1x3xf32>) -> memref<3x1x22x3x1x1xf32, strided<[66, 66, 3, 1, 1, 1]>>
    %21 = "memref.load"(%20, %arg7, %19, %arg8, %arg9, %19, %19) : (memref<3x1x22x3x1x1xf32, strided<[66, 66, 3, 1, 1, 1]>>, index, index, index, index, index, index) -> f32
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (memref<1x100xf32>) -> (), sym_name = "negative_nonzero_offset", sym_visibility = "private"}> ({
  ^bb0(%arg6: memref<1x100xf32>):
    %15 = "arith.constant"() <{value = 0 : index}> : () -> index
    %16 = "arith.constant"() <{value = 13 : index}> : () -> index
    %17 = "memref.reinterpret_cast"(%arg6) <{operandSegmentSizes = array<i32: 1, 0, 0, 0>, static_offsets = array<i64: 1>, static_sizes = array<i64: 1, 1, 100>, static_strides = array<i64: 1, 1, 1>}> : (memref<1x100xf32>) -> memref<1x1x100xf32, strided<[1, 1, 1], offset: 1>>
    %18 = "memref.load"(%17, %15, %15, %16) : (memref<1x1x100xf32, strided<[1, 1, 1], offset: 1>>, index, index, index) -> f32
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (index, memref<?xf32>) -> (), sym_name = "negative_dynamic_shape", sym_visibility = "private"}> ({
  ^bb0(%arg4: index, %arg5: memref<?xf32>):
    %11 = "arith.constant"() <{value = 0 : index}> : () -> index
    %12 = "arith.constant"() <{value = 13 : index}> : () -> index
    %13 = "memref.reinterpret_cast"(%arg5, %arg4) <{operandSegmentSizes = array<i32: 1, 0, 1, 0>, static_offsets = array<i64: 0>, static_sizes = array<i64: 1, -9223372036854775808>, static_strides = array<i64: 1, 1>}> : (memref<?xf32>, index) -> memref<1x?xf32>
    %14 = "memref.load"(%13, %11, %12) : (memref<1x?xf32>, index, index) -> f32
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (index, memref<1x108xf32>) -> (), sym_name = "negative_dynamic_stride", sym_visibility = "private"}> ({
  ^bb0(%arg2: index, %arg3: memref<1x108xf32>):
    %7 = "arith.constant"() <{value = 0 : index}> : () -> index
    %8 = "arith.constant"() <{value = 13 : index}> : () -> index
    %9 = "memref.reinterpret_cast"(%arg3, %arg2) <{operandSegmentSizes = array<i32: 1, 0, 0, 1>, static_offsets = array<i64: 0>, static_sizes = array<i64: 108>, static_strides = array<i64: -9223372036854775808>}> : (memref<1x108xf32>, index) -> memref<108xf32, strided<[?]>>
    %10 = "memref.load"(%9, %8) : (memref<108xf32, strided<[?]>>, index) -> f32
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (memref<17x1x1x100xf32>) -> (), sym_name = "negative_diff_non_unit_dims_order", sym_visibility = "private"}> ({
  ^bb0(%arg1: memref<17x1x1x100xf32>):
    %4 = "arith.constant"() <{value = 13 : index}> : () -> index
    %5 = "memref.reinterpret_cast"(%arg1) <{operandSegmentSizes = array<i32: 1, 0, 0, 0>, static_offsets = array<i64: 0>, static_sizes = array<i64: 100, 17>, static_strides = array<i64: 1, 100>}> : (memref<17x1x1x100xf32>) -> memref<100x17xf32, strided<[1, 100]>>
    %6 = "memref.load"(%5, %4, %4) : (memref<100x17xf32, strided<[1, 100]>>, index, index) -> f32
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (memref<1x1x1x100xf32>) -> (), sym_name = "negative_diff_non_unit_size", sym_visibility = "private"}> ({
  ^bb0(%arg0: memref<1x1x1x100xf32>):
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index
    %1 = "arith.constant"() <{value = 13 : index}> : () -> index
    %2 = "memref.reinterpret_cast"(%arg0) <{operandSegmentSizes = array<i32: 1, 0, 0, 0>, static_offsets = array<i64: 0>, static_sizes = array<i64: 1, 99>, static_strides = array<i64: 99, 1>}> : (memref<1x1x1x100xf32>) -> memref<1x99xf32>
    %3 = "memref.load"(%2, %0, %1) : (memref<1x99xf32>, index, index) -> f32
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

