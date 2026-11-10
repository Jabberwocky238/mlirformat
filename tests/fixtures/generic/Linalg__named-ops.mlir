#map = affine_map<(d0, d1, d2, d3, d4) -> (d0, d1 + d4, d2)>
#map1 = affine_map<(d0, d1, d2, d3, d4) -> (d4, d2, d3)>
#map2 = affine_map<(d0, d1, d2, d3, d4) -> (d0, d1, d2, d3)>
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<1x12x8xf32>, tensor<3x8x8xf32>) -> tensor<1x10x8x8xf32>, sym_name = "depthwise_conv_1d_nwc_wcm"}> ({
  ^bb0(%arg0: tensor<1x12x8xf32>, %arg1: tensor<3x8x8xf32>):
    %0 = "arith.constant"() <{value = 0.000000e+00 : f32}> : () -> f32
    %1 = "tensor.empty"() : () -> tensor<1x10x8x8xf32>
    %2 = "linalg.fill"(%0, %1) <{operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg5: f32, %arg6: f32):
      "linalg.yield"(%arg5) : (f32) -> ()
    }) : (f32, tensor<1x10x8x8xf32>) -> tensor<1x10x8x8xf32>
    %3 = "linalg.depthwise_conv_1d_nwc_wcm"(%arg0, %arg1, %2) <{dilations = dense<1> : tensor<1xi64>, operandSegmentSizes = array<i32: 2, 1>, strides = dense<1> : tensor<1xi64>}> ({
    ^bb0(%arg2: f32, %arg3: f32, %arg4: f32):
      %4 = "arith.mulf"(%arg2, %arg3) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      %5 = "arith.addf"(%arg4, %4) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%5) : (f32) -> ()
    }) {linalg.memoized_indexing_maps = [#map, #map1, #map2]} : (tensor<1x12x8xf32>, tensor<3x8x8xf32>, tensor<1x10x8x8xf32>) -> tensor<1x10x8x8xf32>
    "func.return"(%3) : (tensor<1x10x8x8xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1, d2, d3) -> (d0, d1 + d3, d2)>
#map1 = affine_map<(d0, d1, d2, d3) -> (d3, d2)>
#map2 = affine_map<(d0, d1, d2, d3) -> (d0, d1, d2)>
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<1x12x8xf32>, tensor<3x8xf32>) -> tensor<1x10x8xf32>, sym_name = "depthwise_conv_1d_nwc_wc"}> ({
  ^bb0(%arg0: tensor<1x12x8xf32>, %arg1: tensor<3x8xf32>):
    %0 = "arith.constant"() <{value = 0.000000e+00 : f32}> : () -> f32
    %1 = "tensor.empty"() : () -> tensor<1x10x8xf32>
    %2 = "linalg.fill"(%0, %1) <{operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg5: f32, %arg6: f32):
      "linalg.yield"(%arg5) : (f32) -> ()
    }) : (f32, tensor<1x10x8xf32>) -> tensor<1x10x8xf32>
    %3 = "linalg.depthwise_conv_1d_nwc_wc"(%arg0, %arg1, %2) <{dilations = dense<1> : tensor<1xi64>, operandSegmentSizes = array<i32: 2, 1>, strides = dense<1> : tensor<1xi64>}> ({
    ^bb0(%arg2: f32, %arg3: f32, %arg4: f32):
      %4 = "arith.mulf"(%arg2, %arg3) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      %5 = "arith.addf"(%arg4, %4) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%5) : (f32) -> ()
    }) {linalg.memoized_indexing_maps = [#map, #map1, #map2]} : (tensor<1x12x8xf32>, tensor<3x8xf32>, tensor<1x10x8xf32>) -> tensor<1x10x8xf32>
    "func.return"(%3) : (tensor<1x10x8xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1, d2, d3) -> (d0, d2, d1 + d3)>
#map1 = affine_map<(d0, d1, d2, d3) -> (d2, d3)>
#map2 = affine_map<(d0, d1, d2, d3) -> (d0, d2, d1)>
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<1x8x12xf32>, tensor<8x3xf32>) -> tensor<1x8x10xf32>, sym_name = "depthwise_conv_1d_ncw_cw"}> ({
  ^bb0(%arg0: tensor<1x8x12xf32>, %arg1: tensor<8x3xf32>):
    %0 = "arith.constant"() <{value = 0.000000e+00 : f32}> : () -> f32
    %1 = "tensor.empty"() : () -> tensor<1x8x10xf32>
    %2 = "linalg.fill"(%0, %1) <{operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg5: f32, %arg6: f32):
      "linalg.yield"(%arg5) : (f32) -> ()
    }) : (f32, tensor<1x8x10xf32>) -> tensor<1x8x10xf32>
    %3 = "linalg.depthwise_conv_1d_ncw_cw"(%arg0, %arg1, %2) <{dilations = dense<1> : tensor<1xi64>, operandSegmentSizes = array<i32: 2, 1>, strides = dense<1> : tensor<1xi64>}> ({
    ^bb0(%arg2: f32, %arg3: f32, %arg4: f32):
      %4 = "arith.mulf"(%arg2, %arg3) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      %5 = "arith.addf"(%arg4, %4) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%5) : (f32) -> ()
    }) {linalg.memoized_indexing_maps = [#map, #map1, #map2]} : (tensor<1x8x12xf32>, tensor<8x3xf32>, tensor<1x8x10xf32>) -> tensor<1x8x10xf32>
    "func.return"(%3) : (tensor<1x8x10xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1, d2, d3, d4, d5, d6) -> (d0, d1 + d5, d2 + d6, d3)>
#map1 = affine_map<(d0, d1, d2, d3, d4, d5, d6) -> (d5, d6, d3, d4)>
#map2 = affine_map<(d0, d1, d2, d3, d4, d5, d6) -> (d0, d1, d2, d3, d4)>
#map3 = affine_map<(d0, d1, d2, d3) -> (d0, d1 * 2 + d3, d2)>
#map4 = affine_map<(d0, d1, d2, d3) -> (d3, d2)>
#map5 = affine_map<(d0, d1, d2, d3) -> (d0, d1, d2)>
#map6 = affine_map<(d0, d1, d2, d3, d4, d5) -> (d0, d1 * 2 + d4, d2 * 2 + d5, d3)>
#map7 = affine_map<(d0, d1, d2, d3, d4, d5) -> (d4, d5, d3)>
#map8 = affine_map<(d0, d1, d2, d3, d4, d5) -> (d0, d1, d2, d3)>
#map9 = affine_map<(d0, d1, d2, d3, d4, d5) -> (d0, d3, d1 * 2 + d4, d2 * 2 + d5)>
#map10 = affine_map<(d0, d1, d2, d3, d4, d5) -> (d3, d4, d5)>
#map11 = affine_map<(d0, d1, d2, d3, d4, d5) -> (d0, d3, d1, d2)>
#map12 = affine_map<(d0, d1, d2, d3, d4, d5, d6) -> (d0, d1 + d5 * 2, d2 + d6 * 2, d3)>
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<2x4x5x2xf32>, tensor<2x2x2x3xf32>) -> tensor<2x3x4x2x3xf32>, sym_name = "depthwise_conv_2d_nhwc_hwcm_tensor"}> ({
  ^bb0(%arg46: tensor<2x4x5x2xf32>, %arg47: tensor<2x2x2x3xf32>):
    %26 = "arith.constant"() <{value = 0.000000e+00 : f32}> : () -> f32
    %27 = "tensor.empty"() : () -> tensor<2x3x4x2x3xf32>
    %28 = "linalg.fill"(%26, %27) <{operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg51: f32, %arg52: f32):
      "linalg.yield"(%arg51) : (f32) -> ()
    }) : (f32, tensor<2x3x4x2x3xf32>) -> tensor<2x3x4x2x3xf32>
    %29 = "linalg.depthwise_conv_2d_nhwc_hwcm"(%arg46, %arg47, %28) <{dilations = dense<1> : tensor<2xi64>, operandSegmentSizes = array<i32: 2, 1>, strides = dense<1> : tensor<2xi64>}> ({
    ^bb0(%arg48: f32, %arg49: f32, %arg50: f32):
      %30 = "arith.mulf"(%arg48, %arg49) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      %31 = "arith.addf"(%arg50, %30) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%31) : (f32) -> ()
    }) {linalg.memoized_indexing_maps = [#map, #map1, #map2]} : (tensor<2x4x5x2xf32>, tensor<2x2x2x3xf32>, tensor<2x3x4x2x3xf32>) -> tensor<2x3x4x2x3xf32>
    "func.return"(%29) : (tensor<2x3x4x2x3xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (memref<2x4x5x2xf32>, memref<2x2x2x3xf32>, memref<2x3x4x2x3xf32>) -> (), sym_name = "depthwise_conv_2d_nhwc_hwcm_memref"}> ({
  ^bb0(%arg40: memref<2x4x5x2xf32>, %arg41: memref<2x2x2x3xf32>, %arg42: memref<2x3x4x2x3xf32>):
    "linalg.depthwise_conv_2d_nhwc_hwcm"(%arg40, %arg41, %arg42) <{dilations = dense<1> : tensor<2xi64>, operandSegmentSizes = array<i32: 2, 1>, strides = dense<1> : tensor<2xi64>}> ({
    ^bb0(%arg43: f32, %arg44: f32, %arg45: f32):
      %24 = "arith.mulf"(%arg43, %arg44) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      %25 = "arith.addf"(%arg45, %24) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%25) : (f32) -> ()
    }) {linalg.memoized_indexing_maps = [#map, #map1, #map2]} : (memref<2x4x5x2xf32>, memref<2x2x2x3xf32>, memref<2x3x4x2x3xf32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<1x113x96xf32>, tensor<3x96xf32>) -> tensor<1x56x96xf32>, sym_name = "depthwise_conv_1d_nw_tensor"}> ({
  ^bb0(%arg35: tensor<1x113x96xf32>, %arg36: tensor<3x96xf32>):
    %20 = "tensor.empty"() : () -> tensor<1x56x96xf32>
    %21 = "linalg.depthwise_conv_1d_nwc_wc"(%arg35, %arg36, %20) <{dilations = dense<1> : vector<1xi64>, operandSegmentSizes = array<i32: 2, 1>, strides = dense<2> : vector<1xi64>}> ({
    ^bb0(%arg37: f32, %arg38: f32, %arg39: f32):
      %22 = "arith.mulf"(%arg37, %arg38) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      %23 = "arith.addf"(%arg39, %22) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%23) : (f32) -> ()
    }) {linalg.memoized_indexing_maps = [#map3, #map4, #map5]} : (tensor<1x113x96xf32>, tensor<3x96xf32>, tensor<1x56x96xf32>) -> tensor<1x56x96xf32>
    "func.return"(%21) : (tensor<1x56x96xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<1x113x113x96xf32>, tensor<3x3x96xf32>) -> tensor<1x56x56x96xf32>, sym_name = "depthwise_conv_2d_nhwc_hwc_tensor"}> ({
  ^bb0(%arg30: tensor<1x113x113x96xf32>, %arg31: tensor<3x3x96xf32>):
    %16 = "tensor.empty"() : () -> tensor<1x56x56x96xf32>
    %17 = "linalg.depthwise_conv_2d_nhwc_hwc"(%arg30, %arg31, %16) <{dilations = dense<1> : vector<2xi64>, operandSegmentSizes = array<i32: 2, 1>, strides = dense<2> : vector<2xi64>}> ({
    ^bb0(%arg32: f32, %arg33: f32, %arg34: f32):
      %18 = "arith.mulf"(%arg32, %arg33) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      %19 = "arith.addf"(%arg34, %18) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%19) : (f32) -> ()
    }) {linalg.memoized_indexing_maps = [#map6, #map7, #map8]} : (tensor<1x113x113x96xf32>, tensor<3x3x96xf32>, tensor<1x56x56x96xf32>) -> tensor<1x56x56x96xf32>
    "func.return"(%17) : (tensor<1x56x56x96xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (memref<1x113x113x96xf32>, memref<3x3x96xf32>, memref<1x56x56x96xf32>) -> (), sym_name = "depthwise_conv_2d_nhwc_hwc_memref"}> ({
  ^bb0(%arg24: memref<1x113x113x96xf32>, %arg25: memref<3x3x96xf32>, %arg26: memref<1x56x56x96xf32>):
    "linalg.depthwise_conv_2d_nhwc_hwc"(%arg24, %arg25, %arg26) <{dilations = dense<1> : vector<2xi64>, operandSegmentSizes = array<i32: 2, 1>, strides = dense<2> : vector<2xi64>}> ({
    ^bb0(%arg27: f32, %arg28: f32, %arg29: f32):
      %14 = "arith.mulf"(%arg27, %arg28) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      %15 = "arith.addf"(%arg29, %14) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%15) : (f32) -> ()
    }) {linalg.memoized_indexing_maps = [#map6, #map7, #map8]} : (memref<1x113x113x96xf32>, memref<3x3x96xf32>, memref<1x56x56x96xf32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<1x96x113x113xf32>, tensor<96x3x3xf32>) -> tensor<1x96x56x56xf32>, sym_name = "depthwise_conv_2d_nchw_chw_tensor"}> ({
  ^bb0(%arg19: tensor<1x96x113x113xf32>, %arg20: tensor<96x3x3xf32>):
    %10 = "tensor.empty"() : () -> tensor<1x96x56x56xf32>
    %11 = "linalg.depthwise_conv_2d_nchw_chw"(%arg19, %arg20, %10) <{dilations = dense<1> : vector<2xi64>, operandSegmentSizes = array<i32: 2, 1>, strides = dense<2> : vector<2xi64>}> ({
    ^bb0(%arg21: f32, %arg22: f32, %arg23: f32):
      %12 = "arith.mulf"(%arg21, %arg22) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      %13 = "arith.addf"(%arg23, %12) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%13) : (f32) -> ()
    }) {linalg.memoized_indexing_maps = [#map9, #map10, #map11]} : (tensor<1x96x113x113xf32>, tensor<96x3x3xf32>, tensor<1x96x56x56xf32>) -> tensor<1x96x56x56xf32>
    "func.return"(%11) : (tensor<1x96x56x56xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (memref<1x96x113x113xf32>, memref<96x3x3xf32>, memref<1x96x56x56xf32>) -> (), sym_name = "depthwise_conv_2d_nchw_chw_memref"}> ({
  ^bb0(%arg13: memref<1x96x113x113xf32>, %arg14: memref<96x3x3xf32>, %arg15: memref<1x96x56x56xf32>):
    "linalg.depthwise_conv_2d_nchw_chw"(%arg13, %arg14, %arg15) <{dilations = dense<1> : vector<2xi64>, operandSegmentSizes = array<i32: 2, 1>, strides = dense<2> : vector<2xi64>}> ({
    ^bb0(%arg16: f32, %arg17: f32, %arg18: f32):
      %8 = "arith.mulf"(%arg16, %arg17) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      %9 = "arith.addf"(%arg18, %8) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%9) : (f32) -> ()
    }) {linalg.memoized_indexing_maps = [#map9, #map10, #map11]} : (memref<1x96x113x113xf32>, memref<96x3x3xf32>, memref<1x96x56x56xf32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<2x8x9x2xf32>, tensor<2x2x2x3xf32>) -> tensor<2x6x7x2x3xf32>, sym_name = "depthwise_conv_2d_nhwc_hwcm_tensor_dilated"}> ({
  ^bb0(%arg6: tensor<2x8x9x2xf32>, %arg7: tensor<2x2x2x3xf32>):
    %2 = "arith.constant"() <{value = 0.000000e+00 : f32}> : () -> f32
    %3 = "tensor.empty"() : () -> tensor<2x6x7x2x3xf32>
    %4 = "linalg.fill"(%2, %3) <{operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg11: f32, %arg12: f32):
      "linalg.yield"(%arg11) : (f32) -> ()
    }) : (f32, tensor<2x6x7x2x3xf32>) -> tensor<2x6x7x2x3xf32>
    %5 = "linalg.depthwise_conv_2d_nhwc_hwcm"(%arg6, %arg7, %4) <{dilations = dense<2> : tensor<2xi64>, operandSegmentSizes = array<i32: 2, 1>, strides = dense<1> : tensor<2xi64>}> ({
    ^bb0(%arg8: f32, %arg9: f32, %arg10: f32):
      %6 = "arith.mulf"(%arg8, %arg9) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      %7 = "arith.addf"(%arg10, %6) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%7) : (f32) -> ()
    }) {linalg.memoized_indexing_maps = [#map12, #map1, #map2]} : (tensor<2x8x9x2xf32>, tensor<2x2x2x3xf32>, tensor<2x6x7x2x3xf32>) -> tensor<2x6x7x2x3xf32>
    "func.return"(%5) : (tensor<2x6x7x2x3xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (memref<2x8x9x2xf32>, memref<2x2x2x3xf32>, memref<2x6x7x2x3xf32>) -> (), sym_name = "depthwise_conv_2d_nhwc_hwcm_memref_dilated"}> ({
  ^bb0(%arg0: memref<2x8x9x2xf32>, %arg1: memref<2x2x2x3xf32>, %arg2: memref<2x6x7x2x3xf32>):
    "linalg.depthwise_conv_2d_nhwc_hwcm"(%arg0, %arg1, %arg2) <{dilations = dense<2> : tensor<2xi64>, operandSegmentSizes = array<i32: 2, 1>, strides = dense<1> : tensor<2xi64>}> ({
    ^bb0(%arg3: f32, %arg4: f32, %arg5: f32):
      %0 = "arith.mulf"(%arg3, %arg4) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      %1 = "arith.addf"(%arg5, %0) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%1) : (f32) -> ()
    }) {linalg.memoized_indexing_maps = [#map12, #map1, #map2]} : (memref<2x8x9x2xf32>, memref<2x2x2x3xf32>, memref<2x6x7x2x3xf32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1, d2, d3, d4, d5) -> (d0, d1 + d4, d2 + d5, d3)>
#map1 = affine_map<(d0, d1, d2, d3, d4, d5) -> (d4, d5, d3)>
#map2 = affine_map<(d0, d1, d2, d3, d4, d5) -> (d0, d1, d2, d3)>
"builtin.module"() ({
  "func.func"() <{function_type = (memref<1x113x113x96xf32>, memref<3x3x96xf32>, memref<1x56x56x96xf32>) -> (), sym_name = "depthwise_conv_2d_input_nhwc_filter_default_attributes"}> ({
  ^bb0(%arg0: memref<1x113x113x96xf32>, %arg1: memref<3x3x96xf32>, %arg2: memref<1x56x56x96xf32>):
    "linalg.depthwise_conv_2d_nhwc_hwc"(%arg0, %arg1, %arg2) <{operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg3: f32, %arg4: f32, %arg5: f32):
      %0 = "arith.mulf"(%arg3, %arg4) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      %1 = "arith.addf"(%arg5, %0) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%1) : (f32) -> ()
    }) {linalg.memoized_indexing_maps = [#map, #map1, #map2]} : (memref<1x113x113x96xf32>, memref<3x3x96xf32>, memref<1x56x56x96xf32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
// -----
// -----
// -----
#map = affine_map<(d0, d1, d2, d3, d4, d5, d6, d7, d8) -> (d0, d1 * 2 + d5, d2 + d6, d3 * 3 + d7, d8)>
#map1 = affine_map<(d0, d1, d2, d3, d4, d5, d6, d7, d8) -> (d5, d6, d7, d8, d4)>
#map2 = affine_map<(d0, d1, d2, d3, d4, d5, d6, d7, d8) -> (d0, d1, d2, d3, d8, d4)>
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<2x6x13x12x6xf32>, tensor<2x1x3x6x6xf32>) -> tensor<2x3x13x4x6x6xf32>, sym_name = "depthwise_conv_3d_ndhwc_dhwcm"}> ({
  ^bb0(%arg0: tensor<2x6x13x12x6xf32>, %arg1: tensor<2x1x3x6x6xf32>):
    %0 = "arith.constant"() <{value = 0.000000e+00 : f32}> : () -> f32
    %1 = "tensor.empty"() : () -> tensor<2x3x13x4x6x6xf32>
    %2 = "linalg.fill"(%0, %1) <{operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg5: f32, %arg6: f32):
      "linalg.yield"(%arg5) : (f32) -> ()
    }) : (f32, tensor<2x3x13x4x6x6xf32>) -> tensor<2x3x13x4x6x6xf32>
    %3 = "linalg.depthwise_conv_3d_ndhwc_dhwcm"(%arg0, %arg1, %2) <{dilations = dense<1> : tensor<3xi64>, operandSegmentSizes = array<i32: 2, 1>, strides = dense<[2, 1, 3]> : tensor<3xi64>}> ({
    ^bb0(%arg2: f32, %arg3: f32, %arg4: f32):
      %4 = "arith.mulf"(%arg2, %arg3) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      %5 = "arith.addf"(%arg4, %4) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%5) : (f32) -> ()
    }) {linalg.memoized_indexing_maps = [#map, #map1, #map2]} : (tensor<2x6x13x12x6xf32>, tensor<2x1x3x6x6xf32>, tensor<2x3x13x4x6x6xf32>) -> tensor<2x3x13x4x6x6xf32>
    "func.return"(%3) : (tensor<2x3x13x4x6x6xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1, d2, d3, d4, d5, d6, d7) -> (d0, d1 * 2 + d4, d2 + d5, d3 * 3 + d6, d7)>
#map1 = affine_map<(d0, d1, d2, d3, d4, d5, d6, d7) -> (d4, d5, d6, d7)>
#map2 = affine_map<(d0, d1, d2, d3, d4, d5, d6, d7) -> (d0, d1, d2, d3, d7)>
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<2x6x13x12x6xf32>, tensor<2x1x3x6xf32>) -> tensor<2x3x13x4x6xf32>, sym_name = "depthwise_conv_3d_ndhwc_dhwc"}> ({
  ^bb0(%arg0: tensor<2x6x13x12x6xf32>, %arg1: tensor<2x1x3x6xf32>):
    %0 = "arith.constant"() <{value = 0.000000e+00 : f32}> : () -> f32
    %1 = "tensor.empty"() : () -> tensor<2x3x13x4x6xf32>
    %2 = "linalg.fill"(%0, %1) <{operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg5: f32, %arg6: f32):
      "linalg.yield"(%arg5) : (f32) -> ()
    }) : (f32, tensor<2x3x13x4x6xf32>) -> tensor<2x3x13x4x6xf32>
    %3 = "linalg.depthwise_conv_3d_ndhwc_dhwc"(%arg0, %arg1, %2) <{dilations = dense<1> : tensor<3xi64>, operandSegmentSizes = array<i32: 2, 1>, strides = dense<[2, 1, 3]> : tensor<3xi64>}> ({
    ^bb0(%arg2: f32, %arg3: f32, %arg4: f32):
      %4 = "arith.mulf"(%arg2, %arg3) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      %5 = "arith.addf"(%arg4, %4) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%5) : (f32) -> ()
    }) {linalg.memoized_indexing_maps = [#map, #map1, #map2]} : (tensor<2x6x13x12x6xf32>, tensor<2x1x3x6xf32>, tensor<2x3x13x4x6xf32>) -> tensor<2x3x13x4x6xf32>
    "func.return"(%3) : (tensor<2x3x13x4x6xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1, d2, d3, d4, d5, d6, d7) -> (d0, d7, d1 * 2 + d4, d2 + d5, d3 * 3 + d6)>
#map1 = affine_map<(d0, d1, d2, d3, d4, d5, d6, d7) -> (d7, d4, d5, d6)>
#map2 = affine_map<(d0, d1, d2, d3, d4, d5, d6, d7) -> (d0, d7, d1, d2, d3)>
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<2x6x6x13x12xf32>, tensor<6x2x1x3xf32>) -> tensor<2x6x3x13x4xf32>, sym_name = "depthwise_conv_3d_ncdhw_cdhw"}> ({
  ^bb0(%arg0: tensor<2x6x6x13x12xf32>, %arg1: tensor<6x2x1x3xf32>):
    %0 = "arith.constant"() <{value = 0.000000e+00 : f32}> : () -> f32
    %1 = "tensor.empty"() : () -> tensor<2x6x3x13x4xf32>
    %2 = "linalg.fill"(%0, %1) <{operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg5: f32, %arg6: f32):
      "linalg.yield"(%arg5) : (f32) -> ()
    }) : (f32, tensor<2x6x3x13x4xf32>) -> tensor<2x6x3x13x4xf32>
    %3 = "linalg.depthwise_conv_3d_ncdhw_cdhw"(%arg0, %arg1, %2) <{dilations = dense<1> : tensor<3xi64>, operandSegmentSizes = array<i32: 2, 1>, strides = dense<[2, 1, 3]> : tensor<3xi64>}> ({
    ^bb0(%arg2: f32, %arg3: f32, %arg4: f32):
      %4 = "arith.mulf"(%arg2, %arg3) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      %5 = "arith.addf"(%arg4, %4) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%5) : (f32) -> ()
    }) {linalg.memoized_indexing_maps = [#map, #map1, #map2]} : (tensor<2x6x6x13x12xf32>, tensor<6x2x1x3xf32>, tensor<2x6x3x13x4xf32>) -> tensor<2x6x3x13x4xf32>
    "func.return"(%3) : (tensor<2x6x3x13x4xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1, d2, d3, d4) -> (d0, d1 + d3, d4)>
#map1 = affine_map<(d0, d1, d2, d3, d4) -> (d3, d4, d2)>
#map2 = affine_map<(d0, d1, d2, d3, d4) -> (d0, d1, d2)>
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<?x?x?xf32>, tensor<?x?x?xf32>, tensor<?x?x?xf32>) -> tensor<?x?x?xf32>, sym_name = "conv_1d_nwc_wcf"}> ({
  ^bb0(%arg0: tensor<?x?x?xf32>, %arg1: tensor<?x?x?xf32>, %arg2: tensor<?x?x?xf32>):
    %0 = "linalg.conv_1d_nwc_wcf"(%arg0, %arg1, %arg2) <{dilations = dense<1> : tensor<1xi64>, operandSegmentSizes = array<i32: 2, 1>, strides = dense<1> : tensor<1xi64>}> ({
    ^bb0(%arg3: f32, %arg4: f32, %arg5: f32):
      %1 = "arith.mulf"(%arg3, %arg4) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      %2 = "arith.addf"(%arg5, %1) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%2) : (f32) -> ()
    }) {linalg.memoized_indexing_maps = [#map, #map1, #map2]} : (tensor<?x?x?xf32>, tensor<?x?x?xf32>, tensor<?x?x?xf32>) -> tensor<?x?x?xf32>
    "func.return"(%0) : (tensor<?x?x?xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1, d2, d3, d4) -> (d0, d1 + d3, d4)>
#map1 = affine_map<(d0, d1, d2, d3, d4) -> (d3, d4, d2)>
#map2 = affine_map<(d0, d1, d2, d3, d4) -> (d0, d1, d2)>
"builtin.module"() ({
  "func.func"() <{function_type = (memref<?x?x?xf32>, memref<?x?x?xf32>, memref<?x?x?xf32>) -> (), sym_name = "conv_1d_nwc_wcf"}> ({
  ^bb0(%arg0: memref<?x?x?xf32>, %arg1: memref<?x?x?xf32>, %arg2: memref<?x?x?xf32>):
    "linalg.conv_1d_nwc_wcf"(%arg0, %arg1, %arg2) <{dilations = dense<1> : tensor<1xi64>, operandSegmentSizes = array<i32: 2, 1>, strides = dense<1> : tensor<1xi64>}> ({
    ^bb0(%arg3: f32, %arg4: f32, %arg5: f32):
      %0 = "arith.mulf"(%arg3, %arg4) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      %1 = "arith.addf"(%arg5, %0) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%1) : (f32) -> ()
    }) {linalg.memoized_indexing_maps = [#map, #map1, #map2]} : (memref<?x?x?xf32>, memref<?x?x?xf32>, memref<?x?x?xf32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1, d2, d3, d4) -> (d0, d3, d2 + d4)>
#map1 = affine_map<(d0, d1, d2, d3, d4) -> (d1, d3, d4)>
#map2 = affine_map<(d0, d1, d2, d3, d4) -> (d0, d1, d2)>
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<?x?x?xf32>, tensor<?x?x?xf32>, tensor<?x?x?xf32>) -> tensor<?x?x?xf32>, sym_name = "conv_1d_ncw_fcw"}> ({
  ^bb0(%arg0: tensor<?x?x?xf32>, %arg1: tensor<?x?x?xf32>, %arg2: tensor<?x?x?xf32>):
    %0 = "linalg.conv_1d_ncw_fcw"(%arg0, %arg1, %arg2) <{dilations = dense<1> : tensor<1xi64>, operandSegmentSizes = array<i32: 2, 1>, strides = dense<1> : tensor<1xi64>}> ({
    ^bb0(%arg3: f32, %arg4: f32, %arg5: f32):
      %1 = "arith.mulf"(%arg3, %arg4) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      %2 = "arith.addf"(%arg5, %1) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%2) : (f32) -> ()
    }) {linalg.memoized_indexing_maps = [#map, #map1, #map2]} : (tensor<?x?x?xf32>, tensor<?x?x?xf32>, tensor<?x?x?xf32>) -> tensor<?x?x?xf32>
    "func.return"(%0) : (tensor<?x?x?xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1, d2, d3, d4) -> (d0, d3, d2 + d4)>
#map1 = affine_map<(d0, d1, d2, d3, d4) -> (d1, d3, d4)>
#map2 = affine_map<(d0, d1, d2, d3, d4) -> (d0, d1, d2)>
"builtin.module"() ({
  "func.func"() <{function_type = (memref<?x?x?xf32>, memref<?x?x?xf32>, memref<?x?x?xf32>) -> (), sym_name = "conv_1d_ncw_fcw"}> ({
  ^bb0(%arg0: memref<?x?x?xf32>, %arg1: memref<?x?x?xf32>, %arg2: memref<?x?x?xf32>):
    "linalg.conv_1d_ncw_fcw"(%arg0, %arg1, %arg2) <{dilations = dense<1> : tensor<1xi64>, operandSegmentSizes = array<i32: 2, 1>, strides = dense<1> : tensor<1xi64>}> ({
    ^bb0(%arg3: f32, %arg4: f32, %arg5: f32):
      %0 = "arith.mulf"(%arg3, %arg4) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      %1 = "arith.addf"(%arg5, %0) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%1) : (f32) -> ()
    }) {linalg.memoized_indexing_maps = [#map, #map1, #map2]} : (memref<?x?x?xf32>, memref<?x?x?xf32>, memref<?x?x?xf32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1, d2, d3, d4, d5, d6) -> (d0, d1 + d4, d2 + d5, d6)>
#map1 = affine_map<(d0, d1, d2, d3, d4, d5, d6) -> (d4, d5, d6, d3)>
#map2 = affine_map<(d0, d1, d2, d3, d4, d5, d6) -> (d0, d1, d2, d3)>
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<?x?x?x?xf32>, tensor<?x?x?x?xf32>, tensor<?x?x?x?xf32>) -> tensor<?x?x?x?xf32>, sym_name = "conv_2d_nhwc_hwcf"}> ({
  ^bb0(%arg0: tensor<?x?x?x?xf32>, %arg1: tensor<?x?x?x?xf32>, %arg2: tensor<?x?x?x?xf32>):
    %0 = "linalg.conv_2d_nhwc_hwcf"(%arg0, %arg1, %arg2) <{dilations = dense<1> : tensor<2xi64>, operandSegmentSizes = array<i32: 2, 1>, strides = dense<1> : tensor<2xi64>}> ({
    ^bb0(%arg3: f32, %arg4: f32, %arg5: f32):
      %1 = "arith.mulf"(%arg3, %arg4) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      %2 = "arith.addf"(%arg5, %1) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%2) : (f32) -> ()
    }) {linalg.memoized_indexing_maps = [#map, #map1, #map2]} : (tensor<?x?x?x?xf32>, tensor<?x?x?x?xf32>, tensor<?x?x?x?xf32>) -> tensor<?x?x?x?xf32>
    "func.return"(%0) : (tensor<?x?x?x?xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1, d2, d3, d4, d5, d6, d7) -> (d0, d1, d5, d3 + d6, d4 + d7)>
#map1 = affine_map<(d0, d1, d2, d3, d4, d5, d6, d7) -> (d2, d1, d5, d6, d7)>
#map2 = affine_map<(d0, d1, d2, d3, d4, d5, d6, d7) -> (d0, d1, d2, d3, d4)>
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<?x?x?x?x?xf32>, tensor<?x?x?x?x?xf32>, tensor<?x?x?x?x?xf32>) -> tensor<?x?x?x?x?xf32>, sym_name = "conv_2d_ngchw_fgchw"}> ({
  ^bb0(%arg0: tensor<?x?x?x?x?xf32>, %arg1: tensor<?x?x?x?x?xf32>, %arg2: tensor<?x?x?x?x?xf32>):
    %0 = "linalg.conv_2d_ngchw_fgchw"(%arg0, %arg1, %arg2) <{dilations = dense<1> : tensor<2xi64>, operandSegmentSizes = array<i32: 2, 1>, strides = dense<1> : tensor<2xi64>}> ({
    ^bb0(%arg3: f32, %arg4: f32, %arg5: f32):
      %1 = "arith.mulf"(%arg3, %arg4) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      %2 = "arith.addf"(%arg5, %1) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%2) : (f32) -> ()
    }) {linalg.memoized_indexing_maps = [#map, #map1, #map2]} : (tensor<?x?x?x?x?xf32>, tensor<?x?x?x?x?xf32>, tensor<?x?x?x?x?xf32>) -> tensor<?x?x?x?x?xf32>
    "func.return"(%0) : (tensor<?x?x?x?x?xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1, d2, d3, d4, d5, d6) -> (d0, d1 + d4, d2 + d5, d6)>
#map1 = affine_map<(d0, d1, d2, d3, d4, d5, d6) -> (d3, d4, d5, d6)>
#map2 = affine_map<(d0, d1, d2, d3, d4, d5, d6) -> (d0, d1, d2, d3)>
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<?x?x?x?xf32>, tensor<?x?x?x?xf32>, tensor<?x?x?x?xf32>) -> tensor<?x?x?x?xf32>, sym_name = "conv_2d_nhwc_fhwc"}> ({
  ^bb0(%arg0: tensor<?x?x?x?xf32>, %arg1: tensor<?x?x?x?xf32>, %arg2: tensor<?x?x?x?xf32>):
    %0 = "linalg.conv_2d_nhwc_fhwc"(%arg0, %arg1, %arg2) <{dilations = dense<1> : tensor<2xi64>, operandSegmentSizes = array<i32: 2, 1>, strides = dense<1> : tensor<2xi64>}> ({
    ^bb0(%arg3: f32, %arg4: f32, %arg5: f32):
      %1 = "arith.mulf"(%arg3, %arg4) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      %2 = "arith.addf"(%arg5, %1) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%2) : (f32) -> ()
    }) {linalg.memoized_indexing_maps = [#map, #map1, #map2]} : (tensor<?x?x?x?xf32>, tensor<?x?x?x?xf32>, tensor<?x?x?x?xf32>) -> tensor<?x?x?x?xf32>
    "func.return"(%0) : (tensor<?x?x?x?xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1, d2, d3, d4, d5, d6) -> (d0, d1 + d4, d2 + d5, d6)>
#map1 = affine_map<(d0, d1, d2, d3, d4, d5, d6) -> (d3, d4, d5, d6)>
#map2 = affine_map<(d0, d1, d2, d3, d4, d5, d6) -> (d0, d1, d2, d3)>
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<?x128x128x32xf32>, tensor<64x3x3x32xf32>, tensor<?x126x126x64xf32>) -> tensor<?x126x126x64xf32>, sym_name = "conv_2d_nhwc_fhwc_static"}> ({
  ^bb0(%arg0: tensor<?x128x128x32xf32>, %arg1: tensor<64x3x3x32xf32>, %arg2: tensor<?x126x126x64xf32>):
    %0 = "linalg.conv_2d_nhwc_fhwc"(%arg0, %arg1, %arg2) <{dilations = dense<1> : tensor<2xi64>, operandSegmentSizes = array<i32: 2, 1>, strides = dense<1> : tensor<2xi64>}> ({
    ^bb0(%arg3: f32, %arg4: f32, %arg5: f32):
      %1 = "arith.mulf"(%arg3, %arg4) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      %2 = "arith.addf"(%arg5, %1) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%2) : (f32) -> ()
    }) {linalg.memoized_indexing_maps = [#map, #map1, #map2]} : (tensor<?x128x128x32xf32>, tensor<64x3x3x32xf32>, tensor<?x126x126x64xf32>) -> tensor<?x126x126x64xf32>
    "func.return"(%0) : (tensor<?x126x126x64xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1, d2, d3, d4, d5, d6) -> (d0, d1 + d4, d2 + d5, d6)>
#map1 = affine_map<(d0, d1, d2, d3, d4, d5, d6) -> (d4, d5, d6, d3)>
#map2 = affine_map<(d0, d1, d2, d3, d4, d5, d6) -> (d0, d1, d2, d3)>
"builtin.module"() ({
  "func.func"() <{function_type = (memref<?x?x?x?xf32>, memref<?x?x?x?xf32>, memref<?x?x?x?xf32>) -> (), sym_name = "conv_2d_nhwc_hwcf"}> ({
  ^bb0(%arg0: memref<?x?x?x?xf32>, %arg1: memref<?x?x?x?xf32>, %arg2: memref<?x?x?x?xf32>):
    "linalg.conv_2d_nhwc_hwcf"(%arg0, %arg1, %arg2) <{dilations = dense<1> : tensor<2xi64>, operandSegmentSizes = array<i32: 2, 1>, strides = dense<1> : tensor<2xi64>}> ({
    ^bb0(%arg3: f32, %arg4: f32, %arg5: f32):
      %0 = "arith.mulf"(%arg3, %arg4) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      %1 = "arith.addf"(%arg5, %0) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%1) : (f32) -> ()
    }) {linalg.memoized_indexing_maps = [#map, #map1, #map2]} : (memref<?x?x?x?xf32>, memref<?x?x?x?xf32>, memref<?x?x?x?xf32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1, d2, d3, d4, d5, d6, d7) -> (d0, d1, d5, d3 + d6, d4 + d7)>
#map1 = affine_map<(d0, d1, d2, d3, d4, d5, d6, d7) -> (d2, d1, d5, d6, d7)>
#map2 = affine_map<(d0, d1, d2, d3, d4, d5, d6, d7) -> (d0, d1, d2, d3, d4)>
"builtin.module"() ({
  "func.func"() <{function_type = (memref<?x?x?x?x?xf32>, memref<?x?x?x?x?xf32>, memref<?x?x?x?x?xf32>) -> (), sym_name = "conv_2d_ngchw_fgchw"}> ({
  ^bb0(%arg0: memref<?x?x?x?x?xf32>, %arg1: memref<?x?x?x?x?xf32>, %arg2: memref<?x?x?x?x?xf32>):
    "linalg.conv_2d_ngchw_fgchw"(%arg0, %arg1, %arg2) <{dilations = dense<1> : tensor<2xi64>, operandSegmentSizes = array<i32: 2, 1>, strides = dense<1> : tensor<2xi64>}> ({
    ^bb0(%arg3: f32, %arg4: f32, %arg5: f32):
      %0 = "arith.mulf"(%arg3, %arg4) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      %1 = "arith.addf"(%arg5, %0) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%1) : (f32) -> ()
    }) {linalg.memoized_indexing_maps = [#map, #map1, #map2]} : (memref<?x?x?x?x?xf32>, memref<?x?x?x?x?xf32>, memref<?x?x?x?x?xf32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1, d2, d3, d4, d5, d6, d7) -> (d0, d1 + d5, d2 + d6, d3, d7)>
#map1 = affine_map<(d0, d1, d2, d3, d4, d5, d6, d7) -> (d3, d4, d5, d6, d7)>
#map2 = affine_map<(d0, d1, d2, d3, d4, d5, d6, d7) -> (d0, d1, d2, d3, d4)>
"builtin.module"() ({
  "func.func"() <{function_type = (memref<?x?x?x?x?xf32>, memref<?x?x?x?x?xf32>, memref<?x?x?x?x?xf32>) -> (), sym_name = "conv_2d_nhwgc_gfhwc"}> ({
  ^bb0(%arg0: memref<?x?x?x?x?xf32>, %arg1: memref<?x?x?x?x?xf32>, %arg2: memref<?x?x?x?x?xf32>):
    "linalg.conv_2d_nhwgc_gfhwc"(%arg0, %arg1, %arg2) <{dilations = dense<1> : tensor<2xi64>, operandSegmentSizes = array<i32: 2, 1>, strides = dense<1> : tensor<2xi64>}> ({
    ^bb0(%arg3: f32, %arg4: f32, %arg5: f32):
      %0 = "arith.mulf"(%arg3, %arg4) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      %1 = "arith.addf"(%arg5, %0) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%1) : (f32) -> ()
    }) {linalg.memoized_indexing_maps = [#map, #map1, #map2]} : (memref<?x?x?x?x?xf32>, memref<?x?x?x?x?xf32>, memref<?x?x?x?x?xf32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1, d2, d3, d4, d5, d6, d7) -> (d0, d1 + d5, d2 + d6, d3, d7)>
#map1 = affine_map<(d0, d1, d2, d3, d4, d5, d6, d7) -> (d3, d4, d5, d6, d7)>
#map2 = affine_map<(d0, d1, d2, d3, d4, d5, d6, d7) -> (d0, d1, d2, d3, d4)>
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<1x28x28x2x3xf32>, tensor<2x8x3x3x3xf32>, tensor<1x26x26x2x8xf32>) -> tensor<1x26x26x2x8xf32>, sym_name = "conv_2d_nhwgc_gfhwc_tensor"}> ({
  ^bb0(%arg0: tensor<1x28x28x2x3xf32>, %arg1: tensor<2x8x3x3x3xf32>, %arg2: tensor<1x26x26x2x8xf32>):
    %0 = "linalg.conv_2d_nhwgc_gfhwc"(%arg0, %arg1, %arg2) <{dilations = dense<1> : tensor<2xi64>, operandSegmentSizes = array<i32: 2, 1>, strides = dense<1> : tensor<2xi64>}> ({
    ^bb0(%arg3: f32, %arg4: f32, %arg5: f32):
      %1 = "arith.mulf"(%arg3, %arg4) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      %2 = "arith.addf"(%arg5, %1) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%2) : (f32) -> ()
    }) {linalg.memoized_indexing_maps = [#map, #map1, #map2]} : (tensor<1x28x28x2x3xf32>, tensor<2x8x3x3x3xf32>, tensor<1x26x26x2x8xf32>) -> tensor<1x26x26x2x8xf32>
    "func.return"(%0) : (tensor<1x26x26x2x8xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1, d2, d3, d4, d5, d6, d7) -> (d0, d1, d5, d3 + d6, d4 + d7)>
#map1 = affine_map<(d0, d1, d2, d3, d4, d5, d6, d7) -> (d2, d1, d5, d6, d7)>
#map2 = affine_map<(d0, d1, d2, d3, d4, d5, d6, d7) -> (d0, d1, d2, d3, d4)>
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<1x5x3x32x32xf32>, tensor<2x5x3x3x3xf32>, tensor<1x5x2x30x30xf32>) -> tensor<1x5x2x30x30xf32>, sym_name = "conv_2d_ngchw_fgchw_dimensions"}> ({
  ^bb0(%arg0: tensor<1x5x3x32x32xf32>, %arg1: tensor<2x5x3x3x3xf32>, %arg2: tensor<1x5x2x30x30xf32>):
    %0 = "linalg.conv_2d_ngchw_fgchw"(%arg0, %arg1, %arg2) <{dilations = dense<1> : tensor<2xi64>, operandSegmentSizes = array<i32: 2, 1>, strides = dense<1> : tensor<2xi64>}> ({
    ^bb0(%arg3: f32, %arg4: f32, %arg5: f32):
      %1 = "arith.mulf"(%arg3, %arg4) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      %2 = "arith.addf"(%arg5, %1) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%2) : (f32) -> ()
    }) {linalg.memoized_indexing_maps = [#map, #map1, #map2]} : (tensor<1x5x3x32x32xf32>, tensor<2x5x3x3x3xf32>, tensor<1x5x2x30x30xf32>) -> tensor<1x5x2x30x30xf32>
    "func.return"(%0) : (tensor<1x5x2x30x30xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1, d2, d3, d4, d5, d6, d7) -> (d0, d1, d5, d3 + d6, d4 + d7)>
#map1 = affine_map<(d0, d1, d2, d3, d4, d5, d6, d7) -> (d1, d2, d5, d6, d7)>
#map2 = affine_map<(d0, d1, d2, d3, d4, d5, d6, d7) -> (d0, d1, d2, d3, d4)>
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<1x5x3x32x32xf32>, tensor<5x2x3x3x3xf32>, tensor<1x5x2x30x30xf32>) -> tensor<1x5x2x30x30xf32>, sym_name = "conv_2d_ngchw_gfchw"}> ({
  ^bb0(%arg0: tensor<1x5x3x32x32xf32>, %arg1: tensor<5x2x3x3x3xf32>, %arg2: tensor<1x5x2x30x30xf32>):
    %0 = "linalg.conv_2d_ngchw_gfchw"(%arg0, %arg1, %arg2) <{dilations = dense<1> : tensor<2xi64>, operandSegmentSizes = array<i32: 2, 1>, strides = dense<1> : tensor<2xi64>}> ({
    ^bb0(%arg3: f32, %arg4: f32, %arg5: f32):
      %1 = "arith.mulf"(%arg3, %arg4) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      %2 = "arith.addf"(%arg5, %1) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%2) : (f32) -> ()
    }) {linalg.memoized_indexing_maps = [#map, #map1, #map2]} : (tensor<1x5x3x32x32xf32>, tensor<5x2x3x3x3xf32>, tensor<1x5x2x30x30xf32>) -> tensor<1x5x2x30x30xf32>
    "func.return"(%0) : (tensor<1x5x2x30x30xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1, d2, d3, d4, d5, d6, d7) -> (d0, d1, d5, d3 + d6, d4 + d7)>
#map1 = affine_map<(d0, d1, d2, d3, d4, d5, d6, d7) -> (d1, d2, d5, d6, d7)>
#map2 = affine_map<(d0, d1, d2, d3, d4, d5, d6, d7) -> ()>
#map3 = affine_map<(d0, d1, d2, d3, d4, d5, d6, d7) -> (d0, d1, d2, d3, d4)>
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<1x5x3x32x32xi8>, tensor<5x2x3x3x3xi8>, i32, i32, tensor<1x5x2x30x30xi32>) -> tensor<1x5x2x30x30xi32>, sym_name = "conv_2d_ngchw_gfchw_q"}> ({
  ^bb0(%arg0: tensor<1x5x3x32x32xi8>, %arg1: tensor<5x2x3x3x3xi8>, %arg2: i32, %arg3: i32, %arg4: tensor<1x5x2x30x30xi32>):
    %0 = "linalg.conv_2d_ngchw_gfchw_q"(%arg0, %arg1, %arg2, %arg3, %arg4) <{dilations = dense<1> : tensor<2xi64>, operandSegmentSizes = array<i32: 4, 1>, strides = dense<1> : tensor<2xi64>}> ({
    ^bb0(%arg5: i8, %arg6: i8, %arg7: i32, %arg8: i32, %arg9: i32):
      %1 = "arith.extsi"(%arg5) : (i8) -> i32
      %2 = "arith.subi"(%1, %arg7) <{overflowFlags = #arith.overflow<none>}> : (i32, i32) -> i32
      %3 = "arith.extsi"(%arg6) : (i8) -> i32
      %4 = "arith.subi"(%3, %arg8) <{overflowFlags = #arith.overflow<none>}> : (i32, i32) -> i32
      %5 = "arith.muli"(%2, %4) <{overflowFlags = #arith.overflow<none>}> : (i32, i32) -> i32
      %6 = "arith.addi"(%arg9, %5) <{overflowFlags = #arith.overflow<none>}> : (i32, i32) -> i32
      "linalg.yield"(%6) : (i32) -> ()
    }) {linalg.memoized_indexing_maps = [#map, #map1, #map2, #map2, #map3]} : (tensor<1x5x3x32x32xi8>, tensor<5x2x3x3x3xi8>, i32, i32, tensor<1x5x2x30x30xi32>) -> tensor<1x5x2x30x30xi32>
    "func.return"(%0) : (tensor<1x5x2x30x30xi32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1, d2, d3, d4, d5, d6, d7, d8) -> (d0, d1 + d5, d2 + d6, d3 + d7, d8)>
#map1 = affine_map<(d0, d1, d2, d3, d4, d5, d6, d7, d8) -> (d5, d6, d7, d8, d4)>
#map2 = affine_map<(d0, d1, d2, d3, d4, d5, d6, d7, d8) -> (d0, d1, d2, d3, d4)>
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<?x?x?x?x?xf32>, tensor<?x?x?x?x?xf32>, tensor<?x?x?x?x?xf32>) -> tensor<?x?x?x?x?xf32>, sym_name = "conv_3d_ndhwc_dhwcf"}> ({
  ^bb0(%arg0: tensor<?x?x?x?x?xf32>, %arg1: tensor<?x?x?x?x?xf32>, %arg2: tensor<?x?x?x?x?xf32>):
    %0 = "linalg.conv_3d_ndhwc_dhwcf"(%arg0, %arg1, %arg2) <{dilations = dense<1> : tensor<3xi64>, operandSegmentSizes = array<i32: 2, 1>, strides = dense<1> : tensor<3xi64>}> ({
    ^bb0(%arg3: f32, %arg4: f32, %arg5: f32):
      %1 = "arith.mulf"(%arg3, %arg4) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      %2 = "arith.addf"(%arg5, %1) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%2) : (f32) -> ()
    }) {linalg.memoized_indexing_maps = [#map, #map1, #map2]} : (tensor<?x?x?x?x?xf32>, tensor<?x?x?x?x?xf32>, tensor<?x?x?x?x?xf32>) -> tensor<?x?x?x?x?xf32>
    "func.return"(%0) : (tensor<?x?x?x?x?xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1, d2, d3, d4, d5, d6, d7, d8) -> (d0, d1 + d5, d2 + d6, d3 + d7, d8)>
#map1 = affine_map<(d0, d1, d2, d3, d4, d5, d6, d7, d8) -> (d5, d6, d7, d8, d4)>
#map2 = affine_map<(d0, d1, d2, d3, d4, d5, d6, d7, d8) -> (d0, d1, d2, d3, d4)>
"builtin.module"() ({
  "func.func"() <{function_type = (memref<?x?x?x?x?xf32>, memref<?x?x?x?x?xf32>, memref<?x?x?x?x?xf32>) -> (), sym_name = "conv_3d_ndhwc_dhwcf"}> ({
  ^bb0(%arg0: memref<?x?x?x?x?xf32>, %arg1: memref<?x?x?x?x?xf32>, %arg2: memref<?x?x?x?x?xf32>):
    "linalg.conv_3d_ndhwc_dhwcf"(%arg0, %arg1, %arg2) <{dilations = dense<1> : tensor<3xi64>, operandSegmentSizes = array<i32: 2, 1>, strides = dense<1> : tensor<3xi64>}> ({
    ^bb0(%arg3: f32, %arg4: f32, %arg5: f32):
      %0 = "arith.mulf"(%arg3, %arg4) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      %1 = "arith.addf"(%arg5, %0) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%1) : (f32) -> ()
    }) {linalg.memoized_indexing_maps = [#map, #map1, #map2]} : (memref<?x?x?x?x?xf32>, memref<?x?x?x?x?xf32>, memref<?x?x?x?x?xf32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1, d2, d3, d4, d5, d6, d7, d8) -> (d0, d5, d2 + d6, d3 + d7, d4 + d8)>
#map1 = affine_map<(d0, d1, d2, d3, d4, d5, d6, d7, d8) -> (d1, d5, d6, d7, d8)>
#map2 = affine_map<(d0, d1, d2, d3, d4, d5, d6, d7, d8) -> (d0, d1, d2, d3, d4)>
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<?x?x?x?x?xf32>, tensor<?x?x?x?x?xf32>, tensor<?x?x?x?x?xf32>) -> tensor<?x?x?x?x?xf32>, sym_name = "conv_3d_ncdhw_fcdhw"}> ({
  ^bb0(%arg0: tensor<?x?x?x?x?xf32>, %arg1: tensor<?x?x?x?x?xf32>, %arg2: tensor<?x?x?x?x?xf32>):
    %0 = "linalg.conv_3d_ncdhw_fcdhw"(%arg0, %arg1, %arg2) <{dilations = dense<1> : tensor<3xi64>, operandSegmentSizes = array<i32: 2, 1>, strides = dense<1> : tensor<3xi64>}> ({
    ^bb0(%arg3: f32, %arg4: f32, %arg5: f32):
      %1 = "arith.mulf"(%arg3, %arg4) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      %2 = "arith.addf"(%arg5, %1) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%2) : (f32) -> ()
    }) {linalg.memoized_indexing_maps = [#map, #map1, #map2]} : (tensor<?x?x?x?x?xf32>, tensor<?x?x?x?x?xf32>, tensor<?x?x?x?x?xf32>) -> tensor<?x?x?x?x?xf32>
    "func.return"(%0) : (tensor<?x?x?x?x?xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1, d2, d3, d4, d5, d6, d7, d8) -> (d0, d5, d2 + d6, d3 + d7, d4 + d8)>
#map1 = affine_map<(d0, d1, d2, d3, d4, d5, d6, d7, d8) -> (d1, d5, d6, d7, d8)>
#map2 = affine_map<(d0, d1, d2, d3, d4, d5, d6, d7, d8) -> (d0, d1, d2, d3, d4)>
"builtin.module"() ({
  "func.func"() <{function_type = (memref<?x?x?x?x?xf32>, memref<?x?x?x?x?xf32>, memref<?x?x?x?x?xf32>) -> (), sym_name = "conv_3d_ncdhw_fcdhw"}> ({
  ^bb0(%arg0: memref<?x?x?x?x?xf32>, %arg1: memref<?x?x?x?x?xf32>, %arg2: memref<?x?x?x?x?xf32>):
    "linalg.conv_3d_ncdhw_fcdhw"(%arg0, %arg1, %arg2) <{dilations = dense<1> : tensor<3xi64>, operandSegmentSizes = array<i32: 2, 1>, strides = dense<1> : tensor<3xi64>}> ({
    ^bb0(%arg3: f32, %arg4: f32, %arg5: f32):
      %0 = "arith.mulf"(%arg3, %arg4) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      %1 = "arith.addf"(%arg5, %0) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%1) : (f32) -> ()
    }) {linalg.memoized_indexing_maps = [#map, #map1, #map2]} : (memref<?x?x?x?x?xf32>, memref<?x?x?x?x?xf32>, memref<?x?x?x?x?xf32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1, d2, d3, d4, d5) -> (d0, d1 + d4, d2 + d5, d3)>
#map1 = affine_map<(d0, d1, d2, d3, d4, d5) -> (d4, d5)>
#map2 = affine_map<(d0, d1, d2, d3, d4, d5) -> (d0, d1, d2, d3)>
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<1x4x4x1xf32>) -> tensor<1x2x2x1xf32>, sym_name = "pooling_nhwc_sum_tensor"}> ({
  ^bb0(%arg0: tensor<1x4x4x1xf32>):
    %0 = "tensor.empty"() : () -> tensor<3x3xf32>
    %1 = "tensor.empty"() : () -> tensor<1x2x2x1xf32>
    %2 = "arith.constant"() <{value = 0.000000e+00 : f32}> : () -> f32
    %3 = "linalg.fill"(%2, %1) <{operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg4: f32, %arg5: f32):
      "linalg.yield"(%arg4) : (f32) -> ()
    }) : (f32, tensor<1x2x2x1xf32>) -> tensor<1x2x2x1xf32>
    %4 = "linalg.pooling_nhwc_sum"(%arg0, %0, %3) <{dilations = dense<1> : tensor<2xi64>, operandSegmentSizes = array<i32: 2, 1>, strides = dense<1> : tensor<2xi64>}> ({
    ^bb0(%arg1: f32, %arg2: f32, %arg3: f32):
      %5 = "arith.addf"(%arg3, %arg1) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%5) : (f32) -> ()
    }) {linalg.memoized_indexing_maps = [#map, #map1, #map2]} : (tensor<1x4x4x1xf32>, tensor<3x3xf32>, tensor<1x2x2x1xf32>) -> tensor<1x2x2x1xf32>
    "func.return"(%4) : (tensor<1x2x2x1xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1, d2, d3) -> (d0, d1 + d3, d2)>
#map1 = affine_map<(d0, d1, d2, d3) -> (d3)>
#map2 = affine_map<(d0, d1, d2, d3) -> (d0, d1, d2)>
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<1x4x1xf32>) -> tensor<1x2x1xf32>, sym_name = "pooling_nwc_sum_tensor"}> ({
  ^bb0(%arg0: tensor<1x4x1xf32>):
    %0 = "tensor.empty"() : () -> tensor<3xf32>
    %1 = "tensor.empty"() : () -> tensor<1x2x1xf32>
    %2 = "arith.constant"() <{value = 0.000000e+00 : f32}> : () -> f32
    %3 = "linalg.fill"(%2, %1) <{operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg4: f32, %arg5: f32):
      "linalg.yield"(%arg4) : (f32) -> ()
    }) : (f32, tensor<1x2x1xf32>) -> tensor<1x2x1xf32>
    %4 = "linalg.pooling_nwc_sum"(%arg0, %0, %3) <{dilations = dense<1> : tensor<1xi64>, operandSegmentSizes = array<i32: 2, 1>, strides = dense<1> : tensor<1xi64>}> ({
    ^bb0(%arg1: f32, %arg2: f32, %arg3: f32):
      %5 = "arith.addf"(%arg3, %arg1) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%5) : (f32) -> ()
    }) {linalg.memoized_indexing_maps = [#map, #map1, #map2]} : (tensor<1x4x1xf32>, tensor<3xf32>, tensor<1x2x1xf32>) -> tensor<1x2x1xf32>
    "func.return"(%4) : (tensor<1x2x1xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1, d2, d3, d4, d5) -> (d0, d1 + d4, d2 + d5, d3)>
#map1 = affine_map<(d0, d1, d2, d3, d4, d5) -> (d4, d5)>
#map2 = affine_map<(d0, d1, d2, d3, d4, d5) -> (d0, d1, d2, d3)>
"builtin.module"() ({
  "func.func"() <{function_type = (memref<1x4x4x1xf32>, memref<3x3xf32>, memref<1x2x2x1xf32>) -> (), sym_name = "pooling_nhwc_sum"}> ({
  ^bb0(%arg0: memref<1x4x4x1xf32>, %arg1: memref<3x3xf32>, %arg2: memref<1x2x2x1xf32>):
    "linalg.pooling_nhwc_sum"(%arg0, %arg1, %arg2) <{dilations = dense<1> : tensor<2xi64>, operandSegmentSizes = array<i32: 2, 1>, strides = dense<1> : tensor<2xi64>}> ({
    ^bb0(%arg3: f32, %arg4: f32, %arg5: f32):
      %0 = "arith.addf"(%arg5, %arg3) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%0) : (f32) -> ()
    }) {linalg.memoized_indexing_maps = [#map, #map1, #map2]} : (memref<1x4x4x1xf32>, memref<3x3xf32>, memref<1x2x2x1xf32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1, d2, d3) -> (d0, d1 + d3, d2)>
#map1 = affine_map<(d0, d1, d2, d3) -> (d3)>
#map2 = affine_map<(d0, d1, d2, d3) -> (d0, d1, d2)>
"builtin.module"() ({
  "func.func"() <{function_type = (memref<1x4x1xf32>, memref<3xf32>, memref<1x2x1xf32>) -> (), sym_name = "pooling_nwc_sum"}> ({
  ^bb0(%arg0: memref<1x4x1xf32>, %arg1: memref<3xf32>, %arg2: memref<1x2x1xf32>):
    "linalg.pooling_nwc_sum"(%arg0, %arg1, %arg2) <{dilations = dense<1> : tensor<1xi64>, operandSegmentSizes = array<i32: 2, 1>, strides = dense<1> : tensor<1xi64>}> ({
    ^bb0(%arg3: f32, %arg4: f32, %arg5: f32):
      %0 = "arith.addf"(%arg5, %arg3) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%0) : (f32) -> ()
    }) {linalg.memoized_indexing_maps = [#map, #map1, #map2]} : (memref<1x4x1xf32>, memref<3xf32>, memref<1x2x1xf32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1, d2, d3, d4, d5) -> (d0, d1, d2 + d4, d3 + d5)>
#map1 = affine_map<(d0, d1, d2, d3, d4, d5) -> (d4, d5)>
#map2 = affine_map<(d0, d1, d2, d3, d4, d5) -> (d0, d1, d2, d3)>
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<1x1x4x4xf32>) -> tensor<1x1x2x2xf32>, sym_name = "pooling_nchw_sum_tensor"}> ({
  ^bb0(%arg0: tensor<1x1x4x4xf32>):
    %0 = "tensor.empty"() : () -> tensor<3x3xf32>
    %1 = "tensor.empty"() : () -> tensor<1x1x2x2xf32>
    %2 = "arith.constant"() <{value = 0.000000e+00 : f32}> : () -> f32
    %3 = "linalg.fill"(%2, %1) <{operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg4: f32, %arg5: f32):
      "linalg.yield"(%arg4) : (f32) -> ()
    }) : (f32, tensor<1x1x2x2xf32>) -> tensor<1x1x2x2xf32>
    %4 = "linalg.pooling_nchw_sum"(%arg0, %0, %3) <{dilations = dense<1> : tensor<2xi64>, operandSegmentSizes = array<i32: 2, 1>, strides = dense<1> : tensor<2xi64>}> ({
    ^bb0(%arg1: f32, %arg2: f32, %arg3: f32):
      %5 = "arith.addf"(%arg3, %arg1) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%5) : (f32) -> ()
    }) {linalg.memoized_indexing_maps = [#map, #map1, #map2]} : (tensor<1x1x4x4xf32>, tensor<3x3xf32>, tensor<1x1x2x2xf32>) -> tensor<1x1x2x2xf32>
    "func.return"(%4) : (tensor<1x1x2x2xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1, d2, d3) -> (d0, d1, d2 + d3)>
#map1 = affine_map<(d0, d1, d2, d3) -> (d3)>
#map2 = affine_map<(d0, d1, d2, d3) -> (d0, d1, d2)>
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<1x1x4xf32>) -> tensor<1x1x2xf32>, sym_name = "pooling_ncw_sum_tensor"}> ({
  ^bb0(%arg0: tensor<1x1x4xf32>):
    %0 = "tensor.empty"() : () -> tensor<3xf32>
    %1 = "tensor.empty"() : () -> tensor<1x1x2xf32>
    %2 = "arith.constant"() <{value = 0.000000e+00 : f32}> : () -> f32
    %3 = "linalg.fill"(%2, %1) <{operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg4: f32, %arg5: f32):
      "linalg.yield"(%arg4) : (f32) -> ()
    }) : (f32, tensor<1x1x2xf32>) -> tensor<1x1x2xf32>
    %4 = "linalg.pooling_ncw_sum"(%arg0, %0, %3) <{dilations = dense<1> : tensor<1xi64>, operandSegmentSizes = array<i32: 2, 1>, strides = dense<1> : tensor<1xi64>}> ({
    ^bb0(%arg1: f32, %arg2: f32, %arg3: f32):
      %5 = "arith.addf"(%arg3, %arg1) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%5) : (f32) -> ()
    }) {linalg.memoized_indexing_maps = [#map, #map1, #map2]} : (tensor<1x1x4xf32>, tensor<3xf32>, tensor<1x1x2xf32>) -> tensor<1x1x2xf32>
    "func.return"(%4) : (tensor<1x1x2xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1, d2, d3, d4, d5) -> (d0, d1, d2 + d4, d3 + d5)>
#map1 = affine_map<(d0, d1, d2, d3, d4, d5) -> (d4, d5)>
#map2 = affine_map<(d0, d1, d2, d3, d4, d5) -> (d0, d1, d2, d3)>
"builtin.module"() ({
  "func.func"() <{function_type = (memref<1x1x4x4xf32>, memref<3x3xf32>, memref<1x1x2x2xf32>) -> (), sym_name = "pooling_nchw_sum"}> ({
  ^bb0(%arg0: memref<1x1x4x4xf32>, %arg1: memref<3x3xf32>, %arg2: memref<1x1x2x2xf32>):
    "linalg.pooling_nchw_sum"(%arg0, %arg1, %arg2) <{dilations = dense<1> : tensor<2xi64>, operandSegmentSizes = array<i32: 2, 1>, strides = dense<1> : tensor<2xi64>}> ({
    ^bb0(%arg3: f32, %arg4: f32, %arg5: f32):
      %0 = "arith.addf"(%arg5, %arg3) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%0) : (f32) -> ()
    }) {linalg.memoized_indexing_maps = [#map, #map1, #map2]} : (memref<1x1x4x4xf32>, memref<3x3xf32>, memref<1x1x2x2xf32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1, d2, d3) -> (d0, d1, d2 + d3)>
#map1 = affine_map<(d0, d1, d2, d3) -> (d3)>
#map2 = affine_map<(d0, d1, d2, d3) -> (d0, d1, d2)>
"builtin.module"() ({
  "func.func"() <{function_type = (memref<1x1x4xf32>, memref<3xf32>, memref<1x1x2xf32>) -> (), sym_name = "pooling_ncw_sum"}> ({
  ^bb0(%arg0: memref<1x1x4xf32>, %arg1: memref<3xf32>, %arg2: memref<1x1x2xf32>):
    "linalg.pooling_ncw_sum"(%arg0, %arg1, %arg2) <{dilations = dense<1> : tensor<1xi64>, operandSegmentSizes = array<i32: 2, 1>, strides = dense<1> : tensor<1xi64>}> ({
    ^bb0(%arg3: f32, %arg4: f32, %arg5: f32):
      %0 = "arith.addf"(%arg5, %arg3) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%0) : (f32) -> ()
    }) {linalg.memoized_indexing_maps = [#map, #map1, #map2]} : (memref<1x1x4xf32>, memref<3xf32>, memref<1x1x2xf32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1, d2, d3, d4, d5) -> (d0, d1 + d4, d2 + d5, d3)>
#map1 = affine_map<(d0, d1, d2, d3, d4, d5) -> (d4, d5)>
#map2 = affine_map<(d0, d1, d2, d3, d4, d5) -> (d0, d1, d2, d3)>
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<1x4x4x1xf32>) -> tensor<1x2x2x1xf32>, sym_name = "pooling_nhwc_max_tensor"}> ({
  ^bb0(%arg0: tensor<1x4x4x1xf32>):
    %0 = "tensor.empty"() : () -> tensor<3x3xf32>
    %1 = "tensor.empty"() : () -> tensor<1x2x2x1xf32>
    %2 = "arith.constant"() <{value = 0.000000e+00 : f32}> : () -> f32
    %3 = "linalg.fill"(%2, %1) <{operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg4: f32, %arg5: f32):
      "linalg.yield"(%arg4) : (f32) -> ()
    }) : (f32, tensor<1x2x2x1xf32>) -> tensor<1x2x2x1xf32>
    %4 = "linalg.pooling_nhwc_max"(%arg0, %0, %3) <{dilations = dense<1> : tensor<2xi64>, operandSegmentSizes = array<i32: 2, 1>, strides = dense<1> : tensor<2xi64>}> ({
    ^bb0(%arg1: f32, %arg2: f32, %arg3: f32):
      %5 = "arith.maximumf"(%arg3, %arg1) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%5) : (f32) -> ()
    }) {linalg.memoized_indexing_maps = [#map, #map1, #map2]} : (tensor<1x4x4x1xf32>, tensor<3x3xf32>, tensor<1x2x2x1xf32>) -> tensor<1x2x2x1xf32>
    "func.return"(%4) : (tensor<1x2x2x1xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1, d2, d3, d4, d5) -> (d0, d1 + d4, d2 + d5, d3)>
#map1 = affine_map<(d0, d1, d2, d3, d4, d5) -> (d4, d5)>
#map2 = affine_map<(d0, d1, d2, d3, d4, d5) -> (d0, d1, d2, d3)>
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<1x4x4x1xi32>) -> tensor<1x2x2x1xi32>, sym_name = "pooling_nhwc_max_unsigned_i32"}> ({
  ^bb0(%arg0: tensor<1x4x4x1xi32>):
    %0 = "tensor.empty"() : () -> tensor<3x3xi32>
    %1 = "tensor.empty"() : () -> tensor<1x2x2x1xi32>
    %2 = "arith.constant"() <{value = 0 : i32}> : () -> i32
    %3 = "linalg.fill"(%2, %1) <{operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg4: i32, %arg5: i32):
      "linalg.yield"(%arg4) : (i32) -> ()
    }) : (i32, tensor<1x2x2x1xi32>) -> tensor<1x2x2x1xi32>
    %4 = "linalg.pooling_nhwc_max_unsigned"(%arg0, %0, %3) <{dilations = dense<1> : tensor<2xi64>, operandSegmentSizes = array<i32: 2, 1>, strides = dense<1> : tensor<2xi64>}> ({
    ^bb0(%arg1: i32, %arg2: i32, %arg3: i32):
      %5 = "arith.maxui"(%arg3, %arg1) : (i32, i32) -> i32
      "linalg.yield"(%5) : (i32) -> ()
    }) {linalg.memoized_indexing_maps = [#map, #map1, #map2]} : (tensor<1x4x4x1xi32>, tensor<3x3xi32>, tensor<1x2x2x1xi32>) -> tensor<1x2x2x1xi32>
    "func.return"(%4) : (tensor<1x2x2x1xi32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1, d2, d3) -> (d0, d1 + d3, d2)>
#map1 = affine_map<(d0, d1, d2, d3) -> (d3)>
#map2 = affine_map<(d0, d1, d2, d3) -> (d0, d1, d2)>
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<1x4x1xi32>) -> tensor<1x2x1xi32>, sym_name = "pooling_nwc_max_unsigned_i32"}> ({
  ^bb0(%arg0: tensor<1x4x1xi32>):
    %0 = "tensor.empty"() : () -> tensor<3xi32>
    %1 = "tensor.empty"() : () -> tensor<1x2x1xi32>
    %2 = "arith.constant"() <{value = 0 : i32}> : () -> i32
    %3 = "linalg.fill"(%2, %1) <{operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg4: i32, %arg5: i32):
      "linalg.yield"(%arg4) : (i32) -> ()
    }) : (i32, tensor<1x2x1xi32>) -> tensor<1x2x1xi32>
    %4 = "linalg.pooling_nwc_max_unsigned"(%arg0, %0, %3) <{dilations = dense<1> : tensor<1xi64>, operandSegmentSizes = array<i32: 2, 1>, strides = dense<1> : tensor<1xi64>}> ({
    ^bb0(%arg1: i32, %arg2: i32, %arg3: i32):
      %5 = "arith.maxui"(%arg3, %arg1) : (i32, i32) -> i32
      "linalg.yield"(%5) : (i32) -> ()
    }) {linalg.memoized_indexing_maps = [#map, #map1, #map2]} : (tensor<1x4x1xi32>, tensor<3xi32>, tensor<1x2x1xi32>) -> tensor<1x2x1xi32>
    "func.return"(%4) : (tensor<1x2x1xi32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1, d2, d3) -> (d0, d1 + d3, d2)>
#map1 = affine_map<(d0, d1, d2, d3) -> (d3)>
#map2 = affine_map<(d0, d1, d2, d3) -> (d0, d1, d2)>
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<1x4x1xf32>) -> tensor<1x2x1xf32>, sym_name = "pooling_nwc_max_tensor"}> ({
  ^bb0(%arg0: tensor<1x4x1xf32>):
    %0 = "tensor.empty"() : () -> tensor<3xf32>
    %1 = "tensor.empty"() : () -> tensor<1x2x1xf32>
    %2 = "arith.constant"() <{value = 0.000000e+00 : f32}> : () -> f32
    %3 = "linalg.fill"(%2, %1) <{operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg4: f32, %arg5: f32):
      "linalg.yield"(%arg4) : (f32) -> ()
    }) : (f32, tensor<1x2x1xf32>) -> tensor<1x2x1xf32>
    %4 = "linalg.pooling_nwc_max"(%arg0, %0, %3) <{dilations = dense<1> : tensor<1xi64>, operandSegmentSizes = array<i32: 2, 1>, strides = dense<1> : tensor<1xi64>}> ({
    ^bb0(%arg1: f32, %arg2: f32, %arg3: f32):
      %5 = "arith.maximumf"(%arg3, %arg1) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%5) : (f32) -> ()
    }) {linalg.memoized_indexing_maps = [#map, #map1, #map2]} : (tensor<1x4x1xf32>, tensor<3xf32>, tensor<1x2x1xf32>) -> tensor<1x2x1xf32>
    "func.return"(%4) : (tensor<1x2x1xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1, d2, d3, d4, d5) -> (d0, d1, d2 + d4, d3 + d5)>
#map1 = affine_map<(d0, d1, d2, d3, d4, d5) -> (d4, d5)>
#map2 = affine_map<(d0, d1, d2, d3, d4, d5) -> (d0, d1, d2, d3)>
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<1x1x4x4xf32>) -> tensor<1x1x2x2xf32>, sym_name = "pooling_nchw_max_tensor"}> ({
  ^bb0(%arg0: tensor<1x1x4x4xf32>):
    %0 = "tensor.empty"() : () -> tensor<3x3xf32>
    %1 = "tensor.empty"() : () -> tensor<1x1x2x2xf32>
    %2 = "arith.constant"() <{value = 0.000000e+00 : f32}> : () -> f32
    %3 = "linalg.fill"(%2, %1) <{operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg4: f32, %arg5: f32):
      "linalg.yield"(%arg4) : (f32) -> ()
    }) : (f32, tensor<1x1x2x2xf32>) -> tensor<1x1x2x2xf32>
    %4 = "linalg.pooling_nchw_max"(%arg0, %0, %3) <{dilations = dense<1> : tensor<2xi64>, operandSegmentSizes = array<i32: 2, 1>, strides = dense<1> : tensor<2xi64>}> ({
    ^bb0(%arg1: f32, %arg2: f32, %arg3: f32):
      %5 = "arith.maximumf"(%arg3, %arg1) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%5) : (f32) -> ()
    }) {linalg.memoized_indexing_maps = [#map, #map1, #map2]} : (tensor<1x1x4x4xf32>, tensor<3x3xf32>, tensor<1x1x2x2xf32>) -> tensor<1x1x2x2xf32>
    "func.return"(%4) : (tensor<1x1x2x2xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1, d2, d3) -> (d0, d1, d2 + d3)>
#map1 = affine_map<(d0, d1, d2, d3) -> (d3)>
#map2 = affine_map<(d0, d1, d2, d3) -> (d0, d1, d2)>
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<1x1x4xf32>) -> tensor<1x1x2xf32>, sym_name = "pooling_ncw_max_tensor"}> ({
  ^bb0(%arg0: tensor<1x1x4xf32>):
    %0 = "tensor.empty"() : () -> tensor<3xf32>
    %1 = "tensor.empty"() : () -> tensor<1x1x2xf32>
    %2 = "arith.constant"() <{value = 0.000000e+00 : f32}> : () -> f32
    %3 = "linalg.fill"(%2, %1) <{operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg4: f32, %arg5: f32):
      "linalg.yield"(%arg4) : (f32) -> ()
    }) : (f32, tensor<1x1x2xf32>) -> tensor<1x1x2xf32>
    %4 = "linalg.pooling_ncw_max"(%arg0, %0, %3) <{dilations = dense<1> : tensor<1xi64>, operandSegmentSizes = array<i32: 2, 1>, strides = dense<1> : tensor<1xi64>}> ({
    ^bb0(%arg1: f32, %arg2: f32, %arg3: f32):
      %5 = "arith.maximumf"(%arg3, %arg1) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%5) : (f32) -> ()
    }) {linalg.memoized_indexing_maps = [#map, #map1, #map2]} : (tensor<1x1x4xf32>, tensor<3xf32>, tensor<1x1x2xf32>) -> tensor<1x1x2xf32>
    "func.return"(%4) : (tensor<1x1x2xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1, d2, d3, d4, d5) -> (d0, d1 + d4, d2 + d5, d3)>
#map1 = affine_map<(d0, d1, d2, d3, d4, d5) -> (d4, d5)>
#map2 = affine_map<(d0, d1, d2, d3, d4, d5) -> (d0, d1, d2, d3)>
"builtin.module"() ({
  "func.func"() <{function_type = (memref<1x4x4x1xf32>, memref<3x3xf32>, memref<1x2x2x1xf32>) -> (), sym_name = "pooling_nhwc_max"}> ({
  ^bb0(%arg0: memref<1x4x4x1xf32>, %arg1: memref<3x3xf32>, %arg2: memref<1x2x2x1xf32>):
    "linalg.pooling_nhwc_max"(%arg0, %arg1, %arg2) <{dilations = dense<1> : tensor<2xi64>, operandSegmentSizes = array<i32: 2, 1>, strides = dense<1> : tensor<2xi64>}> ({
    ^bb0(%arg3: f32, %arg4: f32, %arg5: f32):
      %0 = "arith.maximumf"(%arg5, %arg3) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%0) : (f32) -> ()
    }) {linalg.memoized_indexing_maps = [#map, #map1, #map2]} : (memref<1x4x4x1xf32>, memref<3x3xf32>, memref<1x2x2x1xf32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1, d2, d3) -> (d0, d1 + d3, d2)>
#map1 = affine_map<(d0, d1, d2, d3) -> (d3)>
#map2 = affine_map<(d0, d1, d2, d3) -> (d0, d1, d2)>
"builtin.module"() ({
  "func.func"() <{function_type = (memref<1x4x1xf32>, memref<3xf32>, memref<1x2x1xf32>) -> (), sym_name = "pooling_nwc_max"}> ({
  ^bb0(%arg0: memref<1x4x1xf32>, %arg1: memref<3xf32>, %arg2: memref<1x2x1xf32>):
    "linalg.pooling_nwc_max"(%arg0, %arg1, %arg2) <{dilations = dense<1> : tensor<1xi64>, operandSegmentSizes = array<i32: 2, 1>, strides = dense<1> : tensor<1xi64>}> ({
    ^bb0(%arg3: f32, %arg4: f32, %arg5: f32):
      %0 = "arith.maximumf"(%arg5, %arg3) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%0) : (f32) -> ()
    }) {linalg.memoized_indexing_maps = [#map, #map1, #map2]} : (memref<1x4x1xf32>, memref<3xf32>, memref<1x2x1xf32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1, d2, d3, d4, d5) -> (d0, d1 + d4, d2 + d5, d3)>
#map1 = affine_map<(d0, d1, d2, d3, d4, d5) -> (d4, d5)>
#map2 = affine_map<(d0, d1, d2, d3, d4, d5) -> (d0, d1, d2, d3)>
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<1x4x4x1xi8>) -> tensor<1x2x2x1xi8>, sym_name = "pooling_nhwc_i8_max_tensor"}> ({
  ^bb0(%arg0: tensor<1x4x4x1xi8>):
    %0 = "tensor.empty"() : () -> tensor<3x3xi8>
    %1 = "tensor.empty"() : () -> tensor<1x2x2x1xi8>
    %2 = "arith.constant"() <{value = 0 : i8}> : () -> i8
    %3 = "linalg.fill"(%2, %1) <{operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg4: i8, %arg5: i8):
      "linalg.yield"(%arg4) : (i8) -> ()
    }) : (i8, tensor<1x2x2x1xi8>) -> tensor<1x2x2x1xi8>
    %4 = "linalg.pooling_nhwc_max"(%arg0, %0, %3) <{dilations = dense<1> : tensor<2xi64>, operandSegmentSizes = array<i32: 2, 1>, strides = dense<1> : tensor<2xi64>}> ({
    ^bb0(%arg1: i8, %arg2: i8, %arg3: i8):
      %5 = "arith.maxsi"(%arg3, %arg1) : (i8, i8) -> i8
      "linalg.yield"(%5) : (i8) -> ()
    }) {linalg.memoized_indexing_maps = [#map, #map1, #map2]} : (tensor<1x4x4x1xi8>, tensor<3x3xi8>, tensor<1x2x2x1xi8>) -> tensor<1x2x2x1xi8>
    "func.return"(%4) : (tensor<1x2x2x1xi8>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1, d2, d3) -> (d0, d1 + d3, d2)>
#map1 = affine_map<(d0, d1, d2, d3) -> (d3)>
#map2 = affine_map<(d0, d1, d2, d3) -> (d0, d1, d2)>
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<1x4x1xi8>) -> tensor<1x2x1xi8>, sym_name = "pooling_nwc_i8_max_tensor"}> ({
  ^bb0(%arg0: tensor<1x4x1xi8>):
    %0 = "tensor.empty"() : () -> tensor<3xi8>
    %1 = "tensor.empty"() : () -> tensor<1x2x1xi8>
    %2 = "arith.constant"() <{value = 0 : i8}> : () -> i8
    %3 = "linalg.fill"(%2, %1) <{operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg4: i8, %arg5: i8):
      "linalg.yield"(%arg4) : (i8) -> ()
    }) : (i8, tensor<1x2x1xi8>) -> tensor<1x2x1xi8>
    %4 = "linalg.pooling_nwc_max"(%arg0, %0, %3) <{dilations = dense<1> : tensor<1xi64>, operandSegmentSizes = array<i32: 2, 1>, strides = dense<1> : tensor<1xi64>}> ({
    ^bb0(%arg1: i8, %arg2: i8, %arg3: i8):
      %5 = "arith.maxsi"(%arg3, %arg1) : (i8, i8) -> i8
      "linalg.yield"(%5) : (i8) -> ()
    }) {linalg.memoized_indexing_maps = [#map, #map1, #map2]} : (tensor<1x4x1xi8>, tensor<3xi8>, tensor<1x2x1xi8>) -> tensor<1x2x1xi8>
    "func.return"(%4) : (tensor<1x2x1xi8>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1, d2, d3, d4, d5) -> (d0, d1 + d4, d2 + d5, d3)>
#map1 = affine_map<(d0, d1, d2, d3, d4, d5) -> (d4, d5)>
#map2 = affine_map<(d0, d1, d2, d3, d4, d5) -> (d0, d1, d2, d3)>
"builtin.module"() ({
  "func.func"() <{function_type = (memref<1x4x4x1xi8>, memref<3x3xi8>, memref<1x2x2x1xi8>) -> (), sym_name = "pooling_nhwc_i8_max"}> ({
  ^bb0(%arg0: memref<1x4x4x1xi8>, %arg1: memref<3x3xi8>, %arg2: memref<1x2x2x1xi8>):
    "linalg.pooling_nhwc_max"(%arg0, %arg1, %arg2) <{dilations = dense<1> : tensor<2xi64>, operandSegmentSizes = array<i32: 2, 1>, strides = dense<1> : tensor<2xi64>}> ({
    ^bb0(%arg3: i8, %arg4: i8, %arg5: i8):
      %0 = "arith.maxsi"(%arg5, %arg3) : (i8, i8) -> i8
      "linalg.yield"(%0) : (i8) -> ()
    }) {linalg.memoized_indexing_maps = [#map, #map1, #map2]} : (memref<1x4x4x1xi8>, memref<3x3xi8>, memref<1x2x2x1xi8>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1, d2, d3) -> (d0, d1 + d3, d2)>
#map1 = affine_map<(d0, d1, d2, d3) -> (d3)>
#map2 = affine_map<(d0, d1, d2, d3) -> (d0, d1, d2)>
"builtin.module"() ({
  "func.func"() <{function_type = (memref<1x4x1xi8>, memref<3xi8>, memref<1x2x1xi8>) -> (), sym_name = "pooling_nwc_i8_max"}> ({
  ^bb0(%arg0: memref<1x4x1xi8>, %arg1: memref<3xi8>, %arg2: memref<1x2x1xi8>):
    "linalg.pooling_nwc_max"(%arg0, %arg1, %arg2) <{dilations = dense<1> : tensor<1xi64>, operandSegmentSizes = array<i32: 2, 1>, strides = dense<1> : tensor<1xi64>}> ({
    ^bb0(%arg3: i8, %arg4: i8, %arg5: i8):
      %0 = "arith.maxsi"(%arg5, %arg3) : (i8, i8) -> i8
      "linalg.yield"(%0) : (i8) -> ()
    }) {linalg.memoized_indexing_maps = [#map, #map1, #map2]} : (memref<1x4x1xi8>, memref<3xi8>, memref<1x2x1xi8>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1, d2, d3, d4, d5) -> (d0, d1 + d4, d2 + d5, d3)>
#map1 = affine_map<(d0, d1, d2, d3, d4, d5) -> (d4, d5)>
#map2 = affine_map<(d0, d1, d2, d3, d4, d5) -> (d0, d1, d2, d3)>
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<1x4x4x1xi16>) -> tensor<1x2x2x1xi16>, sym_name = "pooling_nhwc_i16_max_tensor"}> ({
  ^bb0(%arg0: tensor<1x4x4x1xi16>):
    %0 = "tensor.empty"() : () -> tensor<3x3xi16>
    %1 = "tensor.empty"() : () -> tensor<1x2x2x1xi16>
    %2 = "arith.constant"() <{value = 0 : i16}> : () -> i16
    %3 = "linalg.fill"(%2, %1) <{operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg4: i16, %arg5: i16):
      "linalg.yield"(%arg4) : (i16) -> ()
    }) : (i16, tensor<1x2x2x1xi16>) -> tensor<1x2x2x1xi16>
    %4 = "linalg.pooling_nhwc_max"(%arg0, %0, %3) <{dilations = dense<1> : tensor<2xi64>, operandSegmentSizes = array<i32: 2, 1>, strides = dense<1> : tensor<2xi64>}> ({
    ^bb0(%arg1: i16, %arg2: i16, %arg3: i16):
      %5 = "arith.maxsi"(%arg3, %arg1) : (i16, i16) -> i16
      "linalg.yield"(%5) : (i16) -> ()
    }) {linalg.memoized_indexing_maps = [#map, #map1, #map2]} : (tensor<1x4x4x1xi16>, tensor<3x3xi16>, tensor<1x2x2x1xi16>) -> tensor<1x2x2x1xi16>
    "func.return"(%4) : (tensor<1x2x2x1xi16>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1, d2, d3) -> (d0, d1 + d3, d2)>
#map1 = affine_map<(d0, d1, d2, d3) -> (d3)>
#map2 = affine_map<(d0, d1, d2, d3) -> (d0, d1, d2)>
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<1x4x1xi16>) -> tensor<1x2x1xi16>, sym_name = "pooling_nwc_i16_max_tensor"}> ({
  ^bb0(%arg0: tensor<1x4x1xi16>):
    %0 = "tensor.empty"() : () -> tensor<3xi16>
    %1 = "tensor.empty"() : () -> tensor<1x2x1xi16>
    %2 = "arith.constant"() <{value = 0 : i16}> : () -> i16
    %3 = "linalg.fill"(%2, %1) <{operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg4: i16, %arg5: i16):
      "linalg.yield"(%arg4) : (i16) -> ()
    }) : (i16, tensor<1x2x1xi16>) -> tensor<1x2x1xi16>
    %4 = "linalg.pooling_nwc_max"(%arg0, %0, %3) <{dilations = dense<1> : tensor<1xi64>, operandSegmentSizes = array<i32: 2, 1>, strides = dense<1> : tensor<1xi64>}> ({
    ^bb0(%arg1: i16, %arg2: i16, %arg3: i16):
      %5 = "arith.maxsi"(%arg3, %arg1) : (i16, i16) -> i16
      "linalg.yield"(%5) : (i16) -> ()
    }) {linalg.memoized_indexing_maps = [#map, #map1, #map2]} : (tensor<1x4x1xi16>, tensor<3xi16>, tensor<1x2x1xi16>) -> tensor<1x2x1xi16>
    "func.return"(%4) : (tensor<1x2x1xi16>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1, d2, d3, d4, d5) -> (d0, d1 + d4, d2 + d5, d3)>
#map1 = affine_map<(d0, d1, d2, d3, d4, d5) -> (d4, d5)>
#map2 = affine_map<(d0, d1, d2, d3, d4, d5) -> (d0, d1, d2, d3)>
"builtin.module"() ({
  "func.func"() <{function_type = (memref<1x4x4x1xi16>, memref<3x3xi16>, memref<1x2x2x1xi16>) -> (), sym_name = "pooling_nhwc_i16_max"}> ({
  ^bb0(%arg0: memref<1x4x4x1xi16>, %arg1: memref<3x3xi16>, %arg2: memref<1x2x2x1xi16>):
    "linalg.pooling_nhwc_max"(%arg0, %arg1, %arg2) <{dilations = dense<1> : tensor<2xi64>, operandSegmentSizes = array<i32: 2, 1>, strides = dense<1> : tensor<2xi64>}> ({
    ^bb0(%arg3: i16, %arg4: i16, %arg5: i16):
      %0 = "arith.maxsi"(%arg5, %arg3) : (i16, i16) -> i16
      "linalg.yield"(%0) : (i16) -> ()
    }) {linalg.memoized_indexing_maps = [#map, #map1, #map2]} : (memref<1x4x4x1xi16>, memref<3x3xi16>, memref<1x2x2x1xi16>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1, d2, d3) -> (d0, d1 + d3, d2)>
#map1 = affine_map<(d0, d1, d2, d3) -> (d3)>
#map2 = affine_map<(d0, d1, d2, d3) -> (d0, d1, d2)>
"builtin.module"() ({
  "func.func"() <{function_type = (memref<1x4x1xi16>, memref<3xi16>, memref<1x2x1xi16>) -> (), sym_name = "pooling_nwc_i16_max"}> ({
  ^bb0(%arg0: memref<1x4x1xi16>, %arg1: memref<3xi16>, %arg2: memref<1x2x1xi16>):
    "linalg.pooling_nwc_max"(%arg0, %arg1, %arg2) <{dilations = dense<1> : tensor<1xi64>, operandSegmentSizes = array<i32: 2, 1>, strides = dense<1> : tensor<1xi64>}> ({
    ^bb0(%arg3: i16, %arg4: i16, %arg5: i16):
      %0 = "arith.maxsi"(%arg5, %arg3) : (i16, i16) -> i16
      "linalg.yield"(%0) : (i16) -> ()
    }) {linalg.memoized_indexing_maps = [#map, #map1, #map2]} : (memref<1x4x1xi16>, memref<3xi16>, memref<1x2x1xi16>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1, d2, d3, d4, d5) -> (d0, d1 + d4, d2 + d5, d3)>
#map1 = affine_map<(d0, d1, d2, d3, d4, d5) -> (d4, d5)>
#map2 = affine_map<(d0, d1, d2, d3, d4, d5) -> (d0, d1, d2, d3)>
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<1x4x4x1xi32>) -> tensor<1x2x2x1xi32>, sym_name = "pooling_nhwc_i32_max_tensor"}> ({
  ^bb0(%arg0: tensor<1x4x4x1xi32>):
    %0 = "tensor.empty"() : () -> tensor<3x3xi32>
    %1 = "tensor.empty"() : () -> tensor<1x2x2x1xi32>
    %2 = "arith.constant"() <{value = 0 : i32}> : () -> i32
    %3 = "linalg.fill"(%2, %1) <{operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg4: i32, %arg5: i32):
      "linalg.yield"(%arg4) : (i32) -> ()
    }) : (i32, tensor<1x2x2x1xi32>) -> tensor<1x2x2x1xi32>
    %4 = "linalg.pooling_nhwc_max"(%arg0, %0, %3) <{dilations = dense<1> : tensor<2xi64>, operandSegmentSizes = array<i32: 2, 1>, strides = dense<1> : tensor<2xi64>}> ({
    ^bb0(%arg1: i32, %arg2: i32, %arg3: i32):
      %5 = "arith.maxsi"(%arg3, %arg1) : (i32, i32) -> i32
      "linalg.yield"(%5) : (i32) -> ()
    }) {linalg.memoized_indexing_maps = [#map, #map1, #map2]} : (tensor<1x4x4x1xi32>, tensor<3x3xi32>, tensor<1x2x2x1xi32>) -> tensor<1x2x2x1xi32>
    "func.return"(%4) : (tensor<1x2x2x1xi32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1, d2, d3) -> (d0, d1 + d3, d2)>
#map1 = affine_map<(d0, d1, d2, d3) -> (d3)>
#map2 = affine_map<(d0, d1, d2, d3) -> (d0, d1, d2)>
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<1x4x1xi32>) -> tensor<1x2x1xi32>, sym_name = "pooling_nwc_i32_max_tensor"}> ({
  ^bb0(%arg0: tensor<1x4x1xi32>):
    %0 = "tensor.empty"() : () -> tensor<3xi32>
    %1 = "tensor.empty"() : () -> tensor<1x2x1xi32>
    %2 = "arith.constant"() <{value = 0 : i32}> : () -> i32
    %3 = "linalg.fill"(%2, %1) <{operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg4: i32, %arg5: i32):
      "linalg.yield"(%arg4) : (i32) -> ()
    }) : (i32, tensor<1x2x1xi32>) -> tensor<1x2x1xi32>
    %4 = "linalg.pooling_nwc_max"(%arg0, %0, %3) <{dilations = dense<1> : tensor<1xi64>, operandSegmentSizes = array<i32: 2, 1>, strides = dense<1> : tensor<1xi64>}> ({
    ^bb0(%arg1: i32, %arg2: i32, %arg3: i32):
      %5 = "arith.maxsi"(%arg3, %arg1) : (i32, i32) -> i32
      "linalg.yield"(%5) : (i32) -> ()
    }) {linalg.memoized_indexing_maps = [#map, #map1, #map2]} : (tensor<1x4x1xi32>, tensor<3xi32>, tensor<1x2x1xi32>) -> tensor<1x2x1xi32>
    "func.return"(%4) : (tensor<1x2x1xi32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1, d2, d3, d4, d5) -> (d0, d1 + d4, d2 + d5, d3)>
#map1 = affine_map<(d0, d1, d2, d3, d4, d5) -> (d4, d5)>
#map2 = affine_map<(d0, d1, d2, d3, d4, d5) -> (d0, d1, d2, d3)>
"builtin.module"() ({
  "func.func"() <{function_type = (memref<1x4x4x1xi32>, memref<3x3xi32>, memref<1x2x2x1xi32>) -> (), sym_name = "pooling_nhwc_i32_max"}> ({
  ^bb0(%arg0: memref<1x4x4x1xi32>, %arg1: memref<3x3xi32>, %arg2: memref<1x2x2x1xi32>):
    "linalg.pooling_nhwc_max"(%arg0, %arg1, %arg2) <{dilations = dense<1> : tensor<2xi64>, operandSegmentSizes = array<i32: 2, 1>, strides = dense<1> : tensor<2xi64>}> ({
    ^bb0(%arg3: i32, %arg4: i32, %arg5: i32):
      %0 = "arith.maxsi"(%arg5, %arg3) : (i32, i32) -> i32
      "linalg.yield"(%0) : (i32) -> ()
    }) {linalg.memoized_indexing_maps = [#map, #map1, #map2]} : (memref<1x4x4x1xi32>, memref<3x3xi32>, memref<1x2x2x1xi32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1, d2, d3) -> (d0, d1 + d3, d2)>
#map1 = affine_map<(d0, d1, d2, d3) -> (d3)>
#map2 = affine_map<(d0, d1, d2, d3) -> (d0, d1, d2)>
"builtin.module"() ({
  "func.func"() <{function_type = (memref<1x4x1xi32>, memref<3xi32>, memref<1x2x1xi32>) -> (), sym_name = "pooling_nwc_i32_max"}> ({
  ^bb0(%arg0: memref<1x4x1xi32>, %arg1: memref<3xi32>, %arg2: memref<1x2x1xi32>):
    "linalg.pooling_nwc_max"(%arg0, %arg1, %arg2) <{dilations = dense<1> : tensor<1xi64>, operandSegmentSizes = array<i32: 2, 1>, strides = dense<1> : tensor<1xi64>}> ({
    ^bb0(%arg3: i32, %arg4: i32, %arg5: i32):
      %0 = "arith.maxsi"(%arg5, %arg3) : (i32, i32) -> i32
      "linalg.yield"(%0) : (i32) -> ()
    }) {linalg.memoized_indexing_maps = [#map, #map1, #map2]} : (memref<1x4x1xi32>, memref<3xi32>, memref<1x2x1xi32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1, d2, d3, d4, d5) -> (d0, d1 + d4, d2 + d5, d3)>
#map1 = affine_map<(d0, d1, d2, d3, d4, d5) -> (d4, d5)>
#map2 = affine_map<(d0, d1, d2, d3, d4, d5) -> (d0, d1, d2, d3)>
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<1x4x4x1xf32>) -> tensor<1x2x2x1xf32>, sym_name = "pooling_nhwc_min_tensor"}> ({
  ^bb0(%arg0: tensor<1x4x4x1xf32>):
    %0 = "tensor.empty"() : () -> tensor<3x3xf32>
    %1 = "tensor.empty"() : () -> tensor<1x2x2x1xf32>
    %2 = "arith.constant"() <{value = 0.000000e+00 : f32}> : () -> f32
    %3 = "linalg.fill"(%2, %1) <{operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg4: f32, %arg5: f32):
      "linalg.yield"(%arg4) : (f32) -> ()
    }) : (f32, tensor<1x2x2x1xf32>) -> tensor<1x2x2x1xf32>
    %4 = "linalg.pooling_nhwc_min"(%arg0, %0, %3) <{dilations = dense<1> : tensor<2xi64>, operandSegmentSizes = array<i32: 2, 1>, strides = dense<1> : tensor<2xi64>}> ({
    ^bb0(%arg1: f32, %arg2: f32, %arg3: f32):
      %5 = "arith.minimumf"(%arg3, %arg1) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%5) : (f32) -> ()
    }) {linalg.memoized_indexing_maps = [#map, #map1, #map2]} : (tensor<1x4x4x1xf32>, tensor<3x3xf32>, tensor<1x2x2x1xf32>) -> tensor<1x2x2x1xf32>
    "func.return"(%4) : (tensor<1x2x2x1xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1, d2, d3, d4, d5) -> (d0, d1 + d4, d2 + d5, d3)>
#map1 = affine_map<(d0, d1, d2, d3, d4, d5) -> (d4, d5)>
#map2 = affine_map<(d0, d1, d2, d3, d4, d5) -> (d0, d1, d2, d3)>
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<1x4x4x1xi32>) -> tensor<1x2x2x1xi32>, sym_name = "pooling_nhwc_min_unsigned_i32"}> ({
  ^bb0(%arg0: tensor<1x4x4x1xi32>):
    %0 = "tensor.empty"() : () -> tensor<3x3xi32>
    %1 = "tensor.empty"() : () -> tensor<1x2x2x1xi32>
    %2 = "arith.constant"() <{value = 0 : i32}> : () -> i32
    %3 = "linalg.fill"(%2, %1) <{operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg4: i32, %arg5: i32):
      "linalg.yield"(%arg4) : (i32) -> ()
    }) : (i32, tensor<1x2x2x1xi32>) -> tensor<1x2x2x1xi32>
    %4 = "linalg.pooling_nhwc_min_unsigned"(%arg0, %0, %3) <{dilations = dense<1> : tensor<2xi64>, operandSegmentSizes = array<i32: 2, 1>, strides = dense<1> : tensor<2xi64>}> ({
    ^bb0(%arg1: i32, %arg2: i32, %arg3: i32):
      %5 = "arith.minui"(%arg3, %arg1) : (i32, i32) -> i32
      "linalg.yield"(%5) : (i32) -> ()
    }) {linalg.memoized_indexing_maps = [#map, #map1, #map2]} : (tensor<1x4x4x1xi32>, tensor<3x3xi32>, tensor<1x2x2x1xi32>) -> tensor<1x2x2x1xi32>
    "func.return"(%4) : (tensor<1x2x2x1xi32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1, d2, d3) -> (d0, d1 + d3, d2)>
#map1 = affine_map<(d0, d1, d2, d3) -> (d3)>
#map2 = affine_map<(d0, d1, d2, d3) -> (d0, d1, d2)>
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<1x4x1xi32>) -> tensor<1x2x1xi32>, sym_name = "pooling_nwc_min_unsigned_i32"}> ({
  ^bb0(%arg0: tensor<1x4x1xi32>):
    %0 = "tensor.empty"() : () -> tensor<3xi32>
    %1 = "tensor.empty"() : () -> tensor<1x2x1xi32>
    %2 = "arith.constant"() <{value = 0 : i32}> : () -> i32
    %3 = "linalg.fill"(%2, %1) <{operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg4: i32, %arg5: i32):
      "linalg.yield"(%arg4) : (i32) -> ()
    }) : (i32, tensor<1x2x1xi32>) -> tensor<1x2x1xi32>
    %4 = "linalg.pooling_nwc_min_unsigned"(%arg0, %0, %3) <{dilations = dense<1> : tensor<1xi64>, operandSegmentSizes = array<i32: 2, 1>, strides = dense<1> : tensor<1xi64>}> ({
    ^bb0(%arg1: i32, %arg2: i32, %arg3: i32):
      %5 = "arith.minui"(%arg3, %arg1) : (i32, i32) -> i32
      "linalg.yield"(%5) : (i32) -> ()
    }) {linalg.memoized_indexing_maps = [#map, #map1, #map2]} : (tensor<1x4x1xi32>, tensor<3xi32>, tensor<1x2x1xi32>) -> tensor<1x2x1xi32>
    "func.return"(%4) : (tensor<1x2x1xi32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1, d2, d3) -> (d0, d1 + d3, d2)>
#map1 = affine_map<(d0, d1, d2, d3) -> (d3)>
#map2 = affine_map<(d0, d1, d2, d3) -> (d0, d1, d2)>
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<1x4x1xf32>) -> tensor<1x2x1xf32>, sym_name = "pooling_nwc_min_tensor"}> ({
  ^bb0(%arg0: tensor<1x4x1xf32>):
    %0 = "tensor.empty"() : () -> tensor<3xf32>
    %1 = "tensor.empty"() : () -> tensor<1x2x1xf32>
    %2 = "arith.constant"() <{value = 0.000000e+00 : f32}> : () -> f32
    %3 = "linalg.fill"(%2, %1) <{operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg4: f32, %arg5: f32):
      "linalg.yield"(%arg4) : (f32) -> ()
    }) : (f32, tensor<1x2x1xf32>) -> tensor<1x2x1xf32>
    %4 = "linalg.pooling_nwc_min"(%arg0, %0, %3) <{dilations = dense<1> : tensor<1xi64>, operandSegmentSizes = array<i32: 2, 1>, strides = dense<1> : tensor<1xi64>}> ({
    ^bb0(%arg1: f32, %arg2: f32, %arg3: f32):
      %5 = "arith.minimumf"(%arg3, %arg1) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%5) : (f32) -> ()
    }) {linalg.memoized_indexing_maps = [#map, #map1, #map2]} : (tensor<1x4x1xf32>, tensor<3xf32>, tensor<1x2x1xf32>) -> tensor<1x2x1xf32>
    "func.return"(%4) : (tensor<1x2x1xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1, d2, d3, d4, d5) -> (d0, d1 + d4, d2 + d5, d3)>
#map1 = affine_map<(d0, d1, d2, d3, d4, d5) -> (d4, d5)>
#map2 = affine_map<(d0, d1, d2, d3, d4, d5) -> (d0, d1, d2, d3)>
"builtin.module"() ({
  "func.func"() <{function_type = (memref<1x4x4x1xf32>, memref<3x3xf32>, memref<1x2x2x1xf32>) -> (), sym_name = "pooling_nhwc_min"}> ({
  ^bb0(%arg0: memref<1x4x4x1xf32>, %arg1: memref<3x3xf32>, %arg2: memref<1x2x2x1xf32>):
    "linalg.pooling_nhwc_min"(%arg0, %arg1, %arg2) <{dilations = dense<1> : tensor<2xi64>, operandSegmentSizes = array<i32: 2, 1>, strides = dense<1> : tensor<2xi64>}> ({
    ^bb0(%arg3: f32, %arg4: f32, %arg5: f32):
      %0 = "arith.minimumf"(%arg5, %arg3) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%0) : (f32) -> ()
    }) {linalg.memoized_indexing_maps = [#map, #map1, #map2]} : (memref<1x4x4x1xf32>, memref<3x3xf32>, memref<1x2x2x1xf32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1, d2, d3) -> (d0, d1 + d3, d2)>
#map1 = affine_map<(d0, d1, d2, d3) -> (d3)>
#map2 = affine_map<(d0, d1, d2, d3) -> (d0, d1, d2)>
"builtin.module"() ({
  "func.func"() <{function_type = (memref<1x4x1xf32>, memref<3xf32>, memref<1x2x1xf32>) -> (), sym_name = "pooling_nwc_min"}> ({
  ^bb0(%arg0: memref<1x4x1xf32>, %arg1: memref<3xf32>, %arg2: memref<1x2x1xf32>):
    "linalg.pooling_nwc_min"(%arg0, %arg1, %arg2) <{dilations = dense<1> : tensor<1xi64>, operandSegmentSizes = array<i32: 2, 1>, strides = dense<1> : tensor<1xi64>}> ({
    ^bb0(%arg3: f32, %arg4: f32, %arg5: f32):
      %0 = "arith.minimumf"(%arg5, %arg3) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%0) : (f32) -> ()
    }) {linalg.memoized_indexing_maps = [#map, #map1, #map2]} : (memref<1x4x1xf32>, memref<3xf32>, memref<1x2x1xf32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1, d2, d3, d4, d5, d6, d7) -> (d0, d1 + d5, d2 + d6, d3 + d7, d4)>
#map1 = affine_map<(d0, d1, d2, d3, d4, d5, d6, d7) -> (d5, d6, d7)>
#map2 = affine_map<(d0, d1, d2, d3, d4, d5, d6, d7) -> (d0, d1, d2, d3, d4)>
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<1x4x4x4x1xf32>) -> tensor<1x2x2x2x1xf32>, sym_name = "pooling_ndhwc_sum_tensor"}> ({
  ^bb0(%arg0: tensor<1x4x4x4x1xf32>):
    %0 = "tensor.empty"() : () -> tensor<3x3x3xf32>
    %1 = "tensor.empty"() : () -> tensor<1x2x2x2x1xf32>
    %2 = "arith.constant"() <{value = 0.000000e+00 : f32}> : () -> f32
    %3 = "linalg.fill"(%2, %1) <{operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg4: f32, %arg5: f32):
      "linalg.yield"(%arg4) : (f32) -> ()
    }) : (f32, tensor<1x2x2x2x1xf32>) -> tensor<1x2x2x2x1xf32>
    %4 = "linalg.pooling_ndhwc_sum"(%arg0, %0, %3) <{dilations = dense<1> : tensor<3xi64>, operandSegmentSizes = array<i32: 2, 1>, strides = dense<1> : tensor<3xi64>}> ({
    ^bb0(%arg1: f32, %arg2: f32, %arg3: f32):
      %5 = "arith.addf"(%arg3, %arg1) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%5) : (f32) -> ()
    }) {linalg.memoized_indexing_maps = [#map, #map1, #map2]} : (tensor<1x4x4x4x1xf32>, tensor<3x3x3xf32>, tensor<1x2x2x2x1xf32>) -> tensor<1x2x2x2x1xf32>
    "func.return"(%4) : (tensor<1x2x2x2x1xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1, d2, d3, d4, d5, d6, d7) -> (d0, d1 + d5, d2 + d6, d3 + d7, d4)>
#map1 = affine_map<(d0, d1, d2, d3, d4, d5, d6, d7) -> (d5, d6, d7)>
#map2 = affine_map<(d0, d1, d2, d3, d4, d5, d6, d7) -> (d0, d1, d2, d3, d4)>
"builtin.module"() ({
  "func.func"() <{function_type = (memref<1x4x4x4x1xf32>, memref<3x3x3xf32>, memref<1x2x2x2x1xf32>) -> (), sym_name = "pooling_ndhwc_sum"}> ({
  ^bb0(%arg0: memref<1x4x4x4x1xf32>, %arg1: memref<3x3x3xf32>, %arg2: memref<1x2x2x2x1xf32>):
    "linalg.pooling_ndhwc_sum"(%arg0, %arg1, %arg2) <{dilations = dense<1> : tensor<3xi64>, operandSegmentSizes = array<i32: 2, 1>, strides = dense<1> : tensor<3xi64>}> ({
    ^bb0(%arg3: f32, %arg4: f32, %arg5: f32):
      %0 = "arith.addf"(%arg5, %arg3) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%0) : (f32) -> ()
    }) {linalg.memoized_indexing_maps = [#map, #map1, #map2]} : (memref<1x4x4x4x1xf32>, memref<3x3x3xf32>, memref<1x2x2x2x1xf32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1, d2, d3, d4, d5, d6, d7) -> (d0, d1 + d5, d2 + d6, d3 + d7, d4)>
#map1 = affine_map<(d0, d1, d2, d3, d4, d5, d6, d7) -> (d5, d6, d7)>
#map2 = affine_map<(d0, d1, d2, d3, d4, d5, d6, d7) -> (d0, d1, d2, d3, d4)>
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<1x4x4x4x1xf32>) -> tensor<1x2x2x2x1xf32>, sym_name = "pooling_ndhwc_max_tensor"}> ({
  ^bb0(%arg0: tensor<1x4x4x4x1xf32>):
    %0 = "tensor.empty"() : () -> tensor<3x3x3xf32>
    %1 = "tensor.empty"() : () -> tensor<1x2x2x2x1xf32>
    %2 = "arith.constant"() <{value = 0.000000e+00 : f32}> : () -> f32
    %3 = "linalg.fill"(%2, %1) <{operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg4: f32, %arg5: f32):
      "linalg.yield"(%arg4) : (f32) -> ()
    }) : (f32, tensor<1x2x2x2x1xf32>) -> tensor<1x2x2x2x1xf32>
    %4 = "linalg.pooling_ndhwc_max"(%arg0, %0, %3) <{dilations = dense<1> : tensor<3xi64>, operandSegmentSizes = array<i32: 2, 1>, strides = dense<1> : tensor<3xi64>}> ({
    ^bb0(%arg1: f32, %arg2: f32, %arg3: f32):
      %5 = "arith.maximumf"(%arg3, %arg1) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%5) : (f32) -> ()
    }) {linalg.memoized_indexing_maps = [#map, #map1, #map2]} : (tensor<1x4x4x4x1xf32>, tensor<3x3x3xf32>, tensor<1x2x2x2x1xf32>) -> tensor<1x2x2x2x1xf32>
    "func.return"(%4) : (tensor<1x2x2x2x1xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1, d2, d3, d4, d5, d6, d7) -> (d0, d1 + d5, d2 + d6, d3 + d7, d4)>
#map1 = affine_map<(d0, d1, d2, d3, d4, d5, d6, d7) -> (d5, d6, d7)>
#map2 = affine_map<(d0, d1, d2, d3, d4, d5, d6, d7) -> (d0, d1, d2, d3, d4)>
"builtin.module"() ({
  "func.func"() <{function_type = (memref<1x4x4x4x1xf32>, memref<3x3x3xf32>, memref<1x2x2x2x1xf32>) -> (), sym_name = "pooling_ndhwc_max"}> ({
  ^bb0(%arg0: memref<1x4x4x4x1xf32>, %arg1: memref<3x3x3xf32>, %arg2: memref<1x2x2x2x1xf32>):
    "linalg.pooling_ndhwc_max"(%arg0, %arg1, %arg2) <{dilations = dense<1> : tensor<3xi64>, operandSegmentSizes = array<i32: 2, 1>, strides = dense<1> : tensor<3xi64>}> ({
    ^bb0(%arg3: f32, %arg4: f32, %arg5: f32):
      %0 = "arith.maximumf"(%arg5, %arg3) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%0) : (f32) -> ()
    }) {linalg.memoized_indexing_maps = [#map, #map1, #map2]} : (memref<1x4x4x4x1xf32>, memref<3x3x3xf32>, memref<1x2x2x2x1xf32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1, d2, d3, d4, d5, d6, d7) -> (d0, d1 + d5, d2 + d6, d3 + d7, d4)>
#map1 = affine_map<(d0, d1, d2, d3, d4, d5, d6, d7) -> (d5, d6, d7)>
#map2 = affine_map<(d0, d1, d2, d3, d4, d5, d6, d7) -> (d0, d1, d2, d3, d4)>
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<1x4x4x4x1xf32>) -> tensor<1x2x2x2x1xf32>, sym_name = "pooling_ndhwc_min_tensor"}> ({
  ^bb0(%arg0: tensor<1x4x4x4x1xf32>):
    %0 = "tensor.empty"() : () -> tensor<3x3x3xf32>
    %1 = "tensor.empty"() : () -> tensor<1x2x2x2x1xf32>
    %2 = "arith.constant"() <{value = 0.000000e+00 : f32}> : () -> f32
    %3 = "linalg.fill"(%2, %1) <{operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg4: f32, %arg5: f32):
      "linalg.yield"(%arg4) : (f32) -> ()
    }) : (f32, tensor<1x2x2x2x1xf32>) -> tensor<1x2x2x2x1xf32>
    %4 = "linalg.pooling_ndhwc_min"(%arg0, %0, %3) <{dilations = dense<1> : tensor<3xi64>, operandSegmentSizes = array<i32: 2, 1>, strides = dense<1> : tensor<3xi64>}> ({
    ^bb0(%arg1: f32, %arg2: f32, %arg3: f32):
      %5 = "arith.minimumf"(%arg3, %arg1) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%5) : (f32) -> ()
    }) {linalg.memoized_indexing_maps = [#map, #map1, #map2]} : (tensor<1x4x4x4x1xf32>, tensor<3x3x3xf32>, tensor<1x2x2x2x1xf32>) -> tensor<1x2x2x2x1xf32>
    "func.return"(%4) : (tensor<1x2x2x2x1xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1, d2, d3, d4, d5, d6, d7) -> (d0, d1 + d5, d2 + d6, d3 + d7, d4)>
#map1 = affine_map<(d0, d1, d2, d3, d4, d5, d6, d7) -> (d5, d6, d7)>
#map2 = affine_map<(d0, d1, d2, d3, d4, d5, d6, d7) -> (d0, d1, d2, d3, d4)>
"builtin.module"() ({
  "func.func"() <{function_type = (memref<1x4x4x4x1xf32>, memref<3x3x3xf32>, memref<1x2x2x2x1xf32>) -> (), sym_name = "pooling_ndhwc_min"}> ({
  ^bb0(%arg0: memref<1x4x4x4x1xf32>, %arg1: memref<3x3x3xf32>, %arg2: memref<1x2x2x2x1xf32>):
    "linalg.pooling_ndhwc_min"(%arg0, %arg1, %arg2) <{dilations = dense<1> : tensor<3xi64>, operandSegmentSizes = array<i32: 2, 1>, strides = dense<1> : tensor<3xi64>}> ({
    ^bb0(%arg3: f32, %arg4: f32, %arg5: f32):
      %0 = "arith.minimumf"(%arg5, %arg3) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%0) : (f32) -> ()
    }) {linalg.memoized_indexing_maps = [#map, #map1, #map2]} : (memref<1x4x4x4x1xf32>, memref<3x3x3xf32>, memref<1x2x2x2x1xf32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
// -----
// -----
#map = affine_map<(d0, d1, d2, d3) -> (d0, d1, d3)>
#map1 = affine_map<(d0, d1, d2, d3) -> (d0, d3, d2)>
#map2 = affine_map<(d0, d1, d2, d3) -> (d1, d2)>
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<8x128x256xf32>, tensor<8x256x512xf32>, tensor<128x512xf32>) -> tensor<128x512xf32>, sym_name = "batch_reduce_matmul"}> ({
  ^bb0(%arg0: tensor<8x128x256xf32>, %arg1: tensor<8x256x512xf32>, %arg2: tensor<128x512xf32>):
    %0 = "linalg.batch_reduce_matmul"(%arg0, %arg1, %arg2) <{indexing_maps = [#map, #map1, #map2], operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg3: f32, %arg4: f32, %arg5: f32):
      %1 = "arith.mulf"(%arg3, %arg4) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      %2 = "arith.addf"(%arg5, %1) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%2) : (f32) -> ()
    }) : (tensor<8x128x256xf32>, tensor<8x256x512xf32>, tensor<128x512xf32>) -> tensor<128x512xf32>
    "func.return"(%0) : (tensor<128x512xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1, d2, d3) -> (d0, d1, d3)>
#map1 = affine_map<(d0, d1, d2, d3) -> (d0, d3, d2)>
#map2 = affine_map<(d0, d1, d2, d3) -> (d1, d2)>
"builtin.module"() ({
  "func.func"() <{function_type = (memref<?x?x?xf32>, memref<?x?x?xf32>, memref<?x?xf32>) -> (), sym_name = "batch_reduce_matmul"}> ({
  ^bb0(%arg0: memref<?x?x?xf32>, %arg1: memref<?x?x?xf32>, %arg2: memref<?x?xf32>):
    "linalg.batch_reduce_matmul"(%arg0, %arg1, %arg2) <{indexing_maps = [#map, #map1, #map2], operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg3: f32, %arg4: f32, %arg5: f32):
      %0 = "arith.mulf"(%arg3, %arg4) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      %1 = "arith.addf"(%arg5, %0) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%1) : (f32) -> ()
    }) : (memref<?x?x?xf32>, memref<?x?x?xf32>, memref<?x?xf32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1, d2) -> (d2, d0)>
#map1 = affine_map<(d0, d1, d2) -> (d2, d1)>
#map2 = affine_map<(d0, d1, d2) -> (d0, d1)>
"builtin.module"() ({
  "func.func"() <{function_type = (memref<5x3xf32>, memref<5x7xf32>, memref<3x7xf32>) -> (), sym_name = "matmul_transpose_a_explicit"}> ({
  ^bb0(%arg0: memref<5x3xf32>, %arg1: memref<5x7xf32>, %arg2: memref<3x7xf32>):
    "linalg.matmul"(%arg0, %arg1, %arg2) <{indexing_maps = [#map, #map1, #map2], operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg3: f32, %arg4: f32, %arg5: f32):
      %0 = "arith.mulf"(%arg3, %arg4) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      %1 = "arith.addf"(%arg5, %0) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%1) : (f32) -> ()
    }) : (memref<5x3xf32>, memref<5x7xf32>, memref<3x7xf32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1, d2) -> (d0, d2)>
#map1 = affine_map<(d0, d1, d2) -> (d1, d2)>
#map2 = affine_map<(d0, d1, d2) -> (d0, d1)>
"builtin.module"() ({
  "func.func"() <{function_type = (memref<3x5xf32>, memref<7x5xf32>, memref<3x7xf32>) -> (), sym_name = "matmul_transpose_b_explicit"}> ({
  ^bb0(%arg0: memref<3x5xf32>, %arg1: memref<7x5xf32>, %arg2: memref<3x7xf32>):
    "linalg.matmul"(%arg0, %arg1, %arg2) <{indexing_maps = [#map, #map1, #map2], operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg3: f32, %arg4: f32, %arg5: f32):
      %0 = "arith.mulf"(%arg3, %arg4) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      %1 = "arith.addf"(%arg5, %0) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%1) : (f32) -> ()
    }) : (memref<3x5xf32>, memref<7x5xf32>, memref<3x7xf32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1, d2) -> (d2, d0)>
#map1 = affine_map<(d0, d1, d2) -> (d1, d2)>
#map2 = affine_map<(d0, d1, d2) -> (d0, d1)>
"builtin.module"() ({
  "func.func"() <{function_type = (memref<5x3xf32>, memref<7x5xf32>, memref<3x7xf32>) -> (), sym_name = "matmul_transpose_a_b_explicit"}> ({
  ^bb0(%arg0: memref<5x3xf32>, %arg1: memref<7x5xf32>, %arg2: memref<3x7xf32>):
    "linalg.matmul"(%arg0, %arg1, %arg2) <{indexing_maps = [#map, #map1, #map2], operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg3: f32, %arg4: f32, %arg5: f32):
      %0 = "arith.mulf"(%arg3, %arg4) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      %1 = "arith.addf"(%arg5, %0) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%1) : (f32) -> ()
    }) : (memref<5x3xf32>, memref<7x5xf32>, memref<3x7xf32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1, d2) -> (d2)>
#map1 = affine_map<(d0, d1, d2) -> (d2, d1)>
#map2 = affine_map<(d0, d1, d2) -> (d0, d1)>
"builtin.module"() ({
  "func.func"() <{function_type = (memref<5xf32>, memref<5x7xf32>, memref<3x7xf32>) -> (), sym_name = "matmul_bcast_a"}> ({
  ^bb0(%arg0: memref<5xf32>, %arg1: memref<5x7xf32>, %arg2: memref<3x7xf32>):
    "linalg.matmul"(%arg0, %arg1, %arg2) <{indexing_maps = [#map, #map1, #map2], operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg3: f32, %arg4: f32, %arg5: f32):
      %0 = "arith.mulf"(%arg3, %arg4) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      %1 = "arith.addf"(%arg5, %0) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%1) : (f32) -> ()
    }) : (memref<5xf32>, memref<5x7xf32>, memref<3x7xf32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1, d2) -> (d2)>
#map1 = affine_map<(d0, d1, d2) -> (d2, d1)>
#map2 = affine_map<(d0, d1, d2) -> (d0, d1)>
"builtin.module"() ({
  "func.func"() <{function_type = (memref<5xf32>, memref<5x7xf32>, memref<3x7xf32>) -> (), sym_name = "matmul_bcast_a_dim1"}> ({
  ^bb0(%arg0: memref<5xf32>, %arg1: memref<5x7xf32>, %arg2: memref<3x7xf32>):
    "linalg.matmul"(%arg0, %arg1, %arg2) <{indexing_maps = [#map, #map1, #map2], operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg3: f32, %arg4: f32, %arg5: f32):
      %0 = "arith.mulf"(%arg3, %arg4) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      %1 = "arith.addf"(%arg5, %0) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%1) : (f32) -> ()
    }) : (memref<5xf32>, memref<5x7xf32>, memref<3x7xf32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1, d2) -> (d0, d2)>
#map1 = affine_map<(d0, d1, d2) -> (d2)>
#map2 = affine_map<(d0, d1, d2) -> (d0, d1)>
"builtin.module"() ({
  "func.func"() <{function_type = (memref<3x5xf32>, memref<5xf32>, memref<3x7xf32>) -> (), sym_name = "matmul_bcast_b"}> ({
  ^bb0(%arg0: memref<3x5xf32>, %arg1: memref<5xf32>, %arg2: memref<3x7xf32>):
    "linalg.matmul"(%arg0, %arg1, %arg2) <{indexing_maps = [#map, #map1, #map2], operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg3: f32, %arg4: f32, %arg5: f32):
      %0 = "arith.mulf"(%arg3, %arg4) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      %1 = "arith.addf"(%arg5, %0) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%1) : (f32) -> ()
    }) : (memref<3x5xf32>, memref<5xf32>, memref<3x7xf32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1, d2) -> (d2)>
#map1 = affine_map<(d0, d1, d2) -> (d0, d1)>
"builtin.module"() ({
  "func.func"() <{function_type = (memref<5xf32>, memref<5xf32>, memref<3x7xf32>) -> (), sym_name = "matmul_bcast_a_b"}> ({
  ^bb0(%arg0: memref<5xf32>, %arg1: memref<5xf32>, %arg2: memref<3x7xf32>):
    "linalg.matmul"(%arg0, %arg1, %arg2) <{indexing_maps = [#map, #map, #map1], operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg3: f32, %arg4: f32, %arg5: f32):
      %0 = "arith.mulf"(%arg3, %arg4) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      %1 = "arith.addf"(%arg5, %0) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%1) : (f32) -> ()
    }) : (memref<5xf32>, memref<5xf32>, memref<3x7xf32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1, d2) -> (d0, d2)>
#map1 = affine_map<(d0, d1, d2) -> (d2)>
#map2 = affine_map<(d0, d1, d2) -> (d0, d1)>
"builtin.module"() ({
  "func.func"() <{function_type = (memref<3x5xf32>, memref<5xf32>, memref<3x7xf32>) -> (), sym_name = "matmul_bcast_b_dim1"}> ({
  ^bb0(%arg0: memref<3x5xf32>, %arg1: memref<5xf32>, %arg2: memref<3x7xf32>):
    "linalg.matmul"(%arg0, %arg1, %arg2) <{indexing_maps = [#map, #map1, #map2], operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg3: f32, %arg4: f32, %arg5: f32):
      %0 = "arith.mulf"(%arg3, %arg4) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      %1 = "arith.addf"(%arg5, %0) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%1) : (f32) -> ()
    }) : (memref<3x5xf32>, memref<5xf32>, memref<3x7xf32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1, d2) -> (d2)>
#map1 = affine_map<(d0, d1, d2) -> (d2, d1)>
#map2 = affine_map<(d0, d1, d2) -> (d0, d1)>
"builtin.module"() ({
  "func.func"() <{function_type = (memref<?xf32>, memref<?x?xf32>, memref<?x?xf32>) -> (), sym_name = "dynamic_matmul_bcast_a"}> ({
  ^bb0(%arg0: memref<?xf32>, %arg1: memref<?x?xf32>, %arg2: memref<?x?xf32>):
    "linalg.matmul"(%arg0, %arg1, %arg2) <{indexing_maps = [#map, #map1, #map2], operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg3: f32, %arg4: f32, %arg5: f32):
      %0 = "arith.mulf"(%arg3, %arg4) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      %1 = "arith.addf"(%arg5, %0) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%1) : (f32) -> ()
    }) : (memref<?xf32>, memref<?x?xf32>, memref<?x?xf32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1, d2) -> (d2)>
#map1 = affine_map<(d0, d1, d2) -> (d1, d2)>
#map2 = affine_map<(d0, d1, d2) -> (d0, d1)>
"builtin.module"() ({
  "func.func"() <{function_type = (memref<5xf32>, memref<7x5xf32>, memref<3x7xf32>) -> (), sym_name = "matmul_bcast_a_transpose_b"}> ({
  ^bb0(%arg0: memref<5xf32>, %arg1: memref<7x5xf32>, %arg2: memref<3x7xf32>):
    "linalg.matmul"(%arg0, %arg1, %arg2) <{indexing_maps = [#map, #map1, #map2], operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg3: f32, %arg4: f32, %arg5: f32):
      %0 = "arith.mulf"(%arg3, %arg4) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      %1 = "arith.addf"(%arg5, %0) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%1) : (f32) -> ()
    }) : (memref<5xf32>, memref<7x5xf32>, memref<3x7xf32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1, d2) -> (d2, d0)>
#map1 = affine_map<(d0, d1, d2) -> (d2)>
#map2 = affine_map<(d0, d1, d2) -> (d0, d1)>
"builtin.module"() ({
  "func.func"() <{function_type = (memref<5x3xf32>, memref<5xf32>, memref<3x7xf32>) -> (), sym_name = "matmul_bcast_b_transpose_a"}> ({
  ^bb0(%arg0: memref<5x3xf32>, %arg1: memref<5xf32>, %arg2: memref<3x7xf32>):
    "linalg.matmul"(%arg0, %arg1, %arg2) <{indexing_maps = [#map, #map1, #map2], operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg3: f32, %arg4: f32, %arg5: f32):
      %0 = "arith.mulf"(%arg3, %arg4) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      %1 = "arith.addf"(%arg5, %0) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%1) : (f32) -> ()
    }) : (memref<5x3xf32>, memref<5xf32>, memref<3x7xf32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1, d2, d3) -> (d3)>
#map1 = affine_map<(d0, d1, d2, d3) -> (d0, d3, d2)>
#map2 = affine_map<(d0, d1, d2, d3) -> (d0, d1, d2)>
"builtin.module"() ({
  "func.func"() <{function_type = (memref<5xf32>, memref<2x5x7xf32>, memref<2x3x7xf32>) -> (), sym_name = "batch_matmul_bcast_k_to_fill_missing_dims_A"}> ({
  ^bb0(%arg0: memref<5xf32>, %arg1: memref<2x5x7xf32>, %arg2: memref<2x3x7xf32>):
    "linalg.batch_matmul"(%arg0, %arg1, %arg2) <{indexing_maps = [#map, #map1, #map2], operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg3: f32, %arg4: f32, %arg5: f32):
      %0 = "arith.mulf"(%arg3, %arg4) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      %1 = "arith.addf"(%arg5, %0) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%1) : (f32) -> ()
    }) : (memref<5xf32>, memref<2x5x7xf32>, memref<2x3x7xf32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1, d2, d3) -> (d1, d3)>
#map1 = affine_map<(d0, d1, d2, d3) -> (d0, d3, d2)>
#map2 = affine_map<(d0, d1, d2, d3) -> (d0, d1, d2)>
"builtin.module"() ({
  "func.func"() <{function_type = (memref<3x5xf32>, memref<2x5x7xf32>, memref<2x3x7xf32>) -> (), sym_name = "batch_matmul_bcast_batch_dim_A"}> ({
  ^bb0(%arg0: memref<3x5xf32>, %arg1: memref<2x5x7xf32>, %arg2: memref<2x3x7xf32>):
    "linalg.batch_matmul"(%arg0, %arg1, %arg2) <{indexing_maps = [#map, #map1, #map2], operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg3: f32, %arg4: f32, %arg5: f32):
      %0 = "arith.mulf"(%arg3, %arg4) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      %1 = "arith.addf"(%arg5, %0) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%1) : (f32) -> ()
    }) : (memref<3x5xf32>, memref<2x5x7xf32>, memref<2x3x7xf32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1, d2, d3) -> (d0, d1, d3)>
#map1 = affine_map<(d0, d1, d2, d3) -> (d3)>
#map2 = affine_map<(d0, d1, d2, d3) -> (d0, d1, d2)>
"builtin.module"() ({
  "func.func"() <{function_type = (memref<2x3x5xf32>, memref<5xf32>, memref<2x3x7xf32>) -> (), sym_name = "batch_matmul_bcast_batch_and_n_dim_B"}> ({
  ^bb0(%arg0: memref<2x3x5xf32>, %arg1: memref<5xf32>, %arg2: memref<2x3x7xf32>):
    "linalg.batch_matmul"(%arg0, %arg1, %arg2) <{indexing_maps = [#map, #map1, #map2], operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg3: f32, %arg4: f32, %arg5: f32):
      %0 = "arith.mulf"(%arg3, %arg4) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      %1 = "arith.addf"(%arg5, %0) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%1) : (f32) -> ()
    }) : (memref<2x3x5xf32>, memref<5xf32>, memref<2x3x7xf32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1, d2, d3) -> (d0, d1, d3)>
#map1 = affine_map<(d0, d1, d2, d3) -> (d3, d2)>
#map2 = affine_map<(d0, d1, d2, d3) -> (d0, d1, d2)>
"builtin.module"() ({
  "func.func"() <{function_type = (memref<2x3x5xf32>, memref<5x7xf32>, memref<2x3x7xf32>) -> (), sym_name = "batch_matmul_bcast_batch_dim_B"}> ({
  ^bb0(%arg0: memref<2x3x5xf32>, %arg1: memref<5x7xf32>, %arg2: memref<2x3x7xf32>):
    "linalg.batch_matmul"(%arg0, %arg1, %arg2) <{indexing_maps = [#map, #map1, #map2], operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg3: f32, %arg4: f32, %arg5: f32):
      %0 = "arith.mulf"(%arg3, %arg4) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      %1 = "arith.addf"(%arg5, %0) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%1) : (f32) -> ()
    }) : (memref<2x3x5xf32>, memref<5x7xf32>, memref<2x3x7xf32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1, d2, d3) -> (d0, d3, d1)>
#map1 = affine_map<(d0, d1, d2, d3) -> (d0, d3, d2)>
#map2 = affine_map<(d0, d1, d2, d3) -> (d0, d1, d2)>
"builtin.module"() ({
  "func.func"() <{function_type = (memref<2x5x3xf32>, memref<2x5x7xf32>, memref<2x3x7xf32>) -> (), sym_name = "batch_matmul_explicit_transpose_A"}> ({
  ^bb0(%arg0: memref<2x5x3xf32>, %arg1: memref<2x5x7xf32>, %arg2: memref<2x3x7xf32>):
    "linalg.batch_matmul"(%arg0, %arg1, %arg2) <{indexing_maps = [#map, #map1, #map2], operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg3: f32, %arg4: f32, %arg5: f32):
      %0 = "arith.mulf"(%arg3, %arg4) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      %1 = "arith.addf"(%arg5, %0) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%1) : (f32) -> ()
    }) : (memref<2x5x3xf32>, memref<2x5x7xf32>, memref<2x3x7xf32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1, d2, d3) -> (d0, d1, d3)>
#map1 = affine_map<(d0, d1, d2, d3) -> (d0, d2, d3)>
#map2 = affine_map<(d0, d1, d2, d3) -> (d0, d1, d2)>
"builtin.module"() ({
  "func.func"() <{function_type = (memref<2x3x5xf32>, memref<2x7x5xf32>, memref<2x3x7xf32>) -> (), sym_name = "batch_matmul_explicit_transpose_B"}> ({
  ^bb0(%arg0: memref<2x3x5xf32>, %arg1: memref<2x7x5xf32>, %arg2: memref<2x3x7xf32>):
    "linalg.batch_matmul"(%arg0, %arg1, %arg2) <{indexing_maps = [#map, #map1, #map2], operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg3: f32, %arg4: f32, %arg5: f32):
      %0 = "arith.mulf"(%arg3, %arg4) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      %1 = "arith.addf"(%arg5, %0) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%1) : (f32) -> ()
    }) : (memref<2x3x5xf32>, memref<2x7x5xf32>, memref<2x3x7xf32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1, d2, d3) -> (d1, d3)>
#map1 = affine_map<(d0, d1, d2, d3) -> (d0, d2, d3)>
#map2 = affine_map<(d0, d1, d2, d3) -> (d0, d1, d2)>
"builtin.module"() ({
  "func.func"() <{function_type = (memref<3x5xf32>, memref<2x7x5xf32>, memref<2x3x7xf32>) -> (), sym_name = "batch_matmul_bcast_A_transpose_B"}> ({
  ^bb0(%arg0: memref<3x5xf32>, %arg1: memref<2x7x5xf32>, %arg2: memref<2x3x7xf32>):
    "linalg.batch_matmul"(%arg0, %arg1, %arg2) <{indexing_maps = [#map, #map1, #map2], operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg3: f32, %arg4: f32, %arg5: f32):
      %0 = "arith.mulf"(%arg3, %arg4) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      %1 = "arith.addf"(%arg5, %0) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%1) : (f32) -> ()
    }) : (memref<3x5xf32>, memref<2x7x5xf32>, memref<2x3x7xf32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1, d2, d3) -> (d3)>
#map1 = affine_map<(d0, d1, d2, d3) -> (d0, d3, d2)>
#map2 = affine_map<(d0, d1, d2, d3) -> (d1, d2)>
"builtin.module"() ({
  "func.func"() <{function_type = (memref<5xf32>, memref<2x5x7xf32>, memref<3x7xf32>) -> (), sym_name = "bcast_k_to_fill_missing_dims_A"}> ({
  ^bb0(%arg0: memref<5xf32>, %arg1: memref<2x5x7xf32>, %arg2: memref<3x7xf32>):
    "linalg.batch_reduce_matmul"(%arg0, %arg1, %arg2) <{indexing_maps = [#map, #map1, #map2], operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg3: f32, %arg4: f32, %arg5: f32):
      %0 = "arith.mulf"(%arg3, %arg4) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      %1 = "arith.addf"(%arg5, %0) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%1) : (f32) -> ()
    }) : (memref<5xf32>, memref<2x5x7xf32>, memref<3x7xf32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1, d2, d3) -> (d1, d3)>
#map1 = affine_map<(d0, d1, d2, d3) -> (d0, d3, d2)>
#map2 = affine_map<(d0, d1, d2, d3) -> (d1, d2)>
"builtin.module"() ({
  "func.func"() <{function_type = (memref<3x5xf32>, memref<2x5x7xf32>, memref<3x7xf32>) -> (), sym_name = "bcast_batch_dim_A"}> ({
  ^bb0(%arg0: memref<3x5xf32>, %arg1: memref<2x5x7xf32>, %arg2: memref<3x7xf32>):
    "linalg.batch_reduce_matmul"(%arg0, %arg1, %arg2) <{indexing_maps = [#map, #map1, #map2], operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg3: f32, %arg4: f32, %arg5: f32):
      %0 = "arith.mulf"(%arg3, %arg4) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      %1 = "arith.addf"(%arg5, %0) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%1) : (f32) -> ()
    }) : (memref<3x5xf32>, memref<2x5x7xf32>, memref<3x7xf32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1, d2, d3) -> (d0, d1, d3)>
#map1 = affine_map<(d0, d1, d2, d3) -> (d3)>
#map2 = affine_map<(d0, d1, d2, d3) -> (d1, d2)>
"builtin.module"() ({
  "func.func"() <{function_type = (memref<2x3x5xf32>, memref<5xf32>, memref<3x7xf32>) -> (), sym_name = "bcast_batch_and_n_dim_B"}> ({
  ^bb0(%arg0: memref<2x3x5xf32>, %arg1: memref<5xf32>, %arg2: memref<3x7xf32>):
    "linalg.batch_reduce_matmul"(%arg0, %arg1, %arg2) <{indexing_maps = [#map, #map1, #map2], operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg3: f32, %arg4: f32, %arg5: f32):
      %0 = "arith.mulf"(%arg3, %arg4) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      %1 = "arith.addf"(%arg5, %0) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%1) : (f32) -> ()
    }) : (memref<2x3x5xf32>, memref<5xf32>, memref<3x7xf32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1, d2, d3) -> (d0, d1, d3)>
#map1 = affine_map<(d0, d1, d2, d3) -> (d3, d2)>
#map2 = affine_map<(d0, d1, d2, d3) -> (d1, d2)>
"builtin.module"() ({
  "func.func"() <{function_type = (memref<2x3x5xf32>, memref<5x7xf32>, memref<3x7xf32>) -> (), sym_name = "bcast_batch_dim_B"}> ({
  ^bb0(%arg0: memref<2x3x5xf32>, %arg1: memref<5x7xf32>, %arg2: memref<3x7xf32>):
    "linalg.batch_reduce_matmul"(%arg0, %arg1, %arg2) <{indexing_maps = [#map, #map1, #map2], operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg3: f32, %arg4: f32, %arg5: f32):
      %0 = "arith.mulf"(%arg3, %arg4) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      %1 = "arith.addf"(%arg5, %0) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%1) : (f32) -> ()
    }) : (memref<2x3x5xf32>, memref<5x7xf32>, memref<3x7xf32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1, d2, d3) -> (d0, d3, d1)>
#map1 = affine_map<(d0, d1, d2, d3) -> (d0, d3, d2)>
#map2 = affine_map<(d0, d1, d2, d3) -> (d1, d2)>
"builtin.module"() ({
  "func.func"() <{function_type = (memref<2x5x3xf32>, memref<2x5x7xf32>, memref<3x7xf32>) -> (), sym_name = "explicit_transpose_A"}> ({
  ^bb0(%arg0: memref<2x5x3xf32>, %arg1: memref<2x5x7xf32>, %arg2: memref<3x7xf32>):
    "linalg.batch_reduce_matmul"(%arg0, %arg1, %arg2) <{indexing_maps = [#map, #map1, #map2], operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg3: f32, %arg4: f32, %arg5: f32):
      %0 = "arith.mulf"(%arg3, %arg4) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      %1 = "arith.addf"(%arg5, %0) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%1) : (f32) -> ()
    }) : (memref<2x5x3xf32>, memref<2x5x7xf32>, memref<3x7xf32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1, d2, d3) -> (d0, d1, d3)>
#map1 = affine_map<(d0, d1, d2, d3) -> (d0, d2, d3)>
#map2 = affine_map<(d0, d1, d2, d3) -> (d1, d2)>
"builtin.module"() ({
  "func.func"() <{function_type = (memref<2x3x5xf32>, memref<2x7x5xf32>, memref<3x7xf32>) -> (), sym_name = "explicit_transpose_B"}> ({
  ^bb0(%arg0: memref<2x3x5xf32>, %arg1: memref<2x7x5xf32>, %arg2: memref<3x7xf32>):
    "linalg.batch_reduce_matmul"(%arg0, %arg1, %arg2) <{indexing_maps = [#map, #map1, #map2], operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg3: f32, %arg4: f32, %arg5: f32):
      %0 = "arith.mulf"(%arg3, %arg4) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      %1 = "arith.addf"(%arg5, %0) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%1) : (f32) -> ()
    }) : (memref<2x3x5xf32>, memref<2x7x5xf32>, memref<3x7xf32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1, d2, d3) -> (d1, d3)>
#map1 = affine_map<(d0, d1, d2, d3) -> (d0, d2, d3)>
#map2 = affine_map<(d0, d1, d2, d3) -> (d1, d2)>
"builtin.module"() ({
  "func.func"() <{function_type = (memref<3x5xf32>, memref<2x7x5xf32>, memref<3x7xf32>) -> (), sym_name = "bcast_A_transpose_B"}> ({
  ^bb0(%arg0: memref<3x5xf32>, %arg1: memref<2x7x5xf32>, %arg2: memref<3x7xf32>):
    "linalg.batch_reduce_matmul"(%arg0, %arg1, %arg2) <{indexing_maps = [#map, #map1, #map2], operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg3: f32, %arg4: f32, %arg5: f32):
      %0 = "arith.mulf"(%arg3, %arg4) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      %1 = "arith.addf"(%arg5, %0) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%1) : (f32) -> ()
    }) : (memref<3x5xf32>, memref<2x7x5xf32>, memref<3x7xf32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1, d2, d3) -> (d0, d1, d3)>
#map1 = affine_map<(d0, d1, d2, d3) -> (d0, d3, d2)>
#map2 = affine_map<(d0, d1, d2, d3) -> (d0, d1, d2)>
"builtin.module"() ({
  "func.func"() <{function_type = (memref<2x3x5xf32>, memref<2x5x7xf32>, memref<2x3x7xf32>) -> (), sym_name = "contract"}> ({
  ^bb0(%arg0: memref<2x3x5xf32>, %arg1: memref<2x5x7xf32>, %arg2: memref<2x3x7xf32>):
    "linalg.contract"(%arg0, %arg1, %arg2) <{indexing_maps = [#map, #map1, #map2], operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg3: f32, %arg4: f32, %arg5: f32):
      %0 = "arith.mulf"(%arg3, %arg4) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      %1 = "arith.addf"(%arg5, %0) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%1) : (f32) -> ()
    }) : (memref<2x3x5xf32>, memref<2x5x7xf32>, memref<2x3x7xf32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1, d2) -> (d2)>
#map1 = affine_map<(d0, d1, d2) -> (d2, d1)>
#map2 = affine_map<(d0, d1, d2) -> (d0, d1)>
"builtin.module"() ({
  "func.func"() <{function_type = (memref<5xf32>, memref<5x7xf32>, memref<3x7xf32>) -> (), sym_name = "contract_matmul_bcast_a"}> ({
  ^bb0(%arg0: memref<5xf32>, %arg1: memref<5x7xf32>, %arg2: memref<3x7xf32>):
    "linalg.contract"(%arg0, %arg1, %arg2) <{indexing_maps = [#map, #map1, #map2], operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg3: f32, %arg4: f32, %arg5: f32):
      %0 = "arith.mulf"(%arg3, %arg4) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      %1 = "arith.addf"(%arg5, %0) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%1) : (f32) -> ()
    }) : (memref<5xf32>, memref<5x7xf32>, memref<3x7xf32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1, d2) -> (d0, d2)>
#map1 = affine_map<(d0, d1, d2) -> (d2)>
#map2 = affine_map<(d0, d1, d2) -> (d0, d1)>
"builtin.module"() ({
  "func.func"() <{function_type = (memref<3x5xf32>, memref<5xf32>, memref<3x7xf32>) -> (), sym_name = "contract_matmul_bcast_b"}> ({
  ^bb0(%arg0: memref<3x5xf32>, %arg1: memref<5xf32>, %arg2: memref<3x7xf32>):
    "linalg.contract"(%arg0, %arg1, %arg2) <{indexing_maps = [#map, #map1, #map2], operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg3: f32, %arg4: f32, %arg5: f32):
      %0 = "arith.mulf"(%arg3, %arg4) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      %1 = "arith.addf"(%arg5, %0) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%1) : (f32) -> ()
    }) : (memref<3x5xf32>, memref<5xf32>, memref<3x7xf32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1, d2) -> (d2)>
#map1 = affine_map<(d0, d1, d2) -> (d0, d1)>
"builtin.module"() ({
  "func.func"() <{function_type = (memref<5xf32>, memref<5xf32>, memref<3x7xf32>) -> (), sym_name = "contract_matmul_bcast_a_b"}> ({
  ^bb0(%arg0: memref<5xf32>, %arg1: memref<5xf32>, %arg2: memref<3x7xf32>):
    "linalg.contract"(%arg0, %arg1, %arg2) <{indexing_maps = [#map, #map, #map1], operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg3: f32, %arg4: f32, %arg5: f32):
      %0 = "arith.mulf"(%arg3, %arg4) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      %1 = "arith.addf"(%arg5, %0) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%1) : (f32) -> ()
    }) : (memref<5xf32>, memref<5xf32>, memref<3x7xf32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1, d2) -> (d2)>
#map1 = affine_map<(d0, d1, d2) -> (d1, d2)>
#map2 = affine_map<(d0, d1, d2) -> (d0, d1)>
"builtin.module"() ({
  "func.func"() <{function_type = (memref<5xf32>, memref<7x5xf32>, memref<3x7xf32>) -> (), sym_name = "contract_matmul_bcast_a_transpose_b"}> ({
  ^bb0(%arg0: memref<5xf32>, %arg1: memref<7x5xf32>, %arg2: memref<3x7xf32>):
    "linalg.contract"(%arg0, %arg1, %arg2) <{indexing_maps = [#map, #map1, #map2], operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg3: f32, %arg4: f32, %arg5: f32):
      %0 = "arith.mulf"(%arg3, %arg4) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      %1 = "arith.addf"(%arg5, %0) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%1) : (f32) -> ()
    }) : (memref<5xf32>, memref<7x5xf32>, memref<3x7xf32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1, d2) -> (d2, d0)>
#map1 = affine_map<(d0, d1, d2) -> (d2)>
#map2 = affine_map<(d0, d1, d2) -> (d0, d1)>
"builtin.module"() ({
  "func.func"() <{function_type = (memref<5x3xf32>, memref<5xf32>, memref<3x7xf32>) -> (), sym_name = "contract_matmul_bcast_b_transpose_a"}> ({
  ^bb0(%arg0: memref<5x3xf32>, %arg1: memref<5xf32>, %arg2: memref<3x7xf32>):
    "linalg.contract"(%arg0, %arg1, %arg2) <{indexing_maps = [#map, #map1, #map2], operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg3: f32, %arg4: f32, %arg5: f32):
      %0 = "arith.mulf"(%arg3, %arg4) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      %1 = "arith.addf"(%arg5, %0) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%1) : (f32) -> ()
    }) : (memref<5x3xf32>, memref<5xf32>, memref<3x7xf32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1, d2, d3, d4, d5) -> (d0, d2, d3, d5)>
#map1 = affine_map<(d0, d1, d2, d3, d4, d5) -> (d1, d2, d4, d5)>
#map2 = affine_map<(d0, d1, d2, d3, d4, d5) -> (d0, d1, d3, d4)>
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<10x32x8x1xf32>, tensor<80x32x4x1xf32>, tensor<10x80x8x4xf32>) -> tensor<10x80x8x4xf32>, sym_name = "mmt4d"}> ({
  ^bb0(%arg0: tensor<10x32x8x1xf32>, %arg1: tensor<80x32x4x1xf32>, %arg2: tensor<10x80x8x4xf32>):
    %0 = "linalg.mmt4d"(%arg0, %arg1, %arg2) <{operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg3: f32, %arg4: f32, %arg5: f32):
      %1 = "arith.mulf"(%arg3, %arg4) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      %2 = "arith.addf"(%arg5, %1) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%2) : (f32) -> ()
    }) {linalg.memoized_indexing_maps = [#map, #map1, #map2]} : (tensor<10x32x8x1xf32>, tensor<80x32x4x1xf32>, tensor<10x80x8x4xf32>) -> tensor<10x80x8x4xf32>
    "func.return"(%0) : (tensor<10x80x8x4xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1, d2, d3, d4, d5, d6) -> (d0, d1, d3, d4, d6)>
#map1 = affine_map<(d0, d1, d2, d3, d4, d5, d6) -> (d0, d2, d3, d5, d6)>
#map2 = affine_map<(d0, d1, d2, d3, d4, d5, d6) -> (d0, d1, d2, d4, d5)>
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<128x10x32x8x1xf32>, tensor<128x80x32x4x1xf32>, tensor<128x10x80x8x4xf32>) -> tensor<128x10x80x8x4xf32>, sym_name = "batch_mmt4d"}> ({
  ^bb0(%arg0: tensor<128x10x32x8x1xf32>, %arg1: tensor<128x80x32x4x1xf32>, %arg2: tensor<128x10x80x8x4xf32>):
    %0 = "linalg.batch_mmt4d"(%arg0, %arg1, %arg2) <{operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg3: f32, %arg4: f32, %arg5: f32):
      %1 = "arith.mulf"(%arg3, %arg4) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      %2 = "arith.addf"(%arg5, %1) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%2) : (f32) -> ()
    }) {linalg.memoized_indexing_maps = [#map, #map1, #map2]} : (tensor<128x10x32x8x1xf32>, tensor<128x80x32x4x1xf32>, tensor<128x10x80x8x4xf32>) -> tensor<128x10x80x8x4xf32>
    "func.return"(%0) : (tensor<128x10x80x8x4xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (memref<?x?x?xf32>, memref<?x?x?xf32>, memref<?x?x?xf32>) -> (), sym_name = "add_dynamic"}> ({
  ^bb0(%arg0: memref<?x?x?xf32>, %arg1: memref<?x?x?xf32>, %arg2: memref<?x?x?xf32>):
    "linalg.add"(%arg0, %arg1, %arg2) <{operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg3: f32, %arg4: f32, %arg5: f32):
      %0 = "arith.addf"(%arg3, %arg4) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%0) : (f32) -> ()
    }) : (memref<?x?x?xf32>, memref<?x?x?xf32>, memref<?x?x?xf32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (memref<4x8x16xf32>, memref<4x8x16xf32>, memref<4x8x16xf32>) -> (), sym_name = "add_static"}> ({
  ^bb0(%arg0: memref<4x8x16xf32>, %arg1: memref<4x8x16xf32>, %arg2: memref<4x8x16xf32>):
    "linalg.add"(%arg0, %arg1, %arg2) <{operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg3: f32, %arg4: f32, %arg5: f32):
      %0 = "arith.addf"(%arg3, %arg4) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%0) : (f32) -> ()
    }) : (memref<4x8x16xf32>, memref<4x8x16xf32>, memref<4x8x16xf32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<4x8x16xf32>, tensor<4x8x16xf32>) -> tensor<4x8x16xf32>, sym_name = "add_tensor"}> ({
  ^bb0(%arg0: tensor<4x8x16xf32>, %arg1: tensor<4x8x16xf32>):
    %0 = "tensor.empty"() : () -> tensor<4x8x16xf32>
    %1 = "linalg.add"(%arg0, %arg1, %0) <{operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg2: f32, %arg3: f32, %arg4: f32):
      %2 = "arith.addf"(%arg2, %arg3) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%2) : (f32) -> ()
    }) : (tensor<4x8x16xf32>, tensor<4x8x16xf32>, tensor<4x8x16xf32>) -> tensor<4x8x16xf32>
    "func.return"(%1) : (tensor<4x8x16xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (memref<?x?x?xf32>, memref<?x?x?xf32>, memref<?x?x?xf32>) -> (), sym_name = "sub_dynamic"}> ({
  ^bb0(%arg0: memref<?x?x?xf32>, %arg1: memref<?x?x?xf32>, %arg2: memref<?x?x?xf32>):
    "linalg.sub"(%arg0, %arg1, %arg2) <{operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg3: f32, %arg4: f32, %arg5: f32):
      %0 = "arith.subf"(%arg3, %arg4) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%0) : (f32) -> ()
    }) : (memref<?x?x?xf32>, memref<?x?x?xf32>, memref<?x?x?xf32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (memref<4x8x16xf32>, memref<4x8x16xf32>, memref<4x8x16xf32>) -> (), sym_name = "sub_static"}> ({
  ^bb0(%arg0: memref<4x8x16xf32>, %arg1: memref<4x8x16xf32>, %arg2: memref<4x8x16xf32>):
    "linalg.sub"(%arg0, %arg1, %arg2) <{operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg3: f32, %arg4: f32, %arg5: f32):
      %0 = "arith.subf"(%arg3, %arg4) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%0) : (f32) -> ()
    }) : (memref<4x8x16xf32>, memref<4x8x16xf32>, memref<4x8x16xf32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<4x8x16xf32>, tensor<4x8x16xf32>) -> tensor<4x8x16xf32>, sym_name = "sub_tensor"}> ({
  ^bb0(%arg0: tensor<4x8x16xf32>, %arg1: tensor<4x8x16xf32>):
    %0 = "tensor.empty"() : () -> tensor<4x8x16xf32>
    %1 = "linalg.sub"(%arg0, %arg1, %0) <{operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg2: f32, %arg3: f32, %arg4: f32):
      %2 = "arith.subf"(%arg2, %arg3) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%2) : (f32) -> ()
    }) : (tensor<4x8x16xf32>, tensor<4x8x16xf32>, tensor<4x8x16xf32>) -> tensor<4x8x16xf32>
    "func.return"(%1) : (tensor<4x8x16xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (memref<?x?x?xf32>, memref<?x?x?xf32>, memref<?x?x?xf32>) -> (), sym_name = "mul_dynamic"}> ({
  ^bb0(%arg0: memref<?x?x?xf32>, %arg1: memref<?x?x?xf32>, %arg2: memref<?x?x?xf32>):
    "linalg.mul"(%arg0, %arg1, %arg2) <{operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg3: f32, %arg4: f32, %arg5: f32):
      %0 = "arith.mulf"(%arg3, %arg4) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%0) : (f32) -> ()
    }) : (memref<?x?x?xf32>, memref<?x?x?xf32>, memref<?x?x?xf32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (memref<4x8x16xf32>, memref<4x8x16xf32>, memref<4x8x16xf32>) -> (), sym_name = "mul_static"}> ({
  ^bb0(%arg0: memref<4x8x16xf32>, %arg1: memref<4x8x16xf32>, %arg2: memref<4x8x16xf32>):
    "linalg.mul"(%arg0, %arg1, %arg2) <{operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg3: f32, %arg4: f32, %arg5: f32):
      %0 = "arith.mulf"(%arg3, %arg4) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%0) : (f32) -> ()
    }) : (memref<4x8x16xf32>, memref<4x8x16xf32>, memref<4x8x16xf32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<4x8x16xf32>, tensor<4x8x16xf32>) -> tensor<4x8x16xf32>, sym_name = "mul_tensor"}> ({
  ^bb0(%arg0: tensor<4x8x16xf32>, %arg1: tensor<4x8x16xf32>):
    %0 = "tensor.empty"() : () -> tensor<4x8x16xf32>
    %1 = "linalg.mul"(%arg0, %arg1, %0) <{operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg2: f32, %arg3: f32, %arg4: f32):
      %2 = "arith.mulf"(%arg2, %arg3) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%2) : (f32) -> ()
    }) : (tensor<4x8x16xf32>, tensor<4x8x16xf32>, tensor<4x8x16xf32>) -> tensor<4x8x16xf32>
    "func.return"(%1) : (tensor<4x8x16xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (memref<?x?x?xf32>, memref<?x?x?xf32>, memref<?x?x?xf32>) -> (), sym_name = "div_dynamic"}> ({
  ^bb0(%arg0: memref<?x?x?xf32>, %arg1: memref<?x?x?xf32>, %arg2: memref<?x?x?xf32>):
    "linalg.div"(%arg0, %arg1, %arg2) <{operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg3: f32, %arg4: f32, %arg5: f32):
      %0 = "arith.divf"(%arg3, %arg4) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%0) : (f32) -> ()
    }) : (memref<?x?x?xf32>, memref<?x?x?xf32>, memref<?x?x?xf32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (memref<4x8x16xf32>, memref<4x8x16xf32>, memref<4x8x16xf32>) -> (), sym_name = "div_static"}> ({
  ^bb0(%arg0: memref<4x8x16xf32>, %arg1: memref<4x8x16xf32>, %arg2: memref<4x8x16xf32>):
    "linalg.div"(%arg0, %arg1, %arg2) <{operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg3: f32, %arg4: f32, %arg5: f32):
      %0 = "arith.divf"(%arg3, %arg4) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%0) : (f32) -> ()
    }) : (memref<4x8x16xf32>, memref<4x8x16xf32>, memref<4x8x16xf32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<4x8x16xf32>, tensor<4x8x16xf32>) -> tensor<4x8x16xf32>, sym_name = "div_tensor"}> ({
  ^bb0(%arg0: tensor<4x8x16xf32>, %arg1: tensor<4x8x16xf32>):
    %0 = "tensor.empty"() : () -> tensor<4x8x16xf32>
    %1 = "linalg.div"(%arg0, %arg1, %0) <{operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg2: f32, %arg3: f32, %arg4: f32):
      %2 = "arith.divf"(%arg2, %arg3) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%2) : (f32) -> ()
    }) : (tensor<4x8x16xf32>, tensor<4x8x16xf32>, tensor<4x8x16xf32>) -> tensor<4x8x16xf32>
    "func.return"(%1) : (tensor<4x8x16xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (memref<?x?x?xi32>, memref<?x?x?xi32>, memref<?x?x?xi32>) -> (), sym_name = "div_unsigned_dynamic"}> ({
  ^bb0(%arg0: memref<?x?x?xi32>, %arg1: memref<?x?x?xi32>, %arg2: memref<?x?x?xi32>):
    "linalg.div_unsigned"(%arg0, %arg1, %arg2) <{operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg3: i32, %arg4: i32, %arg5: i32):
      %0 = "arith.divui"(%arg3, %arg4) : (i32, i32) -> i32
      "linalg.yield"(%0) : (i32) -> ()
    }) : (memref<?x?x?xi32>, memref<?x?x?xi32>, memref<?x?x?xi32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (memref<4x8x16xi32>, memref<4x8x16xi32>, memref<4x8x16xi32>) -> (), sym_name = "div_unsigned_static"}> ({
  ^bb0(%arg0: memref<4x8x16xi32>, %arg1: memref<4x8x16xi32>, %arg2: memref<4x8x16xi32>):
    "linalg.div_unsigned"(%arg0, %arg1, %arg2) <{operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg3: i32, %arg4: i32, %arg5: i32):
      %0 = "arith.divui"(%arg3, %arg4) : (i32, i32) -> i32
      "linalg.yield"(%0) : (i32) -> ()
    }) : (memref<4x8x16xi32>, memref<4x8x16xi32>, memref<4x8x16xi32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<4x8x16xi32>, tensor<4x8x16xi32>) -> tensor<4x8x16xi32>, sym_name = "div_unsigned_tensor"}> ({
  ^bb0(%arg0: tensor<4x8x16xi32>, %arg1: tensor<4x8x16xi32>):
    %0 = "tensor.empty"() : () -> tensor<4x8x16xi32>
    %1 = "linalg.div_unsigned"(%arg0, %arg1, %0) <{operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg2: i32, %arg3: i32, %arg4: i32):
      %2 = "arith.divui"(%arg2, %arg3) : (i32, i32) -> i32
      "linalg.yield"(%2) : (i32) -> ()
    }) : (tensor<4x8x16xi32>, tensor<4x8x16xi32>, tensor<4x8x16xi32>) -> tensor<4x8x16xi32>
    "func.return"(%1) : (tensor<4x8x16xi32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (memref<?x?x?xf32>, memref<?x?x?xf32>) -> (), sym_name = "exp_dynamic"}> ({
  ^bb0(%arg0: memref<?x?x?xf32>, %arg1: memref<?x?x?xf32>):
    "linalg.exp"(%arg0, %arg1) <{operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg2: f32, %arg3: f32):
      %0 = "math.exp"(%arg2) <{fastmath = #arith.fastmath<none>}> : (f32) -> f32
      "linalg.yield"(%0) : (f32) -> ()
    }) : (memref<?x?x?xf32>, memref<?x?x?xf32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (memref<4x8x16xf32>, memref<4x8x16xf32>) -> (), sym_name = "exp_static"}> ({
  ^bb0(%arg0: memref<4x8x16xf32>, %arg1: memref<4x8x16xf32>):
    "linalg.exp"(%arg0, %arg1) <{operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg2: f32, %arg3: f32):
      %0 = "math.exp"(%arg2) <{fastmath = #arith.fastmath<none>}> : (f32) -> f32
      "linalg.yield"(%0) : (f32) -> ()
    }) : (memref<4x8x16xf32>, memref<4x8x16xf32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<4x8x16xf32>) -> tensor<4x8x16xf32>, sym_name = "exp_tensor"}> ({
  ^bb0(%arg0: tensor<4x8x16xf32>):
    %0 = "tensor.empty"() : () -> tensor<4x8x16xf32>
    %1 = "linalg.exp"(%arg0, %0) <{operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg1: f32, %arg2: f32):
      %2 = "math.exp"(%arg1) <{fastmath = #arith.fastmath<none>}> : (f32) -> f32
      "linalg.yield"(%2) : (f32) -> ()
    }) : (tensor<4x8x16xf32>, tensor<4x8x16xf32>) -> tensor<4x8x16xf32>
    "func.return"(%1) : (tensor<4x8x16xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (memref<?x?x?xf32>, memref<?x?x?xf32>) -> (), sym_name = "log_dynamic"}> ({
  ^bb0(%arg0: memref<?x?x?xf32>, %arg1: memref<?x?x?xf32>):
    "linalg.log"(%arg0, %arg1) <{operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg2: f32, %arg3: f32):
      %0 = "math.log"(%arg2) <{fastmath = #arith.fastmath<none>}> : (f32) -> f32
      "linalg.yield"(%0) : (f32) -> ()
    }) : (memref<?x?x?xf32>, memref<?x?x?xf32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (memref<4x8x16xf32>, memref<4x8x16xf32>) -> (), sym_name = "log_static"}> ({
  ^bb0(%arg0: memref<4x8x16xf32>, %arg1: memref<4x8x16xf32>):
    "linalg.log"(%arg0, %arg1) <{operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg2: f32, %arg3: f32):
      %0 = "math.log"(%arg2) <{fastmath = #arith.fastmath<none>}> : (f32) -> f32
      "linalg.yield"(%0) : (f32) -> ()
    }) : (memref<4x8x16xf32>, memref<4x8x16xf32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<4x8x16xf32>) -> tensor<4x8x16xf32>, sym_name = "log_tensor"}> ({
  ^bb0(%arg0: tensor<4x8x16xf32>):
    %0 = "tensor.empty"() : () -> tensor<4x8x16xf32>
    %1 = "linalg.log"(%arg0, %0) <{operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg1: f32, %arg2: f32):
      %2 = "math.log"(%arg1) <{fastmath = #arith.fastmath<none>}> : (f32) -> f32
      "linalg.yield"(%2) : (f32) -> ()
    }) : (tensor<4x8x16xf32>, tensor<4x8x16xf32>) -> tensor<4x8x16xf32>
    "func.return"(%1) : (tensor<4x8x16xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (memref<?x?x?xf32>, memref<?x?x?xf32>) -> (), sym_name = "abs_dynamic"}> ({
  ^bb0(%arg0: memref<?x?x?xf32>, %arg1: memref<?x?x?xf32>):
    "linalg.abs"(%arg0, %arg1) <{operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg2: f32, %arg3: f32):
      %0 = "math.absf"(%arg2) <{fastmath = #arith.fastmath<none>}> : (f32) -> f32
      "linalg.yield"(%0) : (f32) -> ()
    }) : (memref<?x?x?xf32>, memref<?x?x?xf32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (memref<4x8x16xf32>, memref<4x8x16xf32>) -> (), sym_name = "abs_static"}> ({
  ^bb0(%arg0: memref<4x8x16xf32>, %arg1: memref<4x8x16xf32>):
    "linalg.abs"(%arg0, %arg1) <{operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg2: f32, %arg3: f32):
      %0 = "math.absf"(%arg2) <{fastmath = #arith.fastmath<none>}> : (f32) -> f32
      "linalg.yield"(%0) : (f32) -> ()
    }) : (memref<4x8x16xf32>, memref<4x8x16xf32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<4x8x16xf32>) -> tensor<4x8x16xf32>, sym_name = "abs_tensor"}> ({
  ^bb0(%arg0: tensor<4x8x16xf32>):
    %0 = "tensor.empty"() : () -> tensor<4x8x16xf32>
    %1 = "linalg.abs"(%arg0, %0) <{operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg1: f32, %arg2: f32):
      %2 = "math.absf"(%arg1) <{fastmath = #arith.fastmath<none>}> : (f32) -> f32
      "linalg.yield"(%2) : (f32) -> ()
    }) : (tensor<4x8x16xf32>, tensor<4x8x16xf32>) -> tensor<4x8x16xf32>
    "func.return"(%1) : (tensor<4x8x16xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (memref<?x?x?xf32>, memref<?x?x?xf32>) -> (), sym_name = "ceil_dynamic"}> ({
  ^bb0(%arg0: memref<?x?x?xf32>, %arg1: memref<?x?x?xf32>):
    "linalg.ceil"(%arg0, %arg1) <{operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg2: f32, %arg3: f32):
      %0 = "math.ceil"(%arg2) <{fastmath = #arith.fastmath<none>}> : (f32) -> f32
      "linalg.yield"(%0) : (f32) -> ()
    }) : (memref<?x?x?xf32>, memref<?x?x?xf32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (memref<4x8x16xf32>, memref<4x8x16xf32>) -> (), sym_name = "ceil_static"}> ({
  ^bb0(%arg0: memref<4x8x16xf32>, %arg1: memref<4x8x16xf32>):
    "linalg.ceil"(%arg0, %arg1) <{operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg2: f32, %arg3: f32):
      %0 = "math.ceil"(%arg2) <{fastmath = #arith.fastmath<none>}> : (f32) -> f32
      "linalg.yield"(%0) : (f32) -> ()
    }) : (memref<4x8x16xf32>, memref<4x8x16xf32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<4x8x16xf32>) -> tensor<4x8x16xf32>, sym_name = "ceil_tensor"}> ({
  ^bb0(%arg0: tensor<4x8x16xf32>):
    %0 = "tensor.empty"() : () -> tensor<4x8x16xf32>
    %1 = "linalg.ceil"(%arg0, %0) <{operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg1: f32, %arg2: f32):
      %2 = "math.ceil"(%arg1) <{fastmath = #arith.fastmath<none>}> : (f32) -> f32
      "linalg.yield"(%2) : (f32) -> ()
    }) : (tensor<4x8x16xf32>, tensor<4x8x16xf32>) -> tensor<4x8x16xf32>
    "func.return"(%1) : (tensor<4x8x16xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (memref<?x?x?xf32>, memref<?x?x?xf32>) -> (), sym_name = "floor_dynamic"}> ({
  ^bb0(%arg0: memref<?x?x?xf32>, %arg1: memref<?x?x?xf32>):
    "linalg.floor"(%arg0, %arg1) <{operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg2: f32, %arg3: f32):
      %0 = "math.floor"(%arg2) <{fastmath = #arith.fastmath<none>}> : (f32) -> f32
      "linalg.yield"(%0) : (f32) -> ()
    }) : (memref<?x?x?xf32>, memref<?x?x?xf32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (memref<4x8x16xf32>, memref<4x8x16xf32>) -> (), sym_name = "floor_static"}> ({
  ^bb0(%arg0: memref<4x8x16xf32>, %arg1: memref<4x8x16xf32>):
    "linalg.floor"(%arg0, %arg1) <{operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg2: f32, %arg3: f32):
      %0 = "math.floor"(%arg2) <{fastmath = #arith.fastmath<none>}> : (f32) -> f32
      "linalg.yield"(%0) : (f32) -> ()
    }) : (memref<4x8x16xf32>, memref<4x8x16xf32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<4x8x16xf32>) -> tensor<4x8x16xf32>, sym_name = "floor_tensor"}> ({
  ^bb0(%arg0: tensor<4x8x16xf32>):
    %0 = "tensor.empty"() : () -> tensor<4x8x16xf32>
    %1 = "linalg.floor"(%arg0, %0) <{operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg1: f32, %arg2: f32):
      %2 = "math.floor"(%arg1) <{fastmath = #arith.fastmath<none>}> : (f32) -> f32
      "linalg.yield"(%2) : (f32) -> ()
    }) : (tensor<4x8x16xf32>, tensor<4x8x16xf32>) -> tensor<4x8x16xf32>
    "func.return"(%1) : (tensor<4x8x16xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (memref<?x?x?xf32>, memref<?x?x?xf32>) -> (), sym_name = "negf_dynamic"}> ({
  ^bb0(%arg0: memref<?x?x?xf32>, %arg1: memref<?x?x?xf32>):
    "linalg.negf"(%arg0, %arg1) <{operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg2: f32, %arg3: f32):
      %0 = "arith.negf"(%arg2) <{fastmath = #arith.fastmath<none>}> : (f32) -> f32
      "linalg.yield"(%0) : (f32) -> ()
    }) : (memref<?x?x?xf32>, memref<?x?x?xf32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (memref<4x8x16xf32>, memref<4x8x16xf32>) -> (), sym_name = "negf_static"}> ({
  ^bb0(%arg0: memref<4x8x16xf32>, %arg1: memref<4x8x16xf32>):
    "linalg.negf"(%arg0, %arg1) <{operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg2: f32, %arg3: f32):
      %0 = "arith.negf"(%arg2) <{fastmath = #arith.fastmath<none>}> : (f32) -> f32
      "linalg.yield"(%0) : (f32) -> ()
    }) : (memref<4x8x16xf32>, memref<4x8x16xf32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<4x8x16xf32>) -> tensor<4x8x16xf32>, sym_name = "negf_tensor"}> ({
  ^bb0(%arg0: tensor<4x8x16xf32>):
    %0 = "tensor.empty"() : () -> tensor<4x8x16xf32>
    %1 = "linalg.negf"(%arg0, %0) <{operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg1: f32, %arg2: f32):
      %2 = "arith.negf"(%arg1) <{fastmath = #arith.fastmath<none>}> : (f32) -> f32
      "linalg.yield"(%2) : (f32) -> ()
    }) : (tensor<4x8x16xf32>, tensor<4x8x16xf32>) -> tensor<4x8x16xf32>
    "func.return"(%1) : (tensor<4x8x16xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (memref<?x?x?xf32>, memref<?x?x?xf32>) -> (), sym_name = "reciprocal_dynamic"}> ({
  ^bb0(%arg0: memref<?x?x?xf32>, %arg1: memref<?x?x?xf32>):
    "linalg.reciprocal"(%arg0, %arg1) <{operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg2: f32, %arg3: f32):
      %0 = "arith.constant"() <{value = 1.000000e+00 : f32}> : () -> f32
      %1 = "arith.divf"(%0, %arg2) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%1) : (f32) -> ()
    }) : (memref<?x?x?xf32>, memref<?x?x?xf32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (memref<4x8x16xf32>, memref<4x8x16xf32>) -> (), sym_name = "reciprocal_static"}> ({
  ^bb0(%arg0: memref<4x8x16xf32>, %arg1: memref<4x8x16xf32>):
    "linalg.reciprocal"(%arg0, %arg1) <{operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg2: f32, %arg3: f32):
      %0 = "arith.constant"() <{value = 1.000000e+00 : f32}> : () -> f32
      %1 = "arith.divf"(%0, %arg2) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%1) : (f32) -> ()
    }) : (memref<4x8x16xf32>, memref<4x8x16xf32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<4x8x16xf32>) -> tensor<4x8x16xf32>, sym_name = "reciprocal_tensor"}> ({
  ^bb0(%arg0: tensor<4x8x16xf32>):
    %0 = "tensor.empty"() : () -> tensor<4x8x16xf32>
    %1 = "linalg.reciprocal"(%arg0, %0) <{operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg1: f32, %arg2: f32):
      %2 = "arith.constant"() <{value = 1.000000e+00 : f32}> : () -> f32
      %3 = "arith.divf"(%2, %arg1) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%3) : (f32) -> ()
    }) : (tensor<4x8x16xf32>, tensor<4x8x16xf32>) -> tensor<4x8x16xf32>
    "func.return"(%1) : (tensor<4x8x16xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (memref<?x?x?xf32>, memref<?x?x?xf32>) -> (), sym_name = "round_dynamic"}> ({
  ^bb0(%arg0: memref<?x?x?xf32>, %arg1: memref<?x?x?xf32>):
    "linalg.round"(%arg0, %arg1) <{operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg2: f32, %arg3: f32):
      %0 = "math.round"(%arg2) <{fastmath = #arith.fastmath<none>}> : (f32) -> f32
      "linalg.yield"(%0) : (f32) -> ()
    }) : (memref<?x?x?xf32>, memref<?x?x?xf32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (memref<4x8x16xf32>, memref<4x8x16xf32>) -> (), sym_name = "round_static"}> ({
  ^bb0(%arg0: memref<4x8x16xf32>, %arg1: memref<4x8x16xf32>):
    "linalg.round"(%arg0, %arg1) <{operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg2: f32, %arg3: f32):
      %0 = "math.round"(%arg2) <{fastmath = #arith.fastmath<none>}> : (f32) -> f32
      "linalg.yield"(%0) : (f32) -> ()
    }) : (memref<4x8x16xf32>, memref<4x8x16xf32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<4x8x16xf32>) -> tensor<4x8x16xf32>, sym_name = "round_tensor"}> ({
  ^bb0(%arg0: tensor<4x8x16xf32>):
    %0 = "tensor.empty"() : () -> tensor<4x8x16xf32>
    %1 = "linalg.round"(%arg0, %0) <{operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg1: f32, %arg2: f32):
      %2 = "math.round"(%arg1) <{fastmath = #arith.fastmath<none>}> : (f32) -> f32
      "linalg.yield"(%2) : (f32) -> ()
    }) : (tensor<4x8x16xf32>, tensor<4x8x16xf32>) -> tensor<4x8x16xf32>
    "func.return"(%1) : (tensor<4x8x16xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (memref<?x?x?xf32>, memref<?x?x?xf32>) -> (), sym_name = "sqrt_dynamic"}> ({
  ^bb0(%arg0: memref<?x?x?xf32>, %arg1: memref<?x?x?xf32>):
    "linalg.sqrt"(%arg0, %arg1) <{operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg2: f32, %arg3: f32):
      %0 = "math.sqrt"(%arg2) <{fastmath = #arith.fastmath<none>}> : (f32) -> f32
      "linalg.yield"(%0) : (f32) -> ()
    }) : (memref<?x?x?xf32>, memref<?x?x?xf32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (memref<4x8x16xf32>, memref<4x8x16xf32>) -> (), sym_name = "sqrt_static"}> ({
  ^bb0(%arg0: memref<4x8x16xf32>, %arg1: memref<4x8x16xf32>):
    "linalg.sqrt"(%arg0, %arg1) <{operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg2: f32, %arg3: f32):
      %0 = "math.sqrt"(%arg2) <{fastmath = #arith.fastmath<none>}> : (f32) -> f32
      "linalg.yield"(%0) : (f32) -> ()
    }) : (memref<4x8x16xf32>, memref<4x8x16xf32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<4x8x16xf32>) -> tensor<4x8x16xf32>, sym_name = "sqrt_tensor"}> ({
  ^bb0(%arg0: tensor<4x8x16xf32>):
    %0 = "tensor.empty"() : () -> tensor<4x8x16xf32>
    %1 = "linalg.sqrt"(%arg0, %0) <{operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg1: f32, %arg2: f32):
      %2 = "math.sqrt"(%arg1) <{fastmath = #arith.fastmath<none>}> : (f32) -> f32
      "linalg.yield"(%2) : (f32) -> ()
    }) : (tensor<4x8x16xf32>, tensor<4x8x16xf32>) -> tensor<4x8x16xf32>
    "func.return"(%1) : (tensor<4x8x16xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (memref<?x?x?xf32>, memref<?x?x?xf32>) -> (), sym_name = "rsqrt_dynamic"}> ({
  ^bb0(%arg0: memref<?x?x?xf32>, %arg1: memref<?x?x?xf32>):
    "linalg.rsqrt"(%arg0, %arg1) <{operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg2: f32, %arg3: f32):
      %0 = "math.rsqrt"(%arg2) <{fastmath = #arith.fastmath<none>}> : (f32) -> f32
      "linalg.yield"(%0) : (f32) -> ()
    }) : (memref<?x?x?xf32>, memref<?x?x?xf32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (memref<4x8x16xf32>, memref<4x8x16xf32>) -> (), sym_name = "rsqrt_static"}> ({
  ^bb0(%arg0: memref<4x8x16xf32>, %arg1: memref<4x8x16xf32>):
    "linalg.rsqrt"(%arg0, %arg1) <{operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg2: f32, %arg3: f32):
      %0 = "math.rsqrt"(%arg2) <{fastmath = #arith.fastmath<none>}> : (f32) -> f32
      "linalg.yield"(%0) : (f32) -> ()
    }) : (memref<4x8x16xf32>, memref<4x8x16xf32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<4x8x16xf32>) -> tensor<4x8x16xf32>, sym_name = "rsqrt_tensor"}> ({
  ^bb0(%arg0: tensor<4x8x16xf32>):
    %0 = "tensor.empty"() : () -> tensor<4x8x16xf32>
    %1 = "linalg.rsqrt"(%arg0, %0) <{operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg1: f32, %arg2: f32):
      %2 = "math.rsqrt"(%arg1) <{fastmath = #arith.fastmath<none>}> : (f32) -> f32
      "linalg.yield"(%2) : (f32) -> ()
    }) : (tensor<4x8x16xf32>, tensor<4x8x16xf32>) -> tensor<4x8x16xf32>
    "func.return"(%1) : (tensor<4x8x16xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (memref<?x?x?xf32>, memref<?x?x?xf32>) -> (), sym_name = "square_dynamic"}> ({
  ^bb0(%arg0: memref<?x?x?xf32>, %arg1: memref<?x?x?xf32>):
    "linalg.square"(%arg0, %arg1) <{operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg2: f32, %arg3: f32):
      %0 = "arith.mulf"(%arg2, %arg2) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%0) : (f32) -> ()
    }) : (memref<?x?x?xf32>, memref<?x?x?xf32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (memref<4x8x16xf32>, memref<4x8x16xf32>) -> (), sym_name = "square_static"}> ({
  ^bb0(%arg0: memref<4x8x16xf32>, %arg1: memref<4x8x16xf32>):
    "linalg.square"(%arg0, %arg1) <{operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg2: f32, %arg3: f32):
      %0 = "arith.mulf"(%arg2, %arg2) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%0) : (f32) -> ()
    }) : (memref<4x8x16xf32>, memref<4x8x16xf32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<4x8x16xf32>) -> tensor<4x8x16xf32>, sym_name = "square_tensor"}> ({
  ^bb0(%arg0: tensor<4x8x16xf32>):
    %0 = "tensor.empty"() : () -> tensor<4x8x16xf32>
    %1 = "linalg.square"(%arg0, %0) <{operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg1: f32, %arg2: f32):
      %2 = "arith.mulf"(%arg1, %arg1) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%2) : (f32) -> ()
    }) : (tensor<4x8x16xf32>, tensor<4x8x16xf32>) -> tensor<4x8x16xf32>
    "func.return"(%1) : (tensor<4x8x16xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (memref<?x?x?xf32>, memref<?x?x?xf32>) -> (), sym_name = "tanh_dynamic"}> ({
  ^bb0(%arg0: memref<?x?x?xf32>, %arg1: memref<?x?x?xf32>):
    "linalg.tanh"(%arg0, %arg1) <{operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg2: f32, %arg3: f32):
      %0 = "math.tanh"(%arg2) <{fastmath = #arith.fastmath<none>}> : (f32) -> f32
      "linalg.yield"(%0) : (f32) -> ()
    }) : (memref<?x?x?xf32>, memref<?x?x?xf32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (memref<4x8x16xf32>, memref<4x8x16xf32>) -> (), sym_name = "tanh_static"}> ({
  ^bb0(%arg0: memref<4x8x16xf32>, %arg1: memref<4x8x16xf32>):
    "linalg.tanh"(%arg0, %arg1) <{operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg2: f32, %arg3: f32):
      %0 = "math.tanh"(%arg2) <{fastmath = #arith.fastmath<none>}> : (f32) -> f32
      "linalg.yield"(%0) : (f32) -> ()
    }) : (memref<4x8x16xf32>, memref<4x8x16xf32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<4x8x16xf32>) -> tensor<4x8x16xf32>, sym_name = "tanh_tensor"}> ({
  ^bb0(%arg0: tensor<4x8x16xf32>):
    %0 = "tensor.empty"() : () -> tensor<4x8x16xf32>
    %1 = "linalg.tanh"(%arg0, %0) <{operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg1: f32, %arg2: f32):
      %2 = "math.tanh"(%arg1) <{fastmath = #arith.fastmath<none>}> : (f32) -> f32
      "linalg.yield"(%2) : (f32) -> ()
    }) : (tensor<4x8x16xf32>, tensor<4x8x16xf32>) -> tensor<4x8x16xf32>
    "func.return"(%1) : (tensor<4x8x16xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (memref<?x?x?xf32>, memref<?x?x?xf32>) -> (), sym_name = "erf_dynamic"}> ({
  ^bb0(%arg0: memref<?x?x?xf32>, %arg1: memref<?x?x?xf32>):
    "linalg.erf"(%arg0, %arg1) <{operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg2: f32, %arg3: f32):
      %0 = "math.erf"(%arg2) <{fastmath = #arith.fastmath<none>}> : (f32) -> f32
      "linalg.yield"(%0) : (f32) -> ()
    }) : (memref<?x?x?xf32>, memref<?x?x?xf32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (memref<4x8x16xf32>, memref<4x8x16xf32>) -> (), sym_name = "erf_static"}> ({
  ^bb0(%arg0: memref<4x8x16xf32>, %arg1: memref<4x8x16xf32>):
    "linalg.erf"(%arg0, %arg1) <{operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg2: f32, %arg3: f32):
      %0 = "math.erf"(%arg2) <{fastmath = #arith.fastmath<none>}> : (f32) -> f32
      "linalg.yield"(%0) : (f32) -> ()
    }) : (memref<4x8x16xf32>, memref<4x8x16xf32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<4x8x16xf32>) -> tensor<4x8x16xf32>, sym_name = "erf_tensor"}> ({
  ^bb0(%arg0: tensor<4x8x16xf32>):
    %0 = "tensor.empty"() : () -> tensor<4x8x16xf32>
    %1 = "linalg.erf"(%arg0, %0) <{operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg1: f32, %arg2: f32):
      %2 = "math.erf"(%arg1) <{fastmath = #arith.fastmath<none>}> : (f32) -> f32
      "linalg.yield"(%2) : (f32) -> ()
    }) : (tensor<4x8x16xf32>, tensor<4x8x16xf32>) -> tensor<4x8x16xf32>
    "func.return"(%1) : (tensor<4x8x16xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (memref<?x?x?xf32>, memref<?x?x?xf32>, memref<?x?x?xf32>) -> (), sym_name = "max_dynamic"}> ({
  ^bb0(%arg0: memref<?x?x?xf32>, %arg1: memref<?x?x?xf32>, %arg2: memref<?x?x?xf32>):
    "linalg.max"(%arg0, %arg1, %arg2) <{operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg3: f32, %arg4: f32, %arg5: f32):
      %0 = "arith.maximumf"(%arg3, %arg4) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%0) : (f32) -> ()
    }) : (memref<?x?x?xf32>, memref<?x?x?xf32>, memref<?x?x?xf32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (memref<4x8x16xf32>, memref<4x8x16xf32>, memref<4x8x16xf32>) -> (), sym_name = "max_static"}> ({
  ^bb0(%arg0: memref<4x8x16xf32>, %arg1: memref<4x8x16xf32>, %arg2: memref<4x8x16xf32>):
    "linalg.max"(%arg0, %arg1, %arg2) <{operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg3: f32, %arg4: f32, %arg5: f32):
      %0 = "arith.maximumf"(%arg3, %arg4) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%0) : (f32) -> ()
    }) : (memref<4x8x16xf32>, memref<4x8x16xf32>, memref<4x8x16xf32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<4x8x16xf32>, tensor<4x8x16xf32>) -> tensor<4x8x16xf32>, sym_name = "max_tensor"}> ({
  ^bb0(%arg0: tensor<4x8x16xf32>, %arg1: tensor<4x8x16xf32>):
    %0 = "tensor.empty"() : () -> tensor<4x8x16xf32>
    %1 = "linalg.max"(%arg0, %arg1, %0) <{operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg2: f32, %arg3: f32, %arg4: f32):
      %2 = "arith.maximumf"(%arg2, %arg3) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%2) : (f32) -> ()
    }) : (tensor<4x8x16xf32>, tensor<4x8x16xf32>, tensor<4x8x16xf32>) -> tensor<4x8x16xf32>
    "func.return"(%1) : (tensor<4x8x16xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (memref<?x?x?xf32>, memref<?x?x?xf32>, memref<?x?x?xf32>) -> (), sym_name = "min_dynamic"}> ({
  ^bb0(%arg0: memref<?x?x?xf32>, %arg1: memref<?x?x?xf32>, %arg2: memref<?x?x?xf32>):
    "linalg.min"(%arg0, %arg1, %arg2) <{operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg3: f32, %arg4: f32, %arg5: f32):
      %0 = "arith.minimumf"(%arg3, %arg4) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%0) : (f32) -> ()
    }) : (memref<?x?x?xf32>, memref<?x?x?xf32>, memref<?x?x?xf32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (memref<4x8x16xf32>, memref<4x8x16xf32>, memref<4x8x16xf32>) -> (), sym_name = "min_static"}> ({
  ^bb0(%arg0: memref<4x8x16xf32>, %arg1: memref<4x8x16xf32>, %arg2: memref<4x8x16xf32>):
    "linalg.min"(%arg0, %arg1, %arg2) <{operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg3: f32, %arg4: f32, %arg5: f32):
      %0 = "arith.minimumf"(%arg3, %arg4) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%0) : (f32) -> ()
    }) : (memref<4x8x16xf32>, memref<4x8x16xf32>, memref<4x8x16xf32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<4x8x16xf32>, tensor<4x8x16xf32>) -> tensor<4x8x16xf32>, sym_name = "min_tensor"}> ({
  ^bb0(%arg0: tensor<4x8x16xf32>, %arg1: tensor<4x8x16xf32>):
    %0 = "tensor.empty"() : () -> tensor<4x8x16xf32>
    %1 = "linalg.min"(%arg0, %arg1, %0) <{operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg2: f32, %arg3: f32, %arg4: f32):
      %2 = "arith.minimumf"(%arg2, %arg3) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%2) : (f32) -> ()
    }) : (tensor<4x8x16xf32>, tensor<4x8x16xf32>, tensor<4x8x16xf32>) -> tensor<4x8x16xf32>
    "func.return"(%1) : (tensor<4x8x16xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (memref<?x?x?xf32>, memref<?x?x?xf32>, memref<?x?x?xf32>) -> (), sym_name = "powf_dynamic"}> ({
  ^bb0(%arg0: memref<?x?x?xf32>, %arg1: memref<?x?x?xf32>, %arg2: memref<?x?x?xf32>):
    "linalg.powf"(%arg0, %arg1, %arg2) <{operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg3: f32, %arg4: f32, %arg5: f32):
      %0 = "math.powf"(%arg3, %arg4) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%0) : (f32) -> ()
    }) : (memref<?x?x?xf32>, memref<?x?x?xf32>, memref<?x?x?xf32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (memref<4x8x16xf32>, memref<4x8x16xf32>, memref<4x8x16xf32>) -> (), sym_name = "powf_static"}> ({
  ^bb0(%arg0: memref<4x8x16xf32>, %arg1: memref<4x8x16xf32>, %arg2: memref<4x8x16xf32>):
    "linalg.powf"(%arg0, %arg1, %arg2) <{operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg3: f32, %arg4: f32, %arg5: f32):
      %0 = "math.powf"(%arg3, %arg4) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%0) : (f32) -> ()
    }) : (memref<4x8x16xf32>, memref<4x8x16xf32>, memref<4x8x16xf32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<4x8x16xf32>, tensor<4x8x16xf32>) -> tensor<4x8x16xf32>, sym_name = "powf_tensor"}> ({
  ^bb0(%arg0: tensor<4x8x16xf32>, %arg1: tensor<4x8x16xf32>):
    %0 = "tensor.empty"() : () -> tensor<4x8x16xf32>
    %1 = "linalg.powf"(%arg0, %arg1, %0) <{operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg2: f32, %arg3: f32, %arg4: f32):
      %2 = "math.powf"(%arg2, %arg3) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%2) : (f32) -> ()
    }) : (tensor<4x8x16xf32>, tensor<4x8x16xf32>, tensor<4x8x16xf32>) -> tensor<4x8x16xf32>
    "func.return"(%1) : (tensor<4x8x16xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (f32, vector<2x4xf32>) -> (tensor<f32>, tensor<vector<2x4xf32>>), sym_name = "fill_tensor"}> ({
  ^bb0(%arg0: f32, %arg1: vector<2x4xf32>):
    %0 = "tensor.empty"() : () -> tensor<f32>
    %1 = "linalg.fill"(%arg0, %0) <{operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg4: f32, %arg5: f32):
      "linalg.yield"(%arg4) : (f32) -> ()
    }) : (f32, tensor<f32>) -> tensor<f32>
    %2 = "tensor.empty"() : () -> tensor<vector<2x4xf32>>
    %3 = "linalg.fill"(%arg1, %2) <{operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg2: vector<2x4xf32>, %arg3: vector<2x4xf32>):
      "linalg.yield"(%arg2) : (vector<2x4xf32>) -> ()
    }) : (vector<2x4xf32>, tensor<vector<2x4xf32>>) -> tensor<vector<2x4xf32>>
    "func.return"(%1, %3) : (tensor<f32>, tensor<vector<2x4xf32>>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (memref<?x?x?xi1>, memref<?x?x?xf32>, memref<?x?x?xf32>, memref<?x?x?xf32>) -> (), sym_name = "select_dynamic"}> ({
  ^bb0(%arg0: memref<?x?x?xi1>, %arg1: memref<?x?x?xf32>, %arg2: memref<?x?x?xf32>, %arg3: memref<?x?x?xf32>):
    "linalg.select"(%arg0, %arg1, %arg2, %arg3) <{operandSegmentSizes = array<i32: 3, 1>}> ({
    ^bb0(%arg4: i1, %arg5: f32, %arg6: f32, %arg7: f32):
      %0 = "arith.select"(%arg4, %arg5, %arg6) : (i1, f32, f32) -> f32
      "linalg.yield"(%0) : (f32) -> ()
    }) : (memref<?x?x?xi1>, memref<?x?x?xf32>, memref<?x?x?xf32>, memref<?x?x?xf32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (memref<4x8x16xi1>, memref<4x8x16xf32>, memref<4x8x16xf32>, memref<4x8x16xf32>) -> (), sym_name = "select_static"}> ({
  ^bb0(%arg0: memref<4x8x16xi1>, %arg1: memref<4x8x16xf32>, %arg2: memref<4x8x16xf32>, %arg3: memref<4x8x16xf32>):
    "linalg.select"(%arg0, %arg1, %arg2, %arg3) <{operandSegmentSizes = array<i32: 3, 1>}> ({
    ^bb0(%arg4: i1, %arg5: f32, %arg6: f32, %arg7: f32):
      %0 = "arith.select"(%arg4, %arg5, %arg6) : (i1, f32, f32) -> f32
      "linalg.yield"(%0) : (f32) -> ()
    }) : (memref<4x8x16xi1>, memref<4x8x16xf32>, memref<4x8x16xf32>, memref<4x8x16xf32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<4x8x16xi1>, tensor<4x8x16xf32>, tensor<4x8x16xf32>) -> tensor<4x8x16xf32>, sym_name = "select_tensor"}> ({
  ^bb0(%arg0: tensor<4x8x16xi1>, %arg1: tensor<4x8x16xf32>, %arg2: tensor<4x8x16xf32>):
    %0 = "tensor.empty"() : () -> tensor<4x8x16xf32>
    %1 = "linalg.select"(%arg0, %arg1, %arg2, %0) <{operandSegmentSizes = array<i32: 3, 1>}> ({
    ^bb0(%arg3: i1, %arg4: f32, %arg5: f32, %arg6: f32):
      %2 = "arith.select"(%arg3, %arg4, %arg5) : (i1, f32, f32) -> f32
      "linalg.yield"(%2) : (f32) -> ()
    }) : (tensor<4x8x16xi1>, tensor<4x8x16xf32>, tensor<4x8x16xf32>, tensor<4x8x16xf32>) -> tensor<4x8x16xf32>
    "func.return"(%1) : (tensor<4x8x16xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<4x8x16xi1>, tensor<4x8x16xi32>, tensor<4x8x16xi32>) -> tensor<4x8x16xi32>, sym_name = "select_integer_values"}> ({
  ^bb0(%arg2: tensor<4x8x16xi1>, %arg3: tensor<4x8x16xi32>, %arg4: tensor<4x8x16xi32>):
    %3 = "tensor.empty"() : () -> tensor<4x8x16xi32>
    %4 = "linalg.select"(%arg2, %arg3, %arg4, %3) <{operandSegmentSizes = array<i32: 3, 1>}> ({
    ^bb0(%arg5: i1, %arg6: i32, %arg7: i32, %arg8: i32):
      %5 = "arith.select"(%arg5, %arg6, %arg7) : (i1, i32, i32) -> i32
      "linalg.yield"(%5) : (i32) -> ()
    }) : (tensor<4x8x16xi1>, tensor<4x8x16xi32>, tensor<4x8x16xi32>, tensor<4x8x16xi32>) -> tensor<4x8x16xi32>
    "func.return"(%4) : (tensor<4x8x16xi32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<128x256xf32>, tensor<4x16x32x16xf32>) -> tensor<128x256xf32>, sym_name = "pack_nc_to_ncnc"}> ({
  ^bb0(%arg0: tensor<128x256xf32>, %arg1: tensor<4x16x32x16xf32>):
    %0 = "linalg.pack"(%arg0, %arg1) <{inner_dims_pos = array<i64: 0, 1>, operandSegmentSizes = array<i32: 1, 1, 0, 0>, static_inner_tiles = array<i64: 32, 16>}> : (tensor<128x256xf32>, tensor<4x16x32x16xf32>) -> tensor<4x16x32x16xf32>
    %1 = "tensor.empty"() : () -> tensor<128x256xf32>
    %2 = "linalg.unpack"(%0, %1) <{inner_dims_pos = array<i64: 0, 1>, static_inner_tiles = array<i64: 32, 16>}> {operandSegmentSizes = array<i32: 1, 1, 0, 0>} : (tensor<4x16x32x16xf32>, tensor<128x256xf32>) -> tensor<128x256xf32>
    "func.return"(%2) : (tensor<128x256xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<13x15xf32>, tensor<2x8x8x2xf32>, f32) -> tensor<13x15xf32>, sym_name = "pack_nc_to_ncnc_with_padding"}> ({
  ^bb0(%arg0: tensor<13x15xf32>, %arg1: tensor<2x8x8x2xf32>, %arg2: f32):
    %0 = "linalg.pack"(%arg0, %arg1, %arg2) <{inner_dims_pos = array<i64: 0, 1>, operandSegmentSizes = array<i32: 1, 1, 1, 0>, static_inner_tiles = array<i64: 8, 2>}> : (tensor<13x15xf32>, tensor<2x8x8x2xf32>, f32) -> tensor<2x8x8x2xf32>
    %1 = "tensor.empty"() : () -> tensor<13x15xf32>
    %2 = "linalg.unpack"(%0, %1) <{inner_dims_pos = array<i64: 0, 1>, static_inner_tiles = array<i64: 8, 2>}> {operandSegmentSizes = array<i32: 1, 1, 0, 0>} : (tensor<2x8x8x2xf32>, tensor<13x15xf32>) -> tensor<13x15xf32>
    "func.return"(%2) : (tensor<13x15xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<128x256xf32>, tensor<16x4x32x16xf32>) -> tensor<128x256xf32>, sym_name = "pack_ck_to_kcck"}> ({
  ^bb0(%arg0: tensor<128x256xf32>, %arg1: tensor<16x4x32x16xf32>):
    %0 = "linalg.pack"(%arg0, %arg1) <{inner_dims_pos = array<i64: 0, 1>, operandSegmentSizes = array<i32: 1, 1, 0, 0>, outer_dims_perm = array<i64: 1, 0>, static_inner_tiles = array<i64: 32, 16>}> : (tensor<128x256xf32>, tensor<16x4x32x16xf32>) -> tensor<16x4x32x16xf32>
    %1 = "tensor.empty"() : () -> tensor<128x256xf32>
    %2 = "linalg.unpack"(%0, %1) <{inner_dims_pos = array<i64: 0, 1>, outer_dims_perm = array<i64: 1, 0>, static_inner_tiles = array<i64: 32, 16>}> {operandSegmentSizes = array<i32: 1, 1, 0, 0>} : (tensor<16x4x32x16xf32>, tensor<128x256xf32>) -> tensor<128x256xf32>
    "func.return"(%2) : (tensor<128x256xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<?x?xf32>, tensor<?x?x?x?xf32>, f32, index, index) -> tensor<?x?x?x?xf32>, sym_name = "pad_and_pack_fully_dynamic"}> ({
  ^bb0(%arg0: tensor<?x?xf32>, %arg1: tensor<?x?x?x?xf32>, %arg2: f32, %arg3: index, %arg4: index):
    %0 = "linalg.pack"(%arg0, %arg1, %arg2, %arg3, %arg4) <{inner_dims_pos = array<i64: 0, 1>, operandSegmentSizes = array<i32: 1, 1, 1, 2>, static_inner_tiles = array<i64: -9223372036854775808, -9223372036854775808>}> : (tensor<?x?xf32>, tensor<?x?x?x?xf32>, f32, index, index) -> tensor<?x?x?x?xf32>
    "func.return"(%0) : (tensor<?x?x?x?xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<?x?xf32>, tensor<?x?x8x2xf32>, f32) -> tensor<?x?x8x2xf32>, sym_name = "pad_and_pack_partially_dynamic"}> ({
  ^bb0(%arg0: tensor<?x?xf32>, %arg1: tensor<?x?x8x2xf32>, %arg2: f32):
    %0 = "linalg.pack"(%arg0, %arg1, %arg2) <{inner_dims_pos = array<i64: 0, 1>, operandSegmentSizes = array<i32: 1, 1, 1, 0>, static_inner_tiles = array<i64: 8, 2>}> : (tensor<?x?xf32>, tensor<?x?x8x2xf32>, f32) -> tensor<?x?x8x2xf32>
    "func.return"(%0) : (tensor<?x?x8x2xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<1x5x7xf32>, tensor<1x3x2x4x2xf32>, f32) -> tensor<1x3x2x4x2xf32>, sym_name = "pack_transposed_inner_dims_with_padding"}> ({
  ^bb0(%arg0: tensor<1x5x7xf32>, %arg1: tensor<1x3x2x4x2xf32>, %arg2: f32):
    %0 = "linalg.pack"(%arg0, %arg1, %arg2) <{inner_dims_pos = array<i64: 2, 1>, operandSegmentSizes = array<i32: 1, 1, 1, 0>, static_inner_tiles = array<i64: 4, 2>}> : (tensor<1x5x7xf32>, tensor<1x3x2x4x2xf32>, f32) -> tensor<1x3x2x4x2xf32>
    "func.return"(%0) : (tensor<1x3x2x4x2xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<1x3x2x4x2xf32>, tensor<1x5x7xf32>) -> tensor<1x5x7xf32>, sym_name = "unpack_descending_inner_dims_with_padding"}> ({
  ^bb0(%arg0: tensor<1x3x2x4x2xf32>, %arg1: tensor<1x5x7xf32>):
    %0 = "linalg.unpack"(%arg0, %arg1) <{inner_dims_pos = array<i64: 2, 1>, static_inner_tiles = array<i64: 4, 2>}> {operandSegmentSizes = array<i32: 1, 1, 0, 0>} : (tensor<1x3x2x4x2xf32>, tensor<1x5x7xf32>) -> tensor<1x5x7xf32>
    "func.return"(%0) : (tensor<1x5x7xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<20x1x12xf32>, tensor<10x1x3x4x2xf32>) -> tensor<10x1x3x4x2xf32>, sym_name = "pack_non_adjacent_inner_dims"}> ({
  ^bb0(%arg0: tensor<20x1x12xf32>, %arg1: tensor<10x1x3x4x2xf32>):
    %0 = "linalg.pack"(%arg0, %arg1) <{inner_dims_pos = array<i64: 2, 0>, operandSegmentSizes = array<i32: 1, 1, 0, 0>, static_inner_tiles = array<i64: 4, 2>}> : (tensor<20x1x12xf32>, tensor<10x1x3x4x2xf32>) -> tensor<10x1x3x4x2xf32>
    "func.return"(%0) : (tensor<10x1x3x4x2xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<10x1x3x4x2xf32>, tensor<20x1x12xf32>) -> tensor<20x1x12xf32>, sym_name = "unpack_non_adjacent_inner_dims"}> ({
  ^bb0(%arg0: tensor<10x1x3x4x2xf32>, %arg1: tensor<20x1x12xf32>):
    %0 = "linalg.unpack"(%arg0, %arg1) <{inner_dims_pos = array<i64: 2, 0>, static_inner_tiles = array<i64: 4, 2>}> {operandSegmentSizes = array<i32: 1, 1, 0, 0>} : (tensor<10x1x3x4x2xf32>, tensor<20x1x12xf32>) -> tensor<20x1x12xf32>
    "func.return"(%0) : (tensor<20x1x12xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<3x5x7xf32>, tensor<3x7x5xf32>) -> tensor<3x7x5xf32>, sym_name = "pack_implementing_transpose"}> ({
  ^bb0(%arg0: tensor<3x5x7xf32>, %arg1: tensor<3x7x5xf32>):
    %0 = "linalg.pack"(%arg0, %arg1) <{inner_dims_pos = array<i64>, operandSegmentSizes = array<i32: 1, 1, 0, 0>, outer_dims_perm = array<i64: 0, 2, 1>, static_inner_tiles = array<i64>}> : (tensor<3x5x7xf32>, tensor<3x7x5xf32>) -> tensor<3x7x5xf32>
    "func.return"(%0) : (tensor<3x7x5xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<3x7x5xf32>, tensor<3x5x7xf32>) -> tensor<3x5x7xf32>, sym_name = "unpack_implementing_transpose"}> ({
  ^bb0(%arg0: tensor<3x7x5xf32>, %arg1: tensor<3x5x7xf32>):
    %0 = "linalg.unpack"(%arg0, %arg1) <{inner_dims_pos = array<i64>, outer_dims_perm = array<i64: 0, 2, 1>, static_inner_tiles = array<i64>}> {operandSegmentSizes = array<i32: 1, 1, 0, 0>} : (tensor<3x7x5xf32>, tensor<3x5x7xf32>) -> tensor<3x5x7xf32>
    "func.return"(%0) : (tensor<3x5x7xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<?x?x?x?xf32>, tensor<?x?xf32>, index, index) -> tensor<?x?xf32>, sym_name = "unpack_fully_dynamic"}> ({
  ^bb0(%arg0: tensor<?x?x?x?xf32>, %arg1: tensor<?x?xf32>, %arg2: index, %arg3: index):
    %0 = "linalg.unpack"(%arg0, %arg1, %arg2, %arg3) <{inner_dims_pos = array<i64: 0, 1>, static_inner_tiles = array<i64: -9223372036854775808, -9223372036854775808>}> {operandSegmentSizes = array<i32: 1, 1, 0, 2>} : (tensor<?x?x?x?xf32>, tensor<?x?xf32>, index, index) -> tensor<?x?xf32>
    "func.return"(%0) : (tensor<?x?xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<?x?x8x2xf32>, tensor<?x?xf32>) -> tensor<?x?xf32>, sym_name = "unpack_partially_dynamic"}> ({
  ^bb0(%arg0: tensor<?x?x8x2xf32>, %arg1: tensor<?x?xf32>):
    %0 = "linalg.unpack"(%arg0, %arg1) <{inner_dims_pos = array<i64: 0, 1>, static_inner_tiles = array<i64: 8, 2>}> {operandSegmentSizes = array<i32: 1, 1, 0, 0>} : (tensor<?x?x8x2xf32>, tensor<?x?xf32>) -> tensor<?x?xf32>
    "func.return"(%0) : (tensor<?x?xf32>) -> ()
  }) : () -> ()
}) : () -> ()

