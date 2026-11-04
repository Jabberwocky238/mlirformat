module {
  func.func @base_test(%arg0: i32) -> i32 {
    %c45_i32 = arith.constant 45 : i32
    %c46_i32 = arith.constant 46 : i32
    %0 = "test.addi"(%arg0, %arg0) : (i32, i32) -> i32
    %1 = "test.addi"(%0, %c45_i32) : (i32, i32) -> i32
    %2 = "test.addi"(%0, %c46_i32) : (i32, i32) -> i32
    %3 = "test.addi"(%1, %2) : (i32, i32) -> i32
    %4 = "test.addi"(%3, %2) : (i32, i32) -> i32
    %5 = "test.addi"(%4, %2) : (i32, i32) -> i32
    return %5 : i32
  }
}

// -----
module {
  func.func @test_with_multiple_uses_in_same_op(%arg0: i32) -> i32 {
    %c45_i32 = arith.constant 45 : i32
    %c46_i32 = arith.constant 46 : i32
    %0 = "test.addi"(%arg0, %arg0) : (i32, i32) -> i32
    %1 = "test.addi"(%0, %c45_i32) : (i32, i32) -> i32
    %2 = "test.addi"(%0, %c46_i32) : (i32, i32) -> i32
    %3 = "test.addi"(%0, %0) : (i32, i32) -> i32
    %4 = "test.addi"(%1, %2) : (i32, i32) -> i32
    %5 = "test.addi"(%4, %3) : (i32, i32) -> i32
    %6 = "test.addi"(%5, %2) : (i32, i32) -> i32
    %7 = "test.addi"(%6, %2) : (i32, i32) -> i32
    return %7 : i32
  }
}

// -----
module {
  func.func @test_with_multiple_block_arg_uses(%arg0: i32) -> i32 {
    %c45_i32 = arith.constant 45 : i32
    %c46_i32 = arith.constant 46 : i32
    %0 = "test.addi"(%arg0, %arg0) : (i32, i32) -> i32
    %1 = "test.addi"(%0, %arg0) : (i32, i32) -> i32
    %2 = "test.addi"(%0, %c46_i32) : (i32, i32) -> i32
    %3 = "test.addi"(%0, %0) : (i32, i32) -> i32
    %4 = "test.addi"(%1, %2) : (i32, i32) -> i32
    %5 = "test.addi"(%4, %3) : (i32, i32) -> i32
    %6 = "test.addi"(%5, %2) : (i32, i32) -> i32
    %7 = "test.addi"(%6, %2) : (i32, i32) -> i32
    return %7 : i32
  }
}

// -----
module {
  test.graph_region {
    %0 = "test.foo"(%1) : (i32) -> i32
    test.graph_region attributes {a} {
      %3 = "test.a"(%4) : (i32) -> i32
      %4 = "test.b"(%2) : (i32) -> i32
    }
    %1 = "test.bar"(%2) : (i32) -> i32
    %2 = "test.baz"() : () -> i32
  }
}

