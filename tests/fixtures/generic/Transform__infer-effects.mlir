"builtin.module"() ({
  "transform.named_sequence"() <{function_type = (!transform.any_op, !transform.any_op, !transform.param<i32>) -> (), sym_name = "infer"}> ({
  ^bb0(%arg0: !transform.any_op, %arg1: !transform.any_op, %arg2: !transform.param<i32>):
    "transform.test_consume_operand"(%arg0) : (!transform.any_op) -> ()
    "transform.debug.emit_remark_at"(%arg1) <{message = ""}> : (!transform.any_op) -> ()
    "transform.yield"() : () -> ()
  }) : () -> ()
}) {transform.with_named_sequence} : () -> ()

