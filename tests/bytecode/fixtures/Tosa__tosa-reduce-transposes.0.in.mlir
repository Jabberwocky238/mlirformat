"builtin.module"() ({
  "func.func"() <{function_type = (tensor<1x2x3x4xi32>) -> tensor<1x2x3x4xi32>, sym_name = "test_transpose_tracks_to_nullifying_single_step"}> ({
  ^bb0(%arg0: tensor<1x2x3x4xi32> loc("<stdin>":3:8)):
    %0 = "tosa.transpose"(%arg0) <{perms = array<i32: 0, 2, 3, 1>}> : (tensor<1x2x3x4xi32>) -> tensor<1x3x4x2xi32> loc("<stdin>":4:10)
    %1 = "tosa.ceil"(%0) : (tensor<1x3x4x2xi32>) -> tensor<1x3x4x2xi32> loc("<stdin>":5:10)
    %2 = "tosa.transpose"(%1) <{perms = array<i32: 0, 3, 1, 2>}> : (tensor<1x3x4x2xi32>) -> tensor<1x2x3x4xi32> loc("<stdin>":6:10)
    "func.return"(%2) : (tensor<1x2x3x4xi32>) -> () loc("<stdin>":7:5)
  }) : () -> () loc("<stdin>":2:3)
}) : () -> () loc("<stdin>":1:1)
