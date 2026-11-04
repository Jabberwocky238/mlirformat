module {
  func.func @remove_all_ops(%arg0: i32) {
    %0 = "test.illegal_op_a"() : () -> i32
    %1 = "test.illegal_op_b"() : () -> i32
    %2 = "test.illegal_op_c"() : () -> i32
    %3 = "test.illegal_op_d"() : () -> i32
    %4 = "test.illegal_op_e"() : () -> i32
    return
  }
}

