#map = affine_map<(d0, d1, d2, d3) -> (d0, d1, d3)>
#map1 = affine_map<(d0, d1, d2, d3) -> (d0, d3, d2)>
#map2 = affine_map<(d0, d1, d2, d3) -> (d0, d1, d2)>
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<2x10x10x5xf32>, tensor<2x3x3x5xf32>, tensor<2x8x8x2xf32>) -> tensor<2x8x8x2xf32>, sym_name = "conv2d"}> ({
  ^bb0(%arg1: tensor<2x10x10x5xf32>, %arg2: tensor<2x3x3x5xf32>, %arg3: tensor<2x8x8x2xf32>):
    %10 = "tensor.empty"() : () -> tensor<6x6x5x2xf32>
    %11 = "linalg.winograd_filter_transform"(%arg2, %10) <{fmr = 1 : i32}> : (tensor<2x3x3x5xf32>, tensor<6x6x5x2xf32>) -> tensor<6x6x5x2xf32>
    %12 = "tensor.empty"() : () -> tensor<6x6x2x2x2x5xf32>
    %13 = "linalg.winograd_input_transform"(%arg1, %12) <{fmr = 1 : i32}> : (tensor<2x10x10x5xf32>, tensor<6x6x2x2x2x5xf32>) -> tensor<6x6x2x2x2x5xf32>
    %14 = "tensor.collapse_shape"(%11) <{reassociation = [[0, 1], [2], [3]]}> : (tensor<6x6x5x2xf32>) -> tensor<36x5x2xf32>
    %15 = "tensor.collapse_shape"(%13) <{reassociation = [[0, 1], [2, 3, 4], [5]]}> : (tensor<6x6x2x2x2x5xf32>) -> tensor<36x8x5xf32>
    %16 = "tensor.empty"() : () -> tensor<36x8x2xf32>
    %17 = "linalg.batch_matmul"(%15, %14, %16) <{indexing_maps = [#map, #map1, #map2], operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg4: f32, %arg5: f32, %arg6: f32):
      %20 = "arith.mulf"(%arg4, %arg5) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      %21 = "arith.addf"(%arg6, %20) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%21) : (f32) -> ()
    }) : (tensor<36x8x5xf32>, tensor<36x5x2xf32>, tensor<36x8x2xf32>) -> tensor<36x8x2xf32>
    %18 = "tensor.expand_shape"(%17) <{reassociation = [[0, 1], [2, 3, 4], [5]], static_output_shape = array<i64: 6, 6, 2, 2, 2, 2>}> : (tensor<36x8x2xf32>) -> tensor<6x6x2x2x2x2xf32>
    %19 = "linalg.winograd_output_transform"(%18, %arg3) <{fmr = 1 : i32}> : (tensor<6x6x2x2x2x2xf32>, tensor<2x8x8x2xf32>) -> tensor<2x8x8x2xf32>
    "func.return"(%19) : (tensor<2x8x8x2xf32>) -> ()
  }) : () -> ()
  "builtin.module"() ({
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg0: !transform.any_op):
      %0 = "transform.structured.match"(%arg0) <{ops = ["linalg.winograd_filter_transform"]}> : (!transform.any_op) -> !transform.any_op
      %1 = "transform.structured.match"(%arg0) <{ops = ["linalg.winograd_input_transform"]}> : (!transform.any_op) -> !transform.any_op
      %2:3 = "transform.structured.tile_using_for"(%1) <{scalable_sizes = array<i1: false, false, false, false, false, false>, static_sizes = array<i64: 0, 0, 1, 1, 0, 0>}> : (!transform.any_op) -> (!transform.any_op, !transform.any_op, !transform.any_op)
      %3 = "transform.structured.match"(%arg0) <{ops = ["linalg.winograd_output_transform"]}> : (!transform.any_op) -> !transform.any_op
      %4:3 = "transform.structured.tile_using_for"(%3) <{scalable_sizes = array<i1: false, false, false, false, false, false>, static_sizes = array<i64: 0, 0, 1, 1, 0, 0>}> : (!transform.any_op) -> (!transform.any_op, !transform.any_op, !transform.any_op)
      %5 = "transform.structured.decompose_winograd_op"(%0) : (!transform.any_op) -> !transform.any_op
      %6 = "transform.structured.match"(%2#0) <{ops = ["linalg.winograd_input_transform"]}> : (!transform.any_op) -> !transform.any_op
      %7 = "transform.structured.decompose_winograd_op"(%6) : (!transform.any_op) -> !transform.any_op
      %8 = "transform.structured.match"(%4#0) <{ops = ["linalg.winograd_output_transform"]}> : (!transform.any_op) -> !transform.any_op
      %9 = "transform.structured.decompose_winograd_op"(%8) : (!transform.any_op) -> !transform.any_op
      "transform.yield"() : () -> ()
    }) : () -> ()
  }) {transform.with_named_sequence} : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1, d2, d3) -> (d0, d1, d3)>
