module {
  func.func @remove_foldable_op(%arg0: i32) -> i32 {
    %0 = "test.op_with_region_fold"(%arg0) ({
      "foo.op_with_region_terminator"() : () -> ()
    }) : (i32) -> i32
    "test.return"(%0) : (i32) -> ()
  }
}

