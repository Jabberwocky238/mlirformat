"builtin.module"() ({
  "func.func"() <{function_type = (tensor<*xf64>) -> (), sym_name = "printMemrefF64", sym_visibility = "private"}> ({
  }) : () -> () loc("<stdin>":8:3)
  "func.func"() <{function_type = (memref<?xf64>) -> (), sym_name = "printMemref1dF64", sym_visibility = "private"}> ({
  }) {llvm.emit_c_interface} : () -> () loc("<stdin>":10:3)
  "func.func"() <{function_type = (tensor<2x4xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d1 : compressed, d0 : compressed) }>>, tensor<3x4xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed, d1 : dense) }>>, tensor<4x4xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : dense, d1 : compressed) }>>) -> tensor<9x4xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d1 : compressed, d0 : compressed) }>>, sym_name = "concat_sparse_sparse_perm"}> ({
  ^bb0(%arg11: tensor<2x4xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d1 : compressed, d0 : compressed) }>> loc("<stdin>":13:8), %arg12: tensor<3x4xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed, d1 : dense) }>> loc("<stdin>":13:42), %arg13: tensor<4x4xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : dense, d1 : compressed) }>> loc("<stdin>":13:77)):
    %23 = "sparse_tensor.concatenate"(%arg11, %arg12, %arg13) <{dimension = 0 : index}> : (tensor<2x4xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d1 : compressed, d0 : compressed) }>>, tensor<3x4xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed, d1 : dense) }>>, tensor<4x4xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : dense, d1 : compressed) }>>) -> tensor<9x4xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d1 : compressed, d0 : compressed) }>> loc("<stdin>":14:11)
    "func.return"(%23) : (tensor<9x4xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d1 : compressed, d0 : compressed) }>>) -> () loc("<stdin>":15:5)
  }) : () -> () loc("<stdin>":12:3)
  "func.func"() <{function_type = (tensor<2x4xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d1 : compressed, d0 : compressed) }>>, tensor<3x4xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d1 : compressed, d0 : dense) }>>, tensor<4x4xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : dense, d1 : compressed) }>>) -> tensor<9x4xf64>, sym_name = "concat_sparse_dense_perm"}> ({
  ^bb0(%arg8: tensor<2x4xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d1 : compressed, d0 : compressed) }>> loc("<stdin>":18:8), %arg9: tensor<3x4xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d1 : compressed, d0 : dense) }>> loc("<stdin>":18:41), %arg10: tensor<4x4xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : dense, d1 : compressed) }>> loc("<stdin>":18:75)):
    %22 = "sparse_tensor.concatenate"(%arg8, %arg9, %arg10) <{dimension = 0 : index}> : (tensor<2x4xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d1 : compressed, d0 : compressed) }>>, tensor<3x4xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d1 : compressed, d0 : dense) }>>, tensor<4x4xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : dense, d1 : compressed) }>>) -> tensor<9x4xf64> loc("<stdin>":19:11)
    "func.return"(%22) : (tensor<9x4xf64>) -> () loc("<stdin>":20:5)
  }) : () -> () loc("<stdin>":17:3)
  "func.func"() <{function_type = (tensor<2x4xf64>, tensor<3x4xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d1 : compressed, d0 : dense) }>>, tensor<4x4xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : dense, d1 : compressed) }>>) -> tensor<9x4xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed, d1 : compressed) }>>, sym_name = "concat_mix_sparse_perm"}> ({
  ^bb0(%arg5: tensor<2x4xf64> loc("<stdin>":23:8), %arg6: tensor<3x4xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d1 : compressed, d0 : dense) }>> loc("<stdin>":23:32), %arg7: tensor<4x4xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : dense, d1 : compressed) }>> loc("<stdin>":23:66)):
    %21 = "sparse_tensor.concatenate"(%arg5, %arg6, %arg7) <{dimension = 0 : index}> : (tensor<2x4xf64>, tensor<3x4xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d1 : compressed, d0 : dense) }>>, tensor<4x4xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : dense, d1 : compressed) }>>) -> tensor<9x4xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed, d1 : compressed) }>> loc("<stdin>":24:11)
    "func.return"(%21) : (tensor<9x4xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed, d1 : compressed) }>>) -> () loc("<stdin>":25:5)
  }) : () -> () loc("<stdin>":22:3)
  "func.func"() <{function_type = (tensor<2x4xf64>, tensor<3x4xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed, d1 : dense) }>>, tensor<4x4xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d1 : dense, d0 : compressed) }>>) -> tensor<9x4xf64>, sym_name = "concat_mix_dense_perm"}> ({
  ^bb0(%arg2: tensor<2x4xf64> loc("<stdin>":28:8), %arg3: tensor<3x4xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed, d1 : dense) }>> loc("<stdin>":28:32), %arg4: tensor<4x4xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d1 : dense, d0 : compressed) }>> loc("<stdin>":28:66)):
    %20 = "sparse_tensor.concatenate"(%arg2, %arg3, %arg4) <{dimension = 0 : index}> : (tensor<2x4xf64>, tensor<3x4xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed, d1 : dense) }>>, tensor<4x4xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d1 : dense, d0 : compressed) }>>) -> tensor<9x4xf64> loc("<stdin>":29:11)
    "func.return"(%20) : (tensor<9x4xf64>) -> () loc("<stdin>":30:5)
  }) : () -> () loc("<stdin>":27:3)
  "func.func"() <{function_type = (tensor<9x4xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed, d1 : compressed) }>>) -> (), sym_name = "dump_mat_9x4"}> ({
  ^bb0(%arg1: tensor<9x4xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed, d1 : compressed) }>> loc("<stdin>":33:8)):
    %16 = "sparse_tensor.convert"(%arg1) : (tensor<9x4xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed, d1 : compressed) }>>) -> tensor<9x4xf64> loc("<stdin>":34:11)
    %17 = "tensor.cast"(%16) : (tensor<9x4xf64>) -> tensor<*xf64> loc("<stdin>":35:11)
    "func.call"(%17) <{callee = @printMemrefF64}> : (tensor<*xf64>) -> () loc("<stdin>":36:5)
    %18 = "sparse_tensor.number_of_entries"(%arg1) : (tensor<9x4xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed, d1 : compressed) }>>) -> index loc("<stdin>":37:11)
    "vector.print"(%18) <{punctuation = #vector.punctuation<newline>}> : (index) -> () loc("<stdin>":38:5)
    %19 = "sparse_tensor.values"(%arg1) : (tensor<9x4xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed, d1 : compressed) }>>) -> memref<?xf64> loc("<stdin>":39:11)
    "func.call"(%19) <{callee = @printMemref1dF64}> : (memref<?xf64>) -> () loc("<stdin>":40:5)
    "func.return"() : () -> () loc("<stdin>":41:5)
  }) : () -> () loc("<stdin>":32:3)
  "func.func"() <{function_type = (tensor<9x4xf64>) -> (), sym_name = "dump_mat_dense_9x4"}> ({
  ^bb0(%arg0: tensor<9x4xf64> loc("<stdin>":44:8)):
    %15 = "tensor.cast"(%arg0) : (tensor<9x4xf64>) -> tensor<*xf64> loc("<stdin>":45:11)
    "func.call"(%15) <{callee = @printMemrefF64}> : (tensor<*xf64>) -> () loc("<stdin>":46:5)
    "func.return"() : () -> () loc("<stdin>":47:5)
  }) : () -> () loc("<stdin>":43:3)
  "func.func"() <{function_type = () -> (), sym_name = "main"}> ({
    %0 = "arith.constant"() <{value = dense<[[1.000000e+00, 0.000000e+00], [3.100000e+00, 0.000000e+00], [0.000000e+00, 2.000000e+00], [0.000000e+00, 0.000000e+00]]> : tensor<4x2xf64>}> : () -> tensor<4x2xf64> loc("<stdin>":50:10)
    %1 = "arith.constant"() <{value = dense<[[1.000000e+00, 0.000000e+00, 1.000000e+00], [1.000000e+00, 0.000000e+00, 5.000000e-01], [0.000000e+00, 0.000000e+00, 1.000000e+00], [5.000000e+00, 2.000000e+00, 0.000000e+00]]> : tensor<4x3xf64>}> : () -> tensor<4x3xf64> loc("<stdin>":51:10)
    %2 = "arith.constant"() <{value = dense<[[1.000000e+00, 0.000000e+00, 3.000000e+00, 0.000000e+00], [0.000000e+00, 2.000000e+00, 0.000000e+00, 0.000000e+00]]> : tensor<2x4xf64>}> : () -> tensor<2x4xf64> loc("<stdin>":52:10)
    %3 = "arith.constant"() <{value = dense<[[1.000000e+00, 0.000000e+00, 1.000000e+00, 1.000000e+00], [0.000000e+00, 5.000000e-01, 0.000000e+00, 0.000000e+00], [1.000000e+00, 5.000000e+00, 2.000000e+00, 0.000000e+00]]> : tensor<3x4xf64>}> : () -> tensor<3x4xf64> loc("<stdin>":53:10)
    %4 = "arith.constant"() <{value = dense<[[0.000000e+00, 0.000000e+00, 1.500000e+00, 1.000000e+00], [0.000000e+00, 3.500000e+00, 0.000000e+00, 0.000000e+00], [1.000000e+00, 5.000000e+00, 2.000000e+00, 0.000000e+00], [1.000000e+00, 5.000000e-01, 0.000000e+00, 0.000000e+00]]> : tensor<4x4xf64>}> : () -> tensor<4x4xf64> loc("<stdin>":54:10)
    %5 = "sparse_tensor.convert"(%2) : (tensor<2x4xf64>) -> tensor<2x4xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed, d1 : compressed) }>> loc("<stdin>":55:10)
    %6 = "sparse_tensor.convert"(%3) : (tensor<3x4xf64>) -> tensor<3x4xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed, d1 : dense) }>> loc("<stdin>":56:10)
    %7 = "sparse_tensor.convert"(%4) : (tensor<4x4xf64>) -> tensor<4x4xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : dense, d1 : compressed) }>> loc("<stdin>":57:10)
    %8 = "sparse_tensor.convert"(%2) : (tensor<2x4xf64>) -> tensor<2x4xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d1 : compressed, d0 : compressed) }>> loc("<stdin>":58:10)
    %9 = "sparse_tensor.convert"(%3) : (tensor<3x4xf64>) -> tensor<3x4xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d1 : compressed, d0 : dense) }>> loc("<stdin>":59:10)
    %10 = "sparse_tensor.convert"(%4) : (tensor<4x4xf64>) -> tensor<4x4xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d1 : dense, d0 : compressed) }>> loc("<stdin>":60:11)
    %11 = "func.call"(%8, %6, %7) <{callee = @concat_sparse_sparse_perm}> : (tensor<2x4xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d1 : compressed, d0 : compressed) }>>, tensor<3x4xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed, d1 : dense) }>>, tensor<4x4xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : dense, d1 : compressed) }>>) -> tensor<9x4xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d1 : compressed, d0 : compressed) }>> loc("<stdin>":61:11)
    "sparse_tensor.print"(%11) : (tensor<9x4xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d1 : compressed, d0 : compressed) }>>) -> () loc("<stdin>":62:5)
    %12 = "func.call"(%8, %9, %7) <{callee = @concat_sparse_dense_perm}> : (tensor<2x4xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d1 : compressed, d0 : compressed) }>>, tensor<3x4xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d1 : compressed, d0 : dense) }>>, tensor<4x4xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : dense, d1 : compressed) }>>) -> tensor<9x4xf64> loc("<stdin>":63:11)
    "func.call"(%12) <{callee = @dump_mat_dense_9x4}> : (tensor<9x4xf64>) -> () loc("<stdin>":64:5)
    %13 = "func.call"(%2, %9, %7) <{callee = @concat_mix_sparse_perm}> : (tensor<2x4xf64>, tensor<3x4xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d1 : compressed, d0 : dense) }>>, tensor<4x4xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : dense, d1 : compressed) }>>) -> tensor<9x4xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed, d1 : compressed) }>> loc("<stdin>":65:11)
    "sparse_tensor.print"(%13) : (tensor<9x4xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed, d1 : compressed) }>>) -> () loc("<stdin>":66:5)
    %14 = "func.call"(%2, %6, %10) <{callee = @concat_mix_dense_perm}> : (tensor<2x4xf64>, tensor<3x4xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed, d1 : dense) }>>, tensor<4x4xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d1 : dense, d0 : compressed) }>>) -> tensor<9x4xf64> loc("<stdin>":67:11)
    "func.call"(%14) <{callee = @dump_mat_dense_9x4}> : (tensor<9x4xf64>) -> () loc("<stdin>":68:5)
    "bufferization.dealloc_tensor"(%5) : (tensor<2x4xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed, d1 : compressed) }>>) -> () loc("<stdin>":69:5)
    "bufferization.dealloc_tensor"(%6) : (tensor<3x4xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed, d1 : dense) }>>) -> () loc("<stdin>":70:5)
    "bufferization.dealloc_tensor"(%7) : (tensor<4x4xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : dense, d1 : compressed) }>>) -> () loc("<stdin>":71:5)
    "bufferization.dealloc_tensor"(%8) : (tensor<2x4xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d1 : compressed, d0 : compressed) }>>) -> () loc("<stdin>":72:5)
    "bufferization.dealloc_tensor"(%9) : (tensor<3x4xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d1 : compressed, d0 : dense) }>>) -> () loc("<stdin>":73:5)
    "bufferization.dealloc_tensor"(%10) : (tensor<4x4xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d1 : dense, d0 : compressed) }>>) -> () loc("<stdin>":74:5)
    "bufferization.dealloc_tensor"(%11) : (tensor<9x4xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d1 : compressed, d0 : compressed) }>>) -> () loc("<stdin>":75:5)
    "bufferization.dealloc_tensor"(%12) : (tensor<9x4xf64>) -> () loc("<stdin>":76:5)
    "bufferization.dealloc_tensor"(%13) : (tensor<9x4xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed, d1 : compressed) }>>) -> () loc("<stdin>":77:5)
    "bufferization.dealloc_tensor"(%14) : (tensor<9x4xf64>) -> () loc("<stdin>":78:5)
    "func.return"() : () -> () loc("<stdin>":79:5)
  }) : () -> () loc("<stdin>":49:3)
}) : () -> () loc("<stdin>":7:1)
