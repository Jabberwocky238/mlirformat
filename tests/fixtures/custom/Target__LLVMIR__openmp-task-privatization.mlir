module {
  omp.private {type = private} @privatizer : i32
  omp.private {type = firstprivate} @firstprivatizer : i32 copy {
  ^bb0(%arg0: !llvm.ptr, %arg1: !llvm.ptr):
    %0 = llvm.load %arg0 : !llvm.ptr -> i32
    llvm.store %0, %arg1 : i32, !llvm.ptr
    omp.yield(%arg1 : !llvm.ptr)
  }
  llvm.func @task_privatization_test() {
    %0 = llvm.mlir.constant(0 : i32) : i32
    %1 = llvm.mlir.constant(1 : i32) : i32
    %2 = llvm.alloca %1 x i32 : (i32) -> !llvm.ptr
    %3 = llvm.alloca %1 x i32 : (i32) -> !llvm.ptr
    llvm.store %0, %2 : i32, !llvm.ptr
    llvm.store %1, %3 : i32, !llvm.ptr
    omp.task private(@privatizer %2 -> %arg0, @firstprivatizer %3 -> %arg1 : !llvm.ptr, !llvm.ptr) {
      %4 = llvm.load %arg1 : !llvm.ptr -> i32
      llvm.store %4, %arg0 : i32, !llvm.ptr
      omp.terminator
    }
    llvm.return
  }
}

