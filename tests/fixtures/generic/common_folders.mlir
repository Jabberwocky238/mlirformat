"builtin.module"() ({
  "func.func"() <{function_type = () -> tensor<4x2xsi32>, sym_name = "test_fold_unary_op_f32_to_si32"}> ({
    %0 = "arith.constant"() <{value = dense<5.100000e+00> : tensor<4x2xf32>}> : () -> tensor<4x2xf32>
    %1 = "test.sign"(%0) : (tensor<4x2xf32>) -> tensor<4x2xsi32>
    "func.return"(%1) : (tensor<4x2xsi32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = () -> tensor<8xi1>, sym_name = "test_fold_binary_op_f32_to_i1"}> ({
    %0 = "arith.constant"() <{value = dense<5.100000e+00> : tensor<8xf32>}> : () -> tensor<8xf32>
    %1 = "arith.constant"() <{value = dense<4.200000e+00> : tensor<8xf32>}> : () -> tensor<8xf32>
    %2 = "test.less_than"(%0, %1) : (tensor<8xf32>, tensor<8xf32>) -> tensor<8xi1>
    "func.return"(%2) : (tensor<8xi1>) -> ()
  }) : () -> ()
}) : () -> ()

