module {
  llvm.func @tma_store_reduce_1d(%arg0: !llvm.ptr<3>, %arg1: !llvm.ptr, %arg2: i32, %arg3: i64) {
    nvvm.cp.async.bulk.tensor.reduce %arg1, %arg0, box[%arg2] l2_cache_hint = %arg3 {redKind = #nvvm.tma_redux_kind<add>} : !llvm.ptr, <3>
    nvvm.cp.async.bulk.tensor.reduce %arg1, %arg0, box[%arg2] l2_cache_hint = %arg3 {redKind = #nvvm.tma_redux_kind<min>} : !llvm.ptr, <3>
    nvvm.cp.async.bulk.tensor.reduce %arg1, %arg0, box[%arg2] l2_cache_hint = %arg3 {redKind = #nvvm.tma_redux_kind<max>} : !llvm.ptr, <3>
    nvvm.cp.async.bulk.tensor.reduce %arg1, %arg0, box[%arg2] l2_cache_hint = %arg3 {redKind = #nvvm.tma_redux_kind<inc>} : !llvm.ptr, <3>
    nvvm.cp.async.bulk.tensor.reduce %arg1, %arg0, box[%arg2] l2_cache_hint = %arg3 {redKind = #nvvm.tma_redux_kind<dec>} : !llvm.ptr, <3>
    nvvm.cp.async.bulk.tensor.reduce %arg1, %arg0, box[%arg2] l2_cache_hint = %arg3 {redKind = #nvvm.tma_redux_kind<and>} : !llvm.ptr, <3>
    nvvm.cp.async.bulk.tensor.reduce %arg1, %arg0, box[%arg2] l2_cache_hint = %arg3 {redKind = #nvvm.tma_redux_kind<or>} : !llvm.ptr, <3>
    nvvm.cp.async.bulk.tensor.reduce %arg1, %arg0, box[%arg2] l2_cache_hint = %arg3 {redKind = #nvvm.tma_redux_kind<xor>} : !llvm.ptr, <3>
    nvvm.cp.async.bulk.tensor.reduce %arg1, %arg0, box[%arg2] {redKind = #nvvm.tma_redux_kind<add>} : !llvm.ptr, <3>
    nvvm.cp.async.bulk.tensor.reduce %arg1, %arg0, box[%arg2] {redKind = #nvvm.tma_redux_kind<min>} : !llvm.ptr, <3>
    nvvm.cp.async.bulk.tensor.reduce %arg1, %arg0, box[%arg2] {redKind = #nvvm.tma_redux_kind<max>} : !llvm.ptr, <3>
    nvvm.cp.async.bulk.tensor.reduce %arg1, %arg0, box[%arg2] {redKind = #nvvm.tma_redux_kind<inc>} : !llvm.ptr, <3>
    nvvm.cp.async.bulk.tensor.reduce %arg1, %arg0, box[%arg2] {redKind = #nvvm.tma_redux_kind<dec>} : !llvm.ptr, <3>
    nvvm.cp.async.bulk.tensor.reduce %arg1, %arg0, box[%arg2] {redKind = #nvvm.tma_redux_kind<and>} : !llvm.ptr, <3>
    nvvm.cp.async.bulk.tensor.reduce %arg1, %arg0, box[%arg2] {redKind = #nvvm.tma_redux_kind<or>} : !llvm.ptr, <3>
    nvvm.cp.async.bulk.tensor.reduce %arg1, %arg0, box[%arg2] {redKind = #nvvm.tma_redux_kind<xor>} : !llvm.ptr, <3>
    llvm.return
  }
}

// -----
module {
  llvm.func @tma_store_reduce_2d(%arg0: !llvm.ptr<3>, %arg1: !llvm.ptr, %arg2: i32, %arg3: i32, %arg4: i64) {
    nvvm.cp.async.bulk.tensor.reduce %arg1, %arg0, box[%arg2, %arg3] l2_cache_hint = %arg4 {redKind = #nvvm.tma_redux_kind<add>} : !llvm.ptr, <3>
    nvvm.cp.async.bulk.tensor.reduce %arg1, %arg0, box[%arg2, %arg3] l2_cache_hint = %arg4 {redKind = #nvvm.tma_redux_kind<min>} : !llvm.ptr, <3>
    nvvm.cp.async.bulk.tensor.reduce %arg1, %arg0, box[%arg2, %arg3] l2_cache_hint = %arg4 {redKind = #nvvm.tma_redux_kind<max>} : !llvm.ptr, <3>
    nvvm.cp.async.bulk.tensor.reduce %arg1, %arg0, box[%arg2, %arg3] l2_cache_hint = %arg4 {redKind = #nvvm.tma_redux_kind<inc>} : !llvm.ptr, <3>
    nvvm.cp.async.bulk.tensor.reduce %arg1, %arg0, box[%arg2, %arg3] l2_cache_hint = %arg4 {redKind = #nvvm.tma_redux_kind<dec>} : !llvm.ptr, <3>
    nvvm.cp.async.bulk.tensor.reduce %arg1, %arg0, box[%arg2, %arg3] l2_cache_hint = %arg4 {redKind = #nvvm.tma_redux_kind<and>} : !llvm.ptr, <3>
    nvvm.cp.async.bulk.tensor.reduce %arg1, %arg0, box[%arg2, %arg3] l2_cache_hint = %arg4 {redKind = #nvvm.tma_redux_kind<or>} : !llvm.ptr, <3>
    nvvm.cp.async.bulk.tensor.reduce %arg1, %arg0, box[%arg2, %arg3] l2_cache_hint = %arg4 {redKind = #nvvm.tma_redux_kind<xor>} : !llvm.ptr, <3>
    nvvm.cp.async.bulk.tensor.reduce %arg1, %arg0, box[%arg2, %arg3] {redKind = #nvvm.tma_redux_kind<add>} : !llvm.ptr, <3>
    nvvm.cp.async.bulk.tensor.reduce %arg1, %arg0, box[%arg2, %arg3] {redKind = #nvvm.tma_redux_kind<min>} : !llvm.ptr, <3>
    nvvm.cp.async.bulk.tensor.reduce %arg1, %arg0, box[%arg2, %arg3] {redKind = #nvvm.tma_redux_kind<max>} : !llvm.ptr, <3>
    nvvm.cp.async.bulk.tensor.reduce %arg1, %arg0, box[%arg2, %arg3] {redKind = #nvvm.tma_redux_kind<inc>} : !llvm.ptr, <3>
    nvvm.cp.async.bulk.tensor.reduce %arg1, %arg0, box[%arg2, %arg3] {redKind = #nvvm.tma_redux_kind<dec>} : !llvm.ptr, <3>
    nvvm.cp.async.bulk.tensor.reduce %arg1, %arg0, box[%arg2, %arg3] {redKind = #nvvm.tma_redux_kind<and>} : !llvm.ptr, <3>
    nvvm.cp.async.bulk.tensor.reduce %arg1, %arg0, box[%arg2, %arg3] {redKind = #nvvm.tma_redux_kind<or>} : !llvm.ptr, <3>
    nvvm.cp.async.bulk.tensor.reduce %arg1, %arg0, box[%arg2, %arg3] {redKind = #nvvm.tma_redux_kind<xor>} : !llvm.ptr, <3>
    llvm.return
  }
}

// -----
module {
  llvm.func @tma_store_reduce_3d_tile(%arg0: !llvm.ptr<3>, %arg1: !llvm.ptr, %arg2: i32, %arg3: i32, %arg4: i32, %arg5: i64) {
    nvvm.cp.async.bulk.tensor.reduce %arg1, %arg0, box[%arg2, %arg3, %arg4] l2_cache_hint = %arg5 {redKind = #nvvm.tma_redux_kind<add>} : !llvm.ptr, <3>
    nvvm.cp.async.bulk.tensor.reduce %arg1, %arg0, box[%arg2, %arg3, %arg4] l2_cache_hint = %arg5 {redKind = #nvvm.tma_redux_kind<min>} : !llvm.ptr, <3>
    nvvm.cp.async.bulk.tensor.reduce %arg1, %arg0, box[%arg2, %arg3, %arg4] l2_cache_hint = %arg5 {redKind = #nvvm.tma_redux_kind<max>} : !llvm.ptr, <3>
    nvvm.cp.async.bulk.tensor.reduce %arg1, %arg0, box[%arg2, %arg3, %arg4] l2_cache_hint = %arg5 {redKind = #nvvm.tma_redux_kind<inc>} : !llvm.ptr, <3>
    nvvm.cp.async.bulk.tensor.reduce %arg1, %arg0, box[%arg2, %arg3, %arg4] l2_cache_hint = %arg5 {redKind = #nvvm.tma_redux_kind<dec>} : !llvm.ptr, <3>
    nvvm.cp.async.bulk.tensor.reduce %arg1, %arg0, box[%arg2, %arg3, %arg4] l2_cache_hint = %arg5 {redKind = #nvvm.tma_redux_kind<and>} : !llvm.ptr, <3>
    nvvm.cp.async.bulk.tensor.reduce %arg1, %arg0, box[%arg2, %arg3, %arg4] l2_cache_hint = %arg5 {redKind = #nvvm.tma_redux_kind<or>} : !llvm.ptr, <3>
    nvvm.cp.async.bulk.tensor.reduce %arg1, %arg0, box[%arg2, %arg3, %arg4] l2_cache_hint = %arg5 {redKind = #nvvm.tma_redux_kind<xor>} : !llvm.ptr, <3>
    nvvm.cp.async.bulk.tensor.reduce %arg1, %arg0, box[%arg2, %arg3, %arg4] {redKind = #nvvm.tma_redux_kind<add>} : !llvm.ptr, <3>
    nvvm.cp.async.bulk.tensor.reduce %arg1, %arg0, box[%arg2, %arg3, %arg4] {redKind = #nvvm.tma_redux_kind<min>} : !llvm.ptr, <3>
    nvvm.cp.async.bulk.tensor.reduce %arg1, %arg0, box[%arg2, %arg3, %arg4] {redKind = #nvvm.tma_redux_kind<max>} : !llvm.ptr, <3>
    nvvm.cp.async.bulk.tensor.reduce %arg1, %arg0, box[%arg2, %arg3, %arg4] {redKind = #nvvm.tma_redux_kind<inc>} : !llvm.ptr, <3>
    nvvm.cp.async.bulk.tensor.reduce %arg1, %arg0, box[%arg2, %arg3, %arg4] {redKind = #nvvm.tma_redux_kind<dec>} : !llvm.ptr, <3>
    nvvm.cp.async.bulk.tensor.reduce %arg1, %arg0, box[%arg2, %arg3, %arg4] {redKind = #nvvm.tma_redux_kind<and>} : !llvm.ptr, <3>
    nvvm.cp.async.bulk.tensor.reduce %arg1, %arg0, box[%arg2, %arg3, %arg4] {redKind = #nvvm.tma_redux_kind<or>} : !llvm.ptr, <3>
    nvvm.cp.async.bulk.tensor.reduce %arg1, %arg0, box[%arg2, %arg3, %arg4] {redKind = #nvvm.tma_redux_kind<xor>} : !llvm.ptr, <3>
    llvm.return
  }
  llvm.func @tma_store_reduce_3d_im2col(%arg0: !llvm.ptr<3>, %arg1: !llvm.ptr, %arg2: i32, %arg3: i32, %arg4: i32, %arg5: i64) {
    nvvm.cp.async.bulk.tensor.reduce %arg1, %arg0, box[%arg2, %arg3, %arg4] l2_cache_hint = %arg5 {mode = #nvvm.tma_store_mode<im2col>, redKind = #nvvm.tma_redux_kind<add>} : !llvm.ptr, <3>
    nvvm.cp.async.bulk.tensor.reduce %arg1, %arg0, box[%arg2, %arg3, %arg4] l2_cache_hint = %arg5 {mode = #nvvm.tma_store_mode<im2col>, redKind = #nvvm.tma_redux_kind<min>} : !llvm.ptr, <3>
    nvvm.cp.async.bulk.tensor.reduce %arg1, %arg0, box[%arg2, %arg3, %arg4] l2_cache_hint = %arg5 {mode = #nvvm.tma_store_mode<im2col>, redKind = #nvvm.tma_redux_kind<max>} : !llvm.ptr, <3>
    nvvm.cp.async.bulk.tensor.reduce %arg1, %arg0, box[%arg2, %arg3, %arg4] l2_cache_hint = %arg5 {mode = #nvvm.tma_store_mode<im2col>, redKind = #nvvm.tma_redux_kind<inc>} : !llvm.ptr, <3>
    nvvm.cp.async.bulk.tensor.reduce %arg1, %arg0, box[%arg2, %arg3, %arg4] l2_cache_hint = %arg5 {mode = #nvvm.tma_store_mode<im2col>, redKind = #nvvm.tma_redux_kind<dec>} : !llvm.ptr, <3>
    nvvm.cp.async.bulk.tensor.reduce %arg1, %arg0, box[%arg2, %arg3, %arg4] l2_cache_hint = %arg5 {mode = #nvvm.tma_store_mode<im2col>, redKind = #nvvm.tma_redux_kind<and>} : !llvm.ptr, <3>
    nvvm.cp.async.bulk.tensor.reduce %arg1, %arg0, box[%arg2, %arg3, %arg4] l2_cache_hint = %arg5 {mode = #nvvm.tma_store_mode<im2col>, redKind = #nvvm.tma_redux_kind<or>} : !llvm.ptr, <3>
    nvvm.cp.async.bulk.tensor.reduce %arg1, %arg0, box[%arg2, %arg3, %arg4] l2_cache_hint = %arg5 {mode = #nvvm.tma_store_mode<im2col>, redKind = #nvvm.tma_redux_kind<xor>} : !llvm.ptr, <3>
    nvvm.cp.async.bulk.tensor.reduce %arg1, %arg0, box[%arg2, %arg3, %arg4] {mode = #nvvm.tma_store_mode<im2col>, redKind = #nvvm.tma_redux_kind<add>} : !llvm.ptr, <3>
    nvvm.cp.async.bulk.tensor.reduce %arg1, %arg0, box[%arg2, %arg3, %arg4] {mode = #nvvm.tma_store_mode<im2col>, redKind = #nvvm.tma_redux_kind<min>} : !llvm.ptr, <3>
    nvvm.cp.async.bulk.tensor.reduce %arg1, %arg0, box[%arg2, %arg3, %arg4] {mode = #nvvm.tma_store_mode<im2col>, redKind = #nvvm.tma_redux_kind<max>} : !llvm.ptr, <3>
    nvvm.cp.async.bulk.tensor.reduce %arg1, %arg0, box[%arg2, %arg3, %arg4] {mode = #nvvm.tma_store_mode<im2col>, redKind = #nvvm.tma_redux_kind<inc>} : !llvm.ptr, <3>
    nvvm.cp.async.bulk.tensor.reduce %arg1, %arg0, box[%arg2, %arg3, %arg4] {mode = #nvvm.tma_store_mode<im2col>, redKind = #nvvm.tma_redux_kind<dec>} : !llvm.ptr, <3>
    nvvm.cp.async.bulk.tensor.reduce %arg1, %arg0, box[%arg2, %arg3, %arg4] {mode = #nvvm.tma_store_mode<im2col>, redKind = #nvvm.tma_redux_kind<and>} : !llvm.ptr, <3>
    nvvm.cp.async.bulk.tensor.reduce %arg1, %arg0, box[%arg2, %arg3, %arg4] {mode = #nvvm.tma_store_mode<im2col>, redKind = #nvvm.tma_redux_kind<or>} : !llvm.ptr, <3>
    nvvm.cp.async.bulk.tensor.reduce %arg1, %arg0, box[%arg2, %arg3, %arg4] {mode = #nvvm.tma_store_mode<im2col>, redKind = #nvvm.tma_redux_kind<xor>} : !llvm.ptr, <3>
    llvm.return
  }
}

// -----
module {
  llvm.func @tma_store_reduce_4d_tile(%arg0: !llvm.ptr<3>, %arg1: !llvm.ptr, %arg2: i32, %arg3: i32, %arg4: i32, %arg5: i32, %arg6: i64) {
    nvvm.cp.async.bulk.tensor.reduce %arg1, %arg0, box[%arg2, %arg3, %arg4, %arg5] l2_cache_hint = %arg6 {redKind = #nvvm.tma_redux_kind<add>} : !llvm.ptr, <3>
    nvvm.cp.async.bulk.tensor.reduce %arg1, %arg0, box[%arg2, %arg3, %arg4, %arg5] l2_cache_hint = %arg6 {redKind = #nvvm.tma_redux_kind<min>} : !llvm.ptr, <3>
    nvvm.cp.async.bulk.tensor.reduce %arg1, %arg0, box[%arg2, %arg3, %arg4, %arg5] l2_cache_hint = %arg6 {redKind = #nvvm.tma_redux_kind<max>} : !llvm.ptr, <3>
    nvvm.cp.async.bulk.tensor.reduce %arg1, %arg0, box[%arg2, %arg3, %arg4, %arg5] l2_cache_hint = %arg6 {redKind = #nvvm.tma_redux_kind<inc>} : !llvm.ptr, <3>
    nvvm.cp.async.bulk.tensor.reduce %arg1, %arg0, box[%arg2, %arg3, %arg4, %arg5] l2_cache_hint = %arg6 {redKind = #nvvm.tma_redux_kind<dec>} : !llvm.ptr, <3>
    nvvm.cp.async.bulk.tensor.reduce %arg1, %arg0, box[%arg2, %arg3, %arg4, %arg5] l2_cache_hint = %arg6 {redKind = #nvvm.tma_redux_kind<and>} : !llvm.ptr, <3>
    nvvm.cp.async.bulk.tensor.reduce %arg1, %arg0, box[%arg2, %arg3, %arg4, %arg5] l2_cache_hint = %arg6 {redKind = #nvvm.tma_redux_kind<or>} : !llvm.ptr, <3>
    nvvm.cp.async.bulk.tensor.reduce %arg1, %arg0, box[%arg2, %arg3, %arg4, %arg5] l2_cache_hint = %arg6 {redKind = #nvvm.tma_redux_kind<xor>} : !llvm.ptr, <3>
    nvvm.cp.async.bulk.tensor.reduce %arg1, %arg0, box[%arg2, %arg3, %arg4, %arg5] {redKind = #nvvm.tma_redux_kind<add>} : !llvm.ptr, <3>
    nvvm.cp.async.bulk.tensor.reduce %arg1, %arg0, box[%arg2, %arg3, %arg4, %arg5] {redKind = #nvvm.tma_redux_kind<min>} : !llvm.ptr, <3>
    nvvm.cp.async.bulk.tensor.reduce %arg1, %arg0, box[%arg2, %arg3, %arg4, %arg5] {redKind = #nvvm.tma_redux_kind<max>} : !llvm.ptr, <3>
    nvvm.cp.async.bulk.tensor.reduce %arg1, %arg0, box[%arg2, %arg3, %arg4, %arg5] {redKind = #nvvm.tma_redux_kind<inc>} : !llvm.ptr, <3>
    nvvm.cp.async.bulk.tensor.reduce %arg1, %arg0, box[%arg2, %arg3, %arg4, %arg5] {redKind = #nvvm.tma_redux_kind<dec>} : !llvm.ptr, <3>
    nvvm.cp.async.bulk.tensor.reduce %arg1, %arg0, box[%arg2, %arg3, %arg4, %arg5] {redKind = #nvvm.tma_redux_kind<and>} : !llvm.ptr, <3>
    nvvm.cp.async.bulk.tensor.reduce %arg1, %arg0, box[%arg2, %arg3, %arg4, %arg5] {redKind = #nvvm.tma_redux_kind<or>} : !llvm.ptr, <3>
    nvvm.cp.async.bulk.tensor.reduce %arg1, %arg0, box[%arg2, %arg3, %arg4, %arg5] {redKind = #nvvm.tma_redux_kind<xor>} : !llvm.ptr, <3>
    llvm.return
  }
  llvm.func @tma_store_reduce_4d_im2col(%arg0: !llvm.ptr<3>, %arg1: !llvm.ptr, %arg2: i32, %arg3: i32, %arg4: i32, %arg5: i32, %arg6: i64) {
    nvvm.cp.async.bulk.tensor.reduce %arg1, %arg0, box[%arg2, %arg3, %arg4, %arg5] l2_cache_hint = %arg6 {mode = #nvvm.tma_store_mode<im2col>, redKind = #nvvm.tma_redux_kind<add>} : !llvm.ptr, <3>
    nvvm.cp.async.bulk.tensor.reduce %arg1, %arg0, box[%arg2, %arg3, %arg4, %arg5] l2_cache_hint = %arg6 {mode = #nvvm.tma_store_mode<im2col>, redKind = #nvvm.tma_redux_kind<min>} : !llvm.ptr, <3>
    nvvm.cp.async.bulk.tensor.reduce %arg1, %arg0, box[%arg2, %arg3, %arg4, %arg5] l2_cache_hint = %arg6 {mode = #nvvm.tma_store_mode<im2col>, redKind = #nvvm.tma_redux_kind<max>} : !llvm.ptr, <3>
    nvvm.cp.async.bulk.tensor.reduce %arg1, %arg0, box[%arg2, %arg3, %arg4, %arg5] l2_cache_hint = %arg6 {mode = #nvvm.tma_store_mode<im2col>, redKind = #nvvm.tma_redux_kind<inc>} : !llvm.ptr, <3>
    nvvm.cp.async.bulk.tensor.reduce %arg1, %arg0, box[%arg2, %arg3, %arg4, %arg5] l2_cache_hint = %arg6 {mode = #nvvm.tma_store_mode<im2col>, redKind = #nvvm.tma_redux_kind<dec>} : !llvm.ptr, <3>
    nvvm.cp.async.bulk.tensor.reduce %arg1, %arg0, box[%arg2, %arg3, %arg4, %arg5] l2_cache_hint = %arg6 {mode = #nvvm.tma_store_mode<im2col>, redKind = #nvvm.tma_redux_kind<and>} : !llvm.ptr, <3>
    nvvm.cp.async.bulk.tensor.reduce %arg1, %arg0, box[%arg2, %arg3, %arg4, %arg5] l2_cache_hint = %arg6 {mode = #nvvm.tma_store_mode<im2col>, redKind = #nvvm.tma_redux_kind<or>} : !llvm.ptr, <3>
    nvvm.cp.async.bulk.tensor.reduce %arg1, %arg0, box[%arg2, %arg3, %arg4, %arg5] l2_cache_hint = %arg6 {mode = #nvvm.tma_store_mode<im2col>, redKind = #nvvm.tma_redux_kind<xor>} : !llvm.ptr, <3>
    nvvm.cp.async.bulk.tensor.reduce %arg1, %arg0, box[%arg2, %arg3, %arg4, %arg5] {mode = #nvvm.tma_store_mode<im2col>, redKind = #nvvm.tma_redux_kind<add>} : !llvm.ptr, <3>
    nvvm.cp.async.bulk.tensor.reduce %arg1, %arg0, box[%arg2, %arg3, %arg4, %arg5] {mode = #nvvm.tma_store_mode<im2col>, redKind = #nvvm.tma_redux_kind<min>} : !llvm.ptr, <3>
    nvvm.cp.async.bulk.tensor.reduce %arg1, %arg0, box[%arg2, %arg3, %arg4, %arg5] {mode = #nvvm.tma_store_mode<im2col>, redKind = #nvvm.tma_redux_kind<max>} : !llvm.ptr, <3>
    nvvm.cp.async.bulk.tensor.reduce %arg1, %arg0, box[%arg2, %arg3, %arg4, %arg5] {mode = #nvvm.tma_store_mode<im2col>, redKind = #nvvm.tma_redux_kind<inc>} : !llvm.ptr, <3>
    nvvm.cp.async.bulk.tensor.reduce %arg1, %arg0, box[%arg2, %arg3, %arg4, %arg5] {mode = #nvvm.tma_store_mode<im2col>, redKind = #nvvm.tma_redux_kind<dec>} : !llvm.ptr, <3>
    nvvm.cp.async.bulk.tensor.reduce %arg1, %arg0, box[%arg2, %arg3, %arg4, %arg5] {mode = #nvvm.tma_store_mode<im2col>, redKind = #nvvm.tma_redux_kind<and>} : !llvm.ptr, <3>
    nvvm.cp.async.bulk.tensor.reduce %arg1, %arg0, box[%arg2, %arg3, %arg4, %arg5] {mode = #nvvm.tma_store_mode<im2col>, redKind = #nvvm.tma_redux_kind<or>} : !llvm.ptr, <3>
    nvvm.cp.async.bulk.tensor.reduce %arg1, %arg0, box[%arg2, %arg3, %arg4, %arg5] {mode = #nvvm.tma_store_mode<im2col>, redKind = #nvvm.tma_redux_kind<xor>} : !llvm.ptr, <3>
    llvm.return
  }
}

// -----
module {
  llvm.func @tma_store_reduce_5d_tile(%arg0: !llvm.ptr<3>, %arg1: !llvm.ptr, %arg2: i32, %arg3: i32, %arg4: i32, %arg5: i32, %arg6: i32, %arg7: i64) {
    nvvm.cp.async.bulk.tensor.reduce %arg1, %arg0, box[%arg2, %arg3, %arg4, %arg5, %arg6] l2_cache_hint = %arg7 {redKind = #nvvm.tma_redux_kind<add>} : !llvm.ptr, <3>
    nvvm.cp.async.bulk.tensor.reduce %arg1, %arg0, box[%arg2, %arg3, %arg4, %arg5, %arg6] l2_cache_hint = %arg7 {redKind = #nvvm.tma_redux_kind<min>} : !llvm.ptr, <3>
    nvvm.cp.async.bulk.tensor.reduce %arg1, %arg0, box[%arg2, %arg3, %arg4, %arg5, %arg6] l2_cache_hint = %arg7 {redKind = #nvvm.tma_redux_kind<max>} : !llvm.ptr, <3>
    nvvm.cp.async.bulk.tensor.reduce %arg1, %arg0, box[%arg2, %arg3, %arg4, %arg5, %arg6] l2_cache_hint = %arg7 {redKind = #nvvm.tma_redux_kind<inc>} : !llvm.ptr, <3>
    nvvm.cp.async.bulk.tensor.reduce %arg1, %arg0, box[%arg2, %arg3, %arg4, %arg5, %arg6] l2_cache_hint = %arg7 {redKind = #nvvm.tma_redux_kind<dec>} : !llvm.ptr, <3>
    nvvm.cp.async.bulk.tensor.reduce %arg1, %arg0, box[%arg2, %arg3, %arg4, %arg5, %arg6] l2_cache_hint = %arg7 {redKind = #nvvm.tma_redux_kind<and>} : !llvm.ptr, <3>
    nvvm.cp.async.bulk.tensor.reduce %arg1, %arg0, box[%arg2, %arg3, %arg4, %arg5, %arg6] l2_cache_hint = %arg7 {redKind = #nvvm.tma_redux_kind<or>} : !llvm.ptr, <3>
    nvvm.cp.async.bulk.tensor.reduce %arg1, %arg0, box[%arg2, %arg3, %arg4, %arg5, %arg6] l2_cache_hint = %arg7 {redKind = #nvvm.tma_redux_kind<xor>} : !llvm.ptr, <3>
    nvvm.cp.async.bulk.tensor.reduce %arg1, %arg0, box[%arg2, %arg3, %arg4, %arg5, %arg6] {redKind = #nvvm.tma_redux_kind<add>} : !llvm.ptr, <3>
    nvvm.cp.async.bulk.tensor.reduce %arg1, %arg0, box[%arg2, %arg3, %arg4, %arg5, %arg6] {redKind = #nvvm.tma_redux_kind<min>} : !llvm.ptr, <3>
    nvvm.cp.async.bulk.tensor.reduce %arg1, %arg0, box[%arg2, %arg3, %arg4, %arg5, %arg6] {redKind = #nvvm.tma_redux_kind<max>} : !llvm.ptr, <3>
    nvvm.cp.async.bulk.tensor.reduce %arg1, %arg0, box[%arg2, %arg3, %arg4, %arg5, %arg6] {redKind = #nvvm.tma_redux_kind<inc>} : !llvm.ptr, <3>
    nvvm.cp.async.bulk.tensor.reduce %arg1, %arg0, box[%arg2, %arg3, %arg4, %arg5, %arg6] {redKind = #nvvm.tma_redux_kind<dec>} : !llvm.ptr, <3>
    nvvm.cp.async.bulk.tensor.reduce %arg1, %arg0, box[%arg2, %arg3, %arg4, %arg5, %arg6] {redKind = #nvvm.tma_redux_kind<and>} : !llvm.ptr, <3>
    nvvm.cp.async.bulk.tensor.reduce %arg1, %arg0, box[%arg2, %arg3, %arg4, %arg5, %arg6] {redKind = #nvvm.tma_redux_kind<or>} : !llvm.ptr, <3>
    nvvm.cp.async.bulk.tensor.reduce %arg1, %arg0, box[%arg2, %arg3, %arg4, %arg5, %arg6] {redKind = #nvvm.tma_redux_kind<xor>} : !llvm.ptr, <3>
    llvm.return
  }
  llvm.func @tma_store_reduce_5d_im2col(%arg0: !llvm.ptr<3>, %arg1: !llvm.ptr, %arg2: i32, %arg3: i32, %arg4: i32, %arg5: i32, %arg6: i32, %arg7: i64) {
    nvvm.cp.async.bulk.tensor.reduce %arg1, %arg0, box[%arg2, %arg3, %arg4, %arg5, %arg6] l2_cache_hint = %arg7 {mode = #nvvm.tma_store_mode<im2col>, redKind = #nvvm.tma_redux_kind<add>} : !llvm.ptr, <3>
    nvvm.cp.async.bulk.tensor.reduce %arg1, %arg0, box[%arg2, %arg3, %arg4, %arg5, %arg6] l2_cache_hint = %arg7 {mode = #nvvm.tma_store_mode<im2col>, redKind = #nvvm.tma_redux_kind<min>} : !llvm.ptr, <3>
    nvvm.cp.async.bulk.tensor.reduce %arg1, %arg0, box[%arg2, %arg3, %arg4, %arg5, %arg6] l2_cache_hint = %arg7 {mode = #nvvm.tma_store_mode<im2col>, redKind = #nvvm.tma_redux_kind<max>} : !llvm.ptr, <3>
    nvvm.cp.async.bulk.tensor.reduce %arg1, %arg0, box[%arg2, %arg3, %arg4, %arg5, %arg6] l2_cache_hint = %arg7 {mode = #nvvm.tma_store_mode<im2col>, redKind = #nvvm.tma_redux_kind<inc>} : !llvm.ptr, <3>
    nvvm.cp.async.bulk.tensor.reduce %arg1, %arg0, box[%arg2, %arg3, %arg4, %arg5, %arg6] l2_cache_hint = %arg7 {mode = #nvvm.tma_store_mode<im2col>, redKind = #nvvm.tma_redux_kind<dec>} : !llvm.ptr, <3>
    nvvm.cp.async.bulk.tensor.reduce %arg1, %arg0, box[%arg2, %arg3, %arg4, %arg5, %arg6] l2_cache_hint = %arg7 {mode = #nvvm.tma_store_mode<im2col>, redKind = #nvvm.tma_redux_kind<and>} : !llvm.ptr, <3>
    nvvm.cp.async.bulk.tensor.reduce %arg1, %arg0, box[%arg2, %arg3, %arg4, %arg5, %arg6] l2_cache_hint = %arg7 {mode = #nvvm.tma_store_mode<im2col>, redKind = #nvvm.tma_redux_kind<or>} : !llvm.ptr, <3>
    nvvm.cp.async.bulk.tensor.reduce %arg1, %arg0, box[%arg2, %arg3, %arg4, %arg5, %arg6] l2_cache_hint = %arg7 {mode = #nvvm.tma_store_mode<im2col>, redKind = #nvvm.tma_redux_kind<xor>} : !llvm.ptr, <3>
    nvvm.cp.async.bulk.tensor.reduce %arg1, %arg0, box[%arg2, %arg3, %arg4, %arg5, %arg6] {mode = #nvvm.tma_store_mode<im2col>, redKind = #nvvm.tma_redux_kind<add>} : !llvm.ptr, <3>
    nvvm.cp.async.bulk.tensor.reduce %arg1, %arg0, box[%arg2, %arg3, %arg4, %arg5, %arg6] {mode = #nvvm.tma_store_mode<im2col>, redKind = #nvvm.tma_redux_kind<min>} : !llvm.ptr, <3>
    nvvm.cp.async.bulk.tensor.reduce %arg1, %arg0, box[%arg2, %arg3, %arg4, %arg5, %arg6] {mode = #nvvm.tma_store_mode<im2col>, redKind = #nvvm.tma_redux_kind<max>} : !llvm.ptr, <3>
    nvvm.cp.async.bulk.tensor.reduce %arg1, %arg0, box[%arg2, %arg3, %arg4, %arg5, %arg6] {mode = #nvvm.tma_store_mode<im2col>, redKind = #nvvm.tma_redux_kind<inc>} : !llvm.ptr, <3>
    nvvm.cp.async.bulk.tensor.reduce %arg1, %arg0, box[%arg2, %arg3, %arg4, %arg5, %arg6] {mode = #nvvm.tma_store_mode<im2col>, redKind = #nvvm.tma_redux_kind<dec>} : !llvm.ptr, <3>
    nvvm.cp.async.bulk.tensor.reduce %arg1, %arg0, box[%arg2, %arg3, %arg4, %arg5, %arg6] {mode = #nvvm.tma_store_mode<im2col>, redKind = #nvvm.tma_redux_kind<and>} : !llvm.ptr, <3>
    nvvm.cp.async.bulk.tensor.reduce %arg1, %arg0, box[%arg2, %arg3, %arg4, %arg5, %arg6] {mode = #nvvm.tma_store_mode<im2col>, redKind = #nvvm.tma_redux_kind<or>} : !llvm.ptr, <3>
    nvvm.cp.async.bulk.tensor.reduce %arg1, %arg0, box[%arg2, %arg3, %arg4, %arg5, %arg6] {mode = #nvvm.tma_store_mode<im2col>, redKind = #nvvm.tma_redux_kind<xor>} : !llvm.ptr, <3>
    llvm.return
  }
}

