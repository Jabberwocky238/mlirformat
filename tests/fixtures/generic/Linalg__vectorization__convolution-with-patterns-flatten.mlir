#map = affine_map<(d0, d1, d2, d3) -> (d0, d1 + d3, d2)>
#map1 = affine_map<(d0, d1, d2, d3) -> (d3, d2)>
#map2 = affine_map<(d0, d1, d2, d3) -> (d0, d1, d2)>
#map3 = affine_map<(d0, d1, d2, d3) -> (d0, d1 + d3 * 2, d2)>
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<1x8x3xi8>, tensor<1x3xi8>, tensor<1x8x3xi8>) -> tensor<1x8x3xi8>, sym_name = "depthwise_conv1d_nwc_wc_1x8x3xi8_tensor"}> ({
  ^bb0(%arg8: tensor<1x8x3xi8>, %arg9: tensor<1x3xi8>, %arg10: tensor<1x8x3xi8>):
    %8 = "linalg.depthwise_conv_1d_nwc_wc"(%arg8, %arg9, %arg10) <{dilations = dense<1> : vector<1xi64>, operandSegmentSizes = array<i32: 2, 1>, strides = dense<1> : vector<1xi64>}> ({
    ^bb0(%arg11: i8, %arg12: i8, %arg13: i8):
      %9 = "arith.muli"(%arg11, %arg12) <{overflowFlags = #arith.overflow<none>}> : (i8, i8) -> i8
      %10 = "arith.addi"(%arg13, %9) <{overflowFlags = #arith.overflow<none>}> : (i8, i8) -> i8
      "linalg.yield"(%10) : (i8) -> ()
    }) {linalg.memoized_indexing_maps = [#map, #map1, #map2]} : (tensor<1x8x3xi8>, tensor<1x3xi8>, tensor<1x8x3xi8>) -> tensor<1x8x3xi8>
    "func.return"(%8) : (tensor<1x8x3xi8>) -> ()
  }) : () -> ()
  "builtin.module"() ({
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg7: !transform.any_op):
      %5 = "transform.structured.match"(%arg7) <{ops = ["linalg.depthwise_conv_1d_nwc_wc", "linalg.generic"]}> : (!transform.any_op) -> !transform.any_op
      %6 = "transform.get_parent_op"(%5) <{isolated_from_above, nth_parent = 1 : i64}> : (!transform.any_op) -> !transform.any_op
      %7 = "transform.structured.vectorize_children_and_apply_patterns"(%6) <{flatten_1d_depthwise_conv}> : (!transform.any_op) -> !transform.any_op
      "transform.yield"() : () -> ()
    }) : () -> ()
  }) {transform.with_named_sequence} : () -> ()
  "func.func"() <{function_type = (memref<3x5x4xf32>, memref<2x4xf32>, memref<3x2x4xf32>) -> (), sym_name = "depthwise_conv1d_nwc_wc_3x5x4xf32_memref_dillation_2"}> ({
  ^bb0(%arg1: memref<3x5x4xf32>, %arg2: memref<2x4xf32>, %arg3: memref<3x2x4xf32>):
    "linalg.depthwise_conv_1d_nwc_wc"(%arg1, %arg2, %arg3) <{dilations = dense<2> : tensor<1xi64>, operandSegmentSizes = array<i32: 2, 1>, strides = dense<1> : tensor<1xi64>}> ({
    ^bb0(%arg4: f32, %arg5: f32, %arg6: f32):
      %3 = "arith.mulf"(%arg4, %arg5) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      %4 = "arith.addf"(%arg6, %3) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%4) : (f32) -> ()
    }) {linalg.memoized_indexing_maps = [#map3, #map1, #map2]} : (memref<3x5x4xf32>, memref<2x4xf32>, memref<3x2x4xf32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "builtin.module"() ({
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg0: !transform.any_op):
      %0 = "transform.structured.match"(%arg0) <{ops = ["linalg.depthwise_conv_1d_nwc_wc", "linalg.generic"]}> : (!transform.any_op) -> !transform.any_op
      %1 = "transform.get_parent_op"(%0) <{isolated_from_above, nth_parent = 1 : i64}> : (!transform.any_op) -> !transform.any_op
      %2 = "transform.structured.vectorize_children_and_apply_patterns"(%1) <{flatten_1d_depthwise_conv}> : (!transform.any_op) -> !transform.any_op
      "transform.yield"() : () -> ()
    }) : () -> ()
  }) {transform.with_named_sequence} : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1, d2, d3) -> (d0, d1 + d3 * 2, d2)>
