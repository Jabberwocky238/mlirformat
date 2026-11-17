"builtin.module"() ({
  "func.func"() <{function_type = (tensor<13xi32, #sparse_tensor.encoding<{ map = (d0) -> (d0 : compressed) }>>) -> tensor<13xi32>, sym_name = "sparse_convert_1d"}> ({
  ^bb0(%arg6: tensor<13xi32, #sparse_tensor.encoding<{ map = (d0) -> (d0 : compressed) }>> loc("<stdin>":6:8)):
    %6 = "sparse_tensor.convert"(%arg6) : (tensor<13xi32, #sparse_tensor.encoding<{ map = (d0) -> (d0 : compressed) }>>) -> tensor<13xi32> loc("<stdin>":7:10)
    "func.return"(%6) : (tensor<13xi32>) -> () loc("<stdin>":8:5)
  }) : () -> () loc("<stdin>":5:3)
  "func.func"() <{function_type = (tensor<?xi32, #sparse_tensor.encoding<{ map = (d0) -> (d0 : compressed) }>>) -> tensor<?xi32>, sym_name = "sparse_convert_1d_dyn"}> ({
  ^bb0(%arg5: tensor<?xi32, #sparse_tensor.encoding<{ map = (d0) -> (d0 : compressed) }>> loc("<stdin>":11:8)):
    %5 = "sparse_tensor.convert"(%arg5) : (tensor<?xi32, #sparse_tensor.encoding<{ map = (d0) -> (d0 : compressed) }>>) -> tensor<?xi32> loc("<stdin>":12:10)
    "func.return"(%5) : (tensor<?xi32>) -> () loc("<stdin>":13:5)
  }) : () -> () loc("<stdin>":10:3)
  "func.func"() <{function_type = (tensor<2x4xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : dense, d1 : compressed) }>>) -> tensor<2x4xf64>, sym_name = "sparse_convert_2d"}> ({
  ^bb0(%arg4: tensor<2x4xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : dense, d1 : compressed) }>> loc("<stdin>":16:8)):
    %4 = "sparse_tensor.convert"(%arg4) : (tensor<2x4xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : dense, d1 : compressed) }>>) -> tensor<2x4xf64> loc("<stdin>":17:10)
    "func.return"(%4) : (tensor<2x4xf64>) -> () loc("<stdin>":18:5)
  }) : () -> () loc("<stdin>":15:3)
  "func.func"() <{function_type = (tensor<?x4xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : dense, d1 : compressed) }>>) -> tensor<?x4xf64>, sym_name = "sparse_convert_2d_dyn0"}> ({
  ^bb0(%arg3: tensor<?x4xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : dense, d1 : compressed) }>> loc("<stdin>":21:8)):
    %3 = "sparse_tensor.convert"(%arg3) : (tensor<?x4xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : dense, d1 : compressed) }>>) -> tensor<?x4xf64> loc("<stdin>":22:10)
    "func.return"(%3) : (tensor<?x4xf64>) -> () loc("<stdin>":23:5)
  }) : () -> () loc("<stdin>":20:3)
  "func.func"() <{function_type = (tensor<2x?xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : dense, d1 : compressed) }>>) -> tensor<2x?xf64>, sym_name = "sparse_convert_2d_dyn1"}> ({
  ^bb0(%arg2: tensor<2x?xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : dense, d1 : compressed) }>> loc("<stdin>":26:8)):
    %2 = "sparse_tensor.convert"(%arg2) : (tensor<2x?xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : dense, d1 : compressed) }>>) -> tensor<2x?xf64> loc("<stdin>":27:10)
    "func.return"(%2) : (tensor<2x?xf64>) -> () loc("<stdin>":28:5)
  }) : () -> () loc("<stdin>":25:3)
  "func.func"() <{function_type = (tensor<?x?xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : dense, d1 : compressed) }>>) -> tensor<?x?xf64>, sym_name = "sparse_convert_2d_dyn2"}> ({
  ^bb0(%arg1: tensor<?x?xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : dense, d1 : compressed) }>> loc("<stdin>":31:8)):
    %1 = "sparse_tensor.convert"(%arg1) : (tensor<?x?xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : dense, d1 : compressed) }>>) -> tensor<?x?xf64> loc("<stdin>":32:10)
    "func.return"(%1) : (tensor<?x?xf64>) -> () loc("<stdin>":33:5)
  }) : () -> () loc("<stdin>":30:3)
  "func.func"() <{function_type = (tensor<2x3x4xf64, #sparse_tensor.encoding<{ map = (d0, d1, d2) -> (d2 : dense, d0 : compressed, d1 : compressed) }>>) -> tensor<2x3x4xf64>, sym_name = "sparse_convert_3d"}> ({
  ^bb0(%arg0: tensor<2x3x4xf64, #sparse_tensor.encoding<{ map = (d0, d1, d2) -> (d2 : dense, d0 : compressed, d1 : compressed) }>> loc("<stdin>":36:8)):
    %0 = "sparse_tensor.convert"(%arg0) : (tensor<2x3x4xf64, #sparse_tensor.encoding<{ map = (d0, d1, d2) -> (d2 : dense, d0 : compressed, d1 : compressed) }>>) -> tensor<2x3x4xf64> loc("<stdin>":37:10)
    "func.return"(%0) : (tensor<2x3x4xf64>) -> () loc("<stdin>":38:5)
  }) : () -> () loc("<stdin>":35:3)
}) : () -> () loc("<stdin>":4:1)
