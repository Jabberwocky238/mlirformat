module {
  func.func @func_condBranch(%arg0: i1) {
    cf.cond_br %arg0, ^bb1, ^bb2
  ^bb1:  // pred: ^bb0
    cf.br ^bb3
  ^bb2:  // pred: ^bb0
    cf.br ^bb3
  ^bb3:  // 2 preds: ^bb1, ^bb2
    return
  }
}

// -----
module {
  func.func @func_loop(%arg0: i32, %arg1: i32) {
    cf.br ^bb1(%arg0 : i32)
  ^bb1(%0: i32):  // 2 preds: ^bb0, ^bb2
    %1 = arith.cmpi slt, %0, %arg1 : i32
    cf.cond_br %1, ^bb2, ^bb3
  ^bb2:  // pred: ^bb1
    %c1_i32 = arith.constant 1 : i32
    %2 = arith.addi %0, %c1_i32 : i32
    cf.br ^bb1(%2 : i32)
  ^bb3:  // pred: ^bb1
    return
  }
}

// -----
module {
  func.func @nested_region(%arg0: index, %arg1: index, %arg2: index) {
    scf.for %arg3 = %arg0 to %arg1 step %arg2 {
    }
    return
  }
}

// -----
module {
  func.func @nested_region2(%arg0: index, %arg1: index, %arg2: index) {
    scf.for %arg3 = %arg0 to %arg1 step %arg2 {
      scf.for %arg4 = %arg0 to %arg1 step %arg2 {
        scf.for %arg5 = %arg0 to %arg1 step %arg2 {
        }
      }
    }
    return
  }
}

// -----
module {
  func.func @func_loop_nested_region(%arg0: i32, %arg1: i32, %arg2: index, %arg3: index, %arg4: index) {
    cf.br ^bb1(%arg0 : i32)
  ^bb1(%0: i32):  // 2 preds: ^bb0, ^bb2
    %1 = arith.cmpi slt, %0, %arg1 : i32
    cf.cond_br %1, ^bb2, ^bb3
  ^bb2:  // pred: ^bb1
    %c1_i32 = arith.constant 1 : i32
    %2 = arith.addi %0, %c1_i32 : i32
    scf.for %arg5 = %arg2 to %arg3 step %arg4 {
      scf.for %arg6 = %arg2 to %arg3 step %arg4 {
      }
    }
    cf.br ^bb1(%2 : i32)
  ^bb3:  // pred: ^bb1
    return
  }
}

