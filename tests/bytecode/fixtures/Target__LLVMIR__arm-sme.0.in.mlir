"builtin.module"() ({
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void ()>, linkage = #llvm.linkage<external>, sym_name = "arm_sme_zero", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
    "arm_sme.intr.zero"() <{tile_mask = 0 : i32}> : () -> () loc("<stdin>":3:5)
    "llvm.return"() : () -> () loc("<stdin>":4:5)
  }) : () -> () loc("<stdin>":2:3)
}) : () -> () loc("<stdin>":1:1)
