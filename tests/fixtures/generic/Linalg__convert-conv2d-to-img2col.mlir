#map = affine_map<(d0, d1, d2, d3, d4, d5, d6) -> (d0, d1 + d4, d2 + d5, d6)>
#map1 = affine_map<(d0, d1, d2, d3, d4, d5, d6) -> (d4, d5, d6, d3)>
#map2 = affine_map<(d0, d1, d2, d3, d4, d5, d6) -> (d0, d1, d2, d3)>
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<?x?x?x?xf32>, tensor<3x3x4x16xf32>, tensor<?x?x?x?xf32>) -> tensor<?x?x?x?xf32>, sym_name = "conv_non_static"}> ({
  ^bb0(%arg1: tensor<?x?x?x?xf32>, %arg2: tensor<3x3x4x16xf32>, %arg3: tensor<?x?x?x?xf32>):
    %2 = "linalg.conv_2d_nhwc_hwcf"(%arg1, %arg2, %arg3) <{dilations = dense<1> : tensor<2xi64>, operandSegmentSizes = array<i32: 2, 1>, strides = dense<1> : tensor<2xi64>}> ({
    ^bb0(%arg4: f32, %arg5: f32, %arg6: f32):
      %3 = "arith.mulf"(%arg4, %arg5) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      %4 = "arith.addf"(%arg6, %3) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%4) : (f32) -> ()
    }) {linalg.memoized_indexing_maps = [#map, #map1, #map2]} : (tensor<?x?x?x?xf32>, tensor<3x3x4x16xf32>, tensor<?x?x?x?xf32>) -> tensor<?x?x?x?xf32>
    "func.return"(%2) : (tensor<?x?x?x?xf32>) -> ()
  }) : () -> ()
  "builtin.module"() ({
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg0: !transform.any_op):
      %0 = "transform.structured.match"(%arg0) <{ops = ["linalg.conv_2d_nhwc_hwcf"]}> : (!transform.any_op) -> !transform.any_op
      %1:2 = "transform.structured.convert_conv2d_to_img2col"(%0) : (!transform.any_op) -> (!transform.any_op, !transform.any_op)
      "transform.yield"() : () -> ()
    }) : () -> ()
  }) {transform.with_named_sequence} : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1, d2, d3, d4, d5, d6) -> (d0, d1 + d4, d2 + d5, d6)>
#map1 = affine_map<(d0, d1, d2, d3, d4, d5, d6) -> (d3, d4, d5, d6)>
#map2 = affine_map<(d0, d1, d2, d3, d4, d5, d6) -> (d0, d1, d2, d3)>
"builtin.module"() ({
  "func.func"() <{function_type = (memref<1x16x16x4xf32>, memref<16x3x3x4xf32>, memref<1x14x14x16xf32>) -> (), sym_name = "negative_conv_memref"}> ({
  ^bb0(%arg1: memref<1x16x16x4xf32>, %arg2: memref<16x3x3x4xf32>, %arg3: memref<1x14x14x16xf32>):
    "linalg.conv_2d_nhwc_fhwc"(%arg1, %arg2, %arg3) <{dilations = dense<1> : memref<2xi64>, operandSegmentSizes = array<i32: 2, 1>, strides = dense<1> : memref<2xi64>}> ({
    ^bb0(%arg4: f32, %arg5: f32, %arg6: f32):
      %2 = "arith.mulf"(%arg4, %arg5) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      %3 = "arith.addf"(%arg6, %2) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%3) : (f32) -> ()
    }) {linalg.memoized_indexing_maps = [#map, #map1, #map2]} : (memref<1x16x16x4xf32>, memref<16x3x3x4xf32>, memref<1x14x14x16xf32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "builtin.module"() ({
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg0: !transform.any_op):
      %0 = "transform.structured.match"(%arg0) <{ops = ["linalg.conv_2d_nhwc_fhwc"]}> : (!transform.any_op) -> !transform.any_op
      %1:2 = "transform.structured.convert_conv2d_to_img2col"(%0) : (!transform.any_op) -> (!transform.any_op, !transform.any_op)
      "transform.yield"() : () -> ()
    }) : () -> ()
  }) {transform.with_named_sequence} : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1, d2, d3, d4, d5, d6) -> (d0, d1 + d4, d2 + d5, d6)>
