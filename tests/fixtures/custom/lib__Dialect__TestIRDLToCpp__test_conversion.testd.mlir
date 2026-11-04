module {
  func.func @test(%arg0: i1) {
    %0 = "test_irdl_to_cpp.bar"() : () -> i32
    %1 = "test_irdl_to_cpp.beef"(%0, %0) : (i32, i32) -> i32
    "test_irdl_to_cpp.conditional"(%arg0) ({
    ^bb0(%arg1: i1):
      %2 = "test_irdl_to_cpp.bar"() : () -> i32
      "test.terminator"() : () -> ()
    }, {
    ^bb0(%arg1: i1, %arg2: i32):
      %2 = "test_irdl_to_cpp.bar"() : () -> i32
      "test.terminator"() : () -> ()
    }, {
      %2 = "test_irdl_to_cpp.bar"() : () -> i32
      "test.terminator"() : () -> ()
    }) : (i1) -> ()
    return
  }
}

