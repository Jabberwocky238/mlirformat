module {
  omp.declare_reduction @add_reduction_f32 : f32 init {
  ^bb0(%arg0: f32):
    %0 = llvm.mlir.constant(0.000000e+00 : f32) : f32
    omp.yield(%0 : f32)
  } combiner {
  ^bb0(%arg0: f32, %arg1: f32):
    %0 = llvm.fadd %arg0, %arg1 {fastmathFlags = #llvm.fastmath<contract>} : f32
    omp.yield(%0 : f32)
  }
  llvm.func @sections_(%arg0: !llvm.ptr {fir.bindc_name = "x"}) attributes {fir.internal_name = "_QPsections"} {
    %0 = llvm.mlir.constant(2.000000e+00 : f32) : f32
    %1 = llvm.mlir.constant(1.000000e+00 : f32) : f32
    omp.parallel {
      omp.sections reduction(@add_reduction_f32 %arg0 -> %arg1 : !llvm.ptr) {
        omp.section {
        ^bb0(%arg2: !llvm.ptr):
          %2 = llvm.load %arg2 : !llvm.ptr -> f32
          %3 = llvm.fadd %2, %1 {fastmathFlags = #llvm.fastmath<contract>} : f32
          llvm.store %3, %arg2 : f32, !llvm.ptr
          omp.terminator
        }
        omp.section {
        ^bb0(%arg2: !llvm.ptr):
          %2 = llvm.load %arg2 : !llvm.ptr -> f32
          %3 = llvm.fadd %2, %0 {fastmathFlags = #llvm.fastmath<contract>} : f32
          llvm.store %3, %arg2 : f32, !llvm.ptr
          omp.terminator
        }
        omp.terminator
      }
      omp.terminator
    }
    llvm.return
  }
}

