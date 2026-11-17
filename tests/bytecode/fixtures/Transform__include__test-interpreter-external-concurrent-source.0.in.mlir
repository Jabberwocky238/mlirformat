"builtin.module"() ({
  "transform.named_sequence"() <{function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
  ^bb0(%arg0: !transform.any_op loc("<stdin>":3:8)):
    "transform.with_pdl_patterns"(%arg0) ({
    ^bb0(%arg1: !transform.any_op loc("<stdin>":5:10)):
      "pdl.pattern"() <{benefit = 1 : i16, sym_name = "func_return"}> ({
        %1 = "pdl.operation"() <{attributeValueNames = [], opName = "func.return", operandSegmentSizes = array<i32: 0, 0, 0>}> : () -> !pdl.operation loc("<stdin>":7:14)
        "pdl.rewrite"(%1) <{name = "transform.dialect", operandSegmentSizes = array<i32: 1, 0>}> ({
        }) : (!pdl.operation) -> () loc("<stdin>":8:9)
      }) : () -> () loc("<stdin>":6:7)
      "transform.sequence"(%arg1) <{failure_propagation_mode = 1 : i32, operandSegmentSizes = array<i32: 1, 0>}> ({
      ^bb0(%arg2: !transform.any_op loc("<stdin>":12:12)):
        %0 = "transform.pdl_match"(%arg2) <{pattern_name = @func_return}> : (!transform.any_op) -> !transform.op<"func.return"> loc("<stdin>":13:14)
        "transform.debug.emit_remark_at"(%0) <{message = "matched"}> : (!transform.op<"func.return">) -> () loc("<stdin>":14:9)
        "transform.yield"() : () -> () loc("<stdin>":15:9)
      }) : (!transform.any_op) -> () loc("<stdin>":11:7)
    }) : (!transform.any_op) -> () loc("<stdin>":4:5)
    "transform.yield"() : () -> () loc("<stdin>":18:5)
  }) : () -> () loc("<stdin>":2:3)
}) {transform.with_named_sequence} : () -> () loc("<stdin>":1:1)
