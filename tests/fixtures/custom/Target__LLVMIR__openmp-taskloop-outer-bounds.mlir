module {
  omp.private {type = private} @_QFtestEi_private_i32 : i32
  llvm.func @_QPtest() {
    %0 = llvm.mlir.constant(1 : i64) : i64
    %1 = llvm.alloca %0 x i32 {bindc_name = "i"} : (i64) -> !llvm.ptr
    %2 = llvm.alloca %0 x i32 {bindc_name = "lb"} : (i64) -> !llvm.ptr
    %3 = llvm.alloca %0 x i32 {bindc_name = "ub"} : (i64) -> !llvm.ptr
    %4 = llvm.alloca %0 x i32 {bindc_name = "step"} : (i64) -> !llvm.ptr
    %5 = llvm.mlir.constant(1 : i32) : i32
    %6 = llvm.mlir.constant(10 : i32) : i32
    %7 = llvm.mlir.constant(2 : i32) : i32
    llvm.store %5, %2 : i32, !llvm.ptr
    llvm.store %6, %3 : i32, !llvm.ptr
    llvm.store %7, %4 : i32, !llvm.ptr
    %8 = llvm.load %2 : !llvm.ptr -> i32
    %9 = llvm.load %3 : !llvm.ptr -> i32
    %10 = llvm.load %4 : !llvm.ptr -> i32
    omp.taskloop.context private(@_QFtestEi_private_i32 %1 -> %arg0 : !llvm.ptr) {
      omp.taskloop.wrapper {
        omp.loop_nest (%arg1) : i32 = (%8) to (%9) inclusive step (%10) {
          llvm.store %arg1, %arg0 : i32, !llvm.ptr
          omp.yield
        }
      }
      omp.terminator
    } {omp.combined}
    llvm.return
  }
}

