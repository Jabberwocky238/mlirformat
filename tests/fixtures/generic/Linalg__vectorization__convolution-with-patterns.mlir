#map = affine_map<(d0, d1, d2, d3, d4) -> (d0, d1 * 3 + d3, d4)>
#map1 = affine_map<(d0, d1, d2, d3, d4) -> (d3, d4, d2)>
#map2 = affine_map<(d0, d1, d2, d3, d4) -> (d0, d1, d2)>
"builtin.module"() ({
  "func.func"() <{function_type = (memref<4x6x3xf32>, memref<1x3x8xf32>, memref<4x2x8xf32>) -> (), sym_name = "conv1d_nwc_4x2x8_memref"}> ({
  ^bb0(%arg1: memref<4x6x3xf32>, %arg2: memref<1x3x8xf32>, %arg3: memref<4x2x8xf32>):
    "linalg.conv_1d_nwc_wcf"(%arg1, %arg2, %arg3) <{dilations = dense<1> : tensor<1xi64>, operandSegmentSizes = array<i32: 2, 1>, strides = dense<3> : tensor<1xi64>}> ({
    ^bb0(%arg4: f32, %arg5: f32, %arg6: f32):
      %3 = "arith.mulf"(%arg4, %arg5) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      %4 = "arith.addf"(%arg6, %3) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%4) : (f32) -> ()
    }) {linalg.memoized_indexing_maps = [#map, #map1, #map2]} : (memref<4x6x3xf32>, memref<1x3x8xf32>, memref<4x2x8xf32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "builtin.module"() ({
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg0: !transform.any_op):
      %0 = "transform.structured.match"(%arg0) <{ops = ["linalg.conv_1d_nwc_wcf"]}> : (!transform.any_op) -> !transform.any_op
      %1 = "transform.get_parent_op"(%0) <{isolated_from_above, nth_parent = 1 : i64}> : (!transform.any_op) -> !transform.any_op
      %2 = "transform.structured.vectorize_children_and_apply_patterns"(%1) : (!transform.any_op) -> !transform.any_op
      "transform.yield"() : () -> ()
    }) : () -> ()
  }) {transform.with_named_sequence} : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1, d2, d3, d4) -> (d0, d1 * 3 + d3, d4)>
#map1 = affine_map<(d0, d1, d2, d3, d4) -> (d3, d4, d2)>
#map2 = affine_map<(d0, d1, d2, d3, d4) -> (d0, d1, d2)>
"builtin.module"() ({
  "func.func"() <{function_type = (memref<4x6x3xi1>, memref<1x3x8xi1>, memref<4x2x8xi1>) -> (), sym_name = "conv1d_nwc_4x2x8_memref_i1"}> ({
  ^bb0(%arg1: memref<4x6x3xi1>, %arg2: memref<1x3x8xi1>, %arg3: memref<4x2x8xi1>):
    "linalg.conv_1d_nwc_wcf"(%arg1, %arg2, %arg3) <{dilations = dense<1> : tensor<1xi64>, operandSegmentSizes = array<i32: 2, 1>, strides = dense<3> : tensor<1xi64>}> ({
    ^bb0(%arg4: i1, %arg5: i1, %arg6: i1):
      %3 = "arith.andi"(%arg4, %arg5) : (i1, i1) -> i1
      %4 = "arith.ori"(%arg6, %3) : (i1, i1) -> i1
      "linalg.yield"(%4) : (i1) -> ()
    }) {linalg.memoized_indexing_maps = [#map, #map1, #map2]} : (memref<4x6x3xi1>, memref<1x3x8xi1>, memref<4x2x8xi1>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "builtin.module"() ({
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg0: !transform.any_op):
      %0 = "transform.structured.match"(%arg0) <{ops = ["linalg.conv_1d_nwc_wcf"]}> : (!transform.any_op) -> !transform.any_op
      %1 = "transform.get_parent_op"(%0) <{isolated_from_above, nth_parent = 1 : i64}> : (!transform.any_op) -> !transform.any_op
      %2 = "transform.structured.vectorize_children_and_apply_patterns"(%1) : (!transform.any_op) -> !transform.any_op
      "transform.yield"() : () -> ()
    }) : () -> ()
  }) {transform.with_named_sequence} : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1, d2, d3, d4) -> (d0, d1 * 3 + d3, d4)>
