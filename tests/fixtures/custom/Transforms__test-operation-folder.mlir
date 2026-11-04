module {
  func.func @foo() -> i32 {
    %c42_i32 = arith.constant 42 : i32
    %0 = "test.op_in_place_fold_anchor"(%c42_i32) : (i32) -> i32
    return %0 : i32
  }
  func.func @test_fold_before_previously_folded_op() -> (i32, i32) {
    %0 = "test.cast"() {test_fold_before_previously_folded_op} : () -> i32
    %1 = "test.cast"() {test_fold_before_previously_folded_op} : () -> i32
    return %0, %1 : i32, i32
  }
  func.func @test_dont_reorder_constants() -> (i32, i32, i32) {
    %c1_i32 = arith.constant 1 : i32
    %c2_i32 = arith.constant 2 : i32
    %c3_i32 = arith.constant 3 : i32
    return %c1_i32, %c2_i32, %c3_i32 : i32, i32, i32
  }
  func.func @test_fold_nofold_nocse() -> (i32, i32, i32, i32, i32, i32) {
    %c0_i32 = arith.constant 0 : i32
    %c1_i32 = arith.constant 1 : i32
    %c2_i32 = arith.constant 2 : i32
    %0 = arith.addi %c0_i32, %c1_i32 : i32
    %1 = arith.addi %0, %c1_i32 : i32
    %2 = arith.addi %c2_i32, %c1_i32 : i32
    return %0, %1, %2, %c0_i32, %c1_i32, %c2_i32 : i32, i32, i32, i32, i32, i32
  }
}

