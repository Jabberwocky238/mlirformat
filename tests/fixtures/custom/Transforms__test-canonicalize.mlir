module {
  func.func @remove_op_with_inner_ops_pattern() {
    "test.op_with_region_pattern"() ({
      "test.op_with_region_terminator"() : () -> ()
    }) : () -> ()
    return
  }
  func.func @remove_op_with_inner_ops_fold_no_side_effect() {
    "test.op_with_region_fold_no_side_effect"() ({
      "test.op_with_region_terminator"() : () -> ()
    }) : () -> ()
    return
  }
  func.func @remove_op_with_inner_ops_fold(%arg0: i32) -> i32 {
    %0 = "test.op_with_region_fold"(%arg0) ({
      "test.op_with_region_terminator"() : () -> ()
    }) : (i32) -> i32
    return %0 : i32
  }
  func.func @remove_op_with_variadic_results_and_folder(%arg0: i32, %arg1: i32) -> (i32, i32) {
    %0:2 = "test.op_with_variadic_results_and_folder"(%arg0, %arg1) : (i32, i32) -> (i32, i32)
    return %0#0, %0#1 : i32, i32
  }
  func.func @test_commutative_multi(%arg0: i32, %arg1: i32) -> (i32, i32) {
    %c42_i32 = arith.constant 42 : i32
    %c43_i32 = arith.constant 43 : i32
    %0 = "test.op_commutative"(%c42_i32, %arg0, %arg1, %c43_i32) : (i32, i32, i32, i32) -> i32
    %1 = "test.op_commutative"(%arg0, %c42_i32, %c43_i32, %arg1) : (i32, i32, i32, i32) -> i32
    return %0, %1 : i32, i32
  }
  func.func @test_commutative_multi_cst(%arg0: i32, %arg1: i32) -> (i32, i32) {
    %c42_i32 = arith.constant 42 : i32
    %c42_i32_0 = arith.constant 42 : i32
    %0 = "test.op_commutative"(%c42_i32, %arg0, %arg1, %c42_i32_0) : (i32, i32, i32, i32) -> i32
    %c42_i32_1 = arith.constant 42 : i32
    %1 = "test.op_commutative"(%arg0, %c42_i32_1, %c42_i32_0, %arg1) : (i32, i32, i32, i32) -> i32
    return %0, %1 : i32, i32
  }
  func.func @test_dialect_canonicalizer() -> i32 {
    %0 = "test.dialect_canonicalizable"() : () -> i32
    return %0 : i32
  }
  func.func @test_region_simplify(%arg0: i32, %arg1: i1) -> i32 {
    "test.br"(%arg0, %arg0)[^bb1] : (i32, i32) -> ()
  ^bb1(%0: i32, %1: i32):  // pred: ^bb0
    return %0 : i32
  }
}

