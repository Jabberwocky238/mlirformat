module {
  func.func @trip_count_index_zero_to_zero(%arg0: i32, %arg1: i32) -> i32 {
    %c0 = arith.constant 0 : index
    %c1 = arith.constant 1 : index
    %0 = scf.for %arg2 = %c0 to %c0 step %c1 iter_args(%arg3 = %arg0) -> (i32) {
      scf.yield %arg1 : i32
    }
    return %0 : i32
  }
}

// -----
module {
  func.func @trip_count_index_zero_to_zero_step_dyn(%arg0: i32, %arg1: i32, %arg2: index) -> i32 {
    %c0 = arith.constant 0 : index
    %0 = scf.for %arg3 = %c0 to %c0 step %arg2 iter_args(%arg4 = %arg0) -> (i32) {
      scf.yield %arg1 : i32
    }
    return %0 : i32
  }
}

// -----
module {
  func.func @trip_count_i32_zero_to_zero(%arg0: i32, %arg1: i32) -> i32 {
    %c0_i32 = arith.constant 0 : i32
    %c1_i32 = arith.constant 1 : i32
    %0 = scf.for %arg2 = %c0_i32 to %c0_i32 step %c1_i32 iter_args(%arg3 = %arg0) -> (i32)  : i32 {
      scf.yield %arg1 : i32
    }
    return %0 : i32
  }
}

// -----
module {
  func.func @trip_count_i32_zero_to_zero_step_dyn(%arg0: i32, %arg1: i32, %arg2: i32) -> i32 {
    %c0_i32 = arith.constant 0 : i32
    %0 = scf.for %arg3 = %c0_i32 to %c0_i32 step %arg2 iter_args(%arg4 = %arg0) -> (i32)  : i32 {
      scf.yield %arg1 : i32
    }
    return %0 : i32
  }
}

// -----
module {
  func.func @trip_count_index_one_to_zero(%arg0: i32, %arg1: i32) -> i32 {
    %c0 = arith.constant 0 : index
    %c1 = arith.constant 1 : index
    %0 = scf.for %arg2 = %c1 to %c0 step %c1 iter_args(%arg3 = %arg0) -> (i32) {
      scf.yield %arg1 : i32
    }
    return %0 : i32
  }
}

// -----
module {
  func.func @trip_count_i32_one_to_zero(%arg0: i32, %arg1: i32) -> i32 {
    %c0_i32 = arith.constant 0 : i32
    %c1_i32 = arith.constant 1 : i32
    %0 = scf.for %arg2 = %c1_i32 to %c0_i32 step %c1_i32 iter_args(%arg3 = %arg0) -> (i32)  : i32 {
      scf.yield %arg1 : i32
    }
    return %0 : i32
  }
}

// -----
module {
  func.func @trip_count_i32_one_to_zero_dyn_step(%arg0: i32, %arg1: i32, %arg2: i32) -> i32 {
    %c0_i32 = arith.constant 0 : i32
    %c1_i32 = arith.constant 1 : i32
    %0 = scf.for %arg3 = %c1_i32 to %c0_i32 step %arg2 iter_args(%arg4 = %arg0) -> (i32)  : i32 {
      scf.yield %arg1 : i32
    }
    return %0 : i32
  }
}

// -----
module {
  func.func @trip_count_index_negative_step(%arg0: i32, %arg1: i32) -> i32 {
    %c0 = arith.constant 0 : index
    %c1 = arith.constant 1 : index
    %c-1 = arith.constant -1 : index
    %0 = scf.for %arg2 = %c1 to %c0 step %c-1 iter_args(%arg3 = %arg0) -> (i32) {
      scf.yield %arg1 : i32
    }
    return %0 : i32
  }
}

// -----
module {
  func.func @trip_count_i32_negative_step(%arg0: i32, %arg1: i32) -> i32 {
    %c0_i32 = arith.constant 0 : i32
    %c1_i32 = arith.constant 1 : i32
    %c-1_i32 = arith.constant -1 : i32
    %0 = scf.for %arg2 = %c1_i32 to %c0_i32 step %c-1_i32 iter_args(%arg3 = %arg0) -> (i32)  : i32 {
      scf.yield %arg1 : i32
    }
    return %0 : i32
  }
}

