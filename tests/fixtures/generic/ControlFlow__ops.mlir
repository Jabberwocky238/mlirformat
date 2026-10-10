"builtin.module"() ({
  "func.func"() <{function_type = (i1) -> (), sym_name = "assert"}> ({
  ^bb0(%arg6: i1):
    "cf.assert"(%arg6) <{msg = "Some message in case this assertion fails."}> : (i1) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (i32, i32) -> (), sym_name = "switch"}> ({
  ^bb0(%arg4: i32, %arg5: i32):
    "cf.switch"(%arg4, %arg5, %arg5, %arg5)[^bb1, ^bb2, ^bb3] <{case_operand_segments = array<i32: 1, 1>, case_values = dense<[42, 43]> : vector<2xi32>, operandSegmentSizes = array<i32: 1, 1, 2>}> : (i32, i32, i32, i32) -> ()
  ^bb1(%5: i32):  // pred: ^bb0
    "func.return"() : () -> ()
  ^bb2(%6: i32):  // pred: ^bb0
    "func.return"() : () -> ()
  ^bb3(%7: i32):  // pred: ^bb0
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (i64, i32) -> (), sym_name = "switch_i64"}> ({
  ^bb0(%arg2: i64, %arg3: i32):
    "cf.switch"(%arg2, %arg3, %arg3, %arg3)[^bb1, ^bb2, ^bb3] <{case_operand_segments = array<i32: 1, 1>, case_values = dense<[42, 43]> : vector<2xi64>, operandSegmentSizes = array<i32: 1, 1, 2>}> : (i64, i32, i32, i32) -> ()
  ^bb1(%2: i32):  // pred: ^bb0
    "func.return"() : () -> ()
  ^bb2(%3: i32):  // pred: ^bb0
    "func.return"() : () -> ()
  ^bb3(%4: i32):  // pred: ^bb0
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (i32) -> (), sym_name = "switch_result_number"}> ({
  ^bb0(%arg1: i32):
    %0:2 = "test.op_with_two_results"() : () -> (i32, i32)
    "cf.switch"(%arg1, %0#0)[^bb2, ^bb1] <{case_operand_segments = array<i32: 1>, case_values = dense<0> : vector<1xi32>, operandSegmentSizes = array<i32: 1, 0, 1>}> : (i32, i32) -> ()
  ^bb1(%1: i32):  // pred: ^bb0
    "func.return"() : () -> ()
  ^bb2:  // pred: ^bb0
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (i1) -> (), sym_name = "cond_weights"}> ({
  ^bb0(%arg0: i1):
    "cf.cond_br"(%arg0)[^bb1, ^bb2] <{branch_weights = array<i32: 60, 40>, operandSegmentSizes = array<i32: 1, 0, 0>}> : (i1) -> ()
  ^bb1:  // pred: ^bb0
    "func.return"() : () -> ()
  ^bb2:  // pred: ^bb0
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

