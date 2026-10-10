"builtin.module"() ({
^bb0:
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<1xf64>) -> tensor<1xf64>, sym_name = "test_f64_identity_chain"}> ({
  ^bb0(%arg0: tensor<1xf64>):
    %0 = "tosa.identity"(%arg0) : (tensor<1xf64>) -> tensor<1xf64>
    %1 = "tosa.identity"(%0) : (tensor<1xf64>) -> tensor<1xf64>
    "func.return"(%1) : (tensor<1xf64>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = () -> tensor<2xf64>, sym_name = "test_f64_const"}> ({
    %0 = "tosa.const"() <{values = dense<[1.000000e+00, 2.000000e+00]> : tensor<2xf64>}> : () -> tensor<2xf64>
    "func.return"(%0) : (tensor<2xf64>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = () -> tensor<1xf64>, sym_name = "test_f64_const_precision_loss"}> ({
    %0 = "tosa.const"() <{values = dense<0x4170000010000000> : tensor<1xf64>}> : () -> tensor<1xf64>
    "func.return"(%0) : (tensor<1xf64>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = () -> tensor<1xf64>, sym_name = "test_f64_const_precision_loss_small"}> ({
    %0 = "tosa.const"() <{values = dense<1.000000e-46> : tensor<1xf64>}> : () -> tensor<1xf64>
    "func.return"(%0) : (tensor<1xf64>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<13x21x3xf64>, tensor<13x21x3xf64>) -> tensor<26x21x3xf64>, sym_name = "test_f64_concat"}> ({
  ^bb0(%arg0: tensor<13x21x3xf64>, %arg1: tensor<13x21x3xf64>):
    %0 = "tosa.concat"(%arg0, %arg1) <{axis = 0 : i32}> : (tensor<13x21x3xf64>, tensor<13x21x3xf64>) -> tensor<26x21x3xf64>
    "func.return"(%0) : (tensor<26x21x3xf64>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<13x21x3xf64>, tensor<1xf64>) -> tensor<15x23x5xf64>, sym_name = "test_f64_pad"}> ({
  ^bb0(%arg0: tensor<13x21x3xf64>, %arg1: tensor<1xf64>):
    %0 = "tosa.const_shape"() <{values = dense<1> : tensor<6xindex>}> : () -> !tosa.shape<6>
    %1 = "tosa.pad"(%arg0, %0, %arg1) : (tensor<13x21x3xf64>, !tosa.shape<6>, tensor<1xf64>) -> tensor<15x23x5xf64>
    "func.return"(%1) : (tensor<15x23x5xf64>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<13x21x3xf64>) -> tensor<1x819xf64>, sym_name = "test_f64_reshape"}> ({
  ^bb0(%arg0: tensor<13x21x3xf64>):
    %0 = "tosa.const_shape"() <{values = dense<[1, 819]> : tensor<2xindex>}> : () -> !tosa.shape<2>
    %1 = "tosa.reshape"(%arg0, %0) : (tensor<13x21x3xf64>, !tosa.shape<2>) -> tensor<1x819xf64>
    "func.return"(%1) : (tensor<1x819xf64>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<13x21x3xf64>) -> tensor<13x21x3xf64>, sym_name = "test_f64_reverse"}> ({
  ^bb0(%arg0: tensor<13x21x3xf64>):
    %0 = "tosa.reverse"(%arg0) <{axis = 0 : i32}> : (tensor<13x21x3xf64>) -> tensor<13x21x3xf64>
    "func.return"(%0) : (tensor<13x21x3xf64>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<13x21x3xf64>) -> tensor<4x11x1xf64>, sym_name = "test_f64_slice"}> ({
  ^bb0(%arg0: tensor<13x21x3xf64>):
    %0 = "tosa.const_shape"() <{values = dense<[4, 11, 1]> : tensor<3xindex>}> : () -> !tosa.shape<3>
    %1 = "tosa.const_shape"() <{values = dense<[6, 8, 0]> : tensor<3xindex>}> : () -> !tosa.shape<3>
    %2 = "tosa.slice"(%arg0, %0, %1) : (tensor<13x21x3xf64>, !tosa.shape<3>, !tosa.shape<3>) -> tensor<4x11x1xf64>
    "func.return"(%2) : (tensor<4x11x1xf64>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<13x21x3xf64>) -> tensor<39x21x6xf64>, sym_name = "test_f64_tile"}> ({
  ^bb0(%arg0: tensor<13x21x3xf64>):
    %0 = "tosa.const_shape"() <{values = dense<[3, 1, 2]> : tensor<3xindex>}> : () -> !tosa.shape<3>
    %1 = "tosa.tile"(%arg0, %0) : (tensor<13x21x3xf64>, !tosa.shape<3>) -> tensor<39x21x6xf64>
    "func.return"(%1) : (tensor<39x21x6xf64>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<13x21x3xf64>) -> tensor<3x13x21xf64>, sym_name = "test_f64_transpose"}> ({
  ^bb0(%arg0: tensor<13x21x3xf64>):
    %0 = "tosa.transpose"(%arg0) <{perms = array<i32: 2, 0, 1>}> : (tensor<13x21x3xf64>) -> tensor<3x13x21xf64>
    "func.return"(%0) : (tensor<3x13x21xf64>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<1xf64>, tensor<1xf64>, tensor<i1>) -> tensor<1xf64>, sym_name = "test_f64_regions"}> ({
  ^bb0(%arg0: tensor<1xf64>, %arg1: tensor<1xf64>, %arg2: tensor<i1>):
    %0 = "tosa.cond_if"(%arg2) ({
      %2 = "tosa.identity"(%arg0) : (tensor<1xf64>) -> tensor<1xf64>
      "tosa.yield"(%2) : (tensor<1xf64>) -> ()
    }, {
      %1 = "tosa.identity"(%arg1) : (tensor<1xf64>) -> tensor<1xf64>
      "tosa.yield"(%1) : (tensor<1xf64>) -> ()
    }) : (tensor<i1>) -> tensor<1xf64>
    "func.return"(%0) : (tensor<1xf64>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<13x21x1xf64>, tensor<13x21x3xf64>) -> tensor<13x21x3xf64>, sym_name = "test_f64_add_diagnostic"}> ({
  ^bb0(%arg0: tensor<13x21x1xf64>, %arg1: tensor<13x21x3xf64>):
    %0 = "tosa.add"(%arg0, %arg1) : (tensor<13x21x1xf64>, tensor<13x21x3xf64>) -> tensor<13x21x3xf64>
    "func.return"(%0) : (tensor<13x21x3xf64>) -> ()
  }) : () -> ()
}) : () -> ()

