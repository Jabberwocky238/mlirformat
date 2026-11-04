"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "main"}> ({
    %0 = "arith.constant"() <{value = dense<[1.000000e+00, 2.000000e+00, 3.000000e+00]> : tensor<3xf32>}> : () -> tensor<3xf32>
    %1 = "arith.constant"() <{value = dense<[1.000000e+01, 2.000000e+01, 3.000000e+01]> : tensor<3xf32>}> : () -> tensor<3xf32>
    %2 = "arith.addf"(%0, %1) <{fastmath = #arith.fastmath<none>}> : (tensor<3xf32>, tensor<3xf32>) -> tensor<3xf32>
    %3 = "tensor.cast"(%2) : (tensor<3xf32>) -> tensor<*xf32>
    "func.call"(%3) <{callee = @printMemrefF32}> : (tensor<*xf32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<*xf32>) -> (), sym_name = "printMemrefF32", sym_visibility = "private"}> ({
  }) : () -> ()
}) : () -> ()

