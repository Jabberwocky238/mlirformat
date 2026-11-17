"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "main"}> ({
    %0 = "arith.constant"() <{value = 0 : index}> : () -> index loc("<stdin>":5:10)
    %1 = "arith.constant"() <{value = 0 : i32}> : () -> i32 loc("<stdin>":6:10)
    %2 = "arith.constant"() <{value = dense<[[[1, 0, 0, 0], [0, 0, 0, 0], [0, 0, 0, 0], [0, 0, 5, 0]], [[2, 0, 0, 0], [0, 0, 0, 0], [0, 0, 0, 0], [0, 0, 6, 0]], [[3, 0, 0, 0], [0, 0, 0, 0], [0, 0, 0, 0], [0, 0, 7, 0]], [[4, 0, 0, 0], [0, 0, 0, 0], [0, 0, 0, 0], [0, 0, 8, 0]]]> : tensor<4x4x4xi32>}> : () -> tensor<4x4x4xi32> loc("<stdin>":7:10)
    %3 = "sparse_tensor.convert"(%2) : (tensor<4x4x4xi32>) -> tensor<4x4x4xi32, #sparse_tensor.encoding<{ map = (d0, d1, d2) -> (d1 : compressed, d2 : compressed, d0 : dense) }>> loc("<stdin>":8:10)
    %4 = "sparse_tensor.convert"(%2) : (tensor<4x4x4xi32>) -> tensor<4x4x4xi32, #sparse_tensor.encoding<{ map = (d0, d1, d2) -> (d0 floordiv 2 : compressed, d1 floordiv 2 : compressed, d2 floordiv 2 : compressed, d0 mod 2 : dense, d1 mod 2 : dense, d2 mod 2 : dense) }>> loc("<stdin>":9:10)
    "sparse_tensor.print"(%3) : (tensor<4x4x4xi32, #sparse_tensor.encoding<{ map = (d0, d1, d2) -> (d1 : compressed, d2 : compressed, d0 : dense) }>>) -> () loc("<stdin>":10:5)
    "sparse_tensor.print"(%4) : (tensor<4x4x4xi32, #sparse_tensor.encoding<{ map = (d0, d1, d2) -> (d0 floordiv 2 : compressed, d1 floordiv 2 : compressed, d2 floordiv 2 : compressed, d0 mod 2 : dense, d1 mod 2 : dense, d2 mod 2 : dense) }>>) -> () loc("<stdin>":11:5)
    "bufferization.dealloc_tensor"(%3) : (tensor<4x4x4xi32, #sparse_tensor.encoding<{ map = (d0, d1, d2) -> (d1 : compressed, d2 : compressed, d0 : dense) }>>) -> () loc("<stdin>":12:5)
    "bufferization.dealloc_tensor"(%4) : (tensor<4x4x4xi32, #sparse_tensor.encoding<{ map = (d0, d1, d2) -> (d0 floordiv 2 : compressed, d1 floordiv 2 : compressed, d2 floordiv 2 : compressed, d0 mod 2 : dense, d1 mod 2 : dense, d2 mod 2 : dense) }>>) -> () loc("<stdin>":13:5)
    "func.return"() : () -> () loc("<stdin>":14:5)
  }) : () -> () loc("<stdin>":4:3)
}) : () -> () loc("<stdin>":3:1)
