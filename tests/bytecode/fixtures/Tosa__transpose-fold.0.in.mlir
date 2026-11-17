"builtin.module"() ({
  "func.func"() <{function_type = (tensor<1x2x3xi32>) -> tensor<1x2x3xi32>, sym_name = "test_cancel_transpose_transpose"}> ({
  ^bb0(%arg0: tensor<1x2x3xi32> loc("<stdin>":3:8)):
    %0 = "tosa.transpose"(%arg0) <{perms = array<i32: 1, 2, 0>}> : (tensor<1x2x3xi32>) -> tensor<2x3x1xi32> loc("<stdin>":4:10)
    %1 = "tosa.transpose"(%0) <{perms = array<i32: 2, 0, 1>}> : (tensor<2x3x1xi32>) -> tensor<1x2x3xi32> loc("<stdin>":5:10)
    "func.return"(%1) : (tensor<1x2x3xi32>) -> () loc("<stdin>":6:5)
  }) : () -> () loc("<stdin>":2:3)
}) : () -> () loc("<stdin>":1:1)
