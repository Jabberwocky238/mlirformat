module attributes {dlti.dl_spec = #dlti.dl_spec<"dlti.alloca_memory_space" = 5 : ui32>, llvm.target_triple = "amdgcn-amd-amdhsa", omp.is_target_device = true} {
  llvm.func @_QQmain() attributes {fir.bindc_name = "main"} {
    %0 = llvm.mlir.addressof @global_a : !llvm.ptr
    %1 = omp.map.info var_ptr(%0 : !llvm.ptr, i32) map_clauses(tofrom) capture(ByCopy) -> !llvm.ptr {name = "i"}
    omp.target kernel_type(generic) map_entries(%1 -> %arg0 : !llvm.ptr) {
      %2 = llvm.load %arg0 : !llvm.ptr -> i32
      %3 = omp.groupprivate @global_any device_type (any) : !llvm.ptr
      llvm.store %2, %3 : i32, !llvm.ptr
      %4 = omp.groupprivate @global_host device_type (host) : !llvm.ptr
      llvm.store %2, %4 : i32, !llvm.ptr
      %5 = omp.groupprivate @global_nohost device_type (nohost) : !llvm.ptr
      llvm.store %2, %5 : i32, !llvm.ptr
      omp.terminator
    }
    llvm.return
  }
  llvm.mlir.global internal @global_a() {addr_space = 0 : i32} : i32
  llvm.mlir.global internal @global_any() {addr_space = 0 : i32} : i32
  llvm.mlir.global internal @global_host() {addr_space = 0 : i32} : i32
  llvm.mlir.global internal @global_nohost() {addr_space = 0 : i32} : i32
}

