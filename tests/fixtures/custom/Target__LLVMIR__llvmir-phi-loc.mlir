module {
  llvm.func @test_phi_locations(%arg0: !llvm.ptr) {
    %0 = llvm.mlir.constant(1 : i64) : i64
    %1 = llvm.mlir.constant(100 : i32) : i32
    llvm.br ^bb1(%1, %0 : i32, i64)
  ^bb1(%2: i32, %3: i64):  // 2 preds: ^bb0, ^bb1
    %4 = llvm.icmp "sgt" %3, %0 : i64
    llvm.cond_br %4, ^bb2, ^bb1(%2, %3 : i32, i64)
  ^bb2:  // pred: ^bb1
    llvm.return
  }
}

