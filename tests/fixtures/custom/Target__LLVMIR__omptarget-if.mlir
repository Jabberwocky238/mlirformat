module attributes {omp.is_target_device = false, omp.target_triples = ["amdgcn-amd-amdhsa"]} {
  llvm.func @target_if_variable(%arg0: i1) {
    omp.target if(%arg0) {
      omp.terminator
    }
    llvm.return
  }
  llvm.func @target_if_true() {
    %0 = llvm.mlir.constant(true) : i1
    omp.target if(%0) {
      omp.terminator
    }
    llvm.return
  }
  llvm.func @target_if_false() {
    %0 = llvm.mlir.constant(false) : i1
    omp.target if(%0) {
      omp.terminator
    }
    llvm.return
  }
}

