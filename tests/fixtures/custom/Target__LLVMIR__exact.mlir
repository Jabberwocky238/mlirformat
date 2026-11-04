module {
  llvm.func @exactflag_func(%arg0: i64, %arg1: i64) {
    %0 = llvm.udiv exact %arg0, %arg1 : i64
    %1 = llvm.sdiv exact %arg0, %arg1 : i64
    %2 = llvm.lshr exact %arg0, %arg1 : i64
    %3 = llvm.ashr exact %arg0, %arg1 : i64
    llvm.return
  }
}

