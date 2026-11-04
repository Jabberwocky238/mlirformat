#sparse = #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 floordiv 3 : dense, d1 floordiv 4 : compressed, d0 mod 3 : dense, d1 mod 4 : dense) }>
#sparse1 = #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 floordiv 3 : dense, d1 floordiv 4 : compressed, d1 mod 4 : dense, d0 mod 3 : dense) }>
#sparse2 = #sparse_tensor.encoding<{ map = (d0, d1) -> (d1 floordiv 4 : dense, d0 floordiv 3 : compressed, d0 mod 3 : dense, d1 mod 4 : dense) }>
#sparse3 = #sparse_tensor.encoding<{ map = (d0, d1) -> (d1 floordiv 4 : dense, d0 floordiv 3 : compressed, d1 mod 4 : dense, d0 mod 3 : dense) }>
"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "foo1"}> ({
    %12 = "arith.constant"() <{value = 0 : index}> : () -> index
    %13 = "arith.constant"() <{value = 0.000000e+00 : f64}> : () -> f64
    %14 = "arith.constant"() <{value = sparse<[[0, 0], [0, 1], [2, 3], [3, 8], [3, 9], [5, 10], [5, 11]], [1.000000e+00, 2.000000e+00, 3.000000e+00, 4.000000e+00, 5.000000e+00, 6.000000e+00, 7.000000e+00]> : tensor<6x16xf64>}> : () -> tensor<6x16xf64>
    %15 = "sparse_tensor.convert"(%14) : (tensor<6x16xf64>) -> tensor<?x?xf64, #sparse>
    "sparse_tensor.print"(%15) : (tensor<?x?xf64, #sparse>) -> ()
    "bufferization.dealloc_tensor"(%15) : (tensor<?x?xf64, #sparse>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "foo2"}> ({
    %8 = "arith.constant"() <{value = 0 : index}> : () -> index
    %9 = "arith.constant"() <{value = 0.000000e+00 : f64}> : () -> f64
    %10 = "arith.constant"() <{value = sparse<[[0, 0], [0, 1], [2, 3], [3, 8], [3, 9], [5, 10], [5, 11]], [1.000000e+00, 2.000000e+00, 3.000000e+00, 4.000000e+00, 5.000000e+00, 6.000000e+00, 7.000000e+00]> : tensor<6x16xf64>}> : () -> tensor<6x16xf64>
    %11 = "sparse_tensor.convert"(%10) : (tensor<6x16xf64>) -> tensor<?x?xf64, #sparse1>
    "sparse_tensor.print"(%11) : (tensor<?x?xf64, #sparse1>) -> ()
    "bufferization.dealloc_tensor"(%11) : (tensor<?x?xf64, #sparse1>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "foo3"}> ({
    %4 = "arith.constant"() <{value = 0 : index}> : () -> index
    %5 = "arith.constant"() <{value = 0.000000e+00 : f64}> : () -> f64
    %6 = "arith.constant"() <{value = sparse<[[0, 0], [0, 1], [2, 3], [3, 8], [3, 9], [5, 10], [5, 11]], [1.000000e+00, 2.000000e+00, 3.000000e+00, 4.000000e+00, 5.000000e+00, 6.000000e+00, 7.000000e+00]> : tensor<6x16xf64>}> : () -> tensor<6x16xf64>
    %7 = "sparse_tensor.convert"(%6) : (tensor<6x16xf64>) -> tensor<?x?xf64, #sparse2>
    "sparse_tensor.print"(%7) : (tensor<?x?xf64, #sparse2>) -> ()
    "bufferization.dealloc_tensor"(%7) : (tensor<?x?xf64, #sparse2>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "foo4"}> ({
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index
    %1 = "arith.constant"() <{value = 0.000000e+00 : f64}> : () -> f64
    %2 = "arith.constant"() <{value = sparse<[[0, 0], [0, 1], [2, 3], [3, 8], [3, 9], [5, 10], [5, 11]], [1.000000e+00, 2.000000e+00, 3.000000e+00, 4.000000e+00, 5.000000e+00, 6.000000e+00, 7.000000e+00]> : tensor<6x16xf64>}> : () -> tensor<6x16xf64>
    %3 = "sparse_tensor.convert"(%2) : (tensor<6x16xf64>) -> tensor<?x?xf64, #sparse3>
    "sparse_tensor.print"(%3) : (tensor<?x?xf64, #sparse3>) -> ()
    "bufferization.dealloc_tensor"(%3) : (tensor<?x?xf64, #sparse3>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "main"}> ({
    "func.call"() <{callee = @foo1}> : () -> ()
    "func.call"() <{callee = @foo2}> : () -> ()
    "func.call"() <{callee = @foo3}> : () -> ()
    "func.call"() <{callee = @foo4}> : () -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

