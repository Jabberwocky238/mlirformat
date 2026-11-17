"builtin.module"() ({
  "tosa.variable"() <{initial_value = dense<7.000000e+00> : tensor<1xf32>, sym_name = "var_x", type = f32, var_shape = dense<1> : tensor<1xindex>}> : () -> () loc("<stdin>":2:3)
  "func.func"() <{function_type = (tensor<1xf32>) -> tensor<1xf32>, sym_name = "test_stateful_ops"}> ({
  ^bb0(%arg0: tensor<1xf32> loc("<stdin>":4:8)):
    "tosa.variable_write"(%arg0) <{name = "var_x"}> : (tensor<1xf32>) -> () loc("<stdin>":5:5)
    %0 = "tosa.variable_read"() <{name = "var_x"}> : () -> tensor<1xf32> loc("<stdin>":6:10)
    "func.return"(%0) : (tensor<1xf32>) -> () loc("<stdin>":7:5)
  }) : () -> () loc("<stdin>":3:3)
}) : () -> () loc("<stdin>":1:1)
