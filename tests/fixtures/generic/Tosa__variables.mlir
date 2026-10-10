"builtin.module"() ({
^bb0:
}) : () -> ()

// -----
"builtin.module"() ({
  "tosa.variable"() <{initial_value = dense<3.140000e+00> : tensor<f32>, sym_name = "stored_var", type = f32, var_shape = dense<> : tensor<0xindex>}> : () -> ()
  "func.func"() <{function_type = (tensor<f32>) -> (), sym_name = "test_variable_scalar"}> ({
  ^bb0(%arg0: tensor<f32>):
    %0 = "tosa.variable_read"() <{name = "stored_var"}> : () -> tensor<f32>
    %1 = "tosa.add"(%arg0, %0) : (tensor<f32>, tensor<f32>) -> tensor<f32>
    "tosa.variable_write"(%1) <{name = "stored_var"}> : (tensor<f32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "tosa.variable"() <{initial_value = dense<-1> : tensor<2x4x8xi32>, sym_name = "stored_var", type = i32, var_shape = dense<[2, 4, 8]> : tensor<3xindex>}> : () -> ()
  "func.func"() <{function_type = (tensor<2x4x8xi32>) -> (), sym_name = "test_variable_tensor"}> ({
  ^bb0(%arg0: tensor<2x4x8xi32>):
    %0 = "tosa.variable_read"() <{name = "stored_var"}> : () -> tensor<2x4x8xi32>
    %1 = "tosa.add"(%arg0, %0) : (tensor<2x4x8xi32>, tensor<2x4x8xi32>) -> tensor<2x4x8xi32>
    "tosa.variable_write"(%1) <{name = "stored_var"}> : (tensor<2x4x8xi32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "tosa.variable"() <{sym_name = "stored_var", type = f32, var_shape = dense<> : tensor<0xindex>}> : () -> ()
  "func.func"() <{function_type = (tensor<f32>) -> (), sym_name = "test_variable_scalar_no_initial_value"}> ({
  ^bb0(%arg0: tensor<f32>):
    %0 = "tosa.variable_read"() <{name = "stored_var"}> : () -> tensor<f32>
    %1 = "tosa.add"(%arg0, %0) : (tensor<f32>, tensor<f32>) -> tensor<f32>
    "tosa.variable_write"(%1) <{name = "stored_var"}> : (tensor<f32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "tosa.variable"() <{sym_name = "stored_var", type = i32, var_shape = dense<[2, 4, 8]> : tensor<3xindex>}> : () -> ()
  "func.func"() <{function_type = (tensor<2x4x8xi32>) -> (), sym_name = "test_variable_tensor_no_initial_value"}> ({
  ^bb0(%arg0: tensor<2x4x8xi32>):
    %0 = "tosa.variable_read"() <{name = "stored_var"}> : () -> tensor<2x4x8xi32>
    %1 = "tosa.add"(%arg0, %0) : (tensor<2x4x8xi32>, tensor<2x4x8xi32>) -> tensor<2x4x8xi32>
    "tosa.variable_write"(%1) <{name = "stored_var"}> : (tensor<2x4x8xi32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "tosa.variable"() <{sym_name = "stored_var", type = i32, var_shape = dense<[2, -1, 8]> : tensor<3xindex>}> : () -> ()
  "func.func"() <{function_type = (tensor<2x4x8xi32>) -> (), sym_name = "test_variable_tensor_with_unknowns"}> ({
  ^bb0(%arg0: tensor<2x4x8xi32>):
    %0 = "tosa.variable_read"() <{name = "stored_var"}> : () -> tensor<2x4x8xi32>
    %1 = "tosa.add"(%arg0, %0) : (tensor<2x4x8xi32>, tensor<2x4x8xi32>) -> tensor<2x4x8xi32>
    "tosa.variable_write"(%1) <{name = "stored_var"}> : (tensor<2x4x8xi32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

