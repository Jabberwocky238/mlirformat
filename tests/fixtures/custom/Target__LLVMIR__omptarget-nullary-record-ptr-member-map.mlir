module attributes {omp.is_target_device = false, omp.target_triples = ["amdgcn-amd-amdhsa"]} {
  llvm.func @test_select_gen(%arg0: !llvm.ptr, %arg1: !llvm.ptr) {
    %0 = omp.map.info var_ptr(%arg0 : !llvm.ptr, !llvm.struct<(ptr, i64, i32, i8, i8, i8, i8)>) map_clauses(tofrom) capture(ByRef) var_ptr_ptr(%arg1 : !llvm.ptr, i32) -> !llvm.ptr
    %1 = omp.map.info var_ptr(%arg0 : !llvm.ptr, !llvm.struct<(ptr, i64, i32, i8, i8, i8, i8)>) map_clauses(to) capture(ByRef) members(%0 : [0] : !llvm.ptr) -> !llvm.ptr
    omp.target kernel_type(generic) map_entries(%0 -> %arg2, %1 -> %arg3 : !llvm.ptr, !llvm.ptr) {
      omp.terminator
    }
    llvm.return
  }
}