#map1 = affine_map<(d0, d1, d2, d3, d4) -> (d3, d4, d2)>
#map2 = affine_map<(d0, d1, d2, d3, d4) -> (d0, d1, d2)>
"builtin.module"() ({
  "func.func"() <{function_type = (memref<4x6x3xi8>, memref<1x3x8xi8>, memref<4x2x8xi32>) -> (), sym_name = "conv1d_nwc_4x2x8_i8i8i32_memref"}> ({
  ^bb0(%arg1: memref<4x6x3xi8>, %arg2: memref<1x3x8xi8>, %arg3: memref<4x2x8xi32>):
    "linalg.conv_1d_nwc_wcf"(%arg1, %arg2, %arg3) <{dilations = dense<1> : tensor<1xi64>, operandSegmentSizes = array<i32: 2, 1>, strides = dense<3> : tensor<1xi64>}> ({
    ^bb0(%arg4: i8, %arg5: i8, %arg6: i32):
      %3 = "arith.extsi"(%arg4) : (i8) -> i32
      %4 = "arith.extsi"(%arg5) : (i8) -> i32
      %5 = "arith.muli"(%3, %4) <{overflowFlags = #arith.overflow<none>}> : (i32, i32) -> i32
      %6 = "arith.addi"(%arg6, %5) <{overflowFlags = #arith.overflow<none>}> : (i32, i32) -> i32
      "linalg.yield"(%6) : (i32) -> ()
    }) {linalg.memoized_indexing_maps = [#map, #map1, #map2]} : (memref<4x6x3xi8>, memref<1x3x8xi8>, memref<4x2x8xi32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "builtin.module"() ({
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg0: !transform.any_op):
      %0 = "transform.structured.match"(%arg0) <{ops = ["linalg.conv_1d_nwc_wcf"]}> : (!transform.any_op) -> !transform.any_op
      %1 = "transform.get_parent_op"(%0) <{isolated_from_above, nth_parent = 1 : i64}> : (!transform.any_op) -> !transform.any_op
      %2 = "transform.structured.vectorize_children_and_apply_patterns"(%1) : (!transform.any_op) -> !transform.any_op
      "transform.yield"() : () -> ()
    }) : () -> ()
  }) {transform.with_named_sequence} : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1, d2, d3, d4) -> (d0, d1 * 3 + d3 * 2, d4)>
#map1 = affine_map<(d0, d1, d2, d3, d4) -> (d3, d4, d2)>
#map2 = affine_map<(d0, d1, d2, d3, d4) -> (d0, d1, d2)>
"builtin.module"() ({
  "func.func"() <{function_type = (memref<4x6x3xf32>, memref<2x3x8xf32>, memref<4x2x8xf32>) -> (), sym_name = "conv1d_nwc_4x2x8_memref"}> ({
  ^bb0(%arg1: memref<4x6x3xf32>, %arg2: memref<2x3x8xf32>, %arg3: memref<4x2x8xf32>):
    "linalg.conv_1d_nwc_wcf"(%arg1, %arg2, %arg3) <{dilations = dense<2> : tensor<1xi64>, operandSegmentSizes = array<i32: 2, 1>, strides = dense<3> : tensor<1xi64>}> ({
    ^bb0(%arg4: f32, %arg5: f32, %arg6: f32):
      %3 = "arith.mulf"(%arg4, %arg5) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      %4 = "arith.addf"(%arg6, %3) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%4) : (f32) -> ()
    }) {linalg.memoized_indexing_maps = [#map, #map1, #map2]} : (memref<4x6x3xf32>, memref<2x3x8xf32>, memref<4x2x8xf32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "builtin.module"() ({
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg0: !transform.any_op):
      %0 = "transform.structured.match"(%arg0) <{ops = ["linalg.conv_1d_nwc_wcf"]}> : (!transform.any_op) -> !transform.any_op
      %1 = "transform.get_parent_op"(%0) <{isolated_from_above, nth_parent = 1 : i64}> : (!transform.any_op) -> !transform.any_op
      %2 = "transform.structured.vectorize_children_and_apply_patterns"(%1) : (!transform.any_op) -> !transform.any_op
      "transform.yield"() : () -> ()
    }) : () -> ()
  }) {transform.with_named_sequence} : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1, d2, d3, d4) -> (d0, d1 + d3 * 2, d4)>
#map1 = affine_map<(d0, d1, d2, d3, d4) -> (d3, d4, d2)>
#map2 = affine_map<(d0, d1, d2, d3, d4) -> (d0, d1, d2)>
"builtin.module"() ({
  "func.func"() <{function_type = (memref<4x6x3xf32>, memref<2x3x8xf32>, memref<4x2x8xf32>) -> (), sym_name = "conv1d_nwc_4x2x8_memref"}> ({
  ^bb0(%arg1: memref<4x6x3xf32>, %arg2: memref<2x3x8xf32>, %arg3: memref<4x2x8xf32>):
    "linalg.conv_1d_nwc_wcf"(%arg1, %arg2, %arg3) <{dilations = dense<2> : tensor<1xi64>, operandSegmentSizes = array<i32: 2, 1>, strides = dense<1> : tensor<1xi64>}> ({
    ^bb0(%arg4: f32, %arg5: f32, %arg6: f32):
      %3 = "arith.mulf"(%arg4, %arg5) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      %4 = "arith.addf"(%arg6, %3) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%4) : (f32) -> ()
    }) {linalg.memoized_indexing_maps = [#map, #map1, #map2]} : (memref<4x6x3xf32>, memref<2x3x8xf32>, memref<4x2x8xf32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "builtin.module"() ({
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg0: !transform.any_op):
      %0 = "transform.structured.match"(%arg0) <{ops = ["linalg.conv_1d_nwc_wcf"]}> : (!transform.any_op) -> !transform.any_op
      %1 = "transform.get_parent_op"(%0) <{isolated_from_above, nth_parent = 1 : i64}> : (!transform.any_op) -> !transform.any_op
      %2 = "transform.structured.vectorize_children_and_apply_patterns"(%1) : (!transform.any_op) -> !transform.any_op
      "transform.yield"() : () -> ()
    }) : () -> ()
  }) {transform.with_named_sequence} : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1, d2, d3, d4) -> (d0, d3, d2 * 3 + d4)>
#map1 = affine_map<(d0, d1, d2, d3, d4) -> (d1, d3, d4)>
#map2 = affine_map<(d0, d1, d2, d3, d4) -> (d0, d1, d2)>
"builtin.module"() ({
  "func.func"() <{function_type = (memref<4x3x6xf32>, memref<8x3x1xf32>, memref<4x8x2xf32>) -> (), sym_name = "conv1d_ncw_4x8x2_memref"}> ({
  ^bb0(%arg1: memref<4x3x6xf32>, %arg2: memref<8x3x1xf32>, %arg3: memref<4x8x2xf32>):
    "linalg.conv_1d_ncw_fcw"(%arg1, %arg2, %arg3) <{dilations = dense<1> : tensor<1xi64>, operandSegmentSizes = array<i32: 2, 1>, strides = dense<3> : tensor<1xi64>}> ({
    ^bb0(%arg4: f32, %arg5: f32, %arg6: f32):
      %3 = "arith.mulf"(%arg4, %arg5) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      %4 = "arith.addf"(%arg6, %3) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%4) : (f32) -> ()
    }) {linalg.memoized_indexing_maps = [#map, #map1, #map2]} : (memref<4x3x6xf32>, memref<8x3x1xf32>, memref<4x8x2xf32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "builtin.module"() ({
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg0: !transform.any_op):
      %0 = "transform.structured.match"(%arg0) <{ops = ["linalg.conv_1d_ncw_fcw"]}> : (!transform.any_op) -> !transform.any_op
      %1 = "transform.get_parent_op"(%0) <{isolated_from_above, nth_parent = 1 : i64}> : (!transform.any_op) -> !transform.any_op
      %2 = "transform.structured.vectorize_children_and_apply_patterns"(%1) : (!transform.any_op) -> !transform.any_op
      "transform.yield"() : () -> ()
    }) : () -> ()
  }) {transform.with_named_sequence} : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1, d2, d3, d4) -> (d0, d3, d2 * 3 + d4)>
