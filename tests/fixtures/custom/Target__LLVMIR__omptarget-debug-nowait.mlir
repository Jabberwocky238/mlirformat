module attributes {omp.is_target_device = false} {
  llvm.func @main() {
    %0 = llvm.mlir.constant(1 : i64) : i64
    %1 = llvm.alloca %0 x f32 : (i64) -> !llvm.ptr
    %2 = llvm.alloca %0 x i32 : (i64) -> !llvm.ptr
    %3 = omp.map.info var_ptr(%1 : !llvm.ptr, f32) map_clauses(tofrom) capture(ByRef) -> !llvm.ptr
    %4 = omp.map.info var_ptr(%2 : !llvm.ptr, i32) map_clauses(implicit) capture(ByCopy) -> !llvm.ptr
    omp.target kernel_type(generic) nowait map_entries(%3 -> %arg0, %4 -> %arg1 : !llvm.ptr, !llvm.ptr) {
      %5 = llvm.mlir.constant(0 : i64) : i64
      %6 = llvm.mlir.constant(100 : i32) : i32
      llvm.br ^bb1(%6, %5 : i32, i64)
    ^bb1(%7: i32, %8: i64):  // 2 preds: ^bb0, ^bb2
      %9 = llvm.icmp "sgt" %8, %5 : i64
      llvm.cond_br %9, ^bb2, ^bb3
    ^bb2:  // pred: ^bb1
      llvm.store %7, %arg1 : i32, !llvm.ptr
      llvm.br ^bb1(%7, %8 : i32, i64)
    ^bb3:  // pred: ^bb1
      llvm.store %7, %arg1 : i32, !llvm.ptr
      omp.terminator
    }
    llvm.return
  }
}

