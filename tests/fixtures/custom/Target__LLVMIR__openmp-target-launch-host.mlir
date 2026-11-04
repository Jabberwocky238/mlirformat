module attributes {omp.is_target_device = false, omp.target_triples = ["amdgcn-amd-amdhsa"]} {
  llvm.func @main(%arg0: i32) {
    %0 = llvm.mlir.constant(20 : i64) : i32
    %1 = llvm.mlir.constant(10 : i64) : i32
    omp.target thread_limit(%0 : i32) host_eval(%arg0 -> %arg1, %1 -> %arg2 : i32, i32) {
      omp.teams num_teams( to %arg1 : i32) thread_limit(%arg2 : i32) {
        omp.terminator
      }
      omp.terminator
    }
    llvm.return
  }
}

