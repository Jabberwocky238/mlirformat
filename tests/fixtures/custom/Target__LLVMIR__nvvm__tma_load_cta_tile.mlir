module {
  llvm.func @tma_load_1d_all_tile(%arg0: !llvm.ptr, %arg1: !llvm.ptr<3>, %arg2: !llvm.ptr<3>, %arg3: i32, %arg4: i64) {
    nvvm.cp.async.bulk.tensor.shared.cluster.global %arg1, %arg0, %arg2, box[%arg3] {isCTAOnly = true} : !llvm.ptr<3>, !llvm.ptr
    nvvm.cp.async.bulk.tensor.shared.cluster.global %arg1, %arg0, %arg2, box[%arg3] l2_cache_hint = %arg4 {isCTAOnly = true} : !llvm.ptr<3>, !llvm.ptr
    llvm.return
  }
  llvm.func @tma_load_2d_all_tile(%arg0: !llvm.ptr, %arg1: !llvm.ptr<3>, %arg2: !llvm.ptr<3>, %arg3: i32, %arg4: i32, %arg5: i64) {
    nvvm.cp.async.bulk.tensor.shared.cluster.global %arg1, %arg0, %arg2, box[%arg3, %arg4] {isCTAOnly = true} : !llvm.ptr<3>, !llvm.ptr
    nvvm.cp.async.bulk.tensor.shared.cluster.global %arg1, %arg0, %arg2, box[%arg3, %arg4] l2_cache_hint = %arg5 {isCTAOnly = true} : !llvm.ptr<3>, !llvm.ptr
    llvm.return
  }
  llvm.func @tma_load_3d_all_tile(%arg0: !llvm.ptr, %arg1: !llvm.ptr<3>, %arg2: !llvm.ptr<3>, %arg3: i32, %arg4: i32, %arg5: i32, %arg6: i64) {
    nvvm.cp.async.bulk.tensor.shared.cluster.global %arg1, %arg0, %arg2, box[%arg3, %arg4, %arg5] {isCTAOnly = true} : !llvm.ptr<3>, !llvm.ptr
    nvvm.cp.async.bulk.tensor.shared.cluster.global %arg1, %arg0, %arg2, box[%arg3, %arg4, %arg5] l2_cache_hint = %arg6 {isCTAOnly = true} : !llvm.ptr<3>, !llvm.ptr
    llvm.return
  }
  llvm.func @tma_load_4d_all_tile(%arg0: !llvm.ptr, %arg1: !llvm.ptr<3>, %arg2: !llvm.ptr<3>, %arg3: i32, %arg4: i32, %arg5: i32, %arg6: i32, %arg7: i64) {
    nvvm.cp.async.bulk.tensor.shared.cluster.global %arg1, %arg0, %arg2, box[%arg3, %arg4, %arg5, %arg6] {isCTAOnly = true} : !llvm.ptr<3>, !llvm.ptr
    nvvm.cp.async.bulk.tensor.shared.cluster.global %arg1, %arg0, %arg2, box[%arg3, %arg4, %arg5, %arg6] l2_cache_hint = %arg7 {isCTAOnly = true} : !llvm.ptr<3>, !llvm.ptr
    llvm.return
  }
  llvm.func @tma_load_5d_all(%arg0: !llvm.ptr, %arg1: !llvm.ptr<3>, %arg2: !llvm.ptr<3>, %arg3: i32, %arg4: i32, %arg5: i32, %arg6: i32, %arg7: i32, %arg8: i64) {
    nvvm.cp.async.bulk.tensor.shared.cluster.global %arg1, %arg0, %arg2, box[%arg3, %arg4, %arg5, %arg6, %arg7] {isCTAOnly = true} : !llvm.ptr<3>, !llvm.ptr
    nvvm.cp.async.bulk.tensor.shared.cluster.global %arg1, %arg0, %arg2, box[%arg3, %arg4, %arg5, %arg6, %arg7] l2_cache_hint = %arg8 {isCTAOnly = true} : !llvm.ptr<3>, !llvm.ptr
    llvm.return
  }
  llvm.func @tma_load_2d_tile_gather4(%arg0: !llvm.ptr, %arg1: !llvm.ptr<3>, %arg2: !llvm.ptr<3>, %arg3: i32, %arg4: i32, %arg5: i32, %arg6: i32, %arg7: i32, %arg8: i64) {
    nvvm.cp.async.bulk.tensor.shared.cluster.global %arg1, %arg0, %arg2, box[%arg3, %arg4, %arg5, %arg6, %arg7] {isCTAOnly = true, mode = #nvvm.tma_load_mode<tile_gather4>} : !llvm.ptr<3>, !llvm.ptr
    nvvm.cp.async.bulk.tensor.shared.cluster.global %arg1, %arg0, %arg2, box[%arg3, %arg4, %arg5, %arg6, %arg7] l2_cache_hint = %arg8 {isCTAOnly = true, mode = #nvvm.tma_load_mode<tile_gather4>} : !llvm.ptr<3>, !llvm.ptr
    llvm.return
  }
}

