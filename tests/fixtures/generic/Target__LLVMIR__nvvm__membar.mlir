"builtin.module"() ({
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void ()>, linkage = #llvm.linkage<external>, sym_name = "memorybarrier", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
    "nvvm.memory.barrier"() <{scope = #nvvm.mem_scope<cta>}> : () -> ()
    "nvvm.memory.barrier"() <{scope = #nvvm.mem_scope<cluster>}> : () -> ()
    "nvvm.memory.barrier"() <{scope = #nvvm.mem_scope<gpu>}> : () -> ()
    "nvvm.memory.barrier"() <{scope = #nvvm.mem_scope<sys>}> : () -> ()
    "llvm.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

