module attributes {omp.is_target_device = false} {
  llvm.func @omp_target_nowait_() {
    %0 = llvm.mlir.constant(1 : i64) : i64
    %1 = llvm.alloca %0 x f32 {bindc_name = "x"} : (i64) -> !llvm.ptr
    %2 = omp.map.info var_ptr(%1 : !llvm.ptr, f32) map_clauses(tofrom) capture(ByRef) -> !llvm.ptr {name = "x"}
    omp.target nowait map_entries(%2 -> %arg0 : !llvm.ptr) {
      %3 = llvm.mlir.constant(5.000000e+00 : f32) : f32
      llvm.store %3, %arg0 : f32, !llvm.ptr
      omp.terminator
    }
    llvm.return
  }
}

