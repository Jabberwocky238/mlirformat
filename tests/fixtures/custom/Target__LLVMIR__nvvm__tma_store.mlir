module {
  llvm.func @tma_store_1d(%arg0: !llvm.ptr, %arg1: !llvm.ptr<3>, %arg2: i32, %arg3: i64) {
    nvvm.cp.async.bulk.tensor.global.shared.cta %arg0, %arg1, box[%arg2] : !llvm.ptr, <3>
    nvvm.cp.async.bulk.tensor.global.shared.cta %arg0, %arg1, box[%arg2] l2_cache_hint = %arg3 : !llvm.ptr, <3>
    llvm.return
  }
  llvm.func @tma_store_2d(%arg0: !llvm.ptr, %arg1: !llvm.ptr<3>, %arg2: i32, %arg3: i32, %arg4: i64) {
    nvvm.cp.async.bulk.tensor.global.shared.cta %arg0, %arg1, box[%arg2, %arg3] : !llvm.ptr, <3>
    nvvm.cp.async.bulk.tensor.global.shared.cta %arg0, %arg1, box[%arg2, %arg3] l2_cache_hint = %arg4 : !llvm.ptr, <3>
    llvm.return
  }
  llvm.func @tma_store_3d(%arg0: !llvm.ptr, %arg1: !llvm.ptr<3>, %arg2: i32, %arg3: i32, %arg4: i32, %arg5: i64) {
    nvvm.cp.async.bulk.tensor.global.shared.cta %arg0, %arg1, box[%arg2, %arg3, %arg4] : !llvm.ptr, <3>
    nvvm.cp.async.bulk.tensor.global.shared.cta %arg0, %arg1, box[%arg2, %arg3, %arg4] l2_cache_hint = %arg5 : !llvm.ptr, <3>
    nvvm.cp.async.bulk.tensor.global.shared.cta %arg0, %arg1, box[%arg2, %arg3, %arg4] {mode = #nvvm.tma_store_mode<im2col>} : !llvm.ptr, <3>
    nvvm.cp.async.bulk.tensor.global.shared.cta %arg0, %arg1, box[%arg2, %arg3, %arg4] l2_cache_hint = %arg5 {mode = #nvvm.tma_store_mode<im2col>} : !llvm.ptr, <3>
    llvm.return
  }
  llvm.func @tma_store_4d(%arg0: !llvm.ptr, %arg1: !llvm.ptr<3>, %arg2: i32, %arg3: i32, %arg4: i32, %arg5: i32, %arg6: i64) {
    nvvm.cp.async.bulk.tensor.global.shared.cta %arg0, %arg1, box[%arg2, %arg3, %arg4, %arg5] : !llvm.ptr, <3>
    nvvm.cp.async.bulk.tensor.global.shared.cta %arg0, %arg1, box[%arg2, %arg3, %arg4, %arg5] l2_cache_hint = %arg6 : !llvm.ptr, <3>
    nvvm.cp.async.bulk.tensor.global.shared.cta %arg0, %arg1, box[%arg2, %arg3, %arg4, %arg5] {mode = #nvvm.tma_store_mode<im2col>} : !llvm.ptr, <3>
    nvvm.cp.async.bulk.tensor.global.shared.cta %arg0, %arg1, box[%arg2, %arg3, %arg4, %arg5] l2_cache_hint = %arg6 {mode = #nvvm.tma_store_mode<im2col>} : !llvm.ptr, <3>
    llvm.return
  }
  llvm.func @tma_store_5d(%arg0: !llvm.ptr, %arg1: !llvm.ptr<3>, %arg2: i32, %arg3: i32, %arg4: i32, %arg5: i32, %arg6: i32, %arg7: i64) {
    nvvm.cp.async.bulk.tensor.global.shared.cta %arg0, %arg1, box[%arg2, %arg3, %arg4, %arg5, %arg6] : !llvm.ptr, <3>
    nvvm.cp.async.bulk.tensor.global.shared.cta %arg0, %arg1, box[%arg2, %arg3, %arg4, %arg5, %arg6] l2_cache_hint = %arg7 : !llvm.ptr, <3>
    nvvm.cp.async.bulk.tensor.global.shared.cta %arg0, %arg1, box[%arg2, %arg3, %arg4, %arg5, %arg6] {mode = #nvvm.tma_store_mode<im2col>} : !llvm.ptr, <3>
    nvvm.cp.async.bulk.tensor.global.shared.cta %arg0, %arg1, box[%arg2, %arg3, %arg4, %arg5, %arg6] l2_cache_hint = %arg7 {mode = #nvvm.tma_store_mode<im2col>} : !llvm.ptr, <3>
    llvm.return
  }
  llvm.func @tma_store_scatter(%arg0: !llvm.ptr, %arg1: !llvm.ptr<3>, %arg2: i32, %arg3: i32, %arg4: i32, %arg5: i32, %arg6: i32, %arg7: i64) {
    nvvm.cp.async.bulk.tensor.global.shared.cta %arg0, %arg1, box[%arg2, %arg3, %arg4, %arg5, %arg6] {mode = #nvvm.tma_store_mode<tile_scatter4>} : !llvm.ptr, <3>
    nvvm.cp.async.bulk.tensor.global.shared.cta %arg0, %arg1, box[%arg2, %arg3, %arg4, %arg5, %arg6] l2_cache_hint = %arg7 {mode = #nvvm.tma_store_mode<tile_scatter4>} : !llvm.ptr, <3>
    llvm.return
  }
}

