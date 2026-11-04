"builtin.module"() ({
  "func.func"() <{function_type = () -> tensor<f32>, sym_name = "correct_variadic_result"}> ({
    %0:5 = "test.mixed_normal_variadic_result"() : () -> (tensor<f32>, tensor<f32>, tensor<f32>, tensor<f32>, tensor<f32>)
    "func.return"(%0#4) : (tensor<f32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
// -----
// -----
