#sparse = #sparse_tensor.encoding<{ map = (d0, d1, d2) -> (d1 : compressed, d2 : compressed, d0 : dense) }>
#sparse1 = #sparse_tensor.encoding<{ map = (d0, d1, d2) -> (d0 floordiv 2 : compressed, d1 floordiv 2 : compressed, d2 floordiv 2 : compressed, d0 mod 2 : dense, d1 mod 2 : dense, d2 mod 2 : dense) }>
"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "main"}> ({
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index
    %1 = "arith.constant"() <{value = 0 : i32}> : () -> i32
    %2 = "arith.constant"() <{value = dense<[[[1, 0, 0, 0], [0, 0, 0, 0], [0, 0, 0, 0], [0, 0, 5, 0]], [[2, 0, 0, 0], [0, 0, 0, 0], [0, 0, 0, 0], [0, 0, 6, 0]], [[3, 0, 0, 0], [0, 0, 0, 0], [0, 0, 0, 0], [0, 0, 7, 0]], [[4, 0, 0, 0], [0, 0, 0, 0], [0, 0, 0, 0], [0, 0, 8, 0]]]> : tensor<4x4x4xi32>}> : () -> tensor<4x4x4xi32>
    %3 = "sparse_tensor.convert"(%2) : (tensor<4x4x4xi32>) -> tensor<4x4x4xi32, #sparse>
    %4 = "sparse_tensor.convert"(%2) : (tensor<4x4x4xi32>) -> tensor<4x4x4xi32, #sparse1>
    "sparse_tensor.print"(%3) : (tensor<4x4x4xi32, #sparse>) -> ()
    "sparse_tensor.print"(%4) : (tensor<4x4x4xi32, #sparse1>) -> ()
    "bufferization.dealloc_tensor"(%3) : (tensor<4x4x4xi32, #sparse>) -> ()
    "bufferization.dealloc_tensor"(%4) : (tensor<4x4x4xi32, #sparse1>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