#map1 = affine_map<(d0, d1, d2, d3) -> (d3, d2)>
#map2 = affine_map<(d0, d1, d2, d3) -> (d0, d1, d2)>
"builtin.module"() ({
  "func.func"() <{function_type = (memref<3x5x4xi8>, memref<2x4xi8>, memref<3x2x4xi32>) -> (), sym_name = "depthwise_conv1d_nwc_wc_3x5x4xi8_memref_dilation_2"}> ({
  ^bb0(%arg1: memref<3x5x4xi8>, %arg2: memref<2x4xi8>, %arg3: memref<3x2x4xi32>):
    "linalg.depthwise_conv_1d_nwc_wc"(%arg1, %arg2, %arg3) <{dilations = dense<2> : tensor<1xi64>, operandSegmentSizes = array<i32: 2, 1>, strides = dense<1> : tensor<1xi64>}> ({
    ^bb0(%arg4: i8, %arg5: i8, %arg6: i32):
      %3 = "arith.extsi"(%arg4) : (i8) -> i32
      %4 = "arith.extsi"(%arg5) : (i8) -> i32
      %5 = "arith.muli"(%3, %4) <{overflowFlags = #arith.overflow<none>}> : (i32, i32) -> i32
      %6 = "arith.addi"(%arg6, %5) <{overflowFlags = #arith.overflow<none>}> : (i32, i32) -> i32
      "linalg.yield"(%6) : (i32) -> ()
    }) {linalg.memoized_indexing_maps = [#map, #map1, #map2]} : (memref<3x5x4xi8>, memref<2x4xi8>, memref<3x2x4xi32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "builtin.module"() ({
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg0: !transform.any_op):
      %0 = "transform.structured.match"(%arg0) <{ops = ["linalg.depthwise_conv_1d_nwc_wc", "linalg.generic"]}> : (!transform.any_op) -> !transform.any_op
      %1 = "transform.get_parent_op"(%0) <{isolated_from_above, nth_parent = 1 : i64}> : (!transform.any_op) -> !transform.any_op
      %2 = "transform.structured.vectorize_children_and_apply_patterns"(%1) <{flatten_1d_depthwise_conv}> : (!transform.any_op) -> !transform.any_op
      "transform.yield"() : () -> ()
    }) : () -> ()
  }) {transform.with_named_sequence} : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1, d2, d3) -> (d0, d1 * 2 + d3, d2)>
#map1 = affine_map<(d0, d1, d2, d3) -> (d3, d2)>
#map2 = affine_map<(d0, d1, d2, d3) -> (d0, d1, d2)>
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<3x9x4xi8>, tensor<3x4xi8>, tensor<3x3x4xi8>) -> tensor<3x3x4xi8>, sym_name = "depthwise_conv1d_nwc_wc_3x9x4xi8_tensor_stride_2"}> ({
  ^bb0(%arg1: tensor<3x9x4xi8>, %arg2: tensor<3x4xi8>, %arg3: tensor<3x3x4xi8>):
    %3 = "linalg.depthwise_conv_1d_nwc_wc"(%arg1, %arg2, %arg3) <{dilations = dense<1> : tensor<1xi64>, operandSegmentSizes = array<i32: 2, 1>, strides = dense<2> : tensor<1xi64>}> ({
    ^bb0(%arg4: i8, %arg5: i8, %arg6: i8):
      %4 = "arith.muli"(%arg4, %arg5) <{overflowFlags = #arith.overflow<none>}> : (i8, i8) -> i8
      %5 = "arith.addi"(%arg6, %4) <{overflowFlags = #arith.overflow<none>}> : (i8, i8) -> i8
      "linalg.yield"(%5) : (i8) -> ()
    }) {linalg.memoized_indexing_maps = [#map, #map1, #map2]} : (tensor<3x9x4xi8>, tensor<3x4xi8>, tensor<3x3x4xi8>) -> tensor<3x3x4xi8>
    "func.return"(%3) : (tensor<3x3x4xi8>) -> ()
  }) : () -> ()
  "builtin.module"() ({
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg0: !transform.any_op):
      %0 = "transform.structured.match"(%arg0) <{ops = ["linalg.depthwise_conv_1d_nwc_wc", "linalg.generic"]}> : (!transform.any_op) -> !transform.any_op
      %1 = "transform.get_parent_op"(%0) <{isolated_from_above, nth_parent = 1 : i64}> : (!transform.any_op) -> !transform.any_op
      %2 = "transform.structured.vectorize_children_and_apply_patterns"(%1) <{flatten_1d_depthwise_conv}> : (!transform.any_op) -> !transform.any_op
      "transform.yield"() : () -> ()
    }) : () -> ()
  }) {transform.with_named_sequence} : () -> ()
}) : () -> ()