#map1 = affine_map<(d0, d1, d2, d3, d4) -> (d1, d3, d4)>
#map2 = affine_map<(d0, d1, d2, d3, d4) -> (d0, d1, d2)>
"builtin.module"() ({
  "func.func"() <{function_type = (memref<4x3x6xi1>, memref<8x3x1xi1>, memref<4x8x2xi1>) -> (), sym_name = "conv1d_ncw_4x8x2_memref_i1"}> ({
  ^bb0(%arg1: memref<4x3x6xi1>, %arg2: memref<8x3x1xi1>, %arg3: memref<4x8x2xi1>):
    "linalg.conv_1d_ncw_fcw"(%arg1, %arg2, %arg3) <{dilations = dense<1> : tensor<1xi64>, operandSegmentSizes = array<i32: 2, 1>, strides = dense<3> : tensor<1xi64>}> ({
    ^bb0(%arg4: i1, %arg5: i1, %arg6: i1):
      %3 = "arith.andi"(%arg4, %arg5) : (i1, i1) -> i1
      %4 = "arith.ori"(%arg6, %3) : (i1, i1) -> i1
      "linalg.yield"(%4) : (i1) -> ()
    }) {linalg.memoized_indexing_maps = [#map, #map1, #map2]} : (memref<4x3x6xi1>, memref<8x3x1xi1>, memref<4x8x2xi1>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "builtin.module"() ({
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg0: !transform.any_op):
      %0 = "transform.structured.match"(%arg0) <{ops = ["linalg.conv_1d_ncw_fcw"]}> : (!transform.any_op) -> !transform.any_op
      %1 = "transform.get_parent_op"(%0) <{isolated_from_above, nth_parent = 1 : i64}> : (!transform.any_op) -> !transform.any_op
      %2 = "transform.structured.vectorize_children_and_apply_patterns"(%1) : (!transform.any_op) -> !transform.any_op
      "transform.yield"() : () -> ()
    }) : () -> ()
  }) {transform.with_named_sequence} : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1, d2, d3, d4) -> (d0, d3, d2 * 3 + d4 * 2)>
#map1 = affine_map<(d0, d1, d2, d3, d4) -> (d1, d3, d4)>
#map2 = affine_map<(d0, d1, d2, d3, d4) -> (d0, d1, d2)>
"builtin.module"() ({
  "func.func"() <{function_type = (memref<4x3x6xf32>, memref<8x3x2xf32>, memref<4x8x2xf32>) -> (), sym_name = "conv1d_ncw_4x8x2_memref"}> ({
  ^bb0(%arg1: memref<4x3x6xf32>, %arg2: memref<8x3x2xf32>, %arg3: memref<4x8x2xf32>):
    "linalg.conv_1d_ncw_fcw"(%arg1, %arg2, %arg3) <{dilations = dense<2> : tensor<1xi64>, operandSegmentSizes = array<i32: 2, 1>, strides = dense<3> : tensor<1xi64>}> ({
    ^bb0(%arg4: f32, %arg5: f32, %arg6: f32):
      %3 = "arith.mulf"(%arg4, %arg5) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      %4 = "arith.addf"(%arg6, %3) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%4) : (f32) -> ()
    }) {linalg.memoized_indexing_maps = [#map, #map1, #map2]} : (memref<4x3x6xf32>, memref<8x3x2xf32>, memref<4x8x2xf32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "builtin.module"() ({
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg0: !transform.any_op):
      %0 = "transform.structured.match"(%arg0) <{ops = ["linalg.conv_1d_ncw_fcw"]}> : (!transform.any_op) -> !transform.any_op
      %1 = "transform.get_parent_op"(%0) <{isolated_from_above, nth_parent = 1 : i64}> : (!transform.any_op) -> !transform.any_op
      %2 = "transform.structured.vectorize_children_and_apply_patterns"(%1) : (!transform.any_op) -> !transform.any_op
      "transform.yield"() : () -> ()
    }) : () -> ()
  }) {transform.with_named_sequence} : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1, d2, d3, d4) -> (d0, d3, d2 + d4 * 2)>
#map1 = affine_map<(d0, d1, d2, d3, d4) -> (d1, d3, d4)>
#map2 = affine_map<(d0, d1, d2, d3, d4) -> (d0, d1, d2)>
"builtin.module"() ({
  "func.func"() <{function_type = (memref<4x3x6xf32>, memref<8x3x2xf32>, memref<4x8x2xf32>) -> (), sym_name = "conv1d_ncw_4x8x2_memref"}> ({
  ^bb0(%arg1: memref<4x3x6xf32>, %arg2: memref<8x3x2xf32>, %arg3: memref<4x8x2xf32>):
    "linalg.conv_1d_ncw_fcw"(%arg1, %arg2, %arg3) <{dilations = dense<2> : tensor<1xi64>, operandSegmentSizes = array<i32: 2, 1>, strides = dense<1> : tensor<1xi64>}> ({
    ^bb0(%arg4: f32, %arg5: f32, %arg6: f32):
      %3 = "arith.mulf"(%arg4, %arg5) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      %4 = "arith.addf"(%arg6, %3) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%4) : (f32) -> ()
    }) {linalg.memoized_indexing_maps = [#map, #map1, #map2]} : (memref<4x3x6xf32>, memref<8x3x2xf32>, memref<4x8x2xf32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "builtin.module"() ({
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg0: !transform.any_op):
      %0 = "transform.structured.match"(%arg0) <{ops = ["linalg.conv_1d_ncw_fcw"]}> : (!transform.any_op) -> !transform.any_op
      %1 = "transform.get_parent_op"(%0) <{isolated_from_above, nth_parent = 1 : i64}> : (!transform.any_op) -> !transform.any_op
      %2 = "transform.structured.vectorize_children_and_apply_patterns"(%1) : (!transform.any_op) -> !transform.any_op
      "transform.yield"() : () -> ()
    }) : () -> ()
  }) {transform.with_named_sequence} : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1) -> (d0 + d1)>
