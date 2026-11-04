module {
  omp.declare_reduction @add_reduction_i_32 : !llvm.ptr init {
  ^bb0(%arg0: !llvm.ptr):
    %0 = llvm.mlir.constant(0 : i32) : i32
    %1 = llvm.mlir.constant(4 : i64) : i64
    %2 = llvm.call @malloc(%1) : (i64) -> !llvm.ptr
    llvm.store %0, %2 : i32, !llvm.ptr
    omp.yield(%2 : !llvm.ptr)
  } combiner {
  ^bb0(%arg0: !llvm.ptr, %arg1: !llvm.ptr):
    %0 = llvm.load %arg0 : !llvm.ptr -> i32
    %1 = llvm.load %arg1 : !llvm.ptr -> i32
    %2 = llvm.add %0, %1 : i32
    llvm.store %2, %arg0 : i32, !llvm.ptr
    omp.yield(%arg0 : !llvm.ptr)
  } cleanup {
  ^bb0(%arg0: !llvm.ptr):
    llvm.call @free(%arg0) : (!llvm.ptr) -> ()
    omp.yield
  }
  llvm.func @main() {
    %0 = llvm.mlir.constant(-1 : i32) : i32
    %1 = llvm.mlir.addressof @i : !llvm.ptr
    %2 = llvm.mlir.addressof @j : !llvm.ptr
    %3 = llvm.mlir.constant(9 : i32) : i32
    %4 = llvm.mlir.constant(0 : i32) : i32
    %5 = llvm.mlir.constant(1 : i32) : i32
    omp.wsloop reduction(byref @add_reduction_i_32 %1 -> %arg0, byref @add_reduction_i_32 %2 -> %arg1 : !llvm.ptr, !llvm.ptr) {
      omp.loop_nest (%arg2) : i32 = (%4) to (%3) inclusive step (%5) {
        llvm.store %0, %arg0 : i32, !llvm.ptr
        llvm.store %0, %arg1 : i32, !llvm.ptr
        omp.yield
      }
    }
    llvm.return
  }
  llvm.mlir.global internal @i() {addr_space = 0 : i32} : i32 {
    %0 = llvm.mlir.constant(0 : i32) : i32
    llvm.return %0 : i32
  }
  llvm.mlir.global internal @j() {addr_space = 0 : i32} : i32 {
    %0 = llvm.mlir.constant(0 : i32) : i32
    llvm.return %0 : i32
  }
  llvm.func @malloc(i64) -> !llvm.ptr
  llvm.func @free(!llvm.ptr)
}

