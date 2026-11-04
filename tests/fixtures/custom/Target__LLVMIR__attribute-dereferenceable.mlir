module {
  llvm.func @deref(%arg0: i64, %arg1: !llvm.ptr) {
    %0 = llvm.inttoptr %arg0 dereferenceable<bytes = 4> : i64 to !llvm.ptr
    %1 = llvm.load %0 {alignment = 4 : i64} : !llvm.ptr -> i32
    %2 = llvm.load %arg1 dereferenceable<bytes = 8> {alignment = 8 : i64} : !llvm.ptr -> !llvm.ptr
    llvm.store %1, %2 {alignment = 4 : i64} : i32, !llvm.ptr
    llvm.return
  }
  llvm.func @deref_or_null(%arg0: i64, %arg1: !llvm.ptr) {
    %0 = llvm.inttoptr %arg0 dereferenceable<bytes = 4, mayBeNull = true> : i64 to !llvm.ptr
    %1 = llvm.load %0 {alignment = 4 : i64} : !llvm.ptr -> i32
    %2 = llvm.load %arg1 dereferenceable<bytes = 8, mayBeNull = true> {alignment = 8 : i64} : !llvm.ptr -> !llvm.ptr
    llvm.store %1, %2 {alignment = 4 : i64} : i32, !llvm.ptr
    llvm.return
  }
}