#map1 = affine_map<(d0, d1, d2, d3, d4, d5, d6) -> (d4, d5, d6, d3)>
#map2 = affine_map<(d0, d1, d2, d3, d4, d5, d6) -> (d0, d1, d2, d3)>
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<1x16x16x4xf32>, tensor<3x3x4x16xf32>, tensor<1x14x14x16xf32>) -> tensor<1x14x14x16xf32>, sym_name = "conv_16433136"}> ({
  ^bb0(%arg1: tensor<1x16x16x4xf32>, %arg2: tensor<3x3x4x16xf32>, %arg3: tensor<1x14x14x16xf32>):
    %2 = "linalg.conv_2d_nhwc_hwcf"(%arg1, %arg2, %arg3) <{dilations = dense<1> : tensor<2xi64>, operandSegmentSizes = array<i32: 2, 1>, strides = dense<1> : tensor<2xi64>}> ({
    ^bb0(%arg4: f32, %arg5: f32, %arg6: f32):
      %3 = "arith.mulf"(%arg4, %arg5) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      %4 = "arith.addf"(%arg6, %3) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%4) : (f32) -> ()
    }) {linalg.memoized_indexing_maps = [#map, #map1, #map2]} : (tensor<1x16x16x4xf32>, tensor<3x3x4x16xf32>, tensor<1x14x14x16xf32>) -> tensor<1x14x14x16xf32>
    "func.return"(%2) : (tensor<1x14x14x16xf32>) -> ()
  }) : () -> ()
  "builtin.module"() ({
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg0: !transform.any_op):
      %0 = "transform.structured.match"(%arg0) <{ops = ["linalg.conv_2d_nhwc_hwcf"]}> : (!transform.any_op) -> !transform.any_op
      %1:2 = "transform.structured.convert_conv2d_to_img2col"(%0) : (!transform.any_op) -> (!transform.any_op, !transform.any_op)
      "transform.print"(%1#0) <{name = "tensor_producer"}> : (!transform.any_op) -> ()
      "transform.print"(%1#1) <{name = "transformed"}> : (!transform.any_op) -> ()
      "transform.yield"() : () -> ()
    }) : () -> ()
  }) {transform.with_named_sequence} : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1, d2, d3, d4, d5) -> (d0, d1 + d4, d2 + d5, d3)>
#map1 = affine_map<(d0, d1, d2, d3, d4, d5) -> (d4, d5, d3)>
#map2 = affine_map<(d0, d1, d2, d3, d4, d5) -> (d0, d1, d2, d3)>
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<1x114x114x16xf32>, tensor<3x3x16xf32>, tensor<1x112x112x16xf32>) -> tensor<1x112x112x16xf32>, sym_name = "depthwise_conv_hwc_114x16x3"}> ({
  ^bb0(%arg1: tensor<1x114x114x16xf32>, %arg2: tensor<3x3x16xf32>, %arg3: tensor<1x112x112x16xf32>):
    %2 = "linalg.depthwise_conv_2d_nhwc_hwc"(%arg1, %arg2, %arg3) <{dilations = dense<1> : tensor<2xi64>, operandSegmentSizes = array<i32: 2, 1>, strides = dense<1> : tensor<2xi64>}> ({
    ^bb0(%arg4: f32, %arg5: f32, %arg6: f32):
      %3 = "arith.mulf"(%arg4, %arg5) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      %4 = "arith.addf"(%arg6, %3) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%4) : (f32) -> ()
    }) {linalg.memoized_indexing_maps = [#map, #map1, #map2]} : (tensor<1x114x114x16xf32>, tensor<3x3x16xf32>, tensor<1x112x112x16xf32>) -> tensor<1x112x112x16xf32>
    "func.return"(%2) : (tensor<1x112x112x16xf32>) -> ()
  }) : () -> ()
  "builtin.module"() ({
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg0: !transform.any_op):
      %0 = "transform.structured.match"(%arg0) <{ops = ["linalg.depthwise_conv_2d_nhwc_hwc"]}> : (!transform.any_op) -> !transform.any_op
      %1:2 = "transform.structured.convert_conv2d_to_img2col"(%0) : (!transform.any_op) -> (!transform.any_op, !transform.any_op)
      "transform.yield"() : () -> ()
    }) : () -> ()
  }) {transform.with_named_sequence} : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1, d2, d3, d4, d5, d6) -> (d0, d1 + d4, d2 + d5, d6)>
