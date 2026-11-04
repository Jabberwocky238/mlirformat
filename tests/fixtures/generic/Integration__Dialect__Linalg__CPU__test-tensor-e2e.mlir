"builtin.module"() ({
  "func.func"() <{function_type = () -> tensor<4xf32>, sym_name = "foo"}> ({
    %2 = "arith.constant"() <{value = dense<[1.000000e+00, 2.000000e+00, 3.000000e+00, 4.000000e+00]> : tensor<4xf32>}> : () -> tensor<4xf32>
    "func.return"(%2) : (tensor<4xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "main"}> ({
    %0 = "func.call"() <{callee = @foo}> : () -> tensor<4xf32>
    %1 = "tensor.cast"(%0) : (tensor<4xf32>) -> tensor<*xf32>
    "func.call"(%1) <{callee = @printMemrefF32}> : (tensor<*xf32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<*xf32>) -> (), sym_name = "printMemrefF32", sym_visibility = "private"}> ({
  }) : () -> ()
}) : () -> ()