#map1 = affine_map<(d0, d1, d2, d3) -> (d0, d3, d2)>
#map2 = affine_map<(d0, d1, d2, d3) -> (d0, d1, d2)>
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<2x11x11x5xf32>, tensor<2x3x3x5xf32>, tensor<2x9x9x2xf32>) -> tensor<2x9x9x2xf32>, sym_name = "conv2d_unaligned"}> ({
  ^bb0(%arg1: tensor<2x11x11x5xf32>, %arg2: tensor<2x3x3x5xf32>, %arg3: tensor<2x9x9x2xf32>):
    %10 = "arith.constant"() <{value = 0.000000e+00 : f32}> : () -> f32
    %11 = "tensor.empty"() : () -> tensor<6x6x5x2xf32>
    %12 = "linalg.winograd_filter_transform"(%arg2, %11) <{fmr = 1 : i32}> : (tensor<2x3x3x5xf32>, tensor<6x6x5x2xf32>) -> tensor<6x6x5x2xf32>
    %13 = "tensor.pad"(%arg1) <{operandSegmentSizes = array<i32: 1, 0, 0>, static_high = array<i64: 0, 3, 3, 0>, static_low = array<i64: 0, 0, 0, 0>}> ({
    ^bb0(%arg13: index, %arg14: index, %arg15: index, %arg16: index):
      "tensor.yield"(%10) : (f32) -> ()
    }) : (tensor<2x11x11x5xf32>) -> tensor<2x14x14x5xf32>
    %14 = "tensor.empty"() : () -> tensor<6x6x3x3x2x5xf32>
    %15 = "linalg.winograd_input_transform"(%13, %14) <{fmr = 1 : i32}> : (tensor<2x14x14x5xf32>, tensor<6x6x3x3x2x5xf32>) -> tensor<6x6x3x3x2x5xf32>
    %16 = "tensor.collapse_shape"(%12) <{reassociation = [[0, 1], [2], [3]]}> : (tensor<6x6x5x2xf32>) -> tensor<36x5x2xf32>
    %17 = "tensor.collapse_shape"(%15) <{reassociation = [[0, 1], [2, 3, 4], [5]]}> : (tensor<6x6x3x3x2x5xf32>) -> tensor<36x18x5xf32>
    %18 = "tensor.empty"() : () -> tensor<36x18x2xf32>
    %19 = "linalg.fill"(%10, %18) <{operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg11: f32, %arg12: f32):
      "linalg.yield"(%arg11) : (f32) -> ()
    }) : (f32, tensor<36x18x2xf32>) -> tensor<36x18x2xf32>
    %20 = "linalg.batch_matmul"(%17, %16, %19) <{indexing_maps = [#map, #map1, #map2], operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg8: f32, %arg9: f32, %arg10: f32):
      %25 = "arith.mulf"(%arg8, %arg9) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      %26 = "arith.addf"(%arg10, %25) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%26) : (f32) -> ()
    }) : (tensor<36x18x5xf32>, tensor<36x5x2xf32>, tensor<36x18x2xf32>) -> tensor<36x18x2xf32>
    %21 = "tensor.expand_shape"(%20) <{reassociation = [[0, 1], [2, 3, 4], [5]], static_output_shape = array<i64: 6, 6, 3, 3, 2, 2>}> : (tensor<36x18x2xf32>) -> tensor<6x6x3x3x2x2xf32>
    %22 = "tensor.pad"(%arg3) <{operandSegmentSizes = array<i32: 1, 0, 0>, static_high = array<i64: 0, 3, 3, 0>, static_low = array<i64: 0, 0, 0, 0>}> ({
    ^bb0(%arg4: index, %arg5: index, %arg6: index, %arg7: index):
      "tensor.yield"(%10) : (f32) -> ()
    }) : (tensor<2x9x9x2xf32>) -> tensor<2x12x12x2xf32>
    %23 = "linalg.winograd_output_transform"(%21, %22) <{fmr = 1 : i32}> : (tensor<6x6x3x3x2x2xf32>, tensor<2x12x12x2xf32>) -> tensor<2x12x12x2xf32>
    %24 = "tensor.extract_slice"(%23) <{operandSegmentSizes = array<i32: 1, 0, 0, 0>, static_offsets = array<i64: 0, 0, 0, 0>, static_sizes = array<i64: 2, 9, 9, 2>, static_strides = array<i64: 1, 1, 1, 1>}> : (tensor<2x12x12x2xf32>) -> tensor<2x9x9x2xf32>
    "func.return"(%24) : (tensor<2x9x9x2xf32>) -> ()
  }) : () -> ()
  "builtin.module"() ({
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg0: !transform.any_op):
      %0 = "transform.structured.match"(%arg0) <{ops = ["linalg.winograd_filter_transform"]}> : (!transform.any_op) -> !transform.any_op
      %1 = "transform.structured.match"(%arg0) <{ops = ["linalg.winograd_input_transform"]}> : (!transform.any_op) -> !transform.any_op
      %2:3 = "transform.structured.tile_using_for"(%1) <{scalable_sizes = array<i1: false, false, false, false, false, false>, static_sizes = array<i64: 0, 0, 1, 1, 0, 0>}> : (!transform.any_op) -> (!transform.any_op, !transform.any_op, !transform.any_op)
      %3 = "transform.structured.match"(%arg0) <{ops = ["linalg.winograd_output_transform"]}> : (!transform.any_op) -> !transform.any_op
      %4:3 = "transform.structured.tile_using_for"(%3) <{scalable_sizes = array<i1: false, false, false, false, false, false>, static_sizes = array<i64: 0, 0, 1, 1, 0, 0>}> : (!transform.any_op) -> (!transform.any_op, !transform.any_op, !transform.any_op)
      %5 = "transform.structured.decompose_winograd_op"(%0) : (!transform.any_op) -> !transform.any_op
      %6 = "transform.structured.match"(%2#0) <{ops = ["linalg.winograd_input_transform"]}> : (!transform.any_op) -> !transform.any_op
      %7 = "transform.structured.decompose_winograd_op"(%6) : (!transform.any_op) -> !transform.any_op
      %8 = "transform.structured.match"(%4#0) <{ops = ["linalg.winograd_output_transform"]}> : (!transform.any_op) -> !transform.any_op
      %9 = "transform.structured.decompose_winograd_op"(%8) : (!transform.any_op) -> !transform.any_op
      "transform.yield"() : () -> ()
    }) : () -> ()
  }) {transform.with_named_sequence} : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1, d2, d3) -> (d0, d1, d3)>
