module {
  func.func @fold_legalization() -> i32 {
    %0 = "test.op_in_place_self_fold"() : () -> i32
    "test.return"(%0) : (i32) -> ()
  }
}

