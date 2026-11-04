module {
  llvm.func @parallel_infinite_loop() {
    omp.parallel {
      llvm.br ^bb1
    ^bb1:  // 2 preds: ^bb0, ^bb1
      llvm.br ^bb1
    }
    llvm.return
  }
}

