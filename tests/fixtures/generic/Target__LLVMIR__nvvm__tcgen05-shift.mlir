"builtin.module"() ({
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (ptr<6>)>, linkage = #llvm.linkage<external>, sym_name = "llvm_nvvm_tcgen05_shift", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg0: !llvm.ptr<6>):
    "nvvm.tcgen05.shift"(%arg0) <{group = #nvvm.cta_group<cta_1>}> : (!llvm.ptr<6>) -> ()
    "nvvm.tcgen05.shift"(%arg0) <{group = #nvvm.cta_group<cta_2>}> : (!llvm.ptr<6>) -> ()
    "llvm.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

