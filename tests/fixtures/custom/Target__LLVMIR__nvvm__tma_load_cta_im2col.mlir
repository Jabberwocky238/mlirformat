module {
  llvm.func @tma_load_3d_im2col(%arg0: !llvm.ptr, %arg1: !llvm.ptr<3>, %arg2: !llvm.ptr<3>, %arg3: i32, %arg4: i32, %arg5: i32, %arg6: i16, %arg7: i64) {
    nvvm.cp.async.bulk.tensor.shared.cluster.global %arg1, %arg0, %arg2, box[%arg3, %arg4, %arg5] im2col[%arg6] {isCTAOnly = true, mode = #nvvm.tma_load_mode<im2col>} : !llvm.ptr<3>, !llvm.ptr
    nvvm.cp.async.bulk.tensor.shared.cluster.global %arg1, %arg0, %arg2, box[%arg3, %arg4, %arg5] im2col[%arg6] l2_cache_hint = %arg7 {isCTAOnly = true, mode = #nvvm.tma_load_mode<im2col>} : !llvm.ptr<3>, !llvm.ptr
    llvm.return
  }
  llvm.func @tma_load_4d_im2col(%arg0: !llvm.ptr, %arg1: !llvm.ptr<3>, %arg2: !llvm.ptr<3>, %arg3: i32, %arg4: i32, %arg5: i32, %arg6: i32, %arg7: i16, %arg8: i16, %arg9: i64) {
    nvvm.cp.async.bulk.tensor.shared.cluster.global %arg1, %arg0, %arg2, box[%arg3, %arg4, %arg5, %arg6] im2col[%arg7, %arg8] l2_cache_hint = %arg9 {isCTAOnly = true, mode = #nvvm.tma_load_mode<im2col>} : !llvm.ptr<3>, !llvm.ptr
    nvvm.cp.async.bulk.tensor.shared.cluster.global %arg1, %arg0, %arg2, box[%arg3, %arg4, %arg5, %arg6] im2col[%arg7, %arg8] {isCTAOnly = true, mode = #nvvm.tma_load_mode<im2col>} : !llvm.ptr<3>, !llvm.ptr
    llvm.return
  }
  llvm.func @tma_load_5d_im2col(%arg0: !llvm.ptr, %arg1: !llvm.ptr<3>, %arg2: !llvm.ptr<3>, %arg3: i32, %arg4: i32, %arg5: i32, %arg6: i32, %arg7: i32, %arg8: i16, %arg9: i16, %arg10: i16, %arg11: i64) {
    nvvm.cp.async.bulk.tensor.shared.cluster.global %arg1, %arg0, %arg2, box[%arg3, %arg4, %arg5, %arg6, %arg7] im2col[%arg8, %arg9, %arg10] l2_cache_hint = %arg11 {isCTAOnly = true, mode = #nvvm.tma_load_mode<im2col>} : !llvm.ptr<3>, !llvm.ptr
    nvvm.cp.async.bulk.tensor.shared.cluster.global %arg1, %arg0, %arg2, box[%arg3, %arg4, %arg5, %arg6, %arg7] im2col[%arg8, %arg9, %arg10] {isCTAOnly = true, mode = #nvvm.tma_load_mode<im2col>} : !llvm.ptr<3>, !llvm.ptr
    llvm.return
  }
  llvm.func @tma_load_3d_im2col_w(%arg0: !llvm.ptr, %arg1: !llvm.ptr<3>, %arg2: !llvm.ptr<3>, %arg3: i32, %arg4: i32, %arg5: i32, %arg6: i16, %arg7: i16, %arg8: i64) {
    nvvm.cp.async.bulk.tensor.shared.cluster.global %arg1, %arg0, %arg2, box[%arg3, %arg4, %arg5] im2col[%arg6, %arg7] {isCTAOnly = true, mode = #nvvm.tma_load_mode<im2col_w>} : !llvm.ptr<3>, !llvm.ptr
    nvvm.cp.async.bulk.tensor.shared.cluster.global %arg1, %arg0, %arg2, box[%arg3, %arg4, %arg5] im2col[%arg6, %arg7] l2_cache_hint = %arg8 {isCTAOnly = true, mode = #nvvm.tma_load_mode<im2col_w>} : !llvm.ptr<3>, !llvm.ptr
    llvm.return
  }
  llvm.func @tma_load_4d_im2col_w(%arg0: !llvm.ptr, %arg1: !llvm.ptr<3>, %arg2: !llvm.ptr<3>, %arg3: i32, %arg4: i32, %arg5: i32, %arg6: i32, %arg7: i16, %arg8: i16, %arg9: i64) {
    nvvm.cp.async.bulk.tensor.shared.cluster.global %arg1, %arg0, %arg2, box[%arg3, %arg4, %arg5, %arg6] im2col[%arg7, %arg8] {isCTAOnly = true, mode = #nvvm.tma_load_mode<im2col_w>} : !llvm.ptr<3>, !llvm.ptr
    nvvm.cp.async.bulk.tensor.shared.cluster.global %arg1, %arg0, %arg2, box[%arg3, %arg4, %arg5, %arg6] im2col[%arg7, %arg8] l2_cache_hint = %arg9 {isCTAOnly = true, mode = #nvvm.tma_load_mode<im2col_w>} : !llvm.ptr<3>, !llvm.ptr
    llvm.return
  }
  llvm.func @tma_load_5d_im2col_w(%arg0: !llvm.ptr, %arg1: !llvm.ptr<3>, %arg2: !llvm.ptr<3>, %arg3: i32, %arg4: i32, %arg5: i32, %arg6: i32, %arg7: i32, %arg8: i16, %arg9: i16, %arg10: i64) {
    nvvm.cp.async.bulk.tensor.shared.cluster.global %arg1, %arg0, %arg2, box[%arg3, %arg4, %arg5, %arg6, %arg7] im2col[%arg8, %arg9] {isCTAOnly = true, mode = #nvvm.tma_load_mode<im2col_w>} : !llvm.ptr<3>, !llvm.ptr
    nvvm.cp.async.bulk.tensor.shared.cluster.global %arg1, %arg0, %arg2, box[%arg3, %arg4, %arg5, %arg6, %arg7] im2col[%arg8, %arg9] l2_cache_hint = %arg10 {isCTAOnly = true, mode = #nvvm.tma_load_mode<im2col_w>} : !llvm.ptr<3>, !llvm.ptr
    llvm.return
  }
  llvm.func @tma_load_3d_im2col_w_128(%arg0: !llvm.ptr, %arg1: !llvm.ptr<3>, %arg2: !llvm.ptr<3>, %arg3: i32, %arg4: i32, %arg5: i32, %arg6: i16, %arg7: i16, %arg8: i64) {
    nvvm.cp.async.bulk.tensor.shared.cluster.global %arg1, %arg0, %arg2, box[%arg3, %arg4, %arg5] im2col[%arg6, %arg7] {isCTAOnly = true, mode = #nvvm.tma_load_mode<im2col_w_128>} : !llvm.ptr<3>, !llvm.ptr
    nvvm.cp.async.bulk.tensor.shared.cluster.global %arg1, %arg0, %arg2, box[%arg3, %arg4, %arg5] im2col[%arg6, %arg7] l2_cache_hint = %arg8 {isCTAOnly = true, mode = #nvvm.tma_load_mode<im2col_w_128>} : !llvm.ptr<3>, !llvm.ptr
    llvm.return
  }
  llvm.func @tma_load_4d_im2col_w_128(%arg0: !llvm.ptr, %arg1: !llvm.ptr<3>, %arg2: !llvm.ptr<3>, %arg3: i32, %arg4: i32, %arg5: i32, %arg6: i32, %arg7: i16, %arg8: i16, %arg9: i64) {
    nvvm.cp.async.bulk.tensor.shared.cluster.global %arg1, %arg0, %arg2, box[%arg3, %arg4, %arg5, %arg6] im2col[%arg7, %arg8] {isCTAOnly = true, mode = #nvvm.tma_load_mode<im2col_w_128>} : !llvm.ptr<3>, !llvm.ptr
    nvvm.cp.async.bulk.tensor.shared.cluster.global %arg1, %arg0, %arg2, box[%arg3, %arg4, %arg5, %arg6] im2col[%arg7, %arg8] l2_cache_hint = %arg9 {isCTAOnly = true, mode = #nvvm.tma_load_mode<im2col_w_128>} : !llvm.ptr<3>, !llvm.ptr
    llvm.return
  }
  llvm.func @tma_load_5d_im2col_w_128(%arg0: !llvm.ptr, %arg1: !llvm.ptr<3>, %arg2: !llvm.ptr<3>, %arg3: i32, %arg4: i32, %arg5: i32, %arg6: i32, %arg7: i32, %arg8: i16, %arg9: i16, %arg10: i64) {
    nvvm.cp.async.bulk.tensor.shared.cluster.global %arg1, %arg0, %arg2, box[%arg3, %arg4, %arg5, %arg6, %arg7] im2col[%arg8, %arg9] {isCTAOnly = true, mode = #nvvm.tma_load_mode<im2col_w_128>} : !llvm.ptr<3>, !llvm.ptr
    nvvm.cp.async.bulk.tensor.shared.cluster.global %arg1, %arg0, %arg2, box[%arg3, %arg4, %arg5, %arg6, %arg7] im2col[%arg8, %arg9] l2_cache_hint = %arg10 {isCTAOnly = true, mode = #nvvm.tma_load_mode<im2col_w_128>} : !llvm.ptr<3>, !llvm.ptr
    llvm.return
  }
}

