module {
  func.func @return() {
    llvm.return
  }
  func.func @control_flow(%arg0: i1) {
    llvm.br ^bb1
  ^bb1:  // 2 preds: ^bb0, ^bb1
    llvm.cond_br %arg0, ^bb2, ^bb1
  ^bb2:  // pred: ^bb1
    llvm.return
  }
}

