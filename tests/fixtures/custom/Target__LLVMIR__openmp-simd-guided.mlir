module {
  omp.private {type = private} @_QFEi_private_i32 : i32
  llvm.func @test_simd_guided() {
    %0 = llvm.mlir.constant(1 : i64) : i64
    %1 = llvm.mlir.constant(1 : i32) : i32
    %2 = llvm.mlir.constant(64 : i32) : i32
    %3 = llvm.mlir.constant(0 : i32) : i32
    %4 = llvm.mlir.constant(4 : i32) : i32
    %5 = llvm.alloca %0 x i32 {bindc_name = "i"} : (i64) -> !llvm.ptr
    omp.wsloop schedule(guided = %4 : i32, none, simd) {
      omp.simd linear(%5 : !llvm.ptr = %1 : i32) private(@_QFEi_private_i32 %5 -> %arg0 : !llvm.ptr) {
        omp.loop_nest (%arg1) : i32 = (%3) to (%2) inclusive step (%1) {
          omp.yield
        }
      } {linear_var_types = [i32], omp.composite}
    } {omp.composite}
    llvm.return
  }
}

