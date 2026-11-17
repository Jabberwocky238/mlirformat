"builtin.module"() ({
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void ()>, linkage = #llvm.linkage<external>, sym_name = "memorybarrier", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
    "nvvm.memory.barrier"() <{scope = #nvvm.mem_scope<cta>}> : () -> () loc("<stdin>":3:5)
    "nvvm.memory.barrier"() <{scope = #nvvm.mem_scope<cluster>}> : () -> () loc("<stdin>":4:5)
    "nvvm.memory.barrier"() <{scope = #nvvm.mem_scope<gpu>}> : () -> () loc("<stdin>":5:5)
    "nvvm.memory.barrier"() <{scope = #nvvm.mem_scope<sys>}> : () -> () loc("<stdin>":6:5)
    "llvm.return"() : () -> () loc("<stdin>":7:5)
  }) : () -> () loc("<stdin>":2:3)
}) : () -> () loc("<stdin>":1:1)
