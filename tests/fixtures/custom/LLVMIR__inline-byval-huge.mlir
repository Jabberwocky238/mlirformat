module {
  llvm.func @byval_2_000_000_000(%arg0: !llvm.ptr) {
    llvm.call @with_byval_arg(%arg0) : (!llvm.ptr) -> ()
    llvm.return
  }
  llvm.func @with_byval_arg(%arg0: !llvm.ptr {llvm.byval = !llvm.array<1000 x array<1000 x array<500 x i32>>>}) {
    llvm.return
  }
}

// -----
module {
  llvm.func @byval_8_000_000_000(%arg0: !llvm.ptr) {
    llvm.call @with_byval_arg(%arg0) : (!llvm.ptr) -> ()
    llvm.return
  }
  llvm.func @with_byval_arg(%arg0: !llvm.ptr {llvm.byval = !llvm.array<2000 x array<2000 x array<500 x i32>>>}) {
    llvm.return
  }
}

