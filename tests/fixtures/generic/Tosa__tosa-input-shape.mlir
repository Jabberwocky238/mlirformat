"builtin.module"() ({
  "func.func"() <{function_type = (tensor<2x?xi32>, tensor<?x256xf32>, tensor<?x9xf32>) -> (tensor<2x?xi32>, tensor<?x256xf32>, tensor<?x9xf32>), sym_name = "test_empty_func"}> ({
  ^bb0(%arg0: tensor<2x?xi32>, %arg1: tensor<?x256xf32>, %arg2: tensor<?x9xf32>):
    "func.return"(%arg0, %arg1, %arg2) : (tensor<2x?xi32>, tensor<?x256xf32>, tensor<?x9xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<2x?xi32>, tensor<?x256xf32>, tensor<?x9xf32>) -> (tensor<2x?xi32>, tensor<?x256xf32>, tensor<?x9xf32>), sym_name = "test_func_with_ops"}> ({
  ^bb0(%arg0: tensor<2x?xi32>, %arg1: tensor<?x256xf32>, %arg2: tensor<?x9xf32>):
    %0 = "tosa.add"(%arg0, %arg0) : (tensor<2x?xi32>, tensor<2x?xi32>) -> tensor<2x?xi32>
    %1 = "tosa.reciprocal"(%arg1) : (tensor<?x256xf32>) -> tensor<?x256xf32>
    %2 = "tosa.sub"(%arg2, %arg2) : (tensor<?x9xf32>, tensor<?x9xf32>) -> tensor<?x9xf32>
    "func.return"(%0, %1, %2) : (tensor<2x?xi32>, tensor<?x256xf32>, tensor<?x9xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<2x?xi32>, tensor<?x256xf32>, tensor<?x9xf32>, tensor<i1>) -> (tensor<2x?xi32>, tensor<?x256xf32>, tensor<?x9xf32>), sym_name = "test_controlflow"}> ({
  ^bb0(%arg0: tensor<2x?xi32>, %arg1: tensor<?x256xf32>, %arg2: tensor<?x9xf32>, %arg3: tensor<i1>):
    %0:3 = "tosa.cond_if"(%arg3, %arg0, %arg1, %arg2) ({
    ^bb0(%arg7: tensor<2x?xi32>, %arg8: tensor<?x256xf32>, %arg9: tensor<?x9xf32>):
      "tosa.yield"(%arg7, %arg8, %arg9) : (tensor<2x?xi32>, tensor<?x256xf32>, tensor<?x9xf32>) -> ()
    }, {
    ^bb0(%arg4: tensor<2x?xi32>, %arg5: tensor<?x256xf32>, %arg6: tensor<?x9xf32>):
      "tosa.yield"(%arg4, %arg5, %arg6) : (tensor<2x?xi32>, tensor<?x256xf32>, tensor<?x9xf32>) -> ()
    }) : (tensor<i1>, tensor<2x?xi32>, tensor<?x256xf32>, tensor<?x9xf32>) -> (tensor<2x?xi32>, tensor<?x256xf32>, tensor<?x9xf32>)
    "func.return"(%0#0, %0#1, %0#2) : (tensor<2x?xi32>, tensor<?x256xf32>, tensor<?x9xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<2x?xi32>, f32, tensor<?x9xi32>) -> tensor<?x256xf32>, sym_name = "test_func_decl", sym_visibility = "private"}> ({
  }) : () -> ()
}) : () -> ()

