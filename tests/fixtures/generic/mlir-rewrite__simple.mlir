"builtin.module"() ({
  "func.func"() <{function_type = (tensor<?x4x?xf32>, tensor<2x4x?xf32>) -> tensor<?x4x?xf32>, sym_name = "two_dynamic_one_direct_shape"}> ({
  ^bb0(%arg0: tensor<?x4x?xf32>, %arg1: tensor<2x4x?xf32>):
    %0 = "test.concat"(%arg0, %arg1) {axis = 0 : i64} : (tensor<?x4x?xf32>, tensor<2x4x?xf32>) -> tensor<?x4x?xf32>
    "func.return"(%0) : (tensor<?x4x?xf32>) -> ()
  }) : () -> ()
}) : () -> ()

