"builtin.module"() ({
  "llvm.module_flags"() <{flags = [#rocdl.buffer_oob_mode_flag<any>, #rocdl.tbuffer_oob_mode_flag<relaxed>]}> : () -> () loc("<stdin>":2:3)
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void ()>, linkage = #llvm.linkage<external>, sym_name = "oob_any_relaxed", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
    "llvm.return"() : () -> () loc("<stdin>":4:5)
  }) : () -> () loc("<stdin>":3:3)
}) : () -> () loc("<stdin>":1:1)
