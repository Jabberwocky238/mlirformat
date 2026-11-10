"builtin.module"() ({
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (ptr, i32)>, linkage = #llvm.linkage<external>, sym_name = "mbarrier_arrive_generic", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg8: !llvm.ptr, %arg9: i32):
    %13 = "nvvm.mbarrier.arrive"(%arg8) <{relaxed = false, scope = #nvvm.mem_scope<cta>}> : (!llvm.ptr) -> i64
    %14 = "nvvm.mbarrier.arrive"(%arg8, %arg9) <{relaxed = false, scope = #nvvm.mem_scope<cta>}> : (!llvm.ptr, i32) -> i64
    %15 = "nvvm.mbarrier.arrive"(%arg8, %arg9) <{relaxed = false, scope = #nvvm.mem_scope<cta>}> : (!llvm.ptr, i32) -> i64
    %16 = "nvvm.mbarrier.arrive"(%arg8, %arg9) <{relaxed = false, scope = #nvvm.mem_scope<cluster>}> : (!llvm.ptr, i32) -> i64
    %17 = "nvvm.mbarrier.arrive"(%arg8) <{relaxed = true, scope = #nvvm.mem_scope<cta>}> : (!llvm.ptr) -> i64
    %18 = "nvvm.mbarrier.arrive"(%arg8, %arg9) <{relaxed = true, scope = #nvvm.mem_scope<cta>}> : (!llvm.ptr, i32) -> i64
    %19 = "nvvm.mbarrier.arrive"(%arg8, %arg9) <{relaxed = true, scope = #nvvm.mem_scope<cta>}> : (!llvm.ptr, i32) -> i64
    %20 = "nvvm.mbarrier.arrive"(%arg8, %arg9) <{relaxed = true, scope = #nvvm.mem_scope<cluster>}> : (!llvm.ptr, i32) -> i64
    "llvm.return"() : () -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (ptr<3>, i32)>, linkage = #llvm.linkage<external>, sym_name = "mbarrier_arrive_shared", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg6: !llvm.ptr<3>, %arg7: i32):
    %5 = "nvvm.mbarrier.arrive"(%arg6) <{relaxed = false, scope = #nvvm.mem_scope<cta>}> : (!llvm.ptr<3>) -> i64
    %6 = "nvvm.mbarrier.arrive"(%arg6, %arg7) <{relaxed = false, scope = #nvvm.mem_scope<cta>}> : (!llvm.ptr<3>, i32) -> i64
    %7 = "nvvm.mbarrier.arrive"(%arg6, %arg7) <{relaxed = false, scope = #nvvm.mem_scope<cta>}> : (!llvm.ptr<3>, i32) -> i64
    %8 = "nvvm.mbarrier.arrive"(%arg6, %arg7) <{relaxed = false, scope = #nvvm.mem_scope<cluster>}> : (!llvm.ptr<3>, i32) -> i64
    %9 = "nvvm.mbarrier.arrive"(%arg6) <{relaxed = true, scope = #nvvm.mem_scope<cta>}> : (!llvm.ptr<3>) -> i64
    %10 = "nvvm.mbarrier.arrive"(%arg6, %arg7) <{relaxed = true, scope = #nvvm.mem_scope<cta>}> : (!llvm.ptr<3>, i32) -> i64
    %11 = "nvvm.mbarrier.arrive"(%arg6, %arg7) <{relaxed = true, scope = #nvvm.mem_scope<cta>}> : (!llvm.ptr<3>, i32) -> i64
    %12 = "nvvm.mbarrier.arrive"(%arg6, %arg7) <{relaxed = true, scope = #nvvm.mem_scope<cluster>}> : (!llvm.ptr<3>, i32) -> i64
    "llvm.return"() : () -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (ptr<7>, i32)>, linkage = #llvm.linkage<external>, sym_name = "mbarrier_arrive_shared_cluster", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg4: !llvm.ptr<7>, %arg5: i32):
    "nvvm.mbarrier.arrive"(%arg4) <{relaxed = false, scope = #nvvm.mem_scope<cta>}> : (!llvm.ptr<7>) -> ()
    "nvvm.mbarrier.arrive"(%arg4, %arg5) <{relaxed = false, scope = #nvvm.mem_scope<cta>}> : (!llvm.ptr<7>, i32) -> ()
    "nvvm.mbarrier.arrive"(%arg4, %arg5) <{relaxed = false, scope = #nvvm.mem_scope<cta>}> : (!llvm.ptr<7>, i32) -> ()
    "nvvm.mbarrier.arrive"(%arg4, %arg5) <{relaxed = false, scope = #nvvm.mem_scope<cluster>}> : (!llvm.ptr<7>, i32) -> ()
    "nvvm.mbarrier.arrive"(%arg4) <{relaxed = true, scope = #nvvm.mem_scope<cta>}> : (!llvm.ptr<7>) -> ()
    "nvvm.mbarrier.arrive"(%arg4, %arg5) <{relaxed = true, scope = #nvvm.mem_scope<cta>}> : (!llvm.ptr<7>, i32) -> ()
    "nvvm.mbarrier.arrive"(%arg4, %arg5) <{relaxed = true, scope = #nvvm.mem_scope<cta>}> : (!llvm.ptr<7>, i32) -> ()
    "nvvm.mbarrier.arrive"(%arg4, %arg5) <{relaxed = true, scope = #nvvm.mem_scope<cluster>}> : (!llvm.ptr<7>, i32) -> ()
    "llvm.return"() : () -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (ptr)>, linkage = #llvm.linkage<external>, sym_name = "mbarrier_arrive_nocomplete", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg3: !llvm.ptr):
    %3 = "nvvm.read.ptx.sreg.ntid.x"() : () -> i32
    %4 = "nvvm.mbarrier.arrive.nocomplete"(%arg3, %3) : (!llvm.ptr, i32) -> i64
    "llvm.return"() : () -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (ptr<3>)>, linkage = #llvm.linkage<external>, sym_name = "mbarrier_arrive_nocomplete_shared", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg2: !llvm.ptr<3>):
    %1 = "nvvm.read.ptx.sreg.ntid.x"() : () -> i32
    %2 = "nvvm.mbarrier.arrive.nocomplete"(%arg2, %1) : (!llvm.ptr<3>, i32) -> i64
    "llvm.return"() : () -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (i32, ptr<3>)>, linkage = #llvm.linkage<external>, sym_name = "mbarrier_arrive_ignore_retval", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg0: i32, %arg1: !llvm.ptr<3>):
    "nvvm.mbarrier.arrive"(%arg1, %arg0) <{relaxed = false, scope = #nvvm.mem_scope<cta>}> : (!llvm.ptr<3>, i32) -> ()
    %0 = "nvvm.mbarrier.arrive"(%arg1, %arg0) <{relaxed = false, scope = #nvvm.mem_scope<cta>}> : (!llvm.ptr<3>, i32) -> i64
    "llvm.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

