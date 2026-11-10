"builtin.module"() ({
  "func.func"() <{function_type = (i32) -> (), sym_name = "testSingleOperand"}> ({
  ^bb0(%arg0: i32):
    "testvar.single_operand"(%arg0) : (i32) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (i16, i32, i64) -> (), sym_name = "testVarOperand"}> ({
  ^bb0(%arg0: i16, %arg1: i32, %arg2: i64):
    "testvar.var_operand"(%arg0, %arg2) : (i16, i64) -> ()
    "testvar.var_operand"(%arg0, %arg1, %arg2) : (i16, i32, i64) -> ()
    "testvar.var_operand"(%arg0, %arg1, %arg1, %arg2) : (i16, i32, i32, i64) -> ()
    "testvar.var_operand"(%arg0, %arg1, %arg1, %arg1, %arg2) : (i16, i32, i32, i32, i64) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (i16, i32, i64) -> (), sym_name = "testOptOperand"}> ({
  ^bb0(%arg0: i16, %arg1: i32, %arg2: i64):
    "testvar.opt_operand"(%arg0, %arg2) : (i16, i64) -> ()
    "testvar.opt_operand"(%arg0, %arg1, %arg2) : (i16, i32, i64) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (i16, i32, i64) -> (), sym_name = "testMultOperands"}> ({
  ^bb0(%arg0: i16, %arg1: i32, %arg2: i64):
    "testvar.var_and_opt_operand"(%arg0, %arg0, %arg2) {operandSegmentSizes = array<i32: 2, 0, 1>} : (i16, i16, i64) -> ()
    "testvar.var_and_opt_operand"(%arg0, %arg0, %arg1, %arg2) {operandSegmentSizes = array<i32: 2, 1, 1>} : (i16, i16, i32, i64) -> ()
    "testvar.var_and_opt_operand"(%arg1, %arg2) {operandSegmentSizes = array<i32: 0, 1, 1>} : (i32, i64) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "testSingleResult"}> ({
    %0 = "testvar.single_result"() : () -> i32
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "testVarResult"}> ({
    %0:2 = "testvar.var_result"() : () -> (i16, i64)
    %1:3 = "testvar.var_result"() : () -> (i16, i32, i64)
    %2:4 = "testvar.var_result"() : () -> (i16, i32, i32, i64)
    %3:5 = "testvar.var_result"() : () -> (i16, i32, i32, i32, i64)
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "testOptResult"}> ({
    %0:2 = "testvar.opt_result"() : () -> (i16, i64)
    %1:3 = "testvar.opt_result"() : () -> (i16, i32, i64)
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = () -> (), sym_name = "testMultResults"}> ({
    %0:3 = "testvar.var_and_opt_result"() {resultSegmentSizes = array<i32: 2, 0, 1>} : () -> (i16, i16, i64)
    %1:4 = "testvar.var_and_opt_result"() {resultSegmentSizes = array<i32: 2, 1, 1>} : () -> (i16, i16, i32, i64)
    %2:2 = "testvar.var_and_opt_result"() {resultSegmentSizes = array<i32: 0, 1, 1>} : () -> (i32, i64)
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

