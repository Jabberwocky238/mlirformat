module attributes {omp.is_target_device = false} {
  llvm.func @test() {
    omp.target {
      omp.terminator
    }
    llvm.return
  }
}

