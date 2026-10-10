#map = affine_map<(d0, d1, d2) -> (d0, d2)>
#map1 = affine_map<(d0, d1, d2) -> (d2, d1)>
#map2 = affine_map<(d0, d1, d2) -> (d0, d1)>
#map3 = affine_map<(d0, d1) -> (d0, d1)>
"builtin.module"() ({
  "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "print_structured"}> ({
  ^bb0(%arg10: !transform.any_op):
    "transform.debug.emit_remark_at"(%arg10) <{message = "structured"}> : (!transform.any_op) -> ()
    "transform.yield"() : () -> ()
  }) : () -> ()
  "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> !transform.any_op, sym_name = "match_structured_empty"}> ({
  ^bb0(%arg8: !transform.any_op):
    %11 = "transform.match.structured"(%arg8) ({
    ^bb0(%arg9: !transform.any_op):
      "transform.match.structured.yield"(%arg9) : (!transform.any_op) -> ()
    }) : (!transform.any_op) -> !transform.any_op
    "transform.yield"(%11) : (!transform.any_op) -> ()
  }) : () -> ()
  "transform.named_sequence"() <{arg_attrs = [{transform.consumed}], function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
  ^bb0(%arg7: !transform.any_op):
    %10 = "transform.foreach_match"(%arg7) <{actions = [@print_structured], matchers = [@match_structured_empty]}> : (!transform.any_op) -> !transform.any_op
    "transform.yield"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "payload"}> ({
    %0 = "tensor.empty"() : () -> tensor<2x3xf32>
    %1 = "arith.constant"() <{value = 1.000000e+00 : f32}> : () -> f32
    %2 = "linalg.fill"(%1, %0) <{operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg5: f32, %arg6: f32):
      "linalg.yield"(%arg5) : (f32) -> ()
    }) : (f32, tensor<2x3xf32>) -> tensor<2x3xf32>
    %3 = "arith.constant"() <{value = dense<1.000000e+00> : tensor<3x4xf32>}> : () -> tensor<3x4xf32>
    %4 = "arith.constant"() <{value = dense<1.000000e+03> : tensor<2x4xf32>}> : () -> tensor<2x4xf32>
    %5 = "linalg.matmul"(%2, %3, %4) <{indexing_maps = [#map, #map1, #map2], operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg2: f32, %arg3: f32, %arg4: f32):
      %8 = "arith.mulf"(%arg2, %arg3) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      %9 = "arith.addf"(%arg4, %8) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%9) : (f32) -> ()
    }) : (tensor<2x3xf32>, tensor<3x4xf32>, tensor<2x4xf32>) -> tensor<2x4xf32>
    %6 = "arith.constant"() <{value = dense<2.000000e+00> : tensor<2x4xf32>}> : () -> tensor<2x4xf32>
    %7 = "linalg.generic"(%5, %6) <{indexing_maps = [#map3, #map3], iterator_types = [#linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>], operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg0: f32, %arg1: f32):
      "linalg.yield"(%arg0) : (f32) -> ()
    }) : (tensor<2x4xf32>, tensor<2x4xf32>) -> tensor<2x4xf32>
    "func.return"() : () -> ()
  }) {transform.target_tag = "start_here"} : () -> ()
}) {transform.with_named_sequence} : () -> ()

// -----
"builtin.module"() ({
  "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "do_nothing"}> ({
  ^bb0(%arg2: !transform.any_op):
    "transform.yield"() : () -> ()
  }) : () -> ()
  "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> !transform.any_op, sym_name = "print_in_matcher"}> ({
  ^bb0(%arg1: !transform.any_op):
    "transform.print"(%arg1) : (!transform.any_op) -> ()
    "transform.yield"(%arg1) : (!transform.any_op) -> ()
  }) : () -> ()
  "transform.named_sequence"() <{arg_attrs = [{transform.consumed}], function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
  ^bb0(%arg0: !transform.any_op):
    %1 = "transform.foreach_match"(%arg0) <{actions = [@do_nothing], matchers = [@print_in_matcher]}> : (!transform.any_op) -> !transform.any_op
    "transform.yield"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "payload"}> ({
    %0 = "test.print_me"() : () -> i1
    "func.return"() : () -> ()
  }) {transform.target_tag = "start_here"} : () -> ()
}) {transform.with_named_sequence} : () -> ()

// -----
#map = affine_map<(d0, d1) -> (d0, d1)>
"builtin.module"() ({
  "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "do_nothing"}> ({
  ^bb0(%arg5: !transform.any_op):
    "transform.yield"() : () -> ()
  }) : () -> ()
  "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> !transform.any_op, sym_name = "match_structured_suppress"}> ({
  ^bb0(%arg3: !transform.any_op):
    %4 = "transform.match.structured"(%arg3) <{failure_propagation_mode = 2 : i32}> ({
    ^bb0(%arg4: !transform.any_op):
      "transform.match.structured.yield"(%arg4) : (!transform.any_op) -> ()
    }) : (!transform.any_op) -> !transform.any_op
    "transform.debug.emit_remark_at"(%4) <{message = "structured"}> : (!transform.any_op) -> ()
    "transform.debug.emit_remark_at"(%arg3) <{message = "other"}> : (!transform.any_op) -> ()
    "transform.yield"(%4) : (!transform.any_op) -> ()
  }) : () -> ()
  "transform.named_sequence"() <{arg_attrs = [{transform.consumed}], function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
  ^bb0(%arg2: !transform.any_op):
    %3 = "transform.foreach_match"(%arg2) <{actions = [@do_nothing], matchers = [@match_structured_suppress], restrict_root}> : (!transform.any_op) -> !transform.any_op
    "transform.yield"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "payload"}> ({
    %0 = "arith.constant"() <{value = dense<1.000000e+00> : tensor<2x4xf32>}> : () -> tensor<2x4xf32>
    %1 = "arith.constant"() <{value = dense<2.000000e+00> : tensor<2x4xf32>}> : () -> tensor<2x4xf32>
    %2 = "linalg.generic"(%0, %1) <{indexing_maps = [#map, #map], iterator_types = [#linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>], operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg0: f32, %arg1: f32):
      "linalg.yield"(%arg0) : (f32) -> ()
    }) : (tensor<2x4xf32>, tensor<2x4xf32>) -> tensor<2x4xf32>
    "func.return"() : () -> ()
  }) {transform.target_tag = "start_here"} : () -> ()
}) {transform.with_named_sequence} : () -> ()

// -----
#map = affine_map<(d0) -> (d0)>
"builtin.module"() ({
  "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "print_passthrough"}> ({
  ^bb0(%arg11: !transform.any_op):
    "transform.debug.emit_remark_at"(%arg11) <{message = "passthrough"}> : (!transform.any_op) -> ()
    "transform.yield"() : () -> ()
  }) : () -> ()
  "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> !transform.any_op, sym_name = "match_structured_body_passthrough"}> ({
  ^bb0(%arg9: !transform.any_op):
    %5 = "transform.match.structured"(%arg9) <{failure_propagation_mode = 1 : i32}> ({
    ^bb0(%arg10: !transform.any_op):
      "transform.match.structured.body"(%arg10) <{passthrough}> : (!transform.any_op) -> ()
      "transform.match.structured.yield"(%arg10) : (!transform.any_op) -> ()
    }) : (!transform.any_op) -> !transform.any_op
    "transform.yield"(%5) : (!transform.any_op) -> ()
  }) : () -> ()
  "transform.named_sequence"() <{arg_attrs = [{transform.consumed}], function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
  ^bb0(%arg8: !transform.any_op):
    %4 = "transform.foreach_match"(%arg8) <{actions = [@print_passthrough], matchers = [@match_structured_body_passthrough]}> : (!transform.any_op) -> !transform.any_op
    "transform.yield"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<2xf32>, tensor<2xf32>) -> (), sym_name = "payload"}> ({
  ^bb0(%arg0: tensor<2xf32>, %arg1: tensor<2xf32>):
    %0 = "linalg.generic"(%arg0, %arg1) <{indexing_maps = [#map, #map], iterator_types = [#linalg.iterator_type<parallel>], operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg6: f32, %arg7: f32):
      "linalg.yield"(%arg6) : (f32) -> ()
    }) : (tensor<2xf32>, tensor<2xf32>) -> tensor<2xf32>
    %1 = "linalg.generic"(%arg0, %arg1) <{indexing_maps = [#map, #map], iterator_types = [#linalg.iterator_type<parallel>], operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg4: f32, %arg5: f32):
      %3 = "arith.mulf"(%arg4, %arg5) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%3) : (f32) -> ()
    }) : (tensor<2xf32>, tensor<2xf32>) -> tensor<2xf32>
    %2 = "linalg.copy"(%arg0, %arg1) <{operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg2: f32, %arg3: f32):
      "linalg.yield"(%arg2) : (f32) -> ()
    }) : (tensor<2xf32>, tensor<2xf32>) -> tensor<2xf32>
    "func.return"() : () -> ()
  }) {transform.target_tag = "start_here"} : () -> ()
}) {transform.with_named_sequence} : () -> ()

