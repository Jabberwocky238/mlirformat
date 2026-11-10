module attributes {transform.with_named_sequence} {
  transform.named_sequence @__transform_main(%arg0: !transform.any_op) {
    %0 = transform.test_copy_payload %arg0 : (!transform.any_op) -> !transform.any_op
    %1 = transform.test_copy_payload %arg0 : (!transform.any_op) -> !transform.any_op
    %2 = transform.merge_handles deduplicate %0, %1 : !transform.any_op
    transform.yield 
  }
}

// -----
module {
  "test.op_with_regions"() ({
  ^bb0(%arg0: i32):
    "test.match_anchor_1"() : () -> ()
  ^bb1:  // no predecessors
    "test.match_anchor_2"() : () -> ()
  }) : () -> ()
  module attributes {transform.with_named_sequence} {
    transform.named_sequence @__transform_main(%arg0: !transform.any_op) {
      %0 = transform.structured.match ops{["test.match_anchor_1"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      %1 = transform.structured.match ops{["test.match_anchor_2"]} in %arg0 : (!transform.any_op) -> !transform.any_op
      %2 = transform.test_produce_value_handle_to_argument_of_parent_block %0, 0 : (!transform.any_op) -> !transform.any_value
      transform.test_consume_operand %2 : !transform.any_value
      transform.test_consume_operand %1 : !transform.any_op
      transform.yield 
    }
  }
}

// -----
module attributes {transform.with_named_sequence} {
  transform.named_sequence @__transform_main(%arg0: !transform.any_op) {
    transform.test_re_enter_region {
      %0 = transform.test_produce_self_handle_or_forward_operand : () -> !transform.any_op
      transform.test_consume_operand %0 : !transform.any_op
      transform.yield 
    }
    transform.yield 
  }
}

// -----
module attributes {transform.with_named_sequence} {
  transform.named_sequence @__transform_main(%arg0: !transform.any_op) {
    %0 = transform.test_produce_self_handle_or_forward_operand : () -> !transform.any_op
    transform.test_re_enter_region %0 : !transform.any_op {
    ^bb0(%arg1: !transform.any_op):
      transform.test_consume_operand %arg1 : !transform.any_op
      transform.yield 
    }
    transform.yield 
  }
}

// -----
module @named_inclusion_and_consumption attributes {transform.with_named_sequence} {
  transform.named_sequence @foo(%arg0: !transform.any_op {transform.consumed}) {
    transform.test_consume_operand %arg0 : !transform.any_op
    transform.yield 
  }
  transform.named_sequence @__transform_main(%arg0: !transform.any_op) {
    transform.include @foo failures(propagate) (%arg0) : (!transform.any_op) -> ()
    transform.yield 
  }
}

