module {
  func.func @inline_with_arg(%arg0: i32) -> i32 {
    %0 = "test.functional_region_op"() ({
    ^bb0(%arg1: i32):
      %2 = arith.addi %arg1, %arg1 : i32
      "test.return"(%2) : (i32) -> ()
    }) : () -> ((i32) -> i32)
    %1 = call_indirect %0(%arg0) : (i32) -> i32
    return %1 : i32
  }
  func.func @no_inline_invalid_nested_operation() {
    %0 = "test.functional_region_op"() ({
      "test.region"() ({
        "foo.noinline_operation"() : () -> ()
      }) : () -> ()
      "test.return"() : () -> ()
    }) : () -> (() -> ())
    call_indirect %0() : () -> ()
    return
  }
  func.func @inline_ignore_invalid_nested_operation() {
    %0 = "test.functional_region_op"() ({
      %1 = "test.functional_region_op"() ({
        "foo.noinline_operation"() : () -> ()
      }) : () -> (() -> ())
      "test.return"() : () -> ()
    }) : () -> (() -> ())
    call_indirect %0() : () -> ()
    return
  }
  func.func @no_inline_invalid_dest_region() {
    "foo.unknown_region"() ({
      %0 = "test.functional_region_op"() ({
        "test.return"() : () -> ()
      }) : () -> (() -> ())
      func.call_indirect %0() : () -> ()
      "test.return"() : () -> ()
    }) : () -> ()
    return
  }
}

