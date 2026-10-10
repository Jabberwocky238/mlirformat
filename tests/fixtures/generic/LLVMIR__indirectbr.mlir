"builtin.module"() ({
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<i32 (ptr, i32, i32)>, linkage = #llvm.linkage<external>, sym_name = "ib0", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg0: !llvm.ptr, %arg1: i32, %arg2: i32):
    "llvm.indirectbr"(%arg0, %arg1, %arg2, %arg1)[^bb1, ^bb2] <{indbr_operand_segments = array<i32: 1, 2>}> : (!llvm.ptr, i32, i32, i32) -> ()
  ^bb1(%0: i32):  // pred: ^bb0
    "llvm.return"(%0) : (i32) -> ()
  ^bb2(%1: i32, %2: i32):  // pred: ^bb0
    %3 = "llvm.add"(%1, %2) <{overflowFlags = 0 : i32}> : (i32, i32) -> i32
    "llvm.return"(%3) : (i32) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (ptr)>, linkage = #llvm.linkage<external>, sym_name = "ib1", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg0: !llvm.ptr):
    "llvm.indirectbr"(%arg0) <{indbr_operand_segments = array<i32>}> : (!llvm.ptr) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<i32 (ptr, i32, i32)>, linkage = #llvm.linkage<external>, sym_name = "callee", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<i32 (ptr, ptr, ptr, i32)>, linkage = #llvm.linkage<external>, sym_name = "test_indirectbr_phi", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg0: !llvm.ptr, %arg1: !llvm.ptr, %arg2: !llvm.ptr, %arg3: i32):
    %0 = "llvm.mlir.undef"() : () -> i1
    %1 = "llvm.mlir.addressof"() <{global_name = @test_indirectbr_phi}> : () -> !llvm.ptr
    %2 = "llvm.blockaddress"() <{block_addr = #llvm.blockaddress<function = @test_indirectbr_phi, tag = <id = 1>>}> : () -> !llvm.ptr
    %3 = "llvm.mlir.constant"() <{value = 1 : i32}> : () -> i32
    %4 = "llvm.mlir.constant"() <{value = 2 : i32}> : () -> i32
    %5 = "llvm.select"(%0, %2, %arg0) <{fastmathFlags = #llvm.fastmath<none>}> : (i1, !llvm.ptr, !llvm.ptr) -> !llvm.ptr
    "llvm.indirectbr"(%5, %3)[^bb1, ^bb2] <{indbr_operand_segments = array<i32: 0, 1>}> : (!llvm.ptr, i32) -> ()
  ^bb1:  // pred: ^bb0
    %6 = "llvm.select"(%0, %2, %arg0) <{fastmathFlags = #llvm.fastmath<none>}> : (i1, !llvm.ptr, !llvm.ptr) -> !llvm.ptr
    "llvm.indirectbr"(%6, %4)[^bb2, ^bb3] <{indbr_operand_segments = array<i32: 1, 0>}> : (!llvm.ptr, i32) -> ()
  ^bb2(%7: i32):  // 2 preds: ^bb0, ^bb1
    %8 = "llvm.call"(%arg1, %arg3, %7) <{CConv = #llvm.cconv<ccc>, TailCallKind = #llvm.tailcallkind<none>, callee = @callee, fastmathFlags = #llvm.fastmath<none>, op_bundle_sizes = array<i32>, operandSegmentSizes = array<i32: 3, 0>}> : (!llvm.ptr, i32, i32) -> i32
    "llvm.return"(%8) : (i32) -> ()
  ^bb3:  // pred: ^bb1
    "llvm.blocktag"() <{tag = #llvm.blocktag<id = 1>}> : () -> ()
    "llvm.return"(%arg3) : (i32) -> ()
  }) : () -> ()
}) : () -> ()

