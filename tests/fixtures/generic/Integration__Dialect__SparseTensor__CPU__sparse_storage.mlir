#sparse = #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : dense, d1 : dense) }>
#sparse1 = #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : dense, d1 : compressed) }>
#sparse2 = #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed, d1 : compressed) }>
#sparse3 = #sparse_tensor.encoding<{ map = (d0, d1) -> (d1 : dense, d0 : compressed) }>
#sparse4 = #sparse_tensor.encoding<{ map = (d0, d1) -> (d1 : compressed, d0 : compressed) }>
#sparse5 = #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed, d1 : dense) }>
#sparse6 = #sparse_tensor.encoding<{ map = (d0, d1) -> (d1 : compressed, d0 : dense) }>
"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "main"}> ({
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index
    %1 = "arith.constant"() <{value = 1 : index}> : () -> index
    %2 = "arith.constant"() <{value = 0.000000e+00 : f64}> : () -> f64
    %3 = "arith.constant"() <{value = dense<[[1.000000e+00, 0.000000e+00, 2.000000e+00, 0.000000e+00, 0.000000e+00, 0.000000e+00, 0.000000e+00, 3.000000e+00], [0.000000e+00, 0.000000e+00, 0.000000e+00, 0.000000e+00, 0.000000e+00, 0.000000e+00, 0.000000e+00, 0.000000e+00], [0.000000e+00, 0.000000e+00, 4.000000e+00, 0.000000e+00, 0.000000e+00, 0.000000e+00, 0.000000e+00, 0.000000e+00], [0.000000e+00, 0.000000e+00, 0.000000e+00, 5.000000e+00, 0.000000e+00, 0.000000e+00, 0.000000e+00, 0.000000e+00], [0.000000e+00, 0.000000e+00, 0.000000e+00, 0.000000e+00, 6.000000e+00, 0.000000e+00, 0.000000e+00, 0.000000e+00], [0.000000e+00, 7.000000e+00, 8.000000e+00, 0.000000e+00, 0.000000e+00, 0.000000e+00, 0.000000e+00, 9.000000e+00], [0.000000e+00, 0.000000e+00, 1.000000e+01, 0.000000e+00, 0.000000e+00, 0.000000e+00, 1.100000e+01, 1.200000e+01], [0.000000e+00, 1.300000e+01, 1.400000e+01, 0.000000e+00, 0.000000e+00, 0.000000e+00, 1.500000e+01, 1.600000e+01], [0.000000e+00, 0.000000e+00, 0.000000e+00, 0.000000e+00, 0.000000e+00, 0.000000e+00, 0.000000e+00, 0.000000e+00], [0.000000e+00, 0.000000e+00, 0.000000e+00, 0.000000e+00, 0.000000e+00, 0.000000e+00, 1.700000e+01, 0.000000e+00]]> : tensor<10x8xf64>}> : () -> tensor<10x8xf64>
    %4 = "sparse_tensor.convert"(%3) : (tensor<10x8xf64>) -> tensor<10x8xf64, #sparse>
    %5 = "sparse_tensor.convert"(%3) : (tensor<10x8xf64>) -> tensor<10x8xf64, #sparse1>
    %6 = "sparse_tensor.convert"(%3) : (tensor<10x8xf64>) -> tensor<10x8xf64, #sparse2>
    %7 = "sparse_tensor.convert"(%3) : (tensor<10x8xf64>) -> tensor<10x8xf64, #sparse3>
    %8 = "sparse_tensor.convert"(%3) : (tensor<10x8xf64>) -> tensor<10x8xf64, #sparse4>
    %9 = "sparse_tensor.convert"(%3) : (tensor<10x8xf64>) -> tensor<10x8xf64, #sparse5>
    %10 = "sparse_tensor.convert"(%3) : (tensor<10x8xf64>) -> tensor<10x8xf64, #sparse6>
    "sparse_tensor.print"(%4) : (tensor<10x8xf64, #sparse>) -> ()
    "sparse_tensor.print"(%5) : (tensor<10x8xf64, #sparse1>) -> ()
    "sparse_tensor.print"(%6) : (tensor<10x8xf64, #sparse2>) -> ()
    "sparse_tensor.print"(%7) : (tensor<10x8xf64, #sparse3>) -> ()
    "sparse_tensor.print"(%8) : (tensor<10x8xf64, #sparse4>) -> ()
    "sparse_tensor.print"(%9) : (tensor<10x8xf64, #sparse5>) -> ()
    "sparse_tensor.print"(%10) : (tensor<10x8xf64, #sparse6>) -> ()
    "bufferization.dealloc_tensor"(%4) : (tensor<10x8xf64, #sparse>) -> ()
    "bufferization.dealloc_tensor"(%5) : (tensor<10x8xf64, #sparse1>) -> ()
    "bufferization.dealloc_tensor"(%6) : (tensor<10x8xf64, #sparse2>) -> ()
    "bufferization.dealloc_tensor"(%7) : (tensor<10x8xf64, #sparse3>) -> ()
    "bufferization.dealloc_tensor"(%8) : (tensor<10x8xf64, #sparse4>) -> ()
    "bufferization.dealloc_tensor"(%9) : (tensor<10x8xf64, #sparse5>) -> ()
    "bufferization.dealloc_tensor"(%10) : (tensor<10x8xf64, #sparse6>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

