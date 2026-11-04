"builtin.module"() ({
  "func.func"() <{function_type = (tensor<f32>, f32) -> (), sym_name = "correct_variadic_operand"}> ({
  ^bb0(%arg0: tensor<f32>, %arg1: f32):
    "test.mixed_normal_variadic_operand"(%arg0, %arg0, %arg0, %arg0, %arg0) : (tensor<f32>, tensor<f32>, tensor<f32>, tensor<f32>, tensor<f32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
// -----
// -----
// -----