#map1 = affine_map<(d0, d1, d2, d3, d4, d5, d6) -> (d4, d5, d6, d3)>
#map2 = affine_map<(d0, d1, d2, d3, d4, d5, d6) -> (d0, d1, d2, d3)>
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<8x16x16x4xf32>, tensor<3x3x4x16xf32>, tensor<8x14x14x16xf32>) -> tensor<8x14x14x16xf32>, sym_name = "batch_nhwc_conv"}> ({
  ^bb0(%arg1: tensor<8x16x16x4xf32>, %arg2: tensor<3x3x4x16xf32>, %arg3: tensor<8x14x14x16xf32>):
    %2 = "linalg.conv_2d_nhwc_hwcf"(%arg1, %arg2, %arg3) <{dilations = dense<1> : tensor<2xi64>, operandSegmentSizes = array<i32: 2, 1>, strides = dense<1> : tensor<2xi64>}> ({
    ^bb0(%arg4: f32, %arg5: f32, %arg6: f32):
      %3 = "arith.mulf"(%arg4, %arg5) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      %4 = "arith.addf"(%arg6, %3) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%4) : (f32) -> ()
    }) {linalg.memoized_indexing_maps = [#map, #map1, #map2]} : (tensor<8x16x16x4xf32>, tensor<3x3x4x16xf32>, tensor<8x14x14x16xf32>) -> tensor<8x14x14x16xf32>
    "func.return"(%2) : (tensor<8x14x14x16xf32>) -> ()
  }) : () -> ()
  "builtin.module"() ({
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg0: !transform.any_op):
      %0 = "transform.structured.match"(%arg0) <{ops = ["linalg.conv_2d_nhwc_hwcf"]}> : (!transform.any_op) -> !transform.any_op
      %1:2 = "transform.structured.convert_conv2d_to_img2col"(%0) : (!transform.any_op) -> (!transform.any_op, !transform.any_op)
      "transform.yield"() : () -> ()
    }) : () -> ()
  }) {transform.with_named_sequence} : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1, d2, d3, d4, d5, d6) -> (d0, d4, d2 + d5, d3 + d6)>
