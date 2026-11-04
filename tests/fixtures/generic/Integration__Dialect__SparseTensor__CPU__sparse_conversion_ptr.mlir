#sparse = #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed, d1 : compressed), posWidth = 8, crdWidth = 8 }>
#sparse1 = #sparse_tensor.encoding<{ map = (d0, d1) -> (d1 : compressed, d0 : compressed), posWidth = 64, crdWidth = 64 }>
#sparse2 = #sparse_tensor.encoding<{ map = (d0, d1) -> (d1 : dense, d0 : compressed), posWidth = 16, crdWidth = 32 }>
"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "main"}> ({
    %0 = "arith.constant"() <{value = 1 : index}> : () -> index
    %1 = "arith.constant"() <{value = sparse<[[0, 0], [0, 1], [0, 63], [1, 0], [1, 1], [31, 0], [31, 63]], [1.000000e+00, 2.000000e+00, 3.000000e+00, 4.000000e+00, 5.000000e+00, 6.000000e+00, 7.000000e+00]> : tensor<32x64xf64>}> : () -> tensor<32x64xf64>
    %2 = "tensor.cast"(%1) : (tensor<32x64xf64>) -> tensor<?x?xf64>
    %3 = "sparse_tensor.convert"(%1) : (tensor<32x64xf64>) -> tensor<32x64xf64, #sparse>
    %4 = "sparse_tensor.convert"(%1) : (tensor<32x64xf64>) -> tensor<32x64xf64, #sparse1>
    %5 = "sparse_tensor.convert"(%1) : (tensor<32x64xf64>) -> tensor<32x64xf64, #sparse2>
    %6 = "sparse_tensor.convert"(%3) : (tensor<32x64xf64, #sparse>) -> tensor<32x64xf64, #sparse1>
    %7 = "sparse_tensor.convert"(%4) : (tensor<32x64xf64, #sparse1>) -> tensor<32x64xf64, #sparse>
    %8 = "sparse_tensor.convert"(%5) : (tensor<32x64xf64, #sparse2>) -> tensor<32x64xf64, #sparse>
    "sparse_tensor.print"(%3) : (tensor<32x64xf64, #sparse>) -> ()
    "sparse_tensor.print"(%4) : (tensor<32x64xf64, #sparse1>) -> ()
    "sparse_tensor.print"(%5) : (tensor<32x64xf64, #sparse2>) -> ()
    "sparse_tensor.print"(%6) : (tensor<32x64xf64, #sparse1>) -> ()
    "sparse_tensor.print"(%7) : (tensor<32x64xf64, #sparse>) -> ()
    "sparse_tensor.print"(%8) : (tensor<32x64xf64, #sparse>) -> ()
    "bufferization.dealloc_tensor"(%3) : (tensor<32x64xf64, #sparse>) -> ()
    "bufferization.dealloc_tensor"(%4) : (tensor<32x64xf64, #sparse1>) -> ()
    "bufferization.dealloc_tensor"(%5) : (tensor<32x64xf64, #sparse2>) -> ()
    "bufferization.dealloc_tensor"(%6) : (tensor<32x64xf64, #sparse1>) -> ()
    "bufferization.dealloc_tensor"(%7) : (tensor<32x64xf64, #sparse>) -> ()
    "bufferization.dealloc_tensor"(%8) : (tensor<32x64xf64, #sparse>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

