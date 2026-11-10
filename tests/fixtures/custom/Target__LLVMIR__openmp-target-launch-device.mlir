module attributes {dlti.dl_spec = #dlti.dl_spec<"dlti.alloca_memory_space" = 5 : ui32>, llvm.target_triple = "amdgcn-amd-amdhsa", omp.is_gpu = true, omp.is_target_device = true} {
  llvm.func @main(%arg0: !llvm.ptr) {
    %0 = llvm.mlir.constant(20 : i64) : i32
    %1 = omp.map.info var_ptr(%arg0 : !llvm.ptr, i32) map_clauses(to) capture(ByCopy) -> !llvm.ptr
    omp.target kernel_type(generic) thread_limit(%0 : i32) map_entries(%1 -> %arg1 : !llvm.ptr) {
      %3 = llvm.mlir.constant(10 : i64) : i32
      %4 = llvm.load %arg1 : !llvm.ptr -> i32
      omp.teams num_teams( to %4 : i32) thread_limit(%3 : i32) {
        omp.terminator
      }
      omp.terminator
    } {omp.combined}
    %2 = llvm.mlir.constant(30 : i64) : i32
    omp.target kernel_type(generic) thread_limit(%2 : i32) {
      %3 = llvm.mlir.constant(40 : i64) : i32
      omp.teams num_teams( to %3 : i32) {
        omp.terminator
      }
      omp.terminator
    } {omp.combined}
    llvm.return
  }
}

