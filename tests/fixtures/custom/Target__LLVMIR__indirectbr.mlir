module {
  llvm.func @callee(!llvm.ptr, i32, i32) -> i32
  llvm.func @test_indirectbr_phi(%arg0: !llvm.ptr, %arg1: !llvm.ptr, %arg2: i32) -> i32 {
    %0 = llvm.mlir.undef : i1
    %1 = llvm.blockaddress <function = @test_indirectbr_phi, tag = <id = 1>> : !llvm.ptr
    %2 = llvm.mlir.constant(1 : i32) : i32
    %3 = llvm.mlir.constant(2 : i32) : i32
    %4 = llvm.select %0, %1, %arg0 : i1, !llvm.ptr
    llvm.indirectbr %4 : !llvm.ptr, [
    ^bb1,
    ^bb2(%2 : i32)
    ]
  ^bb1:  // pred: ^bb0
    %5 = llvm.select %0, %1, %arg0 : i1, !llvm.ptr
    llvm.indirectbr %5 : !llvm.ptr, [
    ^bb2(%3 : i32),
    ^bb3
    ]
  ^bb2(%6: i32):  // 2 preds: ^bb0, ^bb1
    %7 = llvm.call @callee(%arg1, %arg2, %6) : (!llvm.ptr, i32, i32) -> i32
    llvm.return %7 : i32
  ^bb3:  // pred: ^bb1
    llvm.blocktag <id = 1>
    llvm.return %arg2 : i32
  }
}

