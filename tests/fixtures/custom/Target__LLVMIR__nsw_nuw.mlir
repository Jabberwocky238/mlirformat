module {
  llvm.func @intflags_func(%arg0: i64, %arg1: i64) {
    %0 = llvm.add %arg0, %arg1 overflow<nsw> : i64
    %1 = llvm.sub %arg0, %arg1 overflow<nuw> : i64
    %2 = llvm.mul %arg0, %arg1 overflow<nsw, nuw> : i64
    %3 = llvm.shl %arg0, %arg1 overflow<nsw, nuw> : i64
    %4 = llvm.trunc %arg1 overflow<nuw> : i64 to i32
    llvm.return
  }
}

