module {
  omp.private {type = private} @i_privatizer : i32
  llvm.func @test_loop_var_privatization() attributes {fir.internal_name = "_QPtest_private_clause"} {
    %0 = llvm.mlir.constant(1 : i64) : i64
    %1 = llvm.alloca %0 x i32 {bindc_name = "i"} : (i64) -> !llvm.ptr
    %2 = llvm.alloca %0 x f32 {bindc_name = "dummy"} : (i64) -> !llvm.ptr
    %3 = llvm.mlir.constant(10 : i32) : i32
    %4 = llvm.mlir.constant(1 : i32) : i32
    omp.simd private(@i_privatizer %1 -> %arg0 : !llvm.ptr) {
      omp.loop_nest (%arg1) : i32 = (%4) to (%3) inclusive step (%4) {
        llvm.store %arg1, %arg0 : i32, !llvm.ptr
        %5 = llvm.load %2 : !llvm.ptr -> f32
        %6 = llvm.load %arg0 : !llvm.ptr -> i32
        %7 = llvm.sitofp %6 : i32 to f32
        %8 = llvm.fadd %5, %7 {fastmathFlags = #llvm.fastmath<contract>} : f32
        llvm.store %8, %2 : f32, !llvm.ptr
        omp.yield
      }
    }
    llvm.return
  }
  omp.private {type = private} @dummy_privatizer : f32
  llvm.func @test_private_clause() attributes {fir.internal_name = "_QPtest_private_clause"} {
    %0 = llvm.mlir.constant(1 : i64) : i64
    %1 = llvm.alloca %0 x i32 {bindc_name = "i"} : (i64) -> !llvm.ptr
    %2 = llvm.alloca %0 x f32 {bindc_name = "dummy"} : (i64) -> !llvm.ptr
    %3 = llvm.mlir.constant(10 : i32) : i32
    %4 = llvm.mlir.constant(1 : i32) : i32
    omp.simd private(@dummy_privatizer %2 -> %arg0, @i_privatizer %1 -> %arg1 : !llvm.ptr, !llvm.ptr) {
      omp.loop_nest (%arg2) : i32 = (%4) to (%3) inclusive step (%4) {
        llvm.store %arg2, %arg1 : i32, !llvm.ptr
        %5 = llvm.load %arg0 : !llvm.ptr -> f32
        %6 = llvm.load %arg1 : !llvm.ptr -> i32
        %7 = llvm.sitofp %6 : i32 to f32
        %8 = llvm.fadd %5, %7 {fastmathFlags = #llvm.fastmath<contract>} : f32
        llvm.store %8, %arg0 : f32, !llvm.ptr
        omp.yield
      }
    }
    llvm.return
  }
}

