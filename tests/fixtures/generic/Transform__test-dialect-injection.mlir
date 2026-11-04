"builtin.module"() ({
  "transform.test_transform_op"() : () -> ()
  %0 = "transform.test_produce_self_handle_or_forward_operand"() {foo = "bar"} : () -> !transform.any_op
  "transform.test_consume_operand_of_op_kind_or_fail"(%0) <{op_kind = "transform.test_produce_self_handle_or_forward_operand"}> : (!transform.any_op) -> ()
  %1 = "transform.cast"(%0) : (!transform.any_op) -> !transform.test_dialect_op
}) : () -> ()

