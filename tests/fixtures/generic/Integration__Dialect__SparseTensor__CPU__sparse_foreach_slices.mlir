#sparse = #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : dense, d1 : compressed) }>
#sparse1 = #sparse_tensor.encoding<{ map = (d0 : #sparse_tensor<slice(1, 4, 1)>, d1 : #sparse_tensor<slice(1, 4, 2)>) -> (d0 : dense, d1 : compressed) }>
#sparse2 = #sparse_tensor.encoding<{ map = (d0 : #sparse_tensor<slice(?, ?, ?)>, d1 : #sparse_tensor<slice(?, ?, ?)>) -> (d0 : dense, d1 : compressed) }>
#sparse3 = #sparse_tensor.encoding<{ map = (d0 : #sparse_tensor<slice(1, 4, 1)>, d1 : #sparse_tensor<slice(1, 4, 2)>) -> (d0 : compressed(nonunique), d1 : singleton) }>
#sparse4 = #sparse_tensor.encoding<{ map = (d0 : #sparse_tensor<slice(?, ?, ?)>, d1 : #sparse_tensor<slice(?, ?, ?)>) -> (d0 : compressed(nonunique), d1 : singleton) }>
#sparse5 = #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed(nonunique), d1 : singleton) }>
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<4x4xf64, #sparse>) -> (), sym_name = "foreach_print_non_slice"}> ({
  ^bb0(%arg16: tensor<4x4xf64, #sparse>):
    "sparse_tensor.foreach"(%arg16) ({
    ^bb0(%arg17: index, %arg18: index, %arg19: f64):
      "vector.print"(%arg17) <{punctuation = #vector.punctuation<newline>}> : (index) -> ()
      "vector.print"(%arg18) <{punctuation = #vector.punctuation<newline>}> : (index) -> ()
      "vector.print"(%arg19) <{punctuation = #vector.punctuation<newline>}> : (f64) -> ()
      "sparse_tensor.yield"() : () -> ()
    }) : (tensor<4x4xf64, #sparse>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<4x4xf64, #sparse1>) -> (), sym_name = "foreach_print_slice"}> ({
  ^bb0(%arg12: tensor<4x4xf64, #sparse1>):
    "sparse_tensor.foreach"(%arg12) ({
    ^bb0(%arg13: index, %arg14: index, %arg15: f64):
      "vector.print"(%arg13) <{punctuation = #vector.punctuation<newline>}> : (index) -> ()
      "vector.print"(%arg14) <{punctuation = #vector.punctuation<newline>}> : (index) -> ()
      "vector.print"(%arg15) <{punctuation = #vector.punctuation<newline>}> : (f64) -> ()
      "sparse_tensor.yield"() : () -> ()
    }) : (tensor<4x4xf64, #sparse1>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<?x?xf64, #sparse2>) -> (), sym_name = "foreach_print_slice_dyn"}> ({
  ^bb0(%arg8: tensor<?x?xf64, #sparse2>):
    "sparse_tensor.foreach"(%arg8) ({
    ^bb0(%arg9: index, %arg10: index, %arg11: f64):
      "vector.print"(%arg9) <{punctuation = #vector.punctuation<newline>}> : (index) -> ()
      "vector.print"(%arg10) <{punctuation = #vector.punctuation<newline>}> : (index) -> ()
      "vector.print"(%arg11) <{punctuation = #vector.punctuation<newline>}> : (f64) -> ()
      "sparse_tensor.yield"() : () -> ()
    }) : (tensor<?x?xf64, #sparse2>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<4x4xf64, #sparse3>) -> (), sym_name = "foreach_print_slice_coo"}> ({
  ^bb0(%arg4: tensor<4x4xf64, #sparse3>):
    "sparse_tensor.foreach"(%arg4) ({
    ^bb0(%arg5: index, %arg6: index, %arg7: f64):
      "vector.print"(%arg5) <{punctuation = #vector.punctuation<newline>}> : (index) -> ()
      "vector.print"(%arg6) <{punctuation = #vector.punctuation<newline>}> : (index) -> ()
      "vector.print"(%arg7) <{punctuation = #vector.punctuation<newline>}> : (f64) -> ()
      "sparse_tensor.yield"() : () -> ()
    }) : (tensor<4x4xf64, #sparse3>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<?x?xf64, #sparse4>) -> (), sym_name = "foreach_print_slice_coo_dyn"}> ({
  ^bb0(%arg0: tensor<?x?xf64, #sparse4>):
    "sparse_tensor.foreach"(%arg0) ({
    ^bb0(%arg1: index, %arg2: index, %arg3: f64):
      "vector.print"(%arg1) <{punctuation = #vector.punctuation<newline>}> : (index) -> ()
      "vector.print"(%arg2) <{punctuation = #vector.punctuation<newline>}> : (index) -> ()
      "vector.print"(%arg3) <{punctuation = #vector.punctuation<newline>}> : (f64) -> ()
      "sparse_tensor.yield"() : () -> ()
    }) : (tensor<?x?xf64, #sparse4>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "main"}> ({
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index
    %1 = "arith.constant"() <{value = 1 : index}> : () -> index
    %2 = "arith.constant"() <{value = 2 : index}> : () -> index
    %3 = "arith.constant"() <{value = 4 : index}> : () -> index
    %4 = "arith.constant"() <{value = dense<[[0.000000e+00, 2.100000e+00, 0.000000e+00, 0.000000e+00, 0.000000e+00, 6.100000e+00, 0.000000e+00, 0.000000e+00], [0.000000e+00, 0.000000e+00, 0.000000e+00, 0.000000e+00, 0.000000e+00, 0.000000e+00, 0.000000e+00, 0.000000e+00], [0.000000e+00, 2.300000e+00, 0.000000e+00, 0.000000e+00, 0.000000e+00, 0.000000e+00, 0.000000e+00, 0.000000e+00], [0.000000e+00, 0.000000e+00, 0.000000e+00, 0.000000e+00, 0.000000e+00, 0.000000e+00, 0.000000e+00, 1.000000e+00], [0.000000e+00, 0.000000e+00, 1.000000e-01, 0.000000e+00, 0.000000e+00, 2.100000e+00, 0.000000e+00, 0.000000e+00], [0.000000e+00, 0.000000e+00, 0.000000e+00, 0.000000e+00, 3.100000e+00, 0.000000e+00, 0.000000e+00, 0.000000e+00], [0.000000e+00, 2.300000e+00, 0.000000e+00, 0.000000e+00, 0.000000e+00, 0.000000e+00, 3.300000e+00, 0.000000e+00], [0.000000e+00, 0.000000e+00, 0.000000e+00, 0.000000e+00, 0.000000e+00, 0.000000e+00, 0.000000e+00, 1.000000e+00]]> : tensor<8x8xf64>}> : () -> tensor<8x8xf64>
    %5 = "sparse_tensor.convert"(%4) : (tensor<8x8xf64>) -> tensor<8x8xf64, #sparse>
    %6 = "tensor.extract_slice"(%5) <{operandSegmentSizes = array<i32: 1, 0, 0, 0>, static_offsets = array<i64: 1, 1>, static_sizes = array<i64: 4, 4>, static_strides = array<i64: 1, 2>}> : (tensor<8x8xf64, #sparse>) -> tensor<4x4xf64, #sparse1>
    %7 = "sparse_tensor.convert"(%4) : (tensor<8x8xf64>) -> tensor<8x8xf64, #sparse5>
    %8 = "tensor.extract_slice"(%7) <{operandSegmentSizes = array<i32: 1, 0, 0, 0>, static_offsets = array<i64: 1, 1>, static_sizes = array<i64: 4, 4>, static_strides = array<i64: 1, 2>}> : (tensor<8x8xf64, #sparse5>) -> tensor<4x4xf64, #sparse3>
    "func.call"(%6) <{callee = @foreach_print_slice}> : (tensor<4x4xf64, #sparse1>) -> ()
    "func.call"(%8) <{callee = @foreach_print_slice_coo}> : (tensor<4x4xf64, #sparse3>) -> ()
    %9 = "tensor.extract_slice"(%4) <{operandSegmentSizes = array<i32: 1, 0, 0, 0>, static_offsets = array<i64: 1, 1>, static_sizes = array<i64: 4, 4>, static_strides = array<i64: 1, 2>}> : (tensor<8x8xf64>) -> tensor<4x4xf64>
    %10 = "sparse_tensor.convert"(%9) : (tensor<4x4xf64>) -> tensor<4x4xf64, #sparse>
    "func.call"(%10) <{callee = @foreach_print_non_slice}> : (tensor<4x4xf64, #sparse>) -> ()
    %11 = "sparse_tensor.convert"(%4) : (tensor<8x8xf64>) -> tensor<8x8xf64, #sparse>
    %12 = "tensor.extract_slice"(%11, %1, %1, %3, %3, %1, %2) <{operandSegmentSizes = array<i32: 1, 2, 2, 2>, static_offsets = array<i64: -9223372036854775808, -9223372036854775808>, static_sizes = array<i64: -9223372036854775808, -9223372036854775808>, static_strides = array<i64: -9223372036854775808, -9223372036854775808>}> : (tensor<8x8xf64, #sparse>, index, index, index, index, index, index) -> tensor<?x?xf64, #sparse2>
    %13 = "sparse_tensor.convert"(%4) : (tensor<8x8xf64>) -> tensor<8x8xf64, #sparse5>
    %14 = "tensor.extract_slice"(%13, %1, %1, %3, %3, %1, %2) <{operandSegmentSizes = array<i32: 1, 2, 2, 2>, static_offsets = array<i64: -9223372036854775808, -9223372036854775808>, static_sizes = array<i64: -9223372036854775808, -9223372036854775808>, static_strides = array<i64: -9223372036854775808, -9223372036854775808>}> : (tensor<8x8xf64, #sparse5>, index, index, index, index, index, index) -> tensor<?x?xf64, #sparse4>
    "func.call"(%12) <{callee = @foreach_print_slice_dyn}> : (tensor<?x?xf64, #sparse2>) -> ()
    "func.call"(%14) <{callee = @foreach_print_slice_coo_dyn}> : (tensor<?x?xf64, #sparse4>) -> ()
    "bufferization.dealloc_tensor"(%5) : (tensor<8x8xf64, #sparse>) -> ()
    "bufferization.dealloc_tensor"(%11) : (tensor<8x8xf64, #sparse>) -> ()
    "bufferization.dealloc_tensor"(%7) : (tensor<8x8xf64, #sparse5>) -> ()
    "bufferization.dealloc_tensor"(%13) : (tensor<8x8xf64, #sparse5>) -> ()
    "bufferization.dealloc_tensor"(%10) : (tensor<4x4xf64, #sparse>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

