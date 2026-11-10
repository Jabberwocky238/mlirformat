module attributes {llvm.target_triple = "amdgcn-amd-amdhsa", omp.is_target_device = true, omp.requires = #omp<clause_requires unified_shared_memory>} {
  llvm.mlir.global external @_QMtest_0Evar_to_usm() {addr_space = 0 : i32, omp.declare_target = #omp.declaretarget<device_type = (any), capture_clause = (to)>} : i32 {
    %0 = llvm.mlir.constant(1 : i32) : i32
    llvm.return %0 : i32
  }
  llvm.mlir.global external @_QMtest_0Evar_enter_usm() {addr_space = 0 : i32, omp.declare_target = #omp.declaretarget<device_type = (any), capture_clause = (enter)>} : i32 {
    %0 = llvm.mlir.constant(2 : i32) : i32
    llvm.return %0 : i32
  }
  llvm.mlir.global external @_QMtest_0Evar_link_usm() {addr_space = 0 : i32, omp.declare_target = #omp.declaretarget<device_type = (any), capture_clause = (link)>} : i32 {
    %0 = llvm.mlir.constant(3 : i32) : i32
    llvm.return %0 : i32
  }
  llvm.func @test_usm_declare_target() {
    %0 = llvm.mlir.addressof @_QMtest_0Evar_to_usm : !llvm.ptr
    %1 = llvm.mlir.addressof @_QMtest_0Evar_enter_usm : !llvm.ptr
    %2 = llvm.mlir.addressof @_QMtest_0Evar_link_usm : !llvm.ptr
    %3 = omp.map.info var_ptr(%0 : !llvm.ptr, i32) map_clauses(tofrom) capture(ByRef) -> !llvm.ptr {name = ""}
    %4 = omp.map.info var_ptr(%1 : !llvm.ptr, i32) map_clauses(tofrom) capture(ByRef) -> !llvm.ptr {name = ""}
    %5 = omp.map.info var_ptr(%2 : !llvm.ptr, i32) map_clauses(tofrom) capture(ByRef) -> !llvm.ptr {name = ""}
    omp.target kernel_type(generic) map_entries(%3 -> %arg0, %4 -> %arg1, %5 -> %arg2 : !llvm.ptr, !llvm.ptr, !llvm.ptr) {
      %6 = llvm.mlir.constant(10 : i32) : i32
      %7 = llvm.mlir.constant(20 : i32) : i32
      %8 = llvm.mlir.constant(30 : i32) : i32
      llvm.store %6, %arg0 : i32, !llvm.ptr
      llvm.store %7, %arg1 : i32, !llvm.ptr
      llvm.store %8, %arg2 : i32, !llvm.ptr
      omp.terminator
    }
    llvm.return
  }
}

