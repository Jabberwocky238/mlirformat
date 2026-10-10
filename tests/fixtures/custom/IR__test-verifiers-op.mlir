module {
  func.func @no_overflow_on_test_verifiers_op() {
    %c1_i32 = arith.constant 1 : i32
    "test.verifiers"(%c1_i32) ({
      %c2_i32 = arith.constant 2 : i32
      "test.verifiers"(%c2_i32) ({
        %c3 = arith.constant 3 : index
      }) : (i32) -> ()
    }) : (i32) -> ()
    return
  }
}

