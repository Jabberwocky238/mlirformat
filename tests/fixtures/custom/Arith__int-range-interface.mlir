module {
  func.func @add_min_max(%arg0: index, %arg1: index) -> index {
    %c1 = arith.constant 1 : index
    %c2 = arith.constant 2 : index
    %0 = arith.minsi %arg0, %c1 : index
    %1 = arith.maxsi %0, %c1 : index
    %2 = arith.minui %arg1, %c2 : index
    %3 = arith.maxui %2, %c2 : index
    %4 = arith.addi %1, %3 : index
    return %4 : index
  }
  func.func @add_lower_bound(%arg0: i32, %arg1: i32) -> i1 {
    %c1_i32 = arith.constant 1 : i32
    %c2_i32 = arith.constant 2 : i32
    %0 = arith.maxsi %arg0, %c1_i32 : i32
    %1 = arith.maxsi %arg1, %c1_i32 : i32
    %2 = arith.addi %0, %1 : i32
    %3 = arith.cmpi sge, %2, %c2_i32 : i32
    %4 = arith.cmpi uge, %2, %c2_i32 : i32
    %5 = arith.andi %3, %4 : i1
    return %5 : i1
  }
  func.func @sub_signed_vs_unsigned(%arg0: i64) -> i1 {
    %c0_i64 = arith.constant 0 : i64
    %c2_i64 = arith.constant 2 : i64
    %c-5_i64 = arith.constant -5 : i64
    %0 = arith.minsi %arg0, %c2_i64 : i64
    %1 = arith.maxsi %0, %c-5_i64 : i64
    %2 = arith.subi %1, %c2_i64 : i64
    %3 = arith.cmpi sle, %2, %c0_i64 : i64
    %4 = arith.cmpi ule, %2, %c0_i64 : i64
    %5 = arith.andi %3, %4 : i1
    return %5 : i1
  }
  func.func @multiply_negatives(%arg0: index, %arg1: index) -> i1 {
    %c2 = arith.constant 2 : index
    %c3 = arith.constant 3 : index
    %c-1 = arith.constant -1 : index
    %c-2 = arith.constant -2 : index
    %c-4 = arith.constant -4 : index
    %c-12 = arith.constant -12 : index
    %0 = arith.maxsi %arg0, %c2 : index
    %1 = arith.minsi %0, %c3 : index
    %2 = arith.minsi %arg1, %c-1 : index
    %3 = arith.maxsi %2, %c-4 : index
    %4 = arith.muli %1, %3 : index
    %5 = arith.cmpi slt, %4, %c-12 : index
    %6 = arith.cmpi slt, %c-1, %4 : index
    %7 = arith.ori %5, %6 : i1
    return %7 : i1
  }
  func.func @multiply_unsigned_bounds(%arg0: i16, %arg1: i16) -> i1 {
    %c0_i16 = arith.constant 0 : i16
    %c4_i16 = arith.constant 4 : i16
    %c16383_i16 = arith.constant 16383 : i16
    %c-4_i16 = arith.constant -4 : i16
    %0 = arith.andi %arg0, %c16383_i16 : i16
    %1 = arith.minui %arg1, %c4_i16 : i16
    %2 = arith.muli %0, %1 : i16
    %3 = arith.cmpi uge, %2, %c0_i16 : i16
    %4 = arith.cmpi ule, %2, %c-4_i16 : i16
    %5 = arith.andi %3, %4 : i1
    return %5 : i1
  }
  func.func @for_loop_with_increasing_arg() -> i1 {
    %c0 = arith.constant 0 : index
    %c1 = arith.constant 1 : index
    %c4 = arith.constant 4 : index
    %c16 = arith.constant 16 : index
    %0 = scf.for %arg0 = %c0 to %c4 step %c1 iter_args(%arg1 = %c0) -> (index) {
      %2 = arith.addi %arg0, %arg1 : index
      scf.yield %2 : index
    }
    %1 = arith.cmpi ule, %0, %c16 : index
    return %1 : i1
  }
  func.func @for_loop_with_constant_result() -> i1 {
    %c0 = arith.constant 0 : index
    %c1 = arith.constant 1 : index
    %c4 = arith.constant 4 : index
    %true = arith.constant true
    %0 = scf.for %arg0 = %c0 to %c4 step %c1 iter_args(%arg1 = %true) -> (i1) {
      %1 = arith.cmpi ule, %arg0, %c4 : index
      %2 = arith.andi %1, %arg1 : i1
      scf.yield %2 : i1
    }
    return %0 : i1
  }
  func.func @while_false(%arg0: index) -> index {
    %c0 = arith.constant 0 : index
    %c1 = arith.constant 1 : index
    %c2 = arith.constant 2 : index
    %0 = arith.divui %arg0, %c2 : index
    %1 = scf.while (%arg1 = %0) : (index) -> index {
      %2 = arith.cmpi slt, %arg1, %c0 : index
      scf.condition(%2) %arg1 : index
    } do {
    ^bb0(%arg1: index):
      scf.yield %c2 : index
    }
    return %1 : index
  }
  func.func @div_bounds_positive(%arg0: index) -> i1 {
    %c0 = arith.constant 0 : index
    %c2 = arith.constant 2 : index
    %c4 = arith.constant 4 : index
    %0 = arith.maxsi %arg0, %c2 : index
    %1 = arith.divsi %c4, %0 : index
    %2 = arith.divui %c4, %0 : index
    %3 = arith.cmpi sge, %1, %c0 : index
    %4 = arith.cmpi sle, %1, %c2 : index
    %5 = arith.cmpi sge, %2, %c0 : index
    %6 = arith.cmpi sle, %1, %c2 : index
    %7 = arith.andi %3, %4 : i1
    %8 = arith.andi %7, %5 : i1
    %9 = arith.andi %8, %6 : i1
    return %9 : i1
  }
  func.func @div_bounds_negative(%arg0: index) -> i1 {
    %c0 = arith.constant 0 : index
    %c-2 = arith.constant -2 : index
    %c4 = arith.constant 4 : index
    %0 = arith.minsi %arg0, %c-2 : index
    %1 = arith.divsi %c4, %0 : index
    %2 = arith.divui %c4, %0 : index
    %3 = arith.cmpi sle, %1, %c0 : index
    %4 = arith.cmpi sge, %1, %c-2 : index
    %5 = arith.cmpi eq, %2, %c0 : index
    %6 = arith.andi %3, %4 : i1
    %7 = arith.andi %6, %5 : i1
    return %7 : i1
  }
  func.func @div_zero_undefined(%arg0: index) -> i1 {
    %c0 = arith.constant 0 : index
    %c1 = arith.constant 1 : index
    %c4 = arith.constant 4 : index
    %0 = arith.andi %arg0, %c1 : index
    %1 = arith.divui %c4, %0 : index
    %2 = arith.cmpi ule, %1, %c4 : index
    return %2 : i1
  }
  func.func @div_refine_min(%arg0: index) -> i1 {
    %c1 = arith.constant 1 : index
    %c2 = arith.constant 2 : index
    %c4 = arith.constant 4 : index
    %0 = arith.andi %arg0, %c2 : index
    %1 = arith.divui %c4, %0 : index
    %2 = arith.cmpi uge, %1, %c1 : index
    return %2 : i1
  }
  func.func @ceil_divui(%arg0: index) -> i1 {
    %c0 = arith.constant 0 : index
    %c1 = arith.constant 1 : index
    %c3 = arith.constant 3 : index
    %c4 = arith.constant 4 : index
    %0 = arith.minui %arg0, %c3 : index
    %1 = arith.maxui %0, %c1 : index
    %2 = arith.ceildivui %1, %c4 : index
    %3 = arith.cmpi eq, %2, %c1 : index
    %4 = arith.maxui %0, %c0 : index
    %5 = arith.ceildivui %4, %c4 : index
    %6 = arith.cmpi eq, %5, %c1 : index
    %7 = arith.andi %3, %6 : i1
    return %7 : i1
  }
  func.func @ceil_divui_by_zero_issue_131273() {
    %0 = test.with_bounds {smax = 0 : i32, smin = -1 : i32, umax = 0 : i32, umin = -1 : i32} : i32
    %c7_i32 = arith.constant 7 : i32
    %1 = arith.ceildivui %c7_i32, %0 : i32
    return
  }
  func.func @ceil_divsi(%arg0: index) -> i1 {
    %c0 = arith.constant 0 : index
    %c1 = arith.constant 1 : index
    %c3 = arith.constant 3 : index
    %c4 = arith.constant 4 : index
    %c-4 = arith.constant -4 : index
    %0 = arith.minsi %arg0, %c3 : index
    %1 = arith.maxsi %0, %c1 : index
    %2 = arith.ceildivsi %1, %c4 : index
    %3 = arith.cmpi eq, %2, %c1 : index
    %4 = arith.ceildivsi %1, %c-4 : index
    %5 = arith.cmpi eq, %4, %c0 : index
    %6 = arith.andi %3, %5 : i1
    %7 = arith.maxsi %0, %c0 : index
    %8 = arith.ceildivsi %7, %c4 : index
    %9 = arith.cmpi eq, %8, %c1 : index
    %10 = arith.andi %6, %9 : i1
    return %10 : i1
  }
  func.func @ceil_divsi_full_range(%arg0: index) -> index {
    %c64 = arith.constant 64 : index
    %0 = arith.ceildivsi %arg0, %c64 : index
    return %0 : index
  }
  func.func @ceil_divsi_intmin_bug_115293() -> i1 {
    %0 = test.with_bounds {smax = -9223372036854775808 : si64, smin = -9223372036854775808 : si64, umax = 9223372036854775808 : ui64, umin = 9223372036854775808 : ui64} : i64
    %1 = test.with_bounds {smax = 1189465982 : si64, smin = 1189465982 : si64, umax = 1189465982 : ui64, umin = 1189465982 : ui64} : i64
    %2 = test.with_bounds {smax = 7754212542 : si64, smin = 7754212542 : si64, umax = 7754212542 : ui64, umin = 7754212542 : ui64} : i64
    %3 = arith.ceildivsi %0, %1 : i64
    %4 = arith.cmpi eq, %3, %2 : i64
    return %4 : i1
  }
  func.func @floor_divsi(%arg0: index) -> i1 {
    %c4 = arith.constant 4 : index
    %c-1 = arith.constant -1 : index
    %c-3 = arith.constant -3 : index
    %c-4 = arith.constant -4 : index
    %0 = arith.minsi %arg0, %c-1 : index
    %1 = arith.maxsi %0, %c-4 : index
    %2 = arith.floordivsi %1, %c4 : index
    %3 = arith.cmpi eq, %2, %c-1 : index
    return %3 : i1
  }
  func.func @remui_base(%arg0: index, %arg1: index) -> i1 {
    %c2 = arith.constant 2 : index
    %c4 = arith.constant 4 : index
    %0 = arith.minui %arg1, %c4 : index
    %1 = arith.maxui %0, %c2 : index
    %2 = arith.remui %arg0, %1 : index
    %3 = arith.cmpi ult, %2, %c4 : index
    return %3 : i1
  }
  func.func @remui_base_maybe_zero(%arg0: index, %arg1: index) -> i1 {
    %c4 = arith.constant 4 : index
    %c5 = arith.constant 5 : index
    %0 = arith.minui %arg1, %c4 : index
    %1 = arith.remui %arg0, %0 : index
    %2 = arith.cmpi ult, %1, %c5 : index
    return %2 : i1
  }
  func.func @remsi_base(%arg0: index, %arg1: index) -> i1 {
    %c0 = arith.constant 0 : index
    %c2 = arith.constant 2 : index
    %c4 = arith.constant 4 : index
    %c-4 = arith.constant -4 : index
    %true = arith.constant true
    %0 = arith.minsi %arg1, %c4 : index
    %1 = arith.maxsi %0, %c2 : index
    %2 = arith.remsi %arg0, %1 : index
    %3 = arith.cmpi sgt, %2, %c-4 : index
    %4 = arith.cmpi slt, %2, %c4 : index
    %5 = arith.cmpi sge, %2, %c0 : index
    %6 = arith.andi %3, %4 : i1
    %7 = arith.andi %5, %6 : i1
    return %7 : i1
  }
  func.func @remsi_positive(%arg0: index, %arg1: index) -> i1 {
    %c0 = arith.constant 0 : index
    %c2 = arith.constant 2 : index
    %c4 = arith.constant 4 : index
    %true = arith.constant true
    %0 = arith.minsi %arg1, %c4 : index
    %1 = arith.maxsi %0, %c2 : index
    %2 = arith.maxsi %arg0, %c0 : index
    %3 = arith.remsi %2, %1 : index
    %4 = arith.cmpi sge, %3, %c0 : index
    %5 = arith.cmpi slt, %3, %c4 : index
    %6 = arith.andi %4, %5 : i1
    return %6 : i1
  }
  func.func @remui_restricted(%arg0: index) -> i1 {
    %c2 = arith.constant 2 : index
    %c3 = arith.constant 3 : index
    %c4 = arith.constant 4 : index
    %0 = arith.minui %arg0, %c3 : index
    %1 = arith.maxui %0, %c2 : index
    %2 = arith.remui %1, %c4 : index
    %3 = arith.cmpi ule, %2, %c3 : index
    %4 = arith.cmpi uge, %2, %c2 : index
    %5 = arith.andi %3, %4 : i1
    return %5 : i1
  }
  func.func @remsi_restricted(%arg0: index) -> i1 {
    %c2 = arith.constant 2 : index
    %c3 = arith.constant 3 : index
    %c-4 = arith.constant -4 : index
    %0 = arith.minsi %arg0, %c3 : index
    %1 = arith.maxsi %0, %c2 : index
    %2 = arith.remsi %1, %c-4 : index
    %3 = arith.cmpi ule, %2, %c3 : index
    %4 = arith.cmpi uge, %2, %c2 : index
    %5 = arith.andi %3, %4 : i1
    return %5 : i1
  }
  func.func @remui_restricted_fails(%arg0: index) -> i1 {
    %c2 = arith.constant 2 : index
    %c3 = arith.constant 3 : index
    %c4 = arith.constant 4 : index
    %c5 = arith.constant 5 : index
    %0 = arith.minui %arg0, %c5 : index
    %1 = arith.maxui %0, %c3 : index
    %2 = arith.remui %1, %c4 : index
    %3 = arith.cmpi ne, %2, %c2 : index
    return %3 : i1
  }
  func.func @remsi_restricted_fails(%arg0: index) -> i1 {
    %c2 = arith.constant 2 : index
    %c3 = arith.constant 3 : index
    %c5 = arith.constant 5 : index
    %c-4 = arith.constant -4 : index
    %0 = arith.minsi %arg0, %c5 : index
    %1 = arith.maxsi %0, %c3 : index
    %2 = arith.remsi %1, %c-4 : index
    %3 = arith.cmpi ne, %2, %c2 : index
    return %3 : i1
  }
  func.func @andi(%arg0: index) -> i1 {
    %c2 = arith.constant 2 : index
    %c5 = arith.constant 5 : index
    %c7 = arith.constant 7 : index
    %0 = arith.minsi %arg0, %c5 : index
    %1 = arith.maxsi %0, %c2 : index
    %2 = arith.andi %1, %c7 : index
    %3 = arith.cmpi ugt, %2, %c5 : index
    %4 = arith.cmpi ule, %2, %c7 : index
    %5 = arith.andi %3, %4 : i1
    return %5 : i1
  }
  func.func @andi_doesnt_make_nonnegative(%arg0: index) -> i1 {
    %c0 = arith.constant 0 : index
    %c1 = arith.constant 1 : index
    %0 = arith.addi %arg0, %c1 : index
    %1 = arith.andi %arg0, %0 : index
    %2 = arith.cmpi sge, %1, %c0 : index
    return %2 : i1
  }
  func.func @ori(%arg0: i128, %arg1: i128) -> i1 {
    %c-1_i128 = arith.constant -1 : i128
    %c0_i128 = arith.constant 0 : i128
    %0 = arith.minsi %arg1, %c-1_i128 : i128
    %1 = arith.ori %arg0, %0 : i128
    %2 = arith.cmpi slt, %1, %c0_i128 : i128
    return %2 : i1
  }
  func.func @xori_issue_82168() -> i1 {
    %c0_i64 = arith.constant 0 : i64
    %c2060639849_i64 = arith.constant 2060639849 : i64
    %0 = test.with_bounds {smax = 2060639850 : i64, smin = 2060639849 : i64, umax = 2060639850 : i64, umin = 2060639849 : i64} : i64
    %1 = arith.xori %0, %c2060639849_i64 : i64
    %2 = arith.cmpi eq, %1, %c0_i64 : i64
    return %2 : i1
  }
  func.func @xori_i1() -> (i1, i1) {
    %true = arith.constant true
    %0 = test.with_bounds {smax = false, smin = false, umax = false, umin = false} : i1
    %1 = test.with_bounds {smax = true, smin = true, umax = true, umin = true} : i1
    %2 = arith.xori %0, %true : i1
    %3 = arith.xori %1, %true : i1
    return %2, %3 : i1, i1
  }
  func.func @xori(%arg0: i64, %arg1: i64) -> i1 {
    %c0_i64 = arith.constant 0 : i64
    %c7_i64 = arith.constant 7 : i64
    %c15_i64 = arith.constant 15 : i64
    %true = arith.constant true
    %0 = arith.minui %arg0, %c7_i64 : i64
    %1 = arith.minui %arg1, %c15_i64 : i64
    %2 = arith.xori %0, %1 : i64
    %3 = arith.cmpi sle, %2, %c15_i64 : i64
    %4 = arith.xori %3, %true : i1
    return %4 : i1
  }
  func.func @extui(%arg0: i16) -> i1 {
    %c65535_i32 = arith.constant 65535 : i32
    %0 = arith.extui %arg0 : i16 to i32
    %1 = arith.cmpi ule, %0, %c65535_i32 : i32
    return %1 : i1
  }
  func.func @extsi(%arg0: i16) -> i1 {
    %c32767_i32 = arith.constant 32767 : i32
    %c-32768_i32 = arith.constant -32768 : i32
    %0 = arith.extsi %arg0 : i16 to i32
    %1 = arith.cmpi sle, %0, %c32767_i32 : i32
    %2 = arith.cmpi sge, %0, %c-32768_i32 : i32
    %3 = arith.andi %1, %2 : i1
    return %3 : i1
  }
  func.func @trunci(%arg0: i32) -> i1 {
    %c-14_i32 = arith.constant -14 : i32
    %c-14_i16 = arith.constant -14 : i16
    %c-32768_i32 = arith.constant -32768 : i32
    %0 = arith.minsi %arg0, %c-14_i32 : i32
    %1 = arith.maxsi %0, %c-32768_i32 : i32
    %2 = arith.trunci %1 : i32 to i16
    %3 = arith.cmpi sle, %2, %c-14_i16 : i16
    %4 = arith.extsi %2 : i16 to i32
    %5 = arith.cmpi sle, %4, %c-14_i32 : i32
    %6 = arith.cmpi sge, %4, %c-32768_i32 : i32
    %7 = arith.andi %3, %5 : i1
    %8 = arith.andi %7, %6 : i1
    return %8 : i1
  }
  func.func @index_cast(%arg0: index) -> i1 {
    %c-2147483648_i64 = arith.constant -2147483648 : i64
    %0 = arith.index_cast %arg0 : index to i32
    %1 = arith.index_cast %0 : i32 to index
    %2 = arith.index_cast %c-2147483648_i64 : i64 to index
    %3 = arith.cmpi sge, %1, %2 : index
    return %3 : i1
  }
  func.func @shli(%arg0: i32, %arg1: i1) -> i1 {
    %c2_i32 = arith.constant 2 : i32
    %c4_i32 = arith.constant 4 : i32
    %c8_i32 = arith.constant 8 : i32
    %c32_i32 = arith.constant 32 : i32
    %c-1_i32 = arith.constant -1 : i32
    %c-16_i32 = arith.constant -16 : i32
    %0 = arith.maxsi %arg0, %c-1_i32 : i32
    %1 = arith.minsi %0, %c2_i32 : i32
    %2 = arith.select %arg1, %c2_i32, %c4_i32 : i32
    %3 = arith.shli %1, %2 : i32
    %4 = arith.cmpi sge, %3, %c-16_i32 : i32
    %5 = arith.cmpi sle, %3, %c32_i32 : i32
    %6 = arith.cmpi sgt, %3, %c8_i32 : i32
    %7 = arith.andi %4, %5 : i1
    %8 = arith.andi %7, %6 : i1
    return %8 : i1
  }
  func.func @shrui(%arg0: i1) -> i1 {
    %c2_i32 = arith.constant 2 : i32
    %c4_i32 = arith.constant 4 : i32
    %c8_i32 = arith.constant 8 : i32
    %c32_i32 = arith.constant 32 : i32
    %0 = arith.select %arg0, %c2_i32, %c4_i32 : i32
    %1 = arith.shrui %c32_i32, %0 : i32
    %2 = arith.cmpi ule, %1, %c8_i32 : i32
    %3 = arith.cmpi uge, %1, %c2_i32 : i32
    %4 = arith.cmpi uge, %1, %c8_i32 : i32
    %5 = arith.andi %2, %3 : i1
    %6 = arith.andi %5, %4 : i1
    return %6 : i1
  }
  func.func @shrsi(%arg0: i32, %arg1: i1) -> i1 {
    %c2_i32 = arith.constant 2 : i32
    %c4_i32 = arith.constant 4 : i32
    %c8_i32 = arith.constant 8 : i32
    %c32_i32 = arith.constant 32 : i32
    %c-8_i32 = arith.constant -8 : i32
    %c-32_i32 = arith.constant -32 : i32
    %0 = arith.maxsi %arg0, %c-32_i32 : i32
    %1 = arith.minsi %0, %c32_i32 : i32
    %2 = arith.select %arg1, %c2_i32, %c4_i32 : i32
    %3 = arith.shrsi %1, %2 : i32
    %4 = arith.cmpi sge, %3, %c-8_i32 : i32
    %5 = arith.cmpi sle, %3, %c8_i32 : i32
    %6 = arith.cmpi slt, %3, %c2_i32 : i32
    %7 = arith.andi %4, %5 : i1
    %8 = arith.andi %7, %6 : i1
    return %8 : i1
  }
  func.func @no_aggressive_eq(%arg0: index) -> i1 {
    %c1 = arith.constant 1 : index
    %0 = arith.andi %arg0, %c1 : index
    %1 = arith.minui %arg0, %c1 : index
    %2 = arith.cmpi eq, %0, %1 : index
    return %2 : i1
  }
  func.func @select_union(%arg0: index, %arg1: i1) -> i1 {
    %c64 = arith.constant 64 : index
    %c100 = arith.constant 100 : index
    %c128 = arith.constant 128 : index
    %c192 = arith.constant 192 : index
    %0 = arith.remui %arg0, %c64 : index
    %1 = arith.addi %0, %c128 : index
    %2 = arith.select %arg1, %0, %1 : index
    %3 = arith.cmpi slt, %2, %c192 : index
    %4 = arith.cmpi ne, %c100, %2 : index
    %5 = arith.andi %3, %4 : i1
    return %5 : i1
  }
  func.func @if_union(%arg0: index, %arg1: i1) -> i1 {
    %c4 = arith.constant 4 : index
    %c16 = arith.constant 16 : index
    %c-1 = arith.constant -1 : index
    %c-4 = arith.constant -4 : index
    %0 = arith.minui %arg0, %c4 : index
    %1 = scf.if %arg1 -> (index) {
      %5 = arith.muli %0, %0 : index
      scf.yield %5 : index
    } else {
      %5 = arith.muli %0, %c-1 : index
      scf.yield %5 : index
    }
    %2 = arith.cmpi sle, %1, %c16 : index
    %3 = arith.cmpi sge, %1, %c-4 : index
    %4 = arith.andi %2, %3 : i1
    return %4 : i1
  }
  func.func @branch_union(%arg0: index, %arg1: i1) -> i1 {
    %c4 = arith.constant 4 : index
    %c16 = arith.constant 16 : index
    %c-1 = arith.constant -1 : index
    %c-4 = arith.constant -4 : index
    %0 = arith.minui %arg0, %c4 : index
    cf.cond_br %arg1, ^bb1, ^bb2
  ^bb1:  // pred: ^bb0
    %1 = arith.muli %0, %0 : index
    cf.br ^bb3(%1 : index)
  ^bb2:  // pred: ^bb0
    %2 = arith.muli %0, %c-1 : index
    cf.br ^bb3(%2 : index)
  ^bb3(%3: index):  // 2 preds: ^bb1, ^bb2
    %4 = arith.cmpi sle, %3, %c16 : index
    %5 = arith.cmpi sge, %3, %c-4 : index
    %6 = arith.andi %4, %5 : i1
    return %6 : i1
  }
  func.func @loop_bound_not_inferred_with_branch(%arg0: index, %arg1: i1) -> i1 {
    %c0 = arith.constant 0 : index
    %c1 = arith.constant 1 : index
    %c4 = arith.constant 4 : index
    %0 = arith.minui %arg0, %c4 : index
    cf.br ^bb2(%c0 : index)
  ^bb1(%1: index):  // pred: ^bb2
    %2 = arith.addi %1, %c1 : index
    cf.br ^bb2(%2 : index)
  ^bb2(%3: index):  // 2 preds: ^bb0, ^bb1
    %4 = arith.cmpi ult, %3, %c4 : index
    cf.cond_br %4, ^bb1(%3 : index), ^bb3(%3 : index)
  ^bb3(%5: index):  // pred: ^bb2
    %6 = arith.cmpi sge, %5, %c0 : index
    %7 = arith.cmpi slt, %5, %c4 : index
    %8 = arith.andi %6, %7 : i1
    return %8 : i1
  }
  func.func @truncation_spillover(%arg0: memref<?xi32>) -> index {
    %c0 = arith.constant 0 : index
    %c1 = arith.constant 1 : index
    %c2 = arith.constant 2 : index
    %c49 = arith.constant 49 : index
    %0 = scf.for %arg1 = %c0 to %c2 step %c1 iter_args(%arg2 = %c0) -> (index) {
      %1 = arith.divsi %arg2, %c49 : index
      %2 = arith.index_cast %1 : index to i32
      memref.store %2, %arg0[%c0] : memref<?xi32>
      %3 = arith.addi %arg2, %arg1 : index
      scf.yield %3 : index
    }
    return %0 : index
  }
  func.func @trunc_catches_overflow(%arg0: i16) -> i1 {
    %c0_i16 = arith.constant 0 : i16
    %c130_i16 = arith.constant 130 : i16
    %c0_i8 = arith.constant 0 : i8
    %0 = arith.maxui %arg0, %c0_i16 : i16
    %1 = arith.minui %0, %c130_i16 : i16
    %2 = arith.trunci %1 : i16 to i8
    %3 = arith.cmpi sge, %2, %c0_i8 : i8
    %4 = arith.cmpi uge, %2, %c0_i8 : i8
    %5 = arith.andi %3, %4 : i1
    return %5 : i1
  }
  func.func @trunc_respects_same_high_half(%arg0: i16) -> i1 {
    %c256_i16 = arith.constant 256 : i16
    %c257_i16 = arith.constant 257 : i16
    %c2_i8 = arith.constant 2 : i8
    %0 = arith.maxui %arg0, %c256_i16 : i16
    %1 = arith.minui %0, %c257_i16 : i16
    %2 = arith.trunci %1 : i16 to i8
    %3 = arith.cmpi sge, %2, %c2_i8 : i8
    return %3 : i1
  }
  func.func @trunc_handles_small_signed_ranges(%arg0: i16) -> i1 {
    %c-2_i16 = arith.constant -2 : i16
    %c2_i16 = arith.constant 2 : i16
    %c-2_i8 = arith.constant -2 : i8
    %c2_i8 = arith.constant 2 : i8
    %0 = arith.maxsi %arg0, %c-2_i16 : i16
    %1 = arith.minsi %0, %c2_i16 : i16
    %2 = arith.trunci %1 : i16 to i8
    %3 = arith.cmpi sge, %2, %c-2_i8 : i8
    %4 = arith.cmpi sle, %2, %c2_i8 : i8
    %5 = arith.andi %3, %4 : i1
    return %5 : i1
  }
  func.func @extui_uses_unsigned(%arg0: i32) -> i1 {
    %c-2147483648_i32 = arith.constant -2147483648 : i32
    %c2147483648_i64 = arith.constant 2147483648 : i64
    %c0_i64 = arith.constant 0 : i64
    %0 = arith.minui %arg0, %c-2147483648_i32 : i32
    %1 = arith.extui %0 : i32 to i64
    %2 = arith.cmpi sge, %1, %c0_i64 : i64
    %3 = arith.cmpi ule, %1, %c2147483648_i64 : i64
    %4 = arith.andi %2, %3 : i1
    return %4 : i1
  }
  func.func @caller(%arg0: memref<?xindex, 4>) {
    call @callee(%arg0) : (memref<?xindex, 4>) -> ()
    return
  }
  func.func private @callee(%arg0: memref<?xindex, 4>) {
    %c1 = arith.constant 1 : index
    %c0 = arith.constant 0 : index
    %0 = affine.load %arg0[0] : memref<?xindex, 4>
    scf.for %arg1 = %c0 to %0 step %c1 {
    }
    return
  }
  func.func @test_i8_bounds() -> i8 {
    %c1_i8 = arith.constant 1 : i8
    %0 = test.with_bounds {smax = 127 : i8, smin = -128 : i8, umax = -1 : i8, umin = 0 : i8} : i8
    %1 = arith.addi %0, %c1_i8 : i8
    %2 = test.reflect_bounds %1 : i8
    return %2 : i8
  }
  func.func @test_add_1() -> i8 {
    %c1_i8 = arith.constant 1 : i8
    %0 = test.with_bounds {smax = 127 : i8, smin = -128 : i8, umax = -1 : i8, umin = 0 : i8} : i8
    %1 = arith.addi %0, %c1_i8 : i8
    %2 = test.reflect_bounds %1 : i8
    return %2 : i8
  }
  func.func @test_add_i8_wrap1() -> i8 {
    %c1_i8 = arith.constant 1 : i8
    %0 = test.with_bounds {smax = 127 : i8, smin = 0 : i8, umax = 127 : i8, umin = 0 : i8} : i8
    %1 = arith.addi %0, %c1_i8 : i8
    %2 = test.reflect_bounds %1 : i8
    return %2 : i8
  }
  func.func @test_add_i8_wrap2() -> i8 {
    %c1_i8 = arith.constant 1 : i8
    %0 = test.with_bounds {smax = 127 : i8, smin = 0 : i8, umax = 127 : i8, umin = 0 : i8} : i8
    %1 = arith.addi %0, %c1_i8 overflow<nuw> : i8
    %2 = test.reflect_bounds %1 : i8
    return %2 : i8
  }
  func.func @test_add_i8_nowrap() -> i8 {
    %c1_i8 = arith.constant 1 : i8
    %0 = test.with_bounds {smax = 127 : i8, smin = 0 : i8, umax = 127 : i8, umin = 0 : i8} : i8
    %1 = arith.addi %0, %c1_i8 overflow<nsw> : i8
    %2 = test.reflect_bounds %1 : i8
    return %2 : i8
  }
  func.func @test_sub_i8_wrap1() -> i8 {
    %c10_i8 = arith.constant 10 : i8
    %0 = test.with_bounds {smax = 15 : i8, smin = 0 : i8, umax = 15 : i8, umin = 0 : i8} : i8
    %1 = arith.subi %0, %c10_i8 : i8
    %2 = test.reflect_bounds %1 : i8
    return %2 : i8
  }
  func.func @test_sub_i8_wrap2() -> i8 {
    %c10_i8 = arith.constant 10 : i8
    %0 = test.with_bounds {smax = 15 : i8, smin = 0 : i8, umax = 15 : i8, umin = 0 : i8} : i8
    %1 = arith.subi %0, %c10_i8 overflow<nsw> : i8
    %2 = test.reflect_bounds %1 : i8
    return %2 : i8
  }
  func.func @test_sub_i8_nowrap() -> i8 {
    %c10_i8 = arith.constant 10 : i8
    %0 = test.with_bounds {smax = 15 : i8, smin = 0 : i8, umax = 15 : i8, umin = 0 : i8} : i8
    %1 = arith.subi %0, %c10_i8 overflow<nuw> : i8
    %2 = test.reflect_bounds %1 : i8
    return %2 : i8
  }
  func.func @test_mul_i8_wrap() -> i8 {
    %c10_i8 = arith.constant 10 : i8
    %0 = test.with_bounds {smax = 20 : i8, smin = 10 : i8, umax = 20 : i8, umin = 10 : i8} : i8
    %1 = arith.muli %0, %c10_i8 : i8
    %2 = test.reflect_bounds %1 : i8
    return %2 : i8
  }
  func.func @test_mul_i8_nowrap() -> i8 {
    %c10_i8 = arith.constant 10 : i8
    %0 = test.with_bounds {smax = 20 : i8, smin = 10 : i8, umax = 20 : i8, umin = 10 : i8} : i8
    %1 = arith.muli %0, %c10_i8 overflow<nsw> : i8
    %2 = test.reflect_bounds %1 : i8
    return %2 : i8
  }
  func.func @test_shl_i8_wrap1() -> i8 {
    %c3_i8 = arith.constant 3 : i8
    %0 = test.with_bounds {smax = 20 : i8, smin = 10 : i8, umax = 20 : i8, umin = 10 : i8} : i8
    %1 = arith.shli %0, %c3_i8 : i8
    %2 = test.reflect_bounds %1 : i8
    return %2 : i8
  }
  func.func @test_shl_i8_wrap2() -> i8 {
    %c3_i8 = arith.constant 3 : i8
    %0 = test.with_bounds {smax = 20 : i8, smin = 10 : i8, umax = 20 : i8, umin = 10 : i8} : i8
    %1 = arith.shli %0, %c3_i8 overflow<nuw> : i8
    %2 = test.reflect_bounds %1 : i8
    return %2 : i8
  }
  func.func @test_shl_i8_nowrap() -> i8 {
    %c3_i8 = arith.constant 3 : i8
    %0 = test.with_bounds {smax = 20 : i8, smin = 10 : i8, umax = 20 : ui8, umin = 10 : i8} : i8
    %1 = arith.shli %0, %c3_i8 overflow<nsw> : i8
    %2 = test.reflect_bounds %1 : i8
    return %2 : i8
  }
  func.func @test_cmpf_propagates(%arg0: f32, %arg1: f32) -> index {
    %c1 = arith.constant 1 : index
    %c2 = arith.constant 2 : index
    %0 = arith.cmpf ueq, %arg0, %arg1 : f32
    %1 = arith.select %0, %c1, %c2 : index
    %2 = test.reflect_bounds %1 : index
    return %2 : index
  }
  func.func @zero_trip_loop() {
    %c1 = arith.constant 1 : index
    scf.for %arg0 = %c1 to %c1 step %c1 {
      %0 = index.floordivs %arg0, %arg0
    }
    return
  }
  func.func @zero_trip_loop2() {
    %c1 = arith.constant 1 : index
    %c-1 = arith.constant -1 : index
    scf.for %arg0 = %c1 to %c1 step %c-1 {
      %0 = index.floordivs %arg0, %arg0
    }
    return
  }
  func.func @noninteger_operation_result(%arg0: index, %arg1: index, %arg2: index, %arg3: i1) {
    %c1_i32 = arith.constant 1 : i32
    %0 = "some_fp_op"() : () -> f32
    %1:2 = scf.for %arg4 = %arg0 to %arg1 step %arg2 iter_args(%arg5 = %c1_i32, %arg6 = %0) -> (i32, f32) {
      %3:2 = "some_op"() : () -> (i32, f32)
      scf.yield %3#0, %3#1 : i32, f32
    }
    %2 = arith.select %arg3, %c1_i32, %1#0 : i32
    "use"(%2, %1#1) : (i32, f32) -> ()
    return
  }
}

