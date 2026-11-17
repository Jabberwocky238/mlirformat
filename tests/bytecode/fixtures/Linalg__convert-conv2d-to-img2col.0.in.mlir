"builtin.module"() ({
  "func.func"() <{function_type = (tensor<1x16x16x4xf32>, tensor<3x3x4x16xf32>, tensor<1x14x14x16xf32>) -> tensor<1x14x14x16xf32>, sym_name = "conv_16433136"}> ({
  ^bb0(%arg1: tensor<1x16x16x4xf32> loc("<stdin>":6:8), %arg2: tensor<3x3x4x16xf32> loc("<stdin>":6:38), %arg3: tensor<1x14x14x16xf32> loc("<stdin>":6:67)):
    %2 = "linalg.conv_2d_nhwc_hwcf"(%arg1, %arg2, %arg3) <{dilations = dense<1> : tensor<2xi64>, operandSegmentSizes = array<i32: 2, 1>, strides = dense<1> : tensor<2xi64>}> ({
    ^bb0(%arg4: f32 loc("<stdin>":8:10), %arg5: f32 loc("<stdin>":8:22), %arg6: f32 loc("<stdin>":8:34)):
      %3 = "arith.mulf"(%arg4, %arg5) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32 loc("<stdin>":9:12)
      %4 = "arith.addf"(%arg6, %3) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32 loc("<stdin>":10:12)
      "linalg.yield"(%4) : (f32) -> () loc("<stdin>":11:7)
    }) {linalg.memoized_indexing_maps = [affine_map<(d0, d1, d2, d3, d4, d5, d6) -> (d0, d1 + d4, d2 + d5, d6)>, affine_map<(d0, d1, d2, d3, d4, d5, d6) -> (d4, d5, d6, d3)>, affine_map<(d0, d1, d2, d3, d4, d5, d6) -> (d0, d1, d2, d3)>]} : (tensor<1x16x16x4xf32>, tensor<3x3x4x16xf32>, tensor<1x14x14x16xf32>) -> tensor<1x14x14x16xf32> loc("<stdin>":7:10)
    "func.return"(%2) : (tensor<1x14x14x16xf32>) -> () loc("<stdin>":13:5)
  }) : () -> () loc("<stdin>":5:3)
  "builtin.module"() ({
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg0: !transform.any_op loc("<stdin>":17:10)):
      %0 = "transform.structured.match"(%arg0) <{ops = ["linalg.conv_2d_nhwc_hwcf"]}> : (!transform.any_op) -> !transform.any_op loc("<stdin>":18:12)
      %1:2 = "transform.structured.convert_conv2d_to_img2col"(%0) : (!transform.any_op) -> (!transform.any_op, !transform.any_op) loc("<stdin>":19:14)
      "transform.print"(%1#0) <{name = "tensor_producer"}> : (!transform.any_op) -> () loc("<stdin>":20:7)
      "transform.print"(%1#1) <{name = "transformed"}> : (!transform.any_op) -> () loc("<stdin>":21:7)
      "transform.yield"() : () -> () loc("<stdin>":22:7)
    }) : () -> () loc("<stdin>":16:5)
  }) {transform.with_named_sequence} : () -> () loc("<stdin>":15:3)
}) : () -> () loc("<stdin>":4:1)
