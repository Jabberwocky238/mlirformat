module attributes {omp.is_target_device = false} {
  llvm.func @omp_target_region() attributes {target_cpu = "x86-64", target_features = #llvm.target_features<["+mmx", "+sse"]>} {
    omp.target {
      omp.terminator
    }
    llvm.return
  }
}

