"builtin.module"() ({
  "func.func"() <{function_type = (memref<1xf32>, index) -> (), sym_name = "subview"}> ({
  ^bb0(%arg17: memref<1xf32> loc("<stdin>":3:8), %arg18: index loc("<stdin>":3:31)):
    %18 = "memref.subview"(%arg17, %arg18) <{operandSegmentSizes = array<i32: 1, 1, 0, 0>, static_offsets = array<i64: -9223372036854775808>, static_sizes = array<i64: 1>, static_strides = array<i64: 1>}> : (memref<1xf32>, index) -> memref<1xf32, strided<[1], offset: ?>> loc("<stdin>":4:11)
    "func.return"() : () -> () loc("<stdin>":5:5)
  }) : () -> () loc("<stdin>":2:3)
  "func.func"() <{function_type = (memref<?x4xf32>, index, index, index) -> (), sym_name = "subview_dynamic"}> ({
  ^bb0(%arg13: memref<?x4xf32> loc("<stdin>":8:8), %arg14: index loc("<stdin>":8:33), %arg15: index loc("<stdin>":8:48), %arg16: index loc("<stdin>":8:63)):
    %17 = "memref.subview"(%arg13, %arg14, %arg15, %arg16) <{operandSegmentSizes = array<i32: 1, 1, 1, 1>, static_offsets = array<i64: -9223372036854775808, 0>, static_sizes = array<i64: -9223372036854775808, 4>, static_strides = array<i64: -9223372036854775808, 1>}> : (memref<?x4xf32>, index, index, index) -> memref<?x4xf32, strided<[?, 1], offset: ?>> loc("<stdin>":9:11)
    "func.return"() : () -> () loc("<stdin>":10:5)
  }) : () -> () loc("<stdin>":7:3)
  "func.func"() <{function_type = (memref<?x4xf32>, index, index, index) -> (), sym_name = "subview_dynamic_rank_reduce"}> ({
  ^bb0(%arg9: memref<?x4xf32> loc("<stdin>":13:8), %arg10: index loc("<stdin>":13:32), %arg11: index loc("<stdin>":13:47), %arg12: index loc("<stdin>":13:62)):
    %16 = "memref.subview"(%arg9, %arg10, %arg11, %arg12) <{operandSegmentSizes = array<i32: 1, 1, 1, 1>, static_offsets = array<i64: -9223372036854775808, 0>, static_sizes = array<i64: -9223372036854775808, 1>, static_strides = array<i64: -9223372036854775808, 1>}> : (memref<?x4xf32>, index, index, index) -> memref<?xf32, strided<[?], offset: ?>> loc("<stdin>":14:11)
    "func.return"() : () -> () loc("<stdin>":15:5)
  }) : () -> () loc("<stdin>":12:3)
  "func.func"() <{function_type = (memref<10x4x1xf32, strided<[?, ?, ?], offset: ?>>, index, index, index) -> (), sym_name = "subview_zero_size_dim"}> ({
  ^bb0(%arg5: memref<10x4x1xf32, strided<[?, ?, ?], offset: ?>> loc("<stdin>":18:8), %arg6: index loc("<stdin>":18:66), %arg7: index loc("<stdin>":18:80), %arg8: index loc("<stdin>":18:94)):
    %15 = "memref.subview"(%arg5, %arg6, %arg7, %arg8) <{operandSegmentSizes = array<i32: 1, 0, 3, 0>, static_offsets = array<i64: 0, 0, 0>, static_sizes = array<i64: -9223372036854775808, -9223372036854775808, -9223372036854775808>, static_strides = array<i64: 1, 1, 1>}> : (memref<10x4x1xf32, strided<[?, ?, ?], offset: ?>>, index, index, index) -> memref<?x?x?xf32, strided<[?, ?, ?], offset: ?>> loc("<stdin>":19:11)
    "func.return"() : () -> () loc("<stdin>":20:5)
  }) : () -> () loc("<stdin>":17:3)
  "func.func"() <{function_type = (memref<10x4x1xf32, strided<[?, ?, ?], offset: ?>>, index, index, index, index) -> (), sym_name = "subview_with_empty_slice"}> ({
  ^bb0(%arg0: memref<10x4x1xf32, strided<[?, ?, ?], offset: ?>> loc("<stdin>":23:8), %arg1: index loc("<stdin>":23:66), %arg2: index loc("<stdin>":23:80), %arg3: index loc("<stdin>":23:94), %arg4: index loc("<stdin>":23:108)):
    %14 = "memref.subview"(%arg0, %arg4, %arg1, %arg2, %arg3) <{operandSegmentSizes = array<i32: 1, 1, 3, 0>, static_offsets = array<i64: -9223372036854775808, 0, 0>, static_sizes = array<i64: -9223372036854775808, -9223372036854775808, -9223372036854775808>, static_strides = array<i64: 1, 1, 1>}> : (memref<10x4x1xf32, strided<[?, ?, ?], offset: ?>>, index, index, index, index) -> memref<?x?x?xf32, strided<[?, ?, ?], offset: ?>> loc("<stdin>":24:11)
    "func.return"() : () -> () loc("<stdin>":25:5)
  }) : () -> () loc("<stdin>":22:3)
  "func.func"() <{function_type = () -> (), sym_name = "main"}> ({
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index loc("<stdin>":28:10)
    %1 = "arith.constant"() <{value = 1 : index}> : () -> index loc("<stdin>":29:10)
    %2 = "arith.constant"() <{value = -1 : index}> : () -> index loc("<stdin>":30:10)
    %3 = "arith.constant"() <{value = 4 : index}> : () -> index loc("<stdin>":31:10)
    %4 = "arith.constant"() <{value = 5 : index}> : () -> index loc("<stdin>":32:10)
    %5 = "memref.alloca"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<1xf32> loc("<stdin>":33:10)
    %6 = "memref.alloca"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<4x4xf32> loc("<stdin>":34:10)
    %7 = "memref.cast"(%6) : (memref<4x4xf32>) -> memref<?x4xf32> loc("<stdin>":35:10)
    "func.call"(%7, %4, %4, %1) <{callee = @subview_dynamic_rank_reduce}> : (memref<?x4xf32>, index, index, index) -> () loc("<stdin>":36:5)
    "func.call"(%5, %1) <{callee = @subview}> : (memref<1xf32>, index) -> () loc("<stdin>":37:5)
    "func.call"(%5, %2) <{callee = @subview}> : (memref<1xf32>, index) -> () loc("<stdin>":38:5)
    "func.call"(%7, %0, %4, %1) <{callee = @subview_dynamic}> : (memref<?x4xf32>, index, index, index) -> () loc("<stdin>":39:5)
    "func.call"(%7, %0, %3, %3) <{callee = @subview_dynamic}> : (memref<?x4xf32>, index, index, index) -> () loc("<stdin>":40:5)
    "func.call"(%5, %0) <{callee = @subview}> : (memref<1xf32>, index) -> () loc("<stdin>":41:5)
    "func.call"(%7, %0, %3, %1) <{callee = @subview_dynamic}> : (memref<?x4xf32>, index, index, index) -> () loc("<stdin>":42:5)
    "func.call"(%7, %0, %1, %0) <{callee = @subview_dynamic_rank_reduce}> : (memref<?x4xf32>, index, index, index) -> () loc("<stdin>":43:5)
    %8 = "memref.alloca"() <{operandSegmentSizes = array<i32: 0, 0>}> : () -> memref<10x4x1xf32> loc("<stdin>":44:10)
    %9 = "memref.cast"(%8) : (memref<10x4x1xf32>) -> memref<10x4x1xf32, strided<[?, ?, ?], offset: ?>> loc("<stdin>":45:10)
    %10 = "arith.constant"() <{value = 0 : index}> : () -> index loc("<stdin>":46:11)
    %11 = "arith.constant"() <{value = 4 : index}> : () -> index loc("<stdin>":47:11)
    %12 = "arith.constant"() <{value = 1 : index}> : () -> index loc("<stdin>":48:11)
    "func.call"(%9, %10, %11, %12) <{callee = @subview_zero_size_dim}> : (memref<10x4x1xf32, strided<[?, ?, ?], offset: ?>>, index, index, index) -> () loc("<stdin>":49:5)
    %13 = "arith.constant"() <{value = 10 : index}> : () -> index loc("<stdin>":50:11)
    "func.call"(%9, %10, %11, %12, %13) <{callee = @subview_with_empty_slice}> : (memref<10x4x1xf32, strided<[?, ?, ?], offset: ?>>, index, index, index, index) -> () loc("<stdin>":51:5)
    "func.return"() : () -> () loc("<stdin>":52:5)
  }) : () -> () loc("<stdin>":27:3)
}) : () -> () loc("<stdin>":1:1)
