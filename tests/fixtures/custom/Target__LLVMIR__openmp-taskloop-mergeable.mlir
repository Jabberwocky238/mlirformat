module {
  omp.private {type = private} @_QFtestEi_private_i32 : i32
  omp.private {type = firstprivate} @_QFtestEa_firstprivate_i32 : i32 copy {
  ^bb0(%arg0: !llvm.ptr, %arg1: !llvm.ptr):
    %0 = llvm.load %arg0 : !llvm.ptr -> i32
    llvm.store %0, %arg1 : i32, !llvm.ptr
    omp.yield(%arg1 : !llvm.ptr)
  }
  llvm.func @_QPtest() {
    %0 = llvm.mlir.constant(1 : i64) : i64
    %1 = llvm.alloca %0 x i32 {bindc_name = "i"} : (i64) -> !llvm.ptr
    %2 = llvm.alloca %0 x i32 {bindc_name = "a"} : (i64) -> !llvm.ptr
    %3 = llvm.mlir.constant(20 : i32) : i32
    llvm.store %3, %2 : i32, !llvm.ptr
    %4 = llvm.mlir.constant(1 : i32) : i32
    %5 = llvm.mlir.constant(5 : i32) : i32
    %6 = llvm.mlir.constant(1 : i32) : i32
    omp.taskloop.context mergeable private(@_QFtestEa_firstprivate_i32 %2 -> %arg0, @_QFtestEi_private_i32 %1 -> %arg1 : !llvm.ptr, !llvm.ptr) {
      omp.taskloop.wrapper {
        omp.loop_nest (%arg2) : i32 = (%4) to (%5) inclusive step (%6) {
          llvm.store %arg2, %arg1 : i32, !llvm.ptr
          %7 = llvm.load %arg0 : !llvm.ptr -> i32
          %8 = llvm.mlir.constant(1 : i32) : i32
          %9 = llvm.add %7, %8 : i32
          llvm.store %9, %arg0 : i32, !llvm.ptr
          omp.yield
        }
      }
      omp.terminator
    } {omp.combined}
    llvm.return
  }
}

