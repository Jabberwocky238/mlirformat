module {
  llvm.func @unroll_partial_nested_loop(%arg0: !llvm.ptr, %arg1: i32, %arg2: i32) {
    %canonloop = omp.new_cli
    %canonloop_d1 = omp.new_cli
    omp.canonical_loop(%canonloop) %iv : i32 in range(%arg1) {
      omp.canonical_loop(%canonloop_d1) %iv_d1 : i32 in range(%arg2) {
        %0 = llvm.mlir.constant(4.200000e+01 : f32) : f32
        llvm.store %0, %arg0 : f32, !llvm.ptr
        omp.terminator
      }
      omp.terminator
    }
    omp.unroll_partial(%canonloop) {unroll_factor = 2 : i64}
    omp.unroll_partial(%canonloop_d1) {unroll_factor = 4 : i64}
    llvm.return
  }
}

