"builtin.module"() ({
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<i32 (ptr, i32, i32)>, linkage = #llvm.linkage<external>, sym_name = "callee", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  }) : () -> () loc("<stdin>":2:3)
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<i32 (ptr, ptr, i32)>, linkage = #llvm.linkage<external>, sym_name = "test_indirectbr_phi", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg0: !llvm.ptr loc("<stdin>":5:8), %arg1: !llvm.ptr loc("<stdin>":5:26), %arg2: i32 loc("<stdin>":5:44)):
    %0 = "llvm.mlir.undef"() : () -> i1 loc("<stdin>":6:10)
    %1 = "llvm.blockaddress"() <{block_addr = #llvm.blockaddress<function = @test_indirectbr_phi, tag = <id = 1>>}> : () -> !llvm.ptr loc("<stdin>":7:10)
    %2 = "llvm.mlir.constant"() <{value = 1 : i32}> : () -> i32 loc("<stdin>":8:10)
    %3 = "llvm.mlir.constant"() <{value = 2 : i32}> : () -> i32 loc("<stdin>":9:10)
    %4 = "llvm.select"(%0, %1, %arg0) <{fastmathFlags = #llvm.fastmath<none>}> : (i1, !llvm.ptr, !llvm.ptr) -> !llvm.ptr loc("<stdin>":10:10)
    "llvm.indirectbr"(%4, %2)[^bb1, ^bb2] <{indbr_operand_segments = array<i32: 0, 1>}> : (!llvm.ptr, i32) -> () loc("<stdin>":11:5)
  ^bb1:  // pred: ^bb0
    %5 = "llvm.select"(%0, %1, %arg0) <{fastmathFlags = #llvm.fastmath<none>}> : (i1, !llvm.ptr, !llvm.ptr) -> !llvm.ptr loc("<stdin>":13:10)
    "llvm.indirectbr"(%5, %3)[^bb2, ^bb3] <{indbr_operand_segments = array<i32: 1, 0>}> : (!llvm.ptr, i32) -> () loc("<stdin>":14:5)
  ^bb2(%6: i32 loc("<stdin>":15:8)):  // 2 preds: ^bb0, ^bb1
    %7 = "llvm.call"(%arg1, %arg2, %6) <{CConv = #llvm.cconv<ccc>, TailCallKind = #llvm.tailcallkind<none>, callee = @callee, fastmathFlags = #llvm.fastmath<none>, op_bundle_sizes = array<i32>, operandSegmentSizes = array<i32: 3, 0>}> : (!llvm.ptr, i32, i32) -> i32 loc("<stdin>":16:10)
    "llvm.return"(%7) : (i32) -> () loc("<stdin>":17:5)
  ^bb3:  // pred: ^bb1
    "llvm.blocktag"() <{tag = #llvm.blocktag<id = 1>}> : () -> () loc("<stdin>":19:5)
    "llvm.return"(%arg2) : (i32) -> () loc("<stdin>":20:5)
  }) : () -> () loc("<stdin>":4:3)
}) : () -> () loc("<stdin>":1:1)
