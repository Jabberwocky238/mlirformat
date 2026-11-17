"builtin.module"() ({
  "func.func"() <{function_type = (tensor<?xi32>) -> tensor<?xi32, #sparse_tensor.encoding<{ map = (d0) -> (d0 : compressed) }>>, sym_name = "sparse_convert_1d"}> ({
  ^bb0(%arg3: tensor<?xi32> loc("<stdin>":7:8)):
    %7 = "sparse_tensor.convert"(%arg3) : (tensor<?xi32>) -> tensor<?xi32, #sparse_tensor.encoding<{ map = (d0) -> (d0 : compressed) }>> loc("<stdin>":8:10)
    "func.return"(%7) : (tensor<?xi32, #sparse_tensor.encoding<{ map = (d0) -> (d0 : compressed) }>>) -> () loc("<stdin>":9:5)
  }) : () -> () loc("<stdin>":6:3)
  "func.func"() <{function_type = (tensor<100xcomplex<f64>>) -> tensor<100xcomplex<f64>, #sparse_tensor.encoding<{ map = (d0) -> (d0 : compressed) }>>, sym_name = "sparse_convert_complex"}> ({
  ^bb0(%arg2: tensor<100xcomplex<f64>> loc("<stdin>":12:8)):
    %6 = "sparse_tensor.convert"(%arg2) : (tensor<100xcomplex<f64>>) -> tensor<100xcomplex<f64>, #sparse_tensor.encoding<{ map = (d0) -> (d0 : compressed) }>> loc("<stdin>":13:10)
    "func.return"(%6) : (tensor<100xcomplex<f64>, #sparse_tensor.encoding<{ map = (d0) -> (d0 : compressed) }>>) -> () loc("<stdin>":14:5)
  }) : () -> () loc("<stdin>":11:3)
  "func.func"() <{function_type = (tensor<2x4xf64>) -> tensor<2x4xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : dense, d1 : compressed) }>>, sym_name = "sparse_convert_2d"}> ({
  ^bb0(%arg1: tensor<2x4xf64> loc("<stdin>":17:8)):
    %5 = "sparse_tensor.convert"(%arg1) : (tensor<2x4xf64>) -> tensor<2x4xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : dense, d1 : compressed) }>> loc("<stdin>":18:10)
    "func.return"(%5) : (tensor<2x4xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : dense, d1 : compressed) }>>) -> () loc("<stdin>":19:5)
  }) : () -> () loc("<stdin>":16:3)
  "func.func"() <{function_type = () -> tensor<8x7xf32, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : dense, d1 : compressed) }>>, sym_name = "sparse_constant"}> ({
    %3 = "arith.constant"() <{value = sparse<[[0, 0], [1, 6]], [1.000000e+00, 5.000000e+00]> : tensor<8x7xf32>}> : () -> tensor<8x7xf32> loc("<stdin>":22:10)
    %4 = "sparse_tensor.convert"(%3) : (tensor<8x7xf32>) -> tensor<8x7xf32, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : dense, d1 : compressed) }>> loc("<stdin>":23:10)
    "func.return"(%4) : (tensor<8x7xf32, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : dense, d1 : compressed) }>>) -> () loc("<stdin>":24:5)
  }) : () -> () loc("<stdin>":21:3)
  "func.func"() <{function_type = () -> tensor<8x7xf32, #sparse_tensor.encoding<{ map = (d0, d1) -> (d1 : dense, d0 : compressed) }>>, sym_name = "sparse_constant_csc"}> ({
    %1 = "arith.constant"() <{value = sparse<[[0, 0], [1, 6]], [1.000000e+00, 5.000000e+00]> : tensor<8x7xf32>}> : () -> tensor<8x7xf32> loc("<stdin>":27:10)
    %2 = "sparse_tensor.convert"(%1) : (tensor<8x7xf32>) -> tensor<8x7xf32, #sparse_tensor.encoding<{ map = (d0, d1) -> (d1 : dense, d0 : compressed) }>> loc("<stdin>":28:10)
    "func.return"(%2) : (tensor<8x7xf32, #sparse_tensor.encoding<{ map = (d0, d1) -> (d1 : dense, d0 : compressed) }>>) -> () loc("<stdin>":29:5)
  }) : () -> () loc("<stdin>":26:3)
  "func.func"() <{function_type = (tensor<?x?x?xf64>) -> tensor<?x?x?xf64, #sparse_tensor.encoding<{ map = (d0, d1, d2) -> (d2 : dense, d0 : compressed, d1 : compressed) }>>, sym_name = "sparse_convert_3d"}> ({
  ^bb0(%arg0: tensor<?x?x?xf64> loc("<stdin>":32:8)):
    %0 = "sparse_tensor.convert"(%arg0) : (tensor<?x?x?xf64>) -> tensor<?x?x?xf64, #sparse_tensor.encoding<{ map = (d0, d1, d2) -> (d2 : dense, d0 : compressed, d1 : compressed) }>> loc("<stdin>":33:10)
    "func.return"(%0) : (tensor<?x?x?xf64, #sparse_tensor.encoding<{ map = (d0, d1, d2) -> (d2 : dense, d0 : compressed, d1 : compressed) }>>) -> () loc("<stdin>":34:5)
  }) : () -> () loc("<stdin>":31:3)
}) : () -> () loc("<stdin>":5:1)
