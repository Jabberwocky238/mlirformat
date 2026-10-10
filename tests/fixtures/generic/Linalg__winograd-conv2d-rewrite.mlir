#map = affine_map<(d0, d1, d2, d3) -> (d0, d1, d3)>
#map1 = affine_map<(d0, d1, d2, d3) -> (d0, d3, d2)>
#map2 = affine_map<(d0, d1, d2, d3) -> (d0, d1, d2)>
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<2x11x11x5xf32>, tensor<2x3x3x5xf32>, tensor<2x9x9x2xf32>) -> tensor<2x9x9x2xf32>, sym_name = "conv2d"}> ({
  ^bb0(%arg0: tensor<2x11x11x5xf32>, %arg1: tensor<2x3x3x5xf32>, %arg2: tensor<2x9x9x2xf32>):
    %0 = "arith.constant"() <{value = 0.000000e+00 : f32}> : () -> f32
    %1 = "tensor.empty"() : () -> tensor<6x6x5x2xf32>
    %2 = "linalg.winograd_filter_transform"(%arg1, %1) <{fmr = 1 : i32}> : (tensor<2x3x3x5xf32>, tensor<6x6x5x2xf32>) -> tensor<6x6x5x2xf32>
    %3 = "tensor.pad"(%arg0) <{operandSegmentSizes = array<i32: 1, 0, 0>, static_high = array<i64: 0, 3, 3, 0>, static_low = array<i64: 0, 0, 0, 0>}> ({
    ^bb0(%arg12: index, %arg13: index, %arg14: index, %arg15: index):
      "tensor.yield"(%0) : (f32) -> ()
    }) : (tensor<2x11x11x5xf32>) -> tensor<2x14x14x5xf32>
    %4 = "tensor.empty"() : () -> tensor<6x6x3x3x2x5xf32>
    %5 = "linalg.winograd_input_transform"(%3, %4) <{fmr = 1 : i32}> : (tensor<2x14x14x5xf32>, tensor<6x6x3x3x2x5xf32>) -> tensor<6x6x3x3x2x5xf32>
    %6 = "tensor.collapse_shape"(%2) <{reassociation = [[0, 1], [2], [3]]}> : (tensor<6x6x5x2xf32>) -> tensor<36x5x2xf32>
    %7 = "tensor.collapse_shape"(%5) <{reassociation = [[0, 1], [2, 3, 4], [5]]}> : (tensor<6x6x3x3x2x5xf32>) -> tensor<36x18x5xf32>
    %8 = "tensor.empty"() : () -> tensor<36x18x2xf32>
    %9 = "linalg.fill"(%0, %8) <{operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg10: f32, %arg11: f32):
      "linalg.yield"(%arg10) : (f32) -> ()
    }) : (f32, tensor<36x18x2xf32>) -> tensor<36x18x2xf32>
    %10 = "linalg.batch_matmul"(%7, %6, %9) <{indexing_maps = [#map, #map1, #map2], operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg7: f32, %arg8: f32, %arg9: f32):
      %15 = "arith.mulf"(%arg7, %arg8) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      %16 = "arith.addf"(%arg9, %15) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%16) : (f32) -> ()
    }) : (tensor<36x18x5xf32>, tensor<36x5x2xf32>, tensor<36x18x2xf32>) -> tensor<36x18x2xf32>
    %11 = "tensor.expand_shape"(%10) <{reassociation = [[0, 1], [2, 3, 4], [5]], static_output_shape = array<i64: 6, 6, 3, 3, 2, 2>}> : (tensor<36x18x2xf32>) -> tensor<6x6x3x3x2x2xf32>
    %12 = "tensor.pad"(%arg2) <{operandSegmentSizes = array<i32: 1, 0, 0>, static_high = array<i64: 0, 3, 3, 0>, static_low = array<i64: 0, 0, 0, 0>}> ({
    ^bb0(%arg3: index, %arg4: index, %arg5: index, %arg6: index):
      "tensor.yield"(%0) : (f32) -> ()
    }) : (tensor<2x9x9x2xf32>) -> tensor<2x12x12x2xf32>
    %13 = "linalg.winograd_output_transform"(%11, %12) <{fmr = 1 : i32}> : (tensor<6x6x3x3x2x2xf32>, tensor<2x12x12x2xf32>) -> tensor<2x12x12x2xf32>
    %14 = "tensor.extract_slice"(%13) <{operandSegmentSizes = array<i32: 1, 0, 0, 0>, static_offsets = array<i64: 0, 0, 0, 0>, static_sizes = array<i64: 2, 9, 9, 2>, static_strides = array<i64: 1, 1, 1, 1>}> : (tensor<2x12x12x2xf32>) -> tensor<2x9x9x2xf32>
    "func.return"(%14) : (tensor<2x9x9x2xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1, d2, d3) -> (d0, d1, d3)>
