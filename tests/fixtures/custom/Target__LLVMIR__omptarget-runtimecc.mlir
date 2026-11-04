module attributes {llvm.target_triple = "spirv64-intel", omp.is_gpu = true, omp.is_target_device = true, omp.target_triples = ["spirv64-intel"]} {
  llvm.func @target_if_variable(%arg0: i1) {
    omp.target if(%arg0) {
      omp.terminator
    }
    llvm.return
  }
}

