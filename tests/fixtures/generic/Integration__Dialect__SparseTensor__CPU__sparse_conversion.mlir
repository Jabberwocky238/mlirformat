#sparse = #sparse_tensor.encoding<{ map = (d0, d1, d2) -> (d0 : compressed, d1 : compressed, d2 : compressed) }>
#sparse1 = #sparse_tensor.encoding<{ map = (d0, d1, d2) -> (d1 : compressed, d2 : compressed, d0 : compressed) }>
#sparse2 = #sparse_tensor.encoding<{ map = (d0, d1, d2) -> (d2 : compressed, d0 : compressed, d1 : compressed) }>
"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "main"}> ({
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index
    %1 = "arith.constant"() <{value = 1 : index}> : () -> index
    %2 = "arith.constant"() <{value = 2 : index}> : () -> index
    %3 = "arith.constant"() <{value = dense<[[[1.000000e+00, 2.000000e+00, 3.000000e+00, 4.000000e+00], [5.000000e+00, 6.000000e+00, 7.000000e+00, 8.000000e+00], [9.000000e+00, 1.000000e+01, 1.100000e+01, 1.200000e+01]], [[1.300000e+01, 1.400000e+01, 1.500000e+01, 1.600000e+01], [1.700000e+01, 1.800000e+01, 1.900000e+01, 2.000000e+01], [2.100000e+01, 2.200000e+01, 2.300000e+01, 2.400000e+01]]]> : tensor<2x3x4xf64>}> : () -> tensor<2x3x4xf64>
    %4 = "sparse_tensor.convert"(%3) : (tensor<2x3x4xf64>) -> tensor<2x3x4xf64, #sparse>
    %5 = "sparse_tensor.convert"(%3) : (tensor<2x3x4xf64>) -> tensor<2x3x4xf64, #sparse1>
    %6 = "sparse_tensor.convert"(%3) : (tensor<2x3x4xf64>) -> tensor<2x3x4xf64, #sparse2>
    %7 = "sparse_tensor.convert"(%4) : (tensor<2x3x4xf64, #sparse>) -> tensor<2x3x4xf64, #sparse>
    %8 = "sparse_tensor.convert"(%5) : (tensor<2x3x4xf64, #sparse1>) -> tensor<2x3x4xf64, #sparse>
    %9 = "sparse_tensor.convert"(%6) : (tensor<2x3x4xf64, #sparse2>) -> tensor<2x3x4xf64, #sparse>
    %10 = "sparse_tensor.convert"(%4) : (tensor<2x3x4xf64, #sparse>) -> tensor<2x3x4xf64, #sparse1>
    %11 = "sparse_tensor.convert"(%5) : (tensor<2x3x4xf64, #sparse1>) -> tensor<2x3x4xf64, #sparse1>
    %12 = "sparse_tensor.convert"(%6) : (tensor<2x3x4xf64, #sparse2>) -> tensor<2x3x4xf64, #sparse1>
    %13 = "sparse_tensor.convert"(%4) : (tensor<2x3x4xf64, #sparse>) -> tensor<2x3x4xf64, #sparse2>
    %14 = "sparse_tensor.convert"(%5) : (tensor<2x3x4xf64, #sparse1>) -> tensor<2x3x4xf64, #sparse2>
    %15 = "sparse_tensor.convert"(%6) : (tensor<2x3x4xf64, #sparse2>) -> tensor<2x3x4xf64, #sparse2>
    "sparse_tensor.print"(%4) : (tensor<2x3x4xf64, #sparse>) -> ()
    "sparse_tensor.print"(%5) : (tensor<2x3x4xf64, #sparse1>) -> ()
    "sparse_tensor.print"(%6) : (tensor<2x3x4xf64, #sparse2>) -> ()
    "sparse_tensor.print"(%7) : (tensor<2x3x4xf64, #sparse>) -> ()
    "sparse_tensor.print"(%8) : (tensor<2x3x4xf64, #sparse>) -> ()
    "sparse_tensor.print"(%9) : (tensor<2x3x4xf64, #sparse>) -> ()
    "sparse_tensor.print"(%10) : (tensor<2x3x4xf64, #sparse1>) -> ()
    "sparse_tensor.print"(%11) : (tensor<2x3x4xf64, #sparse1>) -> ()
    "sparse_tensor.print"(%12) : (tensor<2x3x4xf64, #sparse1>) -> ()
    "sparse_tensor.print"(%13) : (tensor<2x3x4xf64, #sparse2>) -> ()
    "sparse_tensor.print"(%14) : (tensor<2x3x4xf64, #sparse2>) -> ()
    "sparse_tensor.print"(%15) : (tensor<2x3x4xf64, #sparse2>) -> ()
    "bufferization.dealloc_tensor"(%4) : (tensor<2x3x4xf64, #sparse>) -> ()
    "bufferization.dealloc_tensor"(%5) : (tensor<2x3x4xf64, #sparse1>) -> ()
    "bufferization.dealloc_tensor"(%6) : (tensor<2x3x4xf64, #sparse2>) -> ()
    "bufferization.dealloc_tensor"(%8) : (tensor<2x3x4xf64, #sparse>) -> ()
    "bufferization.dealloc_tensor"(%9) : (tensor<2x3x4xf64, #sparse>) -> ()
    "bufferization.dealloc_tensor"(%10) : (tensor<2x3x4xf64, #sparse1>) -> ()
    "bufferization.dealloc_tensor"(%12) : (tensor<2x3x4xf64, #sparse1>) -> ()
    "bufferization.dealloc_tensor"(%13) : (tensor<2x3x4xf64, #sparse2>) -> ()
    "bufferization.dealloc_tensor"(%14) : (tensor<2x3x4xf64, #sparse2>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

