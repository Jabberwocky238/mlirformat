module attributes {llvm.target_triple = "amdgcn-amd-amdhsa", omp.is_target_device = true} {
  llvm.mlir.global external @_QMtest_0Esp() {addr_space = 0 : i32, omp.declare_target = #omp.declaretarget<device_type = (any), capture_clause = (link)>} : i32 {
    %0 = llvm.mlir.constant(0 : i32) : i32
    llvm.return %0 : i32
  }
  llvm.func @_QQmain() {
    %0 = llvm.mlir.addressof @_QMtest_0Esp : !llvm.ptr
    %1 = omp.map.info var_ptr(%0 : !llvm.ptr, i32) map_clauses(tofrom) capture(ByRef) -> !llvm.ptr {name = ""}
    omp.target map_entries(%1 -> %arg0 : !llvm.ptr) {
      %2 = llvm.mlir.constant(1 : i32) : i32
      llvm.store %2, %arg0 : i32, !llvm.ptr
      omp.terminator
    }
    llvm.return
  }
}

