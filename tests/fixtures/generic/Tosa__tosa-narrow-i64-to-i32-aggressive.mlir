"builtin.module"() ({
  "func.func"() <{function_type = (tensor<1x513x513x2147483650xi8>) -> tensor<1x513x513xi64>, sym_name = "test_i64_argmax_large_axis_dim"}> ({
  ^bb0(%arg0: tensor<1x513x513x2147483650xi8>):
    %0 = "tosa.argmax"(%arg0) <{axis = 3 : i32, nan_mode = #tosa.nan_mode<PROPAGATE>}> : (tensor<1x513x513x2147483650xi8>) -> tensor<1x513x513xi64>
    "func.return"(%0) : (tensor<1x513x513xi64>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<1x513x513x3xi64>) -> tensor<1x513x513x3xf32>, sym_name = "test_convert_input_parameters"}> ({
  ^bb0(%arg0: tensor<1x513x513x3xi64>):
    %0 = "tosa.cast"(%arg0) : (tensor<1x513x513x3xi64>) -> tensor<1x513x513x3xi32>
    %1 = "tosa.cast"(%0) : (tensor<1x513x513x3xi32>) -> tensor<1x513x513x3xf32>
    "func.return"(%1) : (tensor<1x513x513x3xf32>) -> ()
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
  "func.func"() <{function_type = (tensor<i64>, tensor<i64>, tensor<i1>) -> tensor<i64>, sym_name = "test_regions"}> ({
  ^bb0(%arg0: tensor<i64>, %arg1: tensor<i64>, %arg2: tensor<i1>):
    %0 = "tosa.cond_if"(%arg2) ({
      %2 = "tosa.add"(%arg0, %arg1) : (tensor<i64>, tensor<i64>) -> tensor<i64>
      "tosa.yield"(%2) : (tensor<i64>) -> ()
    }, {
      %1 = "tosa.sub"(%arg0, %arg1) : (tensor<i64>, tensor<i64>) -> tensor<i64>
      "tosa.yield"(%1) : (tensor<i64>) -> ()
    }) : (tensor<i1>) -> tensor<i64>
    "func.return"(%0) : (tensor<i64>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = () -> tensor<2xi64>, sym_name = "test_const"}> ({
    %0 = "tosa.const"() <{values = dense<[1, 2]> : tensor<2xi64>}> : () -> tensor<2xi64>
    "func.return"(%0) : (tensor<2xi64>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<100xi64>) -> tensor<100xi64>, sym_name = "test_clamp_trunc"}> ({
  ^bb0(%arg0: tensor<100xi64>):
    %0 = "tosa.clamp"(%arg0) <{max_val = 3000000000 : i64, min_val = -2147483648 : i64, nan_mode = #tosa.nan_mode<PROPAGATE>}> : (tensor<100xi64>) -> tensor<100xi64>
    "func.return"(%0) : (tensor<100xi64>) -> ()
  }) : () -> ()
}) : () -> ()

