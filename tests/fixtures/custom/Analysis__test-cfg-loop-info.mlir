module {
  func.func @no_loop_single_block() {
    return
  }
}

// -----
module {
  func.func @no_loop() {
    cf.br ^bb1
  ^bb1:  // pred: ^bb0
    return
  }
}

// -----
module {
  func.func @simple_loop(%arg0: i1) {
    cf.br ^bb1
  ^bb1:  // 2 preds: ^bb0, ^bb2
    cf.cond_br %arg0, ^bb2, ^bb3
  ^bb2:  // pred: ^bb1
    cf.br ^bb1
  ^bb3:  // pred: ^bb1
    return
  }
}

// -----
module {
  func.func @single_block_loop(%arg0: i1) {
    cf.br ^bb1
  ^bb1:  // 2 preds: ^bb0, ^bb1
    cf.cond_br %arg0, ^bb1, ^bb2
  ^bb2:  // pred: ^bb1
    return
  }
}

// -----
module {
  func.func @nested_loop(%arg0: i1) {
    cf.br ^bb1
  ^bb1:  // 2 preds: ^bb0, ^bb2
    cf.cond_br %arg0, ^bb2, ^bb4
  ^bb2:  // 2 preds: ^bb1, ^bb3
    cf.cond_br %arg0, ^bb1, ^bb3
  ^bb3:  // pred: ^bb2
    cf.br ^bb2
  ^bb4:  // pred: ^bb1
    return
  }
}

// -----
module {
  func.func @multi_latch(%arg0: i1) {
    cf.br ^bb1
  ^bb1:  // 3 preds: ^bb0, ^bb2, ^bb3
    cf.cond_br %arg0, ^bb4, ^bb2
  ^bb2:  // pred: ^bb1
    cf.cond_br %arg0, ^bb1, ^bb3
  ^bb3:  // pred: ^bb2
    cf.br ^bb1
  ^bb4:  // pred: ^bb1
    return
  }
}

// -----
module {
  func.func @multiple_loops(%arg0: i1) {
    cf.br ^bb1
  ^bb1:  // 2 preds: ^bb0, ^bb2
    cf.br ^bb2
  ^bb2:  // pred: ^bb1
    cf.cond_br %arg0, ^bb3, ^bb1
  ^bb3:  // 2 preds: ^bb2, ^bb4
    cf.cond_br %arg0, ^bb5, ^bb4
  ^bb4:  // pred: ^bb3
    cf.br ^bb3
  ^bb5:  // pred: ^bb3
    return
  }
}

