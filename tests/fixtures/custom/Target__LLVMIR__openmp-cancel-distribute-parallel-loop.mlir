module {
  llvm.func @cancel_distribute_parallel_do(%arg0: i32, %arg1: i32, %arg2: i32) {
    omp.teams {
      omp.parallel {
        omp.distribute {
          omp.wsloop {
            omp.loop_nest (%arg3) : i32 = (%arg0) to (%arg1) step (%arg2) {
              omp.cancel cancellation_construct_type(loop)
              omp.yield
            }
          } {omp.composite}
        } {omp.composite}
        omp.terminator
      } {omp.composite}
      omp.terminator
    }
    llvm.return
  }
}

