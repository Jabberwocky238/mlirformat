"builtin.module"() ({
  "func.func"() <{function_type = (tensor<f32>, tensor<f32>) -> tensor<f32>, sym_name = "test_add_rank_valid"}> ({
  ^bb0(%arg0: tensor<f32>, %arg1: tensor<f32>):
    %0 = "tosa.add"(%arg0, %arg1) : (tensor<f32>, tensor<f32>) -> tensor<f32>
    "func.return"(%0) : (tensor<f32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<i32>) -> tensor<i32>, sym_name = "test_const_rank_valid"}> ({
  ^bb0(%arg0: tensor<i32>):
    %0 = "tosa.const"() <{values = dense<0> : tensor<i32>}> : () -> tensor<i32>
    "func.return"(%0) : (tensor<i32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<i32>) -> tensor<i32>, sym_name = "test_identity_rank_valid"}> ({
  ^bb0(%arg0: tensor<i32>):
    %0 = "tosa.identity"(%arg0) : (tensor<i32>) -> tensor<i32>
    "func.return"(%0) : (tensor<i32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<1x536870911xf32>) -> (), sym_name = "test_tensor_size_valid"}> ({
  ^bb0(%arg0: tensor<1x536870911xf32>):
    %0 = "tosa.const_shape"() <{values = dense<0> : tensor<2xindex>}> : () -> !tosa.shape<2>
    %1 = "tosa.const_shape"() <{values = dense<1> : tensor<2xindex>}> : () -> !tosa.shape<2>
    %2 = "tosa.slice"(%arg0, %0, %1) : (tensor<1x536870911xf32>, !tosa.shape<2>, !tosa.shape<2>) -> tensor<1x1xf32>
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "test_const_shape"}> ({
    %0 = "tosa.const_shape"() <{values = dense<[1, 1, 536870912, 1]> : tensor<4xindex>}> : () -> !tosa.shape<4>
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<1x1x1x1x1x1x1xf32>, tensor<1x1x1x1x1x1x1xf32>, tensor<i1>) -> tensor<1x1x1x1x1x1x1xf32>, sym_name = "test_cond_if_rank_valid"}> ({
  ^bb0(%arg0: tensor<1x1x1x1x1x1x1xf32>, %arg1: tensor<1x1x1x1x1x1x1xf32>, %arg2: tensor<i1>):
    %0 = "tosa.cond_if"(%arg2, %arg0, %arg1) ({
    ^bb0(%arg5: tensor<1x1x1x1x1x1x1xf32>, %arg6: tensor<1x1x1x1x1x1x1xf32>):
      "tosa.yield"(%arg5) : (tensor<1x1x1x1x1x1x1xf32>) -> ()
    }, {
    ^bb0(%arg3: tensor<1x1x1x1x1x1x1xf32>, %arg4: tensor<1x1x1x1x1x1x1xf32>):
      "tosa.yield"(%arg4) : (tensor<1x1x1x1x1x1x1xf32>) -> ()
    }) : (tensor<i1>, tensor<1x1x1x1x1x1x1xf32>, tensor<1x1x1x1x1x1x1xf32>) -> tensor<1x1x1x1x1x1x1xf32>
    "func.return"(%0) : (tensor<1x1x1x1x1x1x1xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<1x1x1x1x1x1x1xf32>, tensor<i32>) -> (), sym_name = "test_while_loop"}> ({
  ^bb0(%arg0: tensor<1x1x1x1x1x1x1xf32>, %arg1: tensor<i32>):
    %0 = "tosa.const"() <{values = dense<0> : tensor<i32>}> : () -> tensor<i32>
    %1:2 = "tosa.while_loop"(%0, %arg0) ({
    ^bb0(%arg4: tensor<i32>, %arg5: tensor<1x1x1x1x1x1x1xf32>):
      %4 = "tosa.greater_equal"(%arg4, %arg1) : (tensor<i32>, tensor<i32>) -> tensor<i1>
      %5 = "tosa.logical_not"(%4) : (tensor<i1>) -> tensor<i1>
      "tosa.yield"(%5) : (tensor<i1>) -> ()
    }, {
    ^bb0(%arg2: tensor<i32>, %arg3: tensor<1x1x1x1x1x1x1xf32>):
      %2 = "tosa.const"() <{values = dense<1> : tensor<i32>}> : () -> tensor<i32>
      %3 = "tosa.add"(%arg2, %2) : (tensor<i32>, tensor<i32>) -> tensor<i32>
      "tosa.yield"(%3, %arg3) : (tensor<i32>, tensor<1x1x1x1x1x1x1xf32>) -> ()
    }) : (tensor<i32>, tensor<1x1x1x1x1x1x1xf32>) -> (tensor<i32>, tensor<1x1x1x1x1x1x1xf32>)
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<1x1x1x1x1x1x10xi32>) -> tensor<1x1x1x1x1x1x10xi32>, sym_name = "test_custom_rank_valid"}> ({
  ^bb0(%arg0: tensor<1x1x1x1x1x1x10xi32>):
    %0 = "tosa.custom"(%arg0) <{domain_name = "tosa_mlir_test", implementation_attrs = "", operator_name = "custom_test"}> : (tensor<1x1x1x1x1x1x10xi32>) -> tensor<1x1x1x1x1x1x10xi32>
    "func.return"(%0) : (tensor<1x1x1x1x1x1x10xi32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<1x536870911xf32>) -> (), sym_name = "test_tensor_size_ok"}> ({
  ^bb0(%arg0: tensor<1x536870911xf32>):
    %0 = "tosa.const_shape"() <{values = dense<0> : tensor<2xindex>}> : () -> !tosa.shape<2>
    %1 = "tosa.const_shape"() <{values = dense<1> : tensor<2xindex>}> : () -> !tosa.shape<2>
    %2 = "tosa.slice"(%arg0, %0, %1) : (tensor<1x536870911xf32>, !tosa.shape<2>, !tosa.shape<2>) -> tensor<1x1xf32>
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

