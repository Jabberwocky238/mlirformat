module attributes {dlti.dl_spec = #dlti.dl_spec<"dlti.alloca_memory_space" = 5 : ui32>, llvm.target_triple = "amdgcn-amd-amdhsa", omp.is_target_device = true} {
  llvm.func @_QQmain() attributes {fir.bindc_name = "main"} {
    %0 = llvm.mlir.constant(1 : i64) : i64
    %1 = llvm.alloca %0 x !llvm.ptr : (i64) -> !llvm.ptr<5>
    %2 = llvm.addrspacecast %1 : !llvm.ptr<5> to !llvm.ptr
    %3 = omp.map.info var_ptr(%2 : !llvm.ptr, !llvm.ptr) map_clauses(tofrom) capture(ByRef) -> !llvm.ptr {name = ""}
    omp.target_data use_device_ptr(%3 -> %arg0 : !llvm.ptr) {
      %4 = omp.map.info var_ptr(%arg0 : !llvm.ptr, !llvm.ptr) map_clauses(tofrom) capture(ByRef) -> !llvm.ptr {name = ""}
      omp.target map_entries(%4 -> %arg1 : !llvm.ptr) {
        %5 = llvm.mlir.constant(999 : i32) : i32
        %6 = llvm.load %arg1 : !llvm.ptr -> !llvm.ptr
        llvm.store %5, %6 : i32, !llvm.ptr
        omp.terminator
      }
      omp.terminator
    }
    llvm.return
  }
}

