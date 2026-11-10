module {
  func.func @affine_parallel_assign_reduction_no_crash(%arg0: index) -> i32 {
    %0 = affine.parallel (%arg1) = (0) to (%arg0) reduce ("assign") -> (i32) {
      %c0_i32 = arith.constant 0 : i32
      affine.yield %c0_i32 : i32
    }
    return %0 : i32
  }
}

