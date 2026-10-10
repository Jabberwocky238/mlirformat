"builtin.module"() ({
^bb0:
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<1x513x513x19xi8>) -> tensor<1x513x513xi64>, sym_name = "test_i64_argmax"}> ({
  ^bb0(%arg0: tensor<1x513x513x19xi8>):
    %0 = "tosa.argmax"(%arg0) <{axis = 3 : i32, nan_mode = #tosa.nan_mode<PROPAGATE>}> : (tensor<1x513x513x19xi8>) -> tensor<1x513x513xi64>
    "func.return"(%0) : (tensor<1x513x513xi64>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = () -> tensor<2xi64>, sym_name = "test_i64_const"}> ({
    %0 = "tosa.const"() <{values = dense<[1, 2]> : tensor<2xi64>}> : () -> tensor<2xi64>
    "func.return"(%0) : (tensor<2xi64>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<1x513x513x19xi8>) -> tensor<1x513x513xf32>, sym_name = "test_i64_argmax_cast"}> ({
  ^bb0(%arg0: tensor<1x513x513x19xi8>):
    %0 = "tosa.argmax"(%arg0) <{axis = 3 : i32, nan_mode = #tosa.nan_mode<PROPAGATE>}> : (tensor<1x513x513x19xi8>) -> tensor<1x513x513xi64>
    %1 = "tosa.cast"(%0) : (tensor<1x513x513xi64>) -> tensor<1x513x513xf32>
    "func.return"(%1) : (tensor<1x513x513xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<1x513x513x2147483650xi8>) -> tensor<1x513x513xi64>, sym_name = "test_i64_argmax_large_axis_dim"}> ({
  ^bb0(%arg0: tensor<1x513x513x2147483650xi8>):
    %0 = "tosa.argmax"(%arg0) <{axis = 3 : i32, nan_mode = #tosa.nan_mode<PROPAGATE>}> : (tensor<1x513x513x2147483650xi8>) -> tensor<1x513x513xi64>
    "func.return"(%0) : (tensor<1x513x513xi64>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<13x21x1xi64>, tensor<13x21x3xi64>) -> tensor<13x21x3xi64>, sym_name = "test_add"}> ({
  ^bb0(%arg0: tensor<13x21x1xi64>, %arg1: tensor<13x21x3xi64>):
    %0 = "tosa.add"(%arg0, %arg1) : (tensor<13x21x1xi64>, tensor<13x21x3xi64>) -> tensor<13x21x3xi64>
    "func.return"(%0) : (tensor<13x21x3xi64>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<1x2xi32>, tensor<1xi32>, tensor<i1>) -> tensor<1xi32>, sym_name = "test_regions"}> ({
  ^bb0(%arg0: tensor<1x2xi32>, %arg1: tensor<1xi32>, %arg2: tensor<i1>):
    %0 = "tosa.cond_if"(%arg2) ({
      %1 = "tosa.argmax"(%arg0) <{axis = 1 : i32, nan_mode = #tosa.nan_mode<PROPAGATE>}> : (tensor<1x2xi32>) -> tensor<1xi64>
      %2 = "tosa.cast"(%1) : (tensor<1xi64>) -> tensor<1xi32>
      "tosa.yield"(%2) : (tensor<1xi32>) -> ()
    }, {
      "tosa.yield"(%arg1) : (tensor<1xi32>) -> ()
    }) : (tensor<i1>) -> tensor<1xi32>
    "func.return"(%0) : (tensor<1xi32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<13x21x3xi64>, tensor<13x21x3xi64>) -> tensor<26x21x3xi64>, sym_name = "test_concat"}> ({
  ^bb0(%arg0: tensor<13x21x3xi64>, %arg1: tensor<13x21x3xi64>):
    %0 = "tosa.concat"(%arg0, %arg1) <{axis = 0 : i32}> : (tensor<13x21x3xi64>, tensor<13x21x3xi64>) -> tensor<26x21x3xi64>
    "func.return"(%0) : (tensor<26x21x3xi64>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<13x21x3xi64>, tensor<1xi64>) -> tensor<15x23x5xi64>, sym_name = "test_pad"}> ({
  ^bb0(%arg0: tensor<13x21x3xi64>, %arg1: tensor<1xi64>):
    %0 = "tosa.const_shape"() <{values = dense<1> : tensor<6xindex>}> : () -> !tosa.shape<6>
    %1 = "tosa.pad"(%arg0, %0, %arg1) : (tensor<13x21x3xi64>, !tosa.shape<6>, tensor<1xi64>) -> tensor<15x23x5xi64>
    "func.return"(%1) : (tensor<15x23x5xi64>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<13x21x3xi64>) -> tensor<1x819xi64>, sym_name = "test_reshape"}> ({
  ^bb0(%arg0: tensor<13x21x3xi64>):
    %0 = "tosa.const_shape"() <{values = dense<[1, 819]> : tensor<2xindex>}> : () -> !tosa.shape<2>
    %1 = "tosa.reshape"(%arg0, %0) : (tensor<13x21x3xi64>, !tosa.shape<2>) -> tensor<1x819xi64>
    "func.return"(%1) : (tensor<1x819xi64>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<13x21x3xi64>) -> tensor<13x21x3xi64>, sym_name = "test_reverse"}> ({
  ^bb0(%arg0: tensor<13x21x3xi64>):
    %0 = "tosa.reverse"(%arg0) <{axis = 0 : i32}> : (tensor<13x21x3xi64>) -> tensor<13x21x3xi64>
    "func.return"(%0) : (tensor<13x21x3xi64>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<13x21x3xi64>) -> tensor<4x11x1xi64>, sym_name = "test_slice"}> ({
  ^bb0(%arg0: tensor<13x21x3xi64>):
    %0 = "tosa.const_shape"() <{values = dense<[4, 11, 1]> : tensor<3xindex>}> : () -> !tosa.shape<3>
    %1 = "tosa.const_shape"() <{values = dense<[6, 8, 0]> : tensor<3xindex>}> : () -> !tosa.shape<3>
    %2 = "tosa.slice"(%arg0, %0, %1) : (tensor<13x21x3xi64>, !tosa.shape<3>, !tosa.shape<3>) -> tensor<4x11x1xi64>
    "func.return"(%2) : (tensor<4x11x1xi64>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<13x21x3xi64>) -> tensor<39x21x6xi64>, sym_name = "test_tile"}> ({
  ^bb0(%arg0: tensor<13x21x3xi64>):
    %0 = "tosa.const_shape"() <{values = dense<[3, 1, 2]> : tensor<3xindex>}> : () -> !tosa.shape<3>
    %1 = "tosa.tile"(%arg0, %0) : (tensor<13x21x3xi64>, !tosa.shape<3>) -> tensor<39x21x6xi64>
    "func.return"(%1) : (tensor<39x21x6xi64>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<13x21x3xi64>) -> tensor<3x13x21xi64>, sym_name = "test_transpose"}> ({
  ^bb0(%arg0: tensor<13x21x3xi64>):
    %0 = "tosa.transpose"(%arg0) <{perms = array<i32: 2, 0, 1>}> : (tensor<13x21x3xi64>) -> tensor<3x13x21xi64>
    "func.return"(%0) : (tensor<3x13x21xi64>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<1xi32>) -> tensor<1xi64>, sym_name = "test_transition_to_i64"}> ({
  ^bb0(%arg0: tensor<1xi32>):
    %0 = "tosa.cast"(%arg0) : (tensor<1xi32>) -> tensor<1xi64>
    %1 = "tosa.identity"(%0) : (tensor<1xi64>) -> tensor<1xi64>
    %2 = "tosa.identity"(%1) : (tensor<1xi64>) -> tensor<1xi64>
    "func.return"(%2) : (tensor<1xi64>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<1xi64>) -> tensor<1xi32>, sym_name = "test_transition_from_i64"}> ({
  ^bb0(%arg0: tensor<1xi64>):
    %0 = "tosa.identity"(%arg0) : (tensor<1xi64>) -> tensor<1xi64>
    %1 = "tosa.identity"(%0) : (tensor<1xi64>) -> tensor<1xi64>
    %2 = "tosa.cast"(%1) : (tensor<1xi64>) -> tensor<1xi32>
    "func.return"(%2) : (tensor<1xi32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<100xi64>) -> tensor<100xi64>, sym_name = "test_clamp"}> ({
  ^bb0(%arg0: tensor<100xi64>):
    %0 = "tosa.clamp"(%arg0) <{max_val = 2147483647 : i64, min_val = -2147483648 : i64, nan_mode = #tosa.nan_mode<PROPAGATE>}> : (tensor<100xi64>) -> tensor<100xi64>
    "func.return"(%0) : (tensor<100xi64>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<100xi64>) -> tensor<100xi64>, sym_name = "test_clamp_max_outside_i32_range"}> ({
  ^bb0(%arg0: tensor<100xi64>):
    %0 = "tosa.clamp"(%arg0) <{max_val = 2147483648 : i64, min_val = -2147483648 : i64, nan_mode = #tosa.nan_mode<PROPAGATE>}> : (tensor<100xi64>) -> tensor<100xi64>
    "func.return"(%0) : (tensor<100xi64>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<100xi64>) -> tensor<100xi64>, sym_name = "test_clamp_min_outside_i32_range"}> ({
  ^bb0(%arg0: tensor<100xi64>):
    %0 = "tosa.clamp"(%arg0) <{max_val = 2147483647 : i64, min_val = -2147483649 : i64, nan_mode = #tosa.nan_mode<PROPAGATE>}> : (tensor<100xi64>) -> tensor<100xi64>
    "func.return"(%0) : (tensor<100xi64>) -> ()
  }) : () -> ()
}) : () -> ()