// -----
module {
  func.func @trip_count_index_negative_step_unsigned_loop(%arg0: i32, %arg1: i32) -> i32 {
    %c0 = arith.constant 0 : index
    %c1 = arith.constant 1 : index
    %c-1 = arith.constant -1 : index
    %0 = scf.for unsigned %arg2 = %c1 to %c0 step %c-1 iter_args(%arg3 = %arg0) -> (i32) {
      scf.yield %arg1 : i32
    }
    return %0 : i32
  }
}

// -----
module {
  func.func @trip_count_i32_negative_step_unsigned_loop(%arg0: i32, %arg1: i32) -> i32 {
    %c0_i32 = arith.constant 0 : i32
    %c1_i32 = arith.constant 1 : i32
    %c-1_i32 = arith.constant -1 : i32
    %0 = scf.for unsigned %arg2 = %c1_i32 to %c0_i32 step %c-1_i32 iter_args(%arg3 = %arg0) -> (i32)  : i32 {
      scf.yield %arg1 : i32
    }
    return %0 : i32
  }
}

// -----
module {
  func.func @trip_count_index_normal_loop(%arg0: i32, %arg1: i32) -> i32 {
    %c0 = arith.constant 0 : index
    %c2 = arith.constant 2 : index
    %c10 = arith.constant 10 : index
    %0 = scf.for %arg2 = %c0 to %c10 step %c2 iter_args(%arg3 = %arg0) -> (i32) {
      scf.yield %arg1 : i32
    }
    return %0 : i32
  }
}

// -----
module {
  func.func @trip_count_i32_normal_loop(%arg0: i32, %arg1: i32) -> i32 {
    %c0_i32 = arith.constant 0 : i32
    %c2_i32 = arith.constant 2 : i32
    %c10_i32 = arith.constant 10 : i32
    %0 = scf.for %arg2 = %c0_i32 to %c10_i32 step %c2_i32 iter_args(%arg3 = %arg0) -> (i32)  : i32 {
      scf.yield %arg1 : i32
    }
    return %0 : i32
  }
}

// -----
module {
  func.func @trip_count_index_signed_crossing_zero(%arg0: i32, %arg1: i32) -> i32 {
    %c-1 = arith.constant -1 : index
    %c1 = arith.constant 1 : index
    %0 = scf.for %arg2 = %c-1 to %c1 step %c1 iter_args(%arg3 = %arg0) -> (i32) {
      scf.yield %arg1 : i32
    }
    return %0 : i32
  }
}

// -----
module {
  func.func @trip_count_i32_signed_crossing_zero(%arg0: i32, %arg1: i32) -> i32 {
    %c-1_i32 = arith.constant -1 : i32
    %c1_i32 = arith.constant 1 : i32
    %0 = scf.for %arg2 = %c-1_i32 to %c1_i32 step %c1_i32 iter_args(%arg3 = %arg0) -> (i32)  : i32 {
      scf.yield %arg1 : i32
    }
    return %0 : i32
  }
}

// -----
module {
  func.func @trip_count_index_unsigned_crossing_zero(%arg0: i32, %arg1: i32) -> i32 {
    %c-1 = arith.constant -1 : index
    %c1 = arith.constant 1 : index
    %0 = scf.for unsigned %arg2 = %c-1 to %c1 step %c1 iter_args(%arg3 = %arg0) -> (i32) {
      scf.yield %arg1 : i32
    }
    return %0 : i32
  }
}

// -----
module {
  func.func @trip_count_i32_unsigned_crossing_zero(%arg0: i32, %arg1: i32) -> i32 {
    %c-1_i32 = arith.constant -1 : i32
    %c1_i32 = arith.constant 1 : i32
    %0 = scf.for unsigned %arg2 = %c-1_i32 to %c1_i32 step %c1_i32 iter_args(%arg3 = %arg0) -> (i32)  : i32 {
      scf.yield %arg1 : i32
    }
    return %0 : i32
  }
}

