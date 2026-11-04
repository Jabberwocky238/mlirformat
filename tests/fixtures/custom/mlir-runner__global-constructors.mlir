module {
  llvm.func @printNewline()
  llvm.func @printI64(i64)
  llvm.mlir.global_ctors ctors = [@ctor], priorities = [0 : i32], data = [#llvm.zero]
  llvm.mlir.global_dtors dtors = [@dtor], priorities = [0 : i32], data = [#llvm.zero]
  llvm.func @ctor() {
    %0 = llvm.mlir.constant(1 : i64) : i64
    llvm.call @printI64(%0) : (i64) -> ()
    llvm.call @printNewline() : () -> ()
    llvm.return
  }
  llvm.func @entry() {
    %0 = llvm.mlir.constant(2 : i64) : i64
    llvm.call @printI64(%0) : (i64) -> ()
    llvm.call @printNewline() : () -> ()
    llvm.return
  }
  llvm.func @dtor() {
    %0 = llvm.mlir.constant(3 : i64) : i64
    llvm.call @printI64(%0) : (i64) -> ()
    llvm.call @printNewline() : () -> ()
    llvm.return
  }
}

