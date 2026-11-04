module {
  func.func @single_case(%arg0: i32, %arg1: index) -> index {
    cf.switch %arg0 : i32, [
      default: ^bb1(%arg1 : index)]
  ^bb1(%0: index):  // pred: ^bb0
    return %0 : index
  }
}

// -----
module {
  func.func @single_case_type_match(%arg0: i32, %arg1: i64) -> i64 {
    cf.switch %arg0 : i32, [
      default: ^bb1(%arg1 : i64)]
  ^bb1(%0: i64):  // pred: ^bb0
    return %0 : i64
  }
}

// -----
module {
  func.func @multi_case(%arg0: i32, %arg1: index, %arg2: index, %arg3: i64) -> index {
    cf.switch %arg0 : i32, [
      default: ^bb1(%arg1 : index),
      12: ^bb2(%arg2 : index),
      13: ^bb1(%arg1 : index),
      14: ^bb3(%arg3 : i64)
    ]
  ^bb1(%0: index):  // 2 preds: ^bb0, ^bb0
    return %0 : index
  ^bb2(%1: index):  // pred: ^bb0
    return %1 : index
  ^bb3(%2: i64):  // pred: ^bb0
    %3 = arith.index_cast %2 : i64 to index
    return %3 : index
  }
}

