"builtin.module"() ({
  "transform.named_sequence"() <{function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
  ^bb0(%arg0: !transform.any_op):
    "transform.with_pdl_patterns"(%arg0) ({
    ^bb0(%arg1: !transform.any_op):
      "pdl.pattern"() <{benefit = 1 : i16, sym_name = "func_return"}> ({
        %1 = "pdl.operation"() <{attributeValueNames = [], opName = "func.return", operandSegmentSizes = array<i32: 0, 0, 0>}> : () -> !pdl.operation
        "pdl.rewrite"(%1) <{name = "transform.dialect", operandSegmentSizes = array<i32: 1, 0>}> ({
        }) : (!pdl.operation) -> ()
      }) : () -> ()
      "transform.sequence"(%arg1) <{failure_propagation_mode = 1 : i32, operandSegmentSizes = array<i32: 1, 0>}> ({
      ^bb0(%arg2: !transform.any_op):
        %0 = "transform.pdl_match"(%arg2) <{pattern_name = @func_return}> : (!transform.any_op) -> !transform.op<"func.return">
        "transform.debug.emit_remark_at"(%0) <{message = "matched"}> : (!transform.op<"func.return">) -> ()
        "transform.yield"() : () -> ()
      }) : (!transform.any_op) -> ()
    }) : (!transform.any_op) -> ()
    "transform.yield"() : () -> ()
  }) : () -> ()
}) {transform.with_named_sequence} : () -> ()

