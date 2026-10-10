#map = affine_map<(d0, d1, d2, d3, d4, d5, d6) -> (d0, d1 + d4, d2 + d5, d6)>
#map1 = affine_map<(d0, d1, d2, d3, d4, d5, d6) -> (d4, d5, d6, d3)>
#map2 = affine_map<(d0, d1, d2, d3, d4, d5, d6) -> (d0, d1, d2, d3)>
#map3 = affine_map<(d0, d1, d2, d3, d4, d5, d6) -> (d0, d4, d2 + d5, d3 + d6)>
#map4 = affine_map<(d0, d1, d2, d3, d4, d5, d6) -> (d1, d4, d5, d6)>
#map5 = affine_map<(d0, d1, d2, d3, d4, d5) -> (d0, d1 * 2 + d4, d2 * 2 + d5, d3)>
#map6 = affine_map<(d0, d1, d2, d3, d4, d5) -> (d4, d5, d3)>
#map7 = affine_map<(d0, d1, d2, d3, d4, d5) -> (d0, d1, d2, d3)>
#map8 = affine_map<(d0, d1, d2, d3) -> (d0 + d2, d1 + d3)>
#map9 = affine_map<(d0, d1, d2, d3) -> (d2, d3)>
#map10 = affine_map<(d0, d1, d2, d3) -> (d0, d1)>
#map11 = affine_map<(d0, d1, d2, d3, d4, d5) -> (d0, d1 + d4, d2 + d5, d3)>
#map12 = affine_map<(d0, d1, d2, d3, d4, d5) -> (d4, d5)>
#map13 = affine_map<(d0, d1, d2, d3, d4, d5) -> (d0, d1, d2 + d4, d3 + d5)>
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<?x1x?x?xf32>, tensor<1x?x?x?xf32>, tensor<?x1x?x?xf32>) -> tensor<?x1x?x?xf32>, sym_name = "conv_2d_nhwc_hwcf"}> ({
  ^bb0(%arg62: tensor<?x1x?x?xf32>, %arg63: tensor<1x?x?x?xf32>, %arg64: tensor<?x1x?x?xf32>):
    %29 = "linalg.conv_2d_nhwc_hwcf"(%arg62, %arg63, %arg64) <{dilations = dense<1> : tensor<2xi64>, operandSegmentSizes = array<i32: 2, 1>, strides = dense<1> : tensor<2xi64>}> ({
    ^bb0(%arg65: f32, %arg66: f32, %arg67: f32):
      %30 = "arith.mulf"(%arg65, %arg66) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      %31 = "arith.addf"(%arg67, %30) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%31) : (f32) -> ()
    }) {linalg.memoized_indexing_maps = [#map, #map1, #map2]} : (tensor<?x1x?x?xf32>, tensor<1x?x?x?xf32>, tensor<?x1x?x?xf32>) -> tensor<?x1x?x?xf32>
    "func.return"(%29) : (tensor<?x1x?x?xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<?x?x1x?xf32>, tensor<?x?x1x?xf32>, tensor<?x?x1x?xf32>) -> tensor<?x?x1x?xf32>, sym_name = "conv_2d_nchw_fchw"}> ({
  ^bb0(%arg56: tensor<?x?x1x?xf32>, %arg57: tensor<?x?x1x?xf32>, %arg58: tensor<?x?x1x?xf32>):
    %26 = "linalg.conv_2d_nchw_fchw"(%arg56, %arg57, %arg58) <{dilations = dense<1> : tensor<2xi64>, operandSegmentSizes = array<i32: 2, 1>, strides = dense<1> : tensor<2xi64>}> ({
    ^bb0(%arg59: f32, %arg60: f32, %arg61: f32):
      %27 = "arith.mulf"(%arg59, %arg60) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      %28 = "arith.addf"(%arg61, %27) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%28) : (f32) -> ()
    }) {linalg.memoized_indexing_maps = [#map3, #map4, #map2]} : (tensor<?x?x1x?xf32>, tensor<?x?x1x?xf32>, tensor<?x?x1x?xf32>) -> tensor<?x?x1x?xf32>
    "func.return"(%26) : (tensor<?x?x1x?xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<1x1x113x96xf32>, tensor<1x3x96xf32>) -> tensor<1x1x56x96xf32>, sym_name = "depthwise_conv_2d_nhwc_hwc"}> ({
  ^bb0(%arg51: tensor<1x1x113x96xf32>, %arg52: tensor<1x3x96xf32>):
    %22 = "tensor.empty"() : () -> tensor<1x1x56x96xf32>
    %23 = "linalg.depthwise_conv_2d_nhwc_hwc"(%arg51, %arg52, %22) <{dilations = dense<1> : vector<2xi64>, operandSegmentSizes = array<i32: 2, 1>, strides = dense<2> : vector<2xi64>}> ({
    ^bb0(%arg53: f32, %arg54: f32, %arg55: f32):
      %24 = "arith.mulf"(%arg53, %arg54) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      %25 = "arith.addf"(%arg55, %24) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%25) : (f32) -> ()
    }) {linalg.memoized_indexing_maps = [#map5, #map6, #map7]} : (tensor<1x1x113x96xf32>, tensor<1x3x96xf32>, tensor<1x1x56x96xf32>) -> tensor<1x1x56x96xf32>
    "func.return"(%23) : (tensor<1x1x56x96xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<1x?xf32>, tensor<1x?xf32>, tensor<1x?xf32>) -> tensor<1x?xf32>, sym_name = "conv_2d"}> ({
  ^bb0(%arg45: tensor<1x?xf32>, %arg46: tensor<1x?xf32>, %arg47: tensor<1x?xf32>):
    %19 = "linalg.conv_2d"(%arg45, %arg46, %arg47) <{operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg48: f32, %arg49: f32, %arg50: f32):
      %20 = "arith.mulf"(%arg48, %arg49) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      %21 = "arith.addf"(%arg50, %20) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%21) : (f32) -> ()
    }) {linalg.memoized_indexing_maps = [#map8, #map9, #map10]} : (tensor<1x?xf32>, tensor<1x?xf32>, tensor<1x?xf32>) -> tensor<1x?xf32>
    "func.return"(%19) : (tensor<1x?xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<?x1x?x?xf32>, tensor<1x?xf32>, tensor<?x1x?x?xf32>) -> tensor<?x1x?x?xf32>, sym_name = "pooling_nhwc_sum"}> ({
  ^bb0(%arg39: tensor<?x1x?x?xf32>, %arg40: tensor<1x?xf32>, %arg41: tensor<?x1x?x?xf32>):
    %17 = "linalg.pooling_nhwc_sum"(%arg39, %arg40, %arg41) <{dilations = dense<1> : tensor<2xi64>, operandSegmentSizes = array<i32: 2, 1>, strides = dense<1> : tensor<2xi64>}> ({
    ^bb0(%arg42: f32, %arg43: f32, %arg44: f32):
      %18 = "arith.addf"(%arg44, %arg42) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%18) : (f32) -> ()
    }) {linalg.memoized_indexing_maps = [#map11, #map12, #map7]} : (tensor<?x1x?x?xf32>, tensor<1x?xf32>, tensor<?x1x?x?xf32>) -> tensor<?x1x?x?xf32>
    "func.return"(%17) : (tensor<?x1x?x?xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<?x?x1x?xf32>, tensor<1x?xf32>, tensor<?x?x1x?xf32>) -> tensor<?x?x1x?xf32>, sym_name = "pooling_nchw_sum"}> ({
  ^bb0(%arg33: tensor<?x?x1x?xf32>, %arg34: tensor<1x?xf32>, %arg35: tensor<?x?x1x?xf32>):
    %15 = "linalg.pooling_nchw_sum"(%arg33, %arg34, %arg35) <{dilations = dense<1> : tensor<2xi64>, operandSegmentSizes = array<i32: 2, 1>, strides = dense<1> : tensor<2xi64>}> ({
    ^bb0(%arg36: f32, %arg37: f32, %arg38: f32):
      %16 = "arith.addf"(%arg38, %arg36) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%16) : (f32) -> ()
    }) {linalg.memoized_indexing_maps = [#map13, #map12, #map7]} : (tensor<?x?x1x?xf32>, tensor<1x?xf32>, tensor<?x?x1x?xf32>) -> tensor<?x?x1x?xf32>
    "func.return"(%15) : (tensor<?x?x1x?xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<?x1x?x?xf32>, tensor<1x?xf32>, tensor<?x1x?x?xf32>) -> tensor<?x1x?x?xf32>, sym_name = "pooling_nhwc_max"}> ({
  ^bb0(%arg27: tensor<?x1x?x?xf32>, %arg28: tensor<1x?xf32>, %arg29: tensor<?x1x?x?xf32>):
    %13 = "linalg.pooling_nhwc_max"(%arg27, %arg28, %arg29) <{dilations = dense<1> : tensor<2xi64>, operandSegmentSizes = array<i32: 2, 1>, strides = dense<1> : tensor<2xi64>}> ({
    ^bb0(%arg30: f32, %arg31: f32, %arg32: f32):
      %14 = "arith.maximumf"(%arg32, %arg30) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%14) : (f32) -> ()
    }) {linalg.memoized_indexing_maps = [#map11, #map12, #map7]} : (tensor<?x1x?x?xf32>, tensor<1x?xf32>, tensor<?x1x?x?xf32>) -> tensor<?x1x?x?xf32>
    "func.return"(%13) : (tensor<?x1x?x?xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<?x1x?x?xi32>, tensor<1x?xi32>, tensor<?x1x?x?xi32>) -> tensor<?x1x?x?xi32>, sym_name = "pooling_nhwc_max_unsigned"}> ({
  ^bb0(%arg21: tensor<?x1x?x?xi32>, %arg22: tensor<1x?xi32>, %arg23: tensor<?x1x?x?xi32>):
    %11 = "linalg.pooling_nhwc_max_unsigned"(%arg21, %arg22, %arg23) <{dilations = dense<1> : tensor<2xi64>, operandSegmentSizes = array<i32: 2, 1>, strides = dense<1> : tensor<2xi64>}> ({
    ^bb0(%arg24: i32, %arg25: i32, %arg26: i32):
      %12 = "arith.maxui"(%arg26, %arg24) : (i32, i32) -> i32
      "linalg.yield"(%12) : (i32) -> ()
    }) {linalg.memoized_indexing_maps = [#map11, #map12, #map7]} : (tensor<?x1x?x?xi32>, tensor<1x?xi32>, tensor<?x1x?x?xi32>) -> tensor<?x1x?x?xi32>
    "func.return"(%11) : (tensor<?x1x?x?xi32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<?x1x?x?xf32>, tensor<1x?xf32>, tensor<?x1x?x?xf32>) -> tensor<?x1x?x?xf32>, sym_name = "pooling_nhwc_min"}> ({
  ^bb0(%arg15: tensor<?x1x?x?xf32>, %arg16: tensor<1x?xf32>, %arg17: tensor<?x1x?x?xf32>):
    %9 = "linalg.pooling_nhwc_min"(%arg15, %arg16, %arg17) <{dilations = dense<1> : tensor<2xi64>, operandSegmentSizes = array<i32: 2, 1>, strides = dense<1> : tensor<2xi64>}> ({
    ^bb0(%arg18: f32, %arg19: f32, %arg20: f32):
      %10 = "arith.minimumf"(%arg20, %arg18) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%10) : (f32) -> ()
    }) {linalg.memoized_indexing_maps = [#map11, #map12, #map7]} : (tensor<?x1x?x?xf32>, tensor<1x?xf32>, tensor<?x1x?x?xf32>) -> tensor<?x1x?x?xf32>
    "func.return"(%9) : (tensor<?x1x?x?xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<?x1x?x?xi32>, tensor<1x?xi32>, tensor<?x1x?x?xi32>) -> tensor<?x1x?x?xi32>, sym_name = "pooling_nhwc_min_unsigned"}> ({
  ^bb0(%arg9: tensor<?x1x?x?xi32>, %arg10: tensor<1x?xi32>, %arg11: tensor<?x1x?x?xi32>):
    %7 = "linalg.pooling_nhwc_min_unsigned"(%arg9, %arg10, %arg11) <{dilations = dense<1> : tensor<2xi64>, operandSegmentSizes = array<i32: 2, 1>, strides = dense<1> : tensor<2xi64>}> ({
    ^bb0(%arg12: i32, %arg13: i32, %arg14: i32):
      %8 = "arith.minui"(%arg14, %arg12) : (i32, i32) -> i32
      "linalg.yield"(%8) : (i32) -> ()
    }) {linalg.memoized_indexing_maps = [#map11, #map12, #map7]} : (tensor<?x1x?x?xi32>, tensor<1x?xi32>, tensor<?x1x?x?xi32>) -> tensor<?x1x?x?xi32>
    "func.return"(%7) : (tensor<?x1x?x?xi32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<?x?x1x?xf32>, tensor<1x?xf32>, tensor<?x?x1x?xf32>) -> tensor<?x?x1x?xf32>, sym_name = "pooling_nchw_max"}> ({
  ^bb0(%arg3: tensor<?x?x1x?xf32>, %arg4: tensor<1x?xf32>, %arg5: tensor<?x?x1x?xf32>):
    %5 = "linalg.pooling_nchw_max"(%arg3, %arg4, %arg5) <{dilations = dense<1> : tensor<2xi64>, operandSegmentSizes = array<i32: 2, 1>, strides = dense<1> : tensor<2xi64>}> ({
    ^bb0(%arg6: f32, %arg7: f32, %arg8: f32):
      %6 = "arith.maximumf"(%arg8, %arg6) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%6) : (f32) -> ()
    }) {linalg.memoized_indexing_maps = [#map13, #map12, #map7]} : (tensor<?x?x1x?xf32>, tensor<1x?xf32>, tensor<?x?x1x?xf32>) -> tensor<?x?x1x?xf32>
    "func.return"(%5) : (tensor<?x?x1x?xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<2x16x32xf32>, tensor<2x16x32xf32>) -> tensor<2x16x32xf32>, sym_name = "softmax"}> ({
  ^bb0(%arg1: tensor<2x16x32xf32>, %arg2: tensor<2x16x32xf32>):
    %4 = "linalg.softmax"(%arg1, %arg2) <{dimension = 2 : i64}> : (tensor<2x16x32xf32>, tensor<2x16x32xf32>) -> tensor<2x16x32xf32>
    "func.return"(%4) : (tensor<2x16x32xf32>) -> ()
  }) : () -> ()
  "builtin.module"() ({
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg0: !transform.any_op):
      %0 = "transform.structured.match"(%arg0) <{interface = 0 : i32}> : (!transform.any_op) -> !transform.any_op
      %1 = "transform.structured.decompose"(%0) : (!transform.any_op) -> !transform.any_op
      %2 = "transform.structured.match"(%arg0) <{ops = ["linalg.softmax"]}> : (!transform.any_op) -> !transform.any_op
      %3 = "transform.structured.decompose_interface"(%2) : (!transform.any_op) -> !transform.any_op
      "transform.yield"() : () -> ()
    }) : () -> ()
  }) {transform.with_named_sequence} : () -> ()
}) : () -> ()

