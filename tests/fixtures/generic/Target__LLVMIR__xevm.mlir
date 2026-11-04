"builtin.module"() ({
  "llvm.func"() <{CConv = #llvm.cconv<spir_funccc>, function_type = !llvm.func<void (ptr<1>, i64)>, linkage = #llvm.linkage<external>, sym_name = "_Z8prefetchPU3AS1Kcm", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (ptr<1>)>, linkage = #llvm.linkage<external>, sym_name = "prefetch", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg0: !llvm.ptr<1>):
    %0 = "llvm.mlir.constant"() <{value = 1 : i64}> : () -> i64
    "llvm.call"(%arg0, %0) <{CConv = #llvm.cconv<spir_funccc>, TailCallKind = #llvm.tailcallkind<none>, callee = @_Z8prefetchPU3AS1Kcm, fastmathFlags = #llvm.fastmath<none>, no_unwind, op_bundle_sizes = array<i32>, operandSegmentSizes = array<i32: 2, 0>}> {function_type = !llvm.func<void (ptr<1>, i64)>, linkage = #llvm.linkage<external>, sym_name = "_Z8prefetchPU3AS1Kcm", visibility_ = 0 : i64, xevm.DecorationCacheControl = [[6442 : i32, 0 : i32, 1 : i32, 0 : i32], [6442 : i32, 1 : i32, 1 : i32, 0 : i32]]} : (!llvm.ptr<1>, i64) -> ()
    "llvm.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<i32 (ptr<1>)>, linkage = #llvm.linkage<external>, sym_name = "load", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg0: !llvm.ptr<1>):
    %0 = "llvm.load"(%arg0) <{ordering = 0 : i64}> {xevm.DecorationCacheControl = [[6442 : i32, 0 : i32, 1 : i32, 0 : i32], [6442 : i32, 1 : i32, 1 : i32, 0 : i32]]} : (!llvm.ptr<1>) -> i32
    "llvm.return"(%0) : (i32) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (ptr<1>, i32)>, linkage = #llvm.linkage<external>, sym_name = "store", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg0: !llvm.ptr<1>, %arg1: i32):
    "llvm.store"(%arg1, %arg0) <{ordering = 0 : i64}> {xevm.DecorationCacheControl = [[6443 : i32, 0 : i32, 2 : i32, 0 : i32], [6443 : i32, 1 : i32, 2 : i32, 0 : i32]]} : (i32, !llvm.ptr<1>) -> ()
    "llvm.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

