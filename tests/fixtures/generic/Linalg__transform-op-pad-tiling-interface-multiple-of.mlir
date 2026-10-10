#map = affine_map<(d0, d1, d2) -> (d0, d2)>
#map1 = affine_map<(d0, d1, d2) -> (d2, d1)>
#map2 = affine_map<(d0, d1, d2) -> (d0, d1)>
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<24x12xf32>, tensor<12x25xf32>, tensor<24x25xf32>) -> tensor<24x25xf32>, sym_name = "pad_lhs"}> ({
  ^bb0(%arg1: tensor<24x12xf32>, %arg2: tensor<12x25xf32>, %arg3: tensor<24x25xf32>):
    %3 = "linalg.matmul"(%arg1, %arg2, %arg3) <{indexing_maps = [#map, #map1, #map2], operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg4: f32, %arg5: f32, %arg6: f32):
      %4 = "arith.mulf"(%arg4, %arg5) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      %5 = "arith.addf"(%arg6, %4) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%5) : (f32) -> ()
    }) : (tensor<24x12xf32>, tensor<12x25xf32>, tensor<24x25xf32>) -> tensor<24x25xf32>
    "func.return"(%3) : (tensor<24x25xf32>) -> ()
  }) : () -> ()
  "builtin.module"() ({
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg0: !transform.any_op):
      %0 = "transform.structured.match"(%arg0) <{ops = ["linalg.matmul"]}> : (!transform.any_op) -> !transform.any_op
      %1:2 = "transform.structured.tile_using_for"(%0) <{scalable_sizes = array<i1: false>, static_sizes = array<i64: 5>}> : (!transform.any_op) -> (!transform.any_op, !transform.any_op)
      %2:2 = "transform.structured.pad_tiling_interface"(%1#0) <{pad_to_multiple_of, padding_values = [0.000000e+00 : f32, 0.000000e+00 : f32, 0.000000e+00 : f32], static_padding_sizes = array<i64: 8>}> : (!transform.any_op) -> (!transform.any_op, !transform.any_op)
      "transform.yield"() : () -> ()
    }) : () -> ()
  }) {transform.with_named_sequence} : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1, d2) -> (d0, d1)>
#map1 = affine_map<(d0, d1, d2) -> (d0, d2, d0 + d1)>
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<7x5xf32>, tensor<7x11x11xf32>) -> tensor<7x11x11xf32>, sym_name = "generic"}> ({
  ^bb0(%arg1: tensor<7x5xf32>, %arg2: tensor<7x11x11xf32>):
    %2 = "linalg.generic"(%arg1, %arg2) <{indexing_maps = [#map, #map1], iterator_types = [#linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>, #linalg.iterator_type<reduction>], operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg3: f32, %arg4: f32):
      "linalg.yield"(%arg3) : (f32) -> ()
    }) : (tensor<7x5xf32>, tensor<7x11x11xf32>) -> tensor<7x11x11xf32>
    "func.return"(%2) : (tensor<7x11x11xf32>) -> ()
  }) : () -> ()
  "builtin.module"() ({
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg0: !transform.any_op):
      %0 = "transform.structured.match"(%arg0) <{ops = ["linalg.generic"]}> : (!transform.any_op) -> !transform.any_op
      %1:2 = "transform.structured.pad_tiling_interface"(%0) <{pad_to_multiple_of, padding_values = [0.000000e+00 : f32, 0.000000e+00 : f32, 0.000000e+00 : f32], static_padding_sizes = array<i64: 3, 0, 5>}> : (!transform.any_op) -> (!transform.any_op, !transform.any_op)
      "transform.yield"() : () -> ()
    }) : () -> ()
  }) {transform.with_named_sequence} : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1, d2) -> (d0, d1)>