// -----
module {
  func.func @trip_count_i32_unsigned_crossing_zero_dyn_step(%arg0: i32, %arg1: i32, %arg2: i32) -> i32 {
    %c-1_i32 = arith.constant -1 : i32
    %c1_i32 = arith.constant 1 : i32
    %0 = scf.for unsigned %arg3 = %c-1_i32 to %c1_i32 step %arg2 iter_args(%arg4 = %arg0) -> (i32)  : i32 {
      scf.yield %arg1 : i32
    }
    return %0 : i32
  }
}

// -----
module {
  func.func @trip_count_index_negative_bounds_signed(%arg0: i32, %arg1: i32) -> i32 {
    %c-10 = arith.constant -10 : index
    %c-1 = arith.constant -1 : index
    %c2 = arith.constant 2 : index
    %0 = scf.for %arg2 = %c-10 to %c-1 step %c2 iter_args(%arg3 = %arg0) -> (i32) {
      scf.yield %arg1 : i32
    }
    return %0 : i32
  }
}

// -----
module {
  func.func @trip_count_i32_negative_bounds_signed(%arg0: i32, %arg1: i32) -> i32 {
    %c-10_i32 = arith.constant -10 : i32
    %c-1_i32 = arith.constant -1 : i32
    %c2_i32 = arith.constant 2 : i32
    %0 = scf.for %arg2 = %c-10_i32 to %c-1_i32 step %c2_i32 iter_args(%arg3 = %arg0) -> (i32)  : i32 {
      scf.yield %arg1 : i32
    }
    return %0 : i32
  }
}

// -----
module {
  func.func @trip_count_index_negative_bounds_unsigned(%arg0: i32, %arg1: i32) -> i32 {
    %c-10 = arith.constant -10 : index
    %c-1 = arith.constant -1 : index
    %c2 = arith.constant 2 : index
    %0 = scf.for %arg2 = %c-10 to %c-1 step %c2 iter_args(%arg3 = %arg0) -> (i32) {
      scf.yield %arg1 : i32
    }
    return %0 : i32
  }
}

// -----
module {
  func.func @trip_count_i32_negative_bounds_unsigned(%arg0: i32, %arg1: i32) -> i32 {
    %c-10_i32 = arith.constant -10 : i32
    %c-1_i32 = arith.constant -1 : i32
    %c2_i32 = arith.constant 2 : i32
    %0 = scf.for %arg2 = %c-10_i32 to %c-1_i32 step %c2_i32 iter_args(%arg3 = %arg0) -> (i32)  : i32 {
      scf.yield %arg1 : i32
    }
    return %0 : i32
  }
}

// -----
module {
  func.func @trip_count_index_overflow_signed(%arg0: i32, %arg1: i32) -> i32 {
    %c1 = arith.constant 1 : index
    %c2147483647 = arith.constant 2147483647 : index
    %c2147483648 = arith.constant 2147483648 : index
    %0 = scf.for %arg2 = %c2147483647 to %c2147483648 step %c1 iter_args(%arg3 = %arg0) -> (i32) {
      scf.yield %arg1 : i32
    }
    return %0 : i32
  }
}

// -----
module {
  func.func @trip_count_i32_overflow_signed(%arg0: i32, %arg1: i32) -> i32 {
    %c1_i32 = arith.constant 1 : i32
    %c2147483647_i32 = arith.constant 2147483647 : i32
    %c-2147483648_i32 = arith.constant -2147483648 : i32
    %0 = scf.for %arg2 = %c2147483647_i32 to %c-2147483648_i32 step %c1_i32 iter_args(%arg3 = %arg0) -> (i32)  : i32 {
      scf.yield %arg1 : i32
    }
    return %0 : i32
  }
}

// -----
module {
  func.func @trip_count_i32_overflow_signed_dyn_step(%arg0: i32, %arg1: i32, %arg2: i32) -> i32 {
    %c2147483647_i32 = arith.constant 2147483647 : i32
    %c-2147483648_i32 = arith.constant -2147483648 : i32
    %0 = scf.for %arg3 = %c2147483647_i32 to %c-2147483648_i32 step %arg2 iter_args(%arg4 = %arg0) -> (i32)  : i32 {
      scf.yield %arg1 : i32
    }
    return %0 : i32
  }
}

