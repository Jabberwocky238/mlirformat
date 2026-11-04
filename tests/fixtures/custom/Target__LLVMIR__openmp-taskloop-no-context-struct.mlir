module {
  omp.private {type = private} @_QFtestEi_private_i32 : i32
  omp.private {type = private} @_QFtestEt2_private_i32 : i32
  omp.private {type = private} @_QFtestEt1_private_i32 : i32
  llvm.func @_QPtest() {
    %0 = llvm.mlir.constant(1 : i32) : i32
    %1 = llvm.mlir.constant(20 : i32) : i32
    %2 = llvm.mlir.constant(1 : i64) : i64
    %3 = llvm.alloca %2 x i32 {bindc_name = "t2"} : (i64) -> !llvm.ptr
    %4 = llvm.alloca %2 x i32 {bindc_name = "t1"} : (i64) -> !llvm.ptr
    %5 = llvm.alloca %2 x i32 {bindc_name = "i"} : (i64) -> !llvm.ptr
    omp.taskloop private(@_QFtestEt1_private_i32 %4 -> %arg0, @_QFtestEt2_private_i32 %3 -> %arg1, @_QFtestEi_private_i32 %5 -> %arg2 : !llvm.ptr, !llvm.ptr, !llvm.ptr) {
      omp.loop_nest (%arg3) : i32 = (%0) to (%1) inclusive step (%0) {
        llvm.store %arg3, %arg2 : i32, !llvm.ptr
        omp.yield
      }
    }
    llvm.return
  }
}

