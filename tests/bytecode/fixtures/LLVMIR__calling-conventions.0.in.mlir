"builtin.module"() ({
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<i32 (...)>, linkage = #llvm.linkage<external>, sym_name = "__gxx_personality_v0", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  }) : () -> () loc("<stdin>":2:3)
  "llvm.func"() <{CConv = #llvm.cconv<fastcc>, function_type = !llvm.func<void ()>, linkage = #llvm.linkage<external>, sym_name = "cconv_fastcc", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  }) : () -> () loc("<stdin>":4:3)
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void ()>, linkage = #llvm.linkage<external>, sym_name = "cconv_ccc", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  }) : () -> () loc("<stdin>":6:3)
  "llvm.func"() <{CConv = #llvm.cconv<tailcc>, function_type = !llvm.func<void ()>, linkage = #llvm.linkage<external>, sym_name = "cconv_tailcc", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  }) : () -> () loc("<stdin>":8:3)
  "llvm.func"() <{CConv = #llvm.cconv<cc_10>, function_type = !llvm.func<void ()>, linkage = #llvm.linkage<external>, sym_name = "cconv_ghccc", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  }) : () -> () loc("<stdin>":10:3)
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void ()>, linkage = #llvm.linkage<external>, sym_name = "test_ccs", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
    "llvm.call"() <{CConv = #llvm.cconv<fastcc>, TailCallKind = #llvm.tailcallkind<none>, callee = @cconv_fastcc, fastmathFlags = #llvm.fastmath<none>, op_bundle_sizes = array<i32>, operandSegmentSizes = array<i32: 0, 0>}> : () -> () loc("<stdin>":13:5)
    "llvm.call"() <{CConv = #llvm.cconv<ccc>, TailCallKind = #llvm.tailcallkind<none>, callee = @cconv_ccc, fastmathFlags = #llvm.fastmath<none>, op_bundle_sizes = array<i32>, operandSegmentSizes = array<i32: 0, 0>}> : () -> () loc("<stdin>":14:5)
    "llvm.call"() <{CConv = #llvm.cconv<ccc>, TailCallKind = #llvm.tailcallkind<none>, callee = @cconv_ccc, fastmathFlags = #llvm.fastmath<none>, op_bundle_sizes = array<i32>, operandSegmentSizes = array<i32: 0, 0>}> : () -> () loc("<stdin>":15:5)
    "llvm.call"() <{CConv = #llvm.cconv<tailcc>, TailCallKind = #llvm.tailcallkind<none>, callee = @cconv_tailcc, fastmathFlags = #llvm.fastmath<none>, op_bundle_sizes = array<i32>, operandSegmentSizes = array<i32: 0, 0>}> : () -> () loc("<stdin>":16:5)
    "llvm.call"() <{CConv = #llvm.cconv<cc_10>, TailCallKind = #llvm.tailcallkind<none>, callee = @cconv_ghccc, fastmathFlags = #llvm.fastmath<none>, op_bundle_sizes = array<i32>, operandSegmentSizes = array<i32: 0, 0>}> : () -> () loc("<stdin>":17:5)
    "llvm.return"() : () -> () loc("<stdin>":18:5)
  }) : () -> () loc("<stdin>":12:3)
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void ()>, linkage = #llvm.linkage<external>, personality = @__gxx_personality_v0, sym_name = "test_ccs_invoke", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
    "llvm.invoke"()[^bb1, ^bb6] <{CConv = #llvm.cconv<fastcc>, callee = @cconv_fastcc, op_bundle_sizes = array<i32>, operandSegmentSizes = array<i32: 0, 0, 0, 0>}> : () -> () loc("<stdin>":21:5)
  ^bb1:  // pred: ^bb0
    "llvm.invoke"()[^bb2, ^bb6] <{CConv = #llvm.cconv<ccc>, callee = @cconv_ccc, op_bundle_sizes = array<i32>, operandSegmentSizes = array<i32: 0, 0, 0, 0>}> : () -> () loc("<stdin>":23:5)
  ^bb2:  // pred: ^bb1
    "llvm.invoke"()[^bb3, ^bb6] <{CConv = #llvm.cconv<ccc>, callee = @cconv_ccc, op_bundle_sizes = array<i32>, operandSegmentSizes = array<i32: 0, 0, 0, 0>}> : () -> () loc("<stdin>":25:5)
  ^bb3:  // pred: ^bb2
    "llvm.invoke"()[^bb4, ^bb6] <{CConv = #llvm.cconv<tailcc>, callee = @cconv_tailcc, op_bundle_sizes = array<i32>, operandSegmentSizes = array<i32: 0, 0, 0, 0>}> : () -> () loc("<stdin>":27:5)
  ^bb4:  // pred: ^bb3
    "llvm.invoke"()[^bb5, ^bb6] <{CConv = #llvm.cconv<cc_10>, callee = @cconv_ghccc, op_bundle_sizes = array<i32>, operandSegmentSizes = array<i32: 0, 0, 0, 0>}> : () -> () loc("<stdin>":29:5)
  ^bb5:  // pred: ^bb4
    "llvm.return"() : () -> () loc("<stdin>":31:5)
  ^bb6:  // 5 preds: ^bb0, ^bb1, ^bb2, ^bb3, ^bb4
    %0 = "llvm.landingpad"() <{cleanup}> : () -> !llvm.struct<(ptr, i32)> loc("<stdin>":33:10)
    "llvm.return"() : () -> () loc("<stdin>":34:5)
  }) : () -> () loc("<stdin>":20:3)
}) : () -> () loc("<stdin>":1:1)
