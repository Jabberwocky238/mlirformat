"builtin.module"() ({
  "func.func"() <{function_type = (tensor<?x?x?x?xf32>, tensor<?x?x?x1xf32>, tensor<?x?x?x?x1xf32>) -> tensor<?x?x?x?x1xf32>, sym_name = "depthwise_conv"}> ({
  ^bb0(%arg0: tensor<?x?x?x?xf32> loc("<stdin>":6:8), %arg1: tensor<?x?x?x1xf32> loc("<stdin>":6:36), %arg2: tensor<?x?x?x?x1xf32> loc("<stdin>":6:64)):
    %0 = "linalg.depthwise_conv_2d_nhwc_hwcm"(%arg0, %arg1, %arg2) <{dilations = dense<1> : tensor<2xi64>, operandSegmentSizes = array<i32: 2, 1>, strides = dense<2> : tensor<2xi64>}> ({
    ^bb0(%arg3: f32 loc("<stdin>":8:10), %arg4: f32 loc("<stdin>":8:22), %arg5: f32 loc("<stdin>":8:34)):
      %1 = "arith.mulf"(%arg3, %arg4) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32 loc("<stdin>":9:12)
      %2 = "arith.addf"(%arg5, %1) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32 loc("<stdin>":10:12)
      "linalg.yield"(%2) : (f32) -> () loc("<stdin>":11:7)
    }) {_someattr, linalg.memoized_indexing_maps = [affine_map<(d0, d1, d2, d3, d4, d5, d6) -> (d0, d1 * 2 + d5, d2 * 2 + d6, d3)>, affine_map<(d0, d1, d2, d3, d4, d5, d6) -> (d5, d6, d3, d4)>, affine_map<(d0, d1, d2, d3, d4, d5, d6) -> (d0, d1, d2, d3, d4)>]} : (tensor<?x?x?x?xf32>, tensor<?x?x?x1xf32>, tensor<?x?x?x?x1xf32>) -> tensor<?x?x?x?x1xf32> loc("<stdin>":7:10)
    "func.return"(%0) : (tensor<?x?x?x?x1xf32>) -> () loc("<stdin>":13:5)
  }) : () -> () loc("<stdin>":5:3)
}) : () -> () loc("<stdin>":4:1)
