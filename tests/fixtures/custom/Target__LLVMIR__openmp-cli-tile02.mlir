module {
  llvm.func @tile_2d_loop(%arg0: !llvm.ptr, %arg1: i32, %arg2: i32, %arg3: i32, %arg4: i32) {
    %canonloop = omp.new_cli
    %canonloop_d1 = omp.new_cli
    omp.canonical_loop(%canonloop) %iv : i32 in range(%arg1) {
      omp.canonical_loop(%canonloop_d1) %iv_d1 : i32 in range(%arg2) {
        %0 = llvm.add %iv, %iv_d1 : i32
        %1 = llvm.getelementptr inbounds %arg0[%0] : (!llvm.ptr, i32) -> !llvm.ptr, f32
        %2 = llvm.mlir.constant(4.200000e+01 : f32) : f32
        llvm.store %2, %1 : f32, !llvm.ptr
        omp.terminator
      }
      omp.terminator
    }
    omp.tile  <- (%canonloop, %canonloop_d1) sizes(%arg3, %arg4 : i32, i32)
    llvm.return
  }
}

