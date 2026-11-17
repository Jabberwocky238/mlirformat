"builtin.module"() ({
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (ptr, i32)>, linkage = #llvm.linkage<external>, sym_name = "mbarrier_arrive_expect_tx_generic", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg4: !llvm.ptr loc("<stdin>":3:8), %arg5: i32 loc("<stdin>":3:26)):
    %6 = "nvvm.mbarrier.arrive.expect_tx"(%arg4, %arg5) <{relaxed = false, scope = #nvvm.mem_scope<cta>}> : (!llvm.ptr, i32) -> i64 loc("<stdin>":4:10)
    %7 = "nvvm.mbarrier.arrive.expect_tx"(%arg4, %arg5) <{relaxed = false, scope = #nvvm.mem_scope<cta>}> : (!llvm.ptr, i32) -> i64 loc("<stdin>":5:10)
    %8 = "nvvm.mbarrier.arrive.expect_tx"(%arg4, %arg5) <{relaxed = false, scope = #nvvm.mem_scope<cluster>}> : (!llvm.ptr, i32) -> i64 loc("<stdin>":6:10)
    %9 = "nvvm.mbarrier.arrive.expect_tx"(%arg4, %arg5) <{relaxed = true, scope = #nvvm.mem_scope<cta>}> : (!llvm.ptr, i32) -> i64 loc("<stdin>":7:10)
    %10 = "nvvm.mbarrier.arrive.expect_tx"(%arg4, %arg5) <{relaxed = true, scope = #nvvm.mem_scope<cta>}> : (!llvm.ptr, i32) -> i64 loc("<stdin>":8:11)
    %11 = "nvvm.mbarrier.arrive.expect_tx"(%arg4, %arg5) <{relaxed = true, scope = #nvvm.mem_scope<cluster>}> : (!llvm.ptr, i32) -> i64 loc("<stdin>":9:11)
    "llvm.return"() : () -> () loc("<stdin>":10:5)
  }) : () -> () loc("<stdin>":2:3)
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (ptr<3>, i32)>, linkage = #llvm.linkage<external>, sym_name = "mbarrier_arrive_expect_tx_shared", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg2: !llvm.ptr<3> loc("<stdin>":13:8), %arg3: i32 loc("<stdin>":13:29)):
    %0 = "nvvm.mbarrier.arrive.expect_tx"(%arg2, %arg3) <{relaxed = false, scope = #nvvm.mem_scope<cta>}> : (!llvm.ptr<3>, i32) -> i64 loc("<stdin>":14:10)
    %1 = "nvvm.mbarrier.arrive.expect_tx"(%arg2, %arg3) <{relaxed = false, scope = #nvvm.mem_scope<cta>}> : (!llvm.ptr<3>, i32) -> i64 loc("<stdin>":15:10)
    %2 = "nvvm.mbarrier.arrive.expect_tx"(%arg2, %arg3) <{relaxed = false, scope = #nvvm.mem_scope<cluster>}> : (!llvm.ptr<3>, i32) -> i64 loc("<stdin>":16:10)
    %3 = "nvvm.mbarrier.arrive.expect_tx"(%arg2, %arg3) <{relaxed = true, scope = #nvvm.mem_scope<cta>}> : (!llvm.ptr<3>, i32) -> i64 loc("<stdin>":17:10)
    %4 = "nvvm.mbarrier.arrive.expect_tx"(%arg2, %arg3) <{relaxed = true, scope = #nvvm.mem_scope<cta>}> : (!llvm.ptr<3>, i32) -> i64 loc("<stdin>":18:10)
    %5 = "nvvm.mbarrier.arrive.expect_tx"(%arg2, %arg3) <{relaxed = true, scope = #nvvm.mem_scope<cluster>}> : (!llvm.ptr<3>, i32) -> i64 loc("<stdin>":19:10)
    "llvm.return"() : () -> () loc("<stdin>":20:5)
  }) : () -> () loc("<stdin>":12:3)
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (ptr<7>, i32)>, linkage = #llvm.linkage<external>, sym_name = "mbarrier_arrive_expect_tx_shared_cluster", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg0: !llvm.ptr<7> loc("<stdin>":23:8), %arg1: i32 loc("<stdin>":23:29)):
    "nvvm.mbarrier.arrive.expect_tx"(%arg0, %arg1) <{relaxed = false, scope = #nvvm.mem_scope<cta>}> : (!llvm.ptr<7>, i32) -> () loc("<stdin>":24:5)
    "nvvm.mbarrier.arrive.expect_tx"(%arg0, %arg1) <{relaxed = false, scope = #nvvm.mem_scope<cta>}> : (!llvm.ptr<7>, i32) -> () loc("<stdin>":25:5)
    "nvvm.mbarrier.arrive.expect_tx"(%arg0, %arg1) <{relaxed = false, scope = #nvvm.mem_scope<cluster>}> : (!llvm.ptr<7>, i32) -> () loc("<stdin>":26:5)
    "nvvm.mbarrier.arrive.expect_tx"(%arg0, %arg1) <{relaxed = true, scope = #nvvm.mem_scope<cta>}> : (!llvm.ptr<7>, i32) -> () loc("<stdin>":27:5)
    "nvvm.mbarrier.arrive.expect_tx"(%arg0, %arg1) <{relaxed = true, scope = #nvvm.mem_scope<cta>}> : (!llvm.ptr<7>, i32) -> () loc("<stdin>":28:5)
    "nvvm.mbarrier.arrive.expect_tx"(%arg0, %arg1) <{relaxed = true, scope = #nvvm.mem_scope<cluster>}> : (!llvm.ptr<7>, i32) -> () loc("<stdin>":29:5)
    "llvm.return"() : () -> () loc("<stdin>":30:5)
  }) : () -> () loc("<stdin>":22:3)
}) : () -> () loc("<stdin>":1:1)
