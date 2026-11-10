"builtin.module"() ({
  "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "schedule_with_nondet_knobs"}> ({
  ^bb0(%arg1: !transform.any_op):
    %0 = "transform.tune.knob"() <{name = "coin", options = [true, false]}> : () -> !transform.any_param
    %1 = "transform.tune.knob"() <{name = "animal", options = ["cat", "dog", unit]}> : () -> !transform.any_param
    %2 = "transform.tune.knob"() <{name = "tile_size", options = [2, 4, 8, 16, 24, 32]}> : () -> !transform.any_param
    %3 = "transform.tune.knob"() <{name = "magic_value", options = [2.000000e+00 : f32, 2.250000e+00 : f32, 2.500000e+00 : f32, 2.750000e+00 : f32, 3.000000e+00 : f32]}> : () -> !transform.any_param
    "transform.debug.emit_param_as_remark"(%0) : (!transform.any_param) -> ()
    "transform.yield"() : () -> ()
  }) : () -> ()
  "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
  ^bb0(%arg0: !transform.any_op):
    "transform.yield"() : () -> ()
  }) : () -> ()
}) {transform.with_named_sequence} : () -> ()

// -----
#set = affine_set<(d0) : (d0 - 2 >= 0)>
"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "payload_for_schedule_where_selected_knob_being_a_member_of_options_is_unverified", sym_visibility = "private"}> ({
  }) : () -> ()
  "builtin.module"() ({
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg0: !transform.any_op):
      %0 = "transform.tune.knob"() <{name = "bounded", options = #set, selected = 4242 : i64}> : () -> !transform.any_param
      "transform.yield"() : () -> ()
    }) : () -> ()
  }) {transform.with_named_sequence} : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1, d2) -> (d0, d2)>
#map1 = affine_map<(d0, d1, d2) -> (d2, d1)>
#map2 = affine_map<(d0, d1, d2) -> (d0, d1)>
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<128x128xf32>, tensor<128x128xf32>, tensor<128x128xf32>) -> tensor<128x128xf32>, sym_name = "schedule_with_two_independent_choices_already_made"}> ({
  ^bb0(%arg1: tensor<128x128xf32>, %arg2: tensor<128x128xf32>, %arg3: tensor<128x128xf32>):
    %7 = "linalg.matmul"(%arg1, %arg2, %arg3) <{indexing_maps = [#map, #map1, #map2], operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg4: f32, %arg5: f32, %arg6: f32):
      %8 = "arith.mulf"(%arg4, %arg5) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      %9 = "arith.addf"(%arg6, %8) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%9) : (f32) -> ()
    }) : (tensor<128x128xf32>, tensor<128x128xf32>, tensor<128x128xf32>) -> tensor<128x128xf32>
    "func.return"(%7) : (tensor<128x128xf32>) -> ()
  }) : () -> ()
  "builtin.module"() ({
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg0: !transform.any_op):
      %0 = "transform.structured.match"(%arg0) <{ops = ["linalg.matmul"]}> : (!transform.any_op) -> !transform.any_op
      %1 = "transform.tune.alternatives"() <{name = "outer_par_or_seq_tiling", selected_region_attr = 0 : index}> ({
        %6:2 = "transform.structured.tile_using_for"(%0) <{scalable_sizes = array<i1: false>, static_sizes = array<i64: 8>}> : (!transform.any_op) -> (!transform.any_op, !transform.any_op)
        "transform.yield"(%6#0) : (!transform.any_op) -> ()
      }, {
        %5:2 = "transform.structured.tile_using_forall"(%0) <{operandSegmentSizes = array<i32: 1, 0, 0, 0, 0>, static_tile_sizes = array<i64: 8>}> : (!transform.any_op) -> (!transform.any_op, !transform.any_op)
        "transform.yield"(%5#0) : (!transform.any_op) -> ()
      }) : () -> !transform.any_op
      %2 = "transform.tune.alternatives"() <{name = "inner_par_or_seq_tiling", selected_region_attr = 1 : index}> ({
        %4:2 = "transform.structured.tile_using_for"(%1) <{scalable_sizes = array<i1: false, false>, static_sizes = array<i64: 0, 16>}> : (!transform.any_op) -> (!transform.any_op, !transform.any_op)
        "transform.yield"(%4#0) : (!transform.any_op) -> ()
      }, {
        %3:2 = "transform.structured.tile_using_forall"(%1) <{operandSegmentSizes = array<i32: 1, 0, 0, 0, 0>, static_tile_sizes = array<i64: 0, 16>}> : (!transform.any_op) -> (!transform.any_op, !transform.any_op)
        "transform.yield"(%3#0) : (!transform.any_op) -> ()
      }) : () -> !transform.any_op
      "transform.yield"() : () -> ()
    }) : () -> ()
  }) {transform.with_named_sequence} : () -> ()
}) : () -> ()

