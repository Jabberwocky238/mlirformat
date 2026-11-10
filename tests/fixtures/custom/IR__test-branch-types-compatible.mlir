module {
  func.func @region_branch_compat() -> i32 {
    %c0_i32 = arith.constant 0 : i32
    %0 = "test.region_types_compat"(%c0_i32) ({
    ^bb0(%arg0: i64):
      %c1_i64 = arith.constant 1 : i64
      test.types_compat_yield %c1_i64 : i64
    }) : (i32) -> i32
    return %0 : i32
  }
}

// -----
// -----
module {
  func.func @loop_compat() -> i32 {
    %c0_i32 = arith.constant 0 : i32
    %0 = "test.loop_types_compat"(%c0_i32) ({
    ^bb0(%arg0: i64):
      %c1_i64 = arith.constant 1 : i64
      test.types_compat_yield %c1_i64 : i64
    }) : (i32) -> i32
    return %0 : i32
  }
}

// -----
// -----
