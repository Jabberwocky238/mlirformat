"builtin.module"() ({
^bb0:
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = () -> tensor<3x11x11x3xi1>, sym_name = "test_const_i1"}> ({
    %0 = "tosa.const"() <{values = dense<false> : tensor<3x11x11x3xi1>}> : () -> tensor<3x11x11x3xi1>
    "func.return"(%0) : (tensor<3x11x11x3xi1>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = () -> tensor<3x11x11x3xi32>, sym_name = "test_const_i32"}> ({
    %0 = "tosa.const"() <{values = dense<0> : tensor<3x11x11x3xi32>}> : () -> tensor<3x11x11x3xi32>
    "func.return"(%0) : (tensor<3x11x11x3xi32>) -> ()
  }) : () -> ()
}) : () -> ()

