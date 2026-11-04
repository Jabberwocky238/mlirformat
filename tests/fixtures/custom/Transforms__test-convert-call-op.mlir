module {
  func.func private @callee(!test.test_type) -> i32
  func.func @caller() -> i32 {
    %0 = "test.type_producer"() : () -> !test.test_type
    %1 = call @callee(%0) : (!test.test_type) -> i32
    return %1 : i32
  }
}

