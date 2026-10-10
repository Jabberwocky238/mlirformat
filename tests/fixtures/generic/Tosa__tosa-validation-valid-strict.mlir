"builtin.module"() ({
^bb0:
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<f32>, tensor<f32>, tensor<i1>) -> tensor<f32>, sym_name = "test_cond_if_isolated_from_above"}> ({
  ^bb0(%arg0: tensor<f32>, %arg1: tensor<f32>, %arg2: tensor<i1>):
    %0 = "tosa.cond_if"(%arg2, %arg0, %arg1) ({
    ^bb0(%arg5: tensor<f32>, %arg6: tensor<f32>):
      "tosa.yield"(%arg5) : (tensor<f32>) -> ()
    }, {
    ^bb0(%arg3: tensor<f32>, %arg4: tensor<f32>):
      "tosa.yield"(%arg4) : (tensor<f32>) -> ()
    }) : (tensor<i1>, tensor<f32>, tensor<f32>) -> tensor<f32>
    "func.return"(%0) : (tensor<f32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<f32>, tensor<i32>) -> (), sym_name = "test_while_loop_isolated_from_above"}> ({
  ^bb0(%arg0: tensor<f32>, %arg1: tensor<i32>):
    %0 = "tosa.const"() <{values = dense<0> : tensor<i32>}> : () -> tensor<i32>
    %1:3 = "tosa.while_loop"(%0, %arg0, %arg1) ({
    ^bb0(%arg5: tensor<i32>, %arg6: tensor<f32>, %arg7: tensor<i32>):
      %4 = "tosa.greater_equal"(%arg5, %arg7) : (tensor<i32>, tensor<i32>) -> tensor<i1>
      %5 = "tosa.logical_not"(%4) : (tensor<i1>) -> tensor<i1>
      "tosa.yield"(%5) : (tensor<i1>) -> ()
    }, {
    ^bb0(%arg2: tensor<i32>, %arg3: tensor<f32>, %arg4: tensor<i32>):
      %2 = "tosa.const"() <{values = dense<1> : tensor<i32>}> : () -> tensor<i32>
      %3 = "tosa.add"(%arg2, %2) : (tensor<i32>, tensor<i32>) -> tensor<i32>
      "tosa.yield"(%3, %arg3, %arg4) : (tensor<i32>, tensor<f32>, tensor<i32>) -> ()
    }) : (tensor<i32>, tensor<f32>, tensor<i32>) -> (tensor<i32>, tensor<f32>, tensor<i32>)
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

