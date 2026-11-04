module {
  llvm.func @test_block_structure() {
    %0 = llvm.mlir.constant(1 : index) : i1
    %1 = llvm.mlir.constant(1 : index) : i64
    llvm.br ^bb1(%1, %1 : i64, i64)
  ^bb1(%2: i64, %3: i64):  // 3 preds: ^bb0, ^bb4, ^bb5
    llvm.cond_br %0, ^bb2, ^bb6
  ^bb2:  // pred: ^bb1
    llvm.br ^bb3(%1, %1 : i64, i64)
  ^bb3(%4: i64, %5: i64):  // pred: ^bb2
    llvm.cond_br %0, ^bb4, ^bb5
  ^bb4:  // pred: ^bb3
    omp.wsloop {
      omp.loop_nest (%arg0) : i64 = (%1) to (%1) inclusive step (%1) {
        omp.yield
      }
    }
    llvm.br ^bb1(%1, %1 : i64, i64)
  ^bb5:  // pred: ^bb3
    llvm.br ^bb1(%1, %1 : i64, i64)
  ^bb6:  // pred: ^bb1
    llvm.return
  }
}