#map1 = affine_map<(d0, d1) -> (d1)>
#map2 = affine_map<(d0, d1) -> (d0)>
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<11xf32>, tensor<4xf32>, tensor<8xf32>) -> tensor<8xf32>, sym_name = "conv1d_8_tensor"}> ({
  ^bb0(%arg1: tensor<11xf32>, %arg2: tensor<4xf32>, %arg3: tensor<8xf32>):
    %3 = "linalg.conv_1d"(%arg1, %arg2, %arg3) <{operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg4: f32, %arg5: f32, %arg6: f32):
      %4 = "arith.mulf"(%arg4, %arg5) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      %5 = "arith.addf"(%arg6, %4) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%5) : (f32) -> ()
    }) {linalg.memoized_indexing_maps = [#map, #map1, #map2]} : (tensor<11xf32>, tensor<4xf32>, tensor<8xf32>) -> tensor<8xf32>
    "func.return"(%3) : (tensor<8xf32>) -> ()
  }) : () -> ()
  "builtin.module"() ({
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg0: !transform.any_op):
      %0 = "transform.structured.match"(%arg0) <{ops = ["linalg.conv_1d"]}> : (!transform.any_op) -> !transform.any_op
      %1 = "transform.get_parent_op"(%0) <{isolated_from_above, nth_parent = 1 : i64}> : (!transform.any_op) -> !transform.any_op
      %2 = "transform.structured.vectorize_children_and_apply_patterns"(%1) : (!transform.any_op) -> !transform.any_op
      "transform.yield"() : () -> ()
    }) : () -> ()
  }) {transform.with_named_sequence} : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1, d2, d3) -> (d0, d1 + d3 * 2, d2)>
#map1 = affine_map<(d0, d1, d2, d3) -> (d3, d2)>
#map2 = affine_map<(d0, d1, d2, d3) -> (d0, d1, d2)>
"builtin.module"() ({
  "func.func"() <{function_type = (memref<3x5x4xf32>, memref<2x4xf32>, memref<3x2x4xf32>) -> (), sym_name = "depthwise_conv1d_nwc_wc_3x5x4xf32_memref"}> ({
  ^bb0(%arg1: memref<3x5x4xf32>, %arg2: memref<2x4xf32>, %arg3: memref<3x2x4xf32>):
    "linalg.depthwise_conv_1d_nwc_wc"(%arg1, %arg2, %arg3) <{dilations = dense<2> : tensor<1xi64>, operandSegmentSizes = array<i32: 2, 1>, strides = dense<1> : tensor<1xi64>}> ({
    ^bb0(%arg4: f32, %arg5: f32, %arg6: f32):
      %3 = "arith.mulf"(%arg4, %arg5) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      %4 = "arith.addf"(%arg6, %3) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%4) : (f32) -> ()
    }) {linalg.memoized_indexing_maps = [#map, #map1, #map2]} : (memref<3x5x4xf32>, memref<2x4xf32>, memref<3x2x4xf32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "builtin.module"() ({
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg0: !transform.any_op):
      %0 = "transform.structured.match"(%arg0) <{ops = ["linalg.depthwise_conv_1d_nwc_wc"]}> : (!transform.any_op) -> !transform.any_op
      %1 = "transform.get_parent_op"(%0) <{isolated_from_above, nth_parent = 1 : i64}> : (!transform.any_op) -> !transform.any_op
      %2 = "transform.structured.vectorize_children_and_apply_patterns"(%1) : (!transform.any_op) -> !transform.any_op
      "transform.yield"() : () -> ()
    }) : () -> ()
  }) {transform.with_named_sequence} : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1, d2, d3) -> (d0, d1 + d3 * 2, d2)>
