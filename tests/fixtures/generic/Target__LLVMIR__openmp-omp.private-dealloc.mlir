"builtin.module"() ({
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (ptr)>, linkage = #llvm.linkage<external>, sym_name = "free", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (ptr)>, linkage = #llvm.linkage<external>, sym_name = "parallel_op_dealloc", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg3: !llvm.ptr):
    "omp.parallel"(%arg3) <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 1, 0>, private_syms = [@x.privatizer]}> ({
    ^bb0(%arg4: !llvm.ptr):
      %4 = "llvm.load"(%arg4) <{ordering = 0 : i64}> : (!llvm.ptr) -> f32
      "omp.terminator"() : () -> ()
    }) : (!llvm.ptr) -> ()
    "llvm.return"() : () -> ()
  }) : () -> ()
  "omp.private"() <{data_sharing_type = #omp<data_sharing_type{type = firstprivate}>, sym_name = "x.privatizer", type = f32}> ({
  }, {
  ^bb0(%arg1: !llvm.ptr, %arg2: !llvm.ptr):
    %3 = "llvm.load"(%arg1) <{ordering = 0 : i64}> : (!llvm.ptr) -> f32
    "llvm.store"(%3, %arg2) <{ordering = 0 : i64}> : (f32, !llvm.ptr) -> ()
    "omp.yield"(%arg2) : (!llvm.ptr) -> ()
  }, {
  ^bb0(%arg0: !llvm.ptr):
    %0 = "llvm.ptrtoint"(%arg0) : (!llvm.ptr) -> i64
    %1 = "llvm.mlir.constant"() <{value = 0 : i64}> : () -> i64
    %2 = "llvm.icmp"(%0, %1) <{predicate = 1 : i64}> : (i64, i64) -> i1
    "llvm.cond_br"(%2)[^bb1, ^bb2] <{operandSegmentSizes = array<i32: 1, 0, 0>}> : (i1) -> ()
  ^bb1:  // pred: ^bb0
    "llvm.call"(%arg0) <{CConv = #llvm.cconv<ccc>, TailCallKind = #llvm.tailcallkind<none>, callee = @free, fastmathFlags = #llvm.fastmath<none>, op_bundle_sizes = array<i32>, operandSegmentSizes = array<i32: 1, 0>}> : (!llvm.ptr) -> ()
    "llvm.br"()[^bb2] : () -> ()
  ^bb2:  // 2 preds: ^bb0, ^bb1
    "omp.yield"() : () -> ()
  }) : () -> ()
}) : () -> ()

