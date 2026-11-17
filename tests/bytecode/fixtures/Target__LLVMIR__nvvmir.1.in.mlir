"builtin.module"() ({
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void ()>, linkage = #llvm.linkage<external>, sym_name = "kernel_func", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
    "llvm.return"() : () -> () loc("<stdin>":4:5)
  }) {nvvm.kernel, nvvm.maxntid = array<i32: 1, 23, 32>} : () -> () loc("<stdin>":3:3)
}) : () -> () loc("<stdin>":2:1)
