module attributes {dlti.dl_spec = #dlti.dl_spec<"dlti.alloca_memory_space" = 5 : ui32>, llvm.target_triple = "amdgcn-amd-amdhsa", omp.is_gpu = true, omp.is_target_device = true} {
  llvm.func @main(%arg0: !llvm.ptr) {
    %0 = omp.map.info var_ptr(%arg0 : !llvm.ptr, i64) map_clauses(to) capture(ByCopy) -> !llvm.ptr {name = "nthreads"}
    omp.target kernel_type(generic) map_entries(%0 -> %arg1 : !llvm.ptr) {
      %1 = llvm.load %arg1 : !llvm.ptr -> i64
      omp.parallel num_threads(%1 : i64) {
        omp.terminator
      }
      omp.terminator
    }
    llvm.return
  }
}

