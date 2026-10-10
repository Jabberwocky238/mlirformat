#map = affine_map<(d0, d1, d2, d3, d4, d5, d6) -> (d0, d1 + d4, d2 + d5, d6)>
#map1 = affine_map<(d0, d1, d2, d3, d4, d5, d6) -> (d3, d4, d5, d6)>
#map2 = affine_map<(d0, d1, d2, d3, d4, d5, d6) -> (d0, d1, d2, d3)>
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<2x10x10x5xf32>, tensor<2x3x3x5xf32>, tensor<1xf32>, tensor<2x8x8x2xf32>) -> tensor<2x8x8x2xf32>, sym_name = "conv2d"}> ({
  ^bb0(%arg1: tensor<2x10x10x5xf32>, %arg2: tensor<2x3x3x5xf32>, %arg3: tensor<1xf32>, %arg4: tensor<2x8x8x2xf32>):
    %2 = "linalg.conv_2d_nhwc_fhwc"(%arg1, %arg2, %arg4) <{dilations = dense<1> : tensor<2xi64>, operandSegmentSizes = array<i32: 2, 1>, strides = dense<1> : tensor<2xi64>}> ({
    ^bb0(%arg5: f32, %arg6: f32, %arg7: f32):
      %3 = "arith.mulf"(%arg5, %arg6) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      %4 = "arith.addf"(%arg7, %3) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%4) : (f32) -> ()
    }) {linalg.memoized_indexing_maps = [#map, #map1, #map2]} : (tensor<2x10x10x5xf32>, tensor<2x3x3x5xf32>, tensor<2x8x8x2xf32>) -> tensor<2x8x8x2xf32>
    "func.return"(%2) : (tensor<2x8x8x2xf32>) -> ()
  }) : () -> ()
  "builtin.module"() ({
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg0: !transform.any_op):
      %0 = "transform.structured.match"(%arg0) <{ops = ["linalg.conv_2d_nhwc_fhwc"]}> : (!transform.any_op) -> !transform.any_op
      %1 = "transform.structured.winograd_conv2d"(%0) <{fmr = 1 : i32}> : (!transform.any_op) -> !transform.any_op
      "transform.yield"() : () -> ()
    }) : () -> ()
  }) {transform.with_named_sequence} : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1, d2, d3, d4, d5, d6) -> (d0, d1 + d4, d2 + d5, d6)>
#map1 = affine_map<(d0, d1, d2, d3, d4, d5, d6) -> (d3, d4, d5, d6)>
#map2 = affine_map<(d0, d1, d2, d3, d4, d5, d6) -> (d0, d1, d2, d3)>
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<2x11x11x5xf32>, tensor<2x3x3x5xf32>, tensor<1xf32>, tensor<2x9x9x2xf32>) -> tensor<2x9x9x2xf32>, sym_name = "conv2d_unaligned"}> ({
  ^bb0(%arg1: tensor<2x11x11x5xf32>, %arg2: tensor<2x3x3x5xf32>, %arg3: tensor<1xf32>, %arg4: tensor<2x9x9x2xf32>):
    %2 = "linalg.conv_2d_nhwc_fhwc"(%arg1, %arg2, %arg4) <{dilations = dense<1> : tensor<2xi64>, operandSegmentSizes = array<i32: 2, 1>, strides = dense<1> : tensor<2xi64>}> ({
    ^bb0(%arg5: f32, %arg6: f32, %arg7: f32):
      %3 = "arith.mulf"(%arg5, %arg6) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      %4 = "arith.addf"(%arg7, %3) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%4) : (f32) -> ()
    }) {linalg.memoized_indexing_maps = [#map, #map1, #map2]} : (tensor<2x11x11x5xf32>, tensor<2x3x3x5xf32>, tensor<2x9x9x2xf32>) -> tensor<2x9x9x2xf32>
    "func.return"(%2) : (tensor<2x9x9x2xf32>) -> ()
  }) : () -> ()
  "builtin.module"() ({
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg0: !transform.any_op):
      %0 = "transform.structured.match"(%arg0) <{ops = ["linalg.conv_2d_nhwc_fhwc"]}> : (!transform.any_op) -> !transform.any_op
      %1 = "transform.structured.winograd_conv2d"(%0) <{fmr = 1 : i32}> : (!transform.any_op) -> !transform.any_op
      "transform.yield"() : () -> ()
    }) : () -> ()
  }) {transform.with_named_sequence} : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1, d2, d3, d4, d5, d6) -> (d0, d1 + d4, d2 + d5, d6)>