#map1 = affine_map<(d0, d1, d2, d3, d4, d5, d6) -> (d1, d4, d5, d6)>
#map2 = affine_map<(d0, d1, d2, d3, d4, d5, d6) -> (d0, d1, d2, d3)>
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<8x4x16x16xf32>, tensor<16x4x3x3xf32>, tensor<8x16x14x14xf32>) -> tensor<8x16x14x14xf32>, sym_name = "batch_nchw_conv"}> ({
  ^bb0(%arg1: tensor<8x4x16x16xf32>, %arg2: tensor<16x4x3x3xf32>, %arg3: tensor<8x16x14x14xf32>):
    %2 = "linalg.conv_2d_nchw_fchw"(%arg1, %arg2, %arg3) <{dilations = dense<1> : tensor<2xi64>, operandSegmentSizes = array<i32: 2, 1>, strides = dense<1> : tensor<2xi64>}> ({
    ^bb0(%arg4: f32, %arg5: f32, %arg6: f32):
      %3 = "arith.mulf"(%arg4, %arg5) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      %4 = "arith.addf"(%arg6, %3) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%4) : (f32) -> ()
    }) {linalg.memoized_indexing_maps = [#map, #map1, #map2]} : (tensor<8x4x16x16xf32>, tensor<16x4x3x3xf32>, tensor<8x16x14x14xf32>) -> tensor<8x16x14x14xf32>
    "func.return"(%2) : (tensor<8x16x14x14xf32>) -> ()
  }) : () -> ()
  "builtin.module"() ({
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg0: !transform.any_op):
      %0 = "transform.structured.match"(%arg0) <{ops = ["linalg.conv_2d_nchw_fchw"]}> : (!transform.any_op) -> !transform.any_op
      %1:2 = "transform.structured.convert_conv2d_to_img2col"(%0) : (!transform.any_op) -> (!transform.any_op, !transform.any_op)
      "transform.yield"() : () -> ()
    }) : () -> ()
  }) {transform.with_named_sequence} : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1, d2, d3, d4, d5, d6) -> (d0, d4, d2 + d5, d3 + d6)>
#map1 = affine_map<(d0, d1, d2, d3, d4, d5, d6) -> (d1, d4, d5, d6)>
#map2 = affine_map<(d0, d1, d2, d3, d4, d5, d6) -> (d0, d1, d2, d3)>
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<8x4x16x16xf32>, tensor<16x4x3x3xf32, 42 : i32>, tensor<8x16x14x14xf32>) -> tensor<8x16x14x14xf32>, sym_name = "batch_nchw_conv_with_filter_encoding"}> ({
  ^bb0(%arg1: tensor<8x4x16x16xf32>, %arg2: tensor<16x4x3x3xf32, 42 : i32>, %arg3: tensor<8x16x14x14xf32>):
    %2 = "linalg.conv_2d_nchw_fchw"(%arg1, %arg2, %arg3) <{dilations = dense<1> : tensor<2xi64>, operandSegmentSizes = array<i32: 2, 1>, strides = dense<1> : tensor<2xi64>}> ({
    ^bb0(%arg4: f32, %arg5: f32, %arg6: f32):
      %3 = "arith.mulf"(%arg4, %arg5) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      %4 = "arith.addf"(%arg6, %3) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%4) : (f32) -> ()
    }) {linalg.memoized_indexing_maps = [#map, #map1, #map2]} : (tensor<8x4x16x16xf32>, tensor<16x4x3x3xf32, 42 : i32>, tensor<8x16x14x14xf32>) -> tensor<8x16x14x14xf32>
    "func.return"(%2) : (tensor<8x16x14x14xf32>) -> ()
  }) : () -> ()
  "builtin.module"() ({
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg0: !transform.any_op):
      %0 = "transform.structured.match"(%arg0) <{ops = ["linalg.conv_2d_nchw_fchw"]}> : (!transform.any_op) -> !transform.any_op
      %1:2 = "transform.structured.convert_conv2d_to_img2col"(%0) : (!transform.any_op) -> (!transform.any_op, !transform.any_op)
      "transform.yield"() : () -> ()
    }) : () -> ()
  }) {transform.with_named_sequence} : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1, d2, d3, d4, d5, d6) -> (d0, d1 + d4, d2 + d5, d6)>
