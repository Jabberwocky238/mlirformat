"builtin.module"() ({
  "func.func"() <{function_type = (tensor<1x12x8xf32>, tensor<3x8x8xf32>) -> tensor<1x10x8x8xf32>, sym_name = "depthwise_conv_1d_nwc_wcm"}> ({
  ^bb0(%arg0: tensor<1x12x8xf32> loc("<stdin>":6:8), %arg1: tensor<3x8x8xf32> loc("<stdin>":6:35)):
    %0 = "arith.constant"() <{value = 0.000000e+00 : f32}> : () -> f32 loc("<stdin>":7:10)
    %1 = "tensor.empty"() : () -> tensor<1x10x8x8xf32> loc("<stdin>":8:10)
    %2 = "linalg.fill"(%0, %1) <{operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg5: f32 loc("<stdin>":10:10), %arg6: f32 loc("<stdin>":10:22)):
      "linalg.yield"(%arg5) : (f32) -> () loc("<stdin>":11:7)
    }) : (f32, tensor<1x10x8x8xf32>) -> tensor<1x10x8x8xf32> loc("<stdin>":9:10)
    %3 = "linalg.depthwise_conv_1d_nwc_wcm"(%arg0, %arg1, %2) <{dilations = dense<1> : tensor<1xi64>, operandSegmentSizes = array<i32: 2, 1>, strides = dense<1> : tensor<1xi64>}> ({
    ^bb0(%arg2: f32 loc("<stdin>":14:10), %arg3: f32 loc("<stdin>":14:22), %arg4: f32 loc("<stdin>":14:34)):
      %4 = "arith.mulf"(%arg2, %arg3) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32 loc("<stdin>":15:12)
      %5 = "arith.addf"(%arg4, %4) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32 loc("<stdin>":16:12)
      "linalg.yield"(%5) : (f32) -> () loc("<stdin>":17:7)
    }) {linalg.memoized_indexing_maps = [affine_map<(d0, d1, d2, d3, d4) -> (d0, d1 + d4, d2)>, affine_map<(d0, d1, d2, d3, d4) -> (d4, d2, d3)>, affine_map<(d0, d1, d2, d3, d4) -> (d0, d1, d2, d3)>]} : (tensor<1x12x8xf32>, tensor<3x8x8xf32>, tensor<1x10x8x8xf32>) -> tensor<1x10x8x8xf32> loc("<stdin>":13:10)
    "func.return"(%3) : (tensor<1x10x8x8xf32>) -> () loc("<stdin>":19:5)
  }) : () -> () loc("<stdin>":5:3)
}) : () -> () loc("<stdin>":4:1)
