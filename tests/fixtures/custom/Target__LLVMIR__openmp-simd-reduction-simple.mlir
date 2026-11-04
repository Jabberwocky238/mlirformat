module {
  omp.private {type = private} @_QFsimd_reductionEi_private_i32 : i32
  omp.declare_reduction @add_reduction_f32 : f32 init {
  ^bb0(%arg0: f32):
    %0 = llvm.mlir.constant(0.000000e+00 : f32) : f32
    omp.yield(%0 : f32)
  } combiner {
  ^bb0(%arg0: f32, %arg1: f32):
    %0 = llvm.fadd %arg0, %arg1 {fastmathFlags = #llvm.fastmath<contract>} : f32
    omp.yield(%0 : f32)
  }
  llvm.func @_QPsimd_reduction(%arg0: !llvm.ptr {fir.bindc_name = "a", llvm.nocapture}, %arg1: !llvm.ptr {fir.bindc_name = "sum", llvm.nocapture}) {
    %0 = llvm.mlir.constant(0.000000e+00 : f32) : f32
    %1 = llvm.mlir.constant(1 : i32) : i32
    %2 = llvm.mlir.constant(1024 : i32) : i32
    %3 = llvm.mlir.constant(1 : i64) : i64
    %4 = llvm.alloca %3 x i32 {bindc_name = "i"} : (i64) -> !llvm.ptr
    llvm.store %0, %arg1 : f32, !llvm.ptr
    omp.simd private(@_QFsimd_reductionEi_private_i32 %4 -> %arg2 : !llvm.ptr) reduction(@add_reduction_f32 %arg1 -> %arg3 : !llvm.ptr) {
      omp.loop_nest (%arg4) : i32 = (%1) to (%2) inclusive step (%1) {
        llvm.store %arg4, %arg2 : i32, !llvm.ptr
        %5 = llvm.load %arg3 : !llvm.ptr -> f32
        %6 = llvm.load %arg2 : !llvm.ptr -> i32
        %7 = llvm.sext %6 : i32 to i64
        %8 = llvm.sub %7, %3 overflow<nsw> : i64
        %9 = llvm.getelementptr %arg0[%8] : (!llvm.ptr, i64) -> !llvm.ptr, f32
        %10 = llvm.load %9 : !llvm.ptr -> f32
        %11 = llvm.fadd %5, %10 {fastmathFlags = #llvm.fastmath<contract>} : f32
        llvm.store %11, %arg3 : f32, !llvm.ptr
        omp.yield
      }
    }
    llvm.return
  }
}

