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
#map14 = affine_map<(d0, d1, d2, d3, d4, d5) -> (d0 + d3, d1 + d4, d5)>
#map15 = affine_map<(d0, d1, d2, d3, d4, d5) -> (d3, d4, d5, d2)>
#map16 = affine_map<(d0, d1, d2, d3, d4, d5) -> (d0, d1, d2)>
#map17 = affine_map<(d0, d1, d2, d3, d4) -> (d0 + d3, d1 + d4, d2)>
#map18 = affine_map<(d0, d1, d2, d3, d4) -> (d3, d4, d2)>
#map19 = affine_map<(d0, d1, d2, d3, d4) -> (d0, d1, d2)>
#map20 = affine_map<(d0, d1, d2, d3, d4) -> (d0, d1 + d3, d2 + d4)>
#map21 = affine_map<(d0, d1, d2, d3, d4) -> (d3, d4)>
#map22 = affine_map<(d0, d1, d2, d3) -> (d0 + d3, d1 + d2)>
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<?x1x?x?xf32>, tensor<1x?x?x?xf32>, tensor<?x1x?x?xf32>) -> tensor<?x1x?x?xf32>, sym_name = "conv_2d_nhwc_hwcf"}> ({
  ^bb0(%arg91: tensor<?x1x?x?xf32>, %arg92: tensor<1x?x?x?xf32>, %arg93: tensor<?x1x?x?xf32>):
    %44 = "linalg.conv_2d_nhwc_hwcf"(%arg91, %arg92, %arg93) <{dilations = dense<1> : tensor<2xi64>, operandSegmentSizes = array<i32: 2, 1>, strides = dense<1> : tensor<2xi64>}> ({
    ^bb0(%arg94: f32, %arg95: f32, %arg96: f32):
      %45 = "arith.mulf"(%arg94, %arg95) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      %46 = "arith.addf"(%arg96, %45) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%46) : (f32) -> ()
    }) {linalg.memoized_indexing_maps = [#map, #map1, #map2]} : (tensor<?x1x?x?xf32>, tensor<1x?x?x?xf32>, tensor<?x1x?x?xf32>) -> tensor<?x1x?x?xf32>
    "func.return"(%44) : (tensor<?x1x?x?xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<?x?x1x?xf32>, tensor<?x?x1x?xf32>, tensor<?x?x1x?xf32>) -> tensor<?x?x1x?xf32>, sym_name = "conv_2d_nchw_fchw"}> ({
  ^bb0(%arg85: tensor<?x?x1x?xf32>, %arg86: tensor<?x?x1x?xf32>, %arg87: tensor<?x?x1x?xf32>):
    %41 = "linalg.conv_2d_nchw_fchw"(%arg85, %arg86, %arg87) <{dilations = dense<1> : tensor<2xi64>, operandSegmentSizes = array<i32: 2, 1>, strides = dense<1> : tensor<2xi64>}> ({
    ^bb0(%arg88: f32, %arg89: f32, %arg90: f32):
      %42 = "arith.mulf"(%arg88, %arg89) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      %43 = "arith.addf"(%arg90, %42) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%43) : (f32) -> ()
    }) {linalg.memoized_indexing_maps = [#map3, #map4, #map2]} : (tensor<?x?x1x?xf32>, tensor<?x?x1x?xf32>, tensor<?x?x1x?xf32>) -> tensor<?x?x1x?xf32>
    "func.return"(%41) : (tensor<?x?x1x?xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<1x1x113x96xf32>, tensor<1x3x96xf32>) -> tensor<1x1x56x96xf32>, sym_name = "depthwise_conv_2d_nhwc_hwc_height"}> ({
  ^bb0(%arg80: tensor<1x1x113x96xf32>, %arg81: tensor<1x3x96xf32>):
    %37 = "tensor.empty"() : () -> tensor<1x1x56x96xf32>
    %38 = "linalg.depthwise_conv_2d_nhwc_hwc"(%arg80, %arg81, %37) <{dilations = dense<1> : vector<2xi64>, operandSegmentSizes = array<i32: 2, 1>, strides = dense<2> : vector<2xi64>}> ({
    ^bb0(%arg82: f32, %arg83: f32, %arg84: f32):
      %39 = "arith.mulf"(%arg82, %arg83) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      %40 = "arith.addf"(%arg84, %39) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%40) : (f32) -> ()
    }) {linalg.memoized_indexing_maps = [#map5, #map6, #map7]} : (tensor<1x1x113x96xf32>, tensor<1x3x96xf32>, tensor<1x1x56x96xf32>) -> tensor<1x1x56x96xf32>
    "func.return"(%38) : (tensor<1x1x56x96xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<1x113x1x96xf32>, tensor<3x1x96xf32>) -> tensor<1x56x1x96xf32>, sym_name = "depthwise_conv_2d_nhwc_hwc_width"}> ({
  ^bb0(%arg75: tensor<1x113x1x96xf32>, %arg76: tensor<3x1x96xf32>):
    %33 = "tensor.empty"() : () -> tensor<1x56x1x96xf32>
    %34 = "linalg.depthwise_conv_2d_nhwc_hwc"(%arg75, %arg76, %33) <{dilations = dense<1> : vector<2xi64>, operandSegmentSizes = array<i32: 2, 1>, strides = dense<2> : vector<2xi64>}> ({
    ^bb0(%arg77: f32, %arg78: f32, %arg79: f32):
      %35 = "arith.mulf"(%arg77, %arg78) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      %36 = "arith.addf"(%arg79, %35) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%36) : (f32) -> ()
    }) {linalg.memoized_indexing_maps = [#map5, #map6, #map7]} : (tensor<1x113x1x96xf32>, tensor<3x1x96xf32>, tensor<1x56x1x96xf32>) -> tensor<1x56x1x96xf32>
    "func.return"(%34) : (tensor<1x56x1x96xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<1x?xf32>, tensor<1x?xf32>, tensor<1x?xf32>) -> tensor<1x?xf32>, sym_name = "conv_2d"}> ({
  ^bb0(%arg69: tensor<1x?xf32>, %arg70: tensor<1x?xf32>, %arg71: tensor<1x?xf32>):
    %30 = "linalg.conv_2d"(%arg69, %arg70, %arg71) <{operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg72: f32, %arg73: f32, %arg74: f32):
      %31 = "arith.mulf"(%arg72, %arg73) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      %32 = "arith.addf"(%arg74, %31) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%32) : (f32) -> ()
    }) {linalg.memoized_indexing_maps = [#map8, #map9, #map10]} : (tensor<1x?xf32>, tensor<1x?xf32>, tensor<1x?xf32>) -> tensor<1x?xf32>
    "func.return"(%30) : (tensor<1x?xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<?x1x?x?xf32>, tensor<1x?xf32>, tensor<?x1x?x?xf32>) -> tensor<?x1x?x?xf32>, sym_name = "pooling_nhwc_sum"}> ({
  ^bb0(%arg63: tensor<?x1x?x?xf32>, %arg64: tensor<1x?xf32>, %arg65: tensor<?x1x?x?xf32>):
    %28 = "linalg.pooling_nhwc_sum"(%arg63, %arg64, %arg65) <{dilations = dense<1> : tensor<2xi64>, operandSegmentSizes = array<i32: 2, 1>, strides = dense<1> : tensor<2xi64>}> ({
    ^bb0(%arg66: f32, %arg67: f32, %arg68: f32):
      %29 = "arith.addf"(%arg68, %arg66) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%29) : (f32) -> ()
    }) {linalg.memoized_indexing_maps = [#map11, #map12, #map7]} : (tensor<?x1x?x?xf32>, tensor<1x?xf32>, tensor<?x1x?x?xf32>) -> tensor<?x1x?x?xf32>
    "func.return"(%28) : (tensor<?x1x?x?xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<?x?x1x?xf32>, tensor<1x?xf32>, tensor<?x?x1x?xf32>) -> tensor<?x?x1x?xf32>, sym_name = "pooling_nchw_sum"}> ({
  ^bb0(%arg57: tensor<?x?x1x?xf32>, %arg58: tensor<1x?xf32>, %arg59: tensor<?x?x1x?xf32>):
    %26 = "linalg.pooling_nchw_sum"(%arg57, %arg58, %arg59) <{dilations = dense<1> : tensor<2xi64>, operandSegmentSizes = array<i32: 2, 1>, strides = dense<1> : tensor<2xi64>}> ({
    ^bb0(%arg60: f32, %arg61: f32, %arg62: f32):
      %27 = "arith.addf"(%arg62, %arg60) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%27) : (f32) -> ()
    }) {linalg.memoized_indexing_maps = [#map13, #map12, #map7]} : (tensor<?x?x1x?xf32>, tensor<1x?xf32>, tensor<?x?x1x?xf32>) -> tensor<?x?x1x?xf32>
    "func.return"(%26) : (tensor<?x?x1x?xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<?x1x?x?xf32>, tensor<1x?xf32>, tensor<?x1x?x?xf32>) -> tensor<?x1x?x?xf32>, sym_name = "pooling_nhwc_max"}> ({
  ^bb0(%arg51: tensor<?x1x?x?xf32>, %arg52: tensor<1x?xf32>, %arg53: tensor<?x1x?x?xf32>):
    %24 = "linalg.pooling_nhwc_max"(%arg51, %arg52, %arg53) <{dilations = dense<1> : tensor<2xi64>, operandSegmentSizes = array<i32: 2, 1>, strides = dense<1> : tensor<2xi64>}> ({
    ^bb0(%arg54: f32, %arg55: f32, %arg56: f32):
      %25 = "arith.maximumf"(%arg56, %arg54) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%25) : (f32) -> ()
    }) {linalg.memoized_indexing_maps = [#map11, #map12, #map7]} : (tensor<?x1x?x?xf32>, tensor<1x?xf32>, tensor<?x1x?x?xf32>) -> tensor<?x1x?x?xf32>
    "func.return"(%24) : (tensor<?x1x?x?xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<?x1x?x?xi32>, tensor<1x?xi32>, tensor<?x1x?x?xi32>) -> tensor<?x1x?x?xi32>, sym_name = "pooling_nhwc_max_unsigned"}> ({
  ^bb0(%arg45: tensor<?x1x?x?xi32>, %arg46: tensor<1x?xi32>, %arg47: tensor<?x1x?x?xi32>):
    %22 = "linalg.pooling_nhwc_max_unsigned"(%arg45, %arg46, %arg47) <{dilations = dense<1> : tensor<2xi64>, operandSegmentSizes = array<i32: 2, 1>, strides = dense<1> : tensor<2xi64>}> ({
    ^bb0(%arg48: i32, %arg49: i32, %arg50: i32):
      %23 = "arith.maxui"(%arg50, %arg48) : (i32, i32) -> i32
      "linalg.yield"(%23) : (i32) -> ()
    }) {linalg.memoized_indexing_maps = [#map11, #map12, #map7]} : (tensor<?x1x?x?xi32>, tensor<1x?xi32>, tensor<?x1x?x?xi32>) -> tensor<?x1x?x?xi32>
    "func.return"(%22) : (tensor<?x1x?x?xi32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<?x1x?x?xf32>, tensor<1x?xf32>, tensor<?x1x?x?xf32>) -> tensor<?x1x?x?xf32>, sym_name = "pooling_nhwc_min"}> ({
  ^bb0(%arg39: tensor<?x1x?x?xf32>, %arg40: tensor<1x?xf32>, %arg41: tensor<?x1x?x?xf32>):
    %20 = "linalg.pooling_nhwc_min"(%arg39, %arg40, %arg41) <{dilations = dense<1> : tensor<2xi64>, operandSegmentSizes = array<i32: 2, 1>, strides = dense<1> : tensor<2xi64>}> ({
    ^bb0(%arg42: f32, %arg43: f32, %arg44: f32):
      %21 = "arith.minimumf"(%arg44, %arg42) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%21) : (f32) -> ()
    }) {linalg.memoized_indexing_maps = [#map11, #map12, #map7]} : (tensor<?x1x?x?xf32>, tensor<1x?xf32>, tensor<?x1x?x?xf32>) -> tensor<?x1x?x?xf32>
    "func.return"(%20) : (tensor<?x1x?x?xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<?x1x?x?xi32>, tensor<1x?xi32>, tensor<?x1x?x?xi32>) -> tensor<?x1x?x?xi32>, sym_name = "pooling_nhwc_min_unsigned"}> ({
  ^bb0(%arg33: tensor<?x1x?x?xi32>, %arg34: tensor<1x?xi32>, %arg35: tensor<?x1x?x?xi32>):
    %18 = "linalg.pooling_nhwc_min_unsigned"(%arg33, %arg34, %arg35) <{dilations = dense<1> : tensor<2xi64>, operandSegmentSizes = array<i32: 2, 1>, strides = dense<1> : tensor<2xi64>}> ({
    ^bb0(%arg36: i32, %arg37: i32, %arg38: i32):
      %19 = "arith.minui"(%arg38, %arg36) : (i32, i32) -> i32
      "linalg.yield"(%19) : (i32) -> ()
    }) {linalg.memoized_indexing_maps = [#map11, #map12, #map7]} : (tensor<?x1x?x?xi32>, tensor<1x?xi32>, tensor<?x1x?x?xi32>) -> tensor<?x1x?x?xi32>
    "func.return"(%18) : (tensor<?x1x?x?xi32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<?x?x1x?xf32>, tensor<1x?xf32>, tensor<?x?x1x?xf32>) -> tensor<?x?x1x?xf32>, sym_name = "pooling_nchw_max"}> ({
  ^bb0(%arg27: tensor<?x?x1x?xf32>, %arg28: tensor<1x?xf32>, %arg29: tensor<?x?x1x?xf32>):
    %16 = "linalg.pooling_nchw_max"(%arg27, %arg28, %arg29) <{dilations = dense<1> : tensor<2xi64>, operandSegmentSizes = array<i32: 2, 1>, strides = dense<1> : tensor<2xi64>}> ({
    ^bb0(%arg30: f32, %arg31: f32, %arg32: f32):
      %17 = "arith.maximumf"(%arg32, %arg30) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%17) : (f32) -> ()
    }) {linalg.memoized_indexing_maps = [#map13, #map12, #map7]} : (tensor<?x?x1x?xf32>, tensor<1x?xf32>, tensor<?x?x1x?xf32>) -> tensor<?x?x1x?xf32>
    "func.return"(%16) : (tensor<?x?x1x?xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<1x14x8xf32>, tensor<1x3x8x16xf32>, tensor<1x12x16xf32>) -> tensor<1x12x16xf32>, sym_name = "batchless_conv_2d_hwc_hwcf"}> ({
  ^bb0(%arg21: tensor<1x14x8xf32>, %arg22: tensor<1x3x8x16xf32>, %arg23: tensor<1x12x16xf32>):
    %13 = "linalg.generic"(%arg21, %arg22, %arg23) <{indexing_maps = [#map14, #map15, #map16], iterator_types = [#linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>, #linalg.iterator_type<reduction>, #linalg.iterator_type<reduction>, #linalg.iterator_type<reduction>], operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg24: f32, %arg25: f32, %arg26: f32):
      %14 = "arith.mulf"(%arg24, %arg25) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      %15 = "arith.addf"(%arg26, %14) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%15) : (f32) -> ()
    }) : (tensor<1x14x8xf32>, tensor<1x3x8x16xf32>, tensor<1x12x16xf32>) -> tensor<1x12x16xf32>
    "func.return"(%13) : (tensor<1x12x16xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<1x14x8xf32>, tensor<1x3x8xf32>, tensor<1x12x8xf32>) -> tensor<1x12x8xf32>, sym_name = "batchless_depthwise_conv_2d_hwc_hwc"}> ({
  ^bb0(%arg15: tensor<1x14x8xf32>, %arg16: tensor<1x3x8xf32>, %arg17: tensor<1x12x8xf32>):
    %10 = "linalg.generic"(%arg15, %arg16, %arg17) <{indexing_maps = [#map17, #map18, #map19], iterator_types = [#linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>, #linalg.iterator_type<reduction>, #linalg.iterator_type<reduction>], operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg18: f32, %arg19: f32, %arg20: f32):
      %11 = "arith.mulf"(%arg18, %arg19) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      %12 = "arith.addf"(%arg20, %11) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%12) : (f32) -> ()
    }) : (tensor<1x14x8xf32>, tensor<1x3x8xf32>, tensor<1x12x8xf32>) -> tensor<1x12x8xf32>
    "func.return"(%10) : (tensor<1x12x8xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<8x1x14xf32>, tensor<1x3xf32>, tensor<8x1x12xf32>) -> tensor<8x1x12xf32>, sym_name = "batchless_pooling_chw_min"}> ({
  ^bb0(%arg9: tensor<8x1x14xf32>, %arg10: tensor<1x3xf32>, %arg11: tensor<8x1x12xf32>):
    %8 = "linalg.generic"(%arg9, %arg10, %arg11) <{indexing_maps = [#map20, #map21, #map19], iterator_types = [#linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>, #linalg.iterator_type<reduction>, #linalg.iterator_type<reduction>], operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg12: f32, %arg13: f32, %arg14: f32):
      %9 = "arith.minimumf"(%arg14, %arg12) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%9) : (f32) -> ()
    }) : (tensor<8x1x14xf32>, tensor<1x3xf32>, tensor<8x1x12xf32>) -> tensor<8x1x12xf32>
    "func.return"(%8) : (tensor<8x1x12xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<1x15xf32>, tensor<3x1xf32>, tensor<1x12xf32>) -> tensor<1x12xf32>, sym_name = "cross_conv_nonstandard_loop_order"}> ({
  ^bb0(%arg3: tensor<1x15xf32>, %arg4: tensor<3x1xf32>, %arg5: tensor<1x12xf32>):
    %5 = "linalg.generic"(%arg3, %arg4, %arg5) <{indexing_maps = [#map22, #map9, #map10], iterator_types = [#linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>, #linalg.iterator_type<reduction>, #linalg.iterator_type<reduction>], operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg6: f32, %arg7: f32, %arg8: f32):
      %6 = "arith.mulf"(%arg6, %arg7) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      %7 = "arith.addf"(%arg8, %6) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%7) : (f32) -> ()
    }) : (tensor<1x15xf32>, tensor<3x1xf32>, tensor<1x12xf32>) -> tensor<1x12xf32>
    "func.return"(%5) : (tensor<1x12xf32>) -> ()
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

