module {
  func.func @test_small_pattern_1(%arg0: i32) -> i32 {
    %c45_i32 = arith.constant 45 : i32
    %0 = "test.addi"(%arg0, %arg0) : (i32, i32) -> i32
    %1 = arith.addi %arg0, %arg0 : i32
    %2 = arith.muli %arg0, %arg0 : i32
    %3 = "test.op_commutative"(%c45_i32, %0, %1, %2) : (i32, i32, i32, i32) -> i32
    return %3 : i32
  }
  func.func @test_small_pattern_2(%arg0: i32) -> i32 {
    %0 = "test.constant"() <{value = 0 : i32}> : () -> i32
    %c0_i32 = arith.constant 0 : i32
    %1 = arith.addi %arg0, %arg0 : i32
    %2 = "test.op_commutative"(%0, %c0_i32, %1, %arg0) : (i32, i32, i32, i32) -> i32
    return %2 : i32
  }
  func.func @test_large_pattern(%arg0: i32, %arg1: i32) -> i32 {
    %0 = arith.divsi %arg0, %arg1 : i32
    %1 = arith.divsi %0, %arg0 : i32
    %2 = arith.divsi %1, %arg1 : i32
    %3 = arith.addi %1, %arg1 : i32
    %4 = arith.subi %2, %3 : i32
    %5 = "test.addi"(%arg0, %arg0) : (i32, i32) -> i32
    %6 = arith.divsi %4, %5 : i32
    %7 = arith.divsi %1, %arg1 : i32
    %8 = arith.muli %1, %arg1 : i32
    %9 = arith.subi %7, %8 : i32
    %10 = "test.addi"(%arg0, %arg0) : (i32, i32) -> i32
    %11 = arith.divsi %9, %10 : i32
    %12 = arith.divsi %6, %arg1 : i32
    %13 = arith.subi %arg1, %arg0 : i32
    %14 = "test.op_commutative"(%12, %9, %12, %8) : (i32, i32, i32, i32) -> i32
    %15 = arith.divsi %13, %14 : i32
    %16 = arith.addi %2, %15 : i32
    %17 = arith.subi %16, %arg1 : i32
    %18 = "test.addi"(%arg0, %arg0) : (i32, i32) -> i32
    %19 = arith.divsi %17, %18 : i32
    %20 = "test.addi"(%arg0, %16) : (i32, i32) -> i32
    %21 = arith.divsi %17, %20 : i32
    %22 = "test.op_large_commutative"(%16, %6, %11, %15, %19, %21, %19) : (i32, i32, i32, i32, i32, i32, i32) -> i32
    return %22 : i32
  }
}