// -----
module {
  func.func @trip_count_index_overflow_unsigned(%arg0: i32, %arg1: i32) -> i32 {
    %c1 = arith.constant 1 : index
    %c2147483647 = arith.constant 2147483647 : index
    %c2147483648 = arith.constant 2147483648 : index
    %0 = scf.for unsigned %arg2 = %c2147483647 to %c2147483648 step %c1 iter_args(%arg3 = %arg0) -> (i32) {
      scf.yield %arg1 : i32
    }
    return %0 : i32
  }
}

// -----
module {
  func.func @trip_count_i32_overflow_unsigned(%arg0: i32, %arg1: i32) -> i32 {
    %c1_i32 = arith.constant 1 : i32
    %c2147483647_i32 = arith.constant 2147483647 : i32
    %c-2147483648_i32 = arith.constant -2147483648 : i32
    %0 = scf.for unsigned %arg2 = %c2147483647_i32 to %c-2147483648_i32 step %c1_i32 iter_args(%arg3 = %arg0) -> (i32)  : i32 {
      scf.yield %arg1 : i32
    }
    return %0 : i32
  }
}

// -----
module {
  func.func @trip_count_index_overflow_64bit_signed(%arg0: i32, %arg1: i32) -> i32 {
    %c1 = arith.constant 1 : index
    %c9223372036854775807 = arith.constant 9223372036854775807 : index
    %c-9223372036854775808 = arith.constant -9223372036854775808 : index
    %0 = scf.for %arg2 = %c9223372036854775807 to %c-9223372036854775808 step %c1 iter_args(%arg3 = %arg0) -> (i32) {
      scf.yield %arg1 : i32
    }
    return %0 : i32
  }
}

// -----
module {
  func.func @trip_count_i64_overflow_64bit_signed(%arg0: i32, %arg1: i32) -> i32 {
    %c1_i64 = arith.constant 1 : i64
    %c9223372036854775807_i64 = arith.constant 9223372036854775807 : i64
    %c-9223372036854775808_i64 = arith.constant -9223372036854775808 : i64
    %0 = scf.for %arg2 = %c9223372036854775807_i64 to %c-9223372036854775808_i64 step %c1_i64 iter_args(%arg3 = %arg0) -> (i32)  : i64 {
      scf.yield %arg1 : i32
    }
    return %0 : i32
  }
}

// -----
module {
  func.func @trip_count_index_overflow_64bit_unsigned(%arg0: i32, %arg1: i32) -> i32 {
    %c1 = arith.constant 1 : index
    %c9223372036854775807 = arith.constant 9223372036854775807 : index
    %c-9223372036854775808 = arith.constant -9223372036854775808 : index
    %0 = scf.for unsigned %arg2 = %c9223372036854775807 to %c-9223372036854775808 step %c1 iter_args(%arg3 = %arg0) -> (i32) {
      scf.yield %arg1 : i32
    }
    return %0 : i32
  }
}

// -----
module {
  func.func @trip_count_i32_overflow_64bit_unsigned(%arg0: i32, %arg1: i32) -> i32 {
    %c1_i64 = arith.constant 1 : i64
    %c9223372036854775807_i64 = arith.constant 9223372036854775807 : i64
    %c-9223372036854775808_i64 = arith.constant -9223372036854775808 : i64
    %0 = scf.for unsigned %arg2 = %c9223372036854775807_i64 to %c-9223372036854775808_i64 step %c1_i64 iter_args(%arg3 = %arg0) -> (i32)  : i64 {
      scf.yield %arg1 : i32
    }
    return %0 : i32
  }
}

// -----
module {
  func.func @trip_count_step_greater_than_iteration() -> i32 {
    %c0_i32 = arith.constant 0 : i32
    %c4_i32 = arith.constant 4 : i32
    %c17_i32 = arith.constant 17 : i32
    %c16_i32 = arith.constant 16 : i32
    %0 = scf.for %arg0 = %c16_i32 to %c17_i32 step %c4_i32 iter_args(%arg1 = %c0_i32) -> (i32)  : i32 {
      scf.yield %arg0 : i32
    }
    return %0 : i32
  }
}

