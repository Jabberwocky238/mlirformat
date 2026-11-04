"builtin.module"() ({
  "transform.named_sequence"() <{arg_attrs = [{transform.readonly}], function_type = (!transform.any_op) -> (), sym_name = "print_message"}> ({
  ^bb0(%arg1: !transform.any_op):
    "transform.debug.emit_remark_at"(%arg1) <{message = "message"}> : (!transform.any_op) -> ()
    "transform.yield"() : () -> ()
  }) : () -> ()
  "transform.named_sequence"() <{arg_attrs = [{transform.consumed}], function_type = (!transform.any_op) -> (), sym_name = "consuming"}> ({
  ^bb0(%arg0: !transform.any_op):
    "transform.test_consume_operand"(%arg0) : (!transform.any_op) -> ()
    "transform.yield"() : () -> ()
  }) : () -> ()
}) {transform.with_named_sequence} : () -> ()

