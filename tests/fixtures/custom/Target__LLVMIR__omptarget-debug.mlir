module attributes {dlti.dl_spec = #dlti.dl_spec<"dlti.alloca_memory_space" = 5 : ui32>, llvm.target_triple = "amdgcn-amd-amdhsa", omp.is_target_device = true} {
  llvm.func @_QQmain() {
    %0 = llvm.mlir.constant(1 : i32) : i32
    %1 = llvm.alloca %0 x i32 : (i32) -> !llvm.ptr<5>
    %2 = llvm.addrspacecast %1 : !llvm.ptr<5> to !llvm.ptr
    %3 = omp.map.info var_ptr(%2 : !llvm.ptr, i32) map_clauses(tofrom) capture(ByRef) -> !llvm.ptr {name = ""}
    omp.target map_entries(%3 -> %arg0 : !llvm.ptr) {
      %4 = llvm.mlir.constant(1 : i32) : i32
      llvm.store %4, %arg0 : i32, !llvm.ptr
      omp.terminator
    }
    llvm.return
  }
}

