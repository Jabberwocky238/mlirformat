module {
  func.func @simple() {
    return
  }
  func.func @loopForever() {
    cf.br ^bb1
  ^bb1:  // 2 preds: ^bb0, ^bb1
    cf.br ^bb1
  }
  func.func @loopForever2() {
    cf.br ^bb1
  ^bb1:  // 2 preds: ^bb0, ^bb2
    cf.br ^bb2
  ^bb2:  // pred: ^bb1
    cf.br ^bb1
  }
  func.func @noLoop(%arg0: i1) {
    cf.br ^bb1
  ^bb1:  // pred: ^bb0
    cf.cond_br %arg0, ^bb2, ^bb3
  ^bb2:  // pred: ^bb1
    return
  ^bb3:  // pred: ^bb1
    return
  }
  func.func @multipleLoops(%arg0: i1, %arg1: i1) {
    cf.br ^bb1
  ^bb1:  // 2 preds: ^bb0, ^bb4
    cf.br ^bb2
  ^bb2:  // 2 preds: ^bb1, ^bb3
    cf.br ^bb3
  ^bb3:  // pred: ^bb2
    cf.cond_br %arg0, ^bb4, ^bb2
  ^bb4:  // pred: ^bb3
    cf.cond_br %arg1, ^bb1, ^bb5
  ^bb5:  // pred: ^bb4
    return
  }
  func.func @_QPblockTest0(%arg0: i1, %arg1: i1) {
    cf.br ^bb1
  ^bb1:  // 2 preds: ^bb0, ^bb4
    cf.cond_br %arg0, ^bb2, ^bb5
  ^bb2:  // pred: ^bb1
    cf.cond_br %arg1, ^bb3, ^bb4
  ^bb3:  // pred: ^bb2
    return
  ^bb4:  // pred: ^bb2
    cf.br ^bb1
  ^bb5:  // pred: ^bb1
    return
  }
  func.func @check_alloc_in_loop(%arg0: i64) {
    cf.br ^bb1(%arg0 : i64)
  ^bb1(%0: i64):  // 2 preds: ^bb0, ^bb2
    %c-1_i64 = arith.constant -1 : i64
    %1 = arith.addi %0, %c-1_i64 : i64
    %c0_i64 = arith.constant 0 : i64
    %2 = arith.cmpi eq, %1, %c0_i64 : i64
    cf.cond_br %2, ^bb3, ^bb2
  ^bb2:  // pred: ^bb1
    scf.execute_region {
      %c1_i64 = arith.constant 1 : i64
      scf.yield
    }
    cf.br ^bb1(%1 : i64)
  ^bb3:  // pred: ^bb1
    return
  }
}

