#sparse = #sparse_tensor.encoding<{ map = (d0) -> (d0 : compressed) }>
#sparse1 = #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : dense, d1 : compressed) }>
#sparse2 = #sparse_tensor.encoding<{ map = (d0, d1) -> (d1 : dense, d0 : compressed) }>
#sparse3 = #sparse_tensor.encoding<{ map = (d0, d1, d2) -> (d2 : dense, d0 : compressed, d1 : compressed) }>
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<?xi32>) -> tensor<?xi32, #sparse>, sym_name = "sparse_convert_1d"}> ({
  ^bb0(%arg3: tensor<?xi32>):
    %7 = "sparse_tensor.convert"(%arg3) : (tensor<?xi32>) -> tensor<?xi32, #sparse>
    "func.return"(%7) : (tensor<?xi32, #sparse>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<100xcomplex<f64>>) -> tensor<100xcomplex<f64>, #sparse>, sym_name = "sparse_convert_complex"}> ({
  ^bb0(%arg2: tensor<100xcomplex<f64>>):
    %6 = "sparse_tensor.convert"(%arg2) : (tensor<100xcomplex<f64>>) -> tensor<100xcomplex<f64>, #sparse>
    "func.return"(%6) : (tensor<100xcomplex<f64>, #sparse>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<2x4xf64>) -> tensor<2x4xf64, #sparse1>, sym_name = "sparse_convert_2d"}> ({
  ^bb0(%arg1: tensor<2x4xf64>):
    %5 = "sparse_tensor.convert"(%arg1) : (tensor<2x4xf64>) -> tensor<2x4xf64, #sparse1>
    "func.return"(%5) : (tensor<2x4xf64, #sparse1>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> tensor<8x7xf32, #sparse1>, sym_name = "sparse_constant"}> ({
    %3 = "arith.constant"() <{value = sparse<[[0, 0], [1, 6]], [1.000000e+00, 5.000000e+00]> : tensor<8x7xf32>}> : () -> tensor<8x7xf32>
    %4 = "sparse_tensor.convert"(%3) : (tensor<8x7xf32>) -> tensor<8x7xf32, #sparse1>
    "func.return"(%4) : (tensor<8x7xf32, #sparse1>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> tensor<8x7xf32, #sparse2>, sym_name = "sparse_constant_csc"}> ({
    %1 = "arith.constant"() <{value = sparse<[[0, 0], [1, 6]], [1.000000e+00, 5.000000e+00]> : tensor<8x7xf32>}> : () -> tensor<8x7xf32>
    %2 = "sparse_tensor.convert"(%1) : (tensor<8x7xf32>) -> tensor<8x7xf32, #sparse2>
    "func.return"(%2) : (tensor<8x7xf32, #sparse2>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<?x?x?xf64>) -> tensor<?x?x?xf64, #sparse3>, sym_name = "sparse_convert_3d"}> ({
  ^bb0(%arg0: tensor<?x?x?xf64>):
    %0 = "sparse_tensor.convert"(%arg0) : (tensor<?x?x?xf64>) -> tensor<?x?x?xf64, #sparse3>
    "func.return"(%0) : (tensor<?x?x?xf64, #sparse3>) -> ()
  }) : () -> ()
}) : () -> ()

