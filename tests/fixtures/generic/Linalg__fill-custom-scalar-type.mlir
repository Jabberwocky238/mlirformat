"builtin.module"() ({
  "func.func"() <{function_type = (!test.test_type, tensor<4x!test.test_type>) -> tensor<4x!test.test_type>, sym_name = "fill_non_builtin_scalar_type"}> ({
  ^bb0(%arg0: !test.test_type, %arg1: tensor<4x!test.test_type>):
    %0 = "linalg.fill"(%arg0, %arg1) <{operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg2: !test.test_type, %arg3: !test.test_type):
      "linalg.yield"(%arg2) : (!test.test_type) -> ()
    }) : (!test.test_type, tensor<4x!test.test_type>) -> tensor<4x!test.test_type>
    "func.return"(%0) : (tensor<4x!test.test_type>) -> ()
  }) : () -> ()
}) : () -> ()

