module attributes {transform.with_named_sequence} {
  transform.named_sequence @__transform_main(%arg0: !transform.any_op) {
    transform.test_add_test_extension "A"
    %0 = transform.test_remap_operand_to_self %arg0 : (!transform.any_op) -> !transform.any_op
    transform.yield 
  }
}

// -----
module attributes {transform.with_named_sequence} {
  transform.named_sequence @__transform_main(%arg0: !transform.any_op) {
    transform.test_add_test_extension "A"
    %0 = transform.test_remap_operand_to_self %arg0 : (!transform.any_op) -> !transform.any_op
    %1 = transform.test_remap_operand_to_self %0 : (!transform.any_op) -> !transform.any_op
    transform.yield 
  }
}