#map1 = affine_map<(d0, d1, d2, d3) -> (d3, d2)>
#map2 = affine_map<(d0, d1, d2, d3) -> (d0, d1, d2)>
"builtin.module"() ({
  "func.func"() <{function_type = (memref<3x5x4xi8>, memref<2x4xi8>, memref<3x2x4xi32>) -> (), sym_name = "depthwise_conv1d_nwc_wc_3x5x4xi8_memref"}> ({
  ^bb0(%arg1: memref<3x5x4xi8>, %arg2: memref<2x4xi8>, %arg3: memref<3x2x4xi32>):
    "linalg.depthwise_conv_1d_nwc_wc"(%arg1, %arg2, %arg3) <{dilations = dense<2> : tensor<1xi64>, operandSegmentSizes = array<i32: 2, 1>, strides = dense<1> : tensor<1xi64>}> ({
    ^bb0(%arg4: i8, %arg5: i8, %arg6: i32):
      %3 = "arith.extsi"(%arg4) : (i8) -> i32
      %4 = "arith.extsi"(%arg5) : (i8) -> i32
      %5 = "arith.muli"(%3, %4) <{overflowFlags = #arith.overflow<none>}> : (i32, i32) -> i32
      %6 = "arith.addi"(%arg6, %5) <{overflowFlags = #arith.overflow<none>}> : (i32, i32) -> i32
      "linalg.yield"(%6) : (i32) -> ()
    }) {linalg.memoized_indexing_maps = [#map, #map1, #map2]} : (memref<3x5x4xi8>, memref<2x4xi8>, memref<3x2x4xi32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "builtin.module"() ({
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg0: !transform.any_op):
      %0 = "transform.structured.match"(%arg0) <{ops = ["linalg.depthwise_conv_1d_nwc_wc"]}> : (!transform.any_op) -> !transform.any_op
      %1 = "transform.get_parent_op"(%0) <{isolated_from_above, nth_parent = 1 : i64}> : (!transform.any_op) -> !transform.any_op
      %2 = "transform.structured.vectorize_children_and_apply_patterns"(%1) : (!transform.any_op) -> !transform.any_op
      "transform.yield"() : () -> ()
    }) : () -> ()
  }) {transform.with_named_sequence} : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1, d2, d3, d4) -> (d0, d1 + d3, d4)>
#map1 = affine_map<(d0, d1, d2, d3, d4) -> (d3, d4, d2)>
#map2 = affine_map<(d0, d1, d2, d3, d4) -> (d0, d1, d2)>
"builtin.module"() ({
  "func.func"() <{function_type = (memref<1x2x3xf16>, memref<1x3x2xf16>, memref<1x2x2xf32>) -> (), sym_name = "conv_1d_nwc_wcf_mixed_type_memref"}> ({
  ^bb0(%arg1: memref<1x2x3xf16>, %arg2: memref<1x3x2xf16>, %arg3: memref<1x2x2xf32>):
    "linalg.conv_1d_nwc_wcf"(%arg1, %arg2, %arg3) <{dilations = dense<1> : vector<1xi64>, operandSegmentSizes = array<i32: 2, 1>, strides = dense<1> : vector<1xi64>}> ({
    ^bb0(%arg4: f16, %arg5: f16, %arg6: f32):
      %3 = "arith.extf"(%arg4) : (f16) -> f32
      %4 = "arith.extf"(%arg5) : (f16) -> f32
      %5 = "arith.mulf"(%3, %4) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      %6 = "arith.addf"(%arg6, %5) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%6) : (f32) -> ()
    }) {linalg.memoized_indexing_maps = [#map, #map1, #map2]} : (memref<1x2x3xf16>, memref<1x3x2xf16>, memref<1x2x2xf32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "builtin.module"() ({
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg0: !transform.any_op):
      %0 = "transform.structured.match"(%arg0) <{ops = ["linalg.conv_1d_nwc_wcf"]}> : (!transform.any_op) -> !transform.any_op
      %1 = "transform.get_parent_op"(%0) <{isolated_from_above, nth_parent = 1 : i64}> : (!transform.any_op) -> !transform.any_op
      %2 = "transform.structured.vectorize_children_and_apply_patterns"(%1) : (!transform.any_op) -> !transform.any_op
      "transform.yield"() : () -> ()
    }) : () -> ()
  }) {transform.with_named_sequence} : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1, d2, d3, d4) -> (d0, d1 + d3, d4)>
#map1 = affine_map<(d0, d1, d2, d3, d4) -> (d3, d4, d2)>
#map2 = affine_map<(d0, d1, d2, d3, d4) -> (d0, d1, d2)>
"builtin.module"() ({
  "func.func"() <{function_type = (memref<1x2x3xi8>, memref<1x3x2xi8>, memref<1x2x2xf32>) -> (), sym_name = "conv_1d_nwc_wcf_mixed_int_fp_memref"}> ({
  ^bb0(%arg1: memref<1x2x3xi8>, %arg2: memref<1x3x2xi8>, %arg3: memref<1x2x2xf32>):
    "linalg.conv_1d_nwc_wcf"(%arg1, %arg2, %arg3) <{dilations = dense<1> : vector<1xi64>, operandSegmentSizes = array<i32: 2, 1>, strides = dense<1> : vector<1xi64>}> ({
    ^bb0(%arg4: i8, %arg5: i8, %arg6: f32):
      %3 = "arith.sitofp"(%arg4) : (i8) -> f32
      %4 = "arith.sitofp"(%arg5) : (i8) -> f32
      %5 = "arith.mulf"(%3, %4) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      %6 = "arith.addf"(%arg6, %5) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%6) : (f32) -> ()
    }) {linalg.memoized_indexing_maps = [#map, #map1, #map2]} : (memref<1x2x3xi8>, memref<1x3x2xi8>, memref<1x2x2xf32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "builtin.module"() ({
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg0: !transform.any_op):
      %0 = "transform.structured.match"(%arg0) <{ops = ["linalg.conv_1d_nwc_wcf"]}> : (!transform.any_op) -> !transform.any_op
      %1 = "transform.get_parent_op"(%0) <{isolated_from_above, nth_parent = 1 : i64}> : (!transform.any_op) -> !transform.any_op
      %2 = "transform.structured.vectorize_children_and_apply_patterns"(%1) : (!transform.any_op) -> !transform.any_op
      "transform.yield"() : () -> ()
    }) : () -> ()
  }) {transform.with_named_sequence} : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1, d2, d3) -> (d0, d1 * 3 + d3, d2)>
#map1 = affine_map<(d0, d1, d2, d3) -> (d3)>
#map2 = affine_map<(d0, d1, d2, d3) -> (d0, d1, d2)>
"builtin.module"() ({
  "func.func"() <{function_type = (memref<4x4x3xf32>, memref<1xf32>, memref<4x2x3xf32>) -> (), sym_name = "pooling_nwc_sum_memref_1_2_1_3"}> ({
  ^bb0(%arg1: memref<4x4x3xf32>, %arg2: memref<1xf32>, %arg3: memref<4x2x3xf32>):
    "linalg.pooling_nwc_sum"(%arg1, %arg2, %arg3) <{dilations = dense<1> : tensor<1xi64>, operandSegmentSizes = array<i32: 2, 1>, strides = dense<3> : tensor<1xi64>}> ({
    ^bb0(%arg4: f32, %arg5: f32, %arg6: f32):
      %3 = "arith.addf"(%arg6, %arg4) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%3) : (f32) -> ()
    }) {linalg.memoized_indexing_maps = [#map, #map1, #map2]} : (memref<4x4x3xf32>, memref<1xf32>, memref<4x2x3xf32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "builtin.module"() ({
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg0: !transform.any_op):
      %0 = "transform.structured.match"(%arg0) <{ops = ["linalg.pooling_nwc_sum"]}> : (!transform.any_op) -> !transform.any_op
      %1 = "transform.get_parent_op"(%0) <{isolated_from_above, nth_parent = 1 : i64}> : (!transform.any_op) -> !transform.any_op
      %2 = "transform.structured.vectorize_children_and_apply_patterns"(%1) : (!transform.any_op) -> !transform.any_op
      "transform.yield"() : () -> ()
    }) : () -> ()
  }) {transform.with_named_sequence} : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1, d2, d3) -> (d0, d1 * 3 + d3, d2)>
