#sparse = #sparse_tensor.encoding<{ map = (d0) -> (d0 : compressed) }>
#sparse1 = #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : dense, d1 : compressed) }>
#sparse2 = #sparse_tensor.encoding<{ map = (d0, d1, d2) -> (d2 : dense, d0 : compressed, d1 : compressed) }>
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<13xi32, #sparse>) -> tensor<13xi32>, sym_name = "sparse_convert_1d"}> ({
  ^bb0(%arg6: tensor<13xi32, #sparse>):
    %6 = "sparse_tensor.convert"(%arg6) : (tensor<13xi32, #sparse>) -> tensor<13xi32>
    "func.return"(%6) : (tensor<13xi32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<?xi32, #sparse>) -> tensor<?xi32>, sym_name = "sparse_convert_1d_dyn"}> ({
  ^bb0(%arg5: tensor<?xi32, #sparse>):
    %5 = "sparse_tensor.convert"(%arg5) : (tensor<?xi32, #sparse>) -> tensor<?xi32>
    "func.return"(%5) : (tensor<?xi32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<2x4xf64, #sparse1>) -> tensor<2x4xf64>, sym_name = "sparse_convert_2d"}> ({
  ^bb0(%arg4: tensor<2x4xf64, #sparse1>):
    %4 = "sparse_tensor.convert"(%arg4) : (tensor<2x4xf64, #sparse1>) -> tensor<2x4xf64>
    "func.return"(%4) : (tensor<2x4xf64>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<?x4xf64, #sparse1>) -> tensor<?x4xf64>, sym_name = "sparse_convert_2d_dyn0"}> ({
  ^bb0(%arg3: tensor<?x4xf64, #sparse1>):
    %3 = "sparse_tensor.convert"(%arg3) : (tensor<?x4xf64, #sparse1>) -> tensor<?x4xf64>
    "func.return"(%3) : (tensor<?x4xf64>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<2x?xf64, #sparse1>) -> tensor<2x?xf64>, sym_name = "sparse_convert_2d_dyn1"}> ({
  ^bb0(%arg2: tensor<2x?xf64, #sparse1>):
    %2 = "sparse_tensor.convert"(%arg2) : (tensor<2x?xf64, #sparse1>) -> tensor<2x?xf64>
    "func.return"(%2) : (tensor<2x?xf64>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<?x?xf64, #sparse1>) -> tensor<?x?xf64>, sym_name = "sparse_convert_2d_dyn2"}> ({
  ^bb0(%arg1: tensor<?x?xf64, #sparse1>):
    %1 = "sparse_tensor.convert"(%arg1) : (tensor<?x?xf64, #sparse1>) -> tensor<?x?xf64>
    "func.return"(%1) : (tensor<?x?xf64>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<2x3x4xf64, #sparse2>) -> tensor<2x3x4xf64>, sym_name = "sparse_convert_3d"}> ({
  ^bb0(%arg0: tensor<2x3x4xf64, #sparse2>):
    %0 = "sparse_tensor.convert"(%arg0) : (tensor<2x3x4xf64, #sparse2>) -> tensor<2x3x4xf64>
    "func.return"(%0) : (tensor<2x3x4xf64>) -> ()
  }) : () -> ()
}) : () -> ()

