module attributes {dlti.dl_spec = #dlti.dl_spec<"dlti.alloca_memory_space" = 5 : ui32>, llvm.target_triple = "amdgcn-amd-amdhsa", omp.is_target_device = true} {
  llvm.mlir.global external @_QMtest_0Esp() {addr_space = 0 : i32, omp.declare_target = #omp.declaretarget<device_type = (any), capture_clause = (link)>} : i32 {
    %0 = llvm.mlir.constant(1 : i32) : i32
    llvm.return %0 : i32
  }
  llvm.func @_QQmain() {
    %0 = llvm.mlir.constant(1 : i64) : i64
    %1 = llvm.alloca %0 x i32 : (i64) -> !llvm.ptr<5>
    %2 = llvm.addrspacecast %1 : !llvm.ptr<5> to !llvm.ptr
    %3 = llvm.mlir.addressof @_QMtest_0Esp : !llvm.ptr
    %4 = omp.map.info var_ptr(%2 : !llvm.ptr, i32) map_clauses(tofrom) capture(ByRef) -> !llvm.ptr
    %5 = omp.map.info var_ptr(%3 : !llvm.ptr, i32) map_clauses(tofrom) capture(ByRef) -> !llvm.ptr
    omp.target map_entries(%4 -> %arg0, %5 -> %arg1 : !llvm.ptr, !llvm.ptr) {
      %6 = llvm.load %arg1 : !llvm.ptr -> i32
      llvm.store %6, %arg0 : i32, !llvm.ptr
      omp.terminator
    }
    llvm.return
  }
}

