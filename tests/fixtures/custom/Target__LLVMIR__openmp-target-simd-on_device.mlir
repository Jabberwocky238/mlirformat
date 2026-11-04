module attributes {omp.is_target_device = true} {
  omp.private {type = private} @simd_privatizer : !llvm.ptr init {
  ^bb0(%arg0: !llvm.ptr, %arg1: !llvm.ptr):
    omp.yield(%arg0 : !llvm.ptr)
  }
  llvm.func @test_target_simd() {
    omp.target {
      %0 = llvm.mlir.constant(1 : i32) : i32
      %1 = llvm.alloca %0 x i32 {bindc_name = "x"} : (i32) -> !llvm.ptr
      omp.simd private(@simd_privatizer %1 -> %arg0 : !llvm.ptr) {
        omp.loop_nest (%arg1) : i32 = (%0) to (%0) inclusive step (%0) {
          omp.yield
        }
      }
      omp.terminator
    }
    llvm.return
  }
}

