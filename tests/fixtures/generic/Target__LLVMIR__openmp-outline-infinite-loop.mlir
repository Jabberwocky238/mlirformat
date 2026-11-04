"builtin.module"() ({
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void ()>, linkage = #llvm.linkage<external>, sym_name = "parallel_infinite_loop", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
    "omp.parallel"() <{operandSegmentSizes = array<i32: 0, 0, 0, 0, 0, 0>}> ({
      "llvm.br"()[^bb1] : () -> ()
    ^bb1:  // 2 preds: ^bb0, ^bb1
      "llvm.br"()[^bb1] : () -> ()
    }) : () -> ()
    "llvm.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