#map1 = affine_map<(d0, d1, d2) -> (d0, d2, d0 + d1)>
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<?x5xf32>, tensor<?x11x?xf32>) -> tensor<?x11x?xf32>, sym_name = "generic"}> ({
  ^bb0(%arg1: tensor<?x5xf32>, %arg2: tensor<?x11x?xf32>):
    %2 = "linalg.generic"(%arg1, %arg2) <{indexing_maps = [#map, #map1], iterator_types = [#linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>, #linalg.iterator_type<reduction>], operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg3: f32, %arg4: f32):
      "linalg.yield"(%arg3) : (f32) -> ()
    }) : (tensor<?x5xf32>, tensor<?x11x?xf32>) -> tensor<?x11x?xf32>
    "func.return"(%2) : (tensor<?x11x?xf32>) -> ()
  }) : () -> ()
  "builtin.module"() ({
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg0: !transform.any_op):
      %0 = "transform.structured.match"(%arg0) <{ops = ["linalg.generic"]}> : (!transform.any_op) -> !transform.any_op
      %1:2 = "transform.structured.pad_tiling_interface"(%0) <{pad_to_multiple_of, padding_values = [0.000000e+00 : f32, 0.000000e+00 : f32, 0.000000e+00 : f32], static_padding_sizes = array<i64: 3, 0, 5>}> : (!transform.any_op) -> (!transform.any_op, !transform.any_op)
      "transform.yield"() : () -> ()
    }) : () -> ()
  }) {transform.with_named_sequence} : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1, d2) -> (d0, d2)>
#map1 = affine_map<(d0, d1, d2) -> (d2, d1)>
#map2 = affine_map<(d0, d1, d2) -> (d0, d1)>
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<24x?xf32>, tensor<?x25xf32>, tensor<24x25xf32>) -> tensor<24x25xf32>, sym_name = "pad_lhs"}> ({
  ^bb0(%arg1: tensor<24x?xf32>, %arg2: tensor<?x25xf32>, %arg3: tensor<24x25xf32>):
    %6 = "linalg.matmul"(%arg1, %arg2, %arg3) <{indexing_maps = [#map, #map1, #map2], operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg4: f32, %arg5: f32, %arg6: f32):
      %7 = "arith.mulf"(%arg4, %arg5) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      %8 = "arith.addf"(%arg6, %7) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%8) : (f32) -> ()
    }) : (tensor<24x?xf32>, tensor<?x25xf32>, tensor<24x25xf32>) -> tensor<24x25xf32>
    "func.return"(%6) : (tensor<24x25xf32>) -> ()
  }) : () -> ()
  "builtin.module"() ({
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg0: !transform.any_op):
      %0 = "transform.structured.match"(%arg0) <{ops = ["linalg.matmul"]}> : (!transform.any_op) -> !transform.any_op
      %1:2 = "transform.structured.pad_tiling_interface"(%0) <{pad_to_multiple_of, padding_values = [0.000000e+00 : f32, 0.000000e+00 : f32, 0.000000e+00 : f32], static_padding_sizes = array<i64: 8, 0, 16>}> : (!transform.any_op) -> (!transform.any_op, !transform.any_op)
      %2:3 = "transform.structured.tile_using_for"(%1#0) <{scalable_sizes = array<i1: false, false, false>, static_sizes = array<i64: 8, 0, 16>}> : (!transform.any_op) -> (!transform.any_op, !transform.any_op, !transform.any_op)
      %3 = "transform.structured.match"(%arg0) <{ops = ["func.func"]}> : (!transform.any_op) -> !transform.any_op
      %4 = "transform.apply_registered_pass"(%3) <{options = {}, pass_name = "resolve-shaped-type-result-dims"}> : (!transform.any_op) -> !transform.any_op
      "transform.apply_patterns"(%4) <{apply_cse, max_iterations = -1 : i64, max_num_rewrites = -1 : i64}> ({
        "transform.apply_patterns.canonicalization"() : () -> ()
      }) : (!transform.any_op) -> ()
      %5 = "transform.structured.match"(%arg0) <{ops = ["affine.min", "affine.max"]}> : (!transform.any_op) -> !transform.any_op
      "transform.affine.simplify_min_max_affine_ops"(%5) : (!transform.any_op) -> ()
      "transform.apply_patterns"(%4) <{apply_cse, max_iterations = -1 : i64, max_num_rewrites = -1 : i64}> ({
        "transform.apply_patterns.canonicalization"() : () -> ()
      }) : (!transform.any_op) -> ()
      "transform.yield"() : () -> ()
    }) : () -> ()
  }) {transform.with_named_sequence} : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1, d2) -> (d0, d2)>
