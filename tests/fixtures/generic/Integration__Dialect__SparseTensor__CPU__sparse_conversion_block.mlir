#sparse = #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 floordiv 2 : dense, d1 floordiv 2 : compressed, d0 mod 2 : dense, d1 mod 2 : dense) }>
#sparse1 = #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : dense, d1 : compressed) }>
#sparse2 = #sparse_tensor.encoding<{ map = (d0, d1) -> (d1 : dense, d0 : compressed) }>
"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "main"}> ({
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index
    %1 = "arith.constant"() <{value = 1 : index}> : () -> index
    %2 = "arith.constant"() <{value = 2 : index}> : () -> index
    %3 = "arith.constant"() <{value = sparse<[[0, 0], [0, 1], [0, 2], [0, 3], [1, 0], [1, 1], [1, 2], [1, 3]], [1.000000e+00, 2.000000e+00, 3.000000e+00, 4.000000e+00, 5.000000e+00, 6.000000e+00, 7.000000e+00, 8.000000e+00]> : tensor<2x4xf64>}> : () -> tensor<2x4xf64>
    %4 = "arith.constant"() <{value = dense<[[1.000000e+00, 2.000000e+00, 3.000000e+00, 4.000000e+00], [5.000000e+00, 6.000000e+00, 7.000000e+00, 8.000000e+00]]> : tensor<2x4xf64>}> : () -> tensor<2x4xf64>
    %5 = "sparse_tensor.convert"(%3) : (tensor<2x4xf64>) -> tensor<2x4xf64, #sparse>
    %6 = "sparse_tensor.convert"(%4) : (tensor<2x4xf64>) -> tensor<2x4xf64, #sparse>
    %7 = "sparse_tensor.convert"(%5) : (tensor<2x4xf64, #sparse>) -> tensor<2x4xf64, #sparse1>
    %8 = "sparse_tensor.convert"(%5) : (tensor<2x4xf64, #sparse>) -> tensor<2x4xf64, #sparse2>
    "sparse_tensor.print"(%5) : (tensor<2x4xf64, #sparse>) -> ()
    "sparse_tensor.print"(%6) : (tensor<2x4xf64, #sparse>) -> ()
    "sparse_tensor.print"(%7) : (tensor<2x4xf64, #sparse1>) -> ()
    "sparse_tensor.print"(%8) : (tensor<2x4xf64, #sparse2>) -> ()
    "bufferization.dealloc_tensor"(%5) : (tensor<2x4xf64, #sparse>) -> ()
    "bufferization.dealloc_tensor"(%6) : (tensor<2x4xf64, #sparse>) -> ()
    "bufferization.dealloc_tensor"(%7) : (tensor<2x4xf64, #sparse1>) -> ()
    "bufferization.dealloc_tensor"(%8) : (tensor<2x4xf64, #sparse2>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