// -----
#map = affine_map<(d0, d1) -> (d0)>
#map1 = affine_map<(d0, d1) -> (d0, d1)>
"builtin.module"() ({
  "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "print_elementwise"}> ({
  ^bb0(%arg19: !transform.any_op):
    "transform.debug.emit_remark_at"(%arg19) <{message = "elementwise"}> : (!transform.any_op) -> ()
    "transform.yield"() : () -> ()
  }) : () -> ()
  "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> !transform.any_op, sym_name = "match_structured_body_elementwise"}> ({
  ^bb0(%arg17: !transform.any_op):
    %15 = "transform.match.structured"(%arg17) <{failure_propagation_mode = 1 : i32}> ({
    ^bb0(%arg18: !transform.any_op):
      "transform.match.structured.body"(%arg18) <{elementwise}> : (!transform.any_op) -> ()
      "transform.match.structured.yield"(%arg18) : (!transform.any_op) -> ()
    }) : (!transform.any_op) -> !transform.any_op
    "transform.yield"(%15) : (!transform.any_op) -> ()
  }) : () -> ()
  "transform.named_sequence"() <{arg_attrs = [{transform.consumed}], function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
  ^bb0(%arg16: !transform.any_op):
    %14 = "transform.foreach_match"(%arg16) <{actions = [@print_elementwise], matchers = [@match_structured_body_elementwise]}> : (!transform.any_op) -> !transform.any_op
    "transform.yield"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<2xf32>, tensor<2xf32>, tensor<2x3xf32>, tensor<2xf32>, tensor<2x3xf32>) -> (tensor<2xf32>, tensor<2x3xf32>, tensor<2x3xf32>), sym_name = "payload"}> ({
  ^bb0(%arg0: tensor<2xf32>, %arg1: tensor<2xf32>, %arg2: tensor<2x3xf32>, %arg3: tensor<2xf32>, %arg4: tensor<2x3xf32>):
    %0 = "arith.constant"() <{value = 0.000000e+00 : f32}> : () -> f32
    %1 = "arith.constant"() <{value = 0 : index}> : () -> index
    %2 = "arith.constant"() <{value = 1 : index}> : () -> index
    %3 = "linalg.fill"(%0, %arg3) <{operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg14: f32, %arg15: f32):
      "linalg.yield"(%arg14) : (f32) -> ()
    }) : (f32, tensor<2xf32>) -> tensor<2xf32>
    %4 = "linalg.map"(%arg0, %arg1, %3) ({
    ^bb0(%arg11: f32, %arg12: f32, %arg13: f32):
      %13 = "arith.addf"(%arg11, %arg12) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%13) : (f32) -> ()
    }) : (tensor<2xf32>, tensor<2xf32>, tensor<2xf32>) -> tensor<2xf32>
    %5 = "linalg.generic"(%arg0, %arg2, %arg4) <{indexing_maps = [#map, #map1, #map1], iterator_types = [#linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>], operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg8: f32, %arg9: f32, %arg10: f32):
      %8 = "arith.addf"(%arg8, %arg9) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      %9 = "tensor.dim"(%4, %1) : (tensor<2xf32>, index) -> index
      %10 = "arith.subi"(%9, %2) <{overflowFlags = #arith.overflow<none>}> : (index, index) -> index
      %11 = "tensor.extract"(%4, %10) : (tensor<2xf32>, index) -> f32
      %12 = "arith.mulf"(%8, %11) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%12) : (f32) -> ()
    }) : (tensor<2xf32>, tensor<2x3xf32>, tensor<2x3xf32>) -> tensor<2x3xf32>
    %6 = "linalg.generic"(%arg0, %arg2, %arg4) <{indexing_maps = [#map, #map1, #map1], iterator_types = [#linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>], operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg5: f32, %arg6: f32, %arg7: f32):
      %7 = "arith.addf"(%arg5, %arg6) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%7) : (f32) -> ()
    }) : (tensor<2xf32>, tensor<2x3xf32>, tensor<2x3xf32>) -> tensor<2x3xf32>
    "func.return"(%4, %6, %5) : (tensor<2xf32>, tensor<2x3xf32>, tensor<2x3xf32>) -> ()
  }) {transform.target_tag = "start_here"} : () -> ()
}) {transform.with_named_sequence} : () -> ()

// -----
#map = affine_map<(d0, d1, d2) -> (d0, d2)>
#map1 = affine_map<(d0, d1, d2) -> (d2, d1)>
#map2 = affine_map<(d0, d1, d2) -> (d0, d1)>
#map3 = affine_map<(d0, d1) -> (d0, d1)>
"builtin.module"() ({
  "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "print_reduction"}> ({
  ^bb0(%arg18: !transform.any_op):
    "transform.debug.emit_remark_at"(%arg18) <{message = "reduction"}> : (!transform.any_op) -> ()
    "transform.yield"() : () -> ()
  }) : () -> ()
  "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> !transform.any_op, sym_name = "match_structured_body_reduction"}> ({
  ^bb0(%arg16: !transform.any_op):
    %15 = "transform.match.structured"(%arg16) <{failure_propagation_mode = 1 : i32}> ({
    ^bb0(%arg17: !transform.any_op):
      "transform.match.structured.body"(%arg17) <{reduction_position = 0 : i64}> : (!transform.any_op) -> ()
      "transform.match.structured.yield"(%arg17) : (!transform.any_op) -> ()
    }) : (!transform.any_op) -> !transform.any_op
    "transform.yield"(%15) : (!transform.any_op) -> ()
  }) : () -> ()
  "transform.named_sequence"() <{arg_attrs = [{transform.consumed}], function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
  ^bb0(%arg15: !transform.any_op):
    %14 = "transform.foreach_match"(%arg15) <{actions = [@print_reduction], matchers = [@match_structured_body_reduction]}> : (!transform.any_op) -> !transform.any_op
    "transform.yield"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<2x4xf32>, tensor<4x3xf32>, tensor<2x3xf32>) -> (), sym_name = "payload"}> ({
  ^bb0(%arg0: tensor<2x4xf32>, %arg1: tensor<4x3xf32>, %arg2: tensor<2x3xf32>):
    %0 = "linalg.generic"(%arg0, %arg1, %arg2) <{indexing_maps = [#map, #map1, #map2], iterator_types = [#linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>, #linalg.iterator_type<reduction>], operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg12: f32, %arg13: f32, %arg14: f32):
      %12 = "arith.mulf"(%arg12, %arg13) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      %13 = "arith.addf"(%12, %arg14) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%13) : (f32) -> ()
    }) : (tensor<2x4xf32>, tensor<4x3xf32>, tensor<2x3xf32>) -> tensor<2x3xf32>
    %1 = "tensor.empty"() : () -> tensor<2x3xf32>
    %2:2 = "linalg.generic"(%arg0, %arg1, %arg2, %1) <{indexing_maps = [#map, #map1, #map2, #map2], iterator_types = [#linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>, #linalg.iterator_type<reduction>], operandSegmentSizes = array<i32: 2, 2>}> ({
    ^bb0(%arg8: f32, %arg9: f32, %arg10: f32, %arg11: f32):
      %8 = "arith.mulf"(%arg8, %arg9) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      %9 = "arith.cmpf"(%8, %arg10) <{fastmath = #arith.fastmath<none>, predicate = 4 : i64}> : (f32, f32) -> i1
      %10 = "arith.select"(%9, %8, %arg10) : (i1, f32, f32) -> f32
      %11 = "arith.select"(%9, %arg11, %8) : (i1, f32, f32) -> f32
      "linalg.yield"(%10, %11) : (f32, f32) -> ()
    }) : (tensor<2x4xf32>, tensor<4x3xf32>, tensor<2x3xf32>, tensor<2x3xf32>) -> (tensor<2x3xf32>, tensor<2x3xf32>)
    %3 = "linalg.matmul"(%arg0, %arg1, %arg2) <{indexing_maps = [#map, #map1, #map2], operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg5: f32, %arg6: f32, %arg7: f32):
      %6 = "arith.mulf"(%arg5, %arg6) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      %7 = "arith.addf"(%arg7, %6) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%7) : (f32) -> ()
    }) : (tensor<2x4xf32>, tensor<4x3xf32>, tensor<2x3xf32>) -> tensor<2x3xf32>
    %4 = "tensor.empty"() : () -> tensor<2x4xf32>
    %5 = "linalg.generic"(%arg0, %4) <{indexing_maps = [#map3, #map3], iterator_types = [#linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>], operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg3: f32, %arg4: f32):
      "linalg.yield"(%arg3) : (f32) -> ()
    }) : (tensor<2x4xf32>, tensor<2x4xf32>) -> tensor<2x4xf32>
    "func.return"() : () -> ()
  }) {transform.target_tag = "start_here"} : () -> ()
}) {transform.with_named_sequence} : () -> ()

