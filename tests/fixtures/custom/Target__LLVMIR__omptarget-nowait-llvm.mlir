module attributes {omp.target_triples = ["dummy-target-triple"]} {
  llvm.func @_QPfoo() {
    %0 = llvm.mlir.constant(1 : i64) : i64
    %1 = llvm.alloca %0 x i32 : (i64) -> !llvm.ptr
    %2 = omp.map.info var_ptr(%1 : !llvm.ptr, i32) map_clauses(implicit) capture(ByCopy) -> !llvm.ptr
    omp.target nowait map_entries(%2 -> %arg0 : !llvm.ptr) {
      %3 = llvm.mlir.constant(2 : i32) : i32
      llvm.store %3, %arg0 : i32, !llvm.ptr
      omp.terminator
    }
    llvm.return
  }
}

