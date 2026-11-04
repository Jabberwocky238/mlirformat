"builtin.module"() ({
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (ptr, i32)>, linkage = #llvm.linkage<external>, sym_name = "mbarrier_arrive_drop_expect_tx_generic", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg4: !llvm.ptr, %arg5: i32):
    %6 = "nvvm.mbarrier.arrive_drop.expect_tx"(%arg4, %arg5) <{relaxed = false, scope = #nvvm.mem_scope<cta>}> : (!llvm.ptr, i32) -> i64
    %7 = "nvvm.mbarrier.arrive_drop.expect_tx"(%arg4, %arg5) <{relaxed = false, scope = #nvvm.mem_scope<cta>}> : (!llvm.ptr, i32) -> i64
    %8 = "nvvm.mbarrier.arrive_drop.expect_tx"(%arg4, %arg5) <{relaxed = false, scope = #nvvm.mem_scope<cluster>}> : (!llvm.ptr, i32) -> i64
    %9 = "nvvm.mbarrier.arrive_drop.expect_tx"(%arg4, %arg5) <{relaxed = true, scope = #nvvm.mem_scope<cta>}> : (!llvm.ptr, i32) -> i64
    %10 = "nvvm.mbarrier.arrive_drop.expect_tx"(%arg4, %arg5) <{relaxed = true, scope = #nvvm.mem_scope<cta>}> : (!llvm.ptr, i32) -> i64
    %11 = "nvvm.mbarrier.arrive_drop.expect_tx"(%arg4, %arg5) <{relaxed = true, scope = #nvvm.mem_scope<cluster>}> : (!llvm.ptr, i32) -> i64
    "llvm.return"() : () -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (ptr<3>, i32)>, linkage = #llvm.linkage<external>, sym_name = "mbarrier_arrive_drop_expect_tx_shared", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg2: !llvm.ptr<3>, %arg3: i32):
    %0 = "nvvm.mbarrier.arrive_drop.expect_tx"(%arg2, %arg3) <{relaxed = false, scope = #nvvm.mem_scope<cta>}> : (!llvm.ptr<3>, i32) -> i64
    %1 = "nvvm.mbarrier.arrive_drop.expect_tx"(%arg2, %arg3) <{relaxed = false, scope = #nvvm.mem_scope<cta>}> : (!llvm.ptr<3>, i32) -> i64
    %2 = "nvvm.mbarrier.arrive_drop.expect_tx"(%arg2, %arg3) <{relaxed = false, scope = #nvvm.mem_scope<cluster>}> : (!llvm.ptr<3>, i32) -> i64
    %3 = "nvvm.mbarrier.arrive_drop.expect_tx"(%arg2, %arg3) <{relaxed = true, scope = #nvvm.mem_scope<cta>}> : (!llvm.ptr<3>, i32) -> i64
    %4 = "nvvm.mbarrier.arrive_drop.expect_tx"(%arg2, %arg3) <{relaxed = true, scope = #nvvm.mem_scope<cta>}> : (!llvm.ptr<3>, i32) -> i64
    %5 = "nvvm.mbarrier.arrive_drop.expect_tx"(%arg2, %arg3) <{relaxed = true, scope = #nvvm.mem_scope<cluster>}> : (!llvm.ptr<3>, i32) -> i64
    "llvm.return"() : () -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (ptr<7>, i32)>, linkage = #llvm.linkage<external>, sym_name = "mbarrier_arrive_drop_expect_tx_shared_cluster", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg0: !llvm.ptr<7>, %arg1: i32):
    "nvvm.mbarrier.arrive_drop.expect_tx"(%arg0, %arg1) <{relaxed = false, scope = #nvvm.mem_scope<cta>}> : (!llvm.ptr<7>, i32) -> ()
    "nvvm.mbarrier.arrive_drop.expect_tx"(%arg0, %arg1) <{relaxed = false, scope = #nvvm.mem_scope<cta>}> : (!llvm.ptr<7>, i32) -> ()
    "nvvm.mbarrier.arrive_drop.expect_tx"(%arg0, %arg1) <{relaxed = false, scope = #nvvm.mem_scope<cluster>}> : (!llvm.ptr<7>, i32) -> ()
    "nvvm.mbarrier.arrive_drop.expect_tx"(%arg0, %arg1) <{relaxed = true, scope = #nvvm.mem_scope<cta>}> : (!llvm.ptr<7>, i32) -> ()
    "nvvm.mbarrier.arrive_drop.expect_tx"(%arg0, %arg1) <{relaxed = true, scope = #nvvm.mem_scope<cta>}> : (!llvm.ptr<7>, i32) -> ()
    "nvvm.mbarrier.arrive_drop.expect_tx"(%arg0, %arg1) <{relaxed = true, scope = #nvvm.mem_scope<cluster>}> : (!llvm.ptr<7>, i32) -> ()
    "llvm.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

