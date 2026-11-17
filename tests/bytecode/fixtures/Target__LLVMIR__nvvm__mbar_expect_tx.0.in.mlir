"builtin.module"() ({
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (ptr<3>, i32)>, linkage = #llvm.linkage<external>, sym_name = "mbarrier_expect_tx_shared", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg2: !llvm.ptr<3> loc("<stdin>":3:8), %arg3: i32 loc("<stdin>":3:29)):
    "nvvm.mbarrier.expect_tx"(%arg2, %arg3) <{scope = #nvvm.mem_scope<cta>}> : (!llvm.ptr<3>, i32) -> () loc("<stdin>":4:5)
    "nvvm.mbarrier.expect_tx"(%arg2, %arg3) <{scope = #nvvm.mem_scope<cta>}> : (!llvm.ptr<3>, i32) -> () loc("<stdin>":5:5)
    "nvvm.mbarrier.expect_tx"(%arg2, %arg3) <{scope = #nvvm.mem_scope<cluster>}> : (!llvm.ptr<3>, i32) -> () loc("<stdin>":6:5)
    "llvm.return"() : () -> () loc("<stdin>":7:5)
  }) : () -> () loc("<stdin>":2:3)
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (ptr<7>, i32)>, linkage = #llvm.linkage<external>, sym_name = "mbarrier_expect_tx_shared_cluster", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg0: !llvm.ptr<7> loc("<stdin>":10:8), %arg1: i32 loc("<stdin>":10:29)):
    "nvvm.mbarrier.expect_tx"(%arg0, %arg1) <{scope = #nvvm.mem_scope<cta>}> : (!llvm.ptr<7>, i32) -> () loc("<stdin>":11:5)
    "nvvm.mbarrier.expect_tx"(%arg0, %arg1) <{scope = #nvvm.mem_scope<cta>}> : (!llvm.ptr<7>, i32) -> () loc("<stdin>":12:5)
    "nvvm.mbarrier.expect_tx"(%arg0, %arg1) <{scope = #nvvm.mem_scope<cluster>}> : (!llvm.ptr<7>, i32) -> () loc("<stdin>":13:5)
    "llvm.return"() : () -> () loc("<stdin>":14:5)
  }) : () -> () loc("<stdin>":9:3)
}) : () -> () loc("<stdin>":1:1)