#map1 = affine_map<(d0, d1, d2, d3) -> (d3)>
#map2 = affine_map<(d0, d1, d2, d3) -> (d0, d1, d2)>
"builtin.module"() ({
  "func.func"() <{function_type = (memref<4x4x3xf32>, memref<1xf32>, memref<4x2x3xf32>) -> (), sym_name = "pooling_nwc_max_memref_1_2_1_3"}> ({
  ^bb0(%arg1: memref<4x4x3xf32>, %arg2: memref<1xf32>, %arg3: memref<4x2x3xf32>):
    "linalg.pooling_nwc_max"(%arg1, %arg2, %arg3) <{dilations = dense<1> : tensor<1xi64>, operandSegmentSizes = array<i32: 2, 1>, strides = dense<3> : tensor<1xi64>}> ({
    ^bb0(%arg4: f32, %arg5: f32, %arg6: f32):
      %3 = "arith.maximumf"(%arg6, %arg4) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%3) : (f32) -> ()
    }) {linalg.memoized_indexing_maps = [#map, #map1, #map2]} : (memref<4x4x3xf32>, memref<1xf32>, memref<4x2x3xf32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "builtin.module"() ({
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg0: !transform.any_op):
      %0 = "transform.structured.match"(%arg0) <{ops = ["linalg.pooling_nwc_max"]}> : (!transform.any_op) -> !transform.any_op
      %1 = "transform.get_parent_op"(%0) <{isolated_from_above, nth_parent = 1 : i64}> : (!transform.any_op) -> !transform.any_op
      %2 = "transform.structured.vectorize_children_and_apply_patterns"(%1) : (!transform.any_op) -> !transform.any_op
      "transform.yield"() : () -> ()
    }) : () -> ()
  }) {transform.with_named_sequence} : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1, d2, d3) -> (d0, d1 * 3 + d3, d2)>
#map1 = affine_map<(d0, d1, d2, d3) -> (d3)>
#map2 = affine_map<(d0, d1, d2, d3) -> (d0, d1, d2)>
"builtin.module"() ({
  "func.func"() <{function_type = (memref<4x4x3xi8>, memref<1xi8>, memref<4x2x3xi32>) -> (), sym_name = "pooling_nwc_sum_i8i8i32_memref_1_2_1_3"}> ({
  ^bb0(%arg1: memref<4x4x3xi8>, %arg2: memref<1xi8>, %arg3: memref<4x2x3xi32>):
    "linalg.pooling_nwc_sum"(%arg1, %arg2, %arg3) <{dilations = dense<1> : tensor<1xi64>, operandSegmentSizes = array<i32: 2, 1>, strides = dense<3> : tensor<1xi64>}> ({
    ^bb0(%arg4: i8, %arg5: i8, %arg6: i32):
      %3 = "arith.extsi"(%arg4) : (i8) -> i32
      %4 = "arith.addi"(%arg6, %3) <{overflowFlags = #arith.overflow<none>}> : (i32, i32) -> i32
      "linalg.yield"(%4) : (i32) -> ()
    }) {linalg.memoized_indexing_maps = [#map, #map1, #map2]} : (memref<4x4x3xi8>, memref<1xi8>, memref<4x2x3xi32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "builtin.module"() ({
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg0: !transform.any_op):
      %0 = "transform.structured.match"(%arg0) <{ops = ["linalg.pooling_nwc_sum"]}> : (!transform.any_op) -> !transform.any_op
      %1 = "transform.get_parent_op"(%0) <{isolated_from_above, nth_parent = 1 : i64}> : (!transform.any_op) -> !transform.any_op
      %2 = "transform.structured.vectorize_children_and_apply_patterns"(%1) : (!transform.any_op) -> !transform.any_op
      "transform.yield"() : () -> ()
    }) : () -> ()
  }) {transform.with_named_sequence} : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1, d2, d3) -> (d0, d1 * 3 + d3, d2)>
#map1 = affine_map<(d0, d1, d2, d3) -> (d3)>
#map2 = affine_map<(d0, d1, d2, d3) -> (d0, d1, d2)>
"builtin.module"() ({
  "func.func"() <{function_type = (memref<4x4x3xi8>, memref<1xi8>, memref<4x2x3xi32>) -> (), sym_name = "pooling_nwc_max_i8i8i32_memref_1_2_1_3"}> ({
  ^bb0(%arg1: memref<4x4x3xi8>, %arg2: memref<1xi8>, %arg3: memref<4x2x3xi32>):
    "linalg.pooling_nwc_max"(%arg1, %arg2, %arg3) <{dilations = dense<1> : tensor<1xi64>, operandSegmentSizes = array<i32: 2, 1>, strides = dense<3> : tensor<1xi64>}> ({
    ^bb0(%arg4: i8, %arg5: i8, %arg6: i32):
      %3 = "arith.extsi"(%arg4) : (i8) -> i32
      %4 = "arith.maxsi"(%arg6, %3) : (i32, i32) -> i32
      "linalg.yield"(%4) : (i32) -> ()
    }) {linalg.memoized_indexing_maps = [#map, #map1, #map2]} : (memref<4x4x3xi8>, memref<1xi8>, memref<4x2x3xi32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "builtin.module"() ({
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg0: !transform.any_op):
      %0 = "transform.structured.match"(%arg0) <{ops = ["linalg.pooling_nwc_max"]}> : (!transform.any_op) -> !transform.any_op
      %1 = "transform.get_parent_op"(%0) <{isolated_from_above, nth_parent = 1 : i64}> : (!transform.any_op) -> !transform.any_op
      %2 = "transform.structured.vectorize_children_and_apply_patterns"(%1) : (!transform.any_op) -> !transform.any_op
      "transform.yield"() : () -> ()
    }) : () -> ()
  }) {transform.with_named_sequence} : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1, d2, d3) -> (d0, d1 * 3 + d3 * 2, d2)>
#map1 = affine_map<(d0, d1, d2, d3) -> (d3)>
#map2 = affine_map<(d0, d1, d2, d3) -> (d0, d1, d2)>
"builtin.module"() ({
  "func.func"() <{function_type = (memref<4x6x3xf32>, memref<2xf32>, memref<4x2x3xf32>) -> (), sym_name = "pooling_nwc_sum_memref_2_2_2_3"}> ({
  ^bb0(%arg1: memref<4x6x3xf32>, %arg2: memref<2xf32>, %arg3: memref<4x2x3xf32>):
    "linalg.pooling_nwc_sum"(%arg1, %arg2, %arg3) <{dilations = dense<2> : tensor<1xi64>, operandSegmentSizes = array<i32: 2, 1>, strides = dense<3> : tensor<1xi64>}> ({
    ^bb0(%arg4: f32, %arg5: f32, %arg6: f32):
      %3 = "arith.addf"(%arg6, %arg4) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%3) : (f32) -> ()
    }) {linalg.memoized_indexing_maps = [#map, #map1, #map2]} : (memref<4x6x3xf32>, memref<2xf32>, memref<4x2x3xf32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "builtin.module"() ({
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg0: !transform.any_op):
      %0 = "transform.structured.match"(%arg0) <{ops = ["linalg.pooling_nwc_sum"]}> : (!transform.any_op) -> !transform.any_op
      %1 = "transform.get_parent_op"(%0) <{isolated_from_above, nth_parent = 1 : i64}> : (!transform.any_op) -> !transform.any_op
      %2 = "transform.structured.vectorize_children_and_apply_patterns"(%1) : (!transform.any_op) -> !transform.any_op
      "transform.yield"() : () -> ()
    }) : () -> ()
  }) {transform.with_named_sequence} : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1, d2, d3) -> (d0, d1, d2 * 3 + d3)>
