module {
  llvm.mlir.global private @x() {addr_space = 0 : i32, dso_local} : !llvm.ptr {
    %0 = llvm.blockaddress <function = @ba, tag = <id = 2>> : !llvm.ptr
    llvm.return %0 : !llvm.ptr
  }
  llvm.func @ba() -> !llvm.ptr {
    %0 = llvm.blockaddress <function = @ba, tag = <id = 1>> : !llvm.ptr
    llvm.br ^bb1
  ^bb1:  // pred: ^bb0
    llvm.blocktag <id = 1>
    llvm.br ^bb2
  ^bb2:  // pred: ^bb1
    llvm.blocktag <id = 2>
    llvm.return %0 : !llvm.ptr
  }
}

// -----
module {
  llvm.mlir.global private @g() {addr_space = 0 : i32, dso_local} : !llvm.ptr {
    %0 = llvm.blockaddress <function = @fn, tag = <id = 0>> : !llvm.ptr
    llvm.return %0 : !llvm.ptr
  }
  llvm.mlir.global private @h() {addr_space = 0 : i32, dso_local} : !llvm.ptr {
    %0 = llvm.blockaddress <function = @fn, tag = <id = 1>> : !llvm.ptr
    llvm.return %0 : !llvm.ptr
  }
  llvm.func @fn(%arg0: i1, %arg1: i32, %arg2: i32) -> i32 {
    llvm.cond_br %arg0, ^bb1, ^bb2
  ^bb1:  // pred: ^bb0
    llvm.blocktag <id = 0>
    llvm.return %arg1 : i32
  ^bb2:  // pred: ^bb0
    llvm.blocktag <id = 1>
    llvm.return %arg2 : i32
  }
}