// -----
#map = affine_map<(d0, d1, d2) -> (d0, d2)>
#map1 = affine_map<(d0, d1, d2) -> (d2, d1)>
#map2 = affine_map<(d0, d1, d2) -> (d0, d1)>
"builtin.module"() ({
  "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "do_nothing"}> ({
  ^bb0(%arg12: !transform.any_op):
    "transform.yield"() : () -> ()
  }) : () -> ()
  "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "print_dimension_size_match"}> ({
  ^bb0(%arg11: !transform.any_op):
    "transform.debug.emit_remark_at"(%arg11) <{message = "matched sizes"}> : (!transform.any_op) -> ()
    "transform.yield"() : () -> ()
  }) : () -> ()
  "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> !transform.any_op, sym_name = "match_dimension_capture"}> ({
  ^bb0(%arg9: !transform.any_op):
    %11:9 = "transform.match.structured"(%arg9) <{failure_propagation_mode = 2 : i32}> ({
    ^bb0(%arg10: !transform.any_op):
      %12 = "transform.match.structured.dim"(%arg10) <{is_all, raw_dim_list = array<i64>}> : (!transform.any_op) -> !transform.param<i64>
      %13 = "transform.match.structured.dim"(%arg10) <{raw_dim_list = array<i64: 0>}> : (!transform.any_op) -> !transform.param<i64>
      %14 = "transform.match.structured.dim"(%arg10) <{raw_dim_list = array<i64: -1>}> : (!transform.any_op) -> !transform.param<i64>
      %15 = "transform.match.structured.dim"(%arg10) <{raw_dim_list = array<i64: 0, 2>}> : (!transform.any_op) -> !transform.param<i64>
      %16 = "transform.match.structured.dim"(%arg10) <{raw_dim_list = array<i64: 0, -1>}> : (!transform.any_op) -> !transform.param<i64>
      %17 = "transform.match.structured.dim"(%arg10) <{is_inverted, raw_dim_list = array<i64: -1>}> : (!transform.any_op) -> !transform.param<i64>
      %18 = "transform.match.structured.dim"(%arg10) <{is_inverted, raw_dim_list = array<i64: 0, -2>}> : (!transform.any_op) -> !transform.param<i64>
      %19 = "transform.match.structured.dim"(%arg10) <{raw_dim_list = array<i64: 0, -3>}> : (!transform.any_op) -> !transform.param<i64>
      "transform.match.structured.yield"(%arg10, %12, %13, %14, %15, %16, %17, %18, %19) : (!transform.any_op, !transform.param<i64>, !transform.param<i64>, !transform.param<i64>, !transform.param<i64>, !transform.param<i64>, !transform.param<i64>, !transform.param<i64>, !transform.param<i64>) -> ()
    }) : (!transform.any_op) -> (!transform.any_op, !transform.param<i64>, !transform.param<i64>, !transform.param<i64>, !transform.param<i64>, !transform.param<i64>, !transform.param<i64>, !transform.param<i64>, !transform.param<i64>)
    "transform.debug.emit_param_as_remark"(%11#1, %11#0) <{message = "dimensions all:"}> : (!transform.param<i64>, !transform.any_op) -> ()
    "transform.debug.emit_param_as_remark"(%11#2, %11#0) <{message = "dimension 0:"}> : (!transform.param<i64>, !transform.any_op) -> ()
    "transform.debug.emit_param_as_remark"(%11#3, %11#0) <{message = "dimension -1:"}> : (!transform.param<i64>, !transform.any_op) -> ()
    "transform.debug.emit_param_as_remark"(%11#4, %11#0) <{message = "dimensions 0, 2:"}> : (!transform.param<i64>, !transform.any_op) -> ()
    "transform.debug.emit_param_as_remark"(%11#5, %11#0) <{message = "dimensions 0, -1:"}> : (!transform.param<i64>, !transform.any_op) -> ()
    "transform.debug.emit_param_as_remark"(%11#6, %11#0) <{message = "dimensions except -1:"}> : (!transform.param<i64>, !transform.any_op) -> ()
    "transform.debug.emit_param_as_remark"(%11#7, %11#0) <{message = "dimensions except 0, -2:"}> : (!transform.param<i64>, !transform.any_op) -> ()
    "transform.debug.emit_param_as_remark"(%11#8, %11#0) <{message = "dimensions 0, -3:"}> : (!transform.param<i64>, !transform.any_op) -> ()
    "transform.yield"(%11#0) : (!transform.any_op) -> ()
  }) : () -> ()
  "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> !transform.any_op, sym_name = "match_dimension_sizes"}> ({
  ^bb0(%arg7: !transform.any_op):
    %5 = "transform.match.structured"(%arg7) <{failure_propagation_mode = 1 : i32}> ({
    ^bb0(%arg8: !transform.any_op):
      %6 = "transform.match.structured.dim"(%arg8) <{is_all, raw_dim_list = array<i64>}> : (!transform.any_op) -> !transform.param<i64>
      %7 = "transform.param.constant"() <{value = 2 : i64}> : () -> !transform.param<i64>
      %8 = "transform.param.constant"() <{value = 3 : i64}> : () -> !transform.param<i64>
      %9 = "transform.param.constant"() <{value = 4 : i64}> : () -> !transform.param<i64>
      %10 = "transform.merge_handles"(%7, %8, %9) : (!transform.param<i64>, !transform.param<i64>, !transform.param<i64>) -> !transform.param<i64>
      "transform.match.param.cmpi"(%6, %10) <{predicate = 0 : i32}> : (!transform.param<i64>, !transform.param<i64>) -> ()
      "transform.match.structured.yield"(%arg8) : (!transform.any_op) -> ()
    }) : (!transform.any_op) -> !transform.any_op
    "transform.yield"(%5) : (!transform.any_op) -> ()
  }) : () -> ()
  "transform.named_sequence"() <{arg_attrs = [{transform.consumed}], function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
  ^bb0(%arg6: !transform.any_op):
    %3 = "transform.foreach_match"(%arg6) <{actions = [@do_nothing], matchers = [@match_dimension_capture]}> : (!transform.any_op) -> !transform.any_op
    %4 = "transform.foreach_match"(%3) <{actions = [@print_dimension_size_match], matchers = [@match_dimension_sizes]}> : (!transform.any_op) -> !transform.any_op
    "transform.yield"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<2x4xf32>, tensor<4x3xf32>, tensor<2x3xf32>) -> (), sym_name = "payload"}> ({
  ^bb0(%arg0: tensor<2x4xf32>, %arg1: tensor<4x3xf32>, %arg2: tensor<2x3xf32>):
    %0 = "linalg.generic"(%arg0, %arg1, %arg2) <{indexing_maps = [#map, #map1, #map2], iterator_types = [#linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>, #linalg.iterator_type<reduction>], operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg3: f32, %arg4: f32, %arg5: f32):
      %1 = "arith.mulf"(%arg3, %arg4) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      %2 = "arith.addf"(%1, %arg5) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%2) : (f32) -> ()
    }) : (tensor<2x4xf32>, tensor<4x3xf32>, tensor<2x3xf32>) -> tensor<2x3xf32>
    "func.return"() : () -> ()
  }) {transform.target_tag = "start_here"} : () -> ()
}) {transform.with_named_sequence} : () -> ()

// -----
#map = affine_map<(d0, d1, d2) -> (d0, d2)>
#map1 = affine_map<(d0, d1, d2) -> (d2, d1)>
#map2 = affine_map<(d0, d1, d2) -> (d0, d1)>
"builtin.module"() ({
  "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "print_all_reduction"}> ({
  ^bb0(%arg23: !transform.any_op):
    "transform.debug.emit_remark_at"(%arg23) <{message = "all reduction"}> : (!transform.any_op) -> ()
    "transform.yield"() : () -> ()
  }) : () -> ()
  "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "print_all_parallel"}> ({
  ^bb0(%arg22: !transform.any_op):
    "transform.debug.emit_remark_at"(%arg22) <{message = "all parallel"}> : (!transform.any_op) -> ()
    "transform.yield"() : () -> ()
  }) : () -> ()
  "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "print_last_reduction"}> ({
  ^bb0(%arg21: !transform.any_op):
    "transform.debug.emit_remark_at"(%arg21) <{message = "last reduction"}> : (!transform.any_op) -> ()
    "transform.yield"() : () -> ()
  }) : () -> ()
  "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "print_parallel_except_last"}> ({
  ^bb0(%arg20: !transform.any_op):
    "transform.debug.emit_remark_at"(%arg20) <{message = "parallel except last"}> : (!transform.any_op) -> ()
    "transform.yield"() : () -> ()
  }) : () -> ()
  "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> !transform.any_op, sym_name = "match_all_reduction"}> ({
  ^bb0(%arg18: !transform.any_op):
    "transform.match.structured"(%arg18) <{failure_propagation_mode = 1 : i32}> ({
    ^bb0(%arg19: !transform.any_op):
      "transform.match.structured.dim"(%arg19) <{is_all, raw_dim_list = array<i64>, reduction}> : (!transform.any_op) -> ()
      "transform.match.structured.yield"() : () -> ()
    }) : (!transform.any_op) -> ()
    "transform.yield"(%arg18) : (!transform.any_op) -> ()
  }) : () -> ()
  "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> !transform.any_op, sym_name = "match_all_parallel"}> ({
  ^bb0(%arg16: !transform.any_op):
    "transform.match.structured"(%arg16) <{failure_propagation_mode = 1 : i32}> ({
    ^bb0(%arg17: !transform.any_op):
      "transform.match.structured.dim"(%arg17) <{is_all, parallel, raw_dim_list = array<i64>}> : (!transform.any_op) -> ()
      "transform.match.structured.yield"() : () -> ()
    }) : (!transform.any_op) -> ()
    "transform.yield"(%arg16) : (!transform.any_op) -> ()
  }) : () -> ()
  "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> !transform.any_op, sym_name = "match_last_reduction"}> ({
  ^bb0(%arg14: !transform.any_op):
    "transform.match.structured"(%arg14) <{failure_propagation_mode = 1 : i32}> ({
    ^bb0(%arg15: !transform.any_op):
      "transform.match.structured.dim"(%arg15) <{raw_dim_list = array<i64: -1>, reduction}> : (!transform.any_op) -> ()
      "transform.match.structured.yield"() : () -> ()
    }) : (!transform.any_op) -> ()
    "transform.yield"(%arg14) : (!transform.any_op) -> ()
  }) : () -> ()
  "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> !transform.any_op, sym_name = "match_parallel_except_last"}> ({
  ^bb0(%arg12: !transform.any_op):
    "transform.match.structured"(%arg12) <{failure_propagation_mode = 1 : i32}> ({
    ^bb0(%arg13: !transform.any_op):
      "transform.match.structured.dim"(%arg13) <{is_inverted, parallel, raw_dim_list = array<i64: -1>}> : (!transform.any_op) -> ()
      "transform.match.structured.yield"() : () -> ()
    }) : (!transform.any_op) -> ()
    "transform.yield"(%arg12) : (!transform.any_op) -> ()
  }) : () -> ()
  "transform.named_sequence"() <{arg_attrs = [{transform.consumed}], function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
  ^bb0(%arg11: !transform.any_op):
    %8 = "transform.foreach_match"(%arg11) <{actions = [@print_all_reduction], matchers = [@match_all_reduction]}> : (!transform.any_op) -> !transform.any_op
    %9 = "transform.foreach_match"(%8) <{actions = [@print_all_parallel], matchers = [@match_all_parallel]}> : (!transform.any_op) -> !transform.any_op
    %10 = "transform.foreach_match"(%9) <{actions = [@print_last_reduction], matchers = [@match_last_reduction]}> : (!transform.any_op) -> !transform.any_op
    %11 = "transform.foreach_match"(%10) <{actions = [@print_parallel_except_last], matchers = [@match_parallel_except_last]}> : (!transform.any_op) -> !transform.any_op
    "transform.yield"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<2x4xf32>, tensor<4x3xf32>, tensor<2x3xf32>) -> (), sym_name = "payload"}> ({
  ^bb0(%arg0: tensor<2x4xf32>, %arg1: tensor<4x3xf32>, %arg2: tensor<2x3xf32>):
    %0 = "linalg.generic"(%arg0, %arg1, %arg2) <{indexing_maps = [#map, #map1, #map2], iterator_types = [#linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>, #linalg.iterator_type<reduction>], operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg8: f32, %arg9: f32, %arg10: f32):
      %6 = "arith.mulf"(%arg8, %arg9) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      %7 = "arith.addf"(%6, %arg10) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%7) : (f32) -> ()
    }) : (tensor<2x4xf32>, tensor<4x3xf32>, tensor<2x3xf32>) -> tensor<2x3xf32>
    %1 = "linalg.matmul"(%arg0, %arg1, %arg2) <{indexing_maps = [#map, #map1, #map2], operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg5: f32, %arg6: f32, %arg7: f32):
      %4 = "arith.mulf"(%arg5, %arg6) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      %5 = "arith.addf"(%arg7, %4) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%5) : (f32) -> ()
    }) : (tensor<2x4xf32>, tensor<4x3xf32>, tensor<2x3xf32>) -> tensor<2x3xf32>
    %2 = "arith.constant"() <{value = 1.000000e+00 : f32}> : () -> f32
    %3 = "linalg.fill"(%2, %arg2) <{operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg3: f32, %arg4: f32):
      "linalg.yield"(%arg3) : (f32) -> ()
    }) : (f32, tensor<2x3xf32>) -> tensor<2x3xf32>
    "func.return"() : () -> ()
  }) {transform.target_tag = "start_here"} : () -> ()
}) {transform.with_named_sequence} : () -> ()