#map1 = affine_map<(d0, d1, d2, d3) -> (d3)>
#map2 = affine_map<(d0, d1, d2, d3) -> (d0, d1, d2)>
"builtin.module"() ({
  "func.func"() <{function_type = (memref<4x3x4xf32>, memref<1xf32>, memref<4x3x2xf32>) -> (), sym_name = "pooling_ncw_sum_memref_1_2_1_3"}> ({
  ^bb0(%arg1: memref<4x3x4xf32>, %arg2: memref<1xf32>, %arg3: memref<4x3x2xf32>):
    "linalg.pooling_ncw_sum"(%arg1, %arg2, %arg3) <{dilations = dense<1> : tensor<1xi64>, operandSegmentSizes = array<i32: 2, 1>, strides = dense<3> : tensor<1xi64>}> ({
    ^bb0(%arg4: f32, %arg5: f32, %arg6: f32):
      %3 = "arith.addf"(%arg6, %arg4) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%3) : (f32) -> ()
    }) {linalg.memoized_indexing_maps = [#map, #map1, #map2]} : (memref<4x3x4xf32>, memref<1xf32>, memref<4x3x2xf32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "builtin.module"() ({
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg0: !transform.any_op):
      %0 = "transform.structured.match"(%arg0) <{ops = ["linalg.pooling_ncw_sum"]}> : (!transform.any_op) -> !transform.any_op
      %1 = "transform.get_parent_op"(%0) <{isolated_from_above, nth_parent = 1 : i64}> : (!transform.any_op) -> !transform.any_op
      %2 = "transform.structured.vectorize_children_and_apply_patterns"(%1) : (!transform.any_op) -> !transform.any_op
      "transform.yield"() : () -> ()
    }) : () -> ()
  }) {transform.with_named_sequence} : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1, d2, d3) -> (d0, d1 + d3, d2)>
#map1 = affine_map<(d0, d1, d2, d3) -> (d3)>
#map2 = affine_map<(d0, d1, d2, d3) -> (d0, d1, d2)>
"builtin.module"() ({
  "func.func"() <{function_type = (memref<1x2x3xf16>, memref<1xf16>, memref<1x2x3xf32>) -> (), sym_name = "pooling_nwc_sum_mixed_type_memref_1_2_1_1"}> ({
  ^bb0(%arg1: memref<1x2x3xf16>, %arg2: memref<1xf16>, %arg3: memref<1x2x3xf32>):
    "linalg.pooling_nwc_sum"(%arg1, %arg2, %arg3) <{dilations = dense<1> : vector<1xi64>, operandSegmentSizes = array<i32: 2, 1>, strides = dense<1> : vector<1xi64>}> ({
    ^bb0(%arg4: f16, %arg5: f16, %arg6: f32):
      %3 = "arith.extf"(%arg4) : (f16) -> f32
      %4 = "arith.addf"(%arg6, %3) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%4) : (f32) -> ()
    }) {linalg.memoized_indexing_maps = [#map, #map1, #map2]} : (memref<1x2x3xf16>, memref<1xf16>, memref<1x2x3xf32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "builtin.module"() ({
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg0: !transform.any_op):
      %0 = "transform.structured.match"(%arg0) <{ops = ["linalg.pooling_nwc_sum"]}> : (!transform.any_op) -> !transform.any_op
      %1 = "transform.get_parent_op"(%0) <{isolated_from_above, nth_parent = 1 : i64}> : (!transform.any_op) -> !transform.any_op
      %2 = "transform.structured.vectorize_children_and_apply_patterns"(%1) : (!transform.any_op) -> !transform.any_op
      "transform.yield"() : () -> ()
    }) : () -> ()
  }) {transform.with_named_sequence} : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1, d2, d3) -> (d0, d1 + d3 * 2, d2)>
