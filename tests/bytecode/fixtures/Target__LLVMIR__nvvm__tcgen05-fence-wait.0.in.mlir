"builtin.module"() ({
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void ()>, linkage = #llvm.linkage<external>, sym_name = "llvm_nvvm_tcgen05_fence", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
    "nvvm.tcgen05.fence"() <{kind = #nvvm.tcgen05_fence<before>}> : () -> () loc("<stdin>":3:5)
    "nvvm.tcgen05.fence"() <{kind = #nvvm.tcgen05_fence<after>}> : () -> () loc("<stdin>":4:5)
    "llvm.return"() : () -> () loc("<stdin>":5:5)
  }) : () -> () loc("<stdin>":2:3)
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void ()>, linkage = #llvm.linkage<external>, sym_name = "llvm_nvvm_tcgen05_wait", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
    "nvvm.tcgen05.wait"() <{kind = #nvvm.tcgen05_wait<load>}> : () -> () loc("<stdin>":8:5)
    "nvvm.tcgen05.wait"() <{kind = #nvvm.tcgen05_wait<store>}> : () -> () loc("<stdin>":9:5)
    "llvm.return"() : () -> () loc("<stdin>":10:5)
  }) : () -> () loc("<stdin>":7:3)
}) : () -> () loc("<stdin>":1:1)
