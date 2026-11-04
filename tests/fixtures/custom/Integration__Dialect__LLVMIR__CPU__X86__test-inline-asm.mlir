module {
  llvm.func @printI64(i64)
  llvm.func @entry() {
    %0 = llvm.mlir.constant(-42 : i64) : i64
    %1 = llvm.inline_asm "xor $0, $0", "=r,r" %0 : (i64) -> i64
    llvm.call @printI64(%1) : (i64) -> ()
    llvm.return
  }
}

