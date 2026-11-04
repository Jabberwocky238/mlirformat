"builtin.module"() ({
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (ptr, i64)>, linkage = #llvm.linkage<external>, sym_name = "mbarrier_try_wait_state", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg18: !llvm.ptr, %arg19: i64):
    %28 = "nvvm.mbarrier.try_wait"(%arg18, %arg19) <{relaxed = false, scope = #nvvm.mem_scope<cta>}> : (!llvm.ptr, i64) -> i1
    %29 = "nvvm.mbarrier.try_wait"(%arg18, %arg19) <{relaxed = false, scope = #nvvm.mem_scope<cluster>}> : (!llvm.ptr, i64) -> i1
    %30 = "nvvm.mbarrier.try_wait"(%arg18, %arg19) <{relaxed = true, scope = #nvvm.mem_scope<cta>}> : (!llvm.ptr, i64) -> i1
    %31 = "nvvm.mbarrier.try_wait"(%arg18, %arg19) <{relaxed = true, scope = #nvvm.mem_scope<cluster>}> : (!llvm.ptr, i64) -> i1
    "llvm.return"() : () -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (ptr, i64, i32)>, linkage = #llvm.linkage<external>, sym_name = "mbarrier_try_wait_state_with_timelimit", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg15: !llvm.ptr, %arg16: i64, %arg17: i32):
    %24 = "nvvm.mbarrier.try_wait"(%arg15, %arg16, %arg17) <{relaxed = false, scope = #nvvm.mem_scope<cta>}> : (!llvm.ptr, i64, i32) -> i1
    %25 = "nvvm.mbarrier.try_wait"(%arg15, %arg16, %arg17) <{relaxed = false, scope = #nvvm.mem_scope<cluster>}> : (!llvm.ptr, i64, i32) -> i1
    %26 = "nvvm.mbarrier.try_wait"(%arg15, %arg16, %arg17) <{relaxed = true, scope = #nvvm.mem_scope<cta>}> : (!llvm.ptr, i64, i32) -> i1
    %27 = "nvvm.mbarrier.try_wait"(%arg15, %arg16, %arg17) <{relaxed = true, scope = #nvvm.mem_scope<cluster>}> : (!llvm.ptr, i64, i32) -> i1
    "llvm.return"() : () -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (ptr<3>, i64)>, linkage = #llvm.linkage<external>, sym_name = "mbarrier_try_wait_shared_state", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg13: !llvm.ptr<3>, %arg14: i64):
    %20 = "nvvm.mbarrier.try_wait"(%arg13, %arg14) <{relaxed = false, scope = #nvvm.mem_scope<cta>}> : (!llvm.ptr<3>, i64) -> i1
    %21 = "nvvm.mbarrier.try_wait"(%arg13, %arg14) <{relaxed = false, scope = #nvvm.mem_scope<cluster>}> : (!llvm.ptr<3>, i64) -> i1
    %22 = "nvvm.mbarrier.try_wait"(%arg13, %arg14) <{relaxed = true, scope = #nvvm.mem_scope<cta>}> : (!llvm.ptr<3>, i64) -> i1
    %23 = "nvvm.mbarrier.try_wait"(%arg13, %arg14) <{relaxed = true, scope = #nvvm.mem_scope<cluster>}> : (!llvm.ptr<3>, i64) -> i1
    "llvm.return"() : () -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (ptr<3>, i64, i32)>, linkage = #llvm.linkage<external>, sym_name = "mbarrier_try_wait_shared_state_with_timelimit", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg10: !llvm.ptr<3>, %arg11: i64, %arg12: i32):
    %16 = "nvvm.mbarrier.try_wait"(%arg10, %arg11, %arg12) <{relaxed = false, scope = #nvvm.mem_scope<cta>}> : (!llvm.ptr<3>, i64, i32) -> i1
    %17 = "nvvm.mbarrier.try_wait"(%arg10, %arg11, %arg12) <{relaxed = false, scope = #nvvm.mem_scope<cluster>}> : (!llvm.ptr<3>, i64, i32) -> i1
    %18 = "nvvm.mbarrier.try_wait"(%arg10, %arg11, %arg12) <{relaxed = true, scope = #nvvm.mem_scope<cta>}> : (!llvm.ptr<3>, i64, i32) -> i1
    %19 = "nvvm.mbarrier.try_wait"(%arg10, %arg11, %arg12) <{relaxed = true, scope = #nvvm.mem_scope<cluster>}> : (!llvm.ptr<3>, i64, i32) -> i1
    "llvm.return"() : () -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (ptr, i32)>, linkage = #llvm.linkage<external>, sym_name = "mbarrier_try_wait_phase", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg8: !llvm.ptr, %arg9: i32):
    %12 = "nvvm.mbarrier.try_wait"(%arg8, %arg9) <{relaxed = false, scope = #nvvm.mem_scope<cta>}> : (!llvm.ptr, i32) -> i1
    %13 = "nvvm.mbarrier.try_wait"(%arg8, %arg9) <{relaxed = false, scope = #nvvm.mem_scope<cluster>}> : (!llvm.ptr, i32) -> i1
    %14 = "nvvm.mbarrier.try_wait"(%arg8, %arg9) <{relaxed = true, scope = #nvvm.mem_scope<cta>}> : (!llvm.ptr, i32) -> i1
    %15 = "nvvm.mbarrier.try_wait"(%arg8, %arg9) <{relaxed = true, scope = #nvvm.mem_scope<cluster>}> : (!llvm.ptr, i32) -> i1
    "llvm.return"() : () -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (ptr, i32, i32)>, linkage = #llvm.linkage<external>, sym_name = "mbarrier_try_wait_phase_with_timelimit", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg5: !llvm.ptr, %arg6: i32, %arg7: i32):
    %8 = "nvvm.mbarrier.try_wait"(%arg5, %arg6, %arg7) <{relaxed = false, scope = #nvvm.mem_scope<cta>}> : (!llvm.ptr, i32, i32) -> i1
    %9 = "nvvm.mbarrier.try_wait"(%arg5, %arg6, %arg7) <{relaxed = false, scope = #nvvm.mem_scope<cluster>}> : (!llvm.ptr, i32, i32) -> i1
    %10 = "nvvm.mbarrier.try_wait"(%arg5, %arg6, %arg7) <{relaxed = true, scope = #nvvm.mem_scope<cta>}> : (!llvm.ptr, i32, i32) -> i1
    %11 = "nvvm.mbarrier.try_wait"(%arg5, %arg6, %arg7) <{relaxed = true, scope = #nvvm.mem_scope<cluster>}> : (!llvm.ptr, i32, i32) -> i1
    "llvm.return"() : () -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (ptr<3>, i32)>, linkage = #llvm.linkage<external>, sym_name = "mbarrier_try_wait_shared_phase", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg3: !llvm.ptr<3>, %arg4: i32):
    %4 = "nvvm.mbarrier.try_wait"(%arg3, %arg4) <{relaxed = false, scope = #nvvm.mem_scope<cta>}> : (!llvm.ptr<3>, i32) -> i1
    %5 = "nvvm.mbarrier.try_wait"(%arg3, %arg4) <{relaxed = false, scope = #nvvm.mem_scope<cluster>}> : (!llvm.ptr<3>, i32) -> i1
    %6 = "nvvm.mbarrier.try_wait"(%arg3, %arg4) <{relaxed = true, scope = #nvvm.mem_scope<cta>}> : (!llvm.ptr<3>, i32) -> i1
    %7 = "nvvm.mbarrier.try_wait"(%arg3, %arg4) <{relaxed = true, scope = #nvvm.mem_scope<cluster>}> : (!llvm.ptr<3>, i32) -> i1
    "llvm.return"() : () -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (ptr<3>, i32, i32)>, linkage = #llvm.linkage<external>, sym_name = "mbarrier_try_wait_shared_phase_with_timelimit", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg0: !llvm.ptr<3>, %arg1: i32, %arg2: i32):
    %0 = "nvvm.mbarrier.try_wait"(%arg0, %arg1, %arg2) <{relaxed = false, scope = #nvvm.mem_scope<cta>}> : (!llvm.ptr<3>, i32, i32) -> i1
    %1 = "nvvm.mbarrier.try_wait"(%arg0, %arg1, %arg2) <{relaxed = false, scope = #nvvm.mem_scope<cluster>}> : (!llvm.ptr<3>, i32, i32) -> i1
    %2 = "nvvm.mbarrier.try_wait"(%arg0, %arg1, %arg2) <{relaxed = true, scope = #nvvm.mem_scope<cta>}> : (!llvm.ptr<3>, i32, i32) -> i1
    %3 = "nvvm.mbarrier.try_wait"(%arg0, %arg1, %arg2) <{relaxed = true, scope = #nvvm.mem_scope<cluster>}> : (!llvm.ptr<3>, i32, i32) -> i1
    "llvm.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