// -----
"builtin.module"() ({
  "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (!transform.any_op, !transform.param<i64>), sym_name = "match_bitwidth"}> ({
  ^bb0(%arg11: !transform.any_op):
    %3 = "transform.match.structured"(%arg11) <{failure_propagation_mode = 1 : i32}> ({
    ^bb0(%arg12: !transform.any_op):
      %4 = "transform.match.structured.init"(%arg12) <{raw_position_list = array<i64: 0>}> : (!transform.any_op) -> !transform.any_value
      %5 = "transform.match.structured.elemental_bitwidth"(%4) : (!transform.any_value) -> !transform.param<i64>
      "transform.match.structured.yield"(%5) : (!transform.param<i64>) -> ()
    }) : (!transform.any_op) -> !transform.param<i64>
    "transform.yield"(%arg11, %3) : (!transform.any_op, !transform.param<i64>) -> ()
  }) : () -> ()
  "transform.named_sequence"() <{arg_attrs = [{transform.readonly}, {transform.readonly}], function_type = (!transform.any_op, !transform.param<i64>) -> (), sym_name = "print_bitwidth"}> ({
  ^bb0(%arg9: !transform.any_op, %arg10: !transform.param<i64>):
    "transform.debug.emit_param_as_remark"(%arg10, %arg9) <{message = "bitwidth:"}> : (!transform.param<i64>, !transform.any_op) -> ()
    "transform.yield"() : () -> ()
  }) : () -> ()
  "transform.named_sequence"() <{arg_attrs = [{transform.consumed}], function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
  ^bb0(%arg8: !transform.any_op):
    %2 = "transform.foreach_match"(%arg8) <{actions = [@print_bitwidth], matchers = [@match_bitwidth]}> : (!transform.any_op) -> !transform.any_op
    "transform.yield"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (f32, tensor<?xf32>, index, tensor<?xindex>) -> (), sym_name = "payload"}> ({
  ^bb0(%arg0: f32, %arg1: tensor<?xf32>, %arg2: index, %arg3: tensor<?xindex>):
    %0 = "linalg.fill"(%arg0, %arg1) <{operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg6: f32, %arg7: f32):
      "linalg.yield"(%arg6) : (f32) -> ()
    }) : (f32, tensor<?xf32>) -> tensor<?xf32>
    %1 = "linalg.fill"(%arg2, %arg3) <{operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg4: index, %arg5: index):
      "linalg.yield"(%arg4) : (index) -> ()
    }) : (index, tensor<?xindex>) -> tensor<?xindex>
    "func.return"() : () -> ()
  }) {transform.target_tag = "start_here"} : () -> ()
}) {transform.with_named_sequence} : () -> ()

// -----
#map = affine_map<(d0) -> (d0)>
"builtin.module"() ({
  "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (!transform.any_op, !transform.any_value, !transform.any_value, !transform.any_op), sym_name = "match_init"}> ({
  ^bb0(%arg13: !transform.any_op):
    %3:3 = "transform.match.structured"(%arg13) <{failure_propagation_mode = 2 : i32}> ({
    ^bb0(%arg14: !transform.any_op):
      %4 = "transform.match.structured.init"(%arg14) <{raw_position_list = array<i64: 0>}> : (!transform.any_op) -> !transform.any_value
      %5 = "transform.match.structured.init"(%arg14) <{is_all, raw_position_list = array<i64>}> : (!transform.any_op) -> !transform.any_value
      %6 = "transform.match.structured.init"(%arg14) <{raw_position_list = array<i64: 0>}> : (!transform.any_op) -> !transform.any_op
      "transform.match.structured.yield"(%4, %5, %6) : (!transform.any_value, !transform.any_value, !transform.any_op) -> ()
    }) : (!transform.any_op) -> (!transform.any_value, !transform.any_value, !transform.any_op)
    "transform.yield"(%arg13, %3#0, %3#1, %3#2) : (!transform.any_op, !transform.any_value, !transform.any_value, !transform.any_op) -> ()
  }) : () -> ()
  "transform.named_sequence"() <{arg_attrs = [{transform.readonly}, {transform.readonly}, {transform.readonly}, {transform.readonly}], function_type = (!transform.any_op, !transform.any_value, !transform.any_value, !transform.any_op) -> (), sym_name = "print_init"}> ({
  ^bb0(%arg9: !transform.any_op, %arg10: !transform.any_value, %arg11: !transform.any_value, %arg12: !transform.any_op):
    "transform.debug.emit_remark_at"(%arg10) <{message = "output 0"}> : (!transform.any_value) -> ()
    "transform.debug.emit_remark_at"(%arg12) <{message = "output producer"}> : (!transform.any_op) -> ()
    "transform.debug.emit_remark_at"(%arg11) <{message = "all output"}> : (!transform.any_value) -> ()
    "transform.yield"() : () -> ()
  }) : () -> ()
  "transform.named_sequence"() <{arg_attrs = [{transform.consumed}], function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
  ^bb0(%arg8: !transform.any_op):
    %2 = "transform.foreach_match"(%arg8) <{actions = [@print_init], matchers = [@match_init]}> : (!transform.any_op) -> !transform.any_op
    "transform.yield"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (f32, tensor<?xf32>, tensor<?xf32>) -> (), sym_name = "payload"}> ({
  ^bb0(%arg0: f32, %arg1: tensor<?xf32>, %arg2: tensor<?xf32>):
    %0 = "linalg.fill"(%arg0, %arg1) <{operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg6: f32, %arg7: f32):
      "linalg.yield"(%arg6) : (f32) -> ()
    }) : (f32, tensor<?xf32>) -> tensor<?xf32>
    %1:2 = "linalg.generic"(%arg1, %0, %arg2) <{indexing_maps = [#map, #map, #map], iterator_types = [#linalg.iterator_type<parallel>], operandSegmentSizes = array<i32: 1, 2>}> ({
    ^bb0(%arg3: f32, %arg4: f32, %arg5: f32):
      "linalg.yield"(%arg3, %arg3) : (f32, f32) -> ()
    }) : (tensor<?xf32>, tensor<?xf32>, tensor<?xf32>) -> (tensor<?xf32>, tensor<?xf32>)
    "func.return"() : () -> ()
  }) {transform.target_tag = "start_here"} : () -> ()
}) {transform.with_named_sequence} : () -> ()

// -----
#map = affine_map<(d0, d1) -> (d0)>
#map1 = affine_map<(d0, d1) -> (d0 + d1)>
#map2 = affine_map<(d0, d1) -> (d1)>
#map3 = affine_map<(d0, d1) -> (d1, d0)>
"builtin.module"() ({
  "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> !transform.any_op, sym_name = "match_init_0_permutation"}> ({
  ^bb0(%arg20: !transform.any_op):
    %7 = "transform.match.structured"(%arg20) <{failure_propagation_mode = 1 : i32}> ({
    ^bb0(%arg21: !transform.any_op):
      "transform.match.structured.init"(%arg21) <{permutation, raw_position_list = array<i64: 0>}> : (!transform.any_op) -> ()
      "transform.match.structured.yield"(%arg21) : (!transform.any_op) -> ()
    }) : (!transform.any_op) -> !transform.any_op
    "transform.yield"(%7) : (!transform.any_op) -> ()
  }) : () -> ()
  "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> !transform.any_op, sym_name = "match_init_1_permutation"}> ({
  ^bb0(%arg18: !transform.any_op):
    %6 = "transform.match.structured"(%arg18) <{failure_propagation_mode = 1 : i32}> ({
    ^bb0(%arg19: !transform.any_op):
      "transform.match.structured.init"(%arg19) <{permutation, raw_position_list = array<i64: 1>}> : (!transform.any_op) -> ()
      "transform.match.structured.yield"(%arg19) : (!transform.any_op) -> ()
    }) : (!transform.any_op) -> !transform.any_op
    "transform.yield"(%6) : (!transform.any_op) -> ()
  }) : () -> ()
  "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> !transform.any_op, sym_name = "match_init_2_projected_permutation"}> ({
  ^bb0(%arg16: !transform.any_op):
    %5 = "transform.match.structured"(%arg16) <{failure_propagation_mode = 1 : i32}> ({
    ^bb0(%arg17: !transform.any_op):
      "transform.match.structured.init"(%arg17) <{projected_permutation, raw_position_list = array<i64: 2>}> : (!transform.any_op) -> ()
      "transform.match.structured.yield"(%arg17) : (!transform.any_op) -> ()
    }) : (!transform.any_op) -> !transform.any_op
    "transform.yield"(%5) : (!transform.any_op) -> ()
  }) : () -> ()
  "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "print_init_0_permutation"}> ({
  ^bb0(%arg15: !transform.any_op):
    "transform.debug.emit_remark_at"(%arg15) <{message = "matched output 0 permutation"}> : (!transform.any_op) -> ()
    "transform.yield"() : () -> ()
  }) : () -> ()
  "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "print_init_1_permutation"}> ({
  ^bb0(%arg14: !transform.any_op):
    "transform.debug.emit_remark_at"(%arg14) <{message = "matched output 1 permutation"}> : (!transform.any_op) -> ()
    "transform.yield"() : () -> ()
  }) : () -> ()
  "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "print_init_2_projected_permutation"}> ({
  ^bb0(%arg13: !transform.any_op):
    "transform.debug.emit_remark_at"(%arg13) <{message = "matched output 2 projected permutation"}> : (!transform.any_op) -> ()
    "transform.yield"() : () -> ()
  }) : () -> ()
  "transform.named_sequence"() <{arg_attrs = [{transform.consumed}], function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
  ^bb0(%arg12: !transform.any_op):
    %2 = "transform.foreach_match"(%arg12) <{actions = [@print_init_0_permutation], matchers = [@match_init_0_permutation]}> : (!transform.any_op) -> !transform.any_op
    %3 = "transform.foreach_match"(%2) <{actions = [@print_init_1_permutation], matchers = [@match_init_1_permutation]}> : (!transform.any_op) -> !transform.any_op
    %4 = "transform.foreach_match"(%3) <{actions = [@print_init_2_projected_permutation], matchers = [@match_init_2_projected_permutation]}> : (!transform.any_op) -> !transform.any_op
    "transform.yield"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (f32, tensor<?xf32>, tensor<?xf32>, tensor<?x?xf32>) -> (), sym_name = "payload"}> ({
  ^bb0(%arg0: f32, %arg1: tensor<?xf32>, %arg2: tensor<?xf32>, %arg3: tensor<?x?xf32>):
    %0:3 = "linalg.generic"(%arg1, %arg1, %arg2, %arg3) <{indexing_maps = [#map, #map1, #map2, #map3], iterator_types = [#linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>], operandSegmentSizes = array<i32: 1, 3>}> ({
    ^bb0(%arg8: f32, %arg9: f32, %arg10: f32, %arg11: f32):
      "linalg.yield"(%arg8, %arg8, %arg8) : (f32, f32, f32) -> ()
    }) : (tensor<?xf32>, tensor<?xf32>, tensor<?xf32>, tensor<?x?xf32>) -> (tensor<?xf32>, tensor<?xf32>, tensor<?x?xf32>)
    %1:3 = "linalg.generic"(%arg1, %arg1, %arg3, %arg2) <{indexing_maps = [#map, #map1, #map3, #map2], iterator_types = [#linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>], operandSegmentSizes = array<i32: 1, 3>}> ({
    ^bb0(%arg4: f32, %arg5: f32, %arg6: f32, %arg7: f32):
      "linalg.yield"(%arg4, %arg4, %arg4) : (f32, f32, f32) -> ()
    }) : (tensor<?xf32>, tensor<?xf32>, tensor<?x?xf32>, tensor<?xf32>) -> (tensor<?xf32>, tensor<?x?xf32>, tensor<?xf32>)
    "func.return"() : () -> ()
  }) {transform.target_tag = "start_here"} : () -> ()
}) {transform.with_named_sequence} : () -> ()

