module {
  func.func @bounded_acc_for(%arg0: i32) -> i32 {
    %c0_i32 = arith.constant 0 : i32
    %c1_i32 = arith.constant 1 : i32
    %c10_i32 = arith.constant 10 : i32
    %0 = scf.for %arg1 = %c0_i32 to %arg0 step %c1_i32 iter_args(%arg2 = %c0_i32) -> (i32)  : i32 {
      %2 = arith.addi %arg2, %c1_i32 : i32
      %3 = arith.minsi %2, %c10_i32 : i32
      scf.yield %3 : i32
    }
    %1 = test.reflect_bounds %0 : i32
    return %1 : i32
  }
  func.func @bounded_acc_while() -> i32 {
    %c0_i32 = arith.constant 0 : i32
    %c1_i32 = arith.constant 1 : i32
    %c10_i32 = arith.constant 10 : i32
    %c100_i32 = arith.constant 100 : i32
    %0 = scf.while (%arg0 = %c0_i32) : (i32) -> i32 {
      %2 = arith.cmpi slt, %arg0, %c100_i32 : i32
      scf.condition(%2) %arg0 : i32
    } do {
    ^bb0(%arg0: i32):
      %2 = arith.addi %arg0, %c1_i32 : i32
      %3 = arith.minsi %2, %c10_i32 : i32
      scf.yield %3 : i32
    }
    %1 = test.reflect_bounds %0 : i32
    return %1 : i32
  }
  func.func @bounded_mask_for(%arg0: i32) -> i32 {
    %c0_i32 = arith.constant 0 : i32
    %c1_i32 = arith.constant 1 : i32
    %c15_i32 = arith.constant 15 : i32
    %0 = scf.for %arg1 = %c0_i32 to %arg0 step %c1_i32 iter_args(%arg2 = %c0_i32) -> (i32)  : i32 {
      %2 = arith.addi %arg2, %c1_i32 : i32
      %3 = arith.andi %2, %c15_i32 : i32
      scf.yield %3 : i32
    }
    %1 = test.reflect_bounds %0 : i32
    return %1 : i32
  }
}

