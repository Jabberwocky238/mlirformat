"builtin.module"() ({
  "transform.named_sequence"() <{function_type = (!transform.any_op, !transform.any_op, !transform.param<i32>) -> (), sym_name = "infer"}> ({
  ^bb0(%arg0: !transform.any_op loc("<stdin>":3:8), %arg1: !transform.any_op loc("<stdin>":3:34), %arg2: !transform.param<i32> loc("<stdin>":3:60)):
    "transform.test_consume_operand"(%arg0) : (!transform.any_op) -> () loc("<stdin>":4:5)
    "transform.debug.emit_remark_at"(%arg1) <{message = ""}> : (!transform.any_op) -> () loc("<stdin>":5:5)
    "transform.yield"() : () -> () loc("<stdin>":6:5)
  }) : () -> () loc("<stdin>":2:3)
}) {transform.with_named_sequence} : () -> () loc("<stdin>":1:1)
