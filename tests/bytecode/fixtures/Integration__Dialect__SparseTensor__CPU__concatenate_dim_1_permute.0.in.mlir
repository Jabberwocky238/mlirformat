"builtin.module"() ({
  "func.func"() <{function_type = (tensor<*xf64>) -> (), sym_name = "printMemrefF64", sym_visibility = "private"}> ({
  }) : () -> () loc("<stdin>":8:3)
  "func.func"() <{function_type = (memref<?xf64>) -> (), sym_name = "printMemref1dF64", sym_visibility = "private"}> ({
  }) {llvm.emit_c_interface} : () -> () loc("<stdin>":10:3)
  "func.func"() <{function_type = (tensor<4x2xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d1 : compressed, d0 : compressed) }>>, tensor<4x3xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed, d1 : dense) }>>, tensor<4x4xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : dense, d1 : compressed) }>>) -> tensor<4x9xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d1 : compressed, d0 : compressed) }>>, sym_name = "concat_sparse_sparse_perm_dim1"}> ({
  ^bb0(%arg10: tensor<4x2xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d1 : compressed, d0 : compressed) }>> loc("<stdin>":13:8), %arg11: tensor<4x3xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed, d1 : dense) }>> loc("<stdin>":13:42), %arg12: tensor<4x4xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : dense, d1 : compressed) }>> loc("<stdin>":13:77)):
    %19 = "sparse_tensor.concatenate"(%arg10, %arg11, %arg12) <{dimension = 1 : index}> : (tensor<4x2xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d1 : compressed, d0 : compressed) }>>, tensor<4x3xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed, d1 : dense) }>>, tensor<4x4xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : dense, d1 : compressed) }>>) -> tensor<4x9xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d1 : compressed, d0 : compressed) }>> loc("<stdin>":14:11)
    "func.return"(%19) : (tensor<4x9xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d1 : compressed, d0 : compressed) }>>) -> () loc("<stdin>":15:5)
  }) : () -> () loc("<stdin>":12:3)
  "func.func"() <{function_type = (tensor<4x2xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d1 : compressed, d0 : compressed) }>>, tensor<4x3xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d1 : compressed, d0 : dense) }>>, tensor<4x4xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : dense, d1 : compressed) }>>) -> tensor<4x9xf64>, sym_name = "concat_sparse_dense_perm_dim1"}> ({
  ^bb0(%arg7: tensor<4x2xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d1 : compressed, d0 : compressed) }>> loc("<stdin>":18:8), %arg8: tensor<4x3xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d1 : compressed, d0 : dense) }>> loc("<stdin>":18:41), %arg9: tensor<4x4xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : dense, d1 : compressed) }>> loc("<stdin>":18:75)):
    %18 = "sparse_tensor.concatenate"(%arg7, %arg8, %arg9) <{dimension = 1 : index}> : (tensor<4x2xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d1 : compressed, d0 : compressed) }>>, tensor<4x3xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d1 : compressed, d0 : dense) }>>, tensor<4x4xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : dense, d1 : compressed) }>>) -> tensor<4x9xf64> loc("<stdin>":19:11)
    "func.return"(%18) : (tensor<4x9xf64>) -> () loc("<stdin>":20:5)
  }) : () -> () loc("<stdin>":17:3)
  "func.func"() <{function_type = (tensor<4x2xf64>, tensor<4x3xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d1 : compressed, d0 : dense) }>>, tensor<4x4xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : dense, d1 : compressed) }>>) -> tensor<4x9xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed, d1 : compressed) }>>, sym_name = "concat_mix_sparse_perm_dim1"}> ({
  ^bb0(%arg4: tensor<4x2xf64> loc("<stdin>":23:8), %arg5: tensor<4x3xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d1 : compressed, d0 : dense) }>> loc("<stdin>":23:32), %arg6: tensor<4x4xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : dense, d1 : compressed) }>> loc("<stdin>":23:66)):
    %17 = "sparse_tensor.concatenate"(%arg4, %arg5, %arg6) <{dimension = 1 : index}> : (tensor<4x2xf64>, tensor<4x3xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d1 : compressed, d0 : dense) }>>, tensor<4x4xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : dense, d1 : compressed) }>>) -> tensor<4x9xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed, d1 : compressed) }>> loc("<stdin>":24:11)
    "func.return"(%17) : (tensor<4x9xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed, d1 : compressed) }>>) -> () loc("<stdin>":25:5)
  }) : () -> () loc("<stdin>":22:3)
  "func.func"() <{function_type = (tensor<4x2xf64>, tensor<4x3xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed, d1 : dense) }>>, tensor<4x4xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d1 : dense, d0 : compressed) }>>) -> tensor<4x9xf64>, sym_name = "concat_mix_dense_perm_dim1"}> ({
  ^bb0(%arg1: tensor<4x2xf64> loc("<stdin>":28:8), %arg2: tensor<4x3xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed, d1 : dense) }>> loc("<stdin>":28:32), %arg3: tensor<4x4xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d1 : dense, d0 : compressed) }>> loc("<stdin>":28:66)):
    %16 = "sparse_tensor.concatenate"(%arg1, %arg2, %arg3) <{dimension = 1 : index}> : (tensor<4x2xf64>, tensor<4x3xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed, d1 : dense) }>>, tensor<4x4xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d1 : dense, d0 : compressed) }>>) -> tensor<4x9xf64> loc("<stdin>":29:11)
    "func.return"(%16) : (tensor<4x9xf64>) -> () loc("<stdin>":30:5)
  }) : () -> () loc("<stdin>":27:3)
  "func.func"() <{function_type = (tensor<4x9xf64>) -> (), sym_name = "dump_mat_dense_4x9"}> ({
  ^bb0(%arg0: tensor<4x9xf64> loc("<stdin>":33:8)):
    %15 = "tensor.cast"(%arg0) : (tensor<4x9xf64>) -> tensor<*xf64> loc("<stdin>":34:11)
    "func.call"(%15) <{callee = @printMemrefF64}> : (tensor<*xf64>) -> () loc("<stdin>":35:5)
    "func.return"() : () -> () loc("<stdin>":36:5)
  }) : () -> () loc("<stdin>":32:3)
  "func.func"() <{function_type = () -> (), sym_name = "main"}> ({
    %0 = "arith.constant"() <{value = dense<[[1.000000e+00, 0.000000e+00], [3.100000e+00, 0.000000e+00], [0.000000e+00, 2.000000e+00], [0.000000e+00, 0.000000e+00]]> : tensor<4x2xf64>}> : () -> tensor<4x2xf64> loc("<stdin>":39:10)
    %1 = "arith.constant"() <{value = dense<[[1.000000e+00, 0.000000e+00, 1.000000e+00], [1.000000e+00, 0.000000e+00, 5.000000e-01], [0.000000e+00, 0.000000e+00, 1.000000e+00], [5.000000e+00, 2.000000e+00, 0.000000e+00]]> : tensor<4x3xf64>}> : () -> tensor<4x3xf64> loc("<stdin>":40:10)
    %2 = "arith.constant"() <{value = dense<[[1.000000e+00, 0.000000e+00, 3.000000e+00, 0.000000e+00], [0.000000e+00, 2.000000e+00, 0.000000e+00, 0.000000e+00]]> : tensor<2x4xf64>}> : () -> tensor<2x4xf64> loc("<stdin>":41:10)
    %3 = "arith.constant"() <{value = dense<[[1.000000e+00, 0.000000e+00, 1.000000e+00, 1.000000e+00], [0.000000e+00, 5.000000e-01, 0.000000e+00, 0.000000e+00], [1.000000e+00, 5.000000e+00, 2.000000e+00, 0.000000e+00]]> : tensor<3x4xf64>}> : () -> tensor<3x4xf64> loc("<stdin>":42:10)
    %4 = "arith.constant"() <{value = dense<[[0.000000e+00, 0.000000e+00, 1.500000e+00, 1.000000e+00], [0.000000e+00, 3.500000e+00, 0.000000e+00, 0.000000e+00], [1.000000e+00, 5.000000e+00, 2.000000e+00, 0.000000e+00], [1.000000e+00, 5.000000e-01, 0.000000e+00, 0.000000e+00]]> : tensor<4x4xf64>}> : () -> tensor<4x4xf64> loc("<stdin>":43:10)
    %5 = "sparse_tensor.convert"(%0) : (tensor<4x2xf64>) -> tensor<4x2xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed, d1 : compressed) }>> loc("<stdin>":44:10)
    %6 = "sparse_tensor.convert"(%1) : (tensor<4x3xf64>) -> tensor<4x3xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed, d1 : dense) }>> loc("<stdin>":45:10)
    %7 = "sparse_tensor.convert"(%4) : (tensor<4x4xf64>) -> tensor<4x4xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : dense, d1 : compressed) }>> loc("<stdin>":46:10)
    %8 = "sparse_tensor.convert"(%0) : (tensor<4x2xf64>) -> tensor<4x2xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d1 : compressed, d0 : compressed) }>> loc("<stdin>":47:10)
    %9 = "sparse_tensor.convert"(%1) : (tensor<4x3xf64>) -> tensor<4x3xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d1 : compressed, d0 : dense) }>> loc("<stdin>":48:10)
    %10 = "sparse_tensor.convert"(%4) : (tensor<4x4xf64>) -> tensor<4x4xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d1 : dense, d0 : compressed) }>> loc("<stdin>":49:11)
    %11 = "func.call"(%8, %6, %7) <{callee = @concat_sparse_sparse_perm_dim1}> : (tensor<4x2xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d1 : compressed, d0 : compressed) }>>, tensor<4x3xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed, d1 : dense) }>>, tensor<4x4xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : dense, d1 : compressed) }>>) -> tensor<4x9xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d1 : compressed, d0 : compressed) }>> loc("<stdin>":50:11)
    "sparse_tensor.print"(%11) : (tensor<4x9xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d1 : compressed, d0 : compressed) }>>) -> () loc("<stdin>":51:5)
    %12 = "func.call"(%8, %9, %7) <{callee = @concat_sparse_dense_perm_dim1}> : (tensor<4x2xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d1 : compressed, d0 : compressed) }>>, tensor<4x3xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d1 : compressed, d0 : dense) }>>, tensor<4x4xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : dense, d1 : compressed) }>>) -> tensor<4x9xf64> loc("<stdin>":52:11)
    "func.call"(%12) <{callee = @dump_mat_dense_4x9}> : (tensor<4x9xf64>) -> () loc("<stdin>":53:5)
    %13 = "func.call"(%0, %9, %7) <{callee = @concat_mix_sparse_perm_dim1}> : (tensor<4x2xf64>, tensor<4x3xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d1 : compressed, d0 : dense) }>>, tensor<4x4xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : dense, d1 : compressed) }>>) -> tensor<4x9xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed, d1 : compressed) }>> loc("<stdin>":54:11)
    "sparse_tensor.print"(%13) : (tensor<4x9xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed, d1 : compressed) }>>) -> () loc("<stdin>":55:5)
    %14 = "func.call"(%0, %6, %10) <{callee = @concat_mix_dense_perm_dim1}> : (tensor<4x2xf64>, tensor<4x3xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed, d1 : dense) }>>, tensor<4x4xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d1 : dense, d0 : compressed) }>>) -> tensor<4x9xf64> loc("<stdin>":56:11)
    "func.call"(%14) <{callee = @dump_mat_dense_4x9}> : (tensor<4x9xf64>) -> () loc("<stdin>":57:5)
    "bufferization.dealloc_tensor"(%5) : (tensor<4x2xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed, d1 : compressed) }>>) -> () loc("<stdin>":58:5)
    "bufferization.dealloc_tensor"(%6) : (tensor<4x3xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed, d1 : dense) }>>) -> () loc("<stdin>":59:5)
    "bufferization.dealloc_tensor"(%7) : (tensor<4x4xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : dense, d1 : compressed) }>>) -> () loc("<stdin>":60:5)
    "bufferization.dealloc_tensor"(%8) : (tensor<4x2xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d1 : compressed, d0 : compressed) }>>) -> () loc("<stdin>":61:5)
    "bufferization.dealloc_tensor"(%9) : (tensor<4x3xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d1 : compressed, d0 : dense) }>>) -> () loc("<stdin>":62:5)
    "bufferization.dealloc_tensor"(%10) : (tensor<4x4xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d1 : dense, d0 : compressed) }>>) -> () loc("<stdin>":63:5)
    "bufferization.dealloc_tensor"(%11) : (tensor<4x9xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d1 : compressed, d0 : compressed) }>>) -> () loc("<stdin>":64:5)
    "bufferization.dealloc_tensor"(%12) : (tensor<4x9xf64>) -> () loc("<stdin>":65:5)
    "bufferization.dealloc_tensor"(%13) : (tensor<4x9xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed, d1 : compressed) }>>) -> () loc("<stdin>":66:5)
    "bufferization.dealloc_tensor"(%14) : (tensor<4x9xf64>) -> () loc("<stdin>":67:5)
    "func.return"() : () -> () loc("<stdin>":68:5)
  }) : () -> () loc("<stdin>":38:3)
}) : () -> () loc("<stdin>":7:1)
