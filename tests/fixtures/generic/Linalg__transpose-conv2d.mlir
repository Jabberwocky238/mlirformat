#map = affine_map<(d0, d1, d2, d3, d4, d5, d6) -> (d0, d1 * 2 + d4, d2 * 2 + d5, d6)>
#map1 = affine_map<(d0, d1, d2, d3, d4, d5, d6) -> (d3, d4, d5, d6)>
#map2 = affine_map<(d0, d1, d2, d3, d4, d5, d6) -> (d0, d1, d2, d3)>
#map3 = affine_map<(d0, d1, d2, d3, d4, d5, d6) -> ()>
#map4 = affine_map<(d0, d1, d2, d3, d4, d5, d6) -> (d0, d1 + d4, d2 + d5, d6)>
#map5 = affine_map<(d0, d1, d2, d3, d4, d5, d6) -> (d0, d1 + d4 * 2, d2 + d5 * 2, d6)>
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<1x4x4x6xf64>, tensor<8x2x2x6xf64>, tensor<1x2x2x8xf64>) -> tensor<1x2x2x8xf64>, sym_name = "conv_2d_nhwc_fhwc_f64"}> ({
  ^bb0(%arg71: tensor<1x4x4x6xf64>, %arg72: tensor<8x2x2x6xf64>, %arg73: tensor<1x2x2x8xf64>):
    %38 = "linalg.conv_2d_nhwc_fhwc"(%arg71, %arg72, %arg73) <{dilations = dense<1> : tensor<2xi64>, operandSegmentSizes = array<i32: 2, 1>, strides = dense<2> : tensor<2xi64>}> ({
    ^bb0(%arg74: f64, %arg75: f64, %arg76: f64):
      %39 = "arith.mulf"(%arg74, %arg75) <{fastmath = #arith.fastmath<none>}> : (f64, f64) -> f64
      %40 = "arith.addf"(%arg76, %39) <{fastmath = #arith.fastmath<none>}> : (f64, f64) -> f64
      "linalg.yield"(%40) : (f64) -> ()
    }) {linalg.memoized_indexing_maps = [#map, #map1, #map2]} : (tensor<1x4x4x6xf64>, tensor<8x2x2x6xf64>, tensor<1x2x2x8xf64>) -> tensor<1x2x2x8xf64>
    "func.return"(%38) : (tensor<1x2x2x8xf64>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<1x4x4x6xf32>, tensor<8x2x2x6xf32>, tensor<1x2x2x8xf32>) -> tensor<1x2x2x8xf32>, sym_name = "conv_2d_nhwc_fhwc_f32"}> ({
  ^bb0(%arg65: tensor<1x4x4x6xf32>, %arg66: tensor<8x2x2x6xf32>, %arg67: tensor<1x2x2x8xf32>):
    %35 = "linalg.conv_2d_nhwc_fhwc"(%arg65, %arg66, %arg67) <{dilations = dense<1> : tensor<2xi64>, operandSegmentSizes = array<i32: 2, 1>, strides = dense<2> : tensor<2xi64>}> ({
    ^bb0(%arg68: f32, %arg69: f32, %arg70: f32):
      %36 = "arith.mulf"(%arg68, %arg69) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      %37 = "arith.addf"(%arg70, %36) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%37) : (f32) -> ()
    }) {linalg.memoized_indexing_maps = [#map, #map1, #map2]} : (tensor<1x4x4x6xf32>, tensor<8x2x2x6xf32>, tensor<1x2x2x8xf32>) -> tensor<1x2x2x8xf32>
    "func.return"(%35) : (tensor<1x2x2x8xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<1x4x4x6xf16>, tensor<8x2x2x6xf16>, tensor<1x2x2x8xf16>) -> tensor<1x2x2x8xf16>, sym_name = "conv_2d_nhwc_fhwc_f16"}> ({
  ^bb0(%arg59: tensor<1x4x4x6xf16>, %arg60: tensor<8x2x2x6xf16>, %arg61: tensor<1x2x2x8xf16>):
    %32 = "linalg.conv_2d_nhwc_fhwc"(%arg59, %arg60, %arg61) <{dilations = dense<1> : tensor<2xi64>, operandSegmentSizes = array<i32: 2, 1>, strides = dense<2> : tensor<2xi64>}> ({
    ^bb0(%arg62: f16, %arg63: f16, %arg64: f16):
      %33 = "arith.mulf"(%arg62, %arg63) <{fastmath = #arith.fastmath<none>}> : (f16, f16) -> f16
      %34 = "arith.addf"(%arg64, %33) <{fastmath = #arith.fastmath<none>}> : (f16, f16) -> f16
      "linalg.yield"(%34) : (f16) -> ()
    }) {linalg.memoized_indexing_maps = [#map, #map1, #map2]} : (tensor<1x4x4x6xf16>, tensor<8x2x2x6xf16>, tensor<1x2x2x8xf16>) -> tensor<1x2x2x8xf16>
    "func.return"(%32) : (tensor<1x2x2x8xf16>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<1x4x4x6xbf16>, tensor<8x2x2x6xbf16>, tensor<1x2x2x8xbf16>) -> tensor<1x2x2x8xbf16>, sym_name = "conv_2d_nhwc_fhwc_b16"}> ({
  ^bb0(%arg53: tensor<1x4x4x6xbf16>, %arg54: tensor<8x2x2x6xbf16>, %arg55: tensor<1x2x2x8xbf16>):
    %29 = "linalg.conv_2d_nhwc_fhwc"(%arg53, %arg54, %arg55) <{dilations = dense<1> : tensor<2xi64>, operandSegmentSizes = array<i32: 2, 1>, strides = dense<2> : tensor<2xi64>}> ({
    ^bb0(%arg56: bf16, %arg57: bf16, %arg58: bf16):
      %30 = "arith.mulf"(%arg56, %arg57) <{fastmath = #arith.fastmath<none>}> : (bf16, bf16) -> bf16
      %31 = "arith.addf"(%arg58, %30) <{fastmath = #arith.fastmath<none>}> : (bf16, bf16) -> bf16
      "linalg.yield"(%31) : (bf16) -> ()
    }) {linalg.memoized_indexing_maps = [#map, #map1, #map2]} : (tensor<1x4x4x6xbf16>, tensor<8x2x2x6xbf16>, tensor<1x2x2x8xbf16>) -> tensor<1x2x2x8xbf16>
    "func.return"(%29) : (tensor<1x2x2x8xbf16>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<1x4x4x6xi64>, tensor<8x2x2x6xi64>, tensor<1x2x2x8xi64>) -> tensor<1x2x2x8xi64>, sym_name = "conv_2d_nhwc_fhwc_i64"}> ({
  ^bb0(%arg47: tensor<1x4x4x6xi64>, %arg48: tensor<8x2x2x6xi64>, %arg49: tensor<1x2x2x8xi64>):
    %26 = "linalg.conv_2d_nhwc_fhwc"(%arg47, %arg48, %arg49) <{dilations = dense<1> : tensor<2xi64>, operandSegmentSizes = array<i32: 2, 1>, strides = dense<2> : tensor<2xi64>}> ({
    ^bb0(%arg50: i64, %arg51: i64, %arg52: i64):
      %27 = "arith.muli"(%arg50, %arg51) <{overflowFlags = #arith.overflow<none>}> : (i64, i64) -> i64
      %28 = "arith.addi"(%arg52, %27) <{overflowFlags = #arith.overflow<none>}> : (i64, i64) -> i64
      "linalg.yield"(%28) : (i64) -> ()
    }) {linalg.memoized_indexing_maps = [#map, #map1, #map2]} : (tensor<1x4x4x6xi64>, tensor<8x2x2x6xi64>, tensor<1x2x2x8xi64>) -> tensor<1x2x2x8xi64>
    "func.return"(%26) : (tensor<1x2x2x8xi64>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<1x4x4x6xi32>, tensor<8x2x2x6xi32>, tensor<1x2x2x8xi32>) -> tensor<1x2x2x8xi32>, sym_name = "conv_2d_nhwc_fhwc_i32"}> ({
  ^bb0(%arg41: tensor<1x4x4x6xi32>, %arg42: tensor<8x2x2x6xi32>, %arg43: tensor<1x2x2x8xi32>):
    %23 = "linalg.conv_2d_nhwc_fhwc"(%arg41, %arg42, %arg43) <{dilations = dense<1> : tensor<2xi64>, operandSegmentSizes = array<i32: 2, 1>, strides = dense<2> : tensor<2xi64>}> ({
    ^bb0(%arg44: i32, %arg45: i32, %arg46: i32):
      %24 = "arith.muli"(%arg44, %arg45) <{overflowFlags = #arith.overflow<none>}> : (i32, i32) -> i32
      %25 = "arith.addi"(%arg46, %24) <{overflowFlags = #arith.overflow<none>}> : (i32, i32) -> i32
      "linalg.yield"(%25) : (i32) -> ()
    }) {linalg.memoized_indexing_maps = [#map, #map1, #map2]} : (tensor<1x4x4x6xi32>, tensor<8x2x2x6xi32>, tensor<1x2x2x8xi32>) -> tensor<1x2x2x8xi32>
    "func.return"(%23) : (tensor<1x2x2x8xi32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<1x4x4x6xi16>, tensor<8x2x2x6xi16>, tensor<1x2x2x8xi16>) -> tensor<1x2x2x8xi16>, sym_name = "conv_2d_nhwc_fhwc_i16"}> ({
  ^bb0(%arg35: tensor<1x4x4x6xi16>, %arg36: tensor<8x2x2x6xi16>, %arg37: tensor<1x2x2x8xi16>):
    %20 = "linalg.conv_2d_nhwc_fhwc"(%arg35, %arg36, %arg37) <{dilations = dense<1> : tensor<2xi64>, operandSegmentSizes = array<i32: 2, 1>, strides = dense<2> : tensor<2xi64>}> ({
    ^bb0(%arg38: i16, %arg39: i16, %arg40: i16):
      %21 = "arith.muli"(%arg38, %arg39) <{overflowFlags = #arith.overflow<none>}> : (i16, i16) -> i16
      %22 = "arith.addi"(%arg40, %21) <{overflowFlags = #arith.overflow<none>}> : (i16, i16) -> i16
      "linalg.yield"(%22) : (i16) -> ()
    }) {linalg.memoized_indexing_maps = [#map, #map1, #map2]} : (tensor<1x4x4x6xi16>, tensor<8x2x2x6xi16>, tensor<1x2x2x8xi16>) -> tensor<1x2x2x8xi16>
    "func.return"(%20) : (tensor<1x2x2x8xi16>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<1x4x4x6xi8>, tensor<8x2x2x6xi8>, tensor<1x2x2x8xi8>) -> tensor<1x2x2x8xi8>, sym_name = "conv_2d_nhwc_fhwc_i8"}> ({
  ^bb0(%arg29: tensor<1x4x4x6xi8>, %arg30: tensor<8x2x2x6xi8>, %arg31: tensor<1x2x2x8xi8>):
    %17 = "linalg.conv_2d_nhwc_fhwc"(%arg29, %arg30, %arg31) <{dilations = dense<1> : tensor<2xi64>, operandSegmentSizes = array<i32: 2, 1>, strides = dense<2> : tensor<2xi64>}> ({
    ^bb0(%arg32: i8, %arg33: i8, %arg34: i8):
      %18 = "arith.muli"(%arg32, %arg33) <{overflowFlags = #arith.overflow<none>}> : (i8, i8) -> i8
      %19 = "arith.addi"(%arg34, %18) <{overflowFlags = #arith.overflow<none>}> : (i8, i8) -> i8
      "linalg.yield"(%19) : (i8) -> ()
    }) {linalg.memoized_indexing_maps = [#map, #map1, #map2]} : (tensor<1x4x4x6xi8>, tensor<8x2x2x6xi8>, tensor<1x2x2x8xi8>) -> tensor<1x2x2x8xi8>
    "func.return"(%17) : (tensor<1x2x2x8xi8>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<1x4x4x6xf32>, tensor<8x2x2x6xf32>, tensor<1x2x2x8xf32>, i32, i32) -> tensor<1x2x2x8xf32>, sym_name = "conv_2d_nhwc_fhwc_q"}> ({
  ^bb0(%arg19: tensor<1x4x4x6xf32>, %arg20: tensor<8x2x2x6xf32>, %arg21: tensor<1x2x2x8xf32>, %arg22: i32, %arg23: i32):
    %10 = "linalg.conv_2d_nhwc_fhwc_q"(%arg19, %arg20, %arg22, %arg23, %arg21) <{dilations = dense<1> : tensor<2xi64>, operandSegmentSizes = array<i32: 4, 1>, strides = dense<2> : tensor<2xi64>}> ({
    ^bb0(%arg24: f32, %arg25: f32, %arg26: i32, %arg27: i32, %arg28: f32):
      %11 = "arith.sitofp"(%arg26) : (i32) -> f32
      %12 = "arith.subf"(%arg24, %11) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      %13 = "arith.sitofp"(%arg27) : (i32) -> f32
      %14 = "arith.subf"(%arg25, %13) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      %15 = "arith.mulf"(%12, %14) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      %16 = "arith.addf"(%arg28, %15) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%16) : (f32) -> ()
    }) {linalg.memoized_indexing_maps = [#map, #map1, #map3, #map3, #map2]} : (tensor<1x4x4x6xf32>, tensor<8x2x2x6xf32>, i32, i32, tensor<1x2x2x8xf32>) -> tensor<1x2x2x8xf32>
    "func.return"(%10) : (tensor<1x2x2x8xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<1x4x4x6xf32>, tensor<8x2x2x6xf32>, tensor<1x3x3x8xf32>) -> tensor<1x3x3x8xf32>, sym_name = "conv_2d_nhwc_fhwc_f32_unit_stride"}> ({
  ^bb0(%arg13: tensor<1x4x4x6xf32>, %arg14: tensor<8x2x2x6xf32>, %arg15: tensor<1x3x3x8xf32>):
    %7 = "linalg.conv_2d_nhwc_fhwc"(%arg13, %arg14, %arg15) <{dilations = dense<1> : tensor<2xi64>, operandSegmentSizes = array<i32: 2, 1>, strides = dense<1> : tensor<2xi64>}> ({
    ^bb0(%arg16: f32, %arg17: f32, %arg18: f32):
      %8 = "arith.mulf"(%arg16, %arg17) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      %9 = "arith.addf"(%arg18, %8) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%9) : (f32) -> ()
    }) {linalg.memoized_indexing_maps = [#map4, #map1, #map2]} : (tensor<1x4x4x6xf32>, tensor<8x2x2x6xf32>, tensor<1x3x3x8xf32>) -> tensor<1x3x3x8xf32>
    "func.return"(%7) : (tensor<1x3x3x8xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<1x4x4x6xf32>, tensor<8x2x2x6xf32>, tensor<1x2x2x8xf32>) -> tensor<1x2x2x8xf32>, sym_name = "conv_2d_nhwc_fhwc_f32_2_dialation"}> ({
  ^bb0(%arg7: tensor<1x4x4x6xf32>, %arg8: tensor<8x2x2x6xf32>, %arg9: tensor<1x2x2x8xf32>):
    %4 = "linalg.conv_2d_nhwc_fhwc"(%arg7, %arg8, %arg9) <{dilations = dense<2> : tensor<2xi64>, operandSegmentSizes = array<i32: 2, 1>, strides = dense<1> : tensor<2xi64>}> ({
    ^bb0(%arg10: f32, %arg11: f32, %arg12: f32):
      %5 = "arith.mulf"(%arg10, %arg11) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      %6 = "arith.addf"(%arg12, %5) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%6) : (f32) -> ()
    }) {linalg.memoized_indexing_maps = [#map5, #map1, #map2]} : (tensor<1x4x4x6xf32>, tensor<8x2x2x6xf32>, tensor<1x2x2x8xf32>) -> tensor<1x2x2x8xf32>
    "func.return"(%4) : (tensor<1x2x2x8xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (memref<1x4x4x6xf32>, memref<8x2x2x6xf32>, memref<1x2x2x8xf32>) -> memref<1x2x2x8xf32>, sym_name = "conv_2d_nhwc_fhwc_memref"}> ({
  ^bb0(%arg1: memref<1x4x4x6xf32>, %arg2: memref<8x2x2x6xf32>, %arg3: memref<1x2x2x8xf32>):
    "linalg.conv_2d_nhwc_fhwc"(%arg1, %arg2, %arg3) <{dilations = dense<1> : tensor<2xi64>, operandSegmentSizes = array<i32: 2, 1>, strides = dense<2> : tensor<2xi64>}> ({
    ^bb0(%arg4: f32, %arg5: f32, %arg6: f32):
      %2 = "arith.mulf"(%arg4, %arg5) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      %3 = "arith.addf"(%arg6, %2) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%3) : (f32) -> ()
    }) {linalg.memoized_indexing_maps = [#map, #map1, #map2]} : (memref<1x4x4x6xf32>, memref<8x2x2x6xf32>, memref<1x2x2x8xf32>) -> ()
    "func.return"(%arg3) : (memref<1x2x2x8xf32>) -> ()
  }) : () -> ()
  "builtin.module"() ({
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg0: !transform.any_op):
      %0 = "transform.structured.match"(%arg0) <{ops = ["linalg.conv_2d_nhwc_fhwc", "linalg.conv_2d_nhwc_fhwc_q"]}> : (!transform.any_op) -> !transform.any_op
      %1 = "transform.structured.transpose_conv2d"(%0) : (!transform.any_op) -> !transform.any_op
      "transform.yield"() : () -> ()
    }) : () -> ()
  }) {transform.with_named_sequence} : () -> ()
}) : () -> ()

