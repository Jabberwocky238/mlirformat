module {
  func.func @rewrite_dynamic_op(%arg0: i32) {
    %0:2 = "test.dynamic_one_operand_two_results"(%arg0) : (i32) -> (i32, i32)
    return
  }
}

