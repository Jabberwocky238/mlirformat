module {
  llvm.func @tma_load_1d_all_tile(%arg0: !llvm.ptr, %arg1: !llvm.ptr<7>, %arg2: !llvm.ptr<3>, %arg3: i32, %arg4: i16, %arg5: i64) {
    nvvm.cp.async.bulk.tensor.shared.cluster.global %arg1, %arg0, %arg2, box[%arg3] : !llvm.ptr<7>, !llvm.ptr
    nvvm.cp.async.bulk.tensor.shared.cluster.global %arg1, %arg0, %arg2, box[%arg3] l2_cache_hint = %arg5 : !llvm.ptr<7>, !llvm.ptr
    nvvm.cp.async.bulk.tensor.shared.cluster.global %arg1, %arg0, %arg2, box[%arg3] multicast_mask = %arg4 : !llvm.ptr<7>, !llvm.ptr
    nvvm.cp.async.bulk.tensor.shared.cluster.global %arg1, %arg0, %arg2, box[%arg3] multicast_mask = %arg4 l2_cache_hint = %arg5 : !llvm.ptr<7>, !llvm.ptr
    nvvm.cp.async.bulk.tensor.shared.cluster.global %arg1, %arg0, %arg2, box[%arg3] {group = #nvvm.cta_group<cta_1>} : !llvm.ptr<7>, !llvm.ptr
    nvvm.cp.async.bulk.tensor.shared.cluster.global %arg1, %arg0, %arg2, box[%arg3] l2_cache_hint = %arg5 {group = #nvvm.cta_group<cta_1>} : !llvm.ptr<7>, !llvm.ptr
    nvvm.cp.async.bulk.tensor.shared.cluster.global %arg1, %arg0, %arg2, box[%arg3] multicast_mask = %arg4 {group = #nvvm.cta_group<cta_1>} : !llvm.ptr<7>, !llvm.ptr
    nvvm.cp.async.bulk.tensor.shared.cluster.global %arg1, %arg0, %arg2, box[%arg3] multicast_mask = %arg4 l2_cache_hint = %arg5 {group = #nvvm.cta_group<cta_1>} : !llvm.ptr<7>, !llvm.ptr
    nvvm.cp.async.bulk.tensor.shared.cluster.global %arg1, %arg0, %arg2, box[%arg3] {group = #nvvm.cta_group<cta_2>} : !llvm.ptr<7>, !llvm.ptr
    nvvm.cp.async.bulk.tensor.shared.cluster.global %arg1, %arg0, %arg2, box[%arg3] l2_cache_hint = %arg5 {group = #nvvm.cta_group<cta_2>} : !llvm.ptr<7>, !llvm.ptr
    nvvm.cp.async.bulk.tensor.shared.cluster.global %arg1, %arg0, %arg2, box[%arg3] multicast_mask = %arg4 {group = #nvvm.cta_group<cta_2>} : !llvm.ptr<7>, !llvm.ptr
    nvvm.cp.async.bulk.tensor.shared.cluster.global %arg1, %arg0, %arg2, box[%arg3] multicast_mask = %arg4 l2_cache_hint = %arg5 {group = #nvvm.cta_group<cta_2>} : !llvm.ptr<7>, !llvm.ptr
    llvm.return
  }
  llvm.func @tma_load_2d_all_tile(%arg0: !llvm.ptr, %arg1: !llvm.ptr<7>, %arg2: !llvm.ptr<3>, %arg3: i32, %arg4: i32, %arg5: i16, %arg6: i64) {
    nvvm.cp.async.bulk.tensor.shared.cluster.global %arg1, %arg0, %arg2, box[%arg3, %arg4] : !llvm.ptr<7>, !llvm.ptr
    nvvm.cp.async.bulk.tensor.shared.cluster.global %arg1, %arg0, %arg2, box[%arg3, %arg4] l2_cache_hint = %arg6 : !llvm.ptr<7>, !llvm.ptr
    nvvm.cp.async.bulk.tensor.shared.cluster.global %arg1, %arg0, %arg2, box[%arg3, %arg4] multicast_mask = %arg5 : !llvm.ptr<7>, !llvm.ptr
    nvvm.cp.async.bulk.tensor.shared.cluster.global %arg1, %arg0, %arg2, box[%arg3, %arg4] multicast_mask = %arg5 l2_cache_hint = %arg6 : !llvm.ptr<7>, !llvm.ptr
    nvvm.cp.async.bulk.tensor.shared.cluster.global %arg1, %arg0, %arg2, box[%arg3, %arg4] {group = #nvvm.cta_group<cta_1>} : !llvm.ptr<7>, !llvm.ptr
    nvvm.cp.async.bulk.tensor.shared.cluster.global %arg1, %arg0, %arg2, box[%arg3, %arg4] l2_cache_hint = %arg6 {group = #nvvm.cta_group<cta_1>} : !llvm.ptr<7>, !llvm.ptr
    nvvm.cp.async.bulk.tensor.shared.cluster.global %arg1, %arg0, %arg2, box[%arg3, %arg4] multicast_mask = %arg5 {group = #nvvm.cta_group<cta_1>} : !llvm.ptr<7>, !llvm.ptr
    nvvm.cp.async.bulk.tensor.shared.cluster.global %arg1, %arg0, %arg2, box[%arg3, %arg4] multicast_mask = %arg5 l2_cache_hint = %arg6 {group = #nvvm.cta_group<cta_1>} : !llvm.ptr<7>, !llvm.ptr
    nvvm.cp.async.bulk.tensor.shared.cluster.global %arg1, %arg0, %arg2, box[%arg3, %arg4] {group = #nvvm.cta_group<cta_2>} : !llvm.ptr<7>, !llvm.ptr
    nvvm.cp.async.bulk.tensor.shared.cluster.global %arg1, %arg0, %arg2, box[%arg3, %arg4] l2_cache_hint = %arg6 {group = #nvvm.cta_group<cta_2>} : !llvm.ptr<7>, !llvm.ptr
    nvvm.cp.async.bulk.tensor.shared.cluster.global %arg1, %arg0, %arg2, box[%arg3, %arg4] multicast_mask = %arg5 {group = #nvvm.cta_group<cta_2>} : !llvm.ptr<7>, !llvm.ptr
    nvvm.cp.async.bulk.tensor.shared.cluster.global %arg1, %arg0, %arg2, box[%arg3, %arg4] multicast_mask = %arg5 l2_cache_hint = %arg6 {group = #nvvm.cta_group<cta_2>} : !llvm.ptr<7>, !llvm.ptr
    llvm.return
  }
  llvm.func @tma_load_3d_all_tile(%arg0: !llvm.ptr, %arg1: !llvm.ptr<7>, %arg2: !llvm.ptr<3>, %arg3: i32, %arg4: i32, %arg5: i32, %arg6: i16, %arg7: i64) {
    nvvm.cp.async.bulk.tensor.shared.cluster.global %arg1, %arg0, %arg2, box[%arg3, %arg4, %arg5] : !llvm.ptr<7>, !llvm.ptr
    nvvm.cp.async.bulk.tensor.shared.cluster.global %arg1, %arg0, %arg2, box[%arg3, %arg4, %arg5] l2_cache_hint = %arg7 : !llvm.ptr<7>, !llvm.ptr
    nvvm.cp.async.bulk.tensor.shared.cluster.global %arg1, %arg0, %arg2, box[%arg3, %arg4, %arg5] multicast_mask = %arg6 : !llvm.ptr<7>, !llvm.ptr
    nvvm.cp.async.bulk.tensor.shared.cluster.global %arg1, %arg0, %arg2, box[%arg3, %arg4, %arg5] multicast_mask = %arg6 l2_cache_hint = %arg7 : !llvm.ptr<7>, !llvm.ptr
    nvvm.cp.async.bulk.tensor.shared.cluster.global %arg1, %arg0, %arg2, box[%arg3, %arg4, %arg5] {group = #nvvm.cta_group<cta_1>} : !llvm.ptr<7>, !llvm.ptr
    nvvm.cp.async.bulk.tensor.shared.cluster.global %arg1, %arg0, %arg2, box[%arg3, %arg4, %arg5] l2_cache_hint = %arg7 {group = #nvvm.cta_group<cta_1>} : !llvm.ptr<7>, !llvm.ptr
    nvvm.cp.async.bulk.tensor.shared.cluster.global %arg1, %arg0, %arg2, box[%arg3, %arg4, %arg5] multicast_mask = %arg6 {group = #nvvm.cta_group<cta_1>} : !llvm.ptr<7>, !llvm.ptr
    nvvm.cp.async.bulk.tensor.shared.cluster.global %arg1, %arg0, %arg2, box[%arg3, %arg4, %arg5] multicast_mask = %arg6 l2_cache_hint = %arg7 {group = #nvvm.cta_group<cta_1>} : !llvm.ptr<7>, !llvm.ptr
    nvvm.cp.async.bulk.tensor.shared.cluster.global %arg1, %arg0, %arg2, box[%arg3, %arg4, %arg5] {group = #nvvm.cta_group<cta_2>} : !llvm.ptr<7>, !llvm.ptr
    nvvm.cp.async.bulk.tensor.shared.cluster.global %arg1, %arg0, %arg2, box[%arg3, %arg4, %arg5] l2_cache_hint = %arg7 {group = #nvvm.cta_group<cta_2>} : !llvm.ptr<7>, !llvm.ptr
    nvvm.cp.async.bulk.tensor.shared.cluster.global %arg1, %arg0, %arg2, box[%arg3, %arg4, %arg5] multicast_mask = %arg6 {group = #nvvm.cta_group<cta_2>} : !llvm.ptr<7>, !llvm.ptr
    nvvm.cp.async.bulk.tensor.shared.cluster.global %arg1, %arg0, %arg2, box[%arg3, %arg4, %arg5] multicast_mask = %arg6 l2_cache_hint = %arg7 {group = #nvvm.cta_group<cta_2>} : !llvm.ptr<7>, !llvm.ptr
    llvm.return
  }
  llvm.func @tma_load_4d_all_tile(%arg0: !llvm.ptr, %arg1: !llvm.ptr<7>, %arg2: !llvm.ptr<3>, %arg3: i32, %arg4: i32, %arg5: i32, %arg6: i32, %arg7: i16, %arg8: i64) {
    nvvm.cp.async.bulk.tensor.shared.cluster.global %arg1, %arg0, %arg2, box[%arg3, %arg4, %arg5, %arg6] : !llvm.ptr<7>, !llvm.ptr
    nvvm.cp.async.bulk.tensor.shared.cluster.global %arg1, %arg0, %arg2, box[%arg3, %arg4, %arg5, %arg6] l2_cache_hint = %arg8 : !llvm.ptr<7>, !llvm.ptr
    nvvm.cp.async.bulk.tensor.shared.cluster.global %arg1, %arg0, %arg2, box[%arg3, %arg4, %arg5, %arg6] multicast_mask = %arg7 : !llvm.ptr<7>, !llvm.ptr
    nvvm.cp.async.bulk.tensor.shared.cluster.global %arg1, %arg0, %arg2, box[%arg3, %arg4, %arg5, %arg6] multicast_mask = %arg7 l2_cache_hint = %arg8 : !llvm.ptr<7>, !llvm.ptr
    nvvm.cp.async.bulk.tensor.shared.cluster.global %arg1, %arg0, %arg2, box[%arg3, %arg4, %arg5, %arg6] {group = #nvvm.cta_group<cta_1>} : !llvm.ptr<7>, !llvm.ptr
    nvvm.cp.async.bulk.tensor.shared.cluster.global %arg1, %arg0, %arg2, box[%arg3, %arg4, %arg5, %arg6] l2_cache_hint = %arg8 {group = #nvvm.cta_group<cta_1>} : !llvm.ptr<7>, !llvm.ptr
    nvvm.cp.async.bulk.tensor.shared.cluster.global %arg1, %arg0, %arg2, box[%arg3, %arg4, %arg5, %arg6] multicast_mask = %arg7 {group = #nvvm.cta_group<cta_1>} : !llvm.ptr<7>, !llvm.ptr
    nvvm.cp.async.bulk.tensor.shared.cluster.global %arg1, %arg0, %arg2, box[%arg3, %arg4, %arg5, %arg6] multicast_mask = %arg7 l2_cache_hint = %arg8 {group = #nvvm.cta_group<cta_1>} : !llvm.ptr<7>, !llvm.ptr
    nvvm.cp.async.bulk.tensor.shared.cluster.global %arg1, %arg0, %arg2, box[%arg3, %arg4, %arg5, %arg6] {group = #nvvm.cta_group<cta_2>} : !llvm.ptr<7>, !llvm.ptr
    nvvm.cp.async.bulk.tensor.shared.cluster.global %arg1, %arg0, %arg2, box[%arg3, %arg4, %arg5, %arg6] l2_cache_hint = %arg8 {group = #nvvm.cta_group<cta_2>} : !llvm.ptr<7>, !llvm.ptr
    nvvm.cp.async.bulk.tensor.shared.cluster.global %arg1, %arg0, %arg2, box[%arg3, %arg4, %arg5, %arg6] multicast_mask = %arg7 {group = #nvvm.cta_group<cta_2>} : !llvm.ptr<7>, !llvm.ptr
    nvvm.cp.async.bulk.tensor.shared.cluster.global %arg1, %arg0, %arg2, box[%arg3, %arg4, %arg5, %arg6] multicast_mask = %arg7 l2_cache_hint = %arg8 {group = #nvvm.cta_group<cta_2>} : !llvm.ptr<7>, !llvm.ptr
    llvm.return
  }
  llvm.func @tma_load_5d_all(%arg0: !llvm.ptr, %arg1: !llvm.ptr<7>, %arg2: !llvm.ptr<3>, %arg3: i32, %arg4: i32, %arg5: i32, %arg6: i32, %arg7: i32, %arg8: i16, %arg9: i64) {
    nvvm.cp.async.bulk.tensor.shared.cluster.global %arg1, %arg0, %arg2, box[%arg3, %arg4, %arg5, %arg6, %arg7] : !llvm.ptr<7>, !llvm.ptr
    nvvm.cp.async.bulk.tensor.shared.cluster.global %arg1, %arg0, %arg2, box[%arg3, %arg4, %arg5, %arg6, %arg7] multicast_mask = %arg8 : !llvm.ptr<7>, !llvm.ptr
    nvvm.cp.async.bulk.tensor.shared.cluster.global %arg1, %arg0, %arg2, box[%arg3, %arg4, %arg5, %arg6, %arg7] l2_cache_hint = %arg9 : !llvm.ptr<7>, !llvm.ptr
    nvvm.cp.async.bulk.tensor.shared.cluster.global %arg1, %arg0, %arg2, box[%arg3, %arg4, %arg5, %arg6, %arg7] multicast_mask = %arg8 l2_cache_hint = %arg9 : !llvm.ptr<7>, !llvm.ptr
    nvvm.cp.async.bulk.tensor.shared.cluster.global %arg1, %arg0, %arg2, box[%arg3, %arg4, %arg5, %arg6, %arg7] {group = #nvvm.cta_group<cta_1>} : !llvm.ptr<7>, !llvm.ptr
    nvvm.cp.async.bulk.tensor.shared.cluster.global %arg1, %arg0, %arg2, box[%arg3, %arg4, %arg5, %arg6, %arg7] multicast_mask = %arg8 {group = #nvvm.cta_group<cta_1>} : !llvm.ptr<7>, !llvm.ptr
    nvvm.cp.async.bulk.tensor.shared.cluster.global %arg1, %arg0, %arg2, box[%arg3, %arg4, %arg5, %arg6, %arg7] l2_cache_hint = %arg9 {group = #nvvm.cta_group<cta_1>} : !llvm.ptr<7>, !llvm.ptr
    nvvm.cp.async.bulk.tensor.shared.cluster.global %arg1, %arg0, %arg2, box[%arg3, %arg4, %arg5, %arg6, %arg7] multicast_mask = %arg8 l2_cache_hint = %arg9 {group = #nvvm.cta_group<cta_1>} : !llvm.ptr<7>, !llvm.ptr
    nvvm.cp.async.bulk.tensor.shared.cluster.global %arg1, %arg0, %arg2, box[%arg3, %arg4, %arg5, %arg6, %arg7] {group = #nvvm.cta_group<cta_2>} : !llvm.ptr<7>, !llvm.ptr
    nvvm.cp.async.bulk.tensor.shared.cluster.global %arg1, %arg0, %arg2, box[%arg3, %arg4, %arg5, %arg6, %arg7] multicast_mask = %arg8 {group = #nvvm.cta_group<cta_2>} : !llvm.ptr<7>, !llvm.ptr
    nvvm.cp.async.bulk.tensor.shared.cluster.global %arg1, %arg0, %arg2, box[%arg3, %arg4, %arg5, %arg6, %arg7] l2_cache_hint = %arg9 {group = #nvvm.cta_group<cta_2>} : !llvm.ptr<7>, !llvm.ptr
    nvvm.cp.async.bulk.tensor.shared.cluster.global %arg1, %arg0, %arg2, box[%arg3, %arg4, %arg5, %arg6, %arg7] multicast_mask = %arg8 l2_cache_hint = %arg9 {group = #nvvm.cta_group<cta_2>} : !llvm.ptr<7>, !llvm.ptr
    llvm.return
  }
  llvm.func @tma_load_2d_tile_gather4(%arg0: !llvm.ptr, %arg1: !llvm.ptr<7>, %arg2: !llvm.ptr<3>, %arg3: i32, %arg4: i32, %arg5: i32, %arg6: i32, %arg7: i32, %arg8: i16, %arg9: i64) {
    nvvm.cp.async.bulk.tensor.shared.cluster.global %arg1, %arg0, %arg2, box[%arg3, %arg4, %arg5, %arg6, %arg7] {mode = #nvvm.tma_load_mode<tile_gather4>} : !llvm.ptr<7>, !llvm.ptr
    nvvm.cp.async.bulk.tensor.shared.cluster.global %arg1, %arg0, %arg2, box[%arg3, %arg4, %arg5, %arg6, %arg7] multicast_mask = %arg8 {mode = #nvvm.tma_load_mode<tile_gather4>} : !llvm.ptr<7>, !llvm.ptr
    nvvm.cp.async.bulk.tensor.shared.cluster.global %arg1, %arg0, %arg2, box[%arg3, %arg4, %arg5, %arg6, %arg7] l2_cache_hint = %arg9 {mode = #nvvm.tma_load_mode<tile_gather4>} : !llvm.ptr<7>, !llvm.ptr
    nvvm.cp.async.bulk.tensor.shared.cluster.global %arg1, %arg0, %arg2, box[%arg3, %arg4, %arg5, %arg6, %arg7] multicast_mask = %arg8 l2_cache_hint = %arg9 {mode = #nvvm.tma_load_mode<tile_gather4>} : !llvm.ptr<7>, !llvm.ptr
    nvvm.cp.async.bulk.tensor.shared.cluster.global %arg1, %arg0, %arg2, box[%arg3, %arg4, %arg5, %arg6, %arg7] {group = #nvvm.cta_group<cta_1>, mode = #nvvm.tma_load_mode<tile_gather4>} : !llvm.ptr<7>, !llvm.ptr
    nvvm.cp.async.bulk.tensor.shared.cluster.global %arg1, %arg0, %arg2, box[%arg3, %arg4, %arg5, %arg6, %arg7] multicast_mask = %arg8 {group = #nvvm.cta_group<cta_1>, mode = #nvvm.tma_load_mode<tile_gather4>} : !llvm.ptr<7>, !llvm.ptr
    nvvm.cp.async.bulk.tensor.shared.cluster.global %arg1, %arg0, %arg2, box[%arg3, %arg4, %arg5, %arg6, %arg7] l2_cache_hint = %arg9 {group = #nvvm.cta_group<cta_1>, mode = #nvvm.tma_load_mode<tile_gather4>} : !llvm.ptr<7>, !llvm.ptr
    nvvm.cp.async.bulk.tensor.shared.cluster.global %arg1, %arg0, %arg2, box[%arg3, %arg4, %arg5, %arg6, %arg7] multicast_mask = %arg8 l2_cache_hint = %arg9 {group = #nvvm.cta_group<cta_1>, mode = #nvvm.tma_load_mode<tile_gather4>} : !llvm.ptr<7>, !llvm.ptr
    nvvm.cp.async.bulk.tensor.shared.cluster.global %arg1, %arg0, %arg2, box[%arg3, %arg4, %arg5, %arg6, %arg7] {group = #nvvm.cta_group<cta_2>, mode = #nvvm.tma_load_mode<tile_gather4>} : !llvm.ptr<7>, !llvm.ptr
    nvvm.cp.async.bulk.tensor.shared.cluster.global %arg1, %arg0, %arg2, box[%arg3, %arg4, %arg5, %arg6, %arg7] multicast_mask = %arg8 {group = #nvvm.cta_group<cta_2>, mode = #nvvm.tma_load_mode<tile_gather4>} : !llvm.ptr<7>, !llvm.ptr
    nvvm.cp.async.bulk.tensor.shared.cluster.global %arg1, %arg0, %arg2, box[%arg3, %arg4, %arg5, %arg6, %arg7] l2_cache_hint = %arg9 {group = #nvvm.cta_group<cta_2>, mode = #nvvm.tma_load_mode<tile_gather4>} : !llvm.ptr<7>, !llvm.ptr
    nvvm.cp.async.bulk.tensor.shared.cluster.global %arg1, %arg0, %arg2, box[%arg3, %arg4, %arg5, %arg6, %arg7] multicast_mask = %arg8 l2_cache_hint = %arg9 {group = #nvvm.cta_group<cta_2>, mode = #nvvm.tma_load_mode<tile_gather4>} : !llvm.ptr<7>, !llvm.ptr
    llvm.return
  }
}

