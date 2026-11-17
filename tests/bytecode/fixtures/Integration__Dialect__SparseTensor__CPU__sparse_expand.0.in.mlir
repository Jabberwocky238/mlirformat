"builtin.module"() ({
  "func.func"() <{function_type = (tensor<8x2xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d1 : dense, d0 : compressed) }>>, tensor<2x4xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d1 : dense, d0 : compressed) }>>) -> tensor<8x4xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d1 : dense, d0 : compressed) }>>, sym_name = "matmul"}> ({
  ^bb0(%arg0: tensor<8x2xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d1 : dense, d0 : compressed) }>> loc("<stdin>":7:8), %arg1: tensor<2x4xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d1 : dense, d0 : compressed) }>> loc("<stdin>":7:41)):
    %7 = "tensor.empty"() : () -> tensor<8x4xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d1 : dense, d0 : compressed) }>> loc("<stdin>":8:10)
    %8 = "linalg.matmul"(%arg0, %arg1, %7) <{indexing_maps = [affine_map<(d0, d1, d2) -> (d0, d2)>, affine_map<(d0, d1, d2) -> (d2, d1)>, affine_map<(d0, d1, d2) -> (d0, d1)>], operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg2: f64 loc("<stdin>":10:10), %arg3: f64 loc("<stdin>":10:22), %arg4: f64 loc("<stdin>":10:34)):
      %9 = "arith.mulf"(%arg2, %arg3) <{fastmath = #arith.fastmath<none>}> : (f64, f64) -> f64 loc("<stdin>":11:12)
      %10 = "arith.addf"(%arg4, %9) <{fastmath = #arith.fastmath<none>}> : (f64, f64) -> f64 loc("<stdin>":12:13)
      "linalg.yield"(%10) : (f64) -> () loc("<stdin>":13:7)
    }) : (tensor<8x2xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d1 : dense, d0 : compressed) }>>, tensor<2x4xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d1 : dense, d0 : compressed) }>>, tensor<8x4xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d1 : dense, d0 : compressed) }>>) -> tensor<8x4xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d1 : dense, d0 : compressed) }>> loc("<stdin>":9:10)
    "func.return"(%8) : (tensor<8x4xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d1 : dense, d0 : compressed) }>>) -> () loc("<stdin>":15:5)
  }) : () -> () loc("<stdin>":6:3)
  "func.func"() <{function_type = () -> (), sym_name = "main"}> ({
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index loc("<stdin>":18:10)
    %1 = "arith.constant"() <{value = -1.000000e+00 : f64}> : () -> f64 loc("<stdin>":19:10)
    %2 = "arith.constant"() <{value = dense<[[1.100000e+00, 2.100000e+00], [1.200000e+00, 2.200000e+00], [1.300000e+00, 2.300000e+00], [1.400000e+00, 2.400000e+00], [1.500000e+00, 2.500000e+00], [1.600000e+00, 2.600000e+00], [1.700000e+00, 2.700000e+00], [1.800000e+00, 2.800000e+00]]> : tensor<8x2xf64>}> : () -> tensor<8x2xf64> loc("<stdin>":20:10)
    %3 = "arith.constant"() <{value = dense<[[1.010000e+01, 1.110000e+01, 1.210000e+01, 1.310000e+01], [1.020000e+01, 1.120000e+01, 1.220000e+01, 1.320000e+01]]> : tensor<2x4xf64>}> : () -> tensor<2x4xf64> loc("<stdin>":21:10)
    %4 = "sparse_tensor.convert"(%2) : (tensor<8x2xf64>) -> tensor<8x2xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d1 : dense, d0 : compressed) }>> loc("<stdin>":22:10)
    %5 = "sparse_tensor.convert"(%3) : (tensor<2x4xf64>) -> tensor<2x4xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d1 : dense, d0 : compressed) }>> loc("<stdin>":23:10)
    %6 = "func.call"(%4, %5) <{callee = @matmul}> : (tensor<8x2xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d1 : dense, d0 : compressed) }>>, tensor<2x4xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d1 : dense, d0 : compressed) }>>) -> tensor<8x4xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d1 : dense, d0 : compressed) }>> loc("<stdin>":24:10)
    "sparse_tensor.print"(%6) : (tensor<8x4xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d1 : dense, d0 : compressed) }>>) -> () loc("<stdin>":25:5)
    "bufferization.dealloc_tensor"(%4) : (tensor<8x2xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d1 : dense, d0 : compressed) }>>) -> () loc("<stdin>":26:5)
    "bufferization.dealloc_tensor"(%5) : (tensor<2x4xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d1 : dense, d0 : compressed) }>>) -> () loc("<stdin>":27:5)
    "bufferization.dealloc_tensor"(%6) : (tensor<8x4xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d1 : dense, d0 : compressed) }>>) -> () loc("<stdin>":28:5)
    "func.return"() : () -> () loc("<stdin>":29:5)
  }) : () -> () loc("<stdin>":17:3)
}) : () -> () loc("<stdin>":5:1)
