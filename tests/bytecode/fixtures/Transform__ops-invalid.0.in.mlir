"builtin.module"() ({
  "transform.named_sequence"() <{arg_attrs = [{transform.consumed}], function_type = (!transform.any_op) -> (), sym_name = "emit_warning_only"}> ({
  ^bb0(%arg1: !transform.any_op loc("<stdin>":3:8)):
    "transform.debug.emit_remark_at"(%arg1) <{message = "message"}> : (!transform.any_op) -> () loc("<stdin>":4:5)
    "transform.yield"() : () -> () loc("<stdin>":5:5)
  }) : () -> () loc("<stdin>":2:3)
  "transform.sequence"() <{failure_propagation_mode = 1 : i32, operandSegmentSizes = array<i32: 0, 0>}> ({
  ^bb0(%arg0: !transform.any_op loc("<stdin>":8:8)):
    "transform.include"(%arg0) <{failure_propagation_mode = 1 : i32, target = @emit_warning_only}> : (!transform.any_op) -> () loc("<stdin>":9:5)
    "transform.yield"() : () -> () loc("<stdin>":10:5)
  }) : () -> () loc("<stdin>":7:3)
}) {transform.with_named_sequence} : () -> () loc("<stdin>":1:1)
