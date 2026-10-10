module {
  func.func @replace_with_new_op() -> i32 {
    %0 = "test.replace_with_new_op"() : () -> i32
    %1 = arith.addi %0, %0 : i32
    return %1 : i32
  }
}

