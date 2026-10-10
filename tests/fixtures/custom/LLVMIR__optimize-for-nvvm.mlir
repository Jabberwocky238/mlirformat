module {
  llvm.func @fdiv_fp16(%arg0: f16, %arg1: f16) -> f16 {
    %0 = llvm.fdiv %arg0, %arg1 : f16
    llvm.return %0 : f16
  }
}

