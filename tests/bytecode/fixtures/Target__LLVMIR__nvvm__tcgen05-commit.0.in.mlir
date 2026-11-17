"builtin.module"() ({
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (ptr, i16)>, linkage = #llvm.linkage<external>, sym_name = "llvm_nvvm_tcgen05_commit_generic", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg2: !llvm.ptr loc("<stdin>":3:8), %arg3: i16 loc("<stdin>":3:26)):
    "nvvm.tcgen05.commit"(%arg2) <{group = #nvvm.cta_group<cta_1>}> : (!llvm.ptr) -> () loc("<stdin>":4:5)
    "nvvm.tcgen05.commit"(%arg2) <{group = #nvvm.cta_group<cta_2>}> : (!llvm.ptr) -> () loc("<stdin>":5:5)
    "nvvm.tcgen05.commit"(%arg2, %arg3) <{group = #nvvm.cta_group<cta_1>}> : (!llvm.ptr, i16) -> () loc("<stdin>":6:5)
    "nvvm.tcgen05.commit"(%arg2, %arg3) <{group = #nvvm.cta_group<cta_2>}> : (!llvm.ptr, i16) -> () loc("<stdin>":7:5)
    "llvm.return"() : () -> () loc("<stdin>":8:5)
  }) : () -> () loc("<stdin>":2:3)
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (ptr<3>, i16)>, linkage = #llvm.linkage<external>, sym_name = "llvm_nvvm_tcgen05_commit_shared", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg0: !llvm.ptr<3> loc("<stdin>":11:8), %arg1: i16 loc("<stdin>":11:29)):
    "nvvm.tcgen05.commit"(%arg0) <{group = #nvvm.cta_group<cta_1>}> : (!llvm.ptr<3>) -> () loc("<stdin>":12:5)
    "nvvm.tcgen05.commit"(%arg0) <{group = #nvvm.cta_group<cta_2>}> : (!llvm.ptr<3>) -> () loc("<stdin>":13:5)
    "nvvm.tcgen05.commit"(%arg0, %arg1) <{group = #nvvm.cta_group<cta_1>}> : (!llvm.ptr<3>, i16) -> () loc("<stdin>":14:5)
    "nvvm.tcgen05.commit"(%arg0, %arg1) <{group = #nvvm.cta_group<cta_2>}> : (!llvm.ptr<3>, i16) -> () loc("<stdin>":15:5)
    "llvm.return"() : () -> () loc("<stdin>":16:5)
  }) : () -> () loc("<stdin>":10:3)
}) : () -> () loc("<stdin>":1:1)
