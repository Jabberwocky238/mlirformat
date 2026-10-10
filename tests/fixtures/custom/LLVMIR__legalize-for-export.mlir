module {
  llvm.func @repeated_successor_different_args(%arg0: i1, %arg1: i32, %arg2: i32) {
    llvm.cond_br %arg0, ^bb1(%arg1 : i32), ^bb1(%arg2 : i32)
  ^bb1(%0: i32):  // 2 preds: ^bb0, ^bb0
    llvm.return
  }
  llvm.func @repeated_successor_no_args(%arg0: i1) {
    llvm.cond_br %arg0, ^bb1, ^bb1
  ^bb1:  // 2 preds: ^bb0, ^bb0
    llvm.return
  }
  llvm.func @repeated_successor_openmp(%arg0: i64, %arg1: i64, %arg2: i64, %arg3: i1) {
    omp.wsloop {
      omp.loop_nest (%arg4) : i64 = (%arg0) to (%arg1) step (%arg2) {
        llvm.cond_br %arg3, ^bb1(%arg0 : i64), ^bb1(%arg1 : i64)
      ^bb1(%0: i64):  // 2 preds: ^bb0, ^bb0
        omp.yield
      }
    }
    llvm.return
  }
}

// -----
module {
  func.func @func1(%arg0: i1, %arg1: i1) {
    cf.cond_br %arg0, ^bb1(%arg0 : i1), ^bb1(%arg1 : i1)
  ^bb1(%0: i1):  // 2 preds: ^bb0, ^bb0
    return
  }
}

