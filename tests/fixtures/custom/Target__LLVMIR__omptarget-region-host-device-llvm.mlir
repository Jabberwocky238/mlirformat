module attributes {llvm.target_triple = "x86_64-unknown-linux-gnu", omp.is_target_device = true} {
  llvm.func @omp_target_region_host_device() {
    omp.target kernel_type(generic) {
      omp.terminator
    }
    llvm.return
  }
}

