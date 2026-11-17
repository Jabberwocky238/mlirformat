"builtin.module"() ({
  "func.func"() <{function_type = (tensor<*xf64>) -> (), sym_name = "printMemrefF64", sym_visibility = "private"}> ({
  }) : () -> () loc("<stdin>":5:3)
  "func.func"() <{function_type = (tensor<2x4xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed, d1 : compressed) }>>, tensor<3x4xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed, d1 : dense) }>>, tensor<4x4xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : dense, d1 : compressed) }>>) -> tensor<9x4xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed, d1 : compressed) }>>, sym_name = "concat_sparse_sparse"}> ({
  ^bb0(%arg10: tensor<2x4xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed, d1 : compressed) }>> loc("<stdin>":8:8), %arg11: tensor<3x4xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed, d1 : dense) }>> loc("<stdin>":8:42), %arg12: tensor<4x4xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : dense, d1 : compressed) }>> loc("<stdin>":8:77)):
    %14 = "sparse_tensor.concatenate"(%arg10, %arg11, %arg12) <{dimension = 0 : index}> : (tensor<2x4xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed, d1 : compressed) }>>, tensor<3x4xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed, d1 : dense) }>>, tensor<4x4xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : dense, d1 : compressed) }>>) -> tensor<9x4xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed, d1 : compressed) }>> loc("<stdin>":9:11)
    "func.return"(%14) : (tensor<9x4xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed, d1 : compressed) }>>) -> () loc("<stdin>":10:5)
  }) : () -> () loc("<stdin>":7:3)
  "func.func"() <{function_type = (tensor<2x4xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed, d1 : compressed) }>>, tensor<3x4xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed, d1 : dense) }>>, tensor<4x4xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : dense, d1 : compressed) }>>) -> tensor<9x4xf64>, sym_name = "concat_sparse_dense"}> ({
  ^bb0(%arg7: tensor<2x4xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed, d1 : compressed) }>> loc("<stdin>":13:8), %arg8: tensor<3x4xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed, d1 : dense) }>> loc("<stdin>":13:41), %arg9: tensor<4x4xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : dense, d1 : compressed) }>> loc("<stdin>":13:75)):
    %13 = "sparse_tensor.concatenate"(%arg7, %arg8, %arg9) <{dimension = 0 : index}> : (tensor<2x4xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed, d1 : compressed) }>>, tensor<3x4xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed, d1 : dense) }>>, tensor<4x4xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : dense, d1 : compressed) }>>) -> tensor<9x4xf64> loc("<stdin>":14:11)
    "func.return"(%13) : (tensor<9x4xf64>) -> () loc("<stdin>":15:5)
  }) : () -> () loc("<stdin>":12:3)
  "func.func"() <{function_type = (tensor<2x4xf64>, tensor<3x4xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed, d1 : dense) }>>, tensor<4x4xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : dense, d1 : compressed) }>>) -> tensor<9x4xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed, d1 : compressed) }>>, sym_name = "concat_mix_sparse"}> ({
  ^bb0(%arg4: tensor<2x4xf64> loc("<stdin>":18:8), %arg5: tensor<3x4xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed, d1 : dense) }>> loc("<stdin>":18:32), %arg6: tensor<4x4xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : dense, d1 : compressed) }>> loc("<stdin>":18:66)):
    %12 = "sparse_tensor.concatenate"(%arg4, %arg5, %arg6) <{dimension = 0 : index}> : (tensor<2x4xf64>, tensor<3x4xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed, d1 : dense) }>>, tensor<4x4xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : dense, d1 : compressed) }>>) -> tensor<9x4xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed, d1 : compressed) }>> loc("<stdin>":19:11)
    "func.return"(%12) : (tensor<9x4xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed, d1 : compressed) }>>) -> () loc("<stdin>":20:5)
  }) : () -> () loc("<stdin>":17:3)
  "func.func"() <{function_type = (tensor<2x4xf64>, tensor<3x4xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed, d1 : dense) }>>, tensor<4x4xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : dense, d1 : compressed) }>>) -> tensor<9x4xf64>, sym_name = "concat_mix_dense"}> ({
  ^bb0(%arg1: tensor<2x4xf64> loc("<stdin>":23:8), %arg2: tensor<3x4xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed, d1 : dense) }>> loc("<stdin>":23:32), %arg3: tensor<4x4xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : dense, d1 : compressed) }>> loc("<stdin>":23:66)):
    %11 = "sparse_tensor.concatenate"(%arg1, %arg2, %arg3) <{dimension = 0 : index}> : (tensor<2x4xf64>, tensor<3x4xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed, d1 : dense) }>>, tensor<4x4xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : dense, d1 : compressed) }>>) -> tensor<9x4xf64> loc("<stdin>":24:11)
    "func.return"(%11) : (tensor<9x4xf64>) -> () loc("<stdin>":25:5)
  }) : () -> () loc("<stdin>":22:3)
  "func.func"() <{function_type = (tensor<9x4xf64>) -> (), sym_name = "dump_mat_dense_9x4"}> ({
  ^bb0(%arg0: tensor<9x4xf64> loc("<stdin>":28:8)):
    %10 = "tensor.cast"(%arg0) : (tensor<9x4xf64>) -> tensor<*xf64> loc("<stdin>":29:11)
    "func.call"(%10) <{callee = @printMemrefF64}> : (tensor<*xf64>) -> () loc("<stdin>":30:5)
    "func.return"() : () -> () loc("<stdin>":31:5)
  }) : () -> () loc("<stdin>":27:3)
  "func.func"() <{function_type = () -> (), sym_name = "main"}> ({
    %0 = "arith.constant"() <{value = dense<[[1.000000e+00, 0.000000e+00, 3.000000e+00, 0.000000e+00], [0.000000e+00, 2.000000e+00, 0.000000e+00, 0.000000e+00]]> : tensor<2x4xf64>}> : () -> tensor<2x4xf64> loc("<stdin>":34:10)
    %1 = "arith.constant"() <{value = dense<[[1.000000e+00, 0.000000e+00, 1.000000e+00, 1.000000e+00], [0.000000e+00, 5.000000e-01, 0.000000e+00, 0.000000e+00], [1.000000e+00, 5.000000e+00, 2.000000e+00, 0.000000e+00]]> : tensor<3x4xf64>}> : () -> tensor<3x4xf64> loc("<stdin>":35:10)
    %2 = "arith.constant"() <{value = dense<[[0.000000e+00, 0.000000e+00, 1.500000e+00, 1.000000e+00], [0.000000e+00, 3.500000e+00, 0.000000e+00, 0.000000e+00], [1.000000e+00, 5.000000e+00, 2.000000e+00, 0.000000e+00], [1.000000e+00, 5.000000e-01, 0.000000e+00, 0.000000e+00]]> : tensor<4x4xf64>}> : () -> tensor<4x4xf64> loc("<stdin>":36:10)
    %3 = "sparse_tensor.convert"(%0) : (tensor<2x4xf64>) -> tensor<2x4xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed, d1 : compressed) }>> loc("<stdin>":37:10)
    %4 = "sparse_tensor.convert"(%1) : (tensor<3x4xf64>) -> tensor<3x4xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed, d1 : dense) }>> loc("<stdin>":38:10)
    %5 = "sparse_tensor.convert"(%2) : (tensor<4x4xf64>) -> tensor<4x4xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : dense, d1 : compressed) }>> loc("<stdin>":39:10)
    %6 = "func.call"(%3, %4, %5) <{callee = @concat_sparse_sparse}> : (tensor<2x4xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed, d1 : compressed) }>>, tensor<3x4xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed, d1 : dense) }>>, tensor<4x4xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : dense, d1 : compressed) }>>) -> tensor<9x4xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed, d1 : compressed) }>> loc("<stdin>":40:10)
    "sparse_tensor.print"(%6) : (tensor<9x4xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed, d1 : compressed) }>>) -> () loc("<stdin>":41:5)
    %7 = "func.call"(%3, %4, %5) <{callee = @concat_sparse_dense}> : (tensor<2x4xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed, d1 : compressed) }>>, tensor<3x4xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed, d1 : dense) }>>, tensor<4x4xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : dense, d1 : compressed) }>>) -> tensor<9x4xf64> loc("<stdin>":42:10)
    "func.call"(%7) <{callee = @dump_mat_dense_9x4}> : (tensor<9x4xf64>) -> () loc("<stdin>":43:5)
    %8 = "func.call"(%0, %4, %5) <{callee = @concat_mix_sparse}> : (tensor<2x4xf64>, tensor<3x4xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed, d1 : dense) }>>, tensor<4x4xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : dense, d1 : compressed) }>>) -> tensor<9x4xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed, d1 : compressed) }>> loc("<stdin>":44:10)
    "sparse_tensor.print"(%8) : (tensor<9x4xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed, d1 : compressed) }>>) -> () loc("<stdin>":45:5)
    %9 = "func.call"(%0, %4, %5) <{callee = @concat_mix_dense}> : (tensor<2x4xf64>, tensor<3x4xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed, d1 : dense) }>>, tensor<4x4xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : dense, d1 : compressed) }>>) -> tensor<9x4xf64> loc("<stdin>":46:10)
    "func.call"(%9) <{callee = @dump_mat_dense_9x4}> : (tensor<9x4xf64>) -> () loc("<stdin>":47:5)
    "bufferization.dealloc_tensor"(%3) : (tensor<2x4xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed, d1 : compressed) }>>) -> () loc("<stdin>":48:5)
    "bufferization.dealloc_tensor"(%4) : (tensor<3x4xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed, d1 : dense) }>>) -> () loc("<stdin>":49:5)
    "bufferization.dealloc_tensor"(%5) : (tensor<4x4xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : dense, d1 : compressed) }>>) -> () loc("<stdin>":50:5)
    "bufferization.dealloc_tensor"(%6) : (tensor<9x4xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed, d1 : compressed) }>>) -> () loc("<stdin>":51:5)
    "bufferization.dealloc_tensor"(%7) : (tensor<9x4xf64>) -> () loc("<stdin>":52:5)
    "bufferization.dealloc_tensor"(%8) : (tensor<9x4xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed, d1 : compressed) }>>) -> () loc("<stdin>":53:5)
    "bufferization.dealloc_tensor"(%9) : (tensor<9x4xf64>) -> () loc("<stdin>":54:5)
    "func.return"() : () -> () loc("<stdin>":55:5)
  }) : () -> () loc("<stdin>":33:3)
}) : () -> () loc("<stdin>":4:1)
