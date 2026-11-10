#map = affine_map<(d0, d1, d2, d3) -> (d0, d1 + d3, d2)>
#map1 = affine_map<(d0, d1, d2, d3) -> (d3, d2)>
#map2 = affine_map<(d0, d1, d2, d3) -> (d0, d1, d2)>
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<1x8x?xi8>, tensor<1x?xi8>, tensor<1x8x?xi8>) -> tensor<1x8x?xi8>, sym_name = "depthwise_conv1d_nwc_wc_1x8x3xi8_tensor"}> ({
  ^bb0(%arg1: tensor<1x8x?xi8>, %arg2: tensor<1x?xi8>, %arg3: tensor<1x8x?xi8>):
    %1 = "linalg.depthwise_conv_1d_nwc_wc"(%arg1, %arg2, %arg3) <{dilations = dense<1> : vector<1xi64>, operandSegmentSizes = array<i32: 2, 1>, strides = dense<1> : vector<1xi64>}> ({
    ^bb0(%arg4: i8, %arg5: i8, %arg6: i8):
      %2 = "arith.muli"(%arg4, %arg5) <{overflowFlags = #arith.overflow<none>}> : (i8, i8) -> i8
      %3 = "arith.addi"(%arg6, %2) <{overflowFlags = #arith.overflow<none>}> : (i8, i8) -> i8
      "linalg.yield"(%3) : (i8) -> ()
    }) {linalg.memoized_indexing_maps = [#map, #map1, #map2]} : (tensor<1x8x?xi8>, tensor<1x?xi8>, tensor<1x8x?xi8>) -> tensor<1x8x?xi8>
    "func.return"(%1) : (tensor<1x8x?xi8>) -> ()
  }) : () -> ()
  "builtin.module"() ({
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg0: !transform.any_op):
      %0 = "transform.structured.match"(%arg0) <{ops = ["linalg.depthwise_conv_1d_nwc_wc", "linalg.generic"]}> : (!transform.any_op) -> !transform.any_op
      "transform.structured.vectorize"(%0) <{scalable_sizes = array<i1: false, false, false, false>, static_vector_sizes = array<i64: 1, 8, 4, 1>}> : (!transform.any_op) -> ()
      "transform.yield"() : () -> ()
    }) : () -> ()
  }) {transform.with_named_sequence} : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1, d2, d3) -> (d0, d1 + d3, d2)>
#map1 = affine_map<(d0, d1, d2, d3) -> (d3, d2)>
#map2 = affine_map<(d0, d1, d2, d3) -> (d0, d1, d2)>
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<1x8x?xi8>, tensor<1x?xi8>, tensor<1x8x?xi8>) -> tensor<1x8x?xi8>, sym_name = "depthwise_conv1d_nwc_wc_1x8x3xi8_tensor_scalable"}> ({
  ^bb0(%arg1: tensor<1x8x?xi8>, %arg2: tensor<1x?xi8>, %arg3: tensor<1x8x?xi8>):
    %1 = "linalg.depthwise_conv_1d_nwc_wc"(%arg1, %arg2, %arg3) <{dilations = dense<1> : vector<1xi64>, operandSegmentSizes = array<i32: 2, 1>, strides = dense<1> : vector<1xi64>}> ({
    ^bb0(%arg4: i8, %arg5: i8, %arg6: i8):
      %2 = "arith.muli"(%arg4, %arg5) <{overflowFlags = #arith.overflow<none>}> : (i8, i8) -> i8
      %3 = "arith.addi"(%arg6, %2) <{overflowFlags = #arith.overflow<none>}> : (i8, i8) -> i8
      "linalg.yield"(%3) : (i8) -> ()
    }) {linalg.memoized_indexing_maps = [#map, #map1, #map2]} : (tensor<1x8x?xi8>, tensor<1x?xi8>, tensor<1x8x?xi8>) -> tensor<1x8x?xi8>
    "func.return"(%1) : (tensor<1x8x?xi8>) -> ()
  }) : () -> ()
  "builtin.module"() ({
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg0: !transform.any_op):
      %0 = "transform.structured.match"(%arg0) <{ops = ["linalg.depthwise_conv_1d_nwc_wc", "linalg.generic"]}> : (!transform.any_op) -> !transform.any_op
      "transform.structured.vectorize"(%0) <{scalable_sizes = array<i1: false, false, true, false>, static_vector_sizes = array<i64: 1, 8, 4, 1>}> : (!transform.any_op) -> ()
      "transform.yield"() : () -> ()
    }) : () -> ()
  }) {transform.with_named_sequence} : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1, d2, d3) -> (d0, d1 + d3 * 2, d2)>
#map1 = affine_map<(d0, d1, d2, d3) -> (d3, d2)>
#map2 = affine_map<(d0, d1, d2, d3) -> (d0, d1, d2)>
"builtin.module"() ({
  "func.func"() <{function_type = (memref<3x5x?xf32>, memref<2x?xf32>, memref<3x2x?xf32>) -> (), sym_name = "depthwise_conv1d_nwc_wc_3x5x4xf32_memref_dilation_2"}> ({
  ^bb0(%arg1: memref<3x5x?xf32>, %arg2: memref<2x?xf32>, %arg3: memref<3x2x?xf32>):
    "linalg.depthwise_conv_1d_nwc_wc"(%arg1, %arg2, %arg3) <{dilations = dense<2> : tensor<1xi64>, operandSegmentSizes = array<i32: 2, 1>, strides = dense<1> : tensor<1xi64>}> ({
    ^bb0(%arg4: f32, %arg5: f32, %arg6: f32):
      %1 = "arith.mulf"(%arg4, %arg5) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      %2 = "arith.addf"(%arg6, %1) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%2) : (f32) -> ()
    }) {linalg.memoized_indexing_maps = [#map, #map1, #map2]} : (memref<3x5x?xf32>, memref<2x?xf32>, memref<3x2x?xf32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "builtin.module"() ({
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg0: !transform.any_op):
      %0 = "transform.structured.match"(%arg0) <{ops = ["linalg.depthwise_conv_1d_nwc_wc", "linalg.generic"]}> : (!transform.any_op) -> !transform.any_op
      "transform.structured.vectorize"(%0) <{scalable_sizes = array<i1: false, false, true, false>, static_vector_sizes = array<i64: 3, 2, 4, 2>}> : (!transform.any_op) -> ()
      "transform.yield"() : () -> ()
    }) : () -> ()
  }) {transform.with_named_sequence} : () -> ()
}) : () -> ()

