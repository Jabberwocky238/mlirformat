"builtin.module"() ({
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (ptr, i64)>, linkage = #llvm.linkage<external>, sym_name = "mbarrier_test_wait_state", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg6: !llvm.ptr, %arg7: i64):
    %12 = "nvvm.mbarrier.test.wait"(%arg6, %arg7) <{relaxed = false, scope = #nvvm.mem_scope<cta>}> : (!llvm.ptr, i64) -> i1
    %13 = "nvvm.mbarrier.test.wait"(%arg6, %arg7) <{relaxed = false, scope = #nvvm.mem_scope<cluster>}> : (!llvm.ptr, i64) -> i1
    %14 = "nvvm.mbarrier.test.wait"(%arg6, %arg7) <{relaxed = true, scope = #nvvm.mem_scope<cta>}> : (!llvm.ptr, i64) -> i1
    %15 = "nvvm.mbarrier.test.wait"(%arg6, %arg7) <{relaxed = true, scope = #nvvm.mem_scope<cluster>}> : (!llvm.ptr, i64) -> i1
    "llvm.return"() : () -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (ptr<3>, i64)>, linkage = #llvm.linkage<external>, sym_name = "mbarrier_test_wait_shared_state", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg4: !llvm.ptr<3>, %arg5: i64):
    %8 = "nvvm.mbarrier.test.wait"(%arg4, %arg5) <{relaxed = false, scope = #nvvm.mem_scope<cta>}> : (!llvm.ptr<3>, i64) -> i1
    %9 = "nvvm.mbarrier.test.wait"(%arg4, %arg5) <{relaxed = false, scope = #nvvm.mem_scope<cluster>}> : (!llvm.ptr<3>, i64) -> i1
    %10 = "nvvm.mbarrier.test.wait"(%arg4, %arg5) <{relaxed = true, scope = #nvvm.mem_scope<cta>}> : (!llvm.ptr<3>, i64) -> i1
    %11 = "nvvm.mbarrier.test.wait"(%arg4, %arg5) <{relaxed = true, scope = #nvvm.mem_scope<cluster>}> : (!llvm.ptr<3>, i64) -> i1
    "llvm.return"() : () -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (ptr, i32)>, linkage = #llvm.linkage<external>, sym_name = "mbarrier_test_wait_phase", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg2: !llvm.ptr, %arg3: i32):
    %4 = "nvvm.mbarrier.test.wait"(%arg2, %arg3) <{relaxed = false, scope = #nvvm.mem_scope<cta>}> : (!llvm.ptr, i32) -> i1
    %5 = "nvvm.mbarrier.test.wait"(%arg2, %arg3) <{relaxed = false, scope = #nvvm.mem_scope<cluster>}> : (!llvm.ptr, i32) -> i1
    %6 = "nvvm.mbarrier.test.wait"(%arg2, %arg3) <{relaxed = true, scope = #nvvm.mem_scope<cta>}> : (!llvm.ptr, i32) -> i1
    %7 = "nvvm.mbarrier.test.wait"(%arg2, %arg3) <{relaxed = true, scope = #nvvm.mem_scope<cluster>}> : (!llvm.ptr, i32) -> i1
    "llvm.return"() : () -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (ptr<3>, i32)>, linkage = #llvm.linkage<external>, sym_name = "mbarrier_test_wait_shared_phase", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg0: !llvm.ptr<3>, %arg1: i32):
    %0 = "nvvm.mbarrier.test.wait"(%arg0, %arg1) <{relaxed = false, scope = #nvvm.mem_scope<cta>}> : (!llvm.ptr<3>, i32) -> i1
    %1 = "nvvm.mbarrier.test.wait"(%arg0, %arg1) <{relaxed = false, scope = #nvvm.mem_scope<cluster>}> : (!llvm.ptr<3>, i32) -> i1
    %2 = "nvvm.mbarrier.test.wait"(%arg0, %arg1) <{relaxed = true, scope = #nvvm.mem_scope<cta>}> : (!llvm.ptr<3>, i32) -> i1
    %3 = "nvvm.mbarrier.test.wait"(%arg0, %arg1) <{relaxed = true, scope = #nvvm.mem_scope<cluster>}> : (!llvm.ptr<3>, i32) -> i1
    "llvm.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