#map1 = affine_map<(d0, d1, d2, d3) -> (d0, d3, d2)>
#map2 = affine_map<(d0, d1, d2, d3) -> (d0, d1, d2)>
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<2x6x1x5xf32>, tensor<2x3x1x5xf32>, tensor<2x4x1x2xf32>) -> tensor<2x4x1x2xf32>, sym_name = "conv2d_mx1_rx1"}> ({
  ^bb0(%arg1: tensor<2x6x1x5xf32>, %arg2: tensor<2x3x1x5xf32>, %arg3: tensor<2x4x1x2xf32>):
    %10 = "arith.constant"() <{value = 0.000000e+00 : f32}> : () -> f32
    %11 = "tensor.empty"() : () -> tensor<6x1x5x2xf32>
    %12 = "linalg.winograd_filter_transform"(%arg2, %11) <{fmr = 1 : i32}> : (tensor<2x3x1x5xf32>, tensor<6x1x5x2xf32>) -> tensor<6x1x5x2xf32>
    %13 = "tensor.empty"() : () -> tensor<6x1x1x1x2x5xf32>
    %14 = "linalg.winograd_input_transform"(%arg1, %13) <{fmr = 1 : i32}> : (tensor<2x6x1x5xf32>, tensor<6x1x1x1x2x5xf32>) -> tensor<6x1x1x1x2x5xf32>
    %15 = "tensor.collapse_shape"(%12) <{reassociation = [[0, 1], [2], [3]]}> : (tensor<6x1x5x2xf32>) -> tensor<6x5x2xf32>
    %16 = "tensor.collapse_shape"(%14) <{reassociation = [[0, 1], [2, 3, 4], [5]]}> : (tensor<6x1x1x1x2x5xf32>) -> tensor<6x2x5xf32>
    %17 = "tensor.empty"() : () -> tensor<6x2x2xf32>
    %18 = "linalg.fill"(%10, %17) <{operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg7: f32, %arg8: f32):
      "linalg.yield"(%arg7) : (f32) -> ()
    }) : (f32, tensor<6x2x2xf32>) -> tensor<6x2x2xf32>
    %19 = "linalg.batch_matmul"(%16, %15, %18) <{indexing_maps = [#map, #map1, #map2], operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg4: f32, %arg5: f32, %arg6: f32):
      %22 = "arith.mulf"(%arg4, %arg5) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      %23 = "arith.addf"(%arg6, %22) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%23) : (f32) -> ()
    }) : (tensor<6x2x5xf32>, tensor<6x5x2xf32>, tensor<6x2x2xf32>) -> tensor<6x2x2xf32>
    %20 = "tensor.expand_shape"(%19) <{reassociation = [[0, 1], [2, 3, 4], [5]], static_output_shape = array<i64: 6, 1, 1, 1, 2, 2>}> : (tensor<6x2x2xf32>) -> tensor<6x1x1x1x2x2xf32>
    %21 = "linalg.winograd_output_transform"(%20, %arg3) <{fmr = 1 : i32}> : (tensor<6x1x1x1x2x2xf32>, tensor<2x4x1x2xf32>) -> tensor<2x4x1x2xf32>
    "func.return"(%21) : (tensor<2x4x1x2xf32>) -> ()
  }) : () -> ()
  "builtin.module"() ({
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg0: !transform.any_op):
      %0 = "transform.structured.match"(%arg0) <{ops = ["linalg.winograd_filter_transform"]}> : (!transform.any_op) -> !transform.any_op
      %1 = "transform.structured.match"(%arg0) <{ops = ["linalg.winograd_input_transform"]}> : (!transform.any_op) -> !transform.any_op
      %2:3 = "transform.structured.tile_using_for"(%1) <{scalable_sizes = array<i1: false, false, false, false, false, false>, static_sizes = array<i64: 0, 0, 1, 1, 0, 0>}> : (!transform.any_op) -> (!transform.any_op, !transform.any_op, !transform.any_op)
      %3 = "transform.structured.match"(%arg0) <{ops = ["linalg.winograd_output_transform"]}> : (!transform.any_op) -> !transform.any_op
      %4:3 = "transform.structured.tile_using_for"(%3) <{scalable_sizes = array<i1: false, false, false, false, false, false>, static_sizes = array<i64: 0, 0, 1, 1, 0, 0>}> : (!transform.any_op) -> (!transform.any_op, !transform.any_op, !transform.any_op)
      %5 = "transform.structured.decompose_winograd_op"(%0) : (!transform.any_op) -> !transform.any_op
      %6 = "transform.structured.match"(%2#0) <{ops = ["linalg.winograd_input_transform"]}> : (!transform.any_op) -> !transform.any_op
      %7 = "transform.structured.decompose_winograd_op"(%6) : (!transform.any_op) -> !transform.any_op
      %8 = "transform.structured.match"(%4#0) <{ops = ["linalg.winograd_output_transform"]}> : (!transform.any_op) -> !transform.any_op
      %9 = "transform.structured.decompose_winograd_op"(%8) : (!transform.any_op) -> !transform.any_op
      "transform.yield"() : () -> ()
    }) : () -> ()
  }) {transform.with_named_sequence} : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1, d2, d3) -> (d0, d1, d3)>
