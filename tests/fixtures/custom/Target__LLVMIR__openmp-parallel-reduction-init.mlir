module {
  omp.declare_reduction @add_reduction : !llvm.ptr alloc {
    %0 = llvm.mlir.constant(1 : i64) : i64
    %1 = llvm.alloca %0 x !llvm.struct<(ptr)> : (i64) -> !llvm.ptr
    omp.yield(%1 : !llvm.ptr)
  } init {
  ^bb0(%arg0: !llvm.ptr, %arg1: !llvm.ptr):
    %0 = llvm.mlir.constant(1 : i32) : i32
    "llvm.intr.memcpy"(%arg1, %arg0, %0) <{isVolatile = false}> : (!llvm.ptr, !llvm.ptr, i32) -> ()
    omp.yield(%arg1 : !llvm.ptr)
  } combiner {
  ^bb0(%arg0: !llvm.ptr, %arg1: !llvm.ptr):
    omp.yield(%arg0 : !llvm.ptr)
  } cleanup {
  ^bb0(%arg0: !llvm.ptr):
    omp.yield
  }
  llvm.func @use_reduction() attributes {fir.bindc_name = "test"} {
    %0 = llvm.mlir.constant(1 : i32) : i32
    omp.parallel {
      %1 = llvm.mlir.constant(1 : i64) : i64
      %2 = llvm.alloca %1 x !llvm.struct<(ptr)> : (i64) -> !llvm.ptr
      omp.wsloop reduction(byref @add_reduction %2 -> %arg0 : !llvm.ptr) {
        omp.loop_nest (%arg1) : i32 = (%0) to (%0) inclusive step (%0) {
          omp.yield
        }
      }
      omp.terminator
    }
    llvm.return
  }
}

