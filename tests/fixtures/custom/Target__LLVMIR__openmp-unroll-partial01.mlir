module {
  llvm.func @unroll_partial_trivial_loop(%arg0: !llvm.ptr, %arg1: i32) {
    %canonloop = omp.new_cli
    omp.canonical_loop(%canonloop) %iv : i32 in range(%arg1) {
      %0 = llvm.mlir.constant(4.200000e+01 : f32) : f32
      llvm.store %0, %arg0 : f32, !llvm.ptr
      omp.terminator
    }
    omp.unroll_partial(%canonloop) {unroll_factor = 4 : i64}
    llvm.return
  }
}

