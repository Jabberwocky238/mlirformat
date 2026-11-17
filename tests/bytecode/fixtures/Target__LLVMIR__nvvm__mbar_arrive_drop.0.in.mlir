"builtin.module"() ({
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (ptr, i32)>, linkage = #llvm.linkage<external>, sym_name = "mbarrier_arrive_drop_generic", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg6: !llvm.ptr loc("<stdin>":3:8), %arg7: i32 loc("<stdin>":3:26)):
    %12 = "nvvm.mbarrier.arrive_drop"(%arg6) <{relaxed = false, scope = #nvvm.mem_scope<cta>}> : (!llvm.ptr) -> i64 loc("<stdin>":4:11)
    %13 = "nvvm.mbarrier.arrive_drop"(%arg6, %arg7) <{relaxed = false, scope = #nvvm.mem_scope<cta>}> : (!llvm.ptr, i32) -> i64 loc("<stdin>":5:11)
    %14 = "nvvm.mbarrier.arrive_drop"(%arg6, %arg7) <{relaxed = false, scope = #nvvm.mem_scope<cta>}> : (!llvm.ptr, i32) -> i64 loc("<stdin>":6:11)
    %15 = "nvvm.mbarrier.arrive_drop"(%arg6, %arg7) <{relaxed = false, scope = #nvvm.mem_scope<cluster>}> : (!llvm.ptr, i32) -> i64 loc("<stdin>":7:11)
    %16 = "nvvm.mbarrier.arrive_drop"(%arg6) <{relaxed = true, scope = #nvvm.mem_scope<cta>}> : (!llvm.ptr) -> i64 loc("<stdin>":8:11)
    %17 = "nvvm.mbarrier.arrive_drop"(%arg6, %arg7) <{relaxed = true, scope = #nvvm.mem_scope<cta>}> : (!llvm.ptr, i32) -> i64 loc("<stdin>":9:11)
    %18 = "nvvm.mbarrier.arrive_drop"(%arg6, %arg7) <{relaxed = true, scope = #nvvm.mem_scope<cta>}> : (!llvm.ptr, i32) -> i64 loc("<stdin>":10:11)
    %19 = "nvvm.mbarrier.arrive_drop"(%arg6, %arg7) <{relaxed = true, scope = #nvvm.mem_scope<cluster>}> : (!llvm.ptr, i32) -> i64 loc("<stdin>":11:11)
    "llvm.return"() : () -> () loc("<stdin>":12:5)
  }) : () -> () loc("<stdin>":2:3)
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (ptr<3>, i32)>, linkage = #llvm.linkage<external>, sym_name = "mbarrier_arrive_drop_shared", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg4: !llvm.ptr<3> loc("<stdin>":15:8), %arg5: i32 loc("<stdin>":15:29)):
    %4 = "nvvm.mbarrier.arrive_drop"(%arg4) <{relaxed = false, scope = #nvvm.mem_scope<cta>}> : (!llvm.ptr<3>) -> i64 loc("<stdin>":16:10)
    %5 = "nvvm.mbarrier.arrive_drop"(%arg4, %arg5) <{relaxed = false, scope = #nvvm.mem_scope<cta>}> : (!llvm.ptr<3>, i32) -> i64 loc("<stdin>":17:10)
    %6 = "nvvm.mbarrier.arrive_drop"(%arg4, %arg5) <{relaxed = false, scope = #nvvm.mem_scope<cta>}> : (!llvm.ptr<3>, i32) -> i64 loc("<stdin>":18:10)
    %7 = "nvvm.mbarrier.arrive_drop"(%arg4, %arg5) <{relaxed = false, scope = #nvvm.mem_scope<cluster>}> : (!llvm.ptr<3>, i32) -> i64 loc("<stdin>":19:10)
    %8 = "nvvm.mbarrier.arrive_drop"(%arg4) <{relaxed = true, scope = #nvvm.mem_scope<cta>}> : (!llvm.ptr<3>) -> i64 loc("<stdin>":20:10)
    %9 = "nvvm.mbarrier.arrive_drop"(%arg4, %arg5) <{relaxed = true, scope = #nvvm.mem_scope<cta>}> : (!llvm.ptr<3>, i32) -> i64 loc("<stdin>":21:10)
    %10 = "nvvm.mbarrier.arrive_drop"(%arg4, %arg5) <{relaxed = true, scope = #nvvm.mem_scope<cta>}> : (!llvm.ptr<3>, i32) -> i64 loc("<stdin>":22:11)
    %11 = "nvvm.mbarrier.arrive_drop"(%arg4, %arg5) <{relaxed = true, scope = #nvvm.mem_scope<cluster>}> : (!llvm.ptr<3>, i32) -> i64 loc("<stdin>":23:11)
    "llvm.return"() : () -> () loc("<stdin>":24:5)
  }) : () -> () loc("<stdin>":14:3)
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (ptr<7>, i32)>, linkage = #llvm.linkage<external>, sym_name = "mbarrier_arrive_drop_shared_cluster", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg2: !llvm.ptr<7> loc("<stdin>":27:8), %arg3: i32 loc("<stdin>":27:29)):
    "nvvm.mbarrier.arrive_drop"(%arg2) <{relaxed = false, scope = #nvvm.mem_scope<cta>}> : (!llvm.ptr<7>) -> () loc("<stdin>":28:5)
    "nvvm.mbarrier.arrive_drop"(%arg2, %arg3) <{relaxed = false, scope = #nvvm.mem_scope<cta>}> : (!llvm.ptr<7>, i32) -> () loc("<stdin>":29:5)
    "nvvm.mbarrier.arrive_drop"(%arg2, %arg3) <{relaxed = false, scope = #nvvm.mem_scope<cta>}> : (!llvm.ptr<7>, i32) -> () loc("<stdin>":30:5)
    "nvvm.mbarrier.arrive_drop"(%arg2, %arg3) <{relaxed = false, scope = #nvvm.mem_scope<cluster>}> : (!llvm.ptr<7>, i32) -> () loc("<stdin>":31:5)
    "nvvm.mbarrier.arrive_drop"(%arg2) <{relaxed = true, scope = #nvvm.mem_scope<cta>}> : (!llvm.ptr<7>) -> () loc("<stdin>":32:5)
    "nvvm.mbarrier.arrive_drop"(%arg2, %arg3) <{relaxed = true, scope = #nvvm.mem_scope<cta>}> : (!llvm.ptr<7>, i32) -> () loc("<stdin>":33:5)
    "nvvm.mbarrier.arrive_drop"(%arg2, %arg3) <{relaxed = true, scope = #nvvm.mem_scope<cta>}> : (!llvm.ptr<7>, i32) -> () loc("<stdin>":34:5)
    "nvvm.mbarrier.arrive_drop"(%arg2, %arg3) <{relaxed = true, scope = #nvvm.mem_scope<cluster>}> : (!llvm.ptr<7>, i32) -> () loc("<stdin>":35:5)
    "llvm.return"() : () -> () loc("<stdin>":36:5)
  }) : () -> () loc("<stdin>":26:3)
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (ptr)>, linkage = #llvm.linkage<external>, sym_name = "mbarrier_arrive_drop_nocomplete", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg1: !llvm.ptr loc("<stdin>":39:8)):
    %2 = "nvvm.read.ptx.sreg.ntid.x"() : () -> i32 loc("<stdin>":40:10)
    %3 = "nvvm.mbarrier.arrive_drop.nocomplete"(%arg1, %2) : (!llvm.ptr, i32) -> i64 loc("<stdin>":41:10)
    "llvm.return"() : () -> () loc("<stdin>":42:5)
  }) : () -> () loc("<stdin>":38:3)
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (ptr<3>)>, linkage = #llvm.linkage<external>, sym_name = "mbarrier_arrive_drop_nocomplete_shared", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg0: !llvm.ptr<3> loc("<stdin>":45:8)):
    %0 = "nvvm.read.ptx.sreg.ntid.x"() : () -> i32 loc("<stdin>":46:10)
    %1 = "nvvm.mbarrier.arrive_drop.nocomplete"(%arg0, %0) : (!llvm.ptr<3>, i32) -> i64 loc("<stdin>":47:10)
    "llvm.return"() : () -> () loc("<stdin>":48:5)
  }) : () -> () loc("<stdin>":44:3)
}) : () -> () loc("<stdin>":1:1)
