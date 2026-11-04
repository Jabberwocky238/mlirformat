module {
  omp.declare_reduction @add_f32 : f32 init {
  ^bb0(%arg0: f32):
    %0 = llvm.mlir.constant(0.000000e+00 : f32) : f32
    omp.yield(%0 : f32)
  } combiner {
  ^bb0(%arg0: f32, %arg1: f32):
    llvm.call @test_call() : () -> ()
    %0 = llvm.fadd %arg0, %arg1 : f32
    omp.yield(%0 : f32)
  }
  llvm.func @simple_reduction(%arg0: i64, %arg1: i64, %arg2: i64) {
    %0 = llvm.mlir.constant(1 : i32) : i32
    %1 = llvm.alloca %0 x i32 : (i32) -> !llvm.ptr
    omp.parallel reduction(@add_f32 %1 -> %arg3 : !llvm.ptr) {
      %2 = llvm.mlir.constant(2.000000e+00 : f32) : f32
      %3 = llvm.load %arg3 : !llvm.ptr -> f32
      %4 = llvm.fadd %2, %3 : f32
      llvm.store %4, %arg3 : f32, !llvm.ptr
      omp.terminator
    }
    llvm.return
  }
  llvm.func @test_call()
}

