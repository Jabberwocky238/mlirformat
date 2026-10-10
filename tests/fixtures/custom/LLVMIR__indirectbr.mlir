module {
  llvm.func @ib0(%arg0: !llvm.ptr, %arg1: i32, %arg2: i32) -> i32 {
    llvm.indirectbr %arg0 : !llvm.ptr, [
    ^bb1(%arg1 : i32),
    ^bb2(%arg2, %arg1 : i32, i32)
    ]
  ^bb1(%0: i32):  // pred: ^bb0
    llvm.return %0 : i32
  ^bb2(%1: i32, %2: i32):  // pred: ^bb0
    %3 = llvm.add %1, %2 : i32
    llvm.return %3 : i32
  }
}

// -----
module {
  llvm.func @ib1(%arg0: !llvm.ptr) {
    llvm.indirectbr %arg0 : !llvm.ptr, []
  }
}

// -----
module {
  llvm.func @callee(!llvm.ptr, i32, i32) -> i32
  llvm.func @test_indirectbr_phi(%arg0: !llvm.ptr, %arg1: !llvm.ptr, %arg2: !llvm.ptr, %arg3: i32) -> i32 {
    %0 = llvm.mlir.undef : i1
    %1 = llvm.mlir.addressof @test_indirectbr_phi : !llvm.ptr
    %2 = llvm.blockaddress <function = @test_indirectbr_phi, tag = <id = 1>> : !llvm.ptr
    %3 = llvm.mlir.constant(1 : i32) : i32
    %4 = llvm.mlir.constant(2 : i32) : i32
    %5 = llvm.select %0, %2, %arg0 : i1, !llvm.ptr
    llvm.indirectbr %5 : !llvm.ptr, [
    ^bb1,
    ^bb2(%3 : i32)
    ]
  ^bb1:  // pred: ^bb0
    %6 = llvm.select %0, %2, %arg0 : i1, !llvm.ptr
    llvm.indirectbr %6 : !llvm.ptr, [
    ^bb2(%4 : i32),
    ^bb3
    ]
  ^bb2(%7: i32):  // 2 preds: ^bb0, ^bb1
    %8 = llvm.call @callee(%arg1, %arg3, %7) : (!llvm.ptr, i32, i32) -> i32
    llvm.return %8 : i32
  ^bb3:  // pred: ^bb1
    llvm.blocktag <id = 1>
    llvm.return %arg3 : i32
  }
}

