"builtin.module"() ({
^bb0:
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<f32>, tensor<f32>, tensor<i1>) -> tensor<f32>, sym_name = "condif_cond_type_check"}> ({
  ^bb0(%arg0: tensor<f32>, %arg1: tensor<f32>, %arg2: tensor<i1>):
    %0 = "tosa.cond_if"(%arg2) ({
      %2 = "tosa.add"(%arg0, %arg1) : (tensor<f32>, tensor<f32>) -> tensor<f32>
      "tosa.yield"(%2) : (tensor<f32>) -> ()
    }, {
      %1 = "tosa.sub"(%arg0, %arg1) : (tensor<f32>, tensor<f32>) -> tensor<f32>
      "tosa.yield"(%1) : (tensor<f32>) -> ()
    }) : (tensor<i1>) -> tensor<f32>
    "func.return"(%0) : (tensor<f32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<f32>, tensor<f32>, tensor<i1>) -> tensor<f32>, sym_name = "condif_block_args_check"}> ({
  ^bb0(%arg0: tensor<f32>, %arg1: tensor<f32>, %arg2: tensor<i1>):
    %0 = "tosa.cond_if"(%arg2, %arg0, %arg1) ({
    ^bb0(%arg5: tensor<f32>, %arg6: tensor<f32>):
      %2 = "tosa.add"(%arg5, %arg6) : (tensor<f32>, tensor<f32>) -> tensor<f32>
      "tosa.yield"(%2) : (tensor<f32>) -> ()
    }, {
    ^bb0(%arg3: tensor<f32>, %arg4: tensor<f32>):
      %1 = "tosa.sub"(%arg3, %arg4) : (tensor<f32>, tensor<f32>) -> tensor<f32>
      "tosa.yield"(%1) : (tensor<f32>) -> ()
    }) : (tensor<i1>, tensor<f32>, tensor<f32>) -> tensor<f32>
    "func.return"(%0) : (tensor<f32>) -> ()
  }) : () -> ()
}) : () -> ()

