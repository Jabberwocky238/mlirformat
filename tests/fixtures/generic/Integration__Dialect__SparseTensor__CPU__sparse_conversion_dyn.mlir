#sparse = #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed, d1 : compressed) }>
#sparse1 = #sparse_tensor.encoding<{ map = (d0, d1) -> (d1 : compressed, d0 : compressed) }>
"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "main"}> ({
    %0 = "arith.constant"() <{value = sparse<[[0, 0], [0, 1], [0, 63], [1, 0], [1, 1], [31, 0], [31, 63]], [1.000000e+00, 2.000000e+00, 3.000000e+00, 4.000000e+00, 5.000000e+00, 6.000000e+00, 7.000000e+00]> : tensor<32x64xf64>}> : () -> tensor<32x64xf64>
    %1 = "tensor.cast"(%0) : (tensor<32x64xf64>) -> tensor<?x?xf64>
    %2 = "sparse_tensor.convert"(%0) : (tensor<32x64xf64>) -> tensor<?x?xf64, #sparse>
    %3 = "sparse_tensor.convert"(%0) : (tensor<32x64xf64>) -> tensor<?x?xf64, #sparse1>
    %4 = "sparse_tensor.convert"(%1) : (tensor<?x?xf64>) -> tensor<?x?xf64, #sparse>
    %5 = "sparse_tensor.convert"(%1) : (tensor<?x?xf64>) -> tensor<?x?xf64, #sparse1>
    %6 = "sparse_tensor.convert"(%4) : (tensor<?x?xf64, #sparse>) -> tensor<?x?xf64, #sparse1>
    %7 = "sparse_tensor.convert"(%5) : (tensor<?x?xf64, #sparse1>) -> tensor<?x?xf64, #sparse>
    "sparse_tensor.print"(%2) : (tensor<?x?xf64, #sparse>) -> ()
    "sparse_tensor.print"(%3) : (tensor<?x?xf64, #sparse1>) -> ()
    "sparse_tensor.print"(%4) : (tensor<?x?xf64, #sparse>) -> ()
    "sparse_tensor.print"(%5) : (tensor<?x?xf64, #sparse1>) -> ()
    "sparse_tensor.print"(%6) : (tensor<?x?xf64, #sparse1>) -> ()
    "sparse_tensor.print"(%7) : (tensor<?x?xf64, #sparse>) -> ()
    "bufferization.dealloc_tensor"(%2) : (tensor<?x?xf64, #sparse>) -> ()
    "bufferization.dealloc_tensor"(%3) : (tensor<?x?xf64, #sparse1>) -> ()
    "bufferization.dealloc_tensor"(%4) : (tensor<?x?xf64, #sparse>) -> ()
    "bufferization.dealloc_tensor"(%5) : (tensor<?x?xf64, #sparse1>) -> ()
    "bufferization.dealloc_tensor"(%6) : (tensor<?x?xf64, #sparse1>) -> ()
    "bufferization.dealloc_tensor"(%7) : (tensor<?x?xf64, #sparse>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

