module {
  func.func @repro_bitwidth_mismatch() -> i32 {
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
module {
  func.func @repro_crash() -> !test.i32 {
    %c1_i32 = arith.constant 1 : i32
    %0 = test.region_type_changer(%c1_i32) {
    ^bb0(%arg0: i32):
      test.types_compat_yield %arg0 : i32
    } : (i32) -> !test.i32
    return %0 : !test.i32
  }
}