#map1 = affine_map<(d0, d1, d2, d3, d4, d5, d6) -> (d4, d5, d6, d3)>
#map2 = affine_map<(d0, d1, d2, d3, d4, d5, d6) -> (d0, d1, d2, d3)>
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<2x10x10x5xf32>, tensor<3x3x5x2xf32>, tensor<1xf32>, tensor<2x8x8x2xf32>) -> tensor<2x8x8x2xf32>, sym_name = "conv2d_unsupported"}> ({
  ^bb0(%arg1: tensor<2x10x10x5xf32>, %arg2: tensor<3x3x5x2xf32>, %arg3: tensor<1xf32>, %arg4: tensor<2x8x8x2xf32>):
    %2 = "linalg.conv_2d_nhwc_hwcf"(%arg1, %arg2, %arg4) <{dilations = dense<1> : tensor<2xi64>, operandSegmentSizes = array<i32: 2, 1>, strides = dense<1> : tensor<2xi64>}> ({
    ^bb0(%arg5: f32, %arg6: f32, %arg7: f32):
      %3 = "arith.mulf"(%arg5, %arg6) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      %4 = "arith.addf"(%arg7, %3) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%4) : (f32) -> ()
    }) {linalg.memoized_indexing_maps = [#map, #map1, #map2]} : (tensor<2x10x10x5xf32>, tensor<3x3x5x2xf32>, tensor<2x8x8x2xf32>) -> tensor<2x8x8x2xf32>
    "func.return"(%2) : (tensor<2x8x8x2xf32>) -> ()
  }) : () -> ()
  "builtin.module"() ({
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg0: !transform.any_op):
      %0 = "transform.structured.match"(%arg0) <{ops = ["linalg.conv_2d_nhwc_hwcf"]}> : (!transform.any_op) -> !transform.any_op
      %1 = "transform.structured.winograd_conv2d"(%0) <{fmr = 1 : i32}> : (!transform.any_op) -> !transform.any_op
      "transform.yield"() : () -> ()
    }) : () -> ()
  }) {transform.with_named_sequence} : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1, d2, d3, d4, d5, d6) -> (d0, d1 + d4, d2 + d5, d6)>
#map1 = affine_map<(d0, d1, d2, d3, d4, d5, d6) -> (d3, d4, d5, d6)>
#map2 = affine_map<(d0, d1, d2, d3, d4, d5, d6) -> (d0, d1, d2, d3)>
"builtin.module"() ({
  "func.func"() <{function_type = (memref<2x10x10x5xf32>, memref<2x3x3x5xf32>, memref<2x8x8x2xf32>) -> (), sym_name = "conv2d_unsupported_type"}> ({
  ^bb0(%arg1: memref<2x10x10x5xf32>, %arg2: memref<2x3x3x5xf32>, %arg3: memref<2x8x8x2xf32>):
    "linalg.conv_2d_nhwc_fhwc"(%arg1, %arg2, %arg3) <{dilations = dense<1> : tensor<2xi64>, operandSegmentSizes = array<i32: 2, 1>, strides = dense<1> : tensor<2xi64>}> ({
    ^bb0(%arg4: f32, %arg5: f32, %arg6: f32):
      %2 = "arith.mulf"(%arg4, %arg5) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      %3 = "arith.addf"(%arg6, %2) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%3) : (f32) -> ()
    }) {linalg.memoized_indexing_maps = [#map, #map1, #map2]} : (memref<2x10x10x5xf32>, memref<2x3x3x5xf32>, memref<2x8x8x2xf32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "builtin.module"() ({
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg0: !transform.any_op):
      %0 = "transform.structured.match"(%arg0) <{ops = ["linalg.conv_2d_nhwc_fhwc"]}> : (!transform.any_op) -> !transform.any_op
      %1 = "transform.structured.winograd_conv2d"(%0) <{fmr = 1 : i32}> : (!transform.any_op) -> !transform.any_op
      "transform.yield"() : () -> ()
    }) : () -> ()
  }) {transform.with_named_sequence} : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1, d2, d3, d4, d5, d6) -> (d0, d1 + d4, d2 + d5, d6)>
#map1 = affine_map<(d0, d1, d2, d3, d4, d5, d6) -> (d3, d4, d5, d6)>
#map2 = affine_map<(d0, d1, d2, d3, d4, d5, d6) -> (d0, d1, d2, d3)>
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<2x?x?x5xf32>, tensor<2x3x3x5xf32>, tensor<1xf32>, tensor<2x?x?x2xf32>) -> tensor<2x?x?x2xf32>, sym_name = "conv2d"}> ({
  ^bb0(%arg1: tensor<2x?x?x5xf32>, %arg2: tensor<2x3x3x5xf32>, %arg3: tensor<1xf32>, %arg4: tensor<2x?x?x2xf32>):
    %2 = "linalg.conv_2d_nhwc_fhwc"(%arg1, %arg2, %arg4) <{dilations = dense<1> : tensor<2xi64>, operandSegmentSizes = array<i32: 2, 1>, strides = dense<1> : tensor<2xi64>}> ({
    ^bb0(%arg5: f32, %arg6: f32, %arg7: f32):
      %3 = "arith.mulf"(%arg5, %arg6) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      %4 = "arith.addf"(%arg7, %3) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%4) : (f32) -> ()
    }) {linalg.memoized_indexing_maps = [#map, #map1, #map2]} : (tensor<2x?x?x5xf32>, tensor<2x3x3x5xf32>, tensor<2x?x?x2xf32>) -> tensor<2x?x?x2xf32>
    "func.return"(%2) : (tensor<2x?x?x2xf32>) -> ()
  }) : () -> ()
  "builtin.module"() ({
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg0: !transform.any_op):
      %0 = "transform.structured.match"(%arg0) <{ops = ["linalg.conv_2d_nhwc_fhwc"]}> : (!transform.any_op) -> !transform.any_op
      %1 = "transform.structured.winograd_conv2d"(%0) <{fmr = 1 : i32}> : (!transform.any_op) -> !transform.any_op
      "transform.yield"() : () -> ()
    }) : () -> ()
  }) {transform.with_named_sequence} : () -> ()
}) : () -> ()