// -----
#map = affine_map<(d0, d1) -> (d0)>
#map1 = affine_map<(d0, d1) -> (d0 + d1)>
#map2 = affine_map<(d0, d1) -> (d1)>
#map3 = affine_map<(d0, d1) -> (d1, d0)>
"builtin.module"() ({
  "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (!transform.param<i64>, !transform.param<i64>, !transform.any_op), sym_name = "match_num_io"}> ({
  ^bb0(%arg16: !transform.any_op):
    %3:3 = "transform.match.structured"(%arg16) <{failure_propagation_mode = 1 : i32}> ({
    ^bb0(%arg17: !transform.any_op):
      %4 = "transform.match.structured.num_inputs"(%arg17) : (!transform.any_op) -> !transform.param<i64>
      %5 = "transform.match.structured.num_inits"(%arg17) : (!transform.any_op) -> !transform.param<i64>
      "transform.match.structured.yield"(%4, %5, %arg17) : (!transform.param<i64>, !transform.param<i64>, !transform.any_op) -> ()
    }) : (!transform.any_op) -> (!transform.param<i64>, !transform.param<i64>, !transform.any_op)
    "transform.yield"(%3#0, %3#1, %3#2) : (!transform.param<i64>, !transform.param<i64>, !transform.any_op) -> ()
  }) : () -> ()
  "transform.named_sequence"() <{arg_attrs = [{transform.readonly}, {transform.readonly}, {transform.readonly}], function_type = (!transform.param<i64>, !transform.param<i64>, !transform.any_op) -> (), sym_name = "print_num_io"}> ({
  ^bb0(%arg13: !transform.param<i64>, %arg14: !transform.param<i64>, %arg15: !transform.any_op):
    "transform.debug.emit_param_as_remark"(%arg13, %arg15) <{message = "inputs"}> : (!transform.param<i64>, !transform.any_op) -> ()
    "transform.debug.emit_param_as_remark"(%arg14, %arg15) <{message = "outputs"}> : (!transform.param<i64>, !transform.any_op) -> ()
    "transform.yield"() : () -> ()
  }) : () -> ()
  "transform.named_sequence"() <{arg_attrs = [{transform.consumed}], function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
  ^bb0(%arg12: !transform.any_op):
    %2 = "transform.foreach_match"(%arg12) <{actions = [@print_num_io], matchers = [@match_num_io]}> : (!transform.any_op) -> !transform.any_op
    "transform.yield"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (f32, tensor<?xf32>, tensor<?xf32>, tensor<?x?xf32>) -> (), sym_name = "payload"}> ({
  ^bb0(%arg0: f32, %arg1: tensor<?xf32>, %arg2: tensor<?xf32>, %arg3: tensor<?x?xf32>):
    %0:3 = "linalg.generic"(%arg1, %arg1, %arg2, %arg3) <{indexing_maps = [#map, #map1, #map2, #map3], iterator_types = [#linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>], operandSegmentSizes = array<i32: 1, 3>}> ({
    ^bb0(%arg8: f32, %arg9: f32, %arg10: f32, %arg11: f32):
      "linalg.yield"(%arg8, %arg8, %arg8) : (f32, f32, f32) -> ()
    }) : (tensor<?xf32>, tensor<?xf32>, tensor<?xf32>, tensor<?x?xf32>) -> (tensor<?xf32>, tensor<?xf32>, tensor<?x?xf32>)
    %1:2 = "linalg.generic"(%arg1, %arg3, %arg1, %arg2) <{indexing_maps = [#map, #map3, #map1, #map2], iterator_types = [#linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>], operandSegmentSizes = array<i32: 2, 2>}> ({
    ^bb0(%arg4: f32, %arg5: f32, %arg6: f32, %arg7: f32):
      "linalg.yield"(%arg4, %arg4) : (f32, f32) -> ()
    }) : (tensor<?xf32>, tensor<?x?xf32>, tensor<?xf32>, tensor<?xf32>) -> (tensor<?xf32>, tensor<?xf32>)
    "func.return"() : () -> ()
  }) {transform.target_tag = "start_here"} : () -> ()
}) {transform.with_named_sequence} : () -> ()

// -----
#map = affine_map<(d0, d1, d2) -> (d0, d2)>
#map1 = affine_map<(d0, d1, d2) -> (d2, d1)>
#map2 = affine_map<(d0, d1, d2) -> (d0, d1)>
"builtin.module"() ({
  "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (!transform.param<i64>, !transform.any_op), sym_name = "match_rank"}> ({
  ^bb0(%arg10: !transform.any_op):
    %6:2 = "transform.match.structured"(%arg10) <{failure_propagation_mode = 1 : i32}> ({
    ^bb0(%arg11: !transform.any_op):
      %7 = "transform.match.structured.rank"(%arg11) : (!transform.any_op) -> !transform.param<i64>
      "transform.match.structured.yield"(%7, %arg11) : (!transform.param<i64>, !transform.any_op) -> ()
    }) : (!transform.any_op) -> (!transform.param<i64>, !transform.any_op)
    "transform.yield"(%6#0, %6#1) : (!transform.param<i64>, !transform.any_op) -> ()
  }) : () -> ()
  "transform.named_sequence"() <{arg_attrs = [{transform.readonly}, {transform.readonly}], function_type = (!transform.param<i64>, !transform.any_op) -> (), sym_name = "print_rank"}> ({
  ^bb0(%arg8: !transform.param<i64>, %arg9: !transform.any_op):
    "transform.debug.emit_param_as_remark"(%arg8, %arg9) <{message = "rank"}> : (!transform.param<i64>, !transform.any_op) -> ()
    "transform.yield"() : () -> ()
  }) : () -> ()
  "transform.named_sequence"() <{arg_attrs = [{transform.consumed}], function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
  ^bb0(%arg7: !transform.any_op):
    %5 = "transform.foreach_match"(%arg7) <{actions = [@print_rank], matchers = [@match_rank]}> : (!transform.any_op) -> !transform.any_op
    "transform.yield"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (f32, tensor<42x42xf32>) -> (), sym_name = "payload"}> ({
  ^bb0(%arg0: f32, %arg1: tensor<42x42xf32>):
    %0 = "tensor.empty"() : () -> tensor<42x42xf32>
    %1 = "linalg.fill"(%arg0, %0) <{operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg5: f32, %arg6: f32):
      "linalg.yield"(%arg5) : (f32) -> ()
    }) : (f32, tensor<42x42xf32>) -> tensor<42x42xf32>
    %2 = "linalg.matmul"(%arg1, %arg1, %1) <{indexing_maps = [#map, #map1, #map2], operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg2: f32, %arg3: f32, %arg4: f32):
      %3 = "arith.mulf"(%arg2, %arg3) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      %4 = "arith.addf"(%arg4, %3) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%4) : (f32) -> ()
    }) : (tensor<42x42xf32>, tensor<42x42xf32>, tensor<42x42xf32>) -> tensor<42x42xf32>
    "func.return"() : () -> ()
  }) {transform.target_tag = "start_here"} : () -> ()
}) {transform.with_named_sequence} : () -> ()

