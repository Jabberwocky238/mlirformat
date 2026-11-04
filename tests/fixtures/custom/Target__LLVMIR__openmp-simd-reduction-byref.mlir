module {
  llvm.func @init(%arg0: !llvm.ptr {llvm.nocapture}, %arg1: !llvm.ptr {llvm.nocapture}) {
    llvm.return
  }
  llvm.func @combine(%arg0: !llvm.ptr {llvm.nocapture}, %arg1: !llvm.ptr {llvm.nocapture}) {
    llvm.return
  }
  llvm.func @cleanup(%arg0: !llvm.ptr {llvm.nocapture}) {
    llvm.return
  }
  omp.private {type = private} @_QFsimd_reductionEi_private_i32 : i32
  omp.declare_reduction @add_reduction_byref_box_2xf32 : !llvm.ptr alloc {
    %0 = llvm.mlir.constant(1 : i64) : i64
    %1 = llvm.alloca %0 x !llvm.struct<(ptr, i64, i32, i8, i8, i8, i8, array<1 x array<3 x i64>>)> : (i64) -> !llvm.ptr
    omp.yield(%1 : !llvm.ptr)
  } init {
  ^bb0(%arg0: !llvm.ptr, %arg1: !llvm.ptr):
    llvm.call @init(%arg0, %arg1) : (!llvm.ptr, !llvm.ptr) -> ()
    omp.yield(%arg1 : !llvm.ptr)
  } combiner {
  ^bb0(%arg0: !llvm.ptr, %arg1: !llvm.ptr):
    llvm.call @combine(%arg0, %arg1) : (!llvm.ptr, !llvm.ptr) -> ()
    omp.yield(%arg0 : !llvm.ptr)
  } cleanup {
  ^bb0(%arg0: !llvm.ptr):
    llvm.call @cleanup(%arg0) : (!llvm.ptr) -> ()
    omp.yield
  }
  llvm.func @_QPsimd_reduction(%arg0: !llvm.ptr {fir.bindc_name = "a", llvm.nocapture}, %arg1: !llvm.ptr {fir.bindc_name = "sum", llvm.nocapture}) {
    %0 = llvm.mlir.constant(1024 : i32) : i32
    %1 = llvm.mlir.constant(1 : i32) : i32
    %2 = llvm.mlir.constant(1 : i64) : i64
    %3 = llvm.alloca %2 x !llvm.struct<(ptr, i64, i32, i8, i8, i8, i8, array<1 x array<3 x i64>>)> : (i64) -> !llvm.ptr
    %4 = llvm.alloca %2 x i32 {bindc_name = "i"} : (i64) -> !llvm.ptr
    omp.simd private(@_QFsimd_reductionEi_private_i32 %4 -> %arg2 : !llvm.ptr) reduction(byref @add_reduction_byref_box_2xf32 %3 -> %arg3 : !llvm.ptr) {
      omp.loop_nest (%arg4) : i32 = (%1) to (%0) inclusive step (%1) {
        llvm.store %arg4, %arg2 : i32, !llvm.ptr
        omp.yield
      }
    }
    llvm.return
  }
}