#map1 = affine_map<(d0, d1, d2, d3, d4, d5, d6) -> (d3, d4, d5, d6)>
#map2 = affine_map<(d0, d1, d2, d3, d4, d5, d6) -> (d0, d1, d2, d3)>
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<1x16x16x4xf32>, tensor<16x3x3x4xf32>, tensor<1x14x14x16xf32>) -> tensor<1x14x14x16xf32>, sym_name = "conv_2d_nhwc_fhwc"}> ({
  ^bb0(%arg1: tensor<1x16x16x4xf32>, %arg2: tensor<16x3x3x4xf32>, %arg3: tensor<1x14x14x16xf32>):
    %2 = "linalg.conv_2d_nhwc_fhwc"(%arg1, %arg2, %arg3) <{dilations = dense<1> : tensor<2xi64>, operandSegmentSizes = array<i32: 2, 1>, strides = dense<1> : tensor<2xi64>}> ({
    ^bb0(%arg4: f32, %arg5: f32, %arg6: f32):
      %3 = "arith.mulf"(%arg4, %arg5) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      %4 = "arith.addf"(%arg6, %3) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%4) : (f32) -> ()
    }) {linalg.memoized_indexing_maps = [#map, #map1, #map2]} : (tensor<1x16x16x4xf32>, tensor<16x3x3x4xf32>, tensor<1x14x14x16xf32>) -> tensor<1x14x14x16xf32>
    "func.return"(%2) : (tensor<1x14x14x16xf32>) -> ()
  }) : () -> ()
  "builtin.module"() ({
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg0: !transform.any_op):
      %0 = "transform.structured.match"(%arg0) <{ops = ["linalg.conv_2d_nhwc_fhwc"]}> : (!transform.any_op) -> !transform.any_op
      %1:2 = "transform.structured.convert_conv2d_to_img2col"(%0) : (!transform.any_op) -> (!transform.any_op, !transform.any_op)
      "transform.print"(%1#0) <{name = "tensor_producer"}> : (!transform.any_op) -> ()
      "transform.print"(%1#1) <{name = "transformed"}> : (!transform.any_op) -> ()
      "transform.yield"() : () -> ()
    }) : () -> ()
  }) {transform.with_named_sequence} : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1, d2, d3, d4, d5, d6) -> (d0, d1 + d4, d2 + d5, d6)>
#map1 = affine_map<(d0, d1, d2, d3, d4, d5, d6) -> (d3, d4, d5, d6)>
#map2 = affine_map<(d0, d1, d2, d3, d4, d5, d6) -> (d0, d1, d2, d3)>
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<1x16x16x4xf32>, tensor<16x3x3x4xf32, 42 : i32>, tensor<1x14x14x16xf32>) -> tensor<1x14x14x16xf32>, sym_name = "conv_2d_nhwc_fhwc_with_filter_encoding"}> ({
  ^bb0(%arg1: tensor<1x16x16x4xf32>, %arg2: tensor<16x3x3x4xf32, 42 : i32>, %arg3: tensor<1x14x14x16xf32>):
    %2 = "linalg.conv_2d_nhwc_fhwc"(%arg1, %arg2, %arg3) <{dilations = dense<1> : tensor<2xi64>, operandSegmentSizes = array<i32: 2, 1>, strides = dense<1> : tensor<2xi64>}> ({
    ^bb0(%arg4: f32, %arg5: f32, %arg6: f32):
      %3 = "arith.mulf"(%arg4, %arg5) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      %4 = "arith.addf"(%arg6, %3) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%4) : (f32) -> ()
    }) {linalg.memoized_indexing_maps = [#map, #map1, #map2]} : (tensor<1x16x16x4xf32>, tensor<16x3x3x4xf32, 42 : i32>, tensor<1x14x14x16xf32>) -> tensor<1x14x14x16xf32>
    "func.return"(%2) : (tensor<1x14x14x16xf32>) -> ()
  }) : () -> ()
  "builtin.module"() ({
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg0: !transform.any_op):
      %0 = "transform.structured.match"(%arg0) <{ops = ["linalg.conv_2d_nhwc_fhwc"]}> : (!transform.any_op) -> !transform.any_op
      %1:2 = "transform.structured.convert_conv2d_to_img2col"(%0) : (!transform.any_op) -> (!transform.any_op, !transform.any_op)
      "transform.yield"() : () -> ()
    }) : () -> ()
  }) {transform.with_named_sequence} : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1, d2, d3, d4, d5, d6) -> (d0, d1 + d4, d2 + d5, d6)>
