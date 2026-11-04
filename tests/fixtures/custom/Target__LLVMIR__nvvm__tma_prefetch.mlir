module {
  llvm.func @tma_bulk_prefetch(%arg0: !llvm.ptr<1>, %arg1: i32, %arg2: i64) {
    nvvm.cp.async.bulk.prefetch %arg0, %arg1 : <1>
    nvvm.cp.async.bulk.prefetch %arg0, %arg1 l2_cache_hint = %arg2 : <1>
    llvm.return
  }
  llvm.func @tma_prefetch_1d(%arg0: !llvm.ptr, %arg1: i32, %arg2: i64) {
    nvvm.cp.async.bulk.tensor.prefetch %arg0, box[%arg1] : !llvm.ptr
    nvvm.cp.async.bulk.tensor.prefetch %arg0, box[%arg1] l2_cache_hint = %arg2 : !llvm.ptr
    llvm.return
  }
  llvm.func @tma_prefetch_2d(%arg0: !llvm.ptr, %arg1: i32, %arg2: i32, %arg3: i64) {
    nvvm.cp.async.bulk.tensor.prefetch %arg0, box[%arg1, %arg2] : !llvm.ptr
    nvvm.cp.async.bulk.tensor.prefetch %arg0, box[%arg1, %arg2] l2_cache_hint = %arg3 : !llvm.ptr
    llvm.return
  }
  llvm.func @tma_prefetch_3d(%arg0: !llvm.ptr, %arg1: i32, %arg2: i32, %arg3: i32, %arg4: i16, %arg5: i16, %arg6: i64) {
    nvvm.cp.async.bulk.tensor.prefetch %arg0, box[%arg1, %arg2, %arg3] : !llvm.ptr
    nvvm.cp.async.bulk.tensor.prefetch %arg0, box[%arg1, %arg2, %arg3] l2_cache_hint = %arg6 : !llvm.ptr
    nvvm.cp.async.bulk.tensor.prefetch %arg0, box[%arg1, %arg2, %arg3] im2col[%arg4] {mode = #nvvm.tma_load_mode<im2col>} : !llvm.ptr
    nvvm.cp.async.bulk.tensor.prefetch %arg0, box[%arg1, %arg2, %arg3] im2col[%arg4] l2_cache_hint = %arg6 {mode = #nvvm.tma_load_mode<im2col>} : !llvm.ptr
    nvvm.cp.async.bulk.tensor.prefetch %arg0, box[%arg1, %arg2, %arg3] im2col[%arg4, %arg5] {mode = #nvvm.tma_load_mode<im2col_w>} : !llvm.ptr
    nvvm.cp.async.bulk.tensor.prefetch %arg0, box[%arg1, %arg2, %arg3] im2col[%arg4, %arg5] l2_cache_hint = %arg6 {mode = #nvvm.tma_load_mode<im2col_w>} : !llvm.ptr
    nvvm.cp.async.bulk.tensor.prefetch %arg0, box[%arg1, %arg2, %arg3] im2col[%arg4, %arg5] {mode = #nvvm.tma_load_mode<im2col_w_128>} : !llvm.ptr
    nvvm.cp.async.bulk.tensor.prefetch %arg0, box[%arg1, %arg2, %arg3] im2col[%arg4, %arg5] l2_cache_hint = %arg6 {mode = #nvvm.tma_load_mode<im2col_w_128>} : !llvm.ptr
    llvm.return
  }
  llvm.func @tma_prefetch_4d(%arg0: !llvm.ptr, %arg1: i32, %arg2: i32, %arg3: i32, %arg4: i32, %arg5: i16, %arg6: i16, %arg7: i64) {
    nvvm.cp.async.bulk.tensor.prefetch %arg0, box[%arg1, %arg2, %arg3, %arg4] : !llvm.ptr
    nvvm.cp.async.bulk.tensor.prefetch %arg0, box[%arg1, %arg2, %arg3, %arg4] l2_cache_hint = %arg7 : !llvm.ptr
    nvvm.cp.async.bulk.tensor.prefetch %arg0, box[%arg1, %arg2, %arg3, %arg4] im2col[%arg5, %arg6] {mode = #nvvm.tma_load_mode<im2col>} : !llvm.ptr
    nvvm.cp.async.bulk.tensor.prefetch %arg0, box[%arg1, %arg2, %arg3, %arg4] im2col[%arg5, %arg6] l2_cache_hint = %arg7 {mode = #nvvm.tma_load_mode<im2col>} : !llvm.ptr
    nvvm.cp.async.bulk.tensor.prefetch %arg0, box[%arg1, %arg2, %arg3, %arg4] im2col[%arg5, %arg6] {mode = #nvvm.tma_load_mode<im2col_w>} : !llvm.ptr
    nvvm.cp.async.bulk.tensor.prefetch %arg0, box[%arg1, %arg2, %arg3, %arg4] im2col[%arg5, %arg6] l2_cache_hint = %arg7 {mode = #nvvm.tma_load_mode<im2col_w>} : !llvm.ptr
    nvvm.cp.async.bulk.tensor.prefetch %arg0, box[%arg1, %arg2, %arg3, %arg4] im2col[%arg5, %arg6] {mode = #nvvm.tma_load_mode<im2col_w_128>} : !llvm.ptr
    nvvm.cp.async.bulk.tensor.prefetch %arg0, box[%arg1, %arg2, %arg3, %arg4] im2col[%arg5, %arg6] l2_cache_hint = %arg7 {mode = #nvvm.tma_load_mode<im2col_w_128>} : !llvm.ptr
    llvm.return
  }
  llvm.func @tma_prefetch_5d(%arg0: !llvm.ptr, %arg1: i32, %arg2: i32, %arg3: i32, %arg4: i32, %arg5: i32, %arg6: i16, %arg7: i16, %arg8: i16, %arg9: i64) {
    nvvm.cp.async.bulk.tensor.prefetch %arg0, box[%arg1, %arg2, %arg3, %arg4, %arg5] : !llvm.ptr
    nvvm.cp.async.bulk.tensor.prefetch %arg0, box[%arg1, %arg2, %arg3, %arg4, %arg5] l2_cache_hint = %arg9 : !llvm.ptr
    nvvm.cp.async.bulk.tensor.prefetch %arg0, box[%arg1, %arg2, %arg3, %arg4, %arg5] im2col[%arg6, %arg7, %arg8] {mode = #nvvm.tma_load_mode<im2col>} : !llvm.ptr
    nvvm.cp.async.bulk.tensor.prefetch %arg0, box[%arg1, %arg2, %arg3, %arg4, %arg5] im2col[%arg6, %arg7, %arg8] l2_cache_hint = %arg9 {mode = #nvvm.tma_load_mode<im2col>} : !llvm.ptr
    nvvm.cp.async.bulk.tensor.prefetch %arg0, box[%arg1, %arg2, %arg3, %arg4, %arg5] im2col[%arg6, %arg7] {mode = #nvvm.tma_load_mode<im2col_w>} : !llvm.ptr
    nvvm.cp.async.bulk.tensor.prefetch %arg0, box[%arg1, %arg2, %arg3, %arg4, %arg5] im2col[%arg6, %arg7] l2_cache_hint = %arg9 {mode = #nvvm.tma_load_mode<im2col_w>} : !llvm.ptr
    nvvm.cp.async.bulk.tensor.prefetch %arg0, box[%arg1, %arg2, %arg3, %arg4, %arg5] im2col[%arg6, %arg7] {mode = #nvvm.tma_load_mode<im2col_w_128>} : !llvm.ptr
    nvvm.cp.async.bulk.tensor.prefetch %arg0, box[%arg1, %arg2, %arg3, %arg4, %arg5] im2col[%arg6, %arg7] l2_cache_hint = %arg9 {mode = #nvvm.tma_load_mode<im2col_w_128>} : !llvm.ptr
    llvm.return
  }
  llvm.func @tma_prefetch_gather4_2d(%arg0: !llvm.ptr, %arg1: i32, %arg2: i32, %arg3: i32, %arg4: i32, %arg5: i32, %arg6: i64) {
    nvvm.cp.async.bulk.tensor.prefetch %arg0, box[%arg1, %arg2, %arg3, %arg4, %arg5] {mode = #nvvm.tma_load_mode<tile_gather4>} : !llvm.ptr
    nvvm.cp.async.bulk.tensor.prefetch %arg0, box[%arg1, %arg2, %arg3, %arg4, %arg5] l2_cache_hint = %arg6 {mode = #nvvm.tma_load_mode<tile_gather4>} : !llvm.ptr
    llvm.return
  }
}

