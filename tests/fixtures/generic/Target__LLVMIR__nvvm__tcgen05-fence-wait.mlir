"builtin.module"() ({
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void ()>, linkage = #llvm.linkage<external>, sym_name = "llvm_nvvm_tcgen05_fence", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
    "nvvm.tcgen05.fence"() <{kind = #nvvm.tcgen05_fence<before>}> : () -> ()
    "nvvm.tcgen05.fence"() <{kind = #nvvm.tcgen05_fence<after>}> : () -> ()
    "llvm.return"() : () -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void ()>, linkage = #llvm.linkage<external>, sym_name = "llvm_nvvm_tcgen05_wait", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
    "nvvm.tcgen05.wait"() <{kind = #nvvm.tcgen05_wait<load>}> : () -> ()
    "nvvm.tcgen05.wait"() <{kind = #nvvm.tcgen05_wait<store>}> : () -> ()
    "llvm.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

