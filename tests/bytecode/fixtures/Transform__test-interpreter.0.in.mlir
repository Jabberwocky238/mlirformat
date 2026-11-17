"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "foo"}> ({
    "op"() : () -> () loc("<stdin>":3:5)
    "op"() : () -> () loc("<stdin>":4:5)
    "op"() : () -> () loc("<stdin>":5:5)
    "func.return"() : () -> () loc("<stdin>":6:5)
  }) : () -> () loc("<stdin>":2:3)
  "builtin.module"() ({
    "transform.named_sequence"() <{function_type = (!transform.any_op) -> (), sym_name = "__transform_main"}> ({
    ^bb0(%arg0: !transform.any_op loc("<stdin>":10:10)):
      "transform.with_pdl_patterns"(%arg0) ({
      ^bb0(%arg1: !transform.any_op loc("<stdin>":12:12)):
        "pdl.pattern"() <{benefit = 1 : i16, sym_name = "some"}> ({
          %2 = "pdl.operands"() : () -> !pdl.range<value> loc("<stdin>":14:16)
          %3 = "pdl.types"() : () -> !pdl.range<type> loc("<stdin>":15:16)
          %4 = "pdl.operation"(%2, %3) <{attributeValueNames = [], opName = "op", operandSegmentSizes = array<i32: 1, 0, 1>}> : (!pdl.range<value>, !pdl.range<type>) -> !pdl.operation loc("<stdin>":16:16)
          "pdl.rewrite"(%4) <{name = "transform.dialect", operandSegmentSizes = array<i32: 1, 0>}> ({
          }) : (!pdl.operation) -> () loc("<stdin>":17:11)
        }) : () -> () loc("<stdin>":13:9)
        "transform.sequence"(%arg1) <{failure_propagation_mode = 1 : i32, operandSegmentSizes = array<i32: 1, 0>}> ({
        ^bb0(%arg2: !transform.any_op loc("<stdin>":21:14)):
          %0 = "transform.pdl_match"(%arg2) <{pattern_name = @some}> : (!transform.any_op) -> !transform.any_op loc("<stdin>":22:16)
          %1:2 = "transform.test_correct_number_of_multi_results"(%0) : (!transform.any_op) -> (!transform.any_op, !transform.any_op) loc("<stdin>":23:18)
          "transform.yield"() : () -> () loc("<stdin>":24:11)
        }) : (!transform.any_op) -> () loc("<stdin>":20:9)
      }) : (!transform.any_op) -> () loc("<stdin>":11:7)
      "transform.yield"() : () -> () loc("<stdin>":27:7)
    }) : () -> () loc("<stdin>":9:5)
  }) {transform.with_named_sequence} : () -> () loc("<stdin>":8:3)
}) : () -> () loc("<stdin>":1:1)
