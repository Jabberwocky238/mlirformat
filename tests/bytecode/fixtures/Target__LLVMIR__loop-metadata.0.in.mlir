"builtin.module"() ({
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void ()>, linkage = #llvm.linkage<external>, sym_name = "disableNonForced", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
    "llvm.br"()[^bb1] <{loop_annotation = #llvm.loop_annotation<disableNonforced = true>}> : () -> () loc("<stdin>":4:5)
  ^bb1:  // pred: ^bb0
    "llvm.return"() : () -> () loc("<stdin>":6:5)
  }) : () -> () loc("<stdin>":3:3)
}) : () -> () loc("<stdin>":2:1)
