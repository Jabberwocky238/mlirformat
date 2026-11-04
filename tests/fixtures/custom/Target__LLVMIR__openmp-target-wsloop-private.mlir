module {
  llvm.func @foo(!llvm.ptr)
  omp.private {type = private} @impure_alloca_privatizer : !llvm.ptr init {
  ^bb0(%arg0: !llvm.ptr, %arg1: !llvm.ptr):
    llvm.call @foo(%arg0) : (!llvm.ptr) -> ()
    omp.yield(%arg1 : !llvm.ptr)
  }
  llvm.func @test_alloca_ip_workaround() {
    omp.target {
      %0 = llvm.mlir.constant(1 : i32) : i32
      %1 = llvm.alloca %0 x !llvm.struct<(ptr, i64, i32, i8, i8, i8, i8, array<1 x array<3 x i64>>)> {alignment = 8 : i64} : (i32) -> !llvm.ptr
      %2 = llvm.mlir.constant(0 : index) : i64
      %3 = llvm.mlir.constant(10 : i32) : i32
      %4 = llvm.mlir.constant(1 : i32) : i32
      omp.wsloop private(@impure_alloca_privatizer %1 -> %arg0 : !llvm.ptr) {
        omp.loop_nest (%arg1) : i32 = (%4) to (%3) inclusive step (%4) {
          omp.yield
        }
      }
      omp.terminator
    }
    llvm.return
  }
}