// -----
"builtin.module"() ({
  "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (!transform.any_op, !transform.any_op), sym_name = "match_single_result"}> ({
  ^bb0(%arg26: !transform.any_op):
    %17:2 = "transform.match.structured"(%arg26) <{failure_propagation_mode = 1 : i32}> ({
    ^bb0(%arg27: !transform.any_op):
      %18 = "transform.match.structured.result"(%arg27) <{position = 0 : i64, single}> : (!transform.any_op) -> !transform.any_op
      "transform.match.structured.yield"(%18, %arg27) : (!transform.any_op, !transform.any_op) -> ()
    }) : (!transform.any_op) -> (!transform.any_op, !transform.any_op)
    "transform.yield"(%17#0, %17#1) : (!transform.any_op, !transform.any_op) -> ()
  }) : () -> ()
  "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (!transform.any_value, !transform.any_op), sym_name = "match_result_value"}> ({
  ^bb0(%arg24: !transform.any_op):
    %15:2 = "transform.match.structured"(%arg24) <{failure_propagation_mode = 1 : i32}> ({
    ^bb0(%arg25: !transform.any_op):
      %16 = "transform.match.structured.result"(%arg25) <{position = 0 : i64}> : (!transform.any_op) -> !transform.any_value
      "transform.match.structured.yield"(%16, %arg25) : (!transform.any_value, !transform.any_op) -> ()
    }) : (!transform.any_op) -> (!transform.any_value, !transform.any_op)
    "transform.yield"(%15#0, %15#1) : (!transform.any_value, !transform.any_op) -> ()
  }) : () -> ()
  "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> !transform.any_op, sym_name = "match_any_result"}> ({
  ^bb0(%arg22: !transform.any_op):
    %13 = "transform.match.structured"(%arg22) <{failure_propagation_mode = 1 : i32}> ({
    ^bb0(%arg23: !transform.any_op):
      %14 = "transform.match.structured.result"(%arg23) <{any, position = -1 : i64}> : (!transform.any_op) -> !transform.any_op
      "transform.match.structured.yield"(%arg23) : (!transform.any_op) -> ()
    }) : (!transform.any_op) -> !transform.any_op
    "transform.yield"(%13) : (!transform.any_op) -> ()
  }) : () -> ()
  "transform.named_sequence"() <{arg_attrs = [{transform.readonly}, {transform.readonly}], function_type = (!transform.any_op, !transform.any_op) -> (), sym_name = "print_single_result"}> ({
  ^bb0(%arg20: !transform.any_op, %arg21: !transform.any_op):
    "transform.debug.emit_remark_at"(%arg21) <{message = "matched single result"}> : (!transform.any_op) -> ()
    "transform.debug.emit_remark_at"(%arg20) <{message = "single user"}> : (!transform.any_op) -> ()
    "transform.yield"() : () -> ()
  }) : () -> ()
  "transform.named_sequence"() <{arg_attrs = [{transform.readonly}, {transform.readonly}], function_type = (!transform.any_value, !transform.any_op) -> (), sym_name = "print_result_value"}> ({
  ^bb0(%arg18: !transform.any_value, %arg19: !transform.any_op):
    "transform.debug.emit_remark_at"(%arg19) <{message = "matched result value"}> : (!transform.any_op) -> ()
    "transform.debug.emit_remark_at"(%arg18) <{message = "op result"}> : (!transform.any_value) -> ()
    "transform.yield"() : () -> ()
  }) : () -> ()
  "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "print_any_result"}> ({
  ^bb0(%arg17: !transform.any_op):
    "transform.debug.emit_remark_at"(%arg17) <{message = "matched any result"}> : (!transform.any_op) -> ()
    "transform.yield"() : () -> ()
  }) : () -> ()
  "transform.named_sequence"() <{arg_attrs = [{transform.consumed}], function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
  ^bb0(%arg16: !transform.any_op):
    %10 = "transform.foreach_match"(%arg16) <{actions = [@print_single_result], matchers = [@match_single_result]}> : (!transform.any_op) -> !transform.any_op
    %11 = "transform.foreach_match"(%10) <{actions = [@print_result_value], matchers = [@match_result_value]}> : (!transform.any_op) -> !transform.any_op
    %12 = "transform.foreach_match"(%11) <{actions = [@print_any_result], matchers = [@match_any_result]}> : (!transform.any_op) -> !transform.any_op
    "transform.yield"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (f32, f32, f32, tensor<42x42xf32>) -> (), sym_name = "payload"}> ({
  ^bb0(%arg0: f32, %arg1: f32, %arg2: f32, %arg3: tensor<42x42xf32>):
    %0 = "tensor.empty"() : () -> tensor<42x42xf32>
    %1 = "linalg.fill"(%arg0, %0) <{operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg14: f32, %arg15: f32):
      "linalg.yield"(%arg14) : (f32) -> ()
    }) : (f32, tensor<42x42xf32>) -> tensor<42x42xf32>
    %2 = "linalg.fill"(%arg1, %0) <{operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg12: f32, %arg13: f32):
      "linalg.yield"(%arg12) : (f32) -> ()
    }) : (f32, tensor<42x42xf32>) -> tensor<42x42xf32>
    %3 = "linalg.fill"(%arg2, %0) <{operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg10: f32, %arg11: f32):
      "linalg.yield"(%arg10) : (f32) -> ()
    }) : (f32, tensor<42x42xf32>) -> tensor<42x42xf32>
    %4 = "linalg.negf"(%2, %0) <{operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg8: f32, %arg9: f32):
      %9 = "arith.negf"(%arg8) <{fastmath = #arith.fastmath<none>}> : (f32) -> f32
      "linalg.yield"(%9) : (f32) -> ()
    }) : (tensor<42x42xf32>, tensor<42x42xf32>) -> tensor<42x42xf32>
    %5 = "linalg.exp"(%3, %0) <{operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg6: f32, %arg7: f32):
      %8 = "math.exp"(%arg6) <{fastmath = #arith.fastmath<none>}> : (f32) -> f32
      "linalg.yield"(%8) : (f32) -> ()
    }) : (tensor<42x42xf32>, tensor<42x42xf32>) -> tensor<42x42xf32>
    %6 = "linalg.exp"(%3, %0) <{operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg4: f32, %arg5: f32):
      %7 = "math.exp"(%arg4) <{fastmath = #arith.fastmath<none>}> : (f32) -> f32
      "linalg.yield"(%7) : (f32) -> ()
    }) : (tensor<42x42xf32>, tensor<42x42xf32>) -> tensor<42x42xf32>
    "func.return"() : () -> ()
  }) {transform.target_tag = "start_here"} : () -> ()
}) {transform.with_named_sequence} : () -> ()

// -----
#map = affine_map<(d0, d1, d2) -> (d0, d2)>
#map1 = affine_map<(d0, d1, d2) -> (d2, d1)>
#map2 = affine_map<(d0, d1, d2) -> (d0, d1)>
"builtin.module"() ({
  "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (!transform.affine_map, !transform.any_op), sym_name = "match_input_indexing_map"}> ({
  ^bb0(%arg14: !transform.any_op):
    %10 = "transform.match.structured"(%arg14) <{failure_propagation_mode = 1 : i32}> ({
    ^bb0(%arg15: !transform.any_op):
      %11 = "transform.match.structured.input"(%arg15) <{raw_position_list = array<i64: 0>}> : (!transform.any_op) -> !transform.affine_map
      "transform.match.structured.yield"(%11) : (!transform.affine_map) -> ()
    }) : (!transform.any_op) -> !transform.affine_map
    "transform.yield"(%10, %arg14) : (!transform.affine_map, !transform.any_op) -> ()
  }) : () -> ()
  "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (!transform.affine_map, !transform.any_op), sym_name = "match_init_indexing_map"}> ({
  ^bb0(%arg12: !transform.any_op):
    %8 = "transform.match.structured"(%arg12) <{failure_propagation_mode = 1 : i32}> ({
    ^bb0(%arg13: !transform.any_op):
      %9 = "transform.match.structured.init"(%arg13) <{raw_position_list = array<i64: 0>}> : (!transform.any_op) -> !transform.affine_map
      "transform.match.structured.yield"(%9) : (!transform.affine_map) -> ()
    }) : (!transform.any_op) -> !transform.affine_map
    "transform.yield"(%8, %arg12) : (!transform.affine_map, !transform.any_op) -> ()
  }) : () -> ()
  "transform.named_sequence"() <{arg_attrs = [{transform.readonly}, {transform.readonly}], function_type = (!transform.affine_map, !transform.any_op) -> (), sym_name = "print_indexing_map_1"}> ({
  ^bb0(%arg10: !transform.affine_map, %arg11: !transform.any_op):
    "transform.debug.emit_param_as_remark"(%arg10, %arg11) <{message = "indexing map 1"}> : (!transform.affine_map, !transform.any_op) -> ()
    "transform.yield"() : () -> ()
  }) : () -> ()
  "transform.named_sequence"() <{arg_attrs = [{transform.readonly}, {transform.readonly}], function_type = (!transform.affine_map, !transform.any_op) -> (), sym_name = "print_indexing_map_2"}> ({
  ^bb0(%arg8: !transform.affine_map, %arg9: !transform.any_op):
    "transform.debug.emit_param_as_remark"(%arg8, %arg9) <{message = "indexing map 2"}> : (!transform.affine_map, !transform.any_op) -> ()
    "transform.yield"() : () -> ()
  }) : () -> ()
  "transform.named_sequence"() <{arg_attrs = [{transform.consumed}], function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
  ^bb0(%arg7: !transform.any_op):
    %6 = "transform.foreach_match"(%arg7) <{actions = [@print_indexing_map_1], matchers = [@match_input_indexing_map]}> : (!transform.any_op) -> !transform.any_op
    %7 = "transform.foreach_match"(%6) <{actions = [@print_indexing_map_2], matchers = [@match_init_indexing_map]}> : (!transform.any_op) -> !transform.any_op
    "transform.yield"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<32x32xf32>, tensor<32x32xf32>) -> (), sym_name = "payload"}> ({
  ^bb0(%arg0: tensor<32x32xf32>, %arg1: tensor<32x32xf32>):
    %0 = "tensor.empty"() : () -> tensor<32x32xf32>
    %1 = "arith.constant"() <{value = 1.000000e+00 : f32}> : () -> f32
    %2 = "linalg.fill"(%1, %0) <{operandSegmentSizes = array<i32: 1, 1>}> ({
    ^bb0(%arg5: f32, %arg6: f32):
      "linalg.yield"(%arg5) : (f32) -> ()
    }) : (f32, tensor<32x32xf32>) -> tensor<32x32xf32>
    %3 = "linalg.matmul"(%arg0, %arg1, %2) <{indexing_maps = [#map, #map1, #map2], operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg2: f32, %arg3: f32, %arg4: f32):
      %4 = "arith.mulf"(%arg2, %arg3) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      %5 = "arith.addf"(%arg4, %4) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%5) : (f32) -> ()
    }) : (tensor<32x32xf32>, tensor<32x32xf32>, tensor<32x32xf32>) -> tensor<32x32xf32>
    "func.return"() : () -> ()
  }) {transform.target_tag = "start_here"} : () -> ()
}) {transform.with_named_sequence} : () -> ()

