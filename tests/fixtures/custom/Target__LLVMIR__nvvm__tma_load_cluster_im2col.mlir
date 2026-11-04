module {
  llvm.func @tma_load_3d_im2col(%arg0: !llvm.ptr, %arg1: !llvm.ptr<7>, %arg2: !llvm.ptr<3>, %arg3: i32, %arg4: i32, %arg5: i32, %arg6: i16, %arg7: i16, %arg8: i64) {
    nvvm.cp.async.bulk.tensor.shared.cluster.global %arg1, %arg0, %arg2, box[%arg3, %arg4, %arg5] im2col[%arg6] {mode = #nvvm.tma_load_mode<im2col>} : !llvm.ptr<7>, !llvm.ptr
    nvvm.cp.async.bulk.tensor.shared.cluster.global %arg1, %arg0, %arg2, box[%arg3, %arg4, %arg5] im2col[%arg6] multicast_mask = %arg7 {mode = #nvvm.tma_load_mode<im2col>} : !llvm.ptr<7>, !llvm.ptr
    nvvm.cp.async.bulk.tensor.shared.cluster.global %arg1, %arg0, %arg2, box[%arg3, %arg4, %arg5] im2col[%arg6] l2_cache_hint = %arg8 {mode = #nvvm.tma_load_mode<im2col>} : !llvm.ptr<7>, !llvm.ptr
    nvvm.cp.async.bulk.tensor.shared.cluster.global %arg1, %arg0, %arg2, box[%arg3, %arg4, %arg5] im2col[%arg6] multicast_mask = %arg7 l2_cache_hint = %arg8 {mode = #nvvm.tma_load_mode<im2col>} : !llvm.ptr<7>, !llvm.ptr
    nvvm.cp.async.bulk.tensor.shared.cluster.global %arg1, %arg0, %arg2, box[%arg3, %arg4, %arg5] im2col[%arg6] {group = #nvvm.cta_group<cta_1>, mode = #nvvm.tma_load_mode<im2col>} : !llvm.ptr<7>, !llvm.ptr
    nvvm.cp.async.bulk.tensor.shared.cluster.global %arg1, %arg0, %arg2, box[%arg3, %arg4, %arg5] im2col[%arg6] multicast_mask = %arg7 {group = #nvvm.cta_group<cta_1>, mode = #nvvm.tma_load_mode<im2col>} : !llvm.ptr<7>, !llvm.ptr
    nvvm.cp.async.bulk.tensor.shared.cluster.global %arg1, %arg0, %arg2, box[%arg3, %arg4, %arg5] im2col[%arg6] l2_cache_hint = %arg8 {group = #nvvm.cta_group<cta_1>, mode = #nvvm.tma_load_mode<im2col>} : !llvm.ptr<7>, !llvm.ptr
    nvvm.cp.async.bulk.tensor.shared.cluster.global %arg1, %arg0, %arg2, box[%arg3, %arg4, %arg5] im2col[%arg6] multicast_mask = %arg7 l2_cache_hint = %arg8 {group = #nvvm.cta_group<cta_1>, mode = #nvvm.tma_load_mode<im2col>} : !llvm.ptr<7>, !llvm.ptr
    nvvm.cp.async.bulk.tensor.shared.cluster.global %arg1, %arg0, %arg2, box[%arg3, %arg4, %arg5] im2col[%arg6] {group = #nvvm.cta_group<cta_2>, mode = #nvvm.tma_load_mode<im2col>} : !llvm.ptr<7>, !llvm.ptr
    nvvm.cp.async.bulk.tensor.shared.cluster.global %arg1, %arg0, %arg2, box[%arg3, %arg4, %arg5] im2col[%arg6] multicast_mask = %arg7 {group = #nvvm.cta_group<cta_2>, mode = #nvvm.tma_load_mode<im2col>} : !llvm.ptr<7>, !llvm.ptr
    nvvm.cp.async.bulk.tensor.shared.cluster.global %arg1, %arg0, %arg2, box[%arg3, %arg4, %arg5] im2col[%arg6] l2_cache_hint = %arg8 {group = #nvvm.cta_group<cta_2>, mode = #nvvm.tma_load_mode<im2col>} : !llvm.ptr<7>, !llvm.ptr
    nvvm.cp.async.bulk.tensor.shared.cluster.global %arg1, %arg0, %arg2, box[%arg3, %arg4, %arg5] im2col[%arg6] multicast_mask = %arg7 l2_cache_hint = %arg8 {group = #nvvm.cta_group<cta_2>, mode = #nvvm.tma_load_mode<im2col>} : !llvm.ptr<7>, !llvm.ptr
    llvm.return
  }
  llvm.func @tma_load_4d_im2col(%arg0: !llvm.ptr, %arg1: !llvm.ptr<7>, %arg2: !llvm.ptr<3>, %arg3: i32, %arg4: i32, %arg5: i32, %arg6: i32, %arg7: i16, %arg8: i16, %arg9: i16, %arg10: i64) {
    nvvm.cp.async.bulk.tensor.shared.cluster.global %arg1, %arg0, %arg2, box[%arg3, %arg4, %arg5, %arg6] im2col[%arg7, %arg8] multicast_mask = %arg9 l2_cache_hint = %arg10 {mode = #nvvm.tma_load_mode<im2col>} : !llvm.ptr<7>, !llvm.ptr
    nvvm.cp.async.bulk.tensor.shared.cluster.global %arg1, %arg0, %arg2, box[%arg3, %arg4, %arg5, %arg6] im2col[%arg7, %arg8] l2_cache_hint = %arg10 {mode = #nvvm.tma_load_mode<im2col>} : !llvm.ptr<7>, !llvm.ptr
    nvvm.cp.async.bulk.tensor.shared.cluster.global %arg1, %arg0, %arg2, box[%arg3, %arg4, %arg5, %arg6] im2col[%arg7, %arg8] multicast_mask = %arg9 {mode = #nvvm.tma_load_mode<im2col>} : !llvm.ptr<7>, !llvm.ptr
    nvvm.cp.async.bulk.tensor.shared.cluster.global %arg1, %arg0, %arg2, box[%arg3, %arg4, %arg5, %arg6] im2col[%arg7, %arg8] {mode = #nvvm.tma_load_mode<im2col>} : !llvm.ptr<7>, !llvm.ptr
    nvvm.cp.async.bulk.tensor.shared.cluster.global %arg1, %arg0, %arg2, box[%arg3, %arg4, %arg5, %arg6] im2col[%arg7, %arg8] multicast_mask = %arg9 l2_cache_hint = %arg10 {group = #nvvm.cta_group<cta_1>, mode = #nvvm.tma_load_mode<im2col>} : !llvm.ptr<7>, !llvm.ptr
    nvvm.cp.async.bulk.tensor.shared.cluster.global %arg1, %arg0, %arg2, box[%arg3, %arg4, %arg5, %arg6] im2col[%arg7, %arg8] l2_cache_hint = %arg10 {group = #nvvm.cta_group<cta_1>, mode = #nvvm.tma_load_mode<im2col>} : !llvm.ptr<7>, !llvm.ptr
    nvvm.cp.async.bulk.tensor.shared.cluster.global %arg1, %arg0, %arg2, box[%arg3, %arg4, %arg5, %arg6] im2col[%arg7, %arg8] multicast_mask = %arg9 {group = #nvvm.cta_group<cta_1>, mode = #nvvm.tma_load_mode<im2col>} : !llvm.ptr<7>, !llvm.ptr
    nvvm.cp.async.bulk.tensor.shared.cluster.global %arg1, %arg0, %arg2, box[%arg3, %arg4, %arg5, %arg6] im2col[%arg7, %arg8] {group = #nvvm.cta_group<cta_1>, mode = #nvvm.tma_load_mode<im2col>} : !llvm.ptr<7>, !llvm.ptr
    nvvm.cp.async.bulk.tensor.shared.cluster.global %arg1, %arg0, %arg2, box[%arg3, %arg4, %arg5, %arg6] im2col[%arg7, %arg8] multicast_mask = %arg9 l2_cache_hint = %arg10 {group = #nvvm.cta_group<cta_2>, mode = #nvvm.tma_load_mode<im2col>} : !llvm.ptr<7>, !llvm.ptr
    nvvm.cp.async.bulk.tensor.shared.cluster.global %arg1, %arg0, %arg2, box[%arg3, %arg4, %arg5, %arg6] im2col[%arg7, %arg8] l2_cache_hint = %arg10 {group = #nvvm.cta_group<cta_2>, mode = #nvvm.tma_load_mode<im2col>} : !llvm.ptr<7>, !llvm.ptr
    nvvm.cp.async.bulk.tensor.shared.cluster.global %arg1, %arg0, %arg2, box[%arg3, %arg4, %arg5, %arg6] im2col[%arg7, %arg8] multicast_mask = %arg9 {group = #nvvm.cta_group<cta_2>, mode = #nvvm.tma_load_mode<im2col>} : !llvm.ptr<7>, !llvm.ptr
    nvvm.cp.async.bulk.tensor.shared.cluster.global %arg1, %arg0, %arg2, box[%arg3, %arg4, %arg5, %arg6] im2col[%arg7, %arg8] {group = #nvvm.cta_group<cta_2>, mode = #nvvm.tma_load_mode<im2col>} : !llvm.ptr<7>, !llvm.ptr
    llvm.return
  }
  llvm.func @tma_load_5d_im2col(%arg0: !llvm.ptr, %arg1: !llvm.ptr<7>, %arg2: !llvm.ptr<3>, %arg3: i32, %arg4: i32, %arg5: i32, %arg6: i32, %arg7: i32, %arg8: i16, %arg9: i16, %arg10: i16, %arg11: i16, %arg12: i64) {
    nvvm.cp.async.bulk.tensor.shared.cluster.global %arg1, %arg0, %arg2, box[%arg3, %arg4, %arg5, %arg6, %arg7] im2col[%arg8, %arg9, %arg10] multicast_mask = %arg11 l2_cache_hint = %arg12 {mode = #nvvm.tma_load_mode<im2col>} : !llvm.ptr<7>, !llvm.ptr
    nvvm.cp.async.bulk.tensor.shared.cluster.global %arg1, %arg0, %arg2, box[%arg3, %arg4, %arg5, %arg6, %arg7] im2col[%arg8, %arg9, %arg10] l2_cache_hint = %arg12 {mode = #nvvm.tma_load_mode<im2col>} : !llvm.ptr<7>, !llvm.ptr
    nvvm.cp.async.bulk.tensor.shared.cluster.global %arg1, %arg0, %arg2, box[%arg3, %arg4, %arg5, %arg6, %arg7] im2col[%arg8, %arg9, %arg10] multicast_mask = %arg11 {mode = #nvvm.tma_load_mode<im2col>} : !llvm.ptr<7>, !llvm.ptr
    nvvm.cp.async.bulk.tensor.shared.cluster.global %arg1, %arg0, %arg2, box[%arg3, %arg4, %arg5, %arg6, %arg7] im2col[%arg8, %arg9, %arg10] {mode = #nvvm.tma_load_mode<im2col>} : !llvm.ptr<7>, !llvm.ptr
    nvvm.cp.async.bulk.tensor.shared.cluster.global %arg1, %arg0, %arg2, box[%arg3, %arg4, %arg5, %arg6, %arg7] im2col[%arg8, %arg9, %arg10] multicast_mask = %arg11 l2_cache_hint = %arg12 {group = #nvvm.cta_group<cta_1>, mode = #nvvm.tma_load_mode<im2col>} : !llvm.ptr<7>, !llvm.ptr
    nvvm.cp.async.bulk.tensor.shared.cluster.global %arg1, %arg0, %arg2, box[%arg3, %arg4, %arg5, %arg6, %arg7] im2col[%arg8, %arg9, %arg10] l2_cache_hint = %arg12 {group = #nvvm.cta_group<cta_1>, mode = #nvvm.tma_load_mode<im2col>} : !llvm.ptr<7>, !llvm.ptr
    nvvm.cp.async.bulk.tensor.shared.cluster.global %arg1, %arg0, %arg2, box[%arg3, %arg4, %arg5, %arg6, %arg7] im2col[%arg8, %arg9, %arg10] multicast_mask = %arg11 {group = #nvvm.cta_group<cta_1>, mode = #nvvm.tma_load_mode<im2col>} : !llvm.ptr<7>, !llvm.ptr
    nvvm.cp.async.bulk.tensor.shared.cluster.global %arg1, %arg0, %arg2, box[%arg3, %arg4, %arg5, %arg6, %arg7] im2col[%arg8, %arg9, %arg10] {group = #nvvm.cta_group<cta_1>, mode = #nvvm.tma_load_mode<im2col>} : !llvm.ptr<7>, !llvm.ptr
    nvvm.cp.async.bulk.tensor.shared.cluster.global %arg1, %arg0, %arg2, box[%arg3, %arg4, %arg5, %arg6, %arg7] im2col[%arg8, %arg9, %arg10] multicast_mask = %arg11 l2_cache_hint = %arg12 {group = #nvvm.cta_group<cta_2>, mode = #nvvm.tma_load_mode<im2col>} : !llvm.ptr<7>, !llvm.ptr
    nvvm.cp.async.bulk.tensor.shared.cluster.global %arg1, %arg0, %arg2, box[%arg3, %arg4, %arg5, %arg6, %arg7] im2col[%arg8, %arg9, %arg10] l2_cache_hint = %arg12 {group = #nvvm.cta_group<cta_2>, mode = #nvvm.tma_load_mode<im2col>} : !llvm.ptr<7>, !llvm.ptr
    nvvm.cp.async.bulk.tensor.shared.cluster.global %arg1, %arg0, %arg2, box[%arg3, %arg4, %arg5, %arg6, %arg7] im2col[%arg8, %arg9, %arg10] multicast_mask = %arg11 {group = #nvvm.cta_group<cta_2>, mode = #nvvm.tma_load_mode<im2col>} : !llvm.ptr<7>, !llvm.ptr
    nvvm.cp.async.bulk.tensor.shared.cluster.global %arg1, %arg0, %arg2, box[%arg3, %arg4, %arg5, %arg6, %arg7] im2col[%arg8, %arg9, %arg10] {group = #nvvm.cta_group<cta_2>, mode = #nvvm.tma_load_mode<im2col>} : !llvm.ptr<7>, !llvm.ptr
    llvm.return
  }
  llvm.func @tma_load_3d_im2col_w(%arg0: !llvm.ptr, %arg1: !llvm.ptr<7>, %arg2: !llvm.ptr<3>, %arg3: i32, %arg4: i32, %arg5: i32, %arg6: i16, %arg7: i16, %arg8: i16, %arg9: i64) {
    nvvm.cp.async.bulk.tensor.shared.cluster.global %arg1, %arg0, %arg2, box[%arg3, %arg4, %arg5] im2col[%arg6, %arg7] {mode = #nvvm.tma_load_mode<im2col_w>} : !llvm.ptr<7>, !llvm.ptr
    nvvm.cp.async.bulk.tensor.shared.cluster.global %arg1, %arg0, %arg2, box[%arg3, %arg4, %arg5] im2col[%arg6, %arg7] multicast_mask = %arg8 {mode = #nvvm.tma_load_mode<im2col_w>} : !llvm.ptr<7>, !llvm.ptr
    nvvm.cp.async.bulk.tensor.shared.cluster.global %arg1, %arg0, %arg2, box[%arg3, %arg4, %arg5] im2col[%arg6, %arg7] l2_cache_hint = %arg9 {mode = #nvvm.tma_load_mode<im2col_w>} : !llvm.ptr<7>, !llvm.ptr
    nvvm.cp.async.bulk.tensor.shared.cluster.global %arg1, %arg0, %arg2, box[%arg3, %arg4, %arg5] im2col[%arg6, %arg7] multicast_mask = %arg8 l2_cache_hint = %arg9 {mode = #nvvm.tma_load_mode<im2col_w>} : !llvm.ptr<7>, !llvm.ptr
    nvvm.cp.async.bulk.tensor.shared.cluster.global %arg1, %arg0, %arg2, box[%arg3, %arg4, %arg5] im2col[%arg6, %arg7] {group = #nvvm.cta_group<cta_1>, mode = #nvvm.tma_load_mode<im2col_w>} : !llvm.ptr<7>, !llvm.ptr
    nvvm.cp.async.bulk.tensor.shared.cluster.global %arg1, %arg0, %arg2, box[%arg3, %arg4, %arg5] im2col[%arg6, %arg7] multicast_mask = %arg8 {group = #nvvm.cta_group<cta_1>, mode = #nvvm.tma_load_mode<im2col_w>} : !llvm.ptr<7>, !llvm.ptr
    nvvm.cp.async.bulk.tensor.shared.cluster.global %arg1, %arg0, %arg2, box[%arg3, %arg4, %arg5] im2col[%arg6, %arg7] l2_cache_hint = %arg9 {group = #nvvm.cta_group<cta_1>, mode = #nvvm.tma_load_mode<im2col_w>} : !llvm.ptr<7>, !llvm.ptr
    nvvm.cp.async.bulk.tensor.shared.cluster.global %arg1, %arg0, %arg2, box[%arg3, %arg4, %arg5] im2col[%arg6, %arg7] multicast_mask = %arg8 l2_cache_hint = %arg9 {group = #nvvm.cta_group<cta_1>, mode = #nvvm.tma_load_mode<im2col_w>} : !llvm.ptr<7>, !llvm.ptr
    nvvm.cp.async.bulk.tensor.shared.cluster.global %arg1, %arg0, %arg2, box[%arg3, %arg4, %arg5] im2col[%arg6, %arg7] {group = #nvvm.cta_group<cta_2>, mode = #nvvm.tma_load_mode<im2col_w>} : !llvm.ptr<7>, !llvm.ptr
    nvvm.cp.async.bulk.tensor.shared.cluster.global %arg1, %arg0, %arg2, box[%arg3, %arg4, %arg5] im2col[%arg6, %arg7] multicast_mask = %arg8 {group = #nvvm.cta_group<cta_2>, mode = #nvvm.tma_load_mode<im2col_w>} : !llvm.ptr<7>, !llvm.ptr
    nvvm.cp.async.bulk.tensor.shared.cluster.global %arg1, %arg0, %arg2, box[%arg3, %arg4, %arg5] im2col[%arg6, %arg7] l2_cache_hint = %arg9 {group = #nvvm.cta_group<cta_2>, mode = #nvvm.tma_load_mode<im2col_w>} : !llvm.ptr<7>, !llvm.ptr
    nvvm.cp.async.bulk.tensor.shared.cluster.global %arg1, %arg0, %arg2, box[%arg3, %arg4, %arg5] im2col[%arg6, %arg7] multicast_mask = %arg8 l2_cache_hint = %arg9 {group = #nvvm.cta_group<cta_2>, mode = #nvvm.tma_load_mode<im2col_w>} : !llvm.ptr<7>, !llvm.ptr
    llvm.return
  }
  llvm.func @tma_load_4d_im2col_w(%arg0: !llvm.ptr, %arg1: !llvm.ptr<7>, %arg2: !llvm.ptr<3>, %arg3: i32, %arg4: i32, %arg5: i32, %arg6: i32, %arg7: i16, %arg8: i16, %arg9: i16, %arg10: i64) {
    nvvm.cp.async.bulk.tensor.shared.cluster.global %arg1, %arg0, %arg2, box[%arg3, %arg4, %arg5, %arg6] im2col[%arg7, %arg8] {mode = #nvvm.tma_load_mode<im2col_w>} : !llvm.ptr<7>, !llvm.ptr
    nvvm.cp.async.bulk.tensor.shared.cluster.global %arg1, %arg0, %arg2, box[%arg3, %arg4, %arg5, %arg6] im2col[%arg7, %arg8] multicast_mask = %arg9 {mode = #nvvm.tma_load_mode<im2col_w>} : !llvm.ptr<7>, !llvm.ptr
    nvvm.cp.async.bulk.tensor.shared.cluster.global %arg1, %arg0, %arg2, box[%arg3, %arg4, %arg5, %arg6] im2col[%arg7, %arg8] l2_cache_hint = %arg10 {mode = #nvvm.tma_load_mode<im2col_w>} : !llvm.ptr<7>, !llvm.ptr
    nvvm.cp.async.bulk.tensor.shared.cluster.global %arg1, %arg0, %arg2, box[%arg3, %arg4, %arg5, %arg6] im2col[%arg7, %arg8] multicast_mask = %arg9 l2_cache_hint = %arg10 {mode = #nvvm.tma_load_mode<im2col_w>} : !llvm.ptr<7>, !llvm.ptr
    nvvm.cp.async.bulk.tensor.shared.cluster.global %arg1, %arg0, %arg2, box[%arg3, %arg4, %arg5, %arg6] im2col[%arg7, %arg8] {group = #nvvm.cta_group<cta_1>, mode = #nvvm.tma_load_mode<im2col_w>} : !llvm.ptr<7>, !llvm.ptr
    nvvm.cp.async.bulk.tensor.shared.cluster.global %arg1, %arg0, %arg2, box[%arg3, %arg4, %arg5, %arg6] im2col[%arg7, %arg8] multicast_mask = %arg9 {group = #nvvm.cta_group<cta_1>, mode = #nvvm.tma_load_mode<im2col_w>} : !llvm.ptr<7>, !llvm.ptr
    nvvm.cp.async.bulk.tensor.shared.cluster.global %arg1, %arg0, %arg2, box[%arg3, %arg4, %arg5, %arg6] im2col[%arg7, %arg8] l2_cache_hint = %arg10 {group = #nvvm.cta_group<cta_1>, mode = #nvvm.tma_load_mode<im2col_w>} : !llvm.ptr<7>, !llvm.ptr
    nvvm.cp.async.bulk.tensor.shared.cluster.global %arg1, %arg0, %arg2, box[%arg3, %arg4, %arg5, %arg6] im2col[%arg7, %arg8] multicast_mask = %arg9 l2_cache_hint = %arg10 {group = #nvvm.cta_group<cta_1>, mode = #nvvm.tma_load_mode<im2col_w>} : !llvm.ptr<7>, !llvm.ptr
    nvvm.cp.async.bulk.tensor.shared.cluster.global %arg1, %arg0, %arg2, box[%arg3, %arg4, %arg5, %arg6] im2col[%arg7, %arg8] {group = #nvvm.cta_group<cta_2>, mode = #nvvm.tma_load_mode<im2col_w>} : !llvm.ptr<7>, !llvm.ptr
    nvvm.cp.async.bulk.tensor.shared.cluster.global %arg1, %arg0, %arg2, box[%arg3, %arg4, %arg5, %arg6] im2col[%arg7, %arg8] multicast_mask = %arg9 {group = #nvvm.cta_group<cta_2>, mode = #nvvm.tma_load_mode<im2col_w>} : !llvm.ptr<7>, !llvm.ptr
    nvvm.cp.async.bulk.tensor.shared.cluster.global %arg1, %arg0, %arg2, box[%arg3, %arg4, %arg5, %arg6] im2col[%arg7, %arg8] l2_cache_hint = %arg10 {group = #nvvm.cta_group<cta_2>, mode = #nvvm.tma_load_mode<im2col_w>} : !llvm.ptr<7>, !llvm.ptr
    nvvm.cp.async.bulk.tensor.shared.cluster.global %arg1, %arg0, %arg2, box[%arg3, %arg4, %arg5, %arg6] im2col[%arg7, %arg8] multicast_mask = %arg9 l2_cache_hint = %arg10 {group = #nvvm.cta_group<cta_2>, mode = #nvvm.tma_load_mode<im2col_w>} : !llvm.ptr<7>, !llvm.ptr
    llvm.return
  }
  llvm.func @tma_load_5d_im2col_w(%arg0: !llvm.ptr, %arg1: !llvm.ptr<7>, %arg2: !llvm.ptr<3>, %arg3: i32, %arg4: i32, %arg5: i32, %arg6: i32, %arg7: i32, %arg8: i16, %arg9: i16, %arg10: i16, %arg11: i64) {
    nvvm.cp.async.bulk.tensor.shared.cluster.global %arg1, %arg0, %arg2, box[%arg3, %arg4, %arg5, %arg6, %arg7] im2col[%arg8, %arg9] {mode = #nvvm.tma_load_mode<im2col_w>} : !llvm.ptr<7>, !llvm.ptr
    nvvm.cp.async.bulk.tensor.shared.cluster.global %arg1, %arg0, %arg2, box[%arg3, %arg4, %arg5, %arg6, %arg7] im2col[%arg8, %arg9] multicast_mask = %arg10 {mode = #nvvm.tma_load_mode<im2col_w>} : !llvm.ptr<7>, !llvm.ptr
    nvvm.cp.async.bulk.tensor.shared.cluster.global %arg1, %arg0, %arg2, box[%arg3, %arg4, %arg5, %arg6, %arg7] im2col[%arg8, %arg9] l2_cache_hint = %arg11 {mode = #nvvm.tma_load_mode<im2col_w>} : !llvm.ptr<7>, !llvm.ptr
    nvvm.cp.async.bulk.tensor.shared.cluster.global %arg1, %arg0, %arg2, box[%arg3, %arg4, %arg5, %arg6, %arg7] im2col[%arg8, %arg9] multicast_mask = %arg10 l2_cache_hint = %arg11 {mode = #nvvm.tma_load_mode<im2col_w>} : !llvm.ptr<7>, !llvm.ptr
    nvvm.cp.async.bulk.tensor.shared.cluster.global %arg1, %arg0, %arg2, box[%arg3, %arg4, %arg5, %arg6, %arg7] im2col[%arg8, %arg9] {group = #nvvm.cta_group<cta_1>, mode = #nvvm.tma_load_mode<im2col_w>} : !llvm.ptr<7>, !llvm.ptr
    nvvm.cp.async.bulk.tensor.shared.cluster.global %arg1, %arg0, %arg2, box[%arg3, %arg4, %arg5, %arg6, %arg7] im2col[%arg8, %arg9] multicast_mask = %arg10 {group = #nvvm.cta_group<cta_1>, mode = #nvvm.tma_load_mode<im2col_w>} : !llvm.ptr<7>, !llvm.ptr
    nvvm.cp.async.bulk.tensor.shared.cluster.global %arg1, %arg0, %arg2, box[%arg3, %arg4, %arg5, %arg6, %arg7] im2col[%arg8, %arg9] l2_cache_hint = %arg11 {group = #nvvm.cta_group<cta_1>, mode = #nvvm.tma_load_mode<im2col_w>} : !llvm.ptr<7>, !llvm.ptr
    nvvm.cp.async.bulk.tensor.shared.cluster.global %arg1, %arg0, %arg2, box[%arg3, %arg4, %arg5, %arg6, %arg7] im2col[%arg8, %arg9] multicast_mask = %arg10 l2_cache_hint = %arg11 {group = #nvvm.cta_group<cta_1>, mode = #nvvm.tma_load_mode<im2col_w>} : !llvm.ptr<7>, !llvm.ptr
    nvvm.cp.async.bulk.tensor.shared.cluster.global %arg1, %arg0, %arg2, box[%arg3, %arg4, %arg5, %arg6, %arg7] im2col[%arg8, %arg9] {group = #nvvm.cta_group<cta_2>, mode = #nvvm.tma_load_mode<im2col_w>} : !llvm.ptr<7>, !llvm.ptr
    nvvm.cp.async.bulk.tensor.shared.cluster.global %arg1, %arg0, %arg2, box[%arg3, %arg4, %arg5, %arg6, %arg7] im2col[%arg8, %arg9] multicast_mask = %arg10 {group = #nvvm.cta_group<cta_2>, mode = #nvvm.tma_load_mode<im2col_w>} : !llvm.ptr<7>, !llvm.ptr
    nvvm.cp.async.bulk.tensor.shared.cluster.global %arg1, %arg0, %arg2, box[%arg3, %arg4, %arg5, %arg6, %arg7] im2col[%arg8, %arg9] l2_cache_hint = %arg11 {group = #nvvm.cta_group<cta_2>, mode = #nvvm.tma_load_mode<im2col_w>} : !llvm.ptr<7>, !llvm.ptr
    nvvm.cp.async.bulk.tensor.shared.cluster.global %arg1, %arg0, %arg2, box[%arg3, %arg4, %arg5, %arg6, %arg7] im2col[%arg8, %arg9] multicast_mask = %arg10 l2_cache_hint = %arg11 {group = #nvvm.cta_group<cta_2>, mode = #nvvm.tma_load_mode<im2col_w>} : !llvm.ptr<7>, !llvm.ptr
    llvm.return
  }
  llvm.func @tma_load_3d_im2col_w_128(%arg0: !llvm.ptr, %arg1: !llvm.ptr<7>, %arg2: !llvm.ptr<3>, %arg3: i32, %arg4: i32, %arg5: i32, %arg6: i16, %arg7: i16, %arg8: i16, %arg9: i64) {
    nvvm.cp.async.bulk.tensor.shared.cluster.global %arg1, %arg0, %arg2, box[%arg3, %arg4, %arg5] im2col[%arg6, %arg7] {mode = #nvvm.tma_load_mode<im2col_w_128>} : !llvm.ptr<7>, !llvm.ptr
    nvvm.cp.async.bulk.tensor.shared.cluster.global %arg1, %arg0, %arg2, box[%arg3, %arg4, %arg5] im2col[%arg6, %arg7] multicast_mask = %arg8 {mode = #nvvm.tma_load_mode<im2col_w_128>} : !llvm.ptr<7>, !llvm.ptr
    nvvm.cp.async.bulk.tensor.shared.cluster.global %arg1, %arg0, %arg2, box[%arg3, %arg4, %arg5] im2col[%arg6, %arg7] l2_cache_hint = %arg9 {mode = #nvvm.tma_load_mode<im2col_w_128>} : !llvm.ptr<7>, !llvm.ptr
    nvvm.cp.async.bulk.tensor.shared.cluster.global %arg1, %arg0, %arg2, box[%arg3, %arg4, %arg5] im2col[%arg6, %arg7] multicast_mask = %arg8 l2_cache_hint = %arg9 {mode = #nvvm.tma_load_mode<im2col_w_128>} : !llvm.ptr<7>, !llvm.ptr
    nvvm.cp.async.bulk.tensor.shared.cluster.global %arg1, %arg0, %arg2, box[%arg3, %arg4, %arg5] im2col[%arg6, %arg7] {group = #nvvm.cta_group<cta_1>, mode = #nvvm.tma_load_mode<im2col_w_128>} : !llvm.ptr<7>, !llvm.ptr
    nvvm.cp.async.bulk.tensor.shared.cluster.global %arg1, %arg0, %arg2, box[%arg3, %arg4, %arg5] im2col[%arg6, %arg7] multicast_mask = %arg8 {group = #nvvm.cta_group<cta_1>, mode = #nvvm.tma_load_mode<im2col_w_128>} : !llvm.ptr<7>, !llvm.ptr
    nvvm.cp.async.bulk.tensor.shared.cluster.global %arg1, %arg0, %arg2, box[%arg3, %arg4, %arg5] im2col[%arg6, %arg7] l2_cache_hint = %arg9 {group = #nvvm.cta_group<cta_1>, mode = #nvvm.tma_load_mode<im2col_w_128>} : !llvm.ptr<7>, !llvm.ptr
    nvvm.cp.async.bulk.tensor.shared.cluster.global %arg1, %arg0, %arg2, box[%arg3, %arg4, %arg5] im2col[%arg6, %arg7] multicast_mask = %arg8 l2_cache_hint = %arg9 {group = #nvvm.cta_group<cta_1>, mode = #nvvm.tma_load_mode<im2col_w_128>} : !llvm.ptr<7>, !llvm.ptr
    nvvm.cp.async.bulk.tensor.shared.cluster.global %arg1, %arg0, %arg2, box[%arg3, %arg4, %arg5] im2col[%arg6, %arg7] {group = #nvvm.cta_group<cta_2>, mode = #nvvm.tma_load_mode<im2col_w_128>} : !llvm.ptr<7>, !llvm.ptr
    nvvm.cp.async.bulk.tensor.shared.cluster.global %arg1, %arg0, %arg2, box[%arg3, %arg4, %arg5] im2col[%arg6, %arg7] multicast_mask = %arg8 {group = #nvvm.cta_group<cta_2>, mode = #nvvm.tma_load_mode<im2col_w_128>} : !llvm.ptr<7>, !llvm.ptr
    nvvm.cp.async.bulk.tensor.shared.cluster.global %arg1, %arg0, %arg2, box[%arg3, %arg4, %arg5] im2col[%arg6, %arg7] l2_cache_hint = %arg9 {group = #nvvm.cta_group<cta_2>, mode = #nvvm.tma_load_mode<im2col_w_128>} : !llvm.ptr<7>, !llvm.ptr
    nvvm.cp.async.bulk.tensor.shared.cluster.global %arg1, %arg0, %arg2, box[%arg3, %arg4, %arg5] im2col[%arg6, %arg7] multicast_mask = %arg8 l2_cache_hint = %arg9 {group = #nvvm.cta_group<cta_2>, mode = #nvvm.tma_load_mode<im2col_w_128>} : !llvm.ptr<7>, !llvm.ptr
    llvm.return
  }
  llvm.func @tma_load_4d_im2col_w_128(%arg0: !llvm.ptr, %arg1: !llvm.ptr<7>, %arg2: !llvm.ptr<3>, %arg3: i32, %arg4: i32, %arg5: i32, %arg6: i32, %arg7: i16, %arg8: i16, %arg9: i16, %arg10: i64) {
    nvvm.cp.async.bulk.tensor.shared.cluster.global %arg1, %arg0, %arg2, box[%arg3, %arg4, %arg5, %arg6] im2col[%arg7, %arg8] {mode = #nvvm.tma_load_mode<im2col_w_128>} : !llvm.ptr<7>, !llvm.ptr
    nvvm.cp.async.bulk.tensor.shared.cluster.global %arg1, %arg0, %arg2, box[%arg3, %arg4, %arg5, %arg6] im2col[%arg7, %arg8] multicast_mask = %arg9 {mode = #nvvm.tma_load_mode<im2col_w_128>} : !llvm.ptr<7>, !llvm.ptr
    nvvm.cp.async.bulk.tensor.shared.cluster.global %arg1, %arg0, %arg2, box[%arg3, %arg4, %arg5, %arg6] im2col[%arg7, %arg8] l2_cache_hint = %arg10 {mode = #nvvm.tma_load_mode<im2col_w_128>} : !llvm.ptr<7>, !llvm.ptr
    nvvm.cp.async.bulk.tensor.shared.cluster.global %arg1, %arg0, %arg2, box[%arg3, %arg4, %arg5, %arg6] im2col[%arg7, %arg8] multicast_mask = %arg9 l2_cache_hint = %arg10 {mode = #nvvm.tma_load_mode<im2col_w_128>} : !llvm.ptr<7>, !llvm.ptr
    nvvm.cp.async.bulk.tensor.shared.cluster.global %arg1, %arg0, %arg2, box[%arg3, %arg4, %arg5, %arg6] im2col[%arg7, %arg8] {group = #nvvm.cta_group<cta_1>, mode = #nvvm.tma_load_mode<im2col_w_128>} : !llvm.ptr<7>, !llvm.ptr
    nvvm.cp.async.bulk.tensor.shared.cluster.global %arg1, %arg0, %arg2, box[%arg3, %arg4, %arg5, %arg6] im2col[%arg7, %arg8] multicast_mask = %arg9 {group = #nvvm.cta_group<cta_1>, mode = #nvvm.tma_load_mode<im2col_w_128>} : !llvm.ptr<7>, !llvm.ptr
    nvvm.cp.async.bulk.tensor.shared.cluster.global %arg1, %arg0, %arg2, box[%arg3, %arg4, %arg5, %arg6] im2col[%arg7, %arg8] l2_cache_hint = %arg10 {group = #nvvm.cta_group<cta_1>, mode = #nvvm.tma_load_mode<im2col_w_128>} : !llvm.ptr<7>, !llvm.ptr
    nvvm.cp.async.bulk.tensor.shared.cluster.global %arg1, %arg0, %arg2, box[%arg3, %arg4, %arg5, %arg6] im2col[%arg7, %arg8] multicast_mask = %arg9 l2_cache_hint = %arg10 {group = #nvvm.cta_group<cta_1>, mode = #nvvm.tma_load_mode<im2col_w_128>} : !llvm.ptr<7>, !llvm.ptr
    nvvm.cp.async.bulk.tensor.shared.cluster.global %arg1, %arg0, %arg2, box[%arg3, %arg4, %arg5, %arg6] im2col[%arg7, %arg8] {group = #nvvm.cta_group<cta_2>, mode = #nvvm.tma_load_mode<im2col_w_128>} : !llvm.ptr<7>, !llvm.ptr
    nvvm.cp.async.bulk.tensor.shared.cluster.global %arg1, %arg0, %arg2, box[%arg3, %arg4, %arg5, %arg6] im2col[%arg7, %arg8] multicast_mask = %arg9 {group = #nvvm.cta_group<cta_2>, mode = #nvvm.tma_load_mode<im2col_w_128>} : !llvm.ptr<7>, !llvm.ptr
    nvvm.cp.async.bulk.tensor.shared.cluster.global %arg1, %arg0, %arg2, box[%arg3, %arg4, %arg5, %arg6] im2col[%arg7, %arg8] l2_cache_hint = %arg10 {group = #nvvm.cta_group<cta_2>, mode = #nvvm.tma_load_mode<im2col_w_128>} : !llvm.ptr<7>, !llvm.ptr
    nvvm.cp.async.bulk.tensor.shared.cluster.global %arg1, %arg0, %arg2, box[%arg3, %arg4, %arg5, %arg6] im2col[%arg7, %arg8] multicast_mask = %arg9 l2_cache_hint = %arg10 {group = #nvvm.cta_group<cta_2>, mode = #nvvm.tma_load_mode<im2col_w_128>} : !llvm.ptr<7>, !llvm.ptr
    llvm.return
  }
  llvm.func @tma_load_5d_im2col_w_128(%arg0: !llvm.ptr, %arg1: !llvm.ptr<7>, %arg2: !llvm.ptr<3>, %arg3: i32, %arg4: i32, %arg5: i32, %arg6: i32, %arg7: i32, %arg8: i16, %arg9: i16, %arg10: i16, %arg11: i64) {
    nvvm.cp.async.bulk.tensor.shared.cluster.global %arg1, %arg0, %arg2, box[%arg3, %arg4, %arg5, %arg6, %arg7] im2col[%arg8, %arg9] {mode = #nvvm.tma_load_mode<im2col_w_128>} : !llvm.ptr<7>, !llvm.ptr
    nvvm.cp.async.bulk.tensor.shared.cluster.global %arg1, %arg0, %arg2, box[%arg3, %arg4, %arg5, %arg6, %arg7] im2col[%arg8, %arg9] multicast_mask = %arg10 {mode = #nvvm.tma_load_mode<im2col_w_128>} : !llvm.ptr<7>, !llvm.ptr
    nvvm.cp.async.bulk.tensor.shared.cluster.global %arg1, %arg0, %arg2, box[%arg3, %arg4, %arg5, %arg6, %arg7] im2col[%arg8, %arg9] l2_cache_hint = %arg11 {mode = #nvvm.tma_load_mode<im2col_w_128>} : !llvm.ptr<7>, !llvm.ptr
    nvvm.cp.async.bulk.tensor.shared.cluster.global %arg1, %arg0, %arg2, box[%arg3, %arg4, %arg5, %arg6, %arg7] im2col[%arg8, %arg9] multicast_mask = %arg10 l2_cache_hint = %arg11 {mode = #nvvm.tma_load_mode<im2col_w_128>} : !llvm.ptr<7>, !llvm.ptr
    nvvm.cp.async.bulk.tensor.shared.cluster.global %arg1, %arg0, %arg2, box[%arg3, %arg4, %arg5, %arg6, %arg7] im2col[%arg8, %arg9] {group = #nvvm.cta_group<cta_1>, mode = #nvvm.tma_load_mode<im2col_w_128>} : !llvm.ptr<7>, !llvm.ptr
    nvvm.cp.async.bulk.tensor.shared.cluster.global %arg1, %arg0, %arg2, box[%arg3, %arg4, %arg5, %arg6, %arg7] im2col[%arg8, %arg9] multicast_mask = %arg10 {group = #nvvm.cta_group<cta_1>, mode = #nvvm.tma_load_mode<im2col_w_128>} : !llvm.ptr<7>, !llvm.ptr
    nvvm.cp.async.bulk.tensor.shared.cluster.global %arg1, %arg0, %arg2, box[%arg3, %arg4, %arg5, %arg6, %arg7] im2col[%arg8, %arg9] l2_cache_hint = %arg11 {group = #nvvm.cta_group<cta_1>, mode = #nvvm.tma_load_mode<im2col_w_128>} : !llvm.ptr<7>, !llvm.ptr
    nvvm.cp.async.bulk.tensor.shared.cluster.global %arg1, %arg0, %arg2, box[%arg3, %arg4, %arg5, %arg6, %arg7] im2col[%arg8, %arg9] multicast_mask = %arg10 l2_cache_hint = %arg11 {group = #nvvm.cta_group<cta_1>, mode = #nvvm.tma_load_mode<im2col_w_128>} : !llvm.ptr<7>, !llvm.ptr
    nvvm.cp.async.bulk.tensor.shared.cluster.global %arg1, %arg0, %arg2, box[%arg3, %arg4, %arg5, %arg6, %arg7] im2col[%arg8, %arg9] {group = #nvvm.cta_group<cta_2>, mode = #nvvm.tma_load_mode<im2col_w_128>} : !llvm.ptr<7>, !llvm.ptr
    nvvm.cp.async.bulk.tensor.shared.cluster.global %arg1, %arg0, %arg2, box[%arg3, %arg4, %arg5, %arg6, %arg7] im2col[%arg8, %arg9] multicast_mask = %arg10 {group = #nvvm.cta_group<cta_2>, mode = #nvvm.tma_load_mode<im2col_w_128>} : !llvm.ptr<7>, !llvm.ptr
    nvvm.cp.async.bulk.tensor.shared.cluster.global %arg1, %arg0, %arg2, box[%arg3, %arg4, %arg5, %arg6, %arg7] im2col[%arg8, %arg9] l2_cache_hint = %arg11 {group = #nvvm.cta_group<cta_2>, mode = #nvvm.tma_load_mode<im2col_w_128>} : !llvm.ptr<7>, !llvm.ptr
    nvvm.cp.async.bulk.tensor.shared.cluster.global %arg1, %arg0, %arg2, box[%arg3, %arg4, %arg5, %arg6, %arg7] im2col[%arg8, %arg9] multicast_mask = %arg10 l2_cache_hint = %arg11 {group = #nvvm.cta_group<cta_2>, mode = #nvvm.tma_load_mode<im2col_w_128>} : !llvm.ptr<7>, !llvm.ptr
    llvm.return
  }
}

