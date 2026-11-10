module attributes {omp.is_target_device = false} {
  llvm.func @_QQmain() {
    %0 = llvm.mlir.constant(1 : i32) : i32
    %1 = llvm.alloca %0 x i32 : (i32) -> !llvm.ptr
    %2 = omp.map.info var_ptr(%1 : !llvm.ptr, i32) map_clauses(tofrom) capture(ByRef) -> !llvm.ptr {name = ""}
    omp.target kernel_type(generic) map_entries(%2 -> %arg0 : !llvm.ptr) {
      %3 = llvm.mlir.constant(1 : i32) : i32
      llvm.store %3, %arg0 : i32, !llvm.ptr
      omp.terminator
    }
    llvm.return
  }
}

