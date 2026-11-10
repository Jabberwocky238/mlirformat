module {
  omp.private {type = private} @_QPtest_taskloop_boundsEi_private_i32 : i32
  llvm.func @_QPtest_taskloop_bounds() {
    %0 = llvm.mlir.constant(1 : i64) : i64
    %1 = llvm.alloca %0 x i32 {bindc_name = "i"} : (i64) -> !llvm.ptr
    %2 = llvm.mlir.constant(1 : i32) : i32
    %3 = llvm.mlir.constant(10 : i32) : i32
    %4 = llvm.mlir.constant(1 : i32) : i32
    omp.taskloop.context private(@_QPtest_taskloop_boundsEi_private_i32 %1 -> %arg0 : !llvm.ptr) {
      omp.taskloop.wrapper {
        omp.loop_nest (%arg1) : i32 = (%2) to (%3) inclusive step (%4) {
          llvm.store %arg1, %arg0 : i32, !llvm.ptr
          omp.yield
        }
      }
      omp.terminator
    } {omp.combined}
    llvm.return
  }
}

