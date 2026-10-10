module {
  llvm.func @threadidx() -> i32 {
    %0 = nvvm.read.ptx.sreg.tid.x : i32
    llvm.return %0 : i32
  }
  llvm.func @caller() -> i32 {
    %0 = llvm.call @threadidx() : () -> i32
    llvm.return %0 : i32
  }
}

