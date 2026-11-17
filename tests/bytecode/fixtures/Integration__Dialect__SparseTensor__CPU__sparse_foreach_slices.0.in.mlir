"builtin.module"() ({
  "func.func"() <{function_type = (tensor<4x4xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : dense, d1 : compressed) }>>) -> (), sym_name = "foreach_print_non_slice"}> ({
  ^bb0(%arg16: tensor<4x4xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : dense, d1 : compressed) }>> loc("<stdin>":9:8)):
    "sparse_tensor.foreach"(%arg16) ({
    ^bb0(%arg17: index loc("<stdin>":11:10), %arg18: index loc("<stdin>":11:25), %arg19: f64 loc("<stdin>":11:40)):
      "vector.print"(%arg17) <{punctuation = #vector.punctuation<newline>}> : (index) -> () loc("<stdin>":12:7)
      "vector.print"(%arg18) <{punctuation = #vector.punctuation<newline>}> : (index) -> () loc("<stdin>":13:7)
      "vector.print"(%arg19) <{punctuation = #vector.punctuation<newline>}> : (f64) -> () loc("<stdin>":14:7)
      "sparse_tensor.yield"() : () -> () loc("<stdin>":15:7)
    }) : (tensor<4x4xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : dense, d1 : compressed) }>>) -> () loc("<stdin>":10:5)
    "func.return"() : () -> () loc("<stdin>":17:5)
  }) : () -> () loc("<stdin>":8:3)
  "func.func"() <{function_type = (tensor<4x4xf64, #sparse_tensor.encoding<{ map = (d0 : #sparse_tensor<slice(1, 4, 1)>, d1 : #sparse_tensor<slice(1, 4, 2)>) -> (d0 : dense, d1 : compressed) }>>) -> (), sym_name = "foreach_print_slice"}> ({
  ^bb0(%arg12: tensor<4x4xf64, #sparse_tensor.encoding<{ map = (d0 : #sparse_tensor<slice(1, 4, 1)>, d1 : #sparse_tensor<slice(1, 4, 2)>) -> (d0 : dense, d1 : compressed) }>> loc("<stdin>":20:8)):
    "sparse_tensor.foreach"(%arg12) ({
    ^bb0(%arg13: index loc("<stdin>":22:10), %arg14: index loc("<stdin>":22:25), %arg15: f64 loc("<stdin>":22:40)):
      "vector.print"(%arg13) <{punctuation = #vector.punctuation<newline>}> : (index) -> () loc("<stdin>":23:7)
      "vector.print"(%arg14) <{punctuation = #vector.punctuation<newline>}> : (index) -> () loc("<stdin>":24:7)
      "vector.print"(%arg15) <{punctuation = #vector.punctuation<newline>}> : (f64) -> () loc("<stdin>":25:7)
      "sparse_tensor.yield"() : () -> () loc("<stdin>":26:7)
    }) : (tensor<4x4xf64, #sparse_tensor.encoding<{ map = (d0 : #sparse_tensor<slice(1, 4, 1)>, d1 : #sparse_tensor<slice(1, 4, 2)>) -> (d0 : dense, d1 : compressed) }>>) -> () loc("<stdin>":21:5)
    "func.return"() : () -> () loc("<stdin>":28:5)
  }) : () -> () loc("<stdin>":19:3)
  "func.func"() <{function_type = (tensor<?x?xf64, #sparse_tensor.encoding<{ map = (d0 : #sparse_tensor<slice(?, ?, ?)>, d1 : #sparse_tensor<slice(?, ?, ?)>) -> (d0 : dense, d1 : compressed) }>>) -> (), sym_name = "foreach_print_slice_dyn"}> ({
  ^bb0(%arg8: tensor<?x?xf64, #sparse_tensor.encoding<{ map = (d0 : #sparse_tensor<slice(?, ?, ?)>, d1 : #sparse_tensor<slice(?, ?, ?)>) -> (d0 : dense, d1 : compressed) }>> loc("<stdin>":31:8)):
    "sparse_tensor.foreach"(%arg8) ({
    ^bb0(%arg9: index loc("<stdin>":33:10), %arg10: index loc("<stdin>":33:24), %arg11: f64 loc("<stdin>":33:39)):
      "vector.print"(%arg9) <{punctuation = #vector.punctuation<newline>}> : (index) -> () loc("<stdin>":34:7)
      "vector.print"(%arg10) <{punctuation = #vector.punctuation<newline>}> : (index) -> () loc("<stdin>":35:7)
      "vector.print"(%arg11) <{punctuation = #vector.punctuation<newline>}> : (f64) -> () loc("<stdin>":36:7)
      "sparse_tensor.yield"() : () -> () loc("<stdin>":37:7)
    }) : (tensor<?x?xf64, #sparse_tensor.encoding<{ map = (d0 : #sparse_tensor<slice(?, ?, ?)>, d1 : #sparse_tensor<slice(?, ?, ?)>) -> (d0 : dense, d1 : compressed) }>>) -> () loc("<stdin>":32:5)
    "func.return"() : () -> () loc("<stdin>":39:5)
  }) : () -> () loc("<stdin>":30:3)
  "func.func"() <{function_type = (tensor<4x4xf64, #sparse_tensor.encoding<{ map = (d0 : #sparse_tensor<slice(1, 4, 1)>, d1 : #sparse_tensor<slice(1, 4, 2)>) -> (d0 : compressed(nonunique), d1 : singleton) }>>) -> (), sym_name = "foreach_print_slice_coo"}> ({
  ^bb0(%arg4: tensor<4x4xf64, #sparse_tensor.encoding<{ map = (d0 : #sparse_tensor<slice(1, 4, 1)>, d1 : #sparse_tensor<slice(1, 4, 2)>) -> (d0 : compressed(nonunique), d1 : singleton) }>> loc("<stdin>":42:8)):
    "sparse_tensor.foreach"(%arg4) ({
    ^bb0(%arg5: index loc("<stdin>":44:10), %arg6: index loc("<stdin>":44:24), %arg7: f64 loc("<stdin>":44:38)):
      "vector.print"(%arg5) <{punctuation = #vector.punctuation<newline>}> : (index) -> () loc("<stdin>":45:7)
      "vector.print"(%arg6) <{punctuation = #vector.punctuation<newline>}> : (index) -> () loc("<stdin>":46:7)
      "vector.print"(%arg7) <{punctuation = #vector.punctuation<newline>}> : (f64) -> () loc("<stdin>":47:7)
      "sparse_tensor.yield"() : () -> () loc("<stdin>":48:7)
    }) : (tensor<4x4xf64, #sparse_tensor.encoding<{ map = (d0 : #sparse_tensor<slice(1, 4, 1)>, d1 : #sparse_tensor<slice(1, 4, 2)>) -> (d0 : compressed(nonunique), d1 : singleton) }>>) -> () loc("<stdin>":43:5)
    "func.return"() : () -> () loc("<stdin>":50:5)
  }) : () -> () loc("<stdin>":41:3)
  "func.func"() <{function_type = (tensor<?x?xf64, #sparse_tensor.encoding<{ map = (d0 : #sparse_tensor<slice(?, ?, ?)>, d1 : #sparse_tensor<slice(?, ?, ?)>) -> (d0 : compressed(nonunique), d1 : singleton) }>>) -> (), sym_name = "foreach_print_slice_coo_dyn"}> ({
  ^bb0(%arg0: tensor<?x?xf64, #sparse_tensor.encoding<{ map = (d0 : #sparse_tensor<slice(?, ?, ?)>, d1 : #sparse_tensor<slice(?, ?, ?)>) -> (d0 : compressed(nonunique), d1 : singleton) }>> loc("<stdin>":53:8)):
    "sparse_tensor.foreach"(%arg0) ({
    ^bb0(%arg1: index loc("<stdin>":55:10), %arg2: index loc("<stdin>":55:24), %arg3: f64 loc("<stdin>":55:38)):
      "vector.print"(%arg1) <{punctuation = #vector.punctuation<newline>}> : (index) -> () loc("<stdin>":56:7)
      "vector.print"(%arg2) <{punctuation = #vector.punctuation<newline>}> : (index) -> () loc("<stdin>":57:7)
      "vector.print"(%arg3) <{punctuation = #vector.punctuation<newline>}> : (f64) -> () loc("<stdin>":58:7)
      "sparse_tensor.yield"() : () -> () loc("<stdin>":59:7)
    }) : (tensor<?x?xf64, #sparse_tensor.encoding<{ map = (d0 : #sparse_tensor<slice(?, ?, ?)>, d1 : #sparse_tensor<slice(?, ?, ?)>) -> (d0 : compressed(nonunique), d1 : singleton) }>>) -> () loc("<stdin>":54:5)
    "func.return"() : () -> () loc("<stdin>":61:5)
  }) : () -> () loc("<stdin>":52:3)
  "func.func"() <{function_type = () -> (), sym_name = "main"}> ({
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index loc("<stdin>":64:10)
    %1 = "arith.constant"() <{value = 1 : index}> : () -> index loc("<stdin>":65:10)
    %2 = "arith.constant"() <{value = 2 : index}> : () -> index loc("<stdin>":66:10)
    %3 = "arith.constant"() <{value = 4 : index}> : () -> index loc("<stdin>":67:10)
    %4 = "arith.constant"() <{value = dense<[[0.000000e+00, 2.100000e+00, 0.000000e+00, 0.000000e+00, 0.000000e+00, 6.100000e+00, 0.000000e+00, 0.000000e+00], [0.000000e+00, 0.000000e+00, 0.000000e+00, 0.000000e+00, 0.000000e+00, 0.000000e+00, 0.000000e+00, 0.000000e+00], [0.000000e+00, 2.300000e+00, 0.000000e+00, 0.000000e+00, 0.000000e+00, 0.000000e+00, 0.000000e+00, 0.000000e+00], [0.000000e+00, 0.000000e+00, 0.000000e+00, 0.000000e+00, 0.000000e+00, 0.000000e+00, 0.000000e+00, 1.000000e+00], [0.000000e+00, 0.000000e+00, 1.000000e-01, 0.000000e+00, 0.000000e+00, 2.100000e+00, 0.000000e+00, 0.000000e+00], [0.000000e+00, 0.000000e+00, 0.000000e+00, 0.000000e+00, 3.100000e+00, 0.000000e+00, 0.000000e+00, 0.000000e+00], [0.000000e+00, 2.300000e+00, 0.000000e+00, 0.000000e+00, 0.000000e+00, 0.000000e+00, 3.300000e+00, 0.000000e+00], [0.000000e+00, 0.000000e+00, 0.000000e+00, 0.000000e+00, 0.000000e+00, 0.000000e+00, 0.000000e+00, 1.000000e+00]]> : tensor<8x8xf64>}> : () -> tensor<8x8xf64> loc("<stdin>":68:10)
    %5 = "sparse_tensor.convert"(%4) : (tensor<8x8xf64>) -> tensor<8x8xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : dense, d1 : compressed) }>> loc("<stdin>":69:10)
    %6 = "tensor.extract_slice"(%5) <{operandSegmentSizes = array<i32: 1, 0, 0, 0>, static_offsets = array<i64: 1, 1>, static_sizes = array<i64: 4, 4>, static_strides = array<i64: 1, 2>}> : (tensor<8x8xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : dense, d1 : compressed) }>>) -> tensor<4x4xf64, #sparse_tensor.encoding<{ map = (d0 : #sparse_tensor<slice(1, 4, 1)>, d1 : #sparse_tensor<slice(1, 4, 2)>) -> (d0 : dense, d1 : compressed) }>> loc("<stdin>":70:10)
    %7 = "sparse_tensor.convert"(%4) : (tensor<8x8xf64>) -> tensor<8x8xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed(nonunique), d1 : singleton) }>> loc("<stdin>":71:10)
    %8 = "tensor.extract_slice"(%7) <{operandSegmentSizes = array<i32: 1, 0, 0, 0>, static_offsets = array<i64: 1, 1>, static_sizes = array<i64: 4, 4>, static_strides = array<i64: 1, 2>}> : (tensor<8x8xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed(nonunique), d1 : singleton) }>>) -> tensor<4x4xf64, #sparse_tensor.encoding<{ map = (d0 : #sparse_tensor<slice(1, 4, 1)>, d1 : #sparse_tensor<slice(1, 4, 2)>) -> (d0 : compressed(nonunique), d1 : singleton) }>> loc("<stdin>":72:10)
    "func.call"(%6) <{callee = @foreach_print_slice}> : (tensor<4x4xf64, #sparse_tensor.encoding<{ map = (d0 : #sparse_tensor<slice(1, 4, 1)>, d1 : #sparse_tensor<slice(1, 4, 2)>) -> (d0 : dense, d1 : compressed) }>>) -> () loc("<stdin>":73:5)
    "func.call"(%8) <{callee = @foreach_print_slice_coo}> : (tensor<4x4xf64, #sparse_tensor.encoding<{ map = (d0 : #sparse_tensor<slice(1, 4, 1)>, d1 : #sparse_tensor<slice(1, 4, 2)>) -> (d0 : compressed(nonunique), d1 : singleton) }>>) -> () loc("<stdin>":74:5)
    %9 = "tensor.extract_slice"(%4) <{operandSegmentSizes = array<i32: 1, 0, 0, 0>, static_offsets = array<i64: 1, 1>, static_sizes = array<i64: 4, 4>, static_strides = array<i64: 1, 2>}> : (tensor<8x8xf64>) -> tensor<4x4xf64> loc("<stdin>":75:10)
    %10 = "sparse_tensor.convert"(%9) : (tensor<4x4xf64>) -> tensor<4x4xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : dense, d1 : compressed) }>> loc("<stdin>":76:11)
    "func.call"(%10) <{callee = @foreach_print_non_slice}> : (tensor<4x4xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : dense, d1 : compressed) }>>) -> () loc("<stdin>":77:5)
    %11 = "sparse_tensor.convert"(%4) : (tensor<8x8xf64>) -> tensor<8x8xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : dense, d1 : compressed) }>> loc("<stdin>":78:11)
    %12 = "tensor.extract_slice"(%11, %1, %1, %3, %3, %1, %2) <{operandSegmentSizes = array<i32: 1, 2, 2, 2>, static_offsets = array<i64: -9223372036854775808, -9223372036854775808>, static_sizes = array<i64: -9223372036854775808, -9223372036854775808>, static_strides = array<i64: -9223372036854775808, -9223372036854775808>}> : (tensor<8x8xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : dense, d1 : compressed) }>>, index, index, index, index, index, index) -> tensor<?x?xf64, #sparse_tensor.encoding<{ map = (d0 : #sparse_tensor<slice(?, ?, ?)>, d1 : #sparse_tensor<slice(?, ?, ?)>) -> (d0 : dense, d1 : compressed) }>> loc("<stdin>":79:11)
    %13 = "sparse_tensor.convert"(%4) : (tensor<8x8xf64>) -> tensor<8x8xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed(nonunique), d1 : singleton) }>> loc("<stdin>":80:11)
    %14 = "tensor.extract_slice"(%13, %1, %1, %3, %3, %1, %2) <{operandSegmentSizes = array<i32: 1, 2, 2, 2>, static_offsets = array<i64: -9223372036854775808, -9223372036854775808>, static_sizes = array<i64: -9223372036854775808, -9223372036854775808>, static_strides = array<i64: -9223372036854775808, -9223372036854775808>}> : (tensor<8x8xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed(nonunique), d1 : singleton) }>>, index, index, index, index, index, index) -> tensor<?x?xf64, #sparse_tensor.encoding<{ map = (d0 : #sparse_tensor<slice(?, ?, ?)>, d1 : #sparse_tensor<slice(?, ?, ?)>) -> (d0 : compressed(nonunique), d1 : singleton) }>> loc("<stdin>":81:11)
    "func.call"(%12) <{callee = @foreach_print_slice_dyn}> : (tensor<?x?xf64, #sparse_tensor.encoding<{ map = (d0 : #sparse_tensor<slice(?, ?, ?)>, d1 : #sparse_tensor<slice(?, ?, ?)>) -> (d0 : dense, d1 : compressed) }>>) -> () loc("<stdin>":82:5)
    "func.call"(%14) <{callee = @foreach_print_slice_coo_dyn}> : (tensor<?x?xf64, #sparse_tensor.encoding<{ map = (d0 : #sparse_tensor<slice(?, ?, ?)>, d1 : #sparse_tensor<slice(?, ?, ?)>) -> (d0 : compressed(nonunique), d1 : singleton) }>>) -> () loc("<stdin>":83:5)
    "bufferization.dealloc_tensor"(%5) : (tensor<8x8xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : dense, d1 : compressed) }>>) -> () loc("<stdin>":84:5)
    "bufferization.dealloc_tensor"(%11) : (tensor<8x8xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : dense, d1 : compressed) }>>) -> () loc("<stdin>":85:5)
    "bufferization.dealloc_tensor"(%7) : (tensor<8x8xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed(nonunique), d1 : singleton) }>>) -> () loc("<stdin>":86:5)
    "bufferization.dealloc_tensor"(%13) : (tensor<8x8xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed(nonunique), d1 : singleton) }>>) -> () loc("<stdin>":87:5)
    "bufferization.dealloc_tensor"(%10) : (tensor<4x4xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : dense, d1 : compressed) }>>) -> () loc("<stdin>":88:5)
    "func.return"() : () -> () loc("<stdin>":89:5)
  }) : () -> () loc("<stdin>":63:3)
}) : () -> () loc("<stdin>":7:1)
