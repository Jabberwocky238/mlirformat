"builtin.module"() ({
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (ptr, i32)>, linkage = #llvm.linkage<external>, sym_name = "llvm_nvvm_tcgen05_alloc", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg4: !llvm.ptr loc("<stdin>":3:8), %arg5: i32 loc("<stdin>":3:26)):
    "nvvm.tcgen05.alloc"(%arg4, %arg5) <{group = #nvvm.cta_group<cta_1>}> : (!llvm.ptr, i32) -> () loc("<stdin>":4:5)
    "nvvm.tcgen05.alloc"(%arg4, %arg5) <{group = #nvvm.cta_group<cta_2>}> : (!llvm.ptr, i32) -> () loc("<stdin>":5:5)
    "llvm.return"() : () -> () loc("<stdin>":6:5)
  }) : () -> () loc("<stdin>":2:3)
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (ptr<3>, i32)>, linkage = #llvm.linkage<external>, sym_name = "llvm_nvvm_tcgen05_alloc_shared", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg2: !llvm.ptr<3> loc("<stdin>":9:8), %arg3: i32 loc("<stdin>":9:29)):
    "nvvm.tcgen05.alloc"(%arg2, %arg3) <{group = #nvvm.cta_group<cta_1>}> : (!llvm.ptr<3>, i32) -> () loc("<stdin>":10:5)
    "nvvm.tcgen05.alloc"(%arg2, %arg3) <{group = #nvvm.cta_group<cta_2>}> : (!llvm.ptr<3>, i32) -> () loc("<stdin>":11:5)
    "llvm.return"() : () -> () loc("<stdin>":12:5)
  }) : () -> () loc("<stdin>":8:3)
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (ptr<6>, i32)>, linkage = #llvm.linkage<external>, sym_name = "llvm_nvvm_tcgen05_dealloc", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg0: !llvm.ptr<6> loc("<stdin>":15:8), %arg1: i32 loc("<stdin>":15:29)):
    "nvvm.tcgen05.dealloc"(%arg0, %arg1) <{group = #nvvm.cta_group<cta_1>}> : (!llvm.ptr<6>, i32) -> () loc("<stdin>":16:5)
    "nvvm.tcgen05.dealloc"(%arg0, %arg1) <{group = #nvvm.cta_group<cta_2>}> : (!llvm.ptr<6>, i32) -> () loc("<stdin>":17:5)
    "llvm.return"() : () -> () loc("<stdin>":18:5)
  }) : () -> () loc("<stdin>":14:3)
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void ()>, linkage = #llvm.linkage<external>, sym_name = "llvm_nvvm_tcgen05_relinquish_alloc_permit", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
    "nvvm.tcgen05.relinquish_alloc_permit"() <{group = #nvvm.cta_group<cta_1>}> : () -> () loc("<stdin>":21:5)
    "nvvm.tcgen05.relinquish_alloc_permit"() <{group = #nvvm.cta_group<cta_2>}> : () -> () loc("<stdin>":22:5)
    "llvm.return"() : () -> () loc("<stdin>":23:5)
  }) : () -> () loc("<stdin>":20:3)
}) : () -> () loc("<stdin>":1:1)
