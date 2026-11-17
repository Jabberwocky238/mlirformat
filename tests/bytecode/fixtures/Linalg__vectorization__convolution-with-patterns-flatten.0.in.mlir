"builtin.module"() ({
  "func.func"() <{function_type = (tensor<1x8x3xi8>, tensor<1x3xi8>, tensor<1x8x3xi8>) -> tensor<1x8x3xi8>, sym_name = "depthwise_conv1d_nwc_wc_1x8x3xi8_tensor"}> ({
  ^bb0(%arg8: tensor<1x8x3xi8> loc("<stdin>":7:8), %arg9: tensor<1x3xi8> loc("<stdin>":7:33), %arg10: tensor<1x8x3xi8> loc("<stdin>":7:56)):
    %8 = "linalg.depthwise_conv_1d_nwc_wc"(%arg8, %arg9, %arg10) <{dilations = dense<1> : vector<1xi64>, operandSegmentSizes = array<i32: 2, 1>, strides = dense<1> : vector<1xi64>}> ({
    ^bb0(%arg11: i8 loc("<stdin>":9:10), %arg12: i8 loc("<stdin>":9:22), %arg13: i8 loc("<stdin>":9:34)):
      %9 = "arith.muli"(%arg11, %arg12) <{overflowFlags = #arith.overflow<none>}> : (i8, i8) -> i8 loc("<stdin>":10:12)
      %10 = "arith.addi"(%arg13, %9) <{overflowFlags = #arith.overflow<none>}> : (i8, i8) -> i8 loc("<stdin>":11:13)
      "linalg.yield"(%10) : (i8) -> () loc("<stdin>":12:7)
    }) {linalg.memoized_indexing_maps = [affine_map<(d0, d1, d2, d3) -> (d0, d1 + d3, d2)>, affine_map<(d0, d1, d2, d3) -> (d3, d2)>, affine_map<(d0, d1, d2, d3) -> (d0, d1, d2)>]} : (tensor<1x8x3xi8>, tensor<1x3xi8>, tensor<1x8x3xi8>) -> tensor<1x8x3xi8> loc("<stdin>":8:10)
    "func.return"(%8) : (tensor<1x8x3xi8>) -> () loc("<stdin>":14:5)
  }) : () -> () loc("<stdin>":6:3)
  "builtin.module"() ({
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg7: !transform.any_op loc("<stdin>":18:10)):
      %5 = "transform.structured.match"(%arg7) <{ops = ["linalg.depthwise_conv_1d_nwc_wc", "linalg.generic"]}> : (!transform.any_op) -> !transform.any_op loc("<stdin>":19:12)
      %6 = "transform.get_parent_op"(%5) <{isolated_from_above, nth_parent = 1 : i64}> : (!transform.any_op) -> !transform.any_op loc("<stdin>":20:12)
      %7 = "transform.structured.vectorize_children_and_apply_patterns"(%6) <{flatten_1d_depthwise_conv}> : (!transform.any_op) -> !transform.any_op loc("<stdin>":21:12)
      "transform.yield"() : () -> () loc("<stdin>":22:7)
    }) : () -> () loc("<stdin>":17:5)
  }) {transform.with_named_sequence} : () -> () loc("<stdin>":16:3)
  "func.func"() <{function_type = (memref<3x5x4xf32>, memref<2x4xf32>, memref<3x2x4xf32>) -> (), sym_name = "depthwise_conv1d_nwc_wc_3x5x4xf32_memref_dillation_2"}> ({
  ^bb0(%arg1: memref<3x5x4xf32> loc("<stdin>":26:8), %arg2: memref<2x4xf32> loc("<stdin>":26:34), %arg3: memref<3x2x4xf32> loc("<stdin>":26:58)):
    "linalg.depthwise_conv_1d_nwc_wc"(%arg1, %arg2, %arg3) <{dilations = dense<2> : tensor<1xi64>, operandSegmentSizes = array<i32: 2, 1>, strides = dense<1> : tensor<1xi64>}> ({
    ^bb0(%arg4: f32 loc("<stdin>":28:10), %arg5: f32 loc("<stdin>":28:22), %arg6: f32 loc("<stdin>":28:34)):
      %3 = "arith.mulf"(%arg4, %arg5) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32 loc("<stdin>":29:12)
      %4 = "arith.addf"(%arg6, %3) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32 loc("<stdin>":30:12)
      "linalg.yield"(%4) : (f32) -> () loc("<stdin>":31:7)
    }) {linalg.memoized_indexing_maps = [affine_map<(d0, d1, d2, d3) -> (d0, d1 + d3 * 2, d2)>, affine_map<(d0, d1, d2, d3) -> (d3, d2)>, affine_map<(d0, d1, d2, d3) -> (d0, d1, d2)>]} : (memref<3x5x4xf32>, memref<2x4xf32>, memref<3x2x4xf32>) -> () loc("<stdin>":27:5)
    "func.return"() : () -> () loc("<stdin>":33:5)
  }) : () -> () loc("<stdin>":25:3)
  "builtin.module"() ({
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg0: !transform.any_op loc("<stdin>":37:10)):
      %0 = "transform.structured.match"(%arg0) <{ops = ["linalg.depthwise_conv_1d_nwc_wc", "linalg.generic"]}> : (!transform.any_op) -> !transform.any_op loc("<stdin>":38:12)
      %1 = "transform.get_parent_op"(%0) <{isolated_from_above, nth_parent = 1 : i64}> : (!transform.any_op) -> !transform.any_op loc("<stdin>":39:12)
      %2 = "transform.structured.vectorize_children_and_apply_patterns"(%1) <{flatten_1d_depthwise_conv}> : (!transform.any_op) -> !transform.any_op loc("<stdin>":40:12)
      "transform.yield"() : () -> () loc("<stdin>":41:7)
    }) : () -> () loc("<stdin>":36:5)
  }) {transform.with_named_sequence} : () -> () loc("<stdin>":35:3)
}) : () -> () loc("<stdin>":5:1)
