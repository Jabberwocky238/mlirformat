"builtin.module"() ({
  "func.func"() <{function_type = (tensor<f32>, tensor<f32>, tensor<i1>) -> tensor<f32>, sym_name = "inlined_if_fn"}> ({
  ^bb0(%arg4: tensor<f32>, %arg5: tensor<f32>, %arg6: tensor<i1>):
    %2 = "tosa.cond_if"(%arg6, %arg4, %arg5) ({
    ^bb0(%arg9: tensor<f32>, %arg10: tensor<f32>):
      %4 = "func.call"(%arg9, %arg10) <{callee = @add}> : (tensor<f32>, tensor<f32>) -> tensor<f32>
      "tosa.yield"(%4) : (tensor<f32>) -> ()
    }, {
    ^bb0(%arg7: tensor<f32>, %arg8: tensor<f32>):
      %3 = "func.call"(%arg7, %arg8) <{callee = @sub}> : (tensor<f32>, tensor<f32>) -> tensor<f32>
      "tosa.yield"(%3) : (tensor<f32>) -> ()
    }) : (tensor<i1>, tensor<f32>, tensor<f32>) -> tensor<f32>
    "func.return"(%2) : (tensor<f32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<f32>, tensor<f32>) -> tensor<f32>, sym_name = "add", sym_visibility = "private"}> ({
  ^bb0(%arg2: tensor<f32>, %arg3: tensor<f32>):
    %1 = "tosa.add"(%arg2, %arg3) : (tensor<f32>, tensor<f32>) -> tensor<f32>
    "func.return"(%1) : (tensor<f32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<f32>, tensor<f32>) -> tensor<f32>, sym_name = "sub", sym_visibility = "private"}> ({
  ^bb0(%arg0: tensor<f32>, %arg1: tensor<f32>):
    %0 = "tosa.sub"(%arg0, %arg1) : (tensor<f32>, tensor<f32>) -> tensor<f32>
    "func.return"(%0) : (tensor<f32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<i32>, tensor<i32>, tensor<i32>, tensor<10xi32>) -> tensor<10xi32>, sym_name = "inlined_while_fn"}> ({
  ^bb0(%arg8: tensor<i32>, %arg9: tensor<i32>, %arg10: tensor<i32>, %arg11: tensor<10xi32>):
    %6:4 = "tosa.while_loop"(%arg8, %arg9, %arg10, %arg11) ({
    ^bb0(%arg16: tensor<i32>, %arg17: tensor<i32>, %arg18: tensor<i32>, %arg19: tensor<10xi32>):
      %8 = "func.call"(%arg16, %arg17, %arg18, %arg19) <{callee = @while_cond_40}> : (tensor<i32>, tensor<i32>, tensor<i32>, tensor<10xi32>) -> tensor<i1>
      "tosa.yield"(%8) : (tensor<i1>) -> ()
    }, {
    ^bb0(%arg12: tensor<i32>, %arg13: tensor<i32>, %arg14: tensor<i32>, %arg15: tensor<10xi32>):
      %7:4 = "func.call"(%arg12, %arg13, %arg14, %arg15) <{callee = @while_body_50}> : (tensor<i32>, tensor<i32>, tensor<i32>, tensor<10xi32>) -> (tensor<i32>, tensor<i32>, tensor<i32>, tensor<10xi32>)
      "tosa.yield"(%7#0, %7#1, %7#2, %7#3) : (tensor<i32>, tensor<i32>, tensor<i32>, tensor<10xi32>) -> ()
    }) : (tensor<i32>, tensor<i32>, tensor<i32>, tensor<10xi32>) -> (tensor<i32>, tensor<i32>, tensor<i32>, tensor<10xi32>)
    "func.return"(%6#3) : (tensor<10xi32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<i32>, tensor<i32>, tensor<i32>, tensor<10xi32>) -> (tensor<i32>, tensor<i32>, tensor<i32>, tensor<10xi32>), sym_name = "while_body_50", sym_visibility = "private"}> ({
  ^bb0(%arg4: tensor<i32>, %arg5: tensor<i32>, %arg6: tensor<i32>, %arg7: tensor<10xi32>):
    %2 = "tosa.add"(%arg4, %arg5) : (tensor<i32>, tensor<i32>) -> tensor<i32>
    %3 = "tosa.const_shape"() <{values = dense<1> : tensor<1xindex>}> : () -> !tosa.shape<1>
    %4 = "tosa.reshape"(%2, %3) : (tensor<i32>, !tosa.shape<1>) -> tensor<1xi32>
    %5 = "tosa.add"(%arg7, %4) : (tensor<10xi32>, tensor<1xi32>) -> tensor<10xi32>
    "func.return"(%2, %arg5, %arg6, %5) : (tensor<i32>, tensor<i32>, tensor<i32>, tensor<10xi32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<i32>, tensor<i32>, tensor<i32>, tensor<10xi32>) -> tensor<i1>, sym_name = "while_cond_40", sym_visibility = "private"}> ({
  ^bb0(%arg0: tensor<i32>, %arg1: tensor<i32>, %arg2: tensor<i32>, %arg3: tensor<10xi32>):
    %0 = "tosa.greater_equal"(%arg0, %arg1) : (tensor<i32>, tensor<i32>) -> tensor<i1>
    %1 = "tosa.logical_not"(%0) : (tensor<i1>) -> tensor<i1>
    "func.return"(%1) : (tensor<i1>) -> ()
  }) : () -> ()
}) : () -> ()