#map1 = affine_map<(d0, d1, d2, d3) -> (d3)>
#map2 = affine_map<(d0, d1, d2, d3) -> (d0, d1, d2)>
"builtin.module"() ({
  "func.func"() <{function_type = (memref<4x4x3xf32>, memref<2xf32>, memref<4x2x3xf32>) -> (), sym_name = "pooling_nwc_sum_memref_2_2_2_1"}> ({
  ^bb0(%arg1: memref<4x4x3xf32>, %arg2: memref<2xf32>, %arg3: memref<4x2x3xf32>):
    "linalg.pooling_nwc_sum"(%arg1, %arg2, %arg3) <{dilations = dense<2> : tensor<1xi64>, operandSegmentSizes = array<i32: 2, 1>, strides = dense<1> : tensor<1xi64>}> ({
    ^bb0(%arg4: f32, %arg5: f32, %arg6: f32):
      %3 = "arith.addf"(%arg6, %arg4) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%3) : (f32) -> ()
    }) {linalg.memoized_indexing_maps = [#map, #map1, #map2]} : (memref<4x4x3xf32>, memref<2xf32>, memref<4x2x3xf32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "builtin.module"() ({
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg0: !transform.any_op):
      %0 = "transform.structured.match"(%arg0) <{ops = ["linalg.pooling_nwc_sum"]}> : (!transform.any_op) -> !transform.any_op
      %1 = "transform.get_parent_op"(%0) <{isolated_from_above, nth_parent = 1 : i64}> : (!transform.any_op) -> !transform.any_op
      %2 = "transform.structured.vectorize_children_and_apply_patterns"(%1) : (!transform.any_op) -> !transform.any_op
      "transform.yield"() : () -> ()
    }) : () -> ()
  }) {transform.with_named_sequence} : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1, d2, d3) -> (d0, d1, d2 * 3 + d3 * 2)>
#map1 = affine_map<(d0, d1, d2, d3) -> (d3)>
#map2 = affine_map<(d0, d1, d2, d3) -> (d0, d1, d2)>
"builtin.module"() ({
  "func.func"() <{function_type = (memref<4x3x6xf32>, memref<2xf32>, memref<4x3x2xf32>) -> (), sym_name = "pooling_ncw_sum_memref_2_2_2_3"}> ({
  ^bb0(%arg1: memref<4x3x6xf32>, %arg2: memref<2xf32>, %arg3: memref<4x3x2xf32>):
    "linalg.pooling_ncw_sum"(%arg1, %arg2, %arg3) <{dilations = dense<2> : tensor<1xi64>, operandSegmentSizes = array<i32: 2, 1>, strides = dense<3> : tensor<1xi64>}> ({
    ^bb0(%arg4: f32, %arg5: f32, %arg6: f32):
      %3 = "arith.addf"(%arg6, %arg4) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%3) : (f32) -> ()
    }) {linalg.memoized_indexing_maps = [#map, #map1, #map2]} : (memref<4x3x6xf32>, memref<2xf32>, memref<4x3x2xf32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "builtin.module"() ({
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg0: !transform.any_op):
      %0 = "transform.structured.match"(%arg0) <{ops = ["linalg.pooling_ncw_sum"]}> : (!transform.any_op) -> !transform.any_op
      %1 = "transform.get_parent_op"(%0) <{isolated_from_above, nth_parent = 1 : i64}> : (!transform.any_op) -> !transform.any_op
      %2 = "transform.structured.vectorize_children_and_apply_patterns"(%1) : (!transform.any_op) -> !transform.any_op
      "transform.yield"() : () -> ()
    }) : () -> ()
  }) {transform.with_named_sequence} : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1, d2, d3) -> (d0, d1, d2 + d3 * 2)>
#map1 = affine_map<(d0, d1, d2, d3) -> (d3)>
#map2 = affine_map<(d0, d1, d2, d3) -> (d0, d1, d2)>
"builtin.module"() ({
  "func.func"() <{function_type = (memref<4x2x5xf32>, memref<2xf32>, memref<4x2x3xf32>) -> (), sym_name = "pooling_ncw_sum_memref_2_3_2_1"}> ({
  ^bb0(%arg1: memref<4x2x5xf32>, %arg2: memref<2xf32>, %arg3: memref<4x2x3xf32>):
    "linalg.pooling_ncw_sum"(%arg1, %arg2, %arg3) <{dilations = dense<2> : tensor<1xi64>, operandSegmentSizes = array<i32: 2, 1>, strides = dense<1> : tensor<1xi64>}> ({
    ^bb0(%arg4: f32, %arg5: f32, %arg6: f32):
      %3 = "arith.addf"(%arg6, %arg4) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%3) : (f32) -> ()
    }) {linalg.memoized_indexing_maps = [#map, #map1, #map2]} : (memref<4x2x5xf32>, memref<2xf32>, memref<4x2x3xf32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "builtin.module"() ({
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg0: !transform.any_op):
      %0 = "transform.structured.match"(%arg0) <{ops = ["linalg.pooling_ncw_sum"]}> : (!transform.any_op) -> !transform.any_op
      %1 = "transform.get_parent_op"(%0) <{isolated_from_above, nth_parent = 1 : i64}> : (!transform.any_op) -> !transform.any_op
      %2 = "transform.structured.vectorize_children_and_apply_patterns"(%1) : (!transform.any_op) -> !transform.any_op
      "transform.yield"() : () -> ()
    }) : () -> ()
  }) {transform.with_named_sequence} : () -> ()
}) : () -> ()

