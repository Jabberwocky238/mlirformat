"builtin.module"() ({
^bb0:
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<13x21x1xf64>, tensor<13x21x3xf64>) -> tensor<13x21x3xf64>, sym_name = "test_f64_add"}> ({
  ^bb0(%arg0: tensor<13x21x1xf64>, %arg1: tensor<13x21x3xf64>):
    %0 = "tosa.add"(%arg0, %arg1) : (tensor<13x21x1xf64>, tensor<13x21x3xf64>) -> tensor<13x21x3xf64>
    "func.return"(%0) : (tensor<13x21x3xf64>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<1xf64>, tensor<1xf64>, tensor<i1>) -> tensor<1xf64>, sym_name = "test_f64_regions"}> ({
  ^bb0(%arg0: tensor<1xf64>, %arg1: tensor<1xf64>, %arg2: tensor<i1>):
    %0 = "tosa.cond_if"(%arg2) ({
      %2 = "tosa.add"(%arg0, %arg1) : (tensor<1xf64>, tensor<1xf64>) -> tensor<1xf64>
      "tosa.yield"(%2) : (tensor<1xf64>) -> ()
    }, {
      %1 = "tosa.sub"(%arg0, %arg1) : (tensor<1xf64>, tensor<1xf64>) -> tensor<1xf64>
      "tosa.yield"(%1) : (tensor<1xf64>) -> ()
    }) : (tensor<i1>) -> tensor<1xf64>
    "func.return"(%0) : (tensor<1xf64>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<1x3xf64>) -> tensor<1x3xf32>, sym_name = "test_convert_input_parameters"}> ({
  ^bb0(%arg0: tensor<1x3xf64>):
    %0 = "tosa.identity"(%arg0) : (tensor<1x3xf64>) -> tensor<1x3xf64>
    %1 = "tosa.cast"(%0) : (tensor<1x3xf64>) -> tensor<1x3xf32>
    "func.return"(%1) : (tensor<1x3xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = () -> tensor<2xf64>, sym_name = "test_f64_const"}> ({
    %0 = "tosa.const"() <{values = dense<[1.000000e+00, 2.000000e+00]> : tensor<2xf64>}> : () -> tensor<2xf64>
    "func.return"(%0) : (tensor<2xf64>) -> ()
  }) : () -> ()
}) : () -> ()

