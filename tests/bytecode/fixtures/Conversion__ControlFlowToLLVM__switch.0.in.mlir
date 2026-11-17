"builtin.module"() ({
  "func.func"() <{function_type = (i32, index) -> index, sym_name = "single_case"}> ({
  ^bb0(%arg0: i32 loc("<stdin>":3:8), %arg1: index loc("<stdin>":3:20)):
    "cf.switch"(%arg0, %arg1)[^bb1] <{case_operand_segments = array<i32>, operandSegmentSizes = array<i32: 1, 1, 0>}> : (i32, index) -> () loc("<stdin>":4:5)
  ^bb1(%0: index loc("<stdin>":5:8)):  // pred: ^bb0
    "func.return"(%0) : (index) -> () loc("<stdin>":6:5)
  }) : () -> () loc("<stdin>":2:3)
}) : () -> () loc("<stdin>":1:1)
