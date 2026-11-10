"builtin.module"() ({
  "transform.named_sequence"() <{function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
  ^bb0(%arg0: !transform.any_op):
    %0 = "transform.test_copy_payload"(%arg0) : (!transform.any_op) -> !transform.any_op
    %1 = "transform.test_copy_payload"(%arg0) : (!transform.any_op) -> !transform.any_op
    %2 = "transform.merge_handles"(%0, %1) <{deduplicate}> : (!transform.any_op, !transform.any_op) -> !transform.any_op
    "transform.yield"() : () -> ()
  }) : () -> ()
}) {transform.with_named_sequence} : () -> ()

// -----
"builtin.module"() ({
  "test.op_with_regions"() ({
  ^bb0(%arg1: i32):
    "test.match_anchor_1"() : () -> ()
  ^bb1:  // no predecessors
    "test.match_anchor_2"() : () -> ()
  }) : () -> ()
  "builtin.module"() ({
    "transform.named_sequence"() <{function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg0: !transform.any_op):
      %0 = "transform.structured.match"(%arg0) <{ops = ["test.match_anchor_1"]}> : (!transform.any_op) -> !transform.any_op
      %1 = "transform.structured.match"(%arg0) <{ops = ["test.match_anchor_2"]}> : (!transform.any_op) -> !transform.any_op
      %2 = "transform.test_produce_value_handle_to_argument_of_parent_block"(%0) <{number = 0 : i64}> : (!transform.any_op) -> !transform.any_value
      "transform.test_consume_operand"(%2) : (!transform.any_value) -> ()
      "transform.test_consume_operand"(%1) : (!transform.any_op) -> ()
      "transform.yield"() : () -> ()
    }) : () -> ()
  }) {transform.with_named_sequence} : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "transform.named_sequence"() <{function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
  ^bb0(%arg0: !transform.any_op):
    "transform.test_re_enter_region"() ({
      %0 = "transform.test_produce_self_handle_or_forward_operand"() : () -> !transform.any_op
      "transform.test_consume_operand"(%0) : (!transform.any_op) -> ()
      "transform.yield"() : () -> ()
    }) : () -> ()
    "transform.yield"() : () -> ()
  }) : () -> ()
}) {transform.with_named_sequence} : () -> ()

// -----
"builtin.module"() ({
  "transform.named_sequence"() <{function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
  ^bb0(%arg0: !transform.any_op):
    %0 = "transform.test_produce_self_handle_or_forward_operand"() : () -> !transform.any_op
    "transform.test_re_enter_region"(%0) ({
    ^bb0(%arg1: !transform.any_op):
      "transform.test_consume_operand"(%arg1) : (!transform.any_op) -> ()
      "transform.yield"() : () -> ()
    }) : (!transform.any_op) -> ()
    "transform.yield"() : () -> ()
  }) : () -> ()
}) {transform.with_named_sequence} : () -> ()

// -----
"builtin.module"() <{sym_name = "named_inclusion_and_consumption"}> ({
  "transform.named_sequence"() <{arg_attrs = [{transform.consumed}], function_type = (!transform.any_op) -> (), sym_name = "foo"}> ({
  ^bb0(%arg1: !transform.any_op):
    "transform.test_consume_operand"(%arg1) : (!transform.any_op) -> ()
    "transform.yield"() : () -> ()
  }) : () -> ()
  "transform.named_sequence"() <{function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
  ^bb0(%arg0: !transform.any_op):
    "transform.include"(%arg0) <{failure_propagation_mode = 1 : i32, target = @foo}> : (!transform.any_op) -> ()
    "transform.yield"() : () -> ()
  }) : () -> ()
}) {transform.with_named_sequence} : () -> ()

