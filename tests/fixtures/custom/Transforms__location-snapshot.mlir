module {
  func.func @function() -> i32 {
    %0 = "foo"() : () -> i32
    return %0 : i32
  }
  func.func @function2() -> i32 {
    %0 = "foo"() : () -> i32
    return %0 : i32
  }
}

