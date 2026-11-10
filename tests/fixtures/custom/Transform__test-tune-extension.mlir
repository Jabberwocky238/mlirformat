module attributes {transform.with_named_sequence} {
  transform.named_sequence @schedule_with_nondet_knobs(%arg0: !transform.any_op {transform.readonly}) {
    %0 = transform.tune.knob<"coin"> options = [true, false] -> !transform.any_param
    %1 = transform.tune.knob<"animal"> options = ["cat", "dog", unit] -> !transform.any_param
    %2 = transform.tune.knob<"tile_size"> options = [2, 4, 8, 16, 24, 32] -> !transform.any_param
    %3 = transform.tune.knob<"magic_value"> options = [2.000000e+00 : f32, 2.250000e+00 : f32, 2.500000e+00 : f32, 2.750000e+00 : f32, 3.000000e+00 : f32] -> !transform.any_param
    transform.debug.emit_param_as_remark %0 : !transform.any_param
    transform.yield 
  }
  transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
    transform.yield 
  }
}

// -----
#set = affine_set<(d0) : (d0 - 2 >= 0)>
module {
  func.func private @payload_for_schedule_where_selected_knob_being_a_member_of_options_is_unverified()
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.tune.knob<"bounded"> = 4242 : i64 from options = #set -> !transform.any_param
      transform.yield 
    }
  }
}

// -----
module {
  func.func @schedule_with_two_independent_choices_already_made(%arg0: tensor<128x128xf32>, %arg1: tensor<128x128xf32>, %arg2: tensor<128x128xf32>) -> tensor<128x128xf32> {
    %0 = linalg.matmul ins(%arg0, %arg1 : tensor<128x128xf32>, tensor<128x128xf32>) outs(%arg2 : tensor<128x128xf32>) -> tensor<128x128xf32>
    return %0 : tensor<128x128xf32>
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["linalg.matmul"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      %1 = transform.tune.alternatives<"outer_par_or_seq_tiling"> selected_region = 0 -> !transform.any_op {
        %tiled_linalg_op, %loops = transform.structured.tile_using_for %0 tile_sizes [8] : (!transform.any_op) -> (!transform.any_op, !transform.any_op)
        transform.yield %tiled_linalg_op : !transform.any_op
      }, {
        %tiled_op, %forall_op = transform.structured.tile_using_forall %0 tile_sizes [8] : (!transform.any_op) -> (!transform.any_op, !transform.any_op)
        transform.yield %tiled_op : !transform.any_op
      }
      %2 = transform.tune.alternatives<"inner_par_or_seq_tiling"> selected_region = 1 -> !transform.any_op {
        %tiled_linalg_op, %loops = transform.structured.tile_using_for %1 tile_sizes [0, 16] : (!transform.any_op) -> (!transform.any_op, !transform.any_op)
        transform.yield %tiled_linalg_op : !transform.any_op
      }, {
        %tiled_op, %forall_op = transform.structured.tile_using_forall %1 tile_sizes [0, 16] : (!transform.any_op) -> (!transform.any_op, !transform.any_op)
        transform.yield %tiled_op : !transform.any_op
      }
      transform.yield 
    }
  }
}

// -----
module {
  func.func @subschedule_with_choice_resolved_in_main_schedule(%arg0: tensor<128x128xf32>, %arg1: tensor<128x128xf32>, %arg2: tensor<128x128xf32>) -> tensor<128x128xf32> {
    %0 = linalg.matmul ins(%arg0, %arg1 : tensor<128x128xf32>, tensor<128x128xf32>) outs(%arg2 : tensor<128x128xf32>) -> tensor<128x128xf32>
    return %0 : tensor<128x128xf32>
  }
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @subschedule_with_embedded_choice(%arg0: !transform.any_op {transform.readonly}, %arg1: !transform.param<i64> {transform.readonly}, %arg2: !transform.param<i64> {transform.readonly}) -> !transform.any_op {
      %0 = transform.tune.alternatives<"par_or_seq_tiling"> selected_region = %arg1 : !transform.param<i64> -> !transform.any_op {
        %tiled_linalg_op, %loops = transform.structured.tile_using_for %arg0 tile_sizes [%arg2] : (!transform.any_op, !transform.param<i64>) -> (!transform.any_op, !transform.any_op)
        transform.yield %tiled_linalg_op : !transform.any_op
      }, {
        %tiled_op, %forall_op = transform.structured.tile_using_forall %arg0 tile_sizes [%arg2] : (!transform.any_op, !transform.param<i64>) -> (!transform.any_op, !transform.any_op)
        transform.yield %tiled_op : !transform.any_op
      }
      transform.yield %0 : !transform.any_op
    }
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["linalg.matmul"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      %1 = transform.param.constant 1 : i64 -> !transform.param<i64>
      %2 = transform.param.constant 32 : i64 -> !transform.param<i64>
      %3 = transform.tune.knob<"inner_par_or_seq"> = 0 : i64 from options = [0, 1] -> !transform.param<i64>
      %4 = transform.param.constant 8 : i64 -> !transform.param<i64>
      %5 = transform.include @subschedule_with_embedded_choice failures(propagate) (%0, %1, %2) : (!transform.any_op, !transform.param<i64>, !transform.param<i64>) -> !transform.any_op
      %6 = transform.include @subschedule_with_embedded_choice failures(propagate) (%5, %3, %4) : (!transform.any_op, !transform.param<i64>, !transform.param<i64>) -> !transform.any_op
      transform.yield 
    }
  }
}

// -----
module {
  func.func private @eeny_meeny_miny_moe()
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op {transform.readonly}) {
      %0 = transform.structured.match ops{["linalg.matmul"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      %1 = transform.tune.alternatives<"4way"> selected_region = 3 -> !transform.any_param {
        %2 = transform.param.constant "eeny" -> !transform.any_param
        transform.yield %2 : !transform.any_param
      }, {
        %2 = transform.param.constant "meeny" -> !transform.any_param
        transform.yield %2 : !transform.any_param
      }, {
        %2 = transform.param.constant "miny" -> !transform.any_param
        transform.yield %2 : !transform.any_param
      }, {
        %2 = transform.param.constant "moe" -> !transform.any_param
        transform.yield %2 : !transform.any_param
      }
      transform.yield 
    }
  }
}

