"builtin.module"() ({
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (ptr, ptr<5>, ptr<1>)>, linkage = #llvm.linkage<external>, sym_name = "prefetch_L1", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg7: !llvm.ptr loc("<stdin>":3:8), %arg8: !llvm.ptr<5> loc("<stdin>":3:26), %arg9: !llvm.ptr<1> loc("<stdin>":3:47)):
    "nvvm.prefetch"(%arg7) <{cacheLevel = #nvvm<prefetch_cache_level L1>}> : (!llvm.ptr) -> () loc("<stdin>":4:5)
    "nvvm.prefetch"(%arg8) <{cacheLevel = #nvvm<prefetch_cache_level L1>}> : (!llvm.ptr<5>) -> () loc("<stdin>":5:5)
    "nvvm.prefetch"(%arg9) <{cacheLevel = #nvvm<prefetch_cache_level L1>}> : (!llvm.ptr<1>) -> () loc("<stdin>":6:5)
    "llvm.return"() : () -> () loc("<stdin>":7:5)
  }) : () -> () loc("<stdin>":2:3)
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (ptr, ptr<5>, ptr<1>)>, linkage = #llvm.linkage<external>, sym_name = "prefetch_L2", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg4: !llvm.ptr loc("<stdin>":10:8), %arg5: !llvm.ptr<5> loc("<stdin>":10:26), %arg6: !llvm.ptr<1> loc("<stdin>":10:47)):
    "nvvm.prefetch"(%arg4) <{cacheLevel = #nvvm<prefetch_cache_level L2>}> : (!llvm.ptr) -> () loc("<stdin>":11:5)
    "nvvm.prefetch"(%arg5) <{cacheLevel = #nvvm<prefetch_cache_level L2>}> : (!llvm.ptr<5>) -> () loc("<stdin>":12:5)
    "nvvm.prefetch"(%arg6) <{cacheLevel = #nvvm<prefetch_cache_level L2>}> : (!llvm.ptr<1>) -> () loc("<stdin>":13:5)
    "llvm.return"() : () -> () loc("<stdin>":14:5)
  }) : () -> () loc("<stdin>":9:3)
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (ptr<1>)>, linkage = #llvm.linkage<external>, sym_name = "prefetch_L2_eviction_priority", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg3: !llvm.ptr<1> loc("<stdin>":17:8)):
    "nvvm.prefetch"(%arg3) <{cacheLevel = #nvvm<prefetch_cache_level L2>, evictPriority = #nvvm<cache_eviction_priority evict_last>}> : (!llvm.ptr<1>) -> () loc("<stdin>":18:5)
    "nvvm.prefetch"(%arg3) <{cacheLevel = #nvvm<prefetch_cache_level L2>, evictPriority = #nvvm<cache_eviction_priority evict_normal>}> : (!llvm.ptr<1>) -> () loc("<stdin>":19:5)
    "llvm.return"() : () -> () loc("<stdin>":20:5)
  }) : () -> () loc("<stdin>":16:3)
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (ptr)>, linkage = #llvm.linkage<external>, sym_name = "prefetch_L1_uniform", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg2: !llvm.ptr loc("<stdin>":23:8)):
    "nvvm.prefetch"(%arg2) <{cacheLevel = #nvvm<prefetch_cache_level L1>, uniform}> : (!llvm.ptr) -> () loc("<stdin>":24:5)
    "llvm.return"() : () -> () loc("<stdin>":25:5)
  }) : () -> () loc("<stdin>":22:3)
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (ptr, ptr<4>)>, linkage = #llvm.linkage<external>, sym_name = "prefetch_tensormap", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg0: !llvm.ptr loc("<stdin>":28:8), %arg1: !llvm.ptr<4> loc("<stdin>":28:26)):
    "nvvm.prefetch"(%arg0) <{tensormap}> : (!llvm.ptr) -> () loc("<stdin>":29:5)
    "nvvm.prefetch"(%arg1) <{tensormap}> : (!llvm.ptr<4>) -> () loc("<stdin>":30:5)
    "nvvm.prefetch"(%arg0) <{in_param_space, tensormap}> : (!llvm.ptr) -> () loc("<stdin>":31:5)
    "llvm.return"() : () -> () loc("<stdin>":32:5)
  }) : () -> () loc("<stdin>":27:3)
}) : () -> () loc("<stdin>":1:1)
