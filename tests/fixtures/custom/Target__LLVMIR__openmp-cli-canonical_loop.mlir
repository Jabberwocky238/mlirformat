module {
  llvm.func @anon_loop(%arg0: !llvm.ptr, %arg1: i32) {
    omp.canonical_loop %iv : i32 in range(%arg1) {
      %0 = llvm.mlir.constant(4.200000e+01 : f32) : f32
      llvm.store %0, %arg0 : f32, !llvm.ptr
      omp.terminator
    }
    llvm.return
  }
  llvm.func @trivial_loop(%arg0: !llvm.ptr, %arg1: i32) {
    %canonloop = omp.new_cli
    omp.canonical_loop(%canonloop) %iv : i32 in range(%arg1) {
      %0 = llvm.mlir.constant(4.200000e+01 : f32) : f32
      llvm.store %0, %arg0 : f32, !llvm.ptr
      omp.terminator
    }
    llvm.return
  }
  llvm.func @nested_loop(%arg0: !llvm.ptr, %arg1: i32, %arg2: i32) {
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
    llvm.return
  }
}

