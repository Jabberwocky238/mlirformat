"builtin.module"() ({
  "func.func"() <{function_type = (tensor<4x25xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed, d1 : compressed) }>>) -> tensor<10x10xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed, d1 : compressed) }>>, sym_name = "sparse_reshape"}> ({
  ^bb0(%arg0: tensor<4x25xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed, d1 : compressed) }>> loc("<stdin>":4:8)):
    %0 = "arith.constant"() <{value = dense<10> : tensor<2xi32>}> : () -> tensor<2xi32> loc("<stdin>":5:10)
    %1 = "tensor.reshape"(%arg0, %0) : (tensor<4x25xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed, d1 : compressed) }>>, tensor<2xi32>) -> tensor<10x10xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed, d1 : compressed) }>> loc("<stdin>":6:10)
    "func.return"(%1) : (tensor<10x10xf64, #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed, d1 : compressed) }>>) -> () loc("<stdin>":7:5)
  }) : () -> () loc("<stdin>":3:3)
}) : () -> () loc("<stdin>":2:1)