#map1 = affine_map<(d0, d1, d2, d3) -> (d0, d3, d2)>
#map2 = affine_map<(d0, d1, d2, d3) -> (d0, d1, d2)>
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<2x6x6x5xf16>, tensor<2x3x3x5xf16>, tensor<1xf32>, tensor<2x4x4x2xf32>) -> tensor<2x4x4x2xf32>, sym_name = "conv2d_type_promotion"}> ({
  ^bb0(%arg0: tensor<2x6x6x5xf16>, %arg1: tensor<2x3x3x5xf16>, %arg2: tensor<1xf32>, %arg3: tensor<2x4x4x2xf32>):
    %0 = "arith.constant"() <{value = 0.000000e+00 : f32}> : () -> f32
    %1 = "tensor.empty"() : () -> tensor<6x6x5x2xf16>
    %2 = "linalg.winograd_filter_transform"(%arg1, %1) <{fmr = 1 : i32}> : (tensor<2x3x3x5xf16>, tensor<6x6x5x2xf16>) -> tensor<6x6x5x2xf16>
    %3 = "tensor.empty"() : () -> tensor<6x6x1x1x2x5xf16>
    %4 = "linalg.winograd_input_transform"(%arg0, %3) <{fmr = 1 : i32}> : (tensor<2x6x6x5xf16>, tensor<6x6x1x1x2x5xf16>) -> tensor<6x6x1x1x2x5xf16>
    %5 = "tensor.collapse_shape"(%2) <{reassociation = [[0, 1], [2], [3]]}> : (tensor<6x6x5x2xf16>) -> tensor<36x5x2xf16>
    %6 = "tensor.collapse_shape"(%4) <{reassociation = [[0, 1], [2, 3, 4], [5]]}> : (tensor<6x6x1x1x2x5xf16>) -> tensor<36x2x5xf16>
    %7 = "tensor.empty"() : () -> tensor<36x2x2xf32>
    %8 = "linalg.fill"(%0, %7) <{operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg7: f32, %arg8: f32):
      "linalg.yield"(%arg7) : (f32) -> ()
    }) : (f32, tensor<36x2x2xf32>) -> tensor<36x2x2xf32>
    %9 = "linalg.batch_matmul"(%6, %5, %8) <{indexing_maps = [#map, #map1, #map2], operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg4: f16, %arg5: f16, %arg6: f32):
      %12 = "arith.extf"(%arg4) : (f16) -> f32
      %13 = "arith.extf"(%arg5) : (f16) -> f32
      %14 = "arith.mulf"(%12, %13) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      %15 = "arith.addf"(%arg6, %14) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%15) : (f32) -> ()
    }) : (tensor<36x2x5xf16>, tensor<36x5x2xf16>, tensor<36x2x2xf32>) -> tensor<36x2x2xf32>
    %10 = "tensor.expand_shape"(%9) <{reassociation = [[0, 1], [2, 3, 4], [5]], static_output_shape = array<i64: 6, 6, 1, 1, 2, 2>}> : (tensor<36x2x2xf32>) -> tensor<6x6x1x1x2x2xf32>
    %11 = "linalg.winograd_output_transform"(%10, %arg3) <{fmr = 1 : i32}> : (tensor<6x6x1x1x2x2xf32>, tensor<2x4x4x2xf32>) -> tensor<2x4x4x2xf32>
    "func.return"(%11) : (tensor<2x4x4x2xf32>) -> ()
  }) : () -> ()
}) : () -> ()

