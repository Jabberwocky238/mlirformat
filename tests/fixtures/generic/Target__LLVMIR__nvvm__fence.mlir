"builtin.module"() ({
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void ()>, linkage = #llvm.linkage<external>, sym_name = "llvm_nvvm_fence_sc_cluster", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
    "nvvm.fence.sc.cluster"() : () -> ()
    "llvm.return"() : () -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void ()>, linkage = #llvm.linkage<external>, sym_name = "nvvm_fence_sync_restrict", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
    "nvvm.fence.sync_restrict"() <{order = #nvvm.mem_order<acquire>}> : () -> ()
    "nvvm.fence.sync_restrict"() <{order = #nvvm.mem_order<release>}> : () -> ()
    "llvm.return"() : () -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void ()>, linkage = #llvm.linkage<external>, sym_name = "fence_mbarrier_init", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
    "nvvm.fence.mbarrier.init"() : () -> ()
    "llvm.return"() : () -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void ()>, linkage = #llvm.linkage<external>, sym_name = "nvvm_fence_proxy", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
    "nvvm.fence.proxy"() <{kind = #nvvm.proxy_kind<alias>}> : () -> ()
    "nvvm.fence.proxy"() <{kind = #nvvm.proxy_kind<async>}> : () -> ()
    "nvvm.fence.proxy"() <{kind = #nvvm.proxy_kind<async.global>}> : () -> ()
    "nvvm.fence.proxy"() <{kind = #nvvm.proxy_kind<async.shared>, space = #nvvm.shared_space<cta>}> : () -> ()
    "nvvm.fence.proxy"() <{kind = #nvvm.proxy_kind<async.shared>, space = #nvvm.shared_space<cluster>}> : () -> ()
    "llvm.return"() : () -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void ()>, linkage = #llvm.linkage<external>, sym_name = "nvvm_fence_proxy_sync_restrict", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
    "nvvm.fence.proxy.sync_restrict"() <{fromProxy = #nvvm.proxy_kind<generic>, order = #nvvm.mem_order<acquire>, toProxy = #nvvm.proxy_kind<async>}> : () -> ()
    "nvvm.fence.proxy.sync_restrict"() <{fromProxy = #nvvm.proxy_kind<generic>, order = #nvvm.mem_order<release>, toProxy = #nvvm.proxy_kind<async>}> : () -> ()
    "llvm.return"() : () -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void ()>, linkage = #llvm.linkage<external>, sym_name = "nvvm_fence_proxy_tensormap_generic_release", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
    "nvvm.fence.proxy.release"() <{fromProxy = #nvvm.proxy_kind<generic>, scope = #nvvm.mem_scope<cta>, toProxy = #nvvm.proxy_kind<tensormap>}> : () -> ()
    "nvvm.fence.proxy.release"() <{fromProxy = #nvvm.proxy_kind<generic>, scope = #nvvm.mem_scope<cluster>, toProxy = #nvvm.proxy_kind<tensormap>}> : () -> ()
    "nvvm.fence.proxy.release"() <{fromProxy = #nvvm.proxy_kind<generic>, scope = #nvvm.mem_scope<gpu>, toProxy = #nvvm.proxy_kind<tensormap>}> : () -> ()
    "nvvm.fence.proxy.release"() <{fromProxy = #nvvm.proxy_kind<generic>, scope = #nvvm.mem_scope<sys>, toProxy = #nvvm.proxy_kind<tensormap>}> : () -> ()
    "llvm.return"() : () -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (ptr)>, linkage = #llvm.linkage<external>, sym_name = "nvvm_fence_proxy_tensormap_generic_acquire", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg0: !llvm.ptr):
    %0 = "llvm.mlir.constant"() <{value = 128 : i64}> : () -> i32
    "nvvm.fence.proxy.acquire"(%arg0, %0) <{fromProxy = #nvvm.proxy_kind<generic>, scope = #nvvm.mem_scope<cta>, toProxy = #nvvm.proxy_kind<tensormap>}> : (!llvm.ptr, i32) -> ()
    "nvvm.fence.proxy.acquire"(%arg0, %0) <{fromProxy = #nvvm.proxy_kind<generic>, scope = #nvvm.mem_scope<cluster>, toProxy = #nvvm.proxy_kind<tensormap>}> : (!llvm.ptr, i32) -> ()
    "nvvm.fence.proxy.acquire"(%arg0, %0) <{fromProxy = #nvvm.proxy_kind<generic>, scope = #nvvm.mem_scope<gpu>, toProxy = #nvvm.proxy_kind<tensormap>}> : (!llvm.ptr, i32) -> ()
    "nvvm.fence.proxy.acquire"(%arg0, %0) <{fromProxy = #nvvm.proxy_kind<generic>, scope = #nvvm.mem_scope<sys>, toProxy = #nvvm.proxy_kind<tensormap>}> : (!llvm.ptr, i32) -> ()
    "llvm.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

