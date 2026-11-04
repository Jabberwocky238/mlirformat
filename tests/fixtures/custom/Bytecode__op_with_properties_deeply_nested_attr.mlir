module {
  func.func @deeply_nested_attribute() -> i32 {
    %0 = "test.constant"() <{value = [[[[[[[[[[[[1]]]]]]]]]]]]}> : () -> i32
    return %0 : i32
  }
}

// -----
module {
  func.func @deeply_nested_infinite_loop() -> i32 {
    %0 = "test.constant"() <{value = [[[[[[1]]]]]]}> : () -> i32
    return %0 : i32
  }
}

