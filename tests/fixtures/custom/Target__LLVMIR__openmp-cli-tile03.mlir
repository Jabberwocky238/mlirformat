module {
  llvm.func @tile_composition(%arg0: !llvm.ptr, %arg1: i32, %arg2: i32, %arg3: i32, %arg4: i32) {
    %canonloop = omp.new_cli
    %grid1 = omp.new_cli
    %intratile1 = omp.new_cli
    %intratile1_0 = omp.new_cli
    %grid1_1 = omp.new_cli
    %grid1_2 = omp.new_cli
    %intratile1_3 = omp.new_cli
    omp.canonical_loop(%canonloop) %iv : i32 in range(%arg1) {
      %0 = llvm.getelementptr inbounds %arg0[%iv] : (!llvm.ptr, i32) -> !llvm.ptr, f32
      %1 = llvm.mlir.constant(4.200000e+01 : f32) : f32
      llvm.store %1, %0 : f32, !llvm.ptr
      omp.terminator
    }
    omp.tile (%grid1, %intratile1) <- (%canonloop) sizes(%arg2 : i32)
    omp.tile (%grid1_1, %intratile1_0) <- (%grid1) sizes(%arg3 : i32)
    omp.tile (%grid1_2, %intratile1_3) <- (%intratile1) sizes(%arg4 : i32)
    llvm.return
  }
}

