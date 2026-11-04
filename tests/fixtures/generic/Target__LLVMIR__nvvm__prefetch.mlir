"builtin.module"() ({
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (ptr, ptr<5>, ptr<1>)>, linkage = #llvm.linkage<external>, sym_name = "prefetch_L1", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg7: !llvm.ptr, %arg8: !llvm.ptr<5>, %arg9: !llvm.ptr<1>):
    "nvvm.prefetch"(%arg7) <{cacheLevel = #nvvm<prefetch_cache_level L1>}> : (!llvm.ptr) -> ()
    "nvvm.prefetch"(%arg8) <{cacheLevel = #nvvm<prefetch_cache_level L1>}> : (!llvm.ptr<5>) -> ()
    "nvvm.prefetch"(%arg9) <{cacheLevel = #nvvm<prefetch_cache_level L1>}> : (!llvm.ptr<1>) -> ()
    "llvm.return"() : () -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (ptr, ptr<5>, ptr<1>)>, linkage = #llvm.linkage<external>, sym_name = "prefetch_L2", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg4: !llvm.ptr, %arg5: !llvm.ptr<5>, %arg6: !llvm.ptr<1>):
    "nvvm.prefetch"(%arg4) <{cacheLevel = #nvvm<prefetch_cache_level L2>}> : (!llvm.ptr) -> ()
    "nvvm.prefetch"(%arg5) <{cacheLevel = #nvvm<prefetch_cache_level L2>}> : (!llvm.ptr<5>) -> ()
    "nvvm.prefetch"(%arg6) <{cacheLevel = #nvvm<prefetch_cache_level L2>}> : (!llvm.ptr<1>) -> ()
    "llvm.return"() : () -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (ptr<1>)>, linkage = #llvm.linkage<external>, sym_name = "prefetch_L2_eviction_priority", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg3: !llvm.ptr<1>):
    "nvvm.prefetch"(%arg3) <{cacheLevel = #nvvm<prefetch_cache_level L2>, evictPriority = #nvvm<cache_eviction_priority evict_last>}> : (!llvm.ptr<1>) -> ()
    "nvvm.prefetch"(%arg3) <{cacheLevel = #nvvm<prefetch_cache_level L2>, evictPriority = #nvvm<cache_eviction_priority evict_normal>}> : (!llvm.ptr<1>) -> ()
    "llvm.return"() : () -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (ptr)>, linkage = #llvm.linkage<external>, sym_name = "prefetch_L1_uniform", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg2: !llvm.ptr):
    "nvvm.prefetch"(%arg2) <{cacheLevel = #nvvm<prefetch_cache_level L1>, uniform}> : (!llvm.ptr) -> ()
    "llvm.return"() : () -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (ptr, ptr<4>)>, linkage = #llvm.linkage<external>, sym_name = "prefetch_tensormap", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg0: !llvm.ptr, %arg1: !llvm.ptr<4>):
    "nvvm.prefetch"(%arg0) <{tensormap}> : (!llvm.ptr) -> ()
    "nvvm.prefetch"(%arg1) <{tensormap}> : (!llvm.ptr<4>) -> ()
    "nvvm.prefetch"(%arg0) <{in_param_space, tensormap}> : (!llvm.ptr) -> ()
    "llvm.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

