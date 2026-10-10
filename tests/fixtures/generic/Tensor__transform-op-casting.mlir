"builtin.module"() ({
  "func.func"() <{function_type = (tensor<10x13xf32>, tensor<3x13xf32>) -> tensor<13x13xf32>, sym_name = "cast_to_dynamic"}> ({
  ^bb0(%arg1: tensor<10x13xf32>, %arg2: tensor<3x13xf32>):
    %6 = "tensor.concat"(%arg1, %arg2) <{dim = 0 : i64}> : (tensor<10x13xf32>, tensor<3x13xf32>) -> tensor<13x13xf32>
    "func.return"(%6) : (tensor<13x13xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<?x?xf32>, tensor<?x?xf32>) -> tensor<?x?xf32>, sym_name = "concat_replacement", sym_visibility = "private"}> ({
  }) : () -> ()
  "builtin.module"() ({
    "transform.named_sequence"() <{function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg0: !transform.any_op):
      %0 = "transform.structured.match"(%arg0) <{ops = ["func.func"]}> : (!transform.any_op) -> !transform.any_op
      %1:2 = "transform.split_handle"(%0) <{fail_on_payload_too_small = true, pass_through_empty_handle = true}> : (!transform.any_op) -> (!transform.any_op, !transform.any_op)
      %2 = "transform.structured.match"(%1#0) <{ops = ["tensor.concat"]}> : (!transform.any_op) -> !transform.any_op
      %3 = "transform.get_operand"(%2) <{is_all, raw_position_list = array<i64>}> : (!transform.any_op) -> !transform.any_value
      %4 = "transform.get_result"(%2) <{is_all, raw_position_list = array<i64>}> : (!transform.any_op) -> !transform.any_value
      %5 = "transform.func.cast_and_call"(%2, %3, %4, %1#1) <{operandSegmentSizes = array<i32: 1, 1, 1, 1>}> ({
        "transform.type_conversion.tensor.cast_shape_dynamic_dims"() : () -> ()
      }) : (!transform.any_op, !transform.any_value, !transform.any_value, !transform.any_op) -> !transform.any_op
      "transform.apply_dce"(%1#0) : (!transform.any_op) -> ()
      "transform.yield"() : () -> ()
    }) : () -> ()
  }) {transform.with_named_sequence} : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (tensor<?x?xf32>) -> tensor<?xf32>, sym_name = "cast_to_static"}> ({
  ^bb0(%arg1: tensor<?x?xf32>):
    %6 = "tensor.collapse_shape"(%arg1) <{reassociation = [[0, 1]]}> : (tensor<?x?xf32>) -> tensor<?xf32>
    "func.return"(%6) : (tensor<?xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (tensor<4x5xf32>) -> tensor<20xf32>, sym_name = "collapse_replacement", sym_visibility = "private"}> ({
  }) : () -> ()
  "builtin.module"() ({
    "transform.named_sequence"() <{function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg0: !transform.any_op):
      %0 = "transform.structured.match"(%arg0) <{ops = ["func.func"]}> : (!transform.any_op) -> !transform.any_op
      %1:2 = "transform.split_handle"(%0) <{fail_on_payload_too_small = true, pass_through_empty_handle = true}> : (!transform.any_op) -> (!transform.any_op, !transform.any_op)
      %2 = "transform.structured.match"(%1#0) <{ops = ["tensor.collapse_shape"]}> : (!transform.any_op) -> !transform.any_op
      %3 = "transform.get_operand"(%2) <{is_all, raw_position_list = array<i64>}> : (!transform.any_op) -> !transform.any_value
      %4 = "transform.get_result"(%2) <{is_all, raw_position_list = array<i64>}> : (!transform.any_op) -> !transform.any_value
      %5 = "transform.func.cast_and_call"(%2, %3, %4, %1#1) <{operandSegmentSizes = array<i32: 1, 1, 1, 1>}> ({
        "transform.type_conversion.tensor.cast_shape_dynamic_dims"() <{ignore_dynamic_info}> : () -> ()
      }) : (!transform.any_op, !transform.any_value, !transform.any_value, !transform.any_op) -> !transform.any_op
      "transform.apply_dce"(%1#0) : (!transform.any_op) -> ()
      "transform.yield"() : () -> ()
    }) : () -> ()
  }) {transform.with_named_sequence} : () -> ()
}) : () -> ()

