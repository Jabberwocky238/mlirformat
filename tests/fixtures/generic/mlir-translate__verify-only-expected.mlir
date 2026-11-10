"builtin.module"() ({
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void ()>, linkage = #llvm.linkage<external>, sym_name = "trivial", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
    "simple.terminator1"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void ()>, linkage = #llvm.linkage<external>, sym_name = "trivial", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
    "simple.terminator3"() : () -> ()
  }) : () -> ()
}) : () -> ()

