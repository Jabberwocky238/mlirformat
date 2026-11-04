"builtin.module"() ({
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (ptr, i32)>, linkage = #llvm.linkage<external>, sym_name = "llvm_nvvm_tcgen05_alloc", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg4: !llvm.ptr, %arg5: i32):
    "nvvm.tcgen05.alloc"(%arg4, %arg5) <{group = #nvvm.cta_group<cta_1>}> : (!llvm.ptr, i32) -> ()
    "nvvm.tcgen05.alloc"(%arg4, %arg5) <{group = #nvvm.cta_group<cta_2>}> : (!llvm.ptr, i32) -> ()
    "llvm.return"() : () -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (ptr<3>, i32)>, linkage = #llvm.linkage<external>, sym_name = "llvm_nvvm_tcgen05_alloc_shared", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg2: !llvm.ptr<3>, %arg3: i32):
    "nvvm.tcgen05.alloc"(%arg2, %arg3) <{group = #nvvm.cta_group<cta_1>}> : (!llvm.ptr<3>, i32) -> ()
    "nvvm.tcgen05.alloc"(%arg2, %arg3) <{group = #nvvm.cta_group<cta_2>}> : (!llvm.ptr<3>, i32) -> ()
    "llvm.return"() : () -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (ptr<6>, i32)>, linkage = #llvm.linkage<external>, sym_name = "llvm_nvvm_tcgen05_dealloc", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg0: !llvm.ptr<6>, %arg1: i32):
    "nvvm.tcgen05.dealloc"(%arg0, %arg1) <{group = #nvvm.cta_group<cta_1>}> : (!llvm.ptr<6>, i32) -> ()
    "nvvm.tcgen05.dealloc"(%arg0, %arg1) <{group = #nvvm.cta_group<cta_2>}> : (!llvm.ptr<6>, i32) -> ()
    "llvm.return"() : () -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void ()>, linkage = #llvm.linkage<external>, sym_name = "llvm_nvvm_tcgen05_relinquish_alloc_permit", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
    "nvvm.tcgen05.relinquish_alloc_permit"() <{group = #nvvm.cta_group<cta_1>}> : () -> ()
    "nvvm.tcgen05.relinquish_alloc_permit"() <{group = #nvvm.cta_group<cta_2>}> : () -> ()
    "llvm.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

