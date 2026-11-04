module {
  func.func @test_7i32_to_29() -> i32 {
    %c7_i32 = arith.constant 7 : i32
    %0 = math.ctlz %c7_i32 : i32
    return %0 : i32
  }
  func.func @test_zero() -> i32 {
    %c0_i32 = arith.constant 0 : i32
    %0 = math.ctlz %c0_i32 : i32
    return %0 : i32
  }
  func.func @test_7i64_to_61() -> i64 {
    %c7_i64 = arith.constant 7 : i64
    %0 = math.ctlz %c7_i64 : i64
    return %0 : i64
  }
}

