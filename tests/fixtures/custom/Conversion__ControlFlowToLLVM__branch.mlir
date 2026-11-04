module {
  func.func @cf_br(%arg0: index) -> index {
    cf.br ^bb1(%arg0 : index)
  ^bb1(%0: index):  // pred: ^bb0
    return %0 : index
  }
}

// -----
module {
  func.func @cf_br_type_match(%arg0: i64) -> i64 {
    cf.br ^bb1(%arg0 : i64)
  ^bb1(%0: i64):  // pred: ^bb0
    return %0 : i64
  }
}

// -----
module {
  func.func @cf_cond_br(%arg0: i1, %arg1: index, %arg2: index) -> index {
    cf.cond_br %arg0, ^bb1(%arg1 : index), ^bb2(%arg2 : index)
  ^bb1(%0: index):  // pred: ^bb0
    return %0 : index
  ^bb2(%1: index):  // pred: ^bb0
    return %1 : index
  }
}

// -----
module {
  func.func @unreachable_block() {
    return
  ^bb1(%0: index):  // pred: ^bb1
    cf.br ^bb1(%0 : index)
  }
}

// -----
module {
  func.func @cf_cond_br_with_weights(%arg0: i1, %arg1: index, %arg2: index) -> index {
    cf.cond_br %arg0 weights([90, 10]), ^bb1(%arg1 : index), ^bb2(%arg2 : index)
  ^bb1(%0: index):  // pred: ^bb0
    return %0 : index
  ^bb2(%1: index):  // pred: ^bb0
    return %1 : index
  }
}

