"builtin.module"() ({
  "func.func"() <{function_type = (tensor<*xf64>) -> (), sym_name = "printMemrefF64", sym_visibility = "private"}> ({
  }) : () -> () loc("<stdin>":5:3)
  "func.func"() <{function_type = (memref<?xf64>) -> (), sym_name = "printMemref1dF64", sym_visibility = "private"}> ({
  }) {llvm.emit_c_interface} : () -> () loc("<stdin>":7:3)
  "func.func"() <{function_type = (tensor<4x2xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed, d1 : compressed) }>>, tensor<4x3xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed, d1 : dense) }>>, tensor<4x4xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : dense, d1 : compressed) }>>) -> tensor<4x9xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed, d1 : compressed) }>>, sym_name = "concat_sparse_sparse_dim1"}> ({
  ^bb0(%arg10: tensor<4x2xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed, d1 : compressed) }>> loc("<stdin>":10:8), %arg11: tensor<4x3xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed, d1 : dense) }>> loc("<stdin>":10:42), %arg12: tensor<4x4xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : dense, d1 : compressed) }>> loc("<stdin>":10:77)):
    %14 = "sparse_tensor.concatenate"(%arg10, %arg11, %arg12) <{dimension = 1 : index}> : (tensor<4x2xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed, d1 : compressed) }>>, tensor<4x3xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed, d1 : dense) }>>, tensor<4x4xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : dense, d1 : compressed) }>>) -> tensor<4x9xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed, d1 : compressed) }>> loc("<stdin>":11:11)
    "func.return"(%14) : (tensor<4x9xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed, d1 : compressed) }>>) -> () loc("<stdin>":12:5)
  }) : () -> () loc("<stdin>":9:3)
  "func.func"() <{function_type = (tensor<4x2xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed, d1 : compressed) }>>, tensor<4x3xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed, d1 : dense) }>>, tensor<4x4xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : dense, d1 : compressed) }>>) -> tensor<4x9xf64>, sym_name = "concat_sparse_dense_dim1"}> ({
  ^bb0(%arg7: tensor<4x2xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed, d1 : compressed) }>> loc("<stdin>":15:8), %arg8: tensor<4x3xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed, d1 : dense) }>> loc("<stdin>":15:41), %arg9: tensor<4x4xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : dense, d1 : compressed) }>> loc("<stdin>":15:75)):
    %13 = "sparse_tensor.concatenate"(%arg7, %arg8, %arg9) <{dimension = 1 : index}> : (tensor<4x2xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed, d1 : compressed) }>>, tensor<4x3xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed, d1 : dense) }>>, tensor<4x4xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : dense, d1 : compressed) }>>) -> tensor<4x9xf64> loc("<stdin>":16:11)
    "func.return"(%13) : (tensor<4x9xf64>) -> () loc("<stdin>":17:5)
  }) : () -> () loc("<stdin>":14:3)
  "func.func"() <{function_type = (tensor<4x2xf64>, tensor<4x3xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed, d1 : dense) }>>, tensor<4x4xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : dense, d1 : compressed) }>>) -> tensor<4x9xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed, d1 : compressed) }>>, sym_name = "concat_mix_sparse_dim1"}> ({
  ^bb0(%arg4: tensor<4x2xf64> loc("<stdin>":20:8), %arg5: tensor<4x3xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed, d1 : dense) }>> loc("<stdin>":20:32), %arg6: tensor<4x4xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : dense, d1 : compressed) }>> loc("<stdin>":20:66)):
    %12 = "sparse_tensor.concatenate"(%arg4, %arg5, %arg6) <{dimension = 1 : index}> : (tensor<4x2xf64>, tensor<4x3xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed, d1 : dense) }>>, tensor<4x4xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : dense, d1 : compressed) }>>) -> tensor<4x9xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed, d1 : compressed) }>> loc("<stdin>":21:11)
    "func.return"(%12) : (tensor<4x9xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed, d1 : compressed) }>>) -> () loc("<stdin>":22:5)
  }) : () -> () loc("<stdin>":19:3)
  "func.func"() <{function_type = (tensor<4x2xf64>, tensor<4x3xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed, d1 : dense) }>>, tensor<4x4xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : dense, d1 : compressed) }>>) -> tensor<4x9xf64>, sym_name = "concat_mix_dense_dim1"}> ({
  ^bb0(%arg1: tensor<4x2xf64> loc("<stdin>":25:8), %arg2: tensor<4x3xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed, d1 : dense) }>> loc("<stdin>":25:32), %arg3: tensor<4x4xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : dense, d1 : compressed) }>> loc("<stdin>":25:66)):
    %11 = "sparse_tensor.concatenate"(%arg1, %arg2, %arg3) <{dimension = 1 : index}> : (tensor<4x2xf64>, tensor<4x3xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed, d1 : dense) }>>, tensor<4x4xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : dense, d1 : compressed) }>>) -> tensor<4x9xf64> loc("<stdin>":26:11)
    "func.return"(%11) : (tensor<4x9xf64>) -> () loc("<stdin>":27:5)
  }) : () -> () loc("<stdin>":24:3)
  "func.func"() <{function_type = (tensor<4x9xf64>) -> (), sym_name = "dump_mat_dense_4x9"}> ({
  ^bb0(%arg0: tensor<4x9xf64> loc("<stdin>":30:8)):
    %10 = "tensor.cast"(%arg0) : (tensor<4x9xf64>) -> tensor<*xf64> loc("<stdin>":31:11)
    "func.call"(%10) <{callee = @printMemrefF64}> : (tensor<*xf64>) -> () loc("<stdin>":32:5)
    "func.return"() : () -> () loc("<stdin>":33:5)
  }) : () -> () loc("<stdin>":29:3)
  "func.func"() <{function_type = () -> (), sym_name = "main"}> ({
    %0 = "arith.constant"() <{value = dense<[[1.000000e+00, 0.000000e+00], [3.100000e+00, 0.000000e+00], [0.000000e+00, 2.000000e+00], [0.000000e+00, 0.000000e+00]]> : tensor<4x2xf64>}> : () -> tensor<4x2xf64> loc("<stdin>":36:10)
    %1 = "arith.constant"() <{value = dense<[[1.000000e+00, 0.000000e+00, 1.000000e+00], [1.000000e+00, 0.000000e+00, 5.000000e-01], [0.000000e+00, 0.000000e+00, 1.000000e+00], [5.000000e+00, 2.000000e+00, 0.000000e+00]]> : tensor<4x3xf64>}> : () -> tensor<4x3xf64> loc("<stdin>":37:10)
    %2 = "arith.constant"() <{value = dense<[[0.000000e+00, 0.000000e+00, 1.500000e+00, 1.000000e+00], [0.000000e+00, 3.500000e+00, 0.000000e+00, 0.000000e+00], [1.000000e+00, 5.000000e+00, 2.000000e+00, 0.000000e+00], [1.000000e+00, 5.000000e-01, 0.000000e+00, 0.000000e+00]]> : tensor<4x4xf64>}> : () -> tensor<4x4xf64> loc("<stdin>":38:10)
    %3 = "sparse_tensor.convert"(%0) : (tensor<4x2xf64>) -> tensor<4x2xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed, d1 : compressed) }>> loc("<stdin>":39:10)
    %4 = "sparse_tensor.convert"(%1) : (tensor<4x3xf64>) -> tensor<4x3xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed, d1 : dense) }>> loc("<stdin>":40:10)
    %5 = "sparse_tensor.convert"(%2) : (tensor<4x4xf64>) -> tensor<4x4xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : dense, d1 : compressed) }>> loc("<stdin>":41:10)
    %6 = "func.call"(%3, %4, %5) <{callee = @concat_sparse_sparse_dim1}> : (tensor<4x2xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed, d1 : compressed) }>>, tensor<4x3xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed, d1 : dense) }>>, tensor<4x4xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : dense, d1 : compressed) }>>) -> tensor<4x9xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed, d1 : compressed) }>> loc("<stdin>":42:10)
    "sparse_tensor.print"(%6) : (tensor<4x9xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed, d1 : compressed) }>>) -> () loc("<stdin>":43:5)
    %7 = "func.call"(%3, %4, %5) <{callee = @concat_sparse_dense_dim1}> : (tensor<4x2xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed, d1 : compressed) }>>, tensor<4x3xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed, d1 : dense) }>>, tensor<4x4xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : dense, d1 : compressed) }>>) -> tensor<4x9xf64> loc("<stdin>":44:10)
    "func.call"(%7) <{callee = @dump_mat_dense_4x9}> : (tensor<4x9xf64>) -> () loc("<stdin>":45:5)
    %8 = "func.call"(%0, %4, %5) <{callee = @concat_mix_sparse_dim1}> : (tensor<4x2xf64>, tensor<4x3xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed, d1 : dense) }>>, tensor<4x4xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : dense, d1 : compressed) }>>) -> tensor<4x9xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed, d1 : compressed) }>> loc("<stdin>":46:10)
    "sparse_tensor.print"(%8) : (tensor<4x9xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed, d1 : compressed) }>>) -> () loc("<stdin>":47:5)
    %9 = "func.call"(%0, %4, %5) <{callee = @concat_mix_dense_dim1}> : (tensor<4x2xf64>, tensor<4x3xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed, d1 : dense) }>>, tensor<4x4xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : dense, d1 : compressed) }>>) -> tensor<4x9xf64> loc("<stdin>":48:10)
    "func.call"(%9) <{callee = @dump_mat_dense_4x9}> : (tensor<4x9xf64>) -> () loc("<stdin>":49:5)
    "bufferization.dealloc_tensor"(%3) : (tensor<4x2xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed, d1 : compressed) }>>) -> () loc("<stdin>":50:5)
    "bufferization.dealloc_tensor"(%4) : (tensor<4x3xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed, d1 : dense) }>>) -> () loc("<stdin>":51:5)
    "bufferization.dealloc_tensor"(%5) : (tensor<4x4xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : dense, d1 : compressed) }>>) -> () loc("<stdin>":52:5)
    "bufferization.dealloc_tensor"(%6) : (tensor<4x9xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed, d1 : compressed) }>>) -> () loc("<stdin>":53:5)
    "bufferization.dealloc_tensor"(%7) : (tensor<4x9xf64>) -> () loc("<stdin>":54:5)
    "bufferization.dealloc_tensor"(%8) : (tensor<4x9xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed, d1 : compressed) }>>) -> () loc("<stdin>":55:5)
    "bufferization.dealloc_tensor"(%9) : (tensor<4x9xf64>) -> () loc("<stdin>":56:5)
    "func.return"() : () -> () loc("<stdin>":57:5)
  }) : () -> () loc("<stdin>":35:3)
}) : () -> () loc("<stdin>":4:1)
