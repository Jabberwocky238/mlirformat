module {
  llvm.func @foo(i64)
  llvm.func @rand() -> i1
  llvm.func @large_merge_block(%arg0: i64) {
    %0 = llvm.mlir.constant(0 : i64) : i64
    %1 = llvm.mlir.constant(1 : i64) : i64
    %2 = llvm.mlir.constant(2 : i64) : i64
    %3 = llvm.mlir.constant(3 : i64) : i64
    %4 = llvm.mlir.constant(4 : i64) : i64
    %5 = llvm.icmp "eq" %arg0, %0 : i64
    llvm.cond_br %5, ^bb1, ^bb8
  ^bb1:  // pred: ^bb0
    %6 = llvm.call @rand() : () -> i1
    llvm.cond_br %6, ^bb2, ^bb3
  ^bb2:  // pred: ^bb1
    llvm.call @foo(%1) : (i64) -> ()
    llvm.br ^bb4
  ^bb3:  // pred: ^bb1
    llvm.call @foo(%2) : (i64) -> ()
    llvm.br ^bb4
  ^bb4:  // 2 preds: ^bb2, ^bb3
    %7 = llvm.call @rand() : () -> i1
    llvm.cond_br %7, ^bb5, ^bb6
  ^bb5:  // pred: ^bb4
    llvm.call @foo(%3) : (i64) -> ()
    llvm.br ^bb7
  ^bb6:  // pred: ^bb4
    llvm.call @foo(%4) : (i64) -> ()
    llvm.br ^bb7
  ^bb7:  // 2 preds: ^bb5, ^bb6
    llvm.br ^bb15
  ^bb8:  // pred: ^bb0
    %8 = llvm.call @rand() : () -> i1
    llvm.cond_br %8, ^bb9, ^bb10
  ^bb9:  // pred: ^bb8
    llvm.call @foo(%4) : (i64) -> ()
    llvm.br ^bb11
  ^bb10:  // pred: ^bb8
    llvm.call @foo(%3) : (i64) -> ()
    llvm.br ^bb11
  ^bb11:  // 2 preds: ^bb9, ^bb10
    %9 = llvm.call @rand() : () -> i1
    llvm.cond_br %9, ^bb12, ^bb13
  ^bb12:  // pred: ^bb11
    llvm.call @foo(%2) : (i64) -> ()
    llvm.br ^bb14
  ^bb13:  // pred: ^bb11
    llvm.call @foo(%1) : (i64) -> ()
    llvm.br ^bb14
  ^bb14:  // 2 preds: ^bb12, ^bb13
    llvm.br ^bb15
  ^bb15:  // 2 preds: ^bb7, ^bb14
    llvm.return
  }
  llvm.func @redundant_args0(%arg0: i1) {
    %0 = llvm.mlir.constant(0 : i64) : i64
    %1 = llvm.mlir.constant(1 : i64) : i64
    %2 = llvm.mlir.constant(2 : i64) : i64
    llvm.cond_br %arg0, ^bb1, ^bb2
  ^bb1:  // pred: ^bb0
    llvm.call @foo(%0) : (i64) -> ()
    llvm.call @foo(%0) : (i64) -> ()
    llvm.br ^bb3
  ^bb2:  // pred: ^bb0
    llvm.call @foo(%1) : (i64) -> ()
    llvm.call @foo(%2) : (i64) -> ()
    llvm.br ^bb3
  ^bb3:  // 2 preds: ^bb1, ^bb2
    llvm.return
  }
  llvm.func @redundant_args1(%arg0: i1) {
    %0 = llvm.mlir.constant(0 : i64) : i64
    %1 = llvm.mlir.constant(1 : i64) : i64
    %2 = llvm.mlir.constant(2 : i64) : i64
    llvm.cond_br %arg0, ^bb1, ^bb2
  ^bb1:  // pred: ^bb0
    llvm.call @foo(%1) : (i64) -> ()
    llvm.call @foo(%2) : (i64) -> ()
    llvm.br ^bb3
  ^bb2:  // pred: ^bb0
    llvm.call @foo(%0) : (i64) -> ()
    llvm.call @foo(%0) : (i64) -> ()
    llvm.br ^bb3
  ^bb3:  // 2 preds: ^bb1, ^bb2
    llvm.return
  }
  llvm.func @redundant_args_complex(%arg0: i1) {
    %0 = llvm.mlir.constant(0 : i64) : i64
    %1 = llvm.mlir.constant(1 : i64) : i64
    %2 = llvm.mlir.constant(2 : i64) : i64
    %3 = llvm.mlir.constant(3 : i64) : i64
    llvm.cond_br %arg0, ^bb1, ^bb2
  ^bb1:  // pred: ^bb0
    llvm.call @foo(%2) : (i64) -> ()
    llvm.call @foo(%2) : (i64) -> ()
    llvm.call @foo(%1) : (i64) -> ()
    llvm.call @foo(%2) : (i64) -> ()
    llvm.call @foo(%3) : (i64) -> ()
    llvm.br ^bb3
  ^bb2:  // pred: ^bb0
    llvm.call @foo(%0) : (i64) -> ()
    llvm.call @foo(%0) : (i64) -> ()
    llvm.call @foo(%3) : (i64) -> ()
    llvm.call @foo(%2) : (i64) -> ()
    llvm.call @foo(%2) : (i64) -> ()
    llvm.br ^bb3
  ^bb3:  // 2 preds: ^bb1, ^bb2
    llvm.return
  }
  llvm.func @blocks_with_args() {
    %0 = llvm.mlir.zero : !llvm.ptr
    %1 = llvm.call @rand() : () -> i1
    %2 = llvm.mlir.constant(0 : i64) : i64
    %3 = llvm.mlir.constant(1 : i64) : i64
    llvm.cond_br %1, ^bb2(%0 : !llvm.ptr), ^bb1(%0 : !llvm.ptr)
  ^bb1(%4: !llvm.ptr):  // pred: ^bb0
    llvm.store %4, %0 : !llvm.ptr, !llvm.ptr
    llvm.cond_br %1, ^bb3(%2 : i64), ^bb4(%2 : i64)
  ^bb2(%5: !llvm.ptr):  // pred: ^bb0
    llvm.store %5, %0 : !llvm.ptr, !llvm.ptr
    llvm.cond_br %1, ^bb3(%3 : i64), ^bb4(%3 : i64)
  ^bb3(%6: i64):  // 2 preds: ^bb1, ^bb2
    llvm.call @foo(%6) : (i64) -> ()
    llvm.br ^bb5
  ^bb4(%7: i64):  // 2 preds: ^bb1, ^bb2
    llvm.call @foo(%7) : (i64) -> ()
    llvm.br ^bb5
  ^bb5:  // 2 preds: ^bb3, ^bb4
    llvm.return
  }
}