#map1 = affine_map<(d0, d1, d2, d3, d4, d5, d6) -> (d4, d5, d6, d3)>
#map2 = affine_map<(d0, d1, d2, d3, d4, d5, d6) -> (d0, d1, d2, d3)>
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<1x16x16x4xi8>, tensor<3x3x4x16xi8>, tensor<1x14x14x16xi32>) -> tensor<1x14x14x16xi32>, sym_name = "conv_integer_extend"}> ({
  ^bb0(%arg1: tensor<1x16x16x4xi8>, %arg2: tensor<3x3x4x16xi8>, %arg3: tensor<1x14x14x16xi32>):
    %2 = "linalg.conv_2d_nhwc_hwcf"(%arg1, %arg2, %arg3) <{dilations = dense<1> : tensor<2xi64>, operandSegmentSizes = array<i32: 2, 1>, strides = dense<1> : tensor<2xi64>}> ({
    ^bb0(%arg4: i8, %arg5: i8, %arg6: i32):
      %3 = "arith.extsi"(%arg4) : (i8) -> i32
      %4 = "arith.extsi"(%arg5) : (i8) -> i32
      %5 = "arith.muli"(%3, %4) <{overflowFlags = #arith.overflow<none>}> : (i32, i32) -> i32
      %6 = "arith.addi"(%arg6, %5) <{overflowFlags = #arith.overflow<none>}> : (i32, i32) -> i32
      "linalg.yield"(%6) : (i32) -> ()
    }) {linalg.memoized_indexing_maps = [#map, #map1, #map2]} : (tensor<1x16x16x4xi8>, tensor<3x3x4x16xi8>, tensor<1x14x14x16xi32>) -> tensor<1x14x14x16xi32>
    "func.return"(%2) : (tensor<1x14x14x16xi32>) -> ()
  }) : () -> ()
  "builtin.module"() ({
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg0: !transform.any_op):
      %0 = "transform.structured.match"(%arg0) <{ops = ["linalg.conv_2d_nhwc_hwcf"]}> : (!transform.any_op) -> !transform.any_op
      %1:2 = "transform.structured.convert_conv2d_to_img2col"(%0) : (!transform.any_op) -> (!transform.any_op, !transform.any_op)
      "transform.print"(%1#0) <{name = "tensor_producer"}> : (!transform.any_op) -> ()
      "transform.print"(%1#1) <{name = "transformed"}> : (!transform.any_op) -> ()
      "transform.yield"() : () -> ()
    }) : () -> ()
  }) {transform.with_named_sequence} : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1, d2, d3, d4, d5, d6) -> (d0, d1 + d4, d2 + d5, d6)>
#map1 = affine_map<(d0, d1, d2, d3, d4, d5, d6) -> (d4, d5, d6, d3)>
#map2 = affine_map<(d0, d1, d2, d3, d4, d5, d6) -> (d0, d1, d2, d3)>
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<1x16x16x4xcomplex<f32>>, tensor<3x3x4x16xcomplex<f32>>, tensor<1x14x14x16xcomplex<f32>>) -> tensor<1x14x14x16xcomplex<f32>>, sym_name = "conv_complex"}> ({
  ^bb0(%arg1: tensor<1x16x16x4xcomplex<f32>>, %arg2: tensor<3x3x4x16xcomplex<f32>>, %arg3: tensor<1x14x14x16xcomplex<f32>>):
    %2 = "linalg.conv_2d_nhwc_hwcf"(%arg1, %arg2, %arg3) <{dilations = dense<1> : tensor<2xi64>, operandSegmentSizes = array<i32: 2, 1>, strides = dense<1> : tensor<2xi64>}> ({
    ^bb0(%arg4: complex<f32>, %arg5: complex<f32>, %arg6: complex<f32>):
      %3 = "complex.mul"(%arg4, %arg5) <{fastmath = #arith.fastmath<none>}> : (complex<f32>, complex<f32>) -> complex<f32>
      %4 = "complex.add"(%arg6, %3) <{fastmath = #arith.fastmath<none>}> : (complex<f32>, complex<f32>) -> complex<f32>
      "linalg.yield"(%4) : (complex<f32>) -> ()
    }) {linalg.memoized_indexing_maps = [#map, #map1, #map2]} : (tensor<1x16x16x4xcomplex<f32>>, tensor<3x3x4x16xcomplex<f32>>, tensor<1x14x14x16xcomplex<f32>>) -> tensor<1x14x14x16xcomplex<f32>>
    "func.return"(%2) : (tensor<1x14x14x16xcomplex<f32>>) -> ()
  }) : () -> ()
  "builtin.module"() ({
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg0: !transform.any_op):
      %0 = "transform.structured.match"(%arg0) <{ops = ["linalg.conv_2d_nhwc_hwcf"]}> : (!transform.any_op) -> !transform.any_op
      %1:2 = "transform.structured.convert_conv2d_to_img2col"(%0) : (!transform.any_op) -> (!transform.any_op, !transform.any_op)
      "transform.print"(%1#0) <{name = "tensor_producer"}> : (!transform.any_op) -> ()
      "transform.print"(%1#1) <{name = "transformed"}> : (!transform.any_op) -> ()
      "transform.yield"() : () -> ()
    }) : () -> ()
  }) {transform.with_named_sequence} : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1, d2, d3, d4, d5, d6) -> (d0, d1 + d4, d2 + d5, d6)>
#map1 = affine_map<(d0, d1, d2, d3, d4, d5, d6) -> (d4, d5, d6, d3)>
#map2 = affine_map<(d0, d1, d2, d3, d4, d5, d6) -> (d0, d1, d2, d3)>
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<1x16x16x4xcomplex<f32>>, tensor<3x3x4x16xcomplex<f16>>, tensor<1x14x14x16xcomplex<f32>>) -> tensor<1x14x14x16xcomplex<f32>>, sym_name = "conv_complex_extended"}> ({
  ^bb0(%arg1: tensor<1x16x16x4xcomplex<f32>>, %arg2: tensor<3x3x4x16xcomplex<f16>>, %arg3: tensor<1x14x14x16xcomplex<f32>>):
    %2 = "linalg.conv_2d_nhwc_hwcf"(%arg1, %arg2, %arg3) <{dilations = dense<1> : tensor<2xi64>, operandSegmentSizes = array<i32: 2, 1>, strides = dense<1> : tensor<2xi64>}> ({
    ^bb0(%arg4: complex<f32>, %arg5: complex<f16>, %arg6: complex<f32>):
      %3 = "complex.re"(%arg5) <{fastmath = #arith.fastmath<none>}> : (complex<f16>) -> f16
      %4 = "complex.im"(%arg5) <{fastmath = #arith.fastmath<none>}> : (complex<f16>) -> f16
      %5 = "arith.extf"(%3) : (f16) -> f32
      %6 = "arith.extf"(%4) : (f16) -> f32
      %7 = "complex.create"(%5, %6) : (f32, f32) -> complex<f32>
      %8 = "complex.mul"(%arg4, %7) <{fastmath = #arith.fastmath<none>}> : (complex<f32>, complex<f32>) -> complex<f32>
      %9 = "complex.add"(%arg6, %8) <{fastmath = #arith.fastmath<none>}> : (complex<f32>, complex<f32>) -> complex<f32>
      "linalg.yield"(%9) : (complex<f32>) -> ()
    }) {linalg.memoized_indexing_maps = [#map, #map1, #map2]} : (tensor<1x16x16x4xcomplex<f32>>, tensor<3x3x4x16xcomplex<f16>>, tensor<1x14x14x16xcomplex<f32>>) -> tensor<1x14x14x16xcomplex<f32>>
    "func.return"(%2) : (tensor<1x14x14x16xcomplex<f32>>) -> ()
  }) : () -> ()
  "builtin.module"() ({
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg0: !transform.any_op):
      %0 = "transform.structured.match"(%arg0) <{ops = ["linalg.conv_2d_nhwc_hwcf"]}> : (!transform.any_op) -> !transform.any_op
      %1:2 = "transform.structured.convert_conv2d_to_img2col"(%0) : (!transform.any_op) -> (!transform.any_op, !transform.any_op)
      "transform.print"(%1#0) <{name = "tensor_producer"}> : (!transform.any_op) -> ()
      "transform.print"(%1#1) <{name = "transformed"}> : (!transform.any_op) -> ()
      "transform.yield"() : () -> ()
    }) : () -> ()
  }) {transform.with_named_sequence} : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1, d2, d3, d4, d5, d6) -> (d0, d1 + d4, d2 + d5, d6)>
#map1 = affine_map<(d0, d1, d2, d3, d4, d5, d6) -> (d4, d5, d6, d3)>
#map2 = affine_map<(d0, d1, d2, d3, d4, d5, d6) -> (d0, d1, d2, d3)>
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<1x16x16x4xcomplex<f32>>, tensor<3x3x4x16xf16>, tensor<1x14x14x16xcomplex<f32>>) -> tensor<1x14x14x16xcomplex<f32>>, sym_name = "conv_complex_f16_extended"}> ({
  ^bb0(%arg1: tensor<1x16x16x4xcomplex<f32>>, %arg2: tensor<3x3x4x16xf16>, %arg3: tensor<1x14x14x16xcomplex<f32>>):
    %2 = "linalg.conv_2d_nhwc_hwcf"(%arg1, %arg2, %arg3) <{dilations = dense<1> : tensor<2xi64>, operandSegmentSizes = array<i32: 2, 1>, strides = dense<1> : tensor<2xi64>}> ({
    ^bb0(%arg4: complex<f32>, %arg5: f16, %arg6: complex<f32>):
      %3 = "arith.extf"(%arg5) : (f16) -> f32
      %4 = "arith.constant"() <{value = 0.000000e+00 : f32}> : () -> f32
      %5 = "complex.create"(%3, %4) : (f32, f32) -> complex<f32>
      %6 = "complex.mul"(%arg4, %5) <{fastmath = #arith.fastmath<none>}> : (complex<f32>, complex<f32>) -> complex<f32>
      %7 = "complex.add"(%arg6, %6) <{fastmath = #arith.fastmath<none>}> : (complex<f32>, complex<f32>) -> complex<f32>
      "linalg.yield"(%7) : (complex<f32>) -> ()
    }) {linalg.memoized_indexing_maps = [#map, #map1, #map2]} : (tensor<1x16x16x4xcomplex<f32>>, tensor<3x3x4x16xf16>, tensor<1x14x14x16xcomplex<f32>>) -> tensor<1x14x14x16xcomplex<f32>>
    "func.return"(%2) : (tensor<1x14x14x16xcomplex<f32>>) -> ()
  }) : () -> ()
  "builtin.module"() ({
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg0: !transform.any_op):
      %0 = "transform.structured.match"(%arg0) <{ops = ["linalg.conv_2d_nhwc_hwcf"]}> : (!transform.any_op) -> !transform.any_op
      %1:2 = "transform.structured.convert_conv2d_to_img2col"(%0) : (!transform.any_op) -> (!transform.any_op, !transform.any_op)
      "transform.print"(%1#0) <{name = "tensor_producer"}> : (!transform.any_op) -> ()
      "transform.print"(%1#1) <{name = "transformed"}> : (!transform.any_op) -> ()
      "transform.yield"() : () -> ()
    }) : () -> ()
  }) {transform.with_named_sequence} : () -> ()
}) : () -> ()

