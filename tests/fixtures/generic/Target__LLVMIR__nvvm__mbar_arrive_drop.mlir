"builtin.module"() ({
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (ptr, i32)>, linkage = #llvm.linkage<external>, sym_name = "mbarrier_arrive_drop_generic", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg6: !llvm.ptr, %arg7: i32):
    %12 = "nvvm.mbarrier.arrive_drop"(%arg6) <{relaxed = false, scope = #nvvm.mem_scope<cta>}> : (!llvm.ptr) -> i64
    %13 = "nvvm.mbarrier.arrive_drop"(%arg6, %arg7) <{relaxed = false, scope = #nvvm.mem_scope<cta>}> : (!llvm.ptr, i32) -> i64
    %14 = "nvvm.mbarrier.arrive_drop"(%arg6, %arg7) <{relaxed = false, scope = #nvvm.mem_scope<cta>}> : (!llvm.ptr, i32) -> i64
    %15 = "nvvm.mbarrier.arrive_drop"(%arg6, %arg7) <{relaxed = false, scope = #nvvm.mem_scope<cluster>}> : (!llvm.ptr, i32) -> i64
    %16 = "nvvm.mbarrier.arrive_drop"(%arg6) <{relaxed = true, scope = #nvvm.mem_scope<cta>}> : (!llvm.ptr) -> i64
    %17 = "nvvm.mbarrier.arrive_drop"(%arg6, %arg7) <{relaxed = true, scope = #nvvm.mem_scope<cta>}> : (!llvm.ptr, i32) -> i64
    %18 = "nvvm.mbarrier.arrive_drop"(%arg6, %arg7) <{relaxed = true, scope = #nvvm.mem_scope<cta>}> : (!llvm.ptr, i32) -> i64
    %19 = "nvvm.mbarrier.arrive_drop"(%arg6, %arg7) <{relaxed = true, scope = #nvvm.mem_scope<cluster>}> : (!llvm.ptr, i32) -> i64
    "llvm.return"() : () -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (ptr<3>, i32)>, linkage = #llvm.linkage<external>, sym_name = "mbarrier_arrive_drop_shared", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg4: !llvm.ptr<3>, %arg5: i32):
    %4 = "nvvm.mbarrier.arrive_drop"(%arg4) <{relaxed = false, scope = #nvvm.mem_scope<cta>}> : (!llvm.ptr<3>) -> i64
    %5 = "nvvm.mbarrier.arrive_drop"(%arg4, %arg5) <{relaxed = false, scope = #nvvm.mem_scope<cta>}> : (!llvm.ptr<3>, i32) -> i64
    %6 = "nvvm.mbarrier.arrive_drop"(%arg4, %arg5) <{relaxed = false, scope = #nvvm.mem_scope<cta>}> : (!llvm.ptr<3>, i32) -> i64
    %7 = "nvvm.mbarrier.arrive_drop"(%arg4, %arg5) <{relaxed = false, scope = #nvvm.mem_scope<cluster>}> : (!llvm.ptr<3>, i32) -> i64
    %8 = "nvvm.mbarrier.arrive_drop"(%arg4) <{relaxed = true, scope = #nvvm.mem_scope<cta>}> : (!llvm.ptr<3>) -> i64
    %9 = "nvvm.mbarrier.arrive_drop"(%arg4, %arg5) <{relaxed = true, scope = #nvvm.mem_scope<cta>}> : (!llvm.ptr<3>, i32) -> i64
    %10 = "nvvm.mbarrier.arrive_drop"(%arg4, %arg5) <{relaxed = true, scope = #nvvm.mem_scope<cta>}> : (!llvm.ptr<3>, i32) -> i64
    %11 = "nvvm.mbarrier.arrive_drop"(%arg4, %arg5) <{relaxed = true, scope = #nvvm.mem_scope<cluster>}> : (!llvm.ptr<3>, i32) -> i64
    "llvm.return"() : () -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (ptr<7>, i32)>, linkage = #llvm.linkage<external>, sym_name = "mbarrier_arrive_drop_shared_cluster", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg2: !llvm.ptr<7>, %arg3: i32):
    "nvvm.mbarrier.arrive_drop"(%arg2) <{relaxed = false, scope = #nvvm.mem_scope<cta>}> : (!llvm.ptr<7>) -> ()
    "nvvm.mbarrier.arrive_drop"(%arg2, %arg3) <{relaxed = false, scope = #nvvm.mem_scope<cta>}> : (!llvm.ptr<7>, i32) -> ()
    "nvvm.mbarrier.arrive_drop"(%arg2, %arg3) <{relaxed = false, scope = #nvvm.mem_scope<cta>}> : (!llvm.ptr<7>, i32) -> ()
    "nvvm.mbarrier.arrive_drop"(%arg2, %arg3) <{relaxed = false, scope = #nvvm.mem_scope<cluster>}> : (!llvm.ptr<7>, i32) -> ()
    "nvvm.mbarrier.arrive_drop"(%arg2) <{relaxed = true, scope = #nvvm.mem_scope<cta>}> : (!llvm.ptr<7>) -> ()
    "nvvm.mbarrier.arrive_drop"(%arg2, %arg3) <{relaxed = true, scope = #nvvm.mem_scope<cta>}> : (!llvm.ptr<7>, i32) -> ()
    "nvvm.mbarrier.arrive_drop"(%arg2, %arg3) <{relaxed = true, scope = #nvvm.mem_scope<cta>}> : (!llvm.ptr<7>, i32) -> ()
    "nvvm.mbarrier.arrive_drop"(%arg2, %arg3) <{relaxed = true, scope = #nvvm.mem_scope<cluster>}> : (!llvm.ptr<7>, i32) -> ()
    "llvm.return"() : () -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (ptr)>, linkage = #llvm.linkage<external>, sym_name = "mbarrier_arrive_drop_nocomplete", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg1: !llvm.ptr):
    %2 = "nvvm.read.ptx.sreg.ntid.x"() : () -> i32
    %3 = "nvvm.mbarrier.arrive_drop.nocomplete"(%arg1, %2) : (!llvm.ptr, i32) -> i64
    "llvm.return"() : () -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (ptr<3>)>, linkage = #llvm.linkage<external>, sym_name = "mbarrier_arrive_drop_nocomplete_shared", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg0: !llvm.ptr<3>):
    %0 = "nvvm.read.ptx.sreg.ntid.x"() : () -> i32
    %1 = "nvvm.mbarrier.arrive_drop.nocomplete"(%arg0, %0) : (!llvm.ptr<3>, i32) -> i64
    "llvm.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

