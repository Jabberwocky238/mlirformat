module attributes {omp.is_target_device = false} {
  llvm.func @test() {
    omp.target kernel_type(generic) {
      omp.terminator
    }
    llvm.return
  }
}

