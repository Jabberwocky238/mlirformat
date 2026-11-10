module {
  func.func @simpleTest() {
    "test.simple"() : () -> ()
    return
  }
  func.func @testImportedInterface() -> i1 {
    "test.non_cast"() : () -> ()
    %0 = builtin.unrealized_conversion_cast to i1
    return %0 : i1
  }
  func.func @testWithConstraint(%arg0: i32) {
    %0 = "test.op_a"(%arg0) <{attr = 0 : i32}> : (i32) -> i32
    return
  }
}

