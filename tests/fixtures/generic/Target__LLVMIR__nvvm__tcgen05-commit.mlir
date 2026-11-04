"builtin.module"() ({
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (ptr, i16)>, linkage = #llvm.linkage<external>, sym_name = "llvm_nvvm_tcgen05_commit_generic", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg2: !llvm.ptr, %arg3: i16):
    "nvvm.tcgen05.commit"(%arg2) <{group = #nvvm.cta_group<cta_1>}> : (!llvm.ptr) -> ()
    "nvvm.tcgen05.commit"(%arg2) <{group = #nvvm.cta_group<cta_2>}> : (!llvm.ptr) -> ()
    "nvvm.tcgen05.commit"(%arg2, %arg3) <{group = #nvvm.cta_group<cta_1>}> : (!llvm.ptr, i16) -> ()
    "nvvm.tcgen05.commit"(%arg2, %arg3) <{group = #nvvm.cta_group<cta_2>}> : (!llvm.ptr, i16) -> ()
    "llvm.return"() : () -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (ptr<3>, i16)>, linkage = #llvm.linkage<external>, sym_name = "llvm_nvvm_tcgen05_commit_shared", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg0: !llvm.ptr<3>, %arg1: i16):
    "nvvm.tcgen05.commit"(%arg0) <{group = #nvvm.cta_group<cta_1>}> : (!llvm.ptr<3>) -> ()
    "nvvm.tcgen05.commit"(%arg0) <{group = #nvvm.cta_group<cta_2>}> : (!llvm.ptr<3>) -> ()
    "nvvm.tcgen05.commit"(%arg0, %arg1) <{group = #nvvm.cta_group<cta_1>}> : (!llvm.ptr<3>, i16) -> ()
    "nvvm.tcgen05.commit"(%arg0, %arg1) <{group = #nvvm.cta_group<cta_2>}> : (!llvm.ptr<3>, i16) -> ()
    "llvm.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

