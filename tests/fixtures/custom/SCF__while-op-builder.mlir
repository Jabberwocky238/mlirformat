module {
  func.func @testMatchingTypes(%arg0: i32) {
    %0 = scf.while (%arg1 = %arg0) : (i32) -> i32 {
      %c10_i32 = arith.constant 10 : i32
      %1 = arith.cmpi slt, %arg1, %c10_i32 : i32
      scf.condition(%1) %arg1 : i32
    } do {
    ^bb0(%arg1: i32):
      scf.yield %arg1 : i32
    }
    return
  }
  func.func @testNonMatchingTypes(%arg0: i32) {
    %c1_i32 = arith.constant 1 : i32
    %c10_i32 = arith.constant 10 : i32
    %0:2 = scf.while (%arg1 = %arg0) : (i32) -> (i32, i32) {
      %1 = arith.cmpi slt, %arg1, %c10_i32 : i32
      scf.condition(%1) %arg1, %c1_i32 : i32, i32
    } do {
    ^bb0(%arg1: i32, %arg2: i32):
      %1 = arith.addi %arg1, %arg2 : i32
      scf.yield %1 : i32
    }
    return
  }
}

