module {
  llvm.mlir.global private @g() {addr_space = 0 : i32, dso_local} : !llvm.ptr {
    %0 = llvm.blockaddress <function = @fn, tag = <id = 0>> : !llvm.ptr
    llvm.return %0 : !llvm.ptr
  }
  llvm.func @fn() {
    llvm.br ^bb1
  ^bb1:  // pred: ^bb0
    llvm.blocktag <id = 0>
    llvm.return
  }
}

// -----
module {
  llvm.func @blockaddr0() -> !llvm.ptr {
    %0 = llvm.blockaddress <function = @blockaddr0, tag = <id = 1>> : !llvm.ptr
    llvm.br ^bb1
  ^bb1:  // pred: ^bb0
    llvm.blocktag <id = 1>
    llvm.return %0 : !llvm.ptr
  }
}

// -----
module {
  llvm.mlir.global private @h() {addr_space = 0 : i32, dso_local} : !llvm.ptr {
    %0 = llvm.blockaddress <function = @h3, tag = <id = 0>> : !llvm.ptr
    llvm.return %0 : !llvm.ptr
  }
  llvm.func @h3() {
    llvm.br ^bb1
  ^bb1:  // pred: ^bb0
    llvm.blocktag <id = 0>
    llvm.return
  }
  llvm.func @h0() {
    llvm.return
  }
}

