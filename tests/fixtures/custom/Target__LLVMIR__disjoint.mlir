module {
  llvm.func @disjointflag_func(%arg0: i64, %arg1: i64) {
    %0 = llvm.or disjoint %arg0, %arg1 : i64
    llvm.return
  }
}

