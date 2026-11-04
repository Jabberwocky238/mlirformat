module {
  func.func @test_inline_multiple_blocks(%arg0: i32) -> i32 {
    %0 = "test.functional_region_op"() ({
    ^bb0(%arg1: i32):
      %2 = arith.addi %arg1, %arg1 : i32
      cf.br ^bb1(%2 : i32)
    ^bb1(%3: i32):  // pred: ^bb0
      %4 = arith.addi %3, %3 : i32
      "test.return"(%4) : (i32) -> ()
    }) : () -> ((i32) -> i32)
    %1 = call_indirect %0(%arg0) : (i32) -> i32
    return %1 : i32
  }
}

