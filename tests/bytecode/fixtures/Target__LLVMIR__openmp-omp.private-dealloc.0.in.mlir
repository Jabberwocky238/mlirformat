"builtin.module"() ({
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (ptr)>, linkage = #llvm.linkage<external>, sym_name = "free", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  }) : () -> () loc("<stdin>":2:3)
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (ptr)>, linkage = #llvm.linkage<external>, sym_name = "parallel_op_dealloc", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg3: !llvm.ptr loc("<stdin>":5:8)):
    "omp.parallel"(%arg3) <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 1, 0>, private_syms = [@x.privatizer]}> ({
    ^bb0(%arg4: !llvm.ptr loc("<stdin>":7:10)):
      %4 = "llvm.load"(%arg4) <{ordering = 0 : i64}> : (!llvm.ptr) -> f32 loc("<stdin>":8:12)
      "omp.terminator"() : () -> () loc("<stdin>":9:7)
    }) : (!llvm.ptr) -> () loc("<stdin>":6:5)
    "llvm.return"() : () -> () loc("<stdin>":11:5)
  }) : () -> () loc("<stdin>":4:3)
  "omp.private"() <{data_sharing_type = #omp<data_sharing_type{type = firstprivate}>, sym_name = "x.privatizer", type = f32}> ({
  }, {
  ^bb0(%arg1: !llvm.ptr loc("<stdin>":15:8), %arg2: !llvm.ptr loc("<stdin>":15:26)):
    %3 = "llvm.load"(%arg1) <{ordering = 0 : i64}> : (!llvm.ptr) -> f32 loc("<stdin>":16:10)
    "llvm.store"(%3, %arg2) <{ordering = 0 : i64}> : (f32, !llvm.ptr) -> () loc("<stdin>":17:5)
    "omp.yield"(%arg2) : (!llvm.ptr) -> () loc("<stdin>":18:5)
  }, {
  ^bb0(%arg0: !llvm.ptr loc("<stdin>":20:8)):
    %0 = "llvm.ptrtoint"(%arg0) : (!llvm.ptr) -> i64 loc("<stdin>":21:10)
    %1 = "llvm.mlir.constant"() <{value = 0 : i64}> : () -> i64 loc("<stdin>":22:10)
    %2 = "llvm.icmp"(%0, %1) <{predicate = 1 : i64}> : (i64, i64) -> i1 loc("<stdin>":23:10)
    "llvm.cond_br"(%2)[^bb1, ^bb2] <{operandSegmentSizes = array<i32: 1, 0, 0>}> : (i1) -> () loc("<stdin>":24:5)
  ^bb1:  // pred: ^bb0
    "llvm.call"(%arg0) <{CConv = #llvm.cconv<ccc>, TailCallKind = #llvm.tailcallkind<none>, callee = @free, fastmathFlags = #llvm.fastmath<none>, op_bundle_sizes = array<i32>, operandSegmentSizes = array<i32: 1, 0>}> : (!llvm.ptr) -> () loc("<stdin>":26:5)
    "llvm.br"()[^bb2] : () -> () loc("<stdin>":27:5)
  ^bb2:  // 2 preds: ^bb0, ^bb1
    "omp.yield"() : () -> () loc("<stdin>":29:5)
  }) : () -> () loc("<stdin>":13:3)
}) : () -> () loc("<stdin>":1:1)
