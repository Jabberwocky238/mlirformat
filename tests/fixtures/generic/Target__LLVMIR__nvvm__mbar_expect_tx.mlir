"builtin.module"() ({
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (ptr<3>, i32)>, linkage = #llvm.linkage<external>, sym_name = "mbarrier_expect_tx_shared", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg2: !llvm.ptr<3>, %arg3: i32):
    "nvvm.mbarrier.expect_tx"(%arg2, %arg3) <{scope = #nvvm.mem_scope<cta>}> : (!llvm.ptr<3>, i32) -> ()
    "nvvm.mbarrier.expect_tx"(%arg2, %arg3) <{scope = #nvvm.mem_scope<cta>}> : (!llvm.ptr<3>, i32) -> ()
    "nvvm.mbarrier.expect_tx"(%arg2, %arg3) <{scope = #nvvm.mem_scope<cluster>}> : (!llvm.ptr<3>, i32) -> ()
    "llvm.return"() : () -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (ptr<7>, i32)>, linkage = #llvm.linkage<external>, sym_name = "mbarrier_expect_tx_shared_cluster", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg0: !llvm.ptr<7>, %arg1: i32):
    "nvvm.mbarrier.expect_tx"(%arg0, %arg1) <{scope = #nvvm.mem_scope<cta>}> : (!llvm.ptr<7>, i32) -> ()
    "nvvm.mbarrier.expect_tx"(%arg0, %arg1) <{scope = #nvvm.mem_scope<cta>}> : (!llvm.ptr<7>, i32) -> ()
    "nvvm.mbarrier.expect_tx"(%arg0, %arg1) <{scope = #nvvm.mem_scope<cluster>}> : (!llvm.ptr<7>, i32) -> ()
    "llvm.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

