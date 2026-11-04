module {
  llvm.func @tile_trivial_loop(%arg0: !llvm.ptr, %arg1: i32, %arg2: i32) {
    %canonloop = omp.new_cli
    omp.canonical_loop(%canonloop) %iv : i32 in range(%arg1) {
      %0 = llvm.getelementptr inbounds %arg0[%iv] : (!llvm.ptr, i32) -> !llvm.ptr, f32
      %1 = llvm.mlir.constant(4.200000e+01 : f32) : f32
      llvm.store %1, %0 : f32, !llvm.ptr
      omp.terminator
    }
    omp.tile  <- (%canonloop) sizes(%arg2 : i32)
    llvm.return
  }
}

