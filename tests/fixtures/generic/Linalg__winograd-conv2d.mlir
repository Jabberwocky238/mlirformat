#map = affine_map<(d0, d1, d2, d3, d4, d5, d6) -> (d0, d1 + d4, d2 + d5, d6)>
#map1 = affine_map<(d0, d1, d2, d3, d4, d5, d6) -> (d3, d4, d5, d6)>
#map2 = affine_map<(d0, d1, d2, d3, d4, d5, d6) -> (d0, d1, d2, d3)>
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<2x6x6x5xf32>, tensor<2x3x3x5xf32>, tensor<1xf32>, tensor<2x4x4x2xf32>) -> tensor<2x4x4x2xf32>, sym_name = "conv2d_4x4_3x3"}> ({
  ^bb0(%arg0: tensor<2x6x6x5xf32>, %arg1: tensor<2x3x3x5xf32>, %arg2: tensor<1xf32>, %arg3: tensor<2x4x4x2xf32>):
    %0 = "linalg.conv_2d_nhwc_fhwc"(%arg0, %arg1, %arg3) <{dilations = dense<1> : tensor<2xi64>, operandSegmentSizes = array<i32: 2, 1>, strides = dense<1> : tensor<2xi64>}> ({
    ^bb0(%arg4: f32, %arg5: f32, %arg6: f32):
      %1 = "arith.mulf"(%arg4, %arg5) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      %2 = "arith.addf"(%arg6, %1) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%2) : (f32) -> ()
    }) {linalg.memoized_indexing_maps = [#map, #map1, #map2]} : (tensor<2x6x6x5xf32>, tensor<2x3x3x5xf32>, tensor<2x4x4x2xf32>) -> tensor<2x4x4x2xf32>
    "func.return"(%0) : (tensor<2x4x4x2xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1, d2, d3, d4, d5, d6) -> (d0, d1 + d4, d2 + d5, d6)>
#map1 = affine_map<(d0, d1, d2, d3, d4, d5, d6) -> (d3, d4, d5, d6)>
#map2 = affine_map<(d0, d1, d2, d3, d4, d5, d6) -> (d0, d1, d2, d3)>
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<2x6x6x5xf32>, tensor<2x5x5x5xf32>, tensor<1xf32>, tensor<2x2x2x2xf32>) -> tensor<2x2x2x2xf32>, sym_name = "conv2d_2x2_5x5"}> ({
  ^bb0(%arg0: tensor<2x6x6x5xf32>, %arg1: tensor<2x5x5x5xf32>, %arg2: tensor<1xf32>, %arg3: tensor<2x2x2x2xf32>):
    %0 = "linalg.conv_2d_nhwc_fhwc"(%arg0, %arg1, %arg3) <{dilations = dense<1> : tensor<2xi64>, operandSegmentSizes = array<i32: 2, 1>, strides = dense<1> : tensor<2xi64>}> ({
    ^bb0(%arg4: f32, %arg5: f32, %arg6: f32):
      %1 = "arith.mulf"(%arg4, %arg5) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      %2 = "arith.addf"(%arg6, %1) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%2) : (f32) -> ()
    }) {linalg.memoized_indexing_maps = [#map, #map1, #map2]} : (tensor<2x6x6x5xf32>, tensor<2x5x5x5xf32>, tensor<2x2x2x2xf32>) -> tensor<2x2x2x2xf32>
    "func.return"(%0) : (tensor<2x2x2x2xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1, d2, d3, d4, d5, d6) -> (d0, d1 + d4, d2 + d5, d6)>
#map1 = affine_map<(d0, d1, d2, d3, d4, d5, d6) -> (d3, d4, d5, d6)>
#map2 = affine_map<(d0, d1, d2, d3, d4, d5, d6) -> (d0, d1, d2, d3)>
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<2x1x6x5xf32>, tensor<2x1x3x5xf32>, tensor<1xf32>, tensor<2x1x4x2xf32>) -> tensor<2x1x4x2xf32>, sym_name = "conv2d_1x4_1x3"}> ({
  ^bb0(%arg0: tensor<2x1x6x5xf32>, %arg1: tensor<2x1x3x5xf32>, %arg2: tensor<1xf32>, %arg3: tensor<2x1x4x2xf32>):
    %0 = "linalg.conv_2d_nhwc_fhwc"(%arg0, %arg1, %arg3) <{dilations = dense<1> : tensor<2xi64>, operandSegmentSizes = array<i32: 2, 1>, strides = dense<1> : tensor<2xi64>}> ({
    ^bb0(%arg4: f32, %arg5: f32, %arg6: f32):
      %1 = "arith.mulf"(%arg4, %arg5) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      %2 = "arith.addf"(%arg6, %1) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%2) : (f32) -> ()
    }) {linalg.memoized_indexing_maps = [#map, #map1, #map2]} : (tensor<2x1x6x5xf32>, tensor<2x1x3x5xf32>, tensor<2x1x4x2xf32>) -> tensor<2x1x4x2xf32>
    "func.return"(%0) : (tensor<2x1x4x2xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1, d2, d3, d4, d5, d6) -> (d0, d1 + d4, d2 + d5, d6)>
#map1 = affine_map<(d0, d1, d2, d3, d4, d5, d6) -> (d3, d4, d5, d6)>
#map2 = affine_map<(d0, d1, d2, d3, d4, d5, d6) -> (d0, d1, d2, d3)>
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<2x6x1x5xf32>, tensor<2x3x1x5xf32>, tensor<1xf32>, tensor<2x4x1x2xf32>) -> tensor<2x4x1x2xf32>, sym_name = "conv2d_4x1_3x1"}> ({
  ^bb0(%arg0: tensor<2x6x1x5xf32>, %arg1: tensor<2x3x1x5xf32>, %arg2: tensor<1xf32>, %arg3: tensor<2x4x1x2xf32>):
    %0 = "linalg.conv_2d_nhwc_fhwc"(%arg0, %arg1, %arg3) <{dilations = dense<1> : tensor<2xi64>, operandSegmentSizes = array<i32: 2, 1>, strides = dense<1> : tensor<2xi64>}> ({
    ^bb0(%arg4: f32, %arg5: f32, %arg6: f32):
      %1 = "arith.mulf"(%arg4, %arg5) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      %2 = "arith.addf"(%arg6, %1) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%2) : (f32) -> ()
    }) {linalg.memoized_indexing_maps = [#map, #map1, #map2]} : (tensor<2x6x1x5xf32>, tensor<2x3x1x5xf32>, tensor<2x4x1x2xf32>) -> tensor<2x4x1x2xf32>
    "func.return"(%0) : (tensor<2x4x1x2xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1, d2, d3, d4, d5, d6) -> (d0, d1 + d4, d2 + d5, d6)>
#map1 = affine_map<(d0, d1, d2, d3, d4, d5, d6) -> (d3, d4, d5, d6)>
#map2 = affine_map<(d0, d1, d2, d3, d4, d5, d6) -> (d0, d1, d2, d3)>
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<2x10x10x5xf32>, tensor<2x3x3x5xf32>, tensor<1xf32>, tensor<2x8x8x2xf32>) -> tensor<2x8x8x2xf32>, sym_name = "conv2d_aligned"}> ({
  ^bb0(%arg0: tensor<2x10x10x5xf32>, %arg1: tensor<2x3x3x5xf32>, %arg2: tensor<1xf32>, %arg3: tensor<2x8x8x2xf32>):
    %0 = "linalg.conv_2d_nhwc_fhwc"(%arg0, %arg1, %arg3) <{dilations = dense<1> : tensor<2xi64>, operandSegmentSizes = array<i32: 2, 1>, strides = dense<1> : tensor<2xi64>}> ({
    ^bb0(%arg4: f32, %arg5: f32, %arg6: f32):
      %1 = "arith.mulf"(%arg4, %arg5) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      %2 = "arith.addf"(%arg6, %1) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%2) : (f32) -> ()
    }) {linalg.memoized_indexing_maps = [#map, #map1, #map2]} : (tensor<2x10x10x5xf32>, tensor<2x3x3x5xf32>, tensor<2x8x8x2xf32>) -> tensor<2x8x8x2xf32>
    "func.return"(%0) : (tensor<2x8x8x2xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1, d2, d3, d4, d5, d6) -> (d0, d1 + d4, d2 + d5, d6)>
#map1 = affine_map<(d0, d1, d2, d3, d4, d5, d6) -> (d3, d4, d5, d6)>
#map2 = affine_map<(d0, d1, d2, d3, d4, d5, d6) -> (d0, d1, d2, d3)>
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<2x11x11x5xf32>, tensor<2x3x3x5xf32>, tensor<1xf32>, tensor<2x9x9x2xf32>) -> tensor<2x9x9x2xf32>, sym_name = "conv2d_unaligned"}> ({
  ^bb0(%arg0: tensor<2x11x11x5xf32>, %arg1: tensor<2x3x3x5xf32>, %arg2: tensor<1xf32>, %arg3: tensor<2x9x9x2xf32>):
    %0 = "linalg.conv_2d_nhwc_fhwc"(%arg0, %arg1, %arg3) <{dilations = dense<1> : tensor<2xi64>, operandSegmentSizes = array<i32: 2, 1>, strides = dense<1> : tensor<2xi64>}> ({
    ^bb0(%arg4: f32, %arg5: f32, %arg6: f32):
      %1 = "arith.mulf"(%arg4, %arg5) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      %2 = "arith.addf"(%arg6, %1) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%2) : (f32) -> ()
    }) {linalg.memoized_indexing_maps = [#map, #map1, #map2]} : (tensor<2x11x11x5xf32>, tensor<2x3x3x5xf32>, tensor<2x9x9x2xf32>) -> tensor<2x9x9x2xf32>
    "func.return"(%0) : (tensor<2x9x9x2xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1, d2, d3, d4, d5, d6) -> (d0, d1 + d4, d2 + d5, d6)>
#map1 = affine_map<(d0, d1, d2, d3, d4, d5, d6) -> (d3, d4, d5, d6)>
#map2 = affine_map<(d0, d1, d2, d3, d4, d5, d6) -> (d0, d1, d2, d3)>
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<2x6x6x5xf16>, tensor<2x3x3x5xf16>, tensor<1xf32>, tensor<2x4x4x2xf32>) -> tensor<2x4x4x2xf32>, sym_name = "conv2d_type_promotion"}> ({
  ^bb0(%arg0: tensor<2x6x6x5xf16>, %arg1: tensor<2x3x3x5xf16>, %arg2: tensor<1xf32>, %arg3: tensor<2x4x4x2xf32>):
    %0 = "linalg.conv_2d_nhwc_fhwc"(%arg0, %arg1, %arg3) <{dilations = dense<1> : tensor<2xi64>, operandSegmentSizes = array<i32: 2, 1>, strides = dense<1> : tensor<2xi64>}> ({
    ^bb0(%arg4: f16, %arg5: f16, %arg6: f32):
      %1 = "arith.extf"(%arg4) : (f16) -> f32
      %2 = "arith.extf"(%arg5) : (f16) -> f32
      %3 = "arith.mulf"(%1, %2) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      %4 = "arith.addf"(%arg6, %3) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%4) : (f32) -> ()
    }) {linalg.memoized_indexing_maps = [#map, #map1, #map2]} : (tensor<2x6x6x5xf16>, tensor<2x3x3x5xf16>, tensor<2x4x4x2xf32>) -> tensor<2x4x4x2xf32>
    "func.return"(%0) : (tensor<2x4x4x2xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1, d2, d3, d4, d5, d6) -> (d0, d1 + d4, d2 + d5, d6)>
#map1 = affine_map<(d0, d1, d2, d3, d4, d5, d6) -> (d3, d4, d5, d6)>
#map2 = affine_map<(d0, d1, d2, d3, d4, d5, d6) -> (d0, d1, d2, d3)>
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<2x6x5x5xf32>, tensor<2x3x2x5xf32>, tensor<1xf32>, tensor<2x4x4x2xf32>) -> tensor<2x4x4x2xf32>, sym_name = "conv2d_unsupported_1"}> ({
  ^bb0(%arg0: tensor<2x6x5x5xf32>, %arg1: tensor<2x3x2x5xf32>, %arg2: tensor<1xf32>, %arg3: tensor<2x4x4x2xf32>):
    %0 = "linalg.conv_2d_nhwc_fhwc"(%arg0, %arg1, %arg3) <{dilations = dense<1> : tensor<2xi64>, operandSegmentSizes = array<i32: 2, 1>, strides = dense<1> : tensor<2xi64>}> ({
    ^bb0(%arg4: f32, %arg5: f32, %arg6: f32):
      %1 = "arith.mulf"(%arg4, %arg5) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      %2 = "arith.addf"(%arg6, %1) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%2) : (f32) -> ()
    }) {linalg.memoized_indexing_maps = [#map, #map1, #map2]} : (tensor<2x6x5x5xf32>, tensor<2x3x2x5xf32>, tensor<2x4x4x2xf32>) -> tensor<2x4x4x2xf32>
    "func.return"(%0) : (tensor<2x4x4x2xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1, d2, d3, d4, d5, d6) -> (d0, d1 + d4, d2 + d5, d6)>
#map1 = affine_map<(d0, d1, d2, d3, d4, d5, d6) -> (d3, d4, d5, d6)>
#map2 = affine_map<(d0, d1, d2, d3, d4, d5, d6) -> (d0, d1, d2, d3)>
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<2x7x7x5xf32>, tensor<2x4x4x5xf32>, tensor<1xf32>, tensor<2x4x4x2xf32>) -> tensor<2x4x4x2xf32>, sym_name = "conv2d_unsupported_2"}> ({
  ^bb0(%arg0: tensor<2x7x7x5xf32>, %arg1: tensor<2x4x4x5xf32>, %arg2: tensor<1xf32>, %arg3: tensor<2x4x4x2xf32>):
    %0 = "linalg.conv_2d_nhwc_fhwc"(%arg0, %arg1, %arg3) <{dilations = dense<1> : tensor<2xi64>, operandSegmentSizes = array<i32: 2, 1>, strides = dense<1> : tensor<2xi64>}> ({
    ^bb0(%arg4: f32, %arg5: f32, %arg6: f32):
      %1 = "arith.mulf"(%arg4, %arg5) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      %2 = "arith.addf"(%arg6, %1) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%2) : (f32) -> ()
    }) {linalg.memoized_indexing_maps = [#map, #map1, #map2]} : (tensor<2x7x7x5xf32>, tensor<2x4x4x5xf32>, tensor<2x4x4x2xf32>) -> tensor<2x4x4x2xf32>
    "func.return"(%0) : (tensor<2x4x4x2xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1, d2, d3, d4, d5, d6) -> (d0, d1 + d4, d2 + d5, d6)>
#map1 = affine_map<(d0, d1, d2, d3, d4, d5, d6) -> (d3, d4, d5, d6)>
#map2 = affine_map<(d0, d1, d2, d3, d4, d5, d6) -> (d0, d1, d2, d3)>
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<?x?x?x?xf32>, tensor<2x3x3x5xf32>, tensor<?x?x?x?xf32>) -> tensor<?x?x?x?xf32>, sym_name = "conv2d_unsupported_3"}> ({
  ^bb0(%arg0: tensor<?x?x?x?xf32>, %arg1: tensor<2x3x3x5xf32>, %arg2: tensor<?x?x?x?xf32>):
    %0 = "linalg.conv_2d_nhwc_fhwc"(%arg0, %arg1, %arg2) <{dilations = dense<1> : tensor<2xi64>, operandSegmentSizes = array<i32: 2, 1>, strides = dense<1> : tensor<2xi64>}> ({
    ^bb0(%arg3: f32, %arg4: f32, %arg5: f32):
      %1 = "arith.mulf"(%arg3, %arg4) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      %2 = "arith.addf"(%arg5, %1) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%2) : (f32) -> ()
    }) {linalg.memoized_indexing_maps = [#map, #map1, #map2]} : (tensor<?x?x?x?xf32>, tensor<2x3x3x5xf32>, tensor<?x?x?x?xf32>) -> tensor<?x?x?x?xf32>
    "func.return"(%0) : (tensor<?x?x?x?xf32>) -> ()
  }) : () -> ()
}) : () -> ()