#map1 = affine_map<(d0, d1, d2) -> (d2, d1)>
#map2 = affine_map<(d0, d1, d2) -> (d0, d1)>
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<24x?xf32>, tensor<?x25xf32>, tensor<24x25xf32>) -> tensor<24x25xf32>, sym_name = "pad_lhs"}> ({
  ^bb0(%arg1: tensor<24x?xf32>, %arg2: tensor<?x25xf32>, %arg3: tensor<24x25xf32>):
    %3 = "linalg.matmul"(%arg1, %arg2, %arg3) <{indexing_maps = [#map, #map1, #map2], operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg4: f32, %arg5: f32, %arg6: f32):
      %4 = "arith.mulf"(%arg4, %arg5) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      %5 = "arith.addf"(%arg6, %4) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%5) : (f32) -> ()
    }) : (tensor<24x?xf32>, tensor<?x25xf32>, tensor<24x25xf32>) -> tensor<24x25xf32>
    "func.return"(%3) : (tensor<24x25xf32>) -> ()
  }) : () -> ()
  "builtin.module"() ({
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg0: !transform.any_op):
      %0 = "transform.structured.match"(%arg0) <{ops = ["linalg.matmul"]}> : (!transform.any_op) -> !transform.any_op
      %1:3 = "transform.structured.tile_using_for"(%0) <{scalable_sizes = array<i1: false, false, false>, static_sizes = array<i64: 8, 0, 16>}> : (!transform.any_op) -> (!transform.any_op, !transform.any_op, !transform.any_op)
      %2:2 = "transform.structured.pad_tiling_interface"(%1#0) <{pad_to_multiple_of, padding_values = [0.000000e+00 : f32, 0.000000e+00 : f32, 0.000000e+00 : f32], static_padding_sizes = array<i64: 8, 0, 16>}> : (!transform.any_op) -> (!transform.any_op, !transform.any_op)
      "transform.yield"() : () -> ()
    }) : () -> ()
  }) {transform.with_named_sequence} : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1, d2) -> (d0, d2)>
#map1 = affine_map<(d0, d1, d2) -> (d2, d1)>
#map2 = affine_map<(d0, d1, d2) -> (d0, d1)>
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<20x?xf32>, tensor<?x25xf32>, tensor<20x25xf32>) -> tensor<20x25xf32>, sym_name = "pad_lhs"}> ({
  ^bb0(%arg1: tensor<20x?xf32>, %arg2: tensor<?x25xf32>, %arg3: tensor<20x25xf32>):
    %3 = "linalg.matmul"(%arg1, %arg2, %arg3) <{indexing_maps = [#map, #map1, #map2], operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg4: f32, %arg5: f32, %arg6: f32):
      %4 = "arith.mulf"(%arg4, %arg5) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      %5 = "arith.addf"(%arg6, %4) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%5) : (f32) -> ()
    }) : (tensor<20x?xf32>, tensor<?x25xf32>, tensor<20x25xf32>) -> tensor<20x25xf32>
    "func.return"(%3) : (tensor<20x25xf32>) -> ()
  }) : () -> ()
  "builtin.module"() ({
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg0: !transform.any_op):
      %0 = "transform.structured.match"(%arg0) <{ops = ["linalg.matmul"]}> : (!transform.any_op) -> !transform.any_op
      %1:3 = "transform.structured.tile_using_for"(%0) <{scalable_sizes = array<i1: false, false, false>, static_sizes = array<i64: 8, 0, 16>}> : (!transform.any_op) -> (!transform.any_op, !transform.any_op, !transform.any_op)
      %2:2 = "transform.structured.pad_tiling_interface"(%1#0) <{pad_to_multiple_of, padding_values = [0.000000e+00 : f32, 0.000000e+00 : f32, 0.000000e+00 : f32], static_padding_sizes = array<i64: 8, 0, 16>}> : (!transform.any_op) -> (!transform.any_op, !transform.any_op)
      "transform.yield"() : () -> ()
    }) : () -> ()
  }) {transform.with_named_sequence} : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1, d2, d3, d4, d5, d6) -> (d0, d1 + d4, d2 + d5, d6)>
