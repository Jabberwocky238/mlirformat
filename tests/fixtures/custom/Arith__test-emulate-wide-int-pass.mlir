module {
  func.func @entry() {
    %c0_i64 = arith.constant 0 : i64
    %0 = call @emulate_me_please(%c0_i64) : (i64) -> i64
    %1 = call @foo(%c0_i64) : (i64) -> i64
    return
  }
  func.func @emulate_me_please(%arg0: i64) -> i64 {
    %0 = arith.addi %arg0, %arg0 : i64
    return %0 : i64
  }
  func.func @foo(%arg0: i64) -> i64 {
    %0 = arith.addi %arg0, %arg0 : i64
    return %0 : i64
  }
}

