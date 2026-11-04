module {
  func.func @func_empty() {
    return
  }
}

// -----
module {
  func.func @func_simpleBranch(%arg0: i32, %arg1: i32) -> i32 {
    cf.br ^bb1
  ^bb1:  // pred: ^bb0
    %0 = arith.addi %arg0, %arg1 : i32
    return %0 : i32
  }
}

// -----
module {
  func.func @func_condBranch(%arg0: i1, %arg1: i32, %arg2: i32) -> i32 {
    cf.cond_br %arg0, ^bb1, ^bb2
  ^bb1:  // pred: ^bb0
    cf.br ^bb3
  ^bb2:  // pred: ^bb0
    cf.br ^bb3
  ^bb3:  // 2 preds: ^bb1, ^bb2
    %0 = arith.addi %arg1, %arg2 : i32
    return %0 : i32
  }
}

// -----
module {
  func.func @func_loop(%arg0: i32, %arg1: i32) -> i32 {
    %c0_i32 = arith.constant 0 : i32
    cf.br ^bb1(%c0_i32, %arg0 : i32, i32)
  ^bb1(%0: i32, %1: i32):  // 2 preds: ^bb0, ^bb2
    %2 = arith.cmpi slt, %0, %arg1 : i32
    cf.cond_br %2, ^bb2(%1 : i32), ^bb3(%1 : i32)
  ^bb2(%3: i32):  // pred: ^bb1
    %c1_i32 = arith.constant 1 : i32
    %4 = arith.addi %3, %c1_i32 : i32
    %5 = arith.addi %0, %c1_i32 : i32
    cf.br ^bb1(%4, %5 : i32, i32)
  ^bb3(%6: i32):  // pred: ^bb1
    %7 = arith.addi %6, %arg1 : i32
    return %7 : i32
  }
}

// -----
module {
  func.func @func_ranges(%arg0: i1, %arg1: i32, %arg2: i32, %arg3: i32) -> i32 {
    %0 = arith.addi %arg1, %arg2 : i32
    %c1_i32 = arith.constant 1 : i32
    %1 = arith.addi %c1_i32, %arg2 : i32
    %2 = arith.addi %c1_i32, %arg3 : i32
    %3 = arith.muli %0, %1 : i32
    %4 = arith.muli %3, %2 : i32
    %5 = arith.addi %4, %c1_i32 : i32
    cf.cond_br %arg0, ^bb1, ^bb2
  ^bb1:  // pred: ^bb0
    %c4_i32 = arith.constant 4 : i32
    %6 = arith.muli %4, %c4_i32 : i32
    cf.br ^bb3(%6 : i32)
  ^bb2:  // pred: ^bb0
    %7 = arith.muli %4, %5 : i32
    %8 = arith.addi %4, %arg2 : i32
    cf.br ^bb3(%8 : i32)
  ^bb3(%9: i32):  // 2 preds: ^bb1, ^bb2
    %10 = arith.addi %9, %arg2 : i32
    return %10 : i32
  }
}

// -----
module {
  func.func @nested_region(%arg0: index, %arg1: index, %arg2: index, %arg3: i32, %arg4: i32, %arg5: i32, %arg6: memref<i32>) -> i32 {
    %0 = arith.addi %arg3, %arg4 : i32
    %1 = arith.addi %arg4, %arg5 : i32
    scf.for %arg7 = %arg0 to %arg1 step %arg2 {
      %2 = arith.addi %0, %arg5 : i32
      %3 = arith.addi %2, %0 : i32
      memref.store %3, %arg6[] : memref<i32>
    }
    return %1 : i32
  }
}

// -----
module {
  func.func @nested_region2(%arg0: index, %arg1: index, %arg2: index, %arg3: i32, %arg4: i32, %arg5: i32, %arg6: memref<i32>) -> i32 {
    %0 = arith.addi %arg3, %arg4 : i32
    %1 = arith.addi %arg4, %arg5 : i32
    scf.for %arg7 = %arg0 to %arg1 step %arg2 {
      %2 = arith.addi %0, %arg5 : i32
      scf.for %arg8 = %arg0 to %arg1 step %arg2 {
        %3 = arith.addi %2, %0 : i32
        memref.store %3, %arg6[] : memref<i32>
      }
    }
    return %1 : i32
  }
}

// -----
module {
  func.func @nested_region3(%arg0: index, %arg1: index, %arg2: index, %arg3: i32, %arg4: i32, %arg5: i32, %arg6: memref<i32>) -> i32 {
    %0 = arith.addi %arg3, %arg4 : i32
    %1 = arith.addi %arg4, %arg5 : i32
    scf.for %arg7 = %arg0 to %arg1 step %arg2 {
      %2 = arith.addi %0, %arg5 : i32
      memref.store %2, %arg6[] : memref<i32>
    }
    cf.br ^bb1
  ^bb1:  // pred: ^bb0
    scf.for %arg7 = %arg0 to %arg1 step %arg2 {
      %2 = arith.addi %0, %1 : i32
      memref.store %2, %arg6[] : memref<i32>
    }
    return %1 : i32
  }
}

// -----
module {
  func.func @nested_region4(%arg0: index, %arg1: index, %arg2: index) {
    %c0_i32 = arith.constant 0 : i32
    %c1_i32 = arith.constant 1 : i32
    %0 = scf.for %arg3 = %arg0 to %arg1 step %arg2 iter_args(%arg4 = %c0_i32) -> (i32) {
      %1 = arith.addi %arg4, %c1_i32 : i32
      scf.yield %1 : i32
    }
    return
  }
}

