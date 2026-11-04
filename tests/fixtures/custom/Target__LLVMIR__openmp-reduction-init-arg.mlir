module {
  omp.declare_reduction @add_reduction_byref_box_Uxf64 : !llvm.ptr init {
  ^bb0(%arg0: !llvm.ptr):
    %0 = llvm.load %arg0 : !llvm.ptr -> !llvm.struct<(ptr, i64, i32, i8, i8, i8, i8, array<1 x array<3 x i64>>)>
    omp.yield(%arg0 : !llvm.ptr)
  } combiner {
  ^bb0(%arg0: !llvm.ptr, %arg1: !llvm.ptr):
    omp.yield(%arg0 : !llvm.ptr)
  }
  llvm.func internal @_QFPreduce(%arg0: !llvm.ptr {fir.bindc_name = "r"}, %arg1: !llvm.ptr {fir.bindc_name = "r2"}) attributes {sym_visibility = "private"} {
    %0 = llvm.mlir.constant(1 : i32) : i32
    %1 = llvm.mlir.constant(10 : i32) : i32
    %2 = llvm.mlir.constant(0 : i32) : i32
    %3 = llvm.mlir.constant(1 : i64) : i64
    %4 = llvm.alloca %3 x !llvm.struct<(ptr, i64, i32, i8, i8, i8, i8, array<1 x array<3 x i64>>)> : (i64) -> !llvm.ptr
    %5 = llvm.mlir.constant(1 : i64) : i64
    %6 = llvm.alloca %5 x !llvm.struct<(ptr, i64, i32, i8, i8, i8, i8, array<1 x array<3 x i64>>)> : (i64) -> !llvm.ptr
    omp.parallel reduction(byref @add_reduction_byref_box_Uxf64 %4 -> %arg2, byref @add_reduction_byref_box_Uxf64 %6 -> %arg3 : !llvm.ptr, !llvm.ptr) {
      omp.terminator
    }
    llvm.return
  }
}

