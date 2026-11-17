"builtin.module"() ({
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void ()>, linkage = #llvm.linkage<external>, sym_name = "llvm_nvvm_fence_sc_cluster", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
    "nvvm.fence.sc.cluster"() : () -> () loc("<stdin>":3:5)
    "llvm.return"() : () -> () loc("<stdin>":4:5)
  }) : () -> () loc("<stdin>":2:3)
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void ()>, linkage = #llvm.linkage<external>, sym_name = "nvvm_fence_sync_restrict", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
    "nvvm.fence.sync_restrict"() <{order = #nvvm.mem_order<acquire>}> : () -> () loc("<stdin>":7:5)
    "nvvm.fence.sync_restrict"() <{order = #nvvm.mem_order<release>}> : () -> () loc("<stdin>":8:5)
    "llvm.return"() : () -> () loc("<stdin>":9:5)
  }) : () -> () loc("<stdin>":6:3)
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void ()>, linkage = #llvm.linkage<external>, sym_name = "fence_mbarrier_init", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
    "nvvm.fence.mbarrier.init"() : () -> () loc("<stdin>":12:5)
    "llvm.return"() : () -> () loc("<stdin>":13:5)
  }) : () -> () loc("<stdin>":11:3)
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void ()>, linkage = #llvm.linkage<external>, sym_name = "nvvm_fence_proxy", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
    "nvvm.fence.proxy"() <{kind = #nvvm.proxy_kind<alias>}> : () -> () loc("<stdin>":16:5)
    "nvvm.fence.proxy"() <{kind = #nvvm.proxy_kind<async>}> : () -> () loc("<stdin>":17:5)
    "nvvm.fence.proxy"() <{kind = #nvvm.proxy_kind<async.global>}> : () -> () loc("<stdin>":18:5)
    "nvvm.fence.proxy"() <{kind = #nvvm.proxy_kind<async.shared>, space = #nvvm.shared_space<cta>}> : () -> () loc("<stdin>":19:5)
    "nvvm.fence.proxy"() <{kind = #nvvm.proxy_kind<async.shared>, space = #nvvm.shared_space<cluster>}> : () -> () loc("<stdin>":20:5)
    "llvm.return"() : () -> () loc("<stdin>":21:5)
  }) : () -> () loc("<stdin>":15:3)
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void ()>, linkage = #llvm.linkage<external>, sym_name = "nvvm_fence_proxy_sync_restrict", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
    "nvvm.fence.proxy.sync_restrict"() <{fromProxy = #nvvm.proxy_kind<generic>, order = #nvvm.mem_order<acquire>, toProxy = #nvvm.proxy_kind<async>}> : () -> () loc("<stdin>":24:5)
    "nvvm.fence.proxy.sync_restrict"() <{fromProxy = #nvvm.proxy_kind<generic>, order = #nvvm.mem_order<release>, toProxy = #nvvm.proxy_kind<async>}> : () -> () loc("<stdin>":25:5)
    "llvm.return"() : () -> () loc("<stdin>":26:5)
  }) : () -> () loc("<stdin>":23:3)
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void ()>, linkage = #llvm.linkage<external>, sym_name = "nvvm_fence_proxy_tensormap_generic_release", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
    "nvvm.fence.proxy.release"() <{fromProxy = #nvvm.proxy_kind<generic>, scope = #nvvm.mem_scope<cta>, toProxy = #nvvm.proxy_kind<tensormap>}> : () -> () loc("<stdin>":29:5)
    "nvvm.fence.proxy.release"() <{fromProxy = #nvvm.proxy_kind<generic>, scope = #nvvm.mem_scope<cluster>, toProxy = #nvvm.proxy_kind<tensormap>}> : () -> () loc("<stdin>":30:5)
    "nvvm.fence.proxy.release"() <{fromProxy = #nvvm.proxy_kind<generic>, scope = #nvvm.mem_scope<gpu>, toProxy = #nvvm.proxy_kind<tensormap>}> : () -> () loc("<stdin>":31:5)
    "nvvm.fence.proxy.release"() <{fromProxy = #nvvm.proxy_kind<generic>, scope = #nvvm.mem_scope<sys>, toProxy = #nvvm.proxy_kind<tensormap>}> : () -> () loc("<stdin>":32:5)
    "llvm.return"() : () -> () loc("<stdin>":33:5)
  }) : () -> () loc("<stdin>":28:3)
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (ptr)>, linkage = #llvm.linkage<external>, sym_name = "nvvm_fence_proxy_tensormap_generic_acquire", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg0: !llvm.ptr loc("<stdin>":36:8)):
    %0 = "llvm.mlir.constant"() <{value = 128 : i64}> : () -> i32 loc("<stdin>":37:10)
    "nvvm.fence.proxy.acquire"(%arg0, %0) <{fromProxy = #nvvm.proxy_kind<generic>, scope = #nvvm.mem_scope<cta>, toProxy = #nvvm.proxy_kind<tensormap>}> : (!llvm.ptr, i32) -> () loc("<stdin>":38:5)
    "nvvm.fence.proxy.acquire"(%arg0, %0) <{fromProxy = #nvvm.proxy_kind<generic>, scope = #nvvm.mem_scope<cluster>, toProxy = #nvvm.proxy_kind<tensormap>}> : (!llvm.ptr, i32) -> () loc("<stdin>":39:5)
    "nvvm.fence.proxy.acquire"(%arg0, %0) <{fromProxy = #nvvm.proxy_kind<generic>, scope = #nvvm.mem_scope<gpu>, toProxy = #nvvm.proxy_kind<tensormap>}> : (!llvm.ptr, i32) -> () loc("<stdin>":40:5)
    "nvvm.fence.proxy.acquire"(%arg0, %0) <{fromProxy = #nvvm.proxy_kind<generic>, scope = #nvvm.mem_scope<sys>, toProxy = #nvvm.proxy_kind<tensormap>}> : (!llvm.ptr, i32) -> () loc("<stdin>":41:5)
    "llvm.return"() : () -> () loc("<stdin>":42:5)
  }) : () -> () loc("<stdin>":35:3)
}) : () -> () loc("<stdin>":1:1)