#map1 = affine_map<(d0, d1, d2, d3) -> (d0, d3, d2)>
#map2 = affine_map<(d0, d1, d2, d3) -> (d0, d1, d2)>
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<2x6x2x5xf32>, tensor<2x3x1x5xf32>, tensor<2x4x2x2xf32>) -> tensor<2x4x2x2xf32>, sym_name = "conv2d_mx1_rx1_2"}> ({
  ^bb0(%arg1: tensor<2x6x2x5xf32>, %arg2: tensor<2x3x1x5xf32>, %arg3: tensor<2x4x2x2xf32>):
    %10 = "arith.constant"() <{value = 0.000000e+00 : f32}> : () -> f32
    %11 = "tensor.empty"() : () -> tensor<6x1x5x2xf32>
    %12 = "linalg.winograd_filter_transform"(%arg2, %11) <{fmr = 1 : i32}> : (tensor<2x3x1x5xf32>, tensor<6x1x5x2xf32>) -> tensor<6x1x5x2xf32>
    %13 = "tensor.empty"() : () -> tensor<6x1x1x2x2x5xf32>
    %14 = "linalg.winograd_input_transform"(%arg1, %13) <{fmr = 1 : i32}> : (tensor<2x6x2x5xf32>, tensor<6x1x1x2x2x5xf32>) -> tensor<6x1x1x2x2x5xf32>
    %15 = "tensor.collapse_shape"(%12) <{reassociation = [[0, 1], [2], [3]]}> : (tensor<6x1x5x2xf32>) -> tensor<6x5x2xf32>
    %16 = "tensor.collapse_shape"(%14) <{reassociation = [[0, 1], [2, 3, 4], [5]]}> : (tensor<6x1x1x2x2x5xf32>) -> tensor<6x4x5xf32>
    %17 = "tensor.empty"() : () -> tensor<6x4x2xf32>
    %18 = "linalg.fill"(%10, %17) <{operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg7: f32, %arg8: f32):
      "linalg.yield"(%arg7) : (f32) -> ()
    }) : (f32, tensor<6x4x2xf32>) -> tensor<6x4x2xf32>
    %19 = "linalg.batch_matmul"(%16, %15, %18) <{indexing_maps = [#map, #map1, #map2], operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg4: f32, %arg5: f32, %arg6: f32):
      %22 = "arith.mulf"(%arg4, %arg5) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      %23 = "arith.addf"(%arg6, %22) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%23) : (f32) -> ()
    }) : (tensor<6x4x5xf32>, tensor<6x5x2xf32>, tensor<6x4x2xf32>) -> tensor<6x4x2xf32>
    %20 = "tensor.expand_shape"(%19) <{reassociation = [[0, 1], [2, 3, 4], [5]], static_output_shape = array<i64: 6, 1, 1, 2, 2, 2>}> : (tensor<6x4x2xf32>) -> tensor<6x1x1x2x2x2xf32>
    %21 = "linalg.winograd_output_transform"(%20, %arg3) <{fmr = 1 : i32}> : (tensor<6x1x1x2x2x2xf32>, tensor<2x4x2x2xf32>) -> tensor<2x4x2x2xf32>
    "func.return"(%21) : (tensor<2x4x2x2xf32>) -> ()
  }) : () -> ()
  "builtin.module"() ({
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg0: !transform.any_op):
      %0 = "transform.structured.match"(%arg0) <{ops = ["linalg.winograd_filter_transform"]}> : (!transform.any_op) -> !transform.any_op
      %1 = "transform.structured.match"(%arg0) <{ops = ["linalg.winograd_input_transform"]}> : (!transform.any_op) -> !transform.any_op
      %2:3 = "transform.structured.tile_using_for"(%1) <{scalable_sizes = array<i1: false, false, false, false, false, false>, static_sizes = array<i64: 0, 0, 1, 1, 0, 0>}> : (!transform.any_op) -> (!transform.any_op, !transform.any_op, !transform.any_op)
      %3 = "transform.structured.match"(%arg0) <{ops = ["linalg.winograd_output_transform"]}> : (!transform.any_op) -> !transform.any_op
      %4:3 = "transform.structured.tile_using_for"(%3) <{scalable_sizes = array<i1: false, false, false, false, false, false>, static_sizes = array<i64: 0, 0, 1, 1, 0, 0>}> : (!transform.any_op) -> (!transform.any_op, !transform.any_op, !transform.any_op)
      %5 = "transform.structured.decompose_winograd_op"(%0) : (!transform.any_op) -> !transform.any_op
      %6 = "transform.structured.match"(%2#0) <{ops = ["linalg.winograd_input_transform"]}> : (!transform.any_op) -> !transform.any_op
      %7 = "transform.structured.decompose_winograd_op"(%6) : (!transform.any_op) -> !transform.any_op
      %8 = "transform.structured.match"(%4#0) <{ops = ["linalg.winograd_output_transform"]}> : (!transform.any_op) -> !transform.any_op
      %9 = "transform.structured.decompose_winograd_op"(%8) : (!transform.any_op) -> !transform.any_op
      "transform.yield"() : () -> ()
    }) : () -> ()
  }) {transform.with_named_sequence} : () -> ()
}) : () -> ()

