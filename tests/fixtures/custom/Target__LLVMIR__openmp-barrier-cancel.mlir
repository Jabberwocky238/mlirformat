module {
  llvm.func @test() {
    omp.parallel {
      omp.cancel cancellation_construct_type(parallel)
      omp.barrier
      omp.terminator
    }
    llvm.return
  }
}

