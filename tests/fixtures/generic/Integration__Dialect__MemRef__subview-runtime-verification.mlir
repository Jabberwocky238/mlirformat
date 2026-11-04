"builtin.module"() ({
  "func.func"() <{function_type = (memref<1xf32>, index) -> (), sym_name = "subview"}> ({
  ^bb0(%arg17: memref<1xf32>, %arg18: index):
    %18 = "memref.subview"(%arg17, %arg18) <{operandSegmentSizes = array<i32: 1, 1, 0, 0>, static_offsets = array<i64: -9223372036854775808>, static_sizes = array<i64: 1>, static_strides = array<i64: 1>}> : (memref<1xf32>, index) -> memref<1xf32, strided<[1], offset: ?>>
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (memref<?x4xf32>, index, index, index) -> (), sym_name = "subview_dynamic"}> ({
  ^bb0(%arg13: memref<?x4xf32>, %arg14: index, %arg15: index, %arg16: index):
    %17 = "memref.subview"(%arg13, %arg14, %arg15, %arg16) <{operandSegmentSizes = array<i32: 1, 1, 1, 1>, static_offsets = array<i64: -9223372036854775808, 0>, static_sizes = array<i64: -9223372036854775808, 4>, static_strides = array<i64: -9223372036854775808, 1>}> : (memref<?x4xf32>, index, index, index) -> memref<?x4xf32, strided<[?, 1], offset: ?>>
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (memref<?x4xf32>, index, index, index) -> (), sym_name = "subview_dynamic_rank_reduce"}> ({
  ^bb0(%arg9: memref<?x4xf32>, %arg10: index, %arg11: index, %arg12: index):
    %16 = "memref.subview"(%arg9, %arg10, %arg11, %arg12) <{operandSegmentSizes = array<i32: 1, 1, 1, 1>, static_offsets = array<i64: -9223372036854775808, 0>, static_sizes = array<i64: -9223372036854775808, 1>, static_strides = array<i64: -9223372036854775808, 1>}> : (memref<?x4xf32>, index, index, index) -> memref<?xf32, strided<[?], offset: ?>>
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (memref<10x4x1xf32, strided<[?, ?, ?], offset: ?>>, index, index, index) -> (), sym_name = "subview_zero_size_dim"}> ({
  ^bb0(%arg5: memref<10x4x1xf32, strided<[?, ?, ?], offset: ?>>, %arg6: index, %arg7: index, %arg8: index):
    %15 = "memref.subview"(%arg5, %arg6, %arg7, %arg8) <{operandSegmentSizes = array<i32: 1, 0, 3, 0>, static_offsets = array<i64: 0, 0, 0>, static_sizes = array<i64: -9223372036854775808, -9223372036854775808, -9223372036854775808>, static_strides = array<i64: 1, 1, 1>}> : (memref<10x4x1xf32, strided<[?, ?, ?], offset: ?>>, index, index, index) -> memref<?x?x?xf32, strided<[?, ?, ?], offset: ?>>
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (memref<10x4x1xf32, strided<[?, ?, ?], offset: ?>>, index, index, index, index) -> (), sym_name = "subview_with_empty_slice"}> ({
  ^bb0(%arg0: memref<10x4x1xf32, strided<[?, ?, ?], offset: ?>>, %arg1: index, %arg2: index, %arg3: index, %arg4: index):
    %14 = "memref.subview"(%arg0, %arg4, %arg1, %arg2, %arg3) <{operandSegmentSizes = array<i32: 1, 1, 3, 0>, static_offsets = array<i64: -9223372036854775808, 0, 0>, static_sizes = array<i64: -9223372036854775808, -9223372036854775808, -9223372036854775808>, static_strides = array<i64: 1, 1, 1>}> : (memref<10x4x1xf32, strided<[?, ?, ?], offset: ?>>, index, index, index, index) -> memref<?x?x?xf32, strided<[?, ?, ?], offset: ?>>
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "main"}> ({
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index
    %1 = "arith.constant"() <{value = 1 : index}> : () -> index
    %2 = "arith.constant"() <{value = -1 : index}> : () -> index
    %3 = "arith.constant"() <{value = 4 : index}> : () -> index
    %4 = "arith.constant"() <{value = 5 : index}> : () -> index
    %5 = "memref.alloca"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<1xf32>
    %6 = "memref.alloca"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<4x4xf32>
    %7 = "memref.cast"(%6) : (memref<4x4xf32>) -> memref<?x4xf32>
    "func.call"(%7, %4, %4, %1) <{callee = @subview_dynamic_rank_reduce}> : (memref<?x4xf32>, index, index, index) -> ()
    "func.call"(%5, %1) <{callee = @subview}> : (memref<1xf32>, index) -> ()
    "func.call"(%5, %2) <{callee = @subview}> : (memref<1xf32>, index) -> ()
    "func.call"(%7, %0, %4, %1) <{callee = @subview_dynamic}> : (memref<?x4xf32>, index, index, index) -> ()
    "func.call"(%7, %0, %3, %3) <{callee = @subview_dynamic}> : (memref<?x4xf32>, index, index, index) -> ()
    "func.call"(%5, %0) <{callee = @subview}> : (memref<1xf32>, index) -> ()
    "func.call"(%7, %0, %3, %1) <{callee = @subview_dynamic}> : (memref<?x4xf32>, index, index, index) -> ()
    "func.call"(%7, %0, %1, %0) <{callee = @subview_dynamic_rank_reduce}> : (memref<?x4xf32>, index, index, index) -> ()
    %8 = "memref.alloca"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<10x4x1xf32>
    %9 = "memref.cast"(%8) : (memref<10x4x1xf32>) -> memref<10x4x1xf32, strided<[?, ?, ?], offset: ?>>
    %10 = "arith.constant"() <{value = 0 : index}> : () -> index
    %11 = "arith.constant"() <{value = 4 : index}> : () -> index
    %12 = "arith.constant"() <{value = 1 : index}> : () -> index
    "func.call"(%9, %10, %11, %12) <{callee = @subview_zero_size_dim}> : (memref<10x4x1xf32, strided<[?, ?, ?], offset: ?>>, index, index, index) -> ()
    %13 = "arith.constant"() <{value = 10 : index}> : () -> index
    "func.call"(%9, %10, %11, %12, %13) <{callee = @subview_with_empty_slice}> : (memref<10x4x1xf32, strided<[?, ?, ?], offset: ?>>, index, index, index, index) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

