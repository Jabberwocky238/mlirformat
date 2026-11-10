module {
  llvm.func @fuse_trivial_loops(%arg0: !llvm.ptr, %arg1: i32, %arg2: i32) {
    %canonloop_s0 = omp.new_cli
    omp.canonical_loop(%canonloop_s0) %iv_s0 : i32 in range(%arg1) {
      %0 = llvm.getelementptr inbounds %arg0[%iv_s0] : (!llvm.ptr, i32) -> !llvm.ptr, f32
      %1 = llvm.mlir.constant(4.200000e+01 : f32) : f32
      llvm.store %1, %0 : f32, !llvm.ptr
      omp.terminator
    }
    %canonloop_s1 = omp.new_cli
    omp.canonical_loop(%canonloop_s1) %iv_s1 : i32 in range(%arg2) {
      %0 = llvm.getelementptr inbounds %arg0[%iv_s1] : (!llvm.ptr, i32) -> !llvm.ptr, f32
      %1 = llvm.mlir.constant(2.100000e+01 : f32) : f32
      llvm.store %1, %0 : f32, !llvm.ptr
      omp.terminator
    }
    omp.fuse  <- (%canonloop_s0, %canonloop_s1)
    llvm.return
  }
}

