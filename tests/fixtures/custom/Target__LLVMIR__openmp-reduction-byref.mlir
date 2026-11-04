module {
  omp.declare_reduction @add_reduction_i_32 : !llvm.ptr alloc {
    %0 = llvm.mlir.constant(1 : i64) : i64
    %1 = llvm.alloca %0 x i32 : (i64) -> !llvm.ptr
    omp.yield(%1 : !llvm.ptr)
  } init {
  ^bb0(%arg0: !llvm.ptr, %arg1: !llvm.ptr):
    %0 = llvm.mlir.constant(0 : i32) : i32
    llvm.store %0, %arg1 : i32, !llvm.ptr
    omp.yield(%arg1 : !llvm.ptr)
  } combiner {
  ^bb0(%arg0: !llvm.ptr, %arg1: !llvm.ptr):
    %0 = llvm.load %arg0 : !llvm.ptr -> i32
    %1 = llvm.load %arg1 : !llvm.ptr -> i32
    %2 = llvm.add %0, %1 : i32
    llvm.store %2, %arg0 : i32, !llvm.ptr
    omp.yield(%arg0 : !llvm.ptr)
  }
  llvm.func @main() {
    %0 = llvm.mlir.constant(-1 : i32) : i32
    %1 = llvm.mlir.addressof @i : !llvm.ptr
    omp.parallel reduction(byref @add_reduction_i_32 %1 -> %arg0 : !llvm.ptr) {
      llvm.store %0, %arg0 : i32, !llvm.ptr
      omp.terminator
    }
    llvm.return
  }
  llvm.mlir.global internal @i() {addr_space = 0 : i32} : i32 {
    %0 = llvm.mlir.constant(0 : i32) : i32
    llvm.return %0 : i32
  }
}

