"builtin.module"() ({
  "func.func"() <{function_type = (tensor<1xf32>, index) -> (), sym_name = "extract_slice"}> ({
  ^bb0(%arg17: tensor<1xf32>, %arg18: index):
    %17 = "tensor.extract_slice"(%arg17, %arg18) <{operandSegmentSizes = array<i32: 1, 1, 0, 0>, static_offsets = array<i64: -9223372036854775808>, static_sizes = array<i64: 1>, static_strides = array<i64: 1>}> : (tensor<1xf32>, index) -> tensor<1xf32>
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<?x4xf32>, index, index, index) -> (), sym_name = "extract_slice_dynamic"}> ({
  ^bb0(%arg13: tensor<?x4xf32>, %arg14: index, %arg15: index, %arg16: index):
    %16 = "tensor.extract_slice"(%arg13, %arg14, %arg15, %arg16) <{operandSegmentSizes = array<i32: 1, 1, 1, 1>, static_offsets = array<i64: -9223372036854775808, 0>, static_sizes = array<i64: -9223372036854775808, 4>, static_strides = array<i64: -9223372036854775808, 1>}> : (tensor<?x4xf32>, index, index, index) -> tensor<?x4xf32>
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<?x4xf32>, index, index, index) -> (), sym_name = "extract_slice_dynamic_rank_reduce"}> ({
  ^bb0(%arg9: tensor<?x4xf32>, %arg10: index, %arg11: index, %arg12: index):
    %15 = "tensor.extract_slice"(%arg9, %arg10, %arg11, %arg12) <{operandSegmentSizes = array<i32: 1, 1, 1, 1>, static_offsets = array<i64: -9223372036854775808, 0>, static_sizes = array<i64: -9223372036854775808, 1>, static_strides = array<i64: -9223372036854775808, 1>}> : (tensor<?x4xf32>, index, index, index) -> tensor<?xf32>
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<10x4x1xf32>, index, index, index) -> (), sym_name = "extract_slice_zero_size_dim"}> ({
  ^bb0(%arg5: tensor<10x4x1xf32>, %arg6: index, %arg7: index, %arg8: index):
    %14 = "tensor.extract_slice"(%arg5, %arg6, %arg7, %arg8) <{operandSegmentSizes = array<i32: 1, 0, 3, 0>, static_offsets = array<i64: 0, 0, 0>, static_sizes = array<i64: -9223372036854775808, -9223372036854775808, -9223372036854775808>, static_strides = array<i64: 1, 1, 1>}> : (tensor<10x4x1xf32>, index, index, index) -> tensor<?x?x?xf32>
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<10x4x1xf32>, index, index, index, index) -> (), sym_name = "extract_slice_empty_tensor"}> ({
  ^bb0(%arg0: tensor<10x4x1xf32>, %arg1: index, %arg2: index, %arg3: index, %arg4: index):
    %13 = "tensor.extract_slice"(%arg0, %arg4, %arg1, %arg2, %arg3) <{operandSegmentSizes = array<i32: 1, 1, 3, 0>, static_offsets = array<i64: -9223372036854775808, 0, 0>, static_sizes = array<i64: -9223372036854775808, -9223372036854775808, -9223372036854775808>, static_strides = array<i64: 1, 1, 1>}> : (tensor<10x4x1xf32>, index, index, index, index) -> tensor<?x?x?xf32>
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "main"}> ({
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index
    %1 = "arith.constant"() <{value = 1 : index}> : () -> index
    %2 = "arith.constant"() <{value = -1 : index}> : () -> index
    %3 = "arith.constant"() <{value = 4 : index}> : () -> index
    %4 = "arith.constant"() <{value = 5 : index}> : () -> index
    %5 = "tensor.empty"() : () -> tensor<1xf32>
    %6 = "tensor.empty"() : () -> tensor<4x4xf32>
    %7 = "tensor.cast"(%6) : (tensor<4x4xf32>) -> tensor<?x4xf32>
    "func.call"(%7, %4, %4, %1) <{callee = @extract_slice_dynamic_rank_reduce}> : (tensor<?x4xf32>, index, index, index) -> ()
    "func.call"(%5, %1) <{callee = @extract_slice}> : (tensor<1xf32>, index) -> ()
    "func.call"(%5, %2) <{callee = @extract_slice}> : (tensor<1xf32>, index) -> ()
    "func.call"(%7, %0, %4, %1) <{callee = @extract_slice_dynamic}> : (tensor<?x4xf32>, index, index, index) -> ()
    "func.call"(%7, %0, %3, %3) <{callee = @extract_slice_dynamic}> : (tensor<?x4xf32>, index, index, index) -> ()
    "func.call"(%5, %0) <{callee = @extract_slice}> : (tensor<1xf32>, index) -> ()
    "func.call"(%7, %0, %3, %1) <{callee = @extract_slice_dynamic}> : (tensor<?x4xf32>, index, index, index) -> ()
    "func.call"(%7, %0, %1, %0) <{callee = @extract_slice_dynamic_rank_reduce}> : (tensor<?x4xf32>, index, index, index) -> ()
    %8 = "arith.constant"() <{value = dense<1.000000e+00> : tensor<10x4x1xf32>}> : () -> tensor<10x4x1xf32>
    %9 = "arith.constant"() <{value = 0 : index}> : () -> index
    %10 = "arith.constant"() <{value = 4 : index}> : () -> index
    %11 = "arith.constant"() <{value = 1 : index}> : () -> index
    "func.call"(%8, %9, %10, %11) <{callee = @extract_slice_zero_size_dim}> : (tensor<10x4x1xf32>, index, index, index) -> ()
    %12 = "arith.constant"() <{value = 10 : index}> : () -> index
    "func.call"(%8, %9, %10, %11, %12) <{callee = @extract_slice_empty_tensor}> : (tensor<10x4x1xf32>, index, index, index, index) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

