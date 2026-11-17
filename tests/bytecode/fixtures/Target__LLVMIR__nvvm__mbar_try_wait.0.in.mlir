"builtin.module"() ({
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (ptr, i64)>, linkage = #llvm.linkage<external>, sym_name = "mbarrier_try_wait_state", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg18: !llvm.ptr loc("<stdin>":3:8), %arg19: i64 loc("<stdin>":3:27)):
    %28 = "nvvm.mbarrier.try_wait"(%arg18, %arg19) <{relaxed = false, scope = #nvvm.mem_scope<cta>}> : (!llvm.ptr, i64) -> i1 loc("<stdin>":4:11)
    %29 = "nvvm.mbarrier.try_wait"(%arg18, %arg19) <{relaxed = false, scope = #nvvm.mem_scope<cluster>}> : (!llvm.ptr, i64) -> i1 loc("<stdin>":5:11)
    %30 = "nvvm.mbarrier.try_wait"(%arg18, %arg19) <{relaxed = true, scope = #nvvm.mem_scope<cta>}> : (!llvm.ptr, i64) -> i1 loc("<stdin>":6:11)
    %31 = "nvvm.mbarrier.try_wait"(%arg18, %arg19) <{relaxed = true, scope = #nvvm.mem_scope<cluster>}> : (!llvm.ptr, i64) -> i1 loc("<stdin>":7:11)
    "llvm.return"() : () -> () loc("<stdin>":8:5)
  }) : () -> () loc("<stdin>":2:3)
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (ptr, i64, i32)>, linkage = #llvm.linkage<external>, sym_name = "mbarrier_try_wait_state_with_timelimit", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg15: !llvm.ptr loc("<stdin>":11:8), %arg16: i64 loc("<stdin>":11:27), %arg17: i32 loc("<stdin>":11:40)):
    %24 = "nvvm.mbarrier.try_wait"(%arg15, %arg16, %arg17) <{relaxed = false, scope = #nvvm.mem_scope<cta>}> : (!llvm.ptr, i64, i32) -> i1 loc("<stdin>":12:11)
    %25 = "nvvm.mbarrier.try_wait"(%arg15, %arg16, %arg17) <{relaxed = false, scope = #nvvm.mem_scope<cluster>}> : (!llvm.ptr, i64, i32) -> i1 loc("<stdin>":13:11)
    %26 = "nvvm.mbarrier.try_wait"(%arg15, %arg16, %arg17) <{relaxed = true, scope = #nvvm.mem_scope<cta>}> : (!llvm.ptr, i64, i32) -> i1 loc("<stdin>":14:11)
    %27 = "nvvm.mbarrier.try_wait"(%arg15, %arg16, %arg17) <{relaxed = true, scope = #nvvm.mem_scope<cluster>}> : (!llvm.ptr, i64, i32) -> i1 loc("<stdin>":15:11)
    "llvm.return"() : () -> () loc("<stdin>":16:5)
  }) : () -> () loc("<stdin>":10:3)
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (ptr<3>, i64)>, linkage = #llvm.linkage<external>, sym_name = "mbarrier_try_wait_shared_state", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg13: !llvm.ptr<3> loc("<stdin>":19:8), %arg14: i64 loc("<stdin>":19:30)):
    %20 = "nvvm.mbarrier.try_wait"(%arg13, %arg14) <{relaxed = false, scope = #nvvm.mem_scope<cta>}> : (!llvm.ptr<3>, i64) -> i1 loc("<stdin>":20:11)
    %21 = "nvvm.mbarrier.try_wait"(%arg13, %arg14) <{relaxed = false, scope = #nvvm.mem_scope<cluster>}> : (!llvm.ptr<3>, i64) -> i1 loc("<stdin>":21:11)
    %22 = "nvvm.mbarrier.try_wait"(%arg13, %arg14) <{relaxed = true, scope = #nvvm.mem_scope<cta>}> : (!llvm.ptr<3>, i64) -> i1 loc("<stdin>":22:11)
    %23 = "nvvm.mbarrier.try_wait"(%arg13, %arg14) <{relaxed = true, scope = #nvvm.mem_scope<cluster>}> : (!llvm.ptr<3>, i64) -> i1 loc("<stdin>":23:11)
    "llvm.return"() : () -> () loc("<stdin>":24:5)
  }) : () -> () loc("<stdin>":18:3)
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (ptr<3>, i64, i32)>, linkage = #llvm.linkage<external>, sym_name = "mbarrier_try_wait_shared_state_with_timelimit", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg10: !llvm.ptr<3> loc("<stdin>":27:8), %arg11: i64 loc("<stdin>":27:30), %arg12: i32 loc("<stdin>":27:43)):
    %16 = "nvvm.mbarrier.try_wait"(%arg10, %arg11, %arg12) <{relaxed = false, scope = #nvvm.mem_scope<cta>}> : (!llvm.ptr<3>, i64, i32) -> i1 loc("<stdin>":28:11)
    %17 = "nvvm.mbarrier.try_wait"(%arg10, %arg11, %arg12) <{relaxed = false, scope = #nvvm.mem_scope<cluster>}> : (!llvm.ptr<3>, i64, i32) -> i1 loc("<stdin>":29:11)
    %18 = "nvvm.mbarrier.try_wait"(%arg10, %arg11, %arg12) <{relaxed = true, scope = #nvvm.mem_scope<cta>}> : (!llvm.ptr<3>, i64, i32) -> i1 loc("<stdin>":30:11)
    %19 = "nvvm.mbarrier.try_wait"(%arg10, %arg11, %arg12) <{relaxed = true, scope = #nvvm.mem_scope<cluster>}> : (!llvm.ptr<3>, i64, i32) -> i1 loc("<stdin>":31:11)
    "llvm.return"() : () -> () loc("<stdin>":32:5)
  }) : () -> () loc("<stdin>":26:3)
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (ptr, i32)>, linkage = #llvm.linkage<external>, sym_name = "mbarrier_try_wait_phase", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg8: !llvm.ptr loc("<stdin>":35:8), %arg9: i32 loc("<stdin>":35:26)):
    %12 = "nvvm.mbarrier.try_wait"(%arg8, %arg9) <{relaxed = false, scope = #nvvm.mem_scope<cta>}> : (!llvm.ptr, i32) -> i1 loc("<stdin>":36:11)
    %13 = "nvvm.mbarrier.try_wait"(%arg8, %arg9) <{relaxed = false, scope = #nvvm.mem_scope<cluster>}> : (!llvm.ptr, i32) -> i1 loc("<stdin>":37:11)
    %14 = "nvvm.mbarrier.try_wait"(%arg8, %arg9) <{relaxed = true, scope = #nvvm.mem_scope<cta>}> : (!llvm.ptr, i32) -> i1 loc("<stdin>":38:11)
    %15 = "nvvm.mbarrier.try_wait"(%arg8, %arg9) <{relaxed = true, scope = #nvvm.mem_scope<cluster>}> : (!llvm.ptr, i32) -> i1 loc("<stdin>":39:11)
    "llvm.return"() : () -> () loc("<stdin>":40:5)
  }) : () -> () loc("<stdin>":34:3)
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (ptr, i32, i32)>, linkage = #llvm.linkage<external>, sym_name = "mbarrier_try_wait_phase_with_timelimit", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg5: !llvm.ptr loc("<stdin>":43:8), %arg6: i32 loc("<stdin>":43:26), %arg7: i32 loc("<stdin>":43:38)):
    %8 = "nvvm.mbarrier.try_wait"(%arg5, %arg6, %arg7) <{relaxed = false, scope = #nvvm.mem_scope<cta>}> : (!llvm.ptr, i32, i32) -> i1 loc("<stdin>":44:10)
    %9 = "nvvm.mbarrier.try_wait"(%arg5, %arg6, %arg7) <{relaxed = false, scope = #nvvm.mem_scope<cluster>}> : (!llvm.ptr, i32, i32) -> i1 loc("<stdin>":45:10)
    %10 = "nvvm.mbarrier.try_wait"(%arg5, %arg6, %arg7) <{relaxed = true, scope = #nvvm.mem_scope<cta>}> : (!llvm.ptr, i32, i32) -> i1 loc("<stdin>":46:11)
    %11 = "nvvm.mbarrier.try_wait"(%arg5, %arg6, %arg7) <{relaxed = true, scope = #nvvm.mem_scope<cluster>}> : (!llvm.ptr, i32, i32) -> i1 loc("<stdin>":47:11)
    "llvm.return"() : () -> () loc("<stdin>":48:5)
  }) : () -> () loc("<stdin>":42:3)
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (ptr<3>, i32)>, linkage = #llvm.linkage<external>, sym_name = "mbarrier_try_wait_shared_phase", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg3: !llvm.ptr<3> loc("<stdin>":51:8), %arg4: i32 loc("<stdin>":51:29)):
    %4 = "nvvm.mbarrier.try_wait"(%arg3, %arg4) <{relaxed = false, scope = #nvvm.mem_scope<cta>}> : (!llvm.ptr<3>, i32) -> i1 loc("<stdin>":52:10)
    %5 = "nvvm.mbarrier.try_wait"(%arg3, %arg4) <{relaxed = false, scope = #nvvm.mem_scope<cluster>}> : (!llvm.ptr<3>, i32) -> i1 loc("<stdin>":53:10)
    %6 = "nvvm.mbarrier.try_wait"(%arg3, %arg4) <{relaxed = true, scope = #nvvm.mem_scope<cta>}> : (!llvm.ptr<3>, i32) -> i1 loc("<stdin>":54:10)
    %7 = "nvvm.mbarrier.try_wait"(%arg3, %arg4) <{relaxed = true, scope = #nvvm.mem_scope<cluster>}> : (!llvm.ptr<3>, i32) -> i1 loc("<stdin>":55:10)
    "llvm.return"() : () -> () loc("<stdin>":56:5)
  }) : () -> () loc("<stdin>":50:3)
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (ptr<3>, i32, i32)>, linkage = #llvm.linkage<external>, sym_name = "mbarrier_try_wait_shared_phase_with_timelimit", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg0: !llvm.ptr<3> loc("<stdin>":59:8), %arg1: i32 loc("<stdin>":59:29), %arg2: i32 loc("<stdin>":59:41)):
    %0 = "nvvm.mbarrier.try_wait"(%arg0, %arg1, %arg2) <{relaxed = false, scope = #nvvm.mem_scope<cta>}> : (!llvm.ptr<3>, i32, i32) -> i1 loc("<stdin>":60:10)
    %1 = "nvvm.mbarrier.try_wait"(%arg0, %arg1, %arg2) <{relaxed = false, scope = #nvvm.mem_scope<cluster>}> : (!llvm.ptr<3>, i32, i32) -> i1 loc("<stdin>":61:10)
    %2 = "nvvm.mbarrier.try_wait"(%arg0, %arg1, %arg2) <{relaxed = true, scope = #nvvm.mem_scope<cta>}> : (!llvm.ptr<3>, i32, i32) -> i1 loc("<stdin>":62:10)
    %3 = "nvvm.mbarrier.try_wait"(%arg0, %arg1, %arg2) <{relaxed = true, scope = #nvvm.mem_scope<cluster>}> : (!llvm.ptr<3>, i32, i32) -> i1 loc("<stdin>":63:10)
    "llvm.return"() : () -> () loc("<stdin>":64:5)
  }) : () -> () loc("<stdin>":58:3)
}) : () -> () loc("<stdin>":1:1)