#map1 = affine_map<(d0, d1, d2, d3, d4, d5, d6) -> (d3, d4, d5, d6)>
#map2 = affine_map<(d0, d1, d2, d3, d4, d5, d6) -> (d0, d1, d2, d3)>
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<1x16x16x4xf32>, tensor<16x3x3x4xf32>, tensor<1x14x14x16xf32>) -> tensor<1x14x14x16xf32>, sym_name = "pad_conv"}> ({
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
      %1:2 = "transform.structured.pad_tiling_interface"(%0) <{pad_to_multiple_of, padding_values = [0.000000e+00 : f32, 0.000000e+00 : f32, 0.000000e+00 : f32, 0.000000e+00 : f32, 0.000000e+00 : f32, 0.000000e+00 : f32, 0.000000e+00 : f32], static_padding_sizes = array<i64: 0, 0, 16, 0, 0, 0, 16>}> : (!transform.any_op) -> (!transform.any_op, !transform.any_op)
      "transform.yield"() : () -> ()
    }) : () -> ()
  }) {transform.with_named_sequence} : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1, d2, d3, d4, d5, d6) -> (d0, d1 + d4, d2 + d5, d6)>
#map1 = affine_map<(d0, d1, d2, d3, d4, d5, d6) -> (d3, d4, d5, d6)>
#map2 = affine_map<(d0, d1, d2, d3, d4, d5, d6) -> (d0, d1, d2, d3)>
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<1x16x?x4xf32>, tensor<16x3x3x4xf32>, tensor<1x14x?x16xf32>) -> tensor<1x14x?x16xf32>, sym_name = "pad_conv_dynamic"}> ({
  ^bb0(%arg1: tensor<1x16x?x4xf32>, %arg2: tensor<16x3x3x4xf32>, %arg3: tensor<1x14x?x16xf32>):
    %2 = "linalg.conv_2d_nhwc_fhwc"(%arg1, %arg2, %arg3) <{dilations = dense<1> : tensor<2xi64>, operandSegmentSizes = array<i32: 2, 1>, strides = dense<1> : tensor<2xi64>}> ({
    ^bb0(%arg4: f32, %arg5: f32, %arg6: f32):
      %3 = "arith.mulf"(%arg4, %arg5) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      %4 = "arith.addf"(%arg6, %3) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%4) : (f32) -> ()
    }) {linalg.memoized_indexing_maps = [#map, #map1, #map2]} : (tensor<1x16x?x4xf32>, tensor<16x3x3x4xf32>, tensor<1x14x?x16xf32>) -> tensor<1x14x?x16xf32>
    "func.return"(%2) : (tensor<1x14x?x16xf32>) -> ()
  }) : () -> ()
  "builtin.module"() ({
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg0: !transform.any_op):
      %0 = "transform.structured.match"(%arg0) <{ops = ["linalg.conv_2d_nhwc_fhwc"]}> : (!transform.any_op) -> !transform.any_op
      %1:2 = "transform.structured.pad_tiling_interface"(%0) <{pad_to_multiple_of, padding_values = [0.000000e+00 : f32, 0.000000e+00 : f32, 0.000000e+00 : f32, 0.000000e+00 : f32, 0.000000e+00 : f32, 0.000000e+00 : f32, 0.000000e+00 : f32], static_padding_sizes = array<i64: 0, 0, 16, 0, 0, 0, 16>}> : (!transform.any_op) -> (!transform.any_op, !transform.any_op)
      "transform.yield"() : () -> ()
    }) : () -> ()
  }) {transform.with_named_sequence} : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1, d2, d3, d4, d5, d6) -> (d0, d1 * 3 + d4, d2 * 3 + d5, d6)>
