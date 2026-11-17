"builtin.module"() ({
  "transform.named_sequence"() <{function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
  ^bb0(%arg0: !transform.any_op loc("<stdin>":3:8)):
    "transform.debug.emit_remark_at"(%arg0) <{message = "outer"}> : (!transform.any_op) -> () loc("<stdin>":4:5)
    "transform.sequence"(%arg0) <{failure_propagation_mode = 1 : i32, operandSegmentSizes = array<i32: 1, 0>}> ({
    ^bb0(%arg1: !transform.any_op loc("<stdin>":6:10)):
      "transform.debug.emit_remark_at"(%arg1) <{message = "inner"}> : (!transform.any_op) -> () loc("<stdin>":7:7)
      "transform.yield"() : () -> () loc("<stdin>":8:7)
    }) {transform.target_tag = "transform"} : (!transform.any_op) -> () loc("<stdin>":5:5)
    "transform.yield"() : () -> () loc("<stdin>":10:5)
  }) : () -> () loc("<stdin>":2:3)
}) {transform.with_named_sequence} : () -> () loc("<stdin>":1:1)
