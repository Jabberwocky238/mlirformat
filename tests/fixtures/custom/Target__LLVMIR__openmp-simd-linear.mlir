module {
}

// -----
module {
  omp.private {type = private} @test_simd_linear_private_i32 : i32
  llvm.func @test_simd_linear() {
    %0 = llvm.mlir.constant(1 : i64) : i64
    %1 = llvm.mlir.constant(1 : i32) : i32
    %2 = llvm.mlir.constant(2 : i32) : i32
    %3 = llvm.mlir.constant(10 : i32) : i32
    %4 = llvm.alloca %0 x i32 {bindc_name = "j"} : (i64) -> !llvm.ptr
    %5 = llvm.alloca %0 x i32 {bindc_name = "i"} : (i64) -> !llvm.ptr
    omp.parallel {
      omp.wsloop private(@test_simd_linear_private_i32 %5 -> %arg0 : !llvm.ptr) {
        omp.loop_nest (%arg1) : i32 = (%1) to (%3) inclusive step (%1) {
          llvm.store %arg1, %arg0 : i32, !llvm.ptr
          llvm.store %2, %4 : i32, !llvm.ptr
          omp.simd linear(%4 : !llvm.ptr = %1 : i32) {
            omp.loop_nest (%arg2) : i32 = (%1) to (%3) inclusive step (%1) {
              llvm.store %arg2, %4 : i32, !llvm.ptr
              omp.yield
            }
          } {linear_var_types = [i32]}
          omp.yield
        }
      }
      omp.terminator
    }
    llvm.return
  }
}

// -----
module {
  llvm.func @test_simd_linear2(%arg0: !llvm.ptr) {
    %0 = llvm.mlir.constant(0 : index) : i64
    %1 = llvm.mlir.constant(1 : index) : i64
    %2 = llvm.mlir.constant(100 : index) : i64
    %3 = llvm.mlir.constant(1 : i32) : i32
    %4 = llvm.mlir.constant(100 : i32) : i32
    %5 = llvm.alloca %0 x i32 {bindc_name = "i"} : (i64) -> !llvm.ptr
    llvm.br ^bb1(%3, %2 : i32, i64)
  ^bb1(%6: i32, %7: i64):  // 2 preds: ^bb0, ^bb2
    %8 = llvm.icmp "sgt" %7, %0 : i64
    llvm.cond_br %8, ^bb2, ^bb3
  ^bb2:  // pred: ^bb1
    llvm.store %6, %5 : i32, !llvm.ptr
    %9 = llvm.load %5 : !llvm.ptr -> i32
    %10 = llvm.add %9, %3 overflow<nsw> : i32
    %11 = llvm.sub %7, %1 : i64
    llvm.br ^bb1(%10, %11 : i32, i64)
  ^bb3:  // pred: ^bb1
    llvm.store %6, %5 : i32, !llvm.ptr
    omp.simd linear(%5 : !llvm.ptr = %3 : i32) {
      omp.loop_nest (%arg1) : i32 = (%3) to (%4) inclusive step (%3) {
        llvm.store %arg1, %5 : i32, !llvm.ptr
        %12 = llvm.load %5 : !llvm.ptr -> i32
        %13 = llvm.sext %12 : i32 to i64
        %14 = llvm.sub %13, %1 overflow<nsw, nuw> : i64
        %15 = llvm.mul %14, %1 overflow<nsw, nuw> : i64
        %16 = llvm.mul %15, %1 overflow<nsw, nuw> : i64
        %17 = llvm.add %16, %0 overflow<nsw, nuw> : i64
        %18 = llvm.getelementptr nusw|nuw %arg0[%17] : (!llvm.ptr, i64) -> !llvm.ptr, i32
        llvm.store %12, %18 : i32, !llvm.ptr
        omp.yield
      }
    } {linear_var_types = [i32]}
    llvm.return
  }
}

