module attributes {omp.is_target_device = false, omp.target_triples = ["amdgcn-amd-amdhsa"]} {
  llvm.func @target_dyn_groupprivate_i64(%arg0: i64) {
    omp.target kernel_type(generic) dyn_groupprivate(%arg0 : i64) {
      omp.terminator
    }
    llvm.return
  }
  llvm.func @target_dyn_groupprivate_i16(%arg0: i16) {
    omp.target kernel_type(generic) dyn_groupprivate(%arg0 : i16) {
      omp.terminator
    }
    llvm.return
  }
  llvm.func @target_dyn_groupprivate_i32(%arg0: i32) {
    omp.target kernel_type(generic) dyn_groupprivate(%arg0 : i32) {
      omp.terminator
    }
    llvm.return
  }
}

