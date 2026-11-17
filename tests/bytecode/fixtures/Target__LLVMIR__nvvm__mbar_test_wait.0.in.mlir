"builtin.module"() ({
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (ptr, i64)>, linkage = #llvm.linkage<external>, sym_name = "mbarrier_test_wait_state", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg6: !llvm.ptr loc("<stdin>":3:8), %arg7: i64 loc("<stdin>":3:26)):
    %12 = "nvvm.mbarrier.test.wait"(%arg6, %arg7) <{relaxed = false, scope = #nvvm.mem_scope<cta>}> : (!llvm.ptr, i64) -> i1 loc("<stdin>":4:11)
    %13 = "nvvm.mbarrier.test.wait"(%arg6, %arg7) <{relaxed = false, scope = #nvvm.mem_scope<cluster>}> : (!llvm.ptr, i64) -> i1 loc("<stdin>":5:11)
    %14 = "nvvm.mbarrier.test.wait"(%arg6, %arg7) <{relaxed = true, scope = #nvvm.mem_scope<cta>}> : (!llvm.ptr, i64) -> i1 loc("<stdin>":6:11)
    %15 = "nvvm.mbarrier.test.wait"(%arg6, %arg7) <{relaxed = true, scope = #nvvm.mem_scope<cluster>}> : (!llvm.ptr, i64) -> i1 loc("<stdin>":7:11)
    "llvm.return"() : () -> () loc("<stdin>":8:5)
  }) : () -> () loc("<stdin>":2:3)
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (ptr<3>, i64)>, linkage = #llvm.linkage<external>, sym_name = "mbarrier_test_wait_shared_state", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg4: !llvm.ptr<3> loc("<stdin>":11:8), %arg5: i64 loc("<stdin>":11:29)):
    %8 = "nvvm.mbarrier.test.wait"(%arg4, %arg5) <{relaxed = false, scope = #nvvm.mem_scope<cta>}> : (!llvm.ptr<3>, i64) -> i1 loc("<stdin>":12:10)
    %9 = "nvvm.mbarrier.test.wait"(%arg4, %arg5) <{relaxed = false, scope = #nvvm.mem_scope<cluster>}> : (!llvm.ptr<3>, i64) -> i1 loc("<stdin>":13:10)
    %10 = "nvvm.mbarrier.test.wait"(%arg4, %arg5) <{relaxed = true, scope = #nvvm.mem_scope<cta>}> : (!llvm.ptr<3>, i64) -> i1 loc("<stdin>":14:11)
    %11 = "nvvm.mbarrier.test.wait"(%arg4, %arg5) <{relaxed = true, scope = #nvvm.mem_scope<cluster>}> : (!llvm.ptr<3>, i64) -> i1 loc("<stdin>":15:11)
    "llvm.return"() : () -> () loc("<stdin>":16:5)
  }) : () -> () loc("<stdin>":10:3)
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (ptr, i32)>, linkage = #llvm.linkage<external>, sym_name = "mbarrier_test_wait_phase", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg2: !llvm.ptr loc("<stdin>":19:8), %arg3: i32 loc("<stdin>":19:26)):
    %4 = "nvvm.mbarrier.test.wait"(%arg2, %arg3) <{relaxed = false, scope = #nvvm.mem_scope<cta>}> : (!llvm.ptr, i32) -> i1 loc("<stdin>":20:10)
    %5 = "nvvm.mbarrier.test.wait"(%arg2, %arg3) <{relaxed = false, scope = #nvvm.mem_scope<cluster>}> : (!llvm.ptr, i32) -> i1 loc("<stdin>":21:10)
    %6 = "nvvm.mbarrier.test.wait"(%arg2, %arg3) <{relaxed = true, scope = #nvvm.mem_scope<cta>}> : (!llvm.ptr, i32) -> i1 loc("<stdin>":22:10)
    %7 = "nvvm.mbarrier.test.wait"(%arg2, %arg3) <{relaxed = true, scope = #nvvm.mem_scope<cluster>}> : (!llvm.ptr, i32) -> i1 loc("<stdin>":23:10)
    "llvm.return"() : () -> () loc("<stdin>":24:5)
  }) : () -> () loc("<stdin>":18:3)
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (ptr<3>, i32)>, linkage = #llvm.linkage<external>, sym_name = "mbarrier_test_wait_shared_phase", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg0: !llvm.ptr<3> loc("<stdin>":27:8), %arg1: i32 loc("<stdin>":27:29)):
    %0 = "nvvm.mbarrier.test.wait"(%arg0, %arg1) <{relaxed = false, scope = #nvvm.mem_scope<cta>}> : (!llvm.ptr<3>, i32) -> i1 loc("<stdin>":28:10)
    %1 = "nvvm.mbarrier.test.wait"(%arg0, %arg1) <{relaxed = false, scope = #nvvm.mem_scope<cluster>}> : (!llvm.ptr<3>, i32) -> i1 loc("<stdin>":29:10)
    %2 = "nvvm.mbarrier.test.wait"(%arg0, %arg1) <{relaxed = true, scope = #nvvm.mem_scope<cta>}> : (!llvm.ptr<3>, i32) -> i1 loc("<stdin>":30:10)
    %3 = "nvvm.mbarrier.test.wait"(%arg0, %arg1) <{relaxed = true, scope = #nvvm.mem_scope<cluster>}> : (!llvm.ptr<3>, i32) -> i1 loc("<stdin>":31:10)
    "llvm.return"() : () -> () loc("<stdin>":32:5)
  }) : () -> () loc("<stdin>":26:3)
}) : () -> () loc("<stdin>":1:1)
