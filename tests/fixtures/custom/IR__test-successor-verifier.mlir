module {
  func.func @fallthrough_ok() {
    test.fallthrough_br ^bb1 forward[]
  ^bb1:  // pred: ^bb0
    return
  }
}

// -----
module {
  func.func @forward_successors_ok() {
    test.fallthrough_br ^bb1 forward[^bb2, ^bb3]
  ^bb1:  // pred: ^bb0
    return
  ^bb2:  // pred: ^bb0
    return
  ^bb3:  // pred: ^bb0
    return
  }
}

// -----
// -----
