module {
  func.func @merge_blocks(%arg0: i32, %arg1: i32) -> (i32, i32) {
    %cst = arith.constant dense<[[0, 1], [2, 3]]> : tensor<2x2xi32>
    %cst_0 = arith.constant dense<1> : tensor<5xi32>
    %cst_1 = arith.constant dense<[[0, 1]]> : tensor<1x2xi32>
    %c10_i32 = arith.constant 10 : i32
    %0 = "test.func"() : () -> i32
    %1:2 = "test.merge_blocks"() ({
      "test.br"(%arg0, %0, %c10_i32)[^bb1] : (i32, i32, i32) -> ()
    ^bb1(%2: i32, %3: i32, %4: i32):  // pred: ^bb0
      "test.return"(%2, %3) : (i32, i32) -> ()
    }) : () -> (i32, i32)
    "test.return"(%1#0, %1#1) : (i32, i32) -> ()
  }
}

