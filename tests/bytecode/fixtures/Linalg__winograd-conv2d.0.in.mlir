"builtin.module"() ({
  "func.func"() <{function_type = (tensor<2x6x6x5xf32>, tensor<2x3x3x5xf32>, tensor<1xf32>, tensor<2x4x4x2xf32>) -> tensor<2x4x4x2xf32>, sym_name = "conv2d_4x4_3x3"}> ({
  ^bb0(%arg0: tensor<2x6x6x5xf32> loc("<stdin>":6:8), %arg1: tensor<2x3x3x5xf32> loc("<stdin>":6:36), %arg2: tensor<1xf32> loc("<stdin>":6:64), %arg3: tensor<2x4x4x2xf32> loc("<stdin>":6:86)):
    %0 = "linalg.conv_2d_nhwc_fhwc"(%arg0, %arg1, %arg3) <{dilations = dense<1> : tensor<2xi64>, operandSegmentSizes = array<i32: 2, 1>, strides = dense<1> : tensor<2xi64>}> ({
    ^bb0(%arg4: f32 loc("<stdin>":8:10), %arg5: f32 loc("<stdin>":8:22), %arg6: f32 loc("<stdin>":8:34)):
      %1 = "arith.mulf"(%arg4, %arg5) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32 loc("<stdin>":9:12)
      %2 = "arith.addf"(%arg6, %1) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32 loc("<stdin>":10:12)
      "linalg.yield"(%2) : (f32) -> () loc("<stdin>":11:7)
    }) {linalg.memoized_indexing_maps = [affine_map<(d0, d1, d2, d3, d4, d5, d6) -> (d0, d1 + d4, d2 + d5, d6)>, affine_map<(d0, d1, d2, d3, d4, d5, d6) -> (d3, d4, d5, d6)>, affine_map<(d0, d1, d2, d3, d4, d5, d6) -> (d0, d1, d2, d3)>]} : (tensor<2x6x6x5xf32>, tensor<2x3x3x5xf32>, tensor<2x4x4x2xf32>) -> tensor<2x4x4x2xf32> loc("<stdin>":7:10)
    "func.return"(%0) : (tensor<2x4x4x2xf32>) -> () loc("<stdin>":13:5)
  }) : () -> () loc("<stdin>":5:3)
}) : () -> () loc("<stdin>":4:1)
