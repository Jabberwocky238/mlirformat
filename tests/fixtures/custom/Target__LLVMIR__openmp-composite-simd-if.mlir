module {
  llvm.func @_QPfoo(%arg0: !llvm.ptr {fir.bindc_name = "array", llvm.nocapture}, %arg1: !llvm.ptr {fir.bindc_name = "t", llvm.nocapture}) {
    %0 = llvm.mlir.constant(0 : i64) : i32
    %1 = llvm.mlir.constant(1 : i32) : i32
    %2 = llvm.mlir.constant(10 : i64) : i64
    %3 = llvm.mlir.constant(1 : i64) : i64
    %4 = llvm.alloca %3 x i32 {bindc_name = "i", pinned} : (i64) -> !llvm.ptr
    %5 = llvm.load %arg1 : !llvm.ptr -> i32
    %6 = llvm.icmp "ne" %5, %0 : i32
    %7 = llvm.trunc %2 : i64 to i32
    omp.wsloop {
      omp.simd if(%6) {
        omp.loop_nest (%arg2) : i32 = (%1) to (%7) inclusive step (%1) {
          llvm.store %arg2, %4 : i32, !llvm.ptr
          %8 = llvm.load %4 : !llvm.ptr -> i32
          %9 = llvm.sext %8 : i32 to i64
          %10 = llvm.getelementptr %arg0[%9] : (!llvm.ptr, i64) -> !llvm.ptr, i32
          llvm.store %8, %10 : i32, !llvm.ptr
          omp.yield
        }
      } {omp.composite}
    } {omp.composite}
    llvm.return
  }
}

