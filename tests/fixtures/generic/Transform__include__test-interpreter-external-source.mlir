"builtin.module"() ({
  "transform.named_sequence"() <{function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
  ^bb0(%arg0: !transform.any_op):
    "transform.debug.emit_remark_at"(%arg0) <{message = "outer"}> : (!transform.any_op) -> ()
    "transform.sequence"(%arg0) <{failure_propagation_mode = 1 : i32, operandSegmentSizes = array<i32: 1, 0>}> ({
    ^bb0(%arg1: !transform.any_op):
      "transform.debug.emit_remark_at"(%arg1) <{message = "inner"}> : (!transform.any_op) -> ()
      "transform.yield"() : () -> ()
    }) {transform.target_tag = "transform"} : (!transform.any_op) -> ()
    "transform.yield"() : () -> ()
  }) : () -> ()
}) {transform.with_named_sequence} : () -> ()

