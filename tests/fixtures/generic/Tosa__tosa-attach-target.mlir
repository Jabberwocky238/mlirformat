"builtin.module"() ({
^bb0:
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<1x1x1x1xf32>, tensor<1x1x1x1xf32>) -> tensor<1x1x1x1xf32>, sym_name = "test_simple"}> ({
  ^bb0(%arg0: tensor<1x1x1x1xf32>, %arg1: tensor<1x1x1x1xf32>):
    %0 = "tosa.add"(%arg0, %arg1) : (tensor<1x1x1x1xf32>, tensor<1x1x1x1xf32>) -> tensor<1x1x1x1xf32>
    "func.return"(%0) : (tensor<1x1x1x1xf32>) -> ()
  }) : () -> ()
}) : () -> ()

