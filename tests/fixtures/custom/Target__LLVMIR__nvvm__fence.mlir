module {
  llvm.func @llvm_nvvm_fence_sc_cluster() {
    nvvm.fence.sc.cluster
    llvm.return
  }
  llvm.func @nvvm_fence_sync_restrict() {
    nvvm.fence.sync_restrict {order = #nvvm.mem_order<acquire>}
    nvvm.fence.sync_restrict {order = #nvvm.mem_order<release>}
    llvm.return
  }
  llvm.func @fence_mbarrier_init() {
    nvvm.fence.mbarrier.init
    llvm.return
  }
  llvm.func @nvvm_fence_proxy() {
    nvvm.fence.proxy {kind = #nvvm.proxy_kind<alias>}
    nvvm.fence.proxy {kind = #nvvm.proxy_kind<async>}
    nvvm.fence.proxy {kind = #nvvm.proxy_kind<async.global>}
    nvvm.fence.proxy {kind = #nvvm.proxy_kind<async.shared>, space = #nvvm.shared_space<cta>}
    nvvm.fence.proxy {kind = #nvvm.proxy_kind<async.shared>, space = #nvvm.shared_space<cluster>}
    llvm.return
  }
  llvm.func @nvvm_fence_proxy_sync_restrict() {
    nvvm.fence.proxy.sync_restrict {order = #nvvm.mem_order<acquire>}
    nvvm.fence.proxy.sync_restrict {order = #nvvm.mem_order<release>}
    llvm.return
  }
  llvm.func @nvvm_fence_proxy_tensormap_generic_release() {
    nvvm.fence.proxy.release <cta>
    nvvm.fence.proxy.release <cluster>
    nvvm.fence.proxy.release <gpu>
    nvvm.fence.proxy.release <sys>
    llvm.return
  }
  llvm.func @nvvm_fence_proxy_tensormap_generic_acquire(%arg0: !llvm.ptr) {
    %0 = llvm.mlir.constant(128 : i64) : i32
    nvvm.fence.proxy.acquire <cta> %arg0, %0
    nvvm.fence.proxy.acquire <cluster> %arg0, %0
    nvvm.fence.proxy.acquire <gpu> %arg0, %0
    nvvm.fence.proxy.acquire <sys> %arg0, %0
    llvm.return
  }
}

