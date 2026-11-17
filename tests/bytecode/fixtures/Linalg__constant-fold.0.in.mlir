"builtin.module"() ({
  "func.func"() <{function_type = (tensor<3x2xf32>) -> tensor<3x2xf32>, sym_name = "transpose_fold_2d_fp32"}> ({
  ^bb0(%arg0: tensor<3x2xf32> loc("<stdin>":5:8)):
    %0 = "arith.constant"() <{value = dense<[[0.000000e+00, 1.000000e+00, 2.000000e+00], [3.000000e+00, 4.000000e+00, 5.000000e+00]]> : tensor<2x3xf32>}> : () -> tensor<2x3xf32> loc("<stdin>":6:10)
    %1 = "linalg.generic"(%0, %arg0) <{indexing_maps = [affine_map<(d0, d1) -> (d1, d0)>, affine_map<(d0, d1) -> (d0, d1)>], iterator_types = [#linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>], operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg1: f32 loc("<stdin>":8:10), %arg2: f32 loc("<stdin>":8:22)):
      "linalg.yield"(%arg1) : (f32) -> () loc("<stdin>":9:7)
    }) : (tensor<2x3xf32>, tensor<3x2xf32>) -> tensor<3x2xf32> loc("<stdin>":7:10)
    "func.return"(%1) : (tensor<3x2xf32>) -> () loc("<stdin>":11:5)
  }) : () -> () loc("<stdin>":4:3)
}) : () -> () loc("<stdin>":3:1)
