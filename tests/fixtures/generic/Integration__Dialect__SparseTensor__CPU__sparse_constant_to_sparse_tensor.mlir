#sparse = #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed, d1 : compressed) }>
"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "main"}> ({
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index
    %1 = "arith.constant"() <{value = 1 : index}> : () -> index
    %2 = "arith.constant"() <{value = 2 : index}> : () -> index
    %3 = "arith.constant"() <{value = 0.000000e+00 : f64}> : () -> f64
    %4 = "arith.constant"() <{value = sparse<[[0, 0], [0, 7], [1, 2], [4, 2], [5, 3], [6, 4], [6, 6], [9, 7]], [1.000000e+00, 2.000000e+00, 3.000000e+00, 4.000000e+00, 5.000000e+00, 6.000000e+00, 7.000000e+00, 8.000000e+00]> : tensor<10x8xf64>}> : () -> tensor<10x8xf64>
    %5 = "sparse_tensor.convert"(%4) : (tensor<10x8xf64>) -> tensor<10x8xf64, #sparse>
    "sparse_tensor.print"(%5) : (tensor<10x8xf64, #sparse>) -> ()
    "bufferization.dealloc_tensor"(%5) : (tensor<10x8xf64, #sparse>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

