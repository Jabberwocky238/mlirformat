"builtin.module"() ({
  "func.func"() <{function_type = (index) -> tensor<4xi32>, sym_name = "test_const"}> ({
  ^bb0(%arg3: index):
    %2 = "tosa.const"() <{values = dense<[3, 0, 1, 2]> : tensor<4xi32>}> : () -> tensor<4xi32>
    "func.return"(%2) : (tensor<4xi32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (index) -> tensor<4xi64>, sym_name = "test_const_i64"}> ({
  ^bb0(%arg2: index):
    %1 = "tosa.const"() <{values = dense<[3, 0, 1, 2]> : tensor<4xi64>}> : () -> tensor<4xi64>
    "func.return"(%1) : (tensor<4xi64>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<4xi32>, tensor<1xi32>) -> (), sym_name = "try_fold_equal_with_unranked_tensor"}> ({
  ^bb0(%arg0: tensor<4xi32>, %arg1: tensor<1xi32>):
    %0 = "tosa.equal"(%arg0, %arg1) : (tensor<4xi32>, tensor<1xi32>) -> tensor<*xi1>
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

