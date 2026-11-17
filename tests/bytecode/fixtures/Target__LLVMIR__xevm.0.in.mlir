"builtin.module"() ({
  "llvm.func"() <{CConv = #llvm.cconv<spir_funccc>, function_type = !llvm.func<void (ptr<1>, i64)>, linkage = #llvm.linkage<external>, sym_name = "_Z8prefetchPU3AS1Kcm", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  }) : () -> () loc("<stdin>":2:3)
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (ptr<1>)>, linkage = #llvm.linkage<external>, sym_name = "prefetch", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg0: !llvm.ptr<1> loc("<stdin>":5:8)):
    %0 = "llvm.mlir.constant"() <{value = 1 : i64}> : () -> i64 loc("<stdin>":6:10)
    "llvm.call"(%arg0, %0) <{CConv = #llvm.cconv<spir_funccc>, TailCallKind = #llvm.tailcallkind<none>, callee = @_Z8prefetchPU3AS1Kcm, fastmathFlags = #llvm.fastmath<none>, no_unwind, op_bundle_sizes = array<i32>, operandSegmentSizes = array<i32: 2, 0>}> {function_type = !llvm.func<void (ptr<1>, i64)>, linkage = #llvm.linkage<external>, sym_name = "_Z8prefetchPU3AS1Kcm", visibility_ = 0 : i64} : (!llvm.ptr<1>, i64) -> () loc("<stdin>":7:5)
    "llvm.return"() : () -> () loc("<stdin>":8:5)
  }) : () -> () loc("<stdin>":4:3)
}) : () -> () loc("<stdin>":1:1)
