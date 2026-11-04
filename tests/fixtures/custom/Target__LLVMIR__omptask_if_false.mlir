module {
  llvm.func @foo_(%arg0: !llvm.ptr {fir.bindc_name = "n"}, %arg1: !llvm.ptr {fir.bindc_name = "r"}) attributes {fir.internal_name = "_QPfoo"} {
    %0 = llvm.mlir.constant(false) : i1
    omp.task depend(taskdependin -> %arg0 : !llvm.ptr) if(%0) {
      %1 = llvm.load %arg0 : !llvm.ptr -> i32
      llvm.store %1, %arg1 : i32, !llvm.ptr
      omp.terminator
    }
    llvm.return
  }
}

