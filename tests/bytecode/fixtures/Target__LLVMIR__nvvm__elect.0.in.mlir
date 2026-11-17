"builtin.module"() ({
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<i1 ()>, linkage = #llvm.linkage<external>, sym_name = "test_nvvm_elect_sync", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
    %1 = "nvvm.elect.sync"() : () -> i1 loc("<stdin>":3:10)
    "llvm.return"(%1) : (i1) -> () loc("<stdin>":4:5)
  }) : () -> () loc("<stdin>":2:3)
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<i1 (i32)>, linkage = #llvm.linkage<external>, sym_name = "test_nvvm_elect_sync_mask", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg0: i32 loc("<stdin>":7:8)):
    %0 = "nvvm.elect.sync"(%arg0) : (i32) -> i1 loc("<stdin>":8:10)
    "llvm.return"(%0) : (i1) -> () loc("<stdin>":9:5)
  }) : () -> () loc("<stdin>":6:3)
}) : () -> () loc("<stdin>":1:1)
