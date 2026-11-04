module {
  llvm.func @llvm_nvvm_cp_async_bulk_global_to_shared_cluster(%arg0: !llvm.ptr<7>, %arg1: !llvm.ptr<1>, %arg2: !llvm.ptr<3>, %arg3: i32, %arg4: i16, %arg5: i64) {
    nvvm.cp.async.bulk.shared.cluster.global %arg0, %arg1, %arg2, %arg3 : !llvm.ptr<7>, <1>
    nvvm.cp.async.bulk.shared.cluster.global %arg0, %arg1, %arg2, %arg3 l2_cache_hint = %arg5 : !llvm.ptr<7>, <1>
    nvvm.cp.async.bulk.shared.cluster.global %arg0, %arg1, %arg2, %arg3 multicast_mask = %arg4 : !llvm.ptr<7>, <1>
    nvvm.cp.async.bulk.shared.cluster.global %arg0, %arg1, %arg2, %arg3 multicast_mask = %arg4 l2_cache_hint = %arg5 : !llvm.ptr<7>, <1>
    llvm.return
  }
  llvm.func @llvm_nvvm_cp_async_bulk_global_to_shared_cta(%arg0: !llvm.ptr<3>, %arg1: !llvm.ptr<1>, %arg2: !llvm.ptr<3>, %arg3: i32, %arg4: i64) {
    nvvm.cp.async.bulk.shared.cluster.global %arg0, %arg1, %arg2, %arg3 : !llvm.ptr<3>, <1>
    nvvm.cp.async.bulk.shared.cluster.global %arg0, %arg1, %arg2, %arg3 l2_cache_hint = %arg4 : !llvm.ptr<3>, <1>
    llvm.return
  }
  llvm.func @llvm_nvvm_cp_async_bulk_shared_cta_to_shared_cluster(%arg0: !llvm.ptr<7>, %arg1: !llvm.ptr<3>, %arg2: !llvm.ptr<3>, %arg3: i32) {
    nvvm.cp.async.bulk.shared.cluster.shared.cta %arg0, %arg1, %arg2, %arg3 : <7>, <3>
    llvm.return
  }
  llvm.func @llvm_nvvm_cp_async_bulk_shared_cta_to_global(%arg0: !llvm.ptr<1>, %arg1: !llvm.ptr<3>, %arg2: i32, %arg3: i64) {
    nvvm.cp.async.bulk.global.shared.cta %arg0, %arg1, %arg2 : <1>, <3>
    nvvm.cp.async.bulk.global.shared.cta %arg0, %arg1, %arg2 l2_cache_hint = %arg3 : <1>, <3>
    llvm.return
  }
  llvm.func @llvm_nvvm_cp_async_bulk_shared_cta_to_global_bytemask(%arg0: !llvm.ptr<1>, %arg1: !llvm.ptr<3>, %arg2: i32, %arg3: i64, %arg4: i16) {
    nvvm.cp.async.bulk.global.shared.cta %arg0, %arg1, %arg2 byte_mask = %arg4 : <1>, <3>
    nvvm.cp.async.bulk.global.shared.cta %arg0, %arg1, %arg2 l2_cache_hint = %arg3 byte_mask = %arg4 : <1>, <3>
    llvm.return
  }
}

