"builtin.module"() ({
  "func.func"() <{function_type = (tensor<13x27x3xi8>, tensor<13x26xi32>) -> tensor<13x26x3xi8>, sym_name = "test_gather_i8_i32"}> ({
  ^bb0(%arg0: tensor<13x27x3xi8>, %arg1: tensor<13x26xi32>):
    %0 = "tosa.gather"(%arg0, %arg1) : (tensor<13x27x3xi8>, tensor<13x26xi32>) -> tensor<13x26x3xi8>
    "func.return"(%0) : (tensor<13x26x3xi8>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<13x27x3xi8>, tensor<13x26xi32>, tensor<13x26x3xi8>) -> tensor<13x27x3xi8>, sym_name = "test_scatter_i8_i32"}> ({
  ^bb0(%arg0: tensor<13x27x3xi8>, %arg1: tensor<13x26xi32>, %arg2: tensor<13x26x3xi8>):
    %0 = "tosa.scatter"(%arg0, %arg1, %arg2) : (tensor<13x27x3xi8>, tensor<13x26xi32>, tensor<13x26x3xi8>) -> tensor<13x27x3xi8>
    "func.return"(%0) : (tensor<13x27x3xi8>) -> ()
  }) : () -> ()
}) : () -> ()

