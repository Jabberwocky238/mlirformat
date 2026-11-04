#sparse = #sparse_tensor.encoding<{ map = (d0, d1) -> (d0 : compressed, d1 : compressed) }>
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<4x25xf64, #sparse>) -> tensor<10x10xf64, #sparse>, sym_name = "sparse_reshape"}> ({
  ^bb0(%arg0: tensor<4x25xf64, #sparse>):
    %0 = "arith.constant"() <{value = dense<10> : tensor<2xi32>}> : () -> tensor<2xi32>
    %1 = "tensor.reshape"(%arg0, %0) : (tensor<4x25xf64, #sparse>, tensor<2xi32>) -> tensor<10x10xf64, #sparse>
    "func.return"(%1) : (tensor<10x10xf64, #sparse>) -> ()
  }) : () -> ()
}) : () -> ()

