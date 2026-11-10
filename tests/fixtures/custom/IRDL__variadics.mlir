module {
  func.func @testSingleOperand(%arg0: i32) {
    "testvar.single_operand"(%arg0) : (i32) -> ()
    return
  }
}

// -----
module {
  func.func @testVarOperand(%arg0: i16, %arg1: i32, %arg2: i64) {
    "testvar.var_operand"(%arg0, %arg2) : (i16, i64) -> ()
    "testvar.var_operand"(%arg0, %arg1, %arg2) : (i16, i32, i64) -> ()
    "testvar.var_operand"(%arg0, %arg1, %arg1, %arg2) : (i16, i32, i32, i64) -> ()
    "testvar.var_operand"(%arg0, %arg1, %arg1, %arg1, %arg2) : (i16, i32, i32, i32, i64) -> ()
    return
  }
}

// -----
module {
  func.func @testOptOperand(%arg0: i16, %arg1: i32, %arg2: i64) {
    "testvar.opt_operand"(%arg0, %arg2) : (i16, i64) -> ()
    "testvar.opt_operand"(%arg0, %arg1, %arg2) : (i16, i32, i64) -> ()
    return
  }
}

// -----
module {
  func.func @testMultOperands(%arg0: i16, %arg1: i32, %arg2: i64) {
    "testvar.var_and_opt_operand"(%arg0, %arg0, %arg2) {operandSegmentSizes = array<i32: 2, 0, 1>} : (i16, i16, i64) -> ()
    "testvar.var_and_opt_operand"(%arg0, %arg0, %arg1, %arg2) {operandSegmentSizes = array<i32: 2, 1, 1>} : (i16, i16, i32, i64) -> ()
    "testvar.var_and_opt_operand"(%arg1, %arg2) {operandSegmentSizes = array<i32: 0, 1, 1>} : (i32, i64) -> ()
    return
  }
}

// -----
module {
  func.func @testSingleResult() {
    %0 = "testvar.single_result"() : () -> i32
    return
  }
}

// -----
module {
  func.func @testVarResult() {
    %0:2 = "testvar.var_result"() : () -> (i16, i64)
    %1:3 = "testvar.var_result"() : () -> (i16, i32, i64)
    %2:4 = "testvar.var_result"() : () -> (i16, i32, i32, i64)
    %3:5 = "testvar.var_result"() : () -> (i16, i32, i32, i32, i64)
    return
  }
}

// -----
module {
  func.func @testOptResult() {
    %0:2 = "testvar.opt_result"() : () -> (i16, i64)
    %1:3 = "testvar.opt_result"() : () -> (i16, i32, i64)
    return
  }
}

// -----
module {
  func.func @testMultResults() {
    %0:3 = "testvar.var_and_opt_result"() {resultSegmentSizes = array<i32: 2, 0, 1>} : () -> (i16, i16, i64)
    %1:4 = "testvar.var_and_opt_result"() {resultSegmentSizes = array<i32: 2, 1, 1>} : () -> (i16, i16, i32, i64)
    %2:2 = "testvar.var_and_opt_result"() {resultSegmentSizes = array<i32: 0, 1, 1>} : () -> (i32, i64)
    return
  }
}