// -----
module {
  func.func @trip_count_arith_add(%arg0: i32) -> i32 {
    %c0_i32 = arith.constant 0 : i32
    %c4_i32 = arith.constant 4 : i32
    %c17_i32 = arith.constant 17 : i32
    %c16_i32 = arith.constant 16 : i32
    %0 = arith.addi %arg0, %c16_i32 : i32
    %1 = scf.for %arg1 = %arg0 to %0 step %c4_i32 iter_args(%arg2 = %c0_i32) -> (i32)  : i32 {
      scf.yield %arg1 : i32
    }
    return %1 : i32
  }
}

// -----
module {
  func.func @trip_count_arith_add_negative(%arg0: i32) -> i32 {
    %c0_i32 = arith.constant 0 : i32
    %c4_i32 = arith.constant 4 : i32
    %c-16_i32 = arith.constant -16 : i32
    %0 = arith.addi %arg0, %c-16_i32 : i32
    %1 = scf.for %arg1 = %arg0 to %0 step %c4_i32 iter_args(%arg2 = %c0_i32) -> (i32)  : i32 {
      scf.yield %arg1 : i32
    }
    return %1 : i32
  }
}

// -----
module {
  func.func @trip_count_arith_add_nsw_loop_signed(%arg0: i32) -> i32 {
    %c0_i32 = arith.constant 0 : i32
    %c4_i32 = arith.constant 4 : i32
    %c16_i32 = arith.constant 16 : i32
    %0 = arith.addi %arg0, %c16_i32 overflow<nsw> : i32
    %1 = scf.for %arg1 = %arg0 to %0 step %c4_i32 iter_args(%arg2 = %c0_i32) -> (i32)  : i32 {
      scf.yield %arg1 : i32
    }
    return %1 : i32
  }
}

// -----
module {
  func.func @trip_count_arith_add_negative_nsw_loop_signed(%arg0: i32) -> i32 {
    %c0_i32 = arith.constant 0 : i32
    %c4_i32 = arith.constant 4 : i32
    %c-16_i32 = arith.constant -16 : i32
    %0 = arith.addi %arg0, %c-16_i32 overflow<nsw> : i32
    %1 = scf.for %arg1 = %arg0 to %0 step %c4_i32 iter_args(%arg2 = %c0_i32) -> (i32)  : i32 {
      scf.yield %arg1 : i32
    }
    return %1 : i32
  }
}

// -----
module {
  func.func @trip_count_arith_add_negative_nsw_loop_signed_step_dyn(%arg0: i32, %arg1: i32) -> i32 {
    %c0_i32 = arith.constant 0 : i32
    %c-16_i32 = arith.constant -16 : i32
    %0 = arith.addi %arg0, %c-16_i32 overflow<nsw> : i32
    %1 = scf.for %arg2 = %arg0 to %0 step %arg1 iter_args(%arg3 = %c0_i32) -> (i32)  : i32 {
      scf.yield %arg2 : i32
    }
    return %1 : i32
  }
}

// -----
module {
  func.func @trip_count_arith_add_nsw_loop_unsigned(%arg0: i32) -> i32 {
    %c0_i32 = arith.constant 0 : i32
    %c4_i32 = arith.constant 4 : i32
    %c16_i32 = arith.constant 16 : i32
    %0 = arith.addi %arg0, %c16_i32 overflow<nsw> : i32
    %1 = scf.for unsigned %arg1 = %arg0 to %0 step %c4_i32 iter_args(%arg2 = %c0_i32) -> (i32)  : i32 {
      scf.yield %arg1 : i32
    }
    return %1 : i32
  }
}

