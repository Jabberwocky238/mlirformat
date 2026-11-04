#sparse = #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed, d1 : compressed) }>
#sparse1 = #sparse_tensor.encoding<{ map = (d0) -> (d0 : compressed) }>
#sparse2 = #sparse_tensor.encoding<{ map = (d0, d1, d2) -> (d0 : compressed, d1 : compressed, d2 : compressed) }>
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<3x4xf64, #sparse>) -> tensor<2x6xf64, #sparse>, sym_name = "reshape0"}> ({
  ^bb0(%arg2: tensor<3x4xf64, #sparse>):
    %11 = "arith.constant"() <{value = dense<[2, 6]> : tensor<2xi32>}> : () -> tensor<2xi32>
    %12 = "tensor.reshape"(%arg2, %11) : (tensor<3x4xf64, #sparse>, tensor<2xi32>) -> tensor<2x6xf64, #sparse>
    "func.return"(%12) : (tensor<2x6xf64, #sparse>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<3x4xf64, #sparse>) -> tensor<12xf64, #sparse1>, sym_name = "reshape1"}> ({
  ^bb0(%arg1: tensor<3x4xf64, #sparse>):
    %9 = "arith.constant"() <{value = dense<12> : tensor<1xi32>}> : () -> tensor<1xi32>
    %10 = "tensor.reshape"(%arg1, %9) : (tensor<3x4xf64, #sparse>, tensor<1xi32>) -> tensor<12xf64, #sparse1>
    "func.return"(%10) : (tensor<12xf64, #sparse1>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<3x4xf64, #sparse>) -> tensor<2x3x2xf64, #sparse2>, sym_name = "reshape2"}> ({
  ^bb0(%arg0: tensor<3x4xf64, #sparse>):
    %7 = "arith.constant"() <{value = dense<[2, 3, 2]> : tensor<3xi32>}> : () -> tensor<3xi32>
    %8 = "tensor.reshape"(%arg0, %7) : (tensor<3x4xf64, #sparse>, tensor<3xi32>) -> tensor<2x3x2xf64, #sparse2>
    "func.return"(%8) : (tensor<2x3x2xf64, #sparse2>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "main"}> ({
    %0 = "arith.constant"() <{value = dense<[[1.100000e+00, 0.000000e+00, 1.300000e+00, 0.000000e+00], [2.100000e+00, 0.000000e+00, 2.300000e+00, 0.000000e+00], [3.100000e+00, 0.000000e+00, 3.300000e+00, 0.000000e+00]]> : tensor<3x4xf64>}> : () -> tensor<3x4xf64>
    %1 = "sparse_tensor.convert"(%0) : (tensor<3x4xf64>) -> tensor<3x4xf64, #sparse>
    %2 = "func.call"(%1) <{callee = @reshape0}> : (tensor<3x4xf64, #sparse>) -> tensor<2x6xf64, #sparse>
    %3 = "func.call"(%1) <{callee = @reshape1}> : (tensor<3x4xf64, #sparse>) -> tensor<12xf64, #sparse1>
    %4 = "func.call"(%1) <{callee = @reshape2}> : (tensor<3x4xf64, #sparse>) -> tensor<2x3x2xf64, #sparse2>
    %5 = "arith.constant"() <{value = 0 : index}> : () -> index
    %6 = "arith.constant"() <{value = -1.000000e+00 : f64}> : () -> f64
    "sparse_tensor.print"(%2) : (tensor<2x6xf64, #sparse>) -> ()
    "sparse_tensor.print"(%3) : (tensor<12xf64, #sparse1>) -> ()
    "sparse_tensor.print"(%4) : (tensor<2x3x2xf64, #sparse2>) -> ()
    "bufferization.dealloc_tensor"(%1) : (tensor<3x4xf64, #sparse>) -> ()
    "bufferization.dealloc_tensor"(%2) : (tensor<2x6xf64, #sparse>) -> ()
    "bufferization.dealloc_tensor"(%3) : (tensor<12xf64, #sparse1>) -> ()
    "bufferization.dealloc_tensor"(%4) : (tensor<2x3x2xf64, #sparse2>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

