"builtin.module"() ({
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (ptr<3>, ptr)>, linkage = #llvm.linkage<external>, sym_name = "cp_async_mbarrier_arrive", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg4: !llvm.ptr<3> loc("<stdin>":3:8), %arg5: !llvm.ptr loc("<stdin>":3:29)):
    "nvvm.cp.async.mbarrier.arrive"(%arg5) <{noinc = false}> : (!llvm.ptr) -> () loc("<stdin>":4:5)
    "nvvm.cp.async.mbarrier.arrive"(%arg5) <{noinc = true}> : (!llvm.ptr) -> () loc("<stdin>":5:5)
    "nvvm.cp.async.mbarrier.arrive"(%arg4) <{noinc = false}> : (!llvm.ptr<3>) -> () loc("<stdin>":6:5)
    "nvvm.cp.async.mbarrier.arrive"(%arg4) <{noinc = true}> : (!llvm.ptr<3>) -> () loc("<stdin>":7:5)
    "llvm.return"() : () -> () loc("<stdin>":8:5)
  }) : () -> () loc("<stdin>":2:3)
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (ptr)>, linkage = #llvm.linkage<external>, sym_name = "mbarrier_init_generic", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg3: !llvm.ptr loc("<stdin>":11:8)):
    %1 = "nvvm.read.ptx.sreg.ntid.x"() : () -> i32 loc("<stdin>":12:10)
    "nvvm.mbarrier.init"(%arg3, %1) : (!llvm.ptr, i32) -> () loc("<stdin>":13:5)
    "llvm.return"() : () -> () loc("<stdin>":14:5)
  }) : () -> () loc("<stdin>":10:3)
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (ptr<3>)>, linkage = #llvm.linkage<external>, sym_name = "mbarrier_init_shared", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg2: !llvm.ptr<3> loc("<stdin>":17:8)):
    %0 = "nvvm.read.ptx.sreg.ntid.x"() : () -> i32 loc("<stdin>":18:10)
    "nvvm.mbarrier.init"(%arg2, %0) : (!llvm.ptr<3>, i32) -> () loc("<stdin>":19:5)
    "llvm.return"() : () -> () loc("<stdin>":20:5)
  }) : () -> () loc("<stdin>":16:3)
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (ptr)>, linkage = #llvm.linkage<external>, sym_name = "mbarrier_inval_generic", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg1: !llvm.ptr loc("<stdin>":23:8)):
    "nvvm.mbarrier.inval"(%arg1) : (!llvm.ptr) -> () loc("<stdin>":24:5)
    "llvm.return"() : () -> () loc("<stdin>":25:5)
  }) : () -> () loc("<stdin>":22:3)
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (ptr<3>)>, linkage = #llvm.linkage<external>, sym_name = "mbarrier_inval_shared", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg0: !llvm.ptr<3> loc("<stdin>":28:8)):
    "nvvm.mbarrier.inval"(%arg0) : (!llvm.ptr<3>) -> () loc("<stdin>":29:5)
    "llvm.return"() : () -> () loc("<stdin>":30:5)
  }) : () -> () loc("<stdin>":27:3)
}) : () -> () loc("<stdin>":1:1)
