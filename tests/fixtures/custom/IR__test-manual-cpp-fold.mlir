module {
  func.func @test() -> i32 {
    %0 = "test.constant"() <{value = 5 : i32}> : () -> i32
    %1 = "test.manual_cpp_op_with_fold"(%0) : (i32) -> i32
    return %1 : i32
  }
}