// -----
#map = affine_map<(d0, d1, d2) -> (d0, d2)>
#map1 = affine_map<(d0, d1, d2) -> (d2, d1)>
#map2 = affine_map<(d0, d1, d2) -> (d0, d1)>
#map3 = affine_map<(d0, d1) -> (d1)>
#map4 = affine_map<(d0, d1) -> (d1, d0)>
#map5 = affine_map<(d0, d1) -> (d0)>
#map6 = affine_map<(d0, d1, d2, d3, d4) -> (d0, d1, d2, d4)>
#map7 = affine_map<(d0, d1, d2, d3, d4) -> (d0, d4, d2, d3)>
#map8 = affine_map<(d0, d1, d2, d3, d4) -> (d0, d1, d2, d3)>
#map9 = affine_map<(d0, d1, d2, d3) -> (d0, d1 * 2 + d3 * 2, d2)>
#map10 = affine_map<(d0, d1, d2, d3) -> (d3)>
#map11 = affine_map<(d0, d1, d2, d3) -> (d0, d1, d2)>
"builtin.module"() ({
  "builtin.module"() ({
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (!transform.any_op, !transform.param<i64>, !transform.param<i64>, !transform.param<i64>, !transform.param<i64>), sym_name = "match_contraction"}> ({
    ^bb0(%arg39: !transform.any_op):
      %26:4 = "transform.match.structured"(%arg39) ({
      ^bb0(%arg40: !transform.any_op):
        "transform.match.structured.body"(%arg40) <{contraction = ["arith.mulf", "arith.addf"]}> : (!transform.any_op) -> ()
        %27:4 = "transform.match.structured.classify_contraction_dims"(%arg40) : (!transform.any_op) -> (!transform.param<i64>, !transform.param<i64>, !transform.param<i64>, !transform.param<i64>)
        "transform.match.structured.yield"(%27#0, %27#1, %27#2, %27#3) : (!transform.param<i64>, !transform.param<i64>, !transform.param<i64>, !transform.param<i64>) -> ()
      }) : (!transform.any_op) -> (!transform.param<i64>, !transform.param<i64>, !transform.param<i64>, !transform.param<i64>)
      "transform.yield"(%arg39, %26#0, %26#1, %26#2, %26#3) : (!transform.any_op, !transform.param<i64>, !transform.param<i64>, !transform.param<i64>, !transform.param<i64>) -> ()
    }) : () -> ()
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}, {transform.readonly}, {transform.readonly}, {transform.readonly}, {transform.readonly}], function_type = (!transform.any_op, !transform.param<i64>, !transform.param<i64>, !transform.param<i64>, !transform.param<i64>) -> (), sym_name = "print_contraction"}> ({
    ^bb0(%arg34: !transform.any_op, %arg35: !transform.param<i64>, %arg36: !transform.param<i64>, %arg37: !transform.param<i64>, %arg38: !transform.param<i64>):
      "transform.debug.emit_remark_at"(%arg34) <{message = "contraction"}> : (!transform.any_op) -> ()
      "transform.debug.emit_param_as_remark"(%arg35, %arg34) <{message = "batch dims"}> : (!transform.param<i64>, !transform.any_op) -> ()
      "transform.debug.emit_param_as_remark"(%arg36, %arg34) <{message = "m dims"}> : (!transform.param<i64>, !transform.any_op) -> ()
      "transform.debug.emit_param_as_remark"(%arg37, %arg34) <{message = "n dims"}> : (!transform.param<i64>, !transform.any_op) -> ()
      "transform.debug.emit_param_as_remark"(%arg38, %arg34) <{message = "k dims"}> : (!transform.param<i64>, !transform.any_op) -> ()
      "transform.yield"() : () -> ()
    }) : () -> ()
    "transform.named_sequence"() <{arg_attrs = [{transform.consumed}], function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg33: !transform.any_op):
      %25 = "transform.foreach_match"(%arg33) <{actions = [@print_contraction], matchers = [@match_contraction]}> : (!transform.any_op) -> !transform.any_op
      "transform.yield"() : () -> ()
    }) : () -> ()
  }) {transform.with_named_sequence} : () -> ()
  "builtin.module"() ({
    "func.func"() <{function_type = (tensor<10x20xf32>, tensor<20x15xf32>) -> tensor<10x15xf64>, sym_name = "matmul_simple"}> ({
    ^bb0(%arg26: tensor<10x20xf32>, %arg27: tensor<20x15xf32>):
      %17 = "arith.constant"() <{value = 0.000000e+00 : f64}> : () -> f64
      %18 = "tensor.empty"() : () -> tensor<10x15xf64>
      %19 = "linalg.fill"(%17, %18) <{operandSegmentSizes = array<i32: 1, 1>}> ({
      ^bb0(%arg31: f64, %arg32: f64):
        "linalg.yield"(%arg31) : (f64) -> ()
      }) : (f64, tensor<10x15xf64>) -> tensor<10x15xf64>
      %20 = "linalg.matmul"(%arg26, %arg27, %19) <{indexing_maps = [#map, #map1, #map2], operandSegmentSizes = array<i32: 2, 1>}> ({
      ^bb0(%arg28: f32, %arg29: f32, %arg30: f64):
        %21 = "arith.extf"(%arg28) : (f32) -> f64
        %22 = "arith.extf"(%arg29) : (f32) -> f64
        %23 = "arith.mulf"(%21, %22) <{fastmath = #arith.fastmath<none>}> : (f64, f64) -> f64
        %24 = "arith.addf"(%arg30, %23) <{fastmath = #arith.fastmath<none>}> : (f64, f64) -> f64
        "linalg.yield"(%24) : (f64) -> ()
      }) : (tensor<10x20xf32>, tensor<20x15xf32>, tensor<10x15xf64>) -> tensor<10x15xf64>
      "func.return"(%20) : (tensor<10x15xf64>) -> ()
    }) : () -> ()
    "func.func"() <{function_type = (tensor<20xf32>, tensor<20x15xf32>) -> tensor<15xf64>, sym_name = "vecmat_simple"}> ({
    ^bb0(%arg19: tensor<20xf32>, %arg20: tensor<20x15xf32>):
      %9 = "arith.constant"() <{value = 0.000000e+00 : f64}> : () -> f64
      %10 = "tensor.empty"() : () -> tensor<15xf64>
      %11 = "linalg.fill"(%9, %10) <{operandSegmentSizes = array<i32: 1, 1>}> ({
      ^bb0(%arg24: f64, %arg25: f64):
        "linalg.yield"(%arg24) : (f64) -> ()
      }) : (f64, tensor<15xf64>) -> tensor<15xf64>
      %12 = "linalg.vecmat"(%arg19, %arg20, %11) <{operandSegmentSizes = array<i32: 2, 1>}> ({
      ^bb0(%arg21: f32, %arg22: f32, %arg23: f64):
        %13 = "arith.extf"(%arg21) : (f32) -> f64
        %14 = "arith.extf"(%arg22) : (f32) -> f64
        %15 = "arith.mulf"(%13, %14) <{fastmath = #arith.fastmath<none>}> : (f64, f64) -> f64
        %16 = "arith.addf"(%arg23, %15) <{fastmath = #arith.fastmath<none>}> : (f64, f64) -> f64
        "linalg.yield"(%16) : (f64) -> ()
      }) {linalg.memoized_indexing_maps = [#map3, #map4, #map5]} : (tensor<20xf32>, tensor<20x15xf32>, tensor<15xf64>) -> tensor<15xf64>
      "func.return"(%12) : (tensor<15xf64>) -> ()
    }) : () -> ()
    "func.func"() <{function_type = (tensor<40x10x50x20xf32>, tensor<40x20x50x15xf32>) -> tensor<40x10x50x15xf32>, sym_name = "double_batch"}> ({
    ^bb0(%arg12: tensor<40x10x50x20xf32>, %arg13: tensor<40x20x50x15xf32>):
      %3 = "arith.constant"() <{value = 0.000000e+00 : f32}> : () -> f32
      %4 = "tensor.empty"() : () -> tensor<40x10x50x15xf32>
      %5 = "linalg.fill"(%3, %4) <{operandSegmentSizes = array<i32: 1, 1>}> ({
      ^bb0(%arg17: f32, %arg18: f32):
        "linalg.yield"(%arg17) : (f32) -> ()
      }) : (f32, tensor<40x10x50x15xf32>) -> tensor<40x10x50x15xf32>
      %6 = "linalg.generic"(%arg12, %arg13, %5) <{indexing_maps = [#map6, #map7, #map8], iterator_types = [#linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>, #linalg.iterator_type<reduction>], operandSegmentSizes = array<i32: 2, 1>}> ({
      ^bb0(%arg14: f32, %arg15: f32, %arg16: f32):
        %7 = "arith.mulf"(%arg14, %arg15) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
        %8 = "arith.addf"(%arg16, %7) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
        "linalg.yield"(%8) : (f32) -> ()
      }) : (tensor<40x10x50x20xf32>, tensor<40x20x50x15xf32>, tensor<40x10x50x15xf32>) -> tensor<40x10x50x15xf32>
      "func.return"(%6) : (tensor<40x10x50x15xf32>) -> ()
    }) : () -> ()
    "func.func"() <{function_type = (tensor<1x7x4xf32>, tensor<4xf32>, tensor<1x1x4xf32>) -> (), sym_name = "generic_min"}> ({
    ^bb0(%arg6: tensor<1x7x4xf32>, %arg7: tensor<4xf32>, %arg8: tensor<1x1x4xf32>):
      %1 = "linalg.generic"(%arg6, %arg7, %arg8) <{indexing_maps = [#map9, #map10, #map11], iterator_types = [#linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>, #linalg.iterator_type<reduction>], operandSegmentSizes = array<i32: 2, 1>}> ({
      ^bb0(%arg9: f32, %arg10: f32, %arg11: f32):
        %2 = "arith.minimumf"(%arg11, %arg9) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
        "linalg.yield"(%2) : (f32) -> ()
      }) : (tensor<1x7x4xf32>, tensor<4xf32>, tensor<1x1x4xf32>) -> tensor<1x1x4xf32>
      "func.return"() : () -> ()
    }) : () -> ()
    "func.func"() <{function_type = (tensor<128x128xi32>, tensor<128x128xi32>, tensor<128x128xi32>) -> (), sym_name = "generic_none"}> ({
    ^bb0(%arg0: tensor<128x128xi32>, %arg1: tensor<128x128xi32>, %arg2: tensor<128x128xi32>):
      %0 = "linalg.generic"(%arg0, %arg1, %arg2) <{indexing_maps = [#map, #map1, #map2], iterator_types = [#linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>, #linalg.iterator_type<reduction>], operandSegmentSizes = array<i32: 2, 1>}> ({
      ^bb0(%arg3: i32, %arg4: i32, %arg5: i32):
        "linalg.yield"(%arg5) : (i32) -> ()
      }) : (tensor<128x128xi32>, tensor<128x128xi32>, tensor<128x128xi32>) -> tensor<128x128xi32>
      "func.return"() : () -> ()
    }) : () -> ()
  }) {transform.target_tag = "start_here"} : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1, d2, d3, d4) -> (d0, d1 + d3, d4)>
#map1 = affine_map<(d0, d1, d2, d3, d4) -> (d3, d4, d2)>
#map2 = affine_map<(d0, d1, d2, d3, d4) -> (d0, d1, d2)>
#map3 = affine_map<(d0, d1, d2, d3, d4, d5) -> (d0, d1 + d4, d2 + d5, d3)>
#map4 = affine_map<(d0, d1, d2, d3, d4, d5) -> (d4, d5, d3)>
#map5 = affine_map<(d0, d1, d2, d3, d4, d5) -> (d0, d1, d2, d3)>
#map6 = affine_map<(d0, d1, d2, d3, d4, d5, d6, d7) -> (d4, d1 + d5, d2 * 2 + d6, d7)>
#map7 = affine_map<(d0, d1, d2, d3, d4, d5, d6, d7) -> (d0, d4, d5, d6, d7, d3)>
#map8 = affine_map<(d0, d1, d2, d3, d4, d5, d6, d7) -> (d0, d1, d2, d3)>
"builtin.module"() ({
  "builtin.module"() ({
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (!transform.any_op, !transform.param<i64>, !transform.param<i64>, !transform.param<i64>, !transform.param<i64>, !transform.param<i64>, !transform.param<i64>, !transform.param<i64>, !transform.param<i64>), sym_name = "match_convolution"}> ({
    ^bb0(%arg31: !transform.any_op):
      %21:8 = "transform.match.structured"(%arg31) ({
      ^bb0(%arg32: !transform.any_op):
        "transform.match.structured.body"(%arg32) <{contraction = ["arith.mulf", "arith.addf"]}> : (!transform.any_op) -> ()
        %22:8 = "transform.match.structured.classify_convolution_dims"(%arg32) : (!transform.any_op) -> (!transform.param<i64>, !transform.param<i64>, !transform.param<i64>, !transform.param<i64>, !transform.param<i64>, !transform.param<i64>, !transform.param<i64>, !transform.param<i64>)
        "transform.match.structured.yield"(%22#0, %22#1, %22#2, %22#3, %22#4, %22#5, %22#6, %22#7) : (!transform.param<i64>, !transform.param<i64>, !transform.param<i64>, !transform.param<i64>, !transform.param<i64>, !transform.param<i64>, !transform.param<i64>, !transform.param<i64>) -> ()
      }) : (!transform.any_op) -> (!transform.param<i64>, !transform.param<i64>, !transform.param<i64>, !transform.param<i64>, !transform.param<i64>, !transform.param<i64>, !transform.param<i64>, !transform.param<i64>)
      "transform.yield"(%arg31, %21#0, %21#1, %21#2, %21#3, %21#4, %21#5, %21#6, %21#7) : (!transform.any_op, !transform.param<i64>, !transform.param<i64>, !transform.param<i64>, !transform.param<i64>, !transform.param<i64>, !transform.param<i64>, !transform.param<i64>, !transform.param<i64>) -> ()
    }) : () -> ()
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}, {transform.readonly}, {transform.readonly}, {transform.readonly}, {transform.readonly}, {transform.readonly}, {transform.readonly}, {transform.readonly}, {transform.readonly}], function_type = (!transform.any_op, !transform.param<i64>, !transform.param<i64>, !transform.param<i64>, !transform.param<i64>, !transform.param<i64>, !transform.param<i64>, !transform.param<i64>, !transform.param<i64>) -> (), sym_name = "print_convolution"}> ({
    ^bb0(%arg22: !transform.any_op, %arg23: !transform.param<i64>, %arg24: !transform.param<i64>, %arg25: !transform.param<i64>, %arg26: !transform.param<i64>, %arg27: !transform.param<i64>, %arg28: !transform.param<i64>, %arg29: !transform.param<i64>, %arg30: !transform.param<i64>):
      "transform.debug.emit_remark_at"(%arg22) <{message = "convolution"}> : (!transform.any_op) -> ()
      "transform.debug.emit_param_as_remark"(%arg23, %arg22) <{message = "batch dims"}> : (!transform.param<i64>, !transform.any_op) -> ()
      "transform.debug.emit_param_as_remark"(%arg24, %arg22) <{message = "output image dims"}> : (!transform.param<i64>, !transform.any_op) -> ()
      "transform.debug.emit_param_as_remark"(%arg25, %arg22) <{message = "output channel dims"}> : (!transform.param<i64>, !transform.any_op) -> ()
      "transform.debug.emit_param_as_remark"(%arg26, %arg22) <{message = "filter loop dims"}> : (!transform.param<i64>, !transform.any_op) -> ()
      "transform.debug.emit_param_as_remark"(%arg27, %arg22) <{message = "input channel dims"}> : (!transform.param<i64>, !transform.any_op) -> ()
      "transform.debug.emit_param_as_remark"(%arg28, %arg22) <{message = "depth dims"}> : (!transform.param<i64>, !transform.any_op) -> ()
      "transform.debug.emit_param_as_remark"(%arg29, %arg22) <{message = "strides"}> : (!transform.param<i64>, !transform.any_op) -> ()
      "transform.debug.emit_param_as_remark"(%arg30, %arg22) <{message = "dilations"}> : (!transform.param<i64>, !transform.any_op) -> ()
      "transform.yield"() : () -> ()
    }) : () -> ()
    "transform.named_sequence"() <{arg_attrs = [{transform.consumed}], function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg21: !transform.any_op):
      %20 = "transform.foreach_match"(%arg21) <{actions = [@print_convolution], matchers = [@match_convolution]}> : (!transform.any_op) -> !transform.any_op
      "transform.yield"() : () -> ()
    }) : () -> ()
  }) {transform.with_named_sequence} : () -> ()
  "builtin.module"() ({
    "func.func"() <{function_type = (tensor<10x20x30xf32>, tensor<3x30x15xf32>) -> tensor<10x18x15xf64>, sym_name = "convolution_simple"}> ({
    ^bb0(%arg14: tensor<10x20x30xf32>, %arg15: tensor<3x30x15xf32>):
      %12 = "arith.constant"() <{value = 0.000000e+00 : f64}> : () -> f64
      %13 = "tensor.empty"() : () -> tensor<10x18x15xf64>
      %14 = "linalg.fill"(%12, %13) <{operandSegmentSizes = array<i32: 1, 1>}> ({
      ^bb0(%arg19: f64, %arg20: f64):
        "linalg.yield"(%arg19) : (f64) -> ()
      }) : (f64, tensor<10x18x15xf64>) -> tensor<10x18x15xf64>
      %15 = "linalg.conv_1d_nwc_wcf"(%arg14, %arg15, %14) <{dilations = dense<1> : tensor<1xi64>, operandSegmentSizes = array<i32: 2, 1>, strides = dense<1> : tensor<1xi64>}> ({
      ^bb0(%arg16: f32, %arg17: f32, %arg18: f64):
        %16 = "arith.extf"(%arg16) : (f32) -> f64
        %17 = "arith.extf"(%arg17) : (f32) -> f64
        %18 = "arith.mulf"(%16, %17) <{fastmath = #arith.fastmath<none>}> : (f64, f64) -> f64
        %19 = "arith.addf"(%arg18, %18) <{fastmath = #arith.fastmath<none>}> : (f64, f64) -> f64
        "linalg.yield"(%19) : (f64) -> ()
      }) {linalg.memoized_indexing_maps = [#map, #map1, #map2]} : (tensor<10x20x30xf32>, tensor<3x30x15xf32>, tensor<10x18x15xf64>) -> tensor<10x18x15xf64>
      "func.return"(%15) : (tensor<10x18x15xf64>) -> ()
    }) : () -> ()
    "func.func"() <{function_type = (tensor<1x10x196x48xf32>, tensor<1x4x48xf32>) -> tensor<1x10x191x48xf32>, sym_name = "convolution_depthwise"}> ({
    ^bb0(%arg7: tensor<1x10x196x48xf32>, %arg8: tensor<1x4x48xf32>):
      %6 = "arith.constant"() <{value = 0.000000e+00 : f32}> : () -> f32
      %7 = "tensor.empty"() : () -> tensor<1x10x191x48xf32>
      %8 = "linalg.fill"(%6, %7) <{operandSegmentSizes = array<i32: 1, 1>}> ({
      ^bb0(%arg12: f32, %arg13: f32):
        "linalg.yield"(%arg12) : (f32) -> ()
      }) : (f32, tensor<1x10x191x48xf32>) -> tensor<1x10x191x48xf32>
      %9 = "linalg.depthwise_conv_2d_nhwc_hwc"(%arg7, %arg8, %8) <{dilations = dense<1> : tensor<2xi64>, operandSegmentSizes = array<i32: 2, 1>, strides = dense<1> : tensor<2xi64>}> ({
      ^bb0(%arg9: f32, %arg10: f32, %arg11: f32):
        %10 = "arith.mulf"(%arg9, %arg10) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
        %11 = "arith.addf"(%arg11, %10) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
        "linalg.yield"(%11) : (f32) -> ()
      }) {linalg.memoized_indexing_maps = [#map3, #map4, #map5]} : (tensor<1x10x196x48xf32>, tensor<1x4x48xf32>, tensor<1x10x191x48xf32>) -> tensor<1x10x191x48xf32>
      "func.return"(%9) : (tensor<1x10x191x48xf32>) -> ()
    }) : () -> ()
    "func.func"() <{function_type = (tensor<2x34x68x16xf32>, tensor<8x2x3x5x16x16xf32>) -> tensor<8x32x32x16xf32>, sym_name = "convolution_multi_channel"}> ({
    ^bb0(%arg0: tensor<2x34x68x16xf32>, %arg1: tensor<8x2x3x5x16x16xf32>):
      %0 = "arith.constant"() <{value = 0.000000e+00 : f32}> : () -> f32
      %1 = "tensor.empty"() : () -> tensor<8x32x32x16xf32>
      %2 = "linalg.fill"(%0, %1) <{operandSegmentSizes = array<i32: 1, 1>}> ({
      ^bb0(%arg5: f32, %arg6: f32):
        "linalg.yield"(%arg5) : (f32) -> ()
      }) : (f32, tensor<8x32x32x16xf32>) -> tensor<8x32x32x16xf32>
      %3 = "linalg.generic"(%arg0, %arg1, %2) <{indexing_maps = [#map6, #map7, #map8], iterator_types = [#linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>, #linalg.iterator_type<parallel>, #linalg.iterator_type<reduction>, #linalg.iterator_type<reduction>, #linalg.iterator_type<reduction>, #linalg.iterator_type<reduction>], operandSegmentSizes = array<i32: 2, 1>}> ({
      ^bb0(%arg2: f32, %arg3: f32, %arg4: f32):
        %4 = "arith.mulf"(%arg2, %arg3) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
        %5 = "arith.addf"(%4, %arg4) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
        "linalg.yield"(%5) : (f32) -> ()
      }) : (tensor<2x34x68x16xf32>, tensor<8x2x3x5x16x16xf32>, tensor<8x32x32x16xf32>) -> tensor<8x32x32x16xf32>
      "func.return"(%3) : (tensor<8x32x32x16xf32>) -> ()
    }) : () -> ()
  }) {transform.target_tag = "start_here"} : () -> ()
}) : () -> ()

