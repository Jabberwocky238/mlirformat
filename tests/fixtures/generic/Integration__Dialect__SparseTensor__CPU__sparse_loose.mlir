#sparse = #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : dense, d1 : loose_compressed) }>
"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "main"}> ({
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index
    %1 = "arith.constant"() <{value = 0.000000e+00 : f64}> : () -> f64
    %2 = "arith.constant"() <{value = dense<[[1.000000e+00, 2.000000e+00, 3.000000e+00, 4.000000e+00], [5.000000e+00, 6.000000e+00, 7.000000e+00, 8.000000e+00], [0.000000e+00, 0.000000e+00, 5.500000e+00, 0.000000e+00], [9.000000e+00, 1.000000e+01, 1.100000e+01, 1.200000e+01], [1.300000e+01, 1.400000e+01, 1.500000e+01, 1.600000e+01]]> : tensor<5x4xf64>}> : () -> tensor<5x4xf64>
    %3 = "sparse_tensor.convert"(%2) : (tensor<5x4xf64>) -> tensor<5x4xf64, #sparse>
    "sparse_tensor.print"(%3) : (tensor<5x4xf64, #sparse>) -> ()
    "bufferization.dealloc_tensor"(%3) : (tensor<5x4xf64, #sparse>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

