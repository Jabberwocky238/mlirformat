"builtin.module"() ({
  "func.func"() <{function_type = (tensor<3x4xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed, d1 : compressed) }>>) -> tensor<2x6xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed, d1 : compressed) }>>, sym_name = "reshape0"}> ({
  ^bb0(%arg2: tensor<3x4xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed, d1 : compressed) }>> loc("<stdin>":6:8)):
    %11 = "arith.constant"() <{value = dense<[2, 6]> : tensor<2xi32>}> : () -> tensor<2xi32> loc("<stdin>":7:11)
    %12 = "tensor.reshape"(%arg2, %11) : (tensor<3x4xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed, d1 : compressed) }>>, tensor<2xi32>) -> tensor<2x6xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed, d1 : compressed) }>> loc("<stdin>":8:11)
    "func.return"(%12) : (tensor<2x6xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed, d1 : compressed) }>>) -> () loc("<stdin>":9:5)
  }) : () -> () loc("<stdin>":5:3)
  "func.func"() <{function_type = (tensor<3x4xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed, d1 : compressed) }>>) -> tensor<12xf64, #sparse_tensor.encoding<{ map = (d0) -> (d0 : compressed) }>>, sym_name = "reshape1"}> ({
  ^bb0(%arg1: tensor<3x4xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed, d1 : compressed) }>> loc("<stdin>":12:8)):
    %9 = "arith.constant"() <{value = dense<12> : tensor<1xi32>}> : () -> tensor<1xi32> loc("<stdin>":13:10)
    %10 = "tensor.reshape"(%arg1, %9) : (tensor<3x4xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed, d1 : compressed) }>>, tensor<1xi32>) -> tensor<12xf64, #sparse_tensor.encoding<{ map = (d0) -> (d0 : compressed) }>> loc("<stdin>":14:11)
    "func.return"(%10) : (tensor<12xf64, #sparse_tensor.encoding<{ map = (d0) -> (d0 : compressed) }>>) -> () loc("<stdin>":15:5)
  }) : () -> () loc("<stdin>":11:3)
  "func.func"() <{function_type = (tensor<3x4xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed, d1 : compressed) }>>) -> tensor<2x3x2xf64, #sparse_tensor.encoding<{ map = (d0, d1, d2) -> (d0 : compressed, d1 : compressed, d2 : compressed) }>>, sym_name = "reshape2"}> ({
  ^bb0(%arg0: tensor<3x4xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed, d1 : compressed) }>> loc("<stdin>":18:8)):
    %7 = "arith.constant"() <{value = dense<[2, 3, 2]> : tensor<3xi32>}> : () -> tensor<3xi32> loc("<stdin>":19:10)
    %8 = "tensor.reshape"(%arg0, %7) : (tensor<3x4xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed, d1 : compressed) }>>, tensor<3xi32>) -> tensor<2x3x2xf64, #sparse_tensor.encoding<{ map = (d0, d1, d2) -> (d0 : compressed, d1 : compressed, d2 : compressed) }>> loc("<stdin>":20:10)
    "func.return"(%8) : (tensor<2x3x2xf64, #sparse_tensor.encoding<{ map = (d0, d1, d2) -> (d0 : compressed, d1 : compressed, d2 : compressed) }>>) -> () loc("<stdin>":21:5)
  }) : () -> () loc("<stdin>":17:3)
  "func.func"() <{function_type = () -> (), sym_name = "main"}> ({
    %0 = "arith.constant"() <{value = dense<[[1.100000e+00, 0.000000e+00, 1.300000e+00, 0.000000e+00], [2.100000e+00, 0.000000e+00, 2.300000e+00, 0.000000e+00], [3.100000e+00, 0.000000e+00, 3.300000e+00, 0.000000e+00]]> : tensor<3x4xf64>}> : () -> tensor<3x4xf64> loc("<stdin>":24:10)
    %1 = "sparse_tensor.convert"(%0) : (tensor<3x4xf64>) -> tensor<3x4xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed, d1 : compressed) }>> loc("<stdin>":25:10)
    %2 = "func.call"(%1) <{callee = @reshape0}> : (tensor<3x4xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed, d1 : compressed) }>>) -> tensor<2x6xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed, d1 : compressed) }>> loc("<stdin>":26:10)
    %3 = "func.call"(%1) <{callee = @reshape1}> : (tensor<3x4xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed, d1 : compressed) }>>) -> tensor<12xf64, #sparse_tensor.encoding<{ map = (d0) -> (d0 : compressed) }>> loc("<stdin>":27:10)
    %4 = "func.call"(%1) <{callee = @reshape2}> : (tensor<3x4xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed, d1 : compressed) }>>) -> tensor<2x3x2xf64, #sparse_tensor.encoding<{ map = (d0, d1, d2) -> (d0 : compressed, d1 : compressed, d2 : compressed) }>> loc("<stdin>":28:10)
    %5 = "arith.constant"() <{value = 0 : index}> : () -> index loc("<stdin>":29:10)
    %6 = "arith.constant"() <{value = -1.000000e+00 : f64}> : () -> f64 loc("<stdin>":30:10)
    "sparse_tensor.print"(%2) : (tensor<2x6xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed, d1 : compressed) }>>) -> () loc("<stdin>":31:5)
    "sparse_tensor.print"(%3) : (tensor<12xf64, #sparse_tensor.encoding<{ map = (d0) -> (d0 : compressed) }>>) -> () loc("<stdin>":32:5)
    "sparse_tensor.print"(%4) : (tensor<2x3x2xf64, #sparse_tensor.encoding<{ map = (d0, d1, d2) -> (d0 : compressed, d1 : compressed, d2 : compressed) }>>) -> () loc("<stdin>":33:5)
    "bufferization.dealloc_tensor"(%1) : (tensor<3x4xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed, d1 : compressed) }>>) -> () loc("<stdin>":34:5)
    "bufferization.dealloc_tensor"(%2) : (tensor<2x6xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed, d1 : compressed) }>>) -> () loc("<stdin>":35:5)
    "bufferization.dealloc_tensor"(%3) : (tensor<12xf64, #sparse_tensor.encoding<{ map = (d0) -> (d0 : compressed) }>>) -> () loc("<stdin>":36:5)
    "bufferization.dealloc_tensor"(%4) : (tensor<2x3x2xf64, #sparse_tensor.encoding<{ map = (d0, d1, d2) -> (d0 : compressed, d1 : compressed, d2 : compressed) }>>) -> () loc("<stdin>":37:5)
    "func.return"() : () -> () loc("<stdin>":38:5)
  }) : () -> () loc("<stdin>":23:3)
}) : () -> () loc("<stdin>":4:1)