// -----
module {
  func.func @trip_count_arith_add_negative_nsw_loop_unsigned(%arg0: i32) -> i32 {
    %c0_i32 = arith.constant 0 : i32
    %c4_i32 = arith.constant 4 : i32
    %c-16_i32 = arith.constant -16 : i32
    %0 = arith.addi %arg0, %c-16_i32 overflow<nsw> : i32
    %1 = scf.for unsigned %arg1 = %arg0 to %0 step %c4_i32 iter_args(%arg2 = %c0_i32) -> (i32)  : i32 {
      scf.yield %arg1 : i32
    }
    return %1 : i32
  }
}

// -----
module {
  func.func @trip_count_arith_add_nuw_loop_signed(%arg0: i32) -> i32 {
    %c0_i32 = arith.constant 0 : i32
    %c4_i32 = arith.constant 4 : i32
    %c16_i32 = arith.constant 16 : i32
    %0 = arith.addi %arg0, %c16_i32 overflow<nuw> : i32
    %1 = scf.for %arg1 = %arg0 to %0 step %c4_i32 iter_args(%arg2 = %c0_i32) -> (i32)  : i32 {
      scf.yield %arg1 : i32
    }
    return %1 : i32
  }
}

// -----
module {
  func.func @trip_count_arith_add_negative_nuw_loop_signed(%arg0: i32) -> i32 {
    %c0_i32 = arith.constant 0 : i32
    %c4_i32 = arith.constant 4 : i32
    %c-16_i32 = arith.constant -16 : i32
    %0 = arith.addi %arg0, %c-16_i32 overflow<nuw> : i32
    %1 = scf.for %arg1 = %arg0 to %0 step %c4_i32 iter_args(%arg2 = %c0_i32) -> (i32)  : i32 {
      scf.yield %arg1 : i32
    }
    return %1 : i32
  }
}

// -----
module {
  func.func @trip_count_arith_add_nuw_loop_unsigned(%arg0: i32) -> i32 {
    %c0_i32 = arith.constant 0 : i32
    %c4_i32 = arith.constant 4 : i32
    %c16_i32 = arith.constant 16 : i32
    %0 = arith.addi %arg0, %c16_i32 overflow<nuw> : i32
    %1 = scf.for unsigned %arg1 = %arg0 to %0 step %c4_i32 iter_args(%arg2 = %c0_i32) -> (i32)  : i32 {
      scf.yield %arg1 : i32
    }
    return %1 : i32
  }
}

// -----
module {
  func.func @trip_count_arith_add_negative_nuw_loop_unsigned(%arg0: i32) -> i32 {
    %c0_i32 = arith.constant 0 : i32
    %c4_i32 = arith.constant 4 : i32
    %c-16_i32 = arith.constant -16 : i32
    %0 = arith.addi %arg0, %c-16_i32 overflow<nuw> : i32
    %1 = scf.for unsigned %arg1 = %arg0 to %0 step %c4_i32 iter_args(%arg2 = %c0_i32) -> (i32)  : i32 {
      scf.yield %arg1 : i32
    }
    return %1 : i32
  }
}

// -----
module {
  func.func @trip_count_arith_add_negative_nuw_loop_unsigned_step_dyn(%arg0: i32, %arg1: i32) -> i32 {
    %c0_i32 = arith.constant 0 : i32
    %c-16_i32 = arith.constant -16 : i32
    %0 = arith.addi %arg0, %c-16_i32 overflow<nuw> : i32
    %1 = scf.for unsigned %arg2 = %arg0 to %0 step %arg1 iter_args(%arg3 = %c0_i32) -> (i32)  : i32 {
      scf.yield %arg2 : i32
    }
    return %1 : i32
  }
}

// -----
module {
  func.func @trip_count_arith_add_nuw_loop_unsigned_invalid(%arg0: i32, %arg1: i32) -> i32 {
    %c0_i32 = arith.constant 0 : i32
    %c4_i32 = arith.constant 4 : i32
    %c16_i32 = arith.constant 16 : i32
    %0 = arith.addi %arg1, %c16_i32 overflow<nuw> : i32
    %1 = scf.for unsigned %arg2 = %arg0 to %0 step %c4_i32 iter_args(%arg3 = %c0_i32) -> (i32)  : i32 {
      scf.yield %arg2 : i32
    }
    return %1 : i32
  }
}