#map1 = affine_map<(d0, d1, d2, d3, d4, d5, d6) -> (d3, d4, d5, d6)>
#map2 = affine_map<(d0, d1, d2, d3, d4, d5, d6) -> (d0, d1, d2, d3)>
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<1x42x42x4xf32>, tensor<16x3x3x4xf32>, tensor<1x14x14x16xf32>) -> tensor<1x14x14x16xf32>, sym_name = "pad_conv_strided"}> ({
  ^bb0(%arg1: tensor<1x42x42x4xf32>, %arg2: tensor<16x3x3x4xf32>, %arg3: tensor<1x14x14x16xf32>):
    %2 = "linalg.conv_2d_nhwc_fhwc"(%arg1, %arg2, %arg3) <{dilations = dense<1> : tensor<2xi64>, operandSegmentSizes = array<i32: 2, 1>, strides = dense<3> : tensor<2xi64>}> ({
    ^bb0(%arg4: f32, %arg5: f32, %arg6: f32):
      %3 = "arith.mulf"(%arg4, %arg5) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      %4 = "arith.addf"(%arg6, %3) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%4) : (f32) -> ()
    }) {linalg.memoized_indexing_maps = [#map, #map1, #map2]} : (tensor<1x42x42x4xf32>, tensor<16x3x3x4xf32>, tensor<1x14x14x16xf32>) -> tensor<1x14x14x16xf32>
    "func.return"(%2) : (tensor<1x14x14x16xf32>) -> ()
  }) : () -> ()
  "builtin.module"() ({
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg0: !transform.any_op):
      %0 = "transform.structured.match"(%arg0) <{ops = ["linalg.conv_2d_nhwc_fhwc"]}> : (!transform.any_op) -> !transform.any_op
      %1:2 = "transform.structured.pad_tiling_interface"(%0) <{pad_to_multiple_of, padding_values = [0.000000e+00 : f32, 0.000000e+00 : f32, 0.000000e+00 : f32, 0.000000e+00 : f32, 0.000000e+00 : f32, 0.000000e+00 : f32, 0.000000e+00 : f32], static_padding_sizes = array<i64: 0, 0, 16, 0, 0, 0, 16>}> : (!transform.any_op) -> (!transform.any_op, !transform.any_op)
      "transform.yield"() : () -> ()
    }) : () -> ()
  }) {transform.with_named_sequence} : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1, d2, d3, d4, d5, d6) -> (d0, d1 + d4 * 2, d2 + d5 * 2, d6)>
#map1 = affine_map<(d0, d1, d2, d3, d4, d5, d6) -> (d3, d4, d5, d6)>
#map2 = affine_map<(d0, d1, d2, d3, d4, d5, d6) -> (d0, d1, d2, d3)>
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<1x18x18x4xf32>, tensor<16x3x3x4xf32>, tensor<1x14x14x16xf32>) -> tensor<1x14x14x16xf32>, sym_name = "pad_conv_dilated"}> ({
  ^bb0(%arg1: tensor<1x18x18x4xf32>, %arg2: tensor<16x3x3x4xf32>, %arg3: tensor<1x14x14x16xf32>):
    %2 = "linalg.conv_2d_nhwc_fhwc"(%arg1, %arg2, %arg3) <{dilations = dense<2> : tensor<2xi64>, operandSegmentSizes = array<i32: 2, 1>, strides = dense<1> : tensor<2xi64>}> ({
    ^bb0(%arg4: f32, %arg5: f32, %arg6: f32):
      %3 = "arith.mulf"(%arg4, %arg5) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      %4 = "arith.addf"(%arg6, %3) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%4) : (f32) -> ()
    }) {linalg.memoized_indexing_maps = [#map, #map1, #map2]} : (tensor<1x18x18x4xf32>, tensor<16x3x3x4xf32>, tensor<1x14x14x16xf32>) -> tensor<1x14x14x16xf32>
    "func.return"(%2) : (tensor<1x14x14x16xf32>) -> ()
  }) : () -> ()
  "builtin.module"() ({
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg0: !transform.any_op):
      %0 = "transform.structured.match"(%arg0) <{ops = ["linalg.conv_2d_nhwc_fhwc"]}> : (!transform.any_op) -> !transform.any_op
      %1:2 = "transform.structured.pad_tiling_interface"(%0) <{pad_to_multiple_of, padding_values = [0.000000e+00 : f32, 0.000000e+00 : f32, 0.000000e+00 : f32, 0.000000e+00 : f32, 0.000000e+00 : f32, 0.000000e+00 : f32, 0.000000e+00 : f32], static_padding_sizes = array<i64: 0, 0, 16, 0, 0, 0, 16>}> : (!transform.any_op) -> (!transform.any_op, !transform.any_op)
      "transform.yield"() : () -> ()
    }) : () -> ()
  }) {transform.with_named_sequence} : () -> ()
}) : () -> ()

