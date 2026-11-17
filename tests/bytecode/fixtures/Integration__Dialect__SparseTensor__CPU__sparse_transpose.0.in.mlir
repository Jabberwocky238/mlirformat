"builtin.module"() ({
  "func.func"() <{function_type = (tensor<3x4xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed, d1 : compressed) }>>) -> tensor<4x3xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed, d1 : compressed) }>>, sym_name = "sparse_transpose"}> ({
  ^bb0(%arg3: tensor<3x4xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed, d1 : compressed) }>> loc("<stdin>":7:8)):
    %10 = "sparse_tensor.convert"(%arg3) : (tensor<3x4xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed, d1 : compressed) }>>) -> tensor<3x4xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d1 : compressed, d0 : compressed) }>> loc("<stdin>":8:11)
    %11 = "tensor.empty"() : () -> tensor<4x3xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed, d1 : compressed) }>> loc("<stdin>":9:11)
    %12 = "linalg.generic"(%10, %11) <{doc = "X(i,j) = A(j,i)", indexing_maps = [affine_map<(d0, d1) -> (d1, d0)>, affine_map<(d0, d1) -> (d0, d1)>], iterator_types = [#linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>], operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg4: f64 loc("<stdin>":11:10), %arg5: f64 loc("<stdin>":11:22)):
      "linalg.yield"(%arg4) : (f64) -> () loc("<stdin>":12:7)
    }) : (tensor<3x4xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d1 : compressed, d0 : compressed) }>>, tensor<4x3xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed, d1 : compressed) }>>) -> tensor<4x3xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed, d1 : compressed) }>> loc("<stdin>":10:11)
    "bufferization.dealloc_tensor"(%10) : (tensor<3x4xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d1 : compressed, d0 : compressed) }>>) -> () loc("<stdin>":14:5)
    "func.return"(%12) : (tensor<4x3xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed, d1 : compressed) }>>) -> () loc("<stdin>":15:5)
  }) : () -> () loc("<stdin>":6:3)
  "func.func"() <{function_type = (tensor<3x4xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed, d1 : compressed) }>>) -> tensor<4x3xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed, d1 : compressed) }>>, sym_name = "sparse_transpose_auto"}> ({
  ^bb0(%arg0: tensor<3x4xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed, d1 : compressed) }>> loc("<stdin>":18:8)):
    %8 = "tensor.empty"() : () -> tensor<4x3xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed, d1 : compressed) }>> loc("<stdin>":19:10)
    %9 = "linalg.generic"(%arg0, %8) <{doc = "X(i,j) = A(j,i)", indexing_maps = [affine_map<(d0, d1) -> (d1, d0)>, affine_map<(d0, d1) -> (d0, d1)>], iterator_types = [#linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>], operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg1: f64 loc("<stdin>":21:10), %arg2: f64 loc("<stdin>":21:22)):
      "linalg.yield"(%arg1) : (f64) -> () loc("<stdin>":22:7)
    }) : (tensor<3x4xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed, d1 : compressed) }>>, tensor<4x3xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed, d1 : compressed) }>>) -> tensor<4x3xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed, d1 : compressed) }>> loc("<stdin>":20:10)
    "func.return"(%9) : (tensor<4x3xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed, d1 : compressed) }>>) -> () loc("<stdin>":24:5)
  }) : () -> () loc("<stdin>":17:3)
  "func.func"() <{function_type = () -> (), sym_name = "main"}> ({
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index loc("<stdin>":27:10)
    %1 = "arith.constant"() <{value = 1 : index}> : () -> index loc("<stdin>":28:10)
    %2 = "arith.constant"() <{value = 4 : index}> : () -> index loc("<stdin>":29:10)
    %3 = "arith.constant"() <{value = 0.000000e+00 : f64}> : () -> f64 loc("<stdin>":30:10)
    %4 = "arith.constant"() <{value = dense<[[1.100000e+00, 1.200000e+00, 0.000000e+00, 1.400000e+00], [0.000000e+00, 0.000000e+00, 0.000000e+00, 0.000000e+00], [3.100000e+00, 0.000000e+00, 3.300000e+00, 3.400000e+00]]> : tensor<3x4xf64>}> : () -> tensor<3x4xf64> loc("<stdin>":31:10)
    %5 = "sparse_tensor.convert"(%4) : (tensor<3x4xf64>) -> tensor<3x4xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed, d1 : compressed) }>> loc("<stdin>":32:10)
    %6 = "func.call"(%5) <{callee = @sparse_transpose}> : (tensor<3x4xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed, d1 : compressed) }>>) -> tensor<4x3xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed, d1 : compressed) }>> loc("<stdin>":33:10)
    %7 = "func.call"(%5) <{callee = @sparse_transpose_auto}> : (tensor<3x4xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed, d1 : compressed) }>>) -> tensor<4x3xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed, d1 : compressed) }>> loc("<stdin>":34:10)
    "sparse_tensor.print"(%6) : (tensor<4x3xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed, d1 : compressed) }>>) -> () loc("<stdin>":35:5)
    "sparse_tensor.print"(%7) : (tensor<4x3xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed, d1 : compressed) }>>) -> () loc("<stdin>":36:5)
    "bufferization.dealloc_tensor"(%5) : (tensor<3x4xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed, d1 : compressed) }>>) -> () loc("<stdin>":37:5)
    "bufferization.dealloc_tensor"(%6) : (tensor<4x3xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed, d1 : compressed) }>>) -> () loc("<stdin>":38:5)
    "bufferization.dealloc_tensor"(%7) : (tensor<4x3xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed, d1 : compressed) }>>) -> () loc("<stdin>":39:5)
    "func.return"() : () -> () loc("<stdin>":40:5)
  }) : () -> () loc("<stdin>":26:3)
}) : () -> () loc("<stdin>":5:1)
