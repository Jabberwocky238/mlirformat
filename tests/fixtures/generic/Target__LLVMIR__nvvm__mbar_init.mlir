"builtin.module"() ({
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (ptr<3>, ptr)>, linkage = #llvm.linkage<external>, sym_name = "cp_async_mbarrier_arrive", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg4: !llvm.ptr<3>, %arg5: !llvm.ptr):
    "nvvm.cp.async.mbarrier.arrive"(%arg5) <{noinc = false}> : (!llvm.ptr) -> ()
    "nvvm.cp.async.mbarrier.arrive"(%arg5) <{noinc = true}> : (!llvm.ptr) -> ()
    "nvvm.cp.async.mbarrier.arrive"(%arg4) <{noinc = false}> : (!llvm.ptr<3>) -> ()
    "nvvm.cp.async.mbarrier.arrive"(%arg4) <{noinc = true}> : (!llvm.ptr<3>) -> ()
    "llvm.return"() : () -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (ptr)>, linkage = #llvm.linkage<external>, sym_name = "mbarrier_init_generic", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg3: !llvm.ptr):
    %1 = "nvvm.read.ptx.sreg.ntid.x"() : () -> i32
    "nvvm.mbarrier.init"(%arg3, %1) : (!llvm.ptr, i32) -> ()
    "llvm.return"() : () -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (ptr<3>)>, linkage = #llvm.linkage<external>, sym_name = "mbarrier_init_shared", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg2: !llvm.ptr<3>):
    %0 = "nvvm.read.ptx.sreg.ntid.x"() : () -> i32
    "nvvm.mbarrier.init"(%arg2, %0) : (!llvm.ptr<3>, i32) -> ()
    "llvm.return"() : () -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (ptr)>, linkage = #llvm.linkage<external>, sym_name = "mbarrier_inval_generic", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg1: !llvm.ptr):
    "nvvm.mbarrier.inval"(%arg1) : (!llvm.ptr) -> ()
    "llvm.return"() : () -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (ptr<3>)>, linkage = #llvm.linkage<external>, sym_name = "mbarrier_inval_shared", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg0: !llvm.ptr<3>):
    "nvvm.mbarrier.inval"(%arg0) : (!llvm.ptr<3>) -> ()
    "llvm.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