// -----
#map = affine_map<(d0, d1, d2) -> (d0, d2)>
#map1 = affine_map<(d0, d1, d2) -> (d2, d1)>
#map2 = affine_map<(d0, d1, d2) -> (d0, d1)>
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<128x128xf32>, tensor<128x128xf32>, tensor<128x128xf32>) -> tensor<128x128xf32>, sym_name = "subschedule_with_choice_resolved_in_main_schedule"}> ({
  ^bb0(%arg4: tensor<128x128xf32>, %arg5: tensor<128x128xf32>, %arg6: tensor<128x128xf32>):
    %10 = "linalg.matmul"(%arg4, %arg5, %arg6) <{indexing_maps = [#map, #map1, #map2], operandSegmentSizes = array<i32: 2, 1>}> ({
    ^bb0(%arg7: f32, %arg8: f32, %arg9: f32):
      %11 = "arith.mulf"(%arg7, %arg8) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      %12 = "arith.addf"(%arg9, %11) <{fastmath = #arith.fastmath<none>}> : (f32, f32) -> f32
      "linalg.yield"(%12) : (f32) -> ()
    }) : (tensor<128x128xf32>, tensor<128x128xf32>, tensor<128x128xf32>) -> tensor<128x128xf32>
    "func.return"(%10) : (tensor<128x128xf32>) -> ()
  }) : () -> ()
  "builtin.module"() ({
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}, {transform.readonly}, {transform.readonly}], function_type = (!transform.any_op, !transform.param<i64>, !transform.param<i64>) -> !transform.any_op, sym_name = "subschedule_with_embedded_choice"}> ({
    ^bb0(%arg1: !transform.any_op, %arg2: !transform.param<i64>, %arg3: !transform.param<i64>):
      %7 = "transform.tune.alternatives"(%arg2) <{name = "par_or_seq_tiling"}> ({
        %9:2 = "transform.structured.tile_using_for"(%arg1, %arg3) <{scalable_sizes = array<i1: false>, static_sizes = array<i64: -9223372036854775808>}> : (!transform.any_op, !transform.param<i64>) -> (!transform.any_op, !transform.any_op)
        "transform.yield"(%9#0) : (!transform.any_op) -> ()
      }, {
        %8:2 = "transform.structured.tile_using_forall"(%arg1, %arg3) <{operandSegmentSizes = array<i32: 1, 0, 1, 0, 0>, static_tile_sizes = array<i64: -9223372036854775808>}> : (!transform.any_op, !transform.param<i64>) -> (!transform.any_op, !transform.any_op)
        "transform.yield"(%8#0) : (!transform.any_op) -> ()
      }) : (!transform.param<i64>) -> !transform.any_op
      "transform.yield"(%7) : (!transform.any_op) -> ()
    }) : () -> ()
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg0: !transform.any_op):
      %0 = "transform.structured.match"(%arg0) <{ops = ["linalg.matmul"]}> : (!transform.any_op) -> !transform.any_op
      %1 = "transform.param.constant"() <{value = 1 : i64}> : () -> !transform.param<i64>
      %2 = "transform.param.constant"() <{value = 32 : i64}> : () -> !transform.param<i64>
      %3 = "transform.tune.knob"() <{name = "inner_par_or_seq", options = [0, 1], selected = 0 : i64}> : () -> !transform.param<i64>
      %4 = "transform.param.constant"() <{value = 8 : i64}> : () -> !transform.param<i64>
      %5 = "transform.include"(%0, %1, %2) <{failure_propagation_mode = 1 : i32, target = @subschedule_with_embedded_choice}> : (!transform.any_op, !transform.param<i64>, !transform.param<i64>) -> !transform.any_op
      %6 = "transform.include"(%5, %3, %4) <{failure_propagation_mode = 1 : i32, target = @subschedule_with_embedded_choice}> : (!transform.any_op, !transform.param<i64>, !transform.param<i64>) -> !transform.any_op
      "transform.yield"() : () -> ()
    }) : () -> ()
  }) {transform.with_named_sequence} : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "eeny_meeny_miny_moe", sym_visibility = "private"}> ({
  }) : () -> ()
  "builtin.module"() ({
    "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg0: !transform.any_op):
      %0 = "transform.structured.match"(%arg0) <{ops = ["linalg.matmul"]}> : (!transform.any_op) -> !transform.any_op
      %1 = "transform.tune.alternatives"() <{name = "4way", selected_region_attr = 3 : index}> ({
        %5 = "transform.param.constant"() <{value = "eeny"}> : () -> !transform.any_param
        "transform.yield"(%5) : (!transform.any_param) -> ()
      }, {
        %4 = "transform.param.constant"() <{value = "meeny"}> : () -> !transform.any_param
        "transform.yield"(%4) : (!transform.any_param) -> ()
      }, {
        %3 = "transform.param.constant"() <{value = "miny"}> : () -> !transform.any_param
        "transform.yield"(%3) : (!transform.any_param) -> ()
      }, {
        %2 = "transform.param.constant"() <{value = "moe"}> : () -> !transform.any_param
        "transform.yield"(%2) : (!transform.any_param) -> ()
      }) : () -> !transform.any_param
      "transform.yield"() : () -> ()
    }) : () -> ()
  }) {transform.with_named_sequence} : () -> ()
}) : () -> ()

