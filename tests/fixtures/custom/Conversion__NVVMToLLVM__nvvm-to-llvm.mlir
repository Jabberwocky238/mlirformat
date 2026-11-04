module {
  llvm.func @init_mbarrier(%arg0: !llvm.ptr, %arg1: !llvm.ptr<3>, %arg2: i32, %arg3: i1) {
    nvvm.mbarrier.init %arg1, %arg2, predicate = %arg3 : !llvm.ptr<3>, i32, i1
    nvvm.mbarrier.init %arg0, %arg2, predicate = %arg3 : !llvm.ptr, i32, i1
    llvm.return
  }
  llvm.func @init_mbarrier_arrive_expect_tx(%arg0: !llvm.ptr<3>, %arg1: i32, %arg2: i1) {
    nvvm.mbarrier.arrive.expect_tx %arg0, %arg1, predicate = %arg2 : !llvm.ptr<3>, i32, i1
    llvm.return
  }
  llvm.func @init_mbarrier_arrive_expect_tx_generic(%arg0: !llvm.ptr, %arg1: i32, %arg2: i1) {
    nvvm.mbarrier.arrive.expect_tx %arg0, %arg1, predicate = %arg2 : !llvm.ptr, i32, i1
    llvm.return
  }
  llvm.func @init_mbarrier_try_wait_shared(%arg0: !llvm.ptr<3>, %arg1: i32, %arg2: i32) {
    nvvm.mbarrier.try_wait.parity %arg0, %arg2, %arg1 : !llvm.ptr<3>, i32, i32
    llvm.return
  }
  llvm.func @init_mbarrier_try_wait(%arg0: !llvm.ptr, %arg1: i32, %arg2: i32) {
    nvvm.mbarrier.try_wait.parity %arg0, %arg2, %arg1 : !llvm.ptr, i32, i32
    llvm.return
  }
  func.func @async_cp(%arg0: !llvm.ptr<3>, %arg1: !llvm.ptr<1>) {
    nvvm.cp.async.shared.global %arg0, %arg1, 16, cache =  ca : !llvm.ptr<3>, !llvm.ptr<1>
    nvvm.cp.async.shared.global %arg0, %arg1, 16, cache =  cg : !llvm.ptr<3>, !llvm.ptr<1>
    return
  }
  func.func @async_cp_zfill(%arg0: !llvm.ptr<3>, %arg1: !llvm.ptr<1>, %arg2: i32) {
    nvvm.cp.async.shared.global %arg0, %arg1, 16, cache =  cg, %arg2 : !llvm.ptr<3>, !llvm.ptr<1>, i32
    nvvm.cp.async.shared.global %arg0, %arg1, 4, cache =  ca, %arg2 : !llvm.ptr<3>, !llvm.ptr<1>, i32
    return
  }
  func.func @cp_async_mbarrier_arrive(%arg0: !llvm.ptr<3>, %arg1: !llvm.ptr) {
    nvvm.cp.async.mbarrier.arrive %arg1 : !llvm.ptr
    nvvm.cp.async.mbarrier.arrive %arg1 {noinc = true} : !llvm.ptr
    nvvm.cp.async.mbarrier.arrive %arg0 : !llvm.ptr<3>
    nvvm.cp.async.mbarrier.arrive %arg0 {noinc = true} : !llvm.ptr<3>
    llvm.return
  }
  func.func @tma_load_3d_all(%arg0: !llvm.ptr, %arg1: !llvm.ptr<7>, %arg2: !llvm.ptr<3>, %arg3: i32, %arg4: i32, %arg5: i32, %arg6: i32, %arg7: i16, %arg8: i16, %arg9: i16, %arg10: i64, %arg11: i1) {
    nvvm.cp.async.bulk.tensor.shared.cluster.global %arg1, %arg0, %arg2, box[%arg3, %arg4, %arg5] im2col[%arg7] multicast_mask = %arg9 l2_cache_hint = %arg10 predicate = %arg11 {mode = #nvvm.tma_load_mode<im2col>} : !llvm.ptr<7>, !llvm.ptr
    return
  }
  func.func @tma_load_4d_all(%arg0: !llvm.ptr, %arg1: !llvm.ptr<7>, %arg2: !llvm.ptr<3>, %arg3: i32, %arg4: i32, %arg5: i32, %arg6: i32, %arg7: i16, %arg8: i16, %arg9: i16, %arg10: i64, %arg11: i1) {
    nvvm.cp.async.bulk.tensor.shared.cluster.global %arg1, %arg0, %arg2, box[%arg3, %arg4, %arg5, %arg6] im2col[%arg7, %arg8] multicast_mask = %arg9 l2_cache_hint = %arg10 predicate = %arg11 {mode = #nvvm.tma_load_mode<im2col>} : !llvm.ptr<7>, !llvm.ptr
    return
  }
  func.func @tma_load_5d_all(%arg0: !llvm.ptr, %arg1: !llvm.ptr<7>, %arg2: !llvm.ptr<3>, %arg3: i32, %arg4: i32, %arg5: i32, %arg6: i32, %arg7: i32, %arg8: i16, %arg9: i16, %arg10: i16, %arg11: i16, %arg12: i64, %arg13: i1) {
    nvvm.cp.async.bulk.tensor.shared.cluster.global %arg1, %arg0, %arg2, box[%arg3, %arg4, %arg5, %arg6, %arg7] im2col[%arg8, %arg9, %arg10] multicast_mask = %arg11 l2_cache_hint = %arg12 predicate = %arg13 {mode = #nvvm.tma_load_mode<im2col>} : !llvm.ptr<7>, !llvm.ptr
    return
  }
  func.func @tma_load_1d(%arg0: !llvm.ptr, %arg1: !llvm.ptr<7>, %arg2: !llvm.ptr<3>, %arg3: i32, %arg4: i1) {
    nvvm.cp.async.bulk.tensor.shared.cluster.global %arg1, %arg0, %arg2, box[%arg3] predicate = %arg4 : !llvm.ptr<7>, !llvm.ptr
    return
  }
  func.func @tma_load_2d(%arg0: !llvm.ptr, %arg1: !llvm.ptr<7>, %arg2: !llvm.ptr<3>, %arg3: i32, %arg4: i32, %arg5: i1) {
    nvvm.cp.async.bulk.tensor.shared.cluster.global %arg1, %arg0, %arg2, box[%arg3, %arg4] predicate = %arg5 : !llvm.ptr<7>, !llvm.ptr
    return
  }
  func.func @tma_load_3d(%arg0: !llvm.ptr, %arg1: !llvm.ptr<7>, %arg2: !llvm.ptr<3>, %arg3: i32, %arg4: i32, %arg5: i32, %arg6: i1) {
    nvvm.cp.async.bulk.tensor.shared.cluster.global %arg1, %arg0, %arg2, box[%arg3, %arg4, %arg5] predicate = %arg6 : !llvm.ptr<7>, !llvm.ptr
    return
  }
  func.func @tma_load_4d(%arg0: !llvm.ptr, %arg1: !llvm.ptr<7>, %arg2: !llvm.ptr<3>, %arg3: i32, %arg4: i32, %arg5: i32, %arg6: i32, %arg7: i1) {
    nvvm.cp.async.bulk.tensor.shared.cluster.global %arg1, %arg0, %arg2, box[%arg3, %arg4, %arg5, %arg6] predicate = %arg7 : !llvm.ptr<7>, !llvm.ptr
    return
  }
  func.func @tma_load_5d(%arg0: !llvm.ptr, %arg1: !llvm.ptr<7>, %arg2: !llvm.ptr<3>, %arg3: i32, %arg4: i32, %arg5: i32, %arg6: i32, %arg7: i32, %arg8: i1) {
    nvvm.cp.async.bulk.tensor.shared.cluster.global %arg1, %arg0, %arg2, box[%arg3, %arg4, %arg5, %arg6, %arg7] predicate = %arg8 : !llvm.ptr<7>, !llvm.ptr
    return
  }
  func.func @tma_load_multicast1d(%arg0: !llvm.ptr, %arg1: !llvm.ptr<7>, %arg2: !llvm.ptr<3>, %arg3: i16, %arg4: i32, %arg5: i1) {
    nvvm.cp.async.bulk.tensor.shared.cluster.global %arg1, %arg0, %arg2, box[%arg4] multicast_mask = %arg3 predicate = %arg5 : !llvm.ptr<7>, !llvm.ptr
    return
  }
  func.func @tma_load_multicast2d(%arg0: !llvm.ptr, %arg1: !llvm.ptr<7>, %arg2: !llvm.ptr<3>, %arg3: i16, %arg4: i32, %arg5: i32, %arg6: i1) {
    nvvm.cp.async.bulk.tensor.shared.cluster.global %arg1, %arg0, %arg2, box[%arg4, %arg5] multicast_mask = %arg3 predicate = %arg6 : !llvm.ptr<7>, !llvm.ptr
    return
  }
  func.func @tma_load_multicast3d(%arg0: !llvm.ptr, %arg1: !llvm.ptr<7>, %arg2: !llvm.ptr<3>, %arg3: i16, %arg4: i32, %arg5: i32, %arg6: i32, %arg7: i1) {
    nvvm.cp.async.bulk.tensor.shared.cluster.global %arg1, %arg0, %arg2, box[%arg4, %arg5, %arg6] multicast_mask = %arg3 predicate = %arg7 : !llvm.ptr<7>, !llvm.ptr
    return
  }
  func.func @tma_load_multicast4d(%arg0: !llvm.ptr, %arg1: !llvm.ptr<7>, %arg2: !llvm.ptr<3>, %arg3: i16, %arg4: i32, %arg5: i32, %arg6: i32, %arg7: i32, %arg8: i1) {
    nvvm.cp.async.bulk.tensor.shared.cluster.global %arg1, %arg0, %arg2, box[%arg4, %arg5, %arg6, %arg7] multicast_mask = %arg3 predicate = %arg8 : !llvm.ptr<7>, !llvm.ptr
    return
  }
  func.func @tma_load_multicast5d(%arg0: !llvm.ptr, %arg1: !llvm.ptr<7>, %arg2: !llvm.ptr<3>, %arg3: i16, %arg4: i32, %arg5: i32, %arg6: i32, %arg7: i32, %arg8: i32, %arg9: i1) {
    nvvm.cp.async.bulk.tensor.shared.cluster.global %arg1, %arg0, %arg2, box[%arg4, %arg5, %arg6, %arg7, %arg8] multicast_mask = %arg3 predicate = %arg9 : !llvm.ptr<7>, !llvm.ptr
    return
  }
  func.func @tma_store_1d(%arg0: !llvm.ptr, %arg1: !llvm.ptr<3>, %arg2: i32, %arg3: i1) {
    nvvm.cp.async.bulk.tensor.global.shared.cta %arg0, %arg1, box[%arg2], predicate = %arg3 : !llvm.ptr, <3>
    return
  }
  func.func @tma_store_2d(%arg0: !llvm.ptr, %arg1: !llvm.ptr<3>, %arg2: i32, %arg3: i32, %arg4: i1) {
    nvvm.cp.async.bulk.tensor.global.shared.cta %arg0, %arg1, box[%arg2, %arg3], predicate = %arg4 : !llvm.ptr, <3>
    return
  }
  func.func @tma_store_3d(%arg0: !llvm.ptr, %arg1: !llvm.ptr<3>, %arg2: i32, %arg3: i32, %arg4: i32, %arg5: i1) {
    nvvm.cp.async.bulk.tensor.global.shared.cta %arg0, %arg1, box[%arg2, %arg3, %arg4], predicate = %arg5 : !llvm.ptr, <3>
    return
  }
  func.func @tma_store_4d(%arg0: !llvm.ptr, %arg1: !llvm.ptr<3>, %arg2: i32, %arg3: i32, %arg4: i32, %arg5: i32, %arg6: i1) {
    nvvm.cp.async.bulk.tensor.global.shared.cta %arg0, %arg1, box[%arg2, %arg3, %arg4, %arg5], predicate = %arg6 : !llvm.ptr, <3>
    return
  }
  func.func @tma_store_5d(%arg0: !llvm.ptr, %arg1: !llvm.ptr<3>, %arg2: i32, %arg3: i32, %arg4: i32, %arg5: i32, %arg6: i32, %arg7: i1) {
    nvvm.cp.async.bulk.tensor.global.shared.cta %arg0, %arg1, box[%arg2, %arg3, %arg4, %arg5, %arg6], predicate = %arg7 : !llvm.ptr, <3>
    return
  }
  func.func @wgmma_execute() {
    nvvm.wgmma.fence.aligned
    nvvm.wgmma.commit.group.sync.aligned
    nvvm.wgmma.wait.group.sync.aligned 0
    nvvm.wgmma.fence.aligned
    nvvm.wgmma.commit.group.sync.aligned
    nvvm.wgmma.wait.group.sync.aligned 5
    return
  }
}

// -----
module {
  func.func @wgmma_f32_f16_f16(%arg0: i64, %arg1: i64) -> !llvm.struct<(f32, f32, f32, f32, f32, f32, f32, f32, f32, f32, f32, f32, f32, f32, f32, f32)> {
    %0 = llvm.mlir.undef : !llvm.struct<(f32, f32, f32, f32, f32, f32, f32, f32, f32, f32, f32, f32, f32, f32, f32, f32)>
    %1 = nvvm.wgmma.mma_async %arg0, %arg1, %0, <m = 64, n = 32, k = 16>, D[<f32>, <zero>], A[<f16>, <neg>, <col>], B[<f16>, <neg>, <col>] : !llvm.struct<(f32, f32, f32, f32, f32, f32, f32, f32, f32, f32, f32, f32, f32, f32, f32, f32)> -> !llvm.struct<(f32, f32, f32, f32, f32, f32, f32, f32, f32, f32, f32, f32, f32, f32, f32, f32)>
    %c2_i64 = arith.constant 2 : i64
    %2 = arith.addi %arg0, %c2_i64 : i64
    %3 = arith.addi %arg1, %c2_i64 : i64
    %4 = nvvm.wgmma.mma_async %2, %3, %1, <m = 64, n = 32, k = 16>, D[<f32>, <zero>], A[<f16>, <neg>, <col>], B[<f16>, <neg>, <col>] : !llvm.struct<(f32, f32, f32, f32, f32, f32, f32, f32, f32, f32, f32, f32, f32, f32, f32, f32)> -> !llvm.struct<(f32, f32, f32, f32, f32, f32, f32, f32, f32, f32, f32, f32, f32, f32, f32, f32)>
    return %4 : !llvm.struct<(f32, f32, f32, f32, f32, f32, f32, f32, f32, f32, f32, f32, f32, f32, f32, f32)>
  }
}

// -----
module {
  func.func @wgmma_s32_s8_s8_satfinite(%arg0: i64, %arg1: i64) -> !llvm.struct<(i32, i32, i32, i32)> {
    %0 = llvm.mlir.undef : !llvm.struct<(i32, i32, i32, i32)>
    %1 = nvvm.wgmma.mma_async %arg0, %arg1, %0, <m = 64, n = 8, k = 32>, D[<s32>, <one>, <satfinite>], A[<s8>, <one>, <row>], B[<s8>, <one>, <col>] : !llvm.struct<(i32, i32, i32, i32)> -> !llvm.struct<(i32, i32, i32, i32)>
    %2 = nvvm.wgmma.mma_async %arg0, %arg1, %1, <m = 64, n = 8, k = 32>, D[<s32>, <one>, <satfinite>], A[<s8>, <one>, <row>], B[<s8>, <one>, <col>] : !llvm.struct<(i32, i32, i32, i32)> -> !llvm.struct<(i32, i32, i32, i32)>
    %3 = nvvm.wgmma.mma_async %arg0, %arg1, %2, <m = 64, n = 8, k = 32>, D[<s32>, <one>, <satfinite>], A[<s8>, <one>, <row>], B[<s8>, <one>, <col>] : !llvm.struct<(i32, i32, i32, i32)> -> !llvm.struct<(i32, i32, i32, i32)>
    return %3 : !llvm.struct<(i32, i32, i32, i32)>
  }
  func.func @wgmma_s32_u8_u8(%arg0: i64, %arg1: i64) -> !llvm.struct<(i32, i32, i32, i32)> {
    %0 = llvm.mlir.undef : !llvm.struct<(i32, i32, i32, i32)>
    %1 = nvvm.wgmma.mma_async %arg0, %arg1, %0, <m = 64, n = 8, k = 32>, D[<s32>, <one>], A[<u8>, <one>, <row>], B[<u8>, <one>, <col>] : !llvm.struct<(i32, i32, i32, i32)> -> !llvm.struct<(i32, i32, i32, i32)>
    %2 = nvvm.wgmma.mma_async %arg0, %arg1, %1, <m = 64, n = 8, k = 32>, D[<s32>, <one>], A[<u8>, <one>, <row>], B[<u8>, <one>, <col>] : !llvm.struct<(i32, i32, i32, i32)> -> !llvm.struct<(i32, i32, i32, i32)>
    %3 = nvvm.wgmma.mma_async %arg0, %arg1, %2, <m = 64, n = 8, k = 32>, D[<s32>, <one>], A[<u8>, <one>, <row>], B[<u8>, <one>, <col>] : !llvm.struct<(i32, i32, i32, i32)> -> !llvm.struct<(i32, i32, i32, i32)>
    return %3 : !llvm.struct<(i32, i32, i32, i32)>
  }
}

// -----
module {
  func.func @wgmma_f32_tf32_tf32(%arg0: i64, %arg1: i64) -> !llvm.struct<(f32, f32, f32, f32, f32, f32, f32, f32, f32, f32, f32, f32, f32, f32, f32, f32, f32, f32, f32, f32, f32, f32, f32, f32, f32, f32, f32, f32, f32, f32, f32, f32)> {
    %0 = llvm.mlir.undef : !llvm.struct<(f32, f32, f32, f32, f32, f32, f32, f32, f32, f32, f32, f32, f32, f32, f32, f32, f32, f32, f32, f32, f32, f32, f32, f32, f32, f32, f32, f32, f32, f32, f32, f32)>
    %1 = nvvm.wgmma.mma_async %arg0, %arg1, %0, <m = 64, n = 64, k = 8>, D[<f32>, <one>], A[<tf32>, <one>, <row>], B[<tf32>, <one>, <col>] : !llvm.struct<(f32, f32, f32, f32, f32, f32, f32, f32, f32, f32, f32, f32, f32, f32, f32, f32, f32, f32, f32, f32, f32, f32, f32, f32, f32, f32, f32, f32, f32, f32, f32, f32)> -> !llvm.struct<(f32, f32, f32, f32, f32, f32, f32, f32, f32, f32, f32, f32, f32, f32, f32, f32, f32, f32, f32, f32, f32, f32, f32, f32, f32, f32, f32, f32, f32, f32, f32, f32)>
    %2 = nvvm.wgmma.mma_async %arg0, %arg1, %1, <m = 64, n = 64, k = 8>, D[<f32>, <one>], A[<tf32>, <one>, <row>], B[<tf32>, <one>, <col>] : !llvm.struct<(f32, f32, f32, f32, f32, f32, f32, f32, f32, f32, f32, f32, f32, f32, f32, f32, f32, f32, f32, f32, f32, f32, f32, f32, f32, f32, f32, f32, f32, f32, f32, f32)> -> !llvm.struct<(f32, f32, f32, f32, f32, f32, f32, f32, f32, f32, f32, f32, f32, f32, f32, f32, f32, f32, f32, f32, f32, f32, f32, f32, f32, f32, f32, f32, f32, f32, f32, f32)>
    return %2 : !llvm.struct<(f32, f32, f32, f32, f32, f32, f32, f32, f32, f32, f32, f32, f32, f32, f32, f32, f32, f32, f32, f32, f32, f32, f32, f32, f32, f32, f32, f32, f32, f32, f32, f32)>
  }
}

// -----
module {
  func.func @wgmma_f32_e4m3_e4m3(%arg0: i64, %arg1: i64) -> !llvm.struct<(f32, f32, f32, f32, f32, f32, f32, f32, f32, f32, f32, f32, f32, f32, f32, f32, f32, f32, f32, f32, f32, f32, f32, f32, f32, f32, f32, f32, f32, f32, f32, f32)> {
    %0 = llvm.mlir.undef : !llvm.struct<(f32, f32, f32, f32, f32, f32, f32, f32, f32, f32, f32, f32, f32, f32, f32, f32, f32, f32, f32, f32, f32, f32, f32, f32, f32, f32, f32, f32, f32, f32, f32, f32)>
    %1 = nvvm.wgmma.mma_async %arg0, %arg1, %0, <m = 64, n = 64, k = 32>, D[<f32>, <one>], A[<e4m3>, <one>, <row>], B[<e4m3>, <one>, <col>] : !llvm.struct<(f32, f32, f32, f32, f32, f32, f32, f32, f32, f32, f32, f32, f32, f32, f32, f32, f32, f32, f32, f32, f32, f32, f32, f32, f32, f32, f32, f32, f32, f32, f32, f32)> -> !llvm.struct<(f32, f32, f32, f32, f32, f32, f32, f32, f32, f32, f32, f32, f32, f32, f32, f32, f32, f32, f32, f32, f32, f32, f32, f32, f32, f32, f32, f32, f32, f32, f32, f32)>
    %2 = nvvm.wgmma.mma_async %arg0, %arg1, %1, <m = 64, n = 64, k = 32>, D[<f32>, <one>], A[<e4m3>, <one>, <row>], B[<e4m3>, <one>, <col>] : !llvm.struct<(f32, f32, f32, f32, f32, f32, f32, f32, f32, f32, f32, f32, f32, f32, f32, f32, f32, f32, f32, f32, f32, f32, f32, f32, f32, f32, f32, f32, f32, f32, f32, f32)> -> !llvm.struct<(f32, f32, f32, f32, f32, f32, f32, f32, f32, f32, f32, f32, f32, f32, f32, f32, f32, f32, f32, f32, f32, f32, f32, f32, f32, f32, f32, f32, f32, f32, f32, f32)>
    return %2 : !llvm.struct<(f32, f32, f32, f32, f32, f32, f32, f32, f32, f32, f32, f32, f32, f32, f32, f32, f32, f32, f32, f32, f32, f32, f32, f32, f32, f32, f32, f32, f32, f32, f32, f32)>
  }
}

// -----
module {
  func.func @wgmma_f32_e5m2_e4m3(%arg0: i64, %arg1: i64) -> !llvm.struct<(f32, f32, f32, f32, f32, f32, f32, f32, f32, f32, f32, f32, f32, f32, f32, f32, f32, f32, f32, f32, f32, f32, f32, f32, f32, f32, f32, f32, f32, f32, f32, f32)> {
    %0 = llvm.mlir.undef : !llvm.struct<(f32, f32, f32, f32, f32, f32, f32, f32, f32, f32, f32, f32, f32, f32, f32, f32, f32, f32, f32, f32, f32, f32, f32, f32, f32, f32, f32, f32, f32, f32, f32, f32)>
    %1 = nvvm.wgmma.mma_async %arg0, %arg1, %0, <m = 64, n = 64, k = 32>, D[<f32>, <one>], A[<e5m2>, <one>, <row>], B[<e4m3>, <one>, <col>] : !llvm.struct<(f32, f32, f32, f32, f32, f32, f32, f32, f32, f32, f32, f32, f32, f32, f32, f32, f32, f32, f32, f32, f32, f32, f32, f32, f32, f32, f32, f32, f32, f32, f32, f32)> -> !llvm.struct<(f32, f32, f32, f32, f32, f32, f32, f32, f32, f32, f32, f32, f32, f32, f32, f32, f32, f32, f32, f32, f32, f32, f32, f32, f32, f32, f32, f32, f32, f32, f32, f32)>
    %2 = nvvm.wgmma.mma_async %arg0, %arg1, %1, <m = 64, n = 64, k = 32>, D[<f32>, <one>], A[<e5m2>, <one>, <row>], B[<e4m3>, <one>, <col>] : !llvm.struct<(f32, f32, f32, f32, f32, f32, f32, f32, f32, f32, f32, f32, f32, f32, f32, f32, f32, f32, f32, f32, f32, f32, f32, f32, f32, f32, f32, f32, f32, f32, f32, f32)> -> !llvm.struct<(f32, f32, f32, f32, f32, f32, f32, f32, f32, f32, f32, f32, f32, f32, f32, f32, f32, f32, f32, f32, f32, f32, f32, f32, f32, f32, f32, f32, f32, f32, f32, f32)>
    return %2 : !llvm.struct<(f32, f32, f32, f32, f32, f32, f32, f32, f32, f32, f32, f32, f32, f32, f32, f32, f32, f32, f32, f32, f32, f32, f32, f32, f32, f32, f32, f32, f32, f32, f32, f32)>
  }
}

// -----
module {
  func.func @elect_one_leader_sync() {
    %0 = nvvm.elect.sync -> i1
    return
  }
}

// -----
module {
  llvm.func @test_nvvm_prefetch(%arg0: !llvm.ptr, %arg1: i1) {
    nvvm.prefetch tensormap, %arg0 : !llvm.ptr
    nvvm.prefetch tensormap, %arg0, predicate = %arg1 : !llvm.ptr, i1
    llvm.return
  }
}

// -----
module {
  func.func @set_max_register() {
    nvvm.setmaxregister  increase 232
    nvvm.setmaxregister  decrease 40
    return
  }
}

// -----
module {
  func.func @cp_async_bulk_commit() {
    nvvm.cp.async.bulk.commit.group
    return
  }
}

// -----
module {
  func.func @cp_async_bulk_wait_group() {
    nvvm.cp.async.bulk.wait_group 1
    nvvm.cp.async.bulk.wait_group 0
    nvvm.cp.async.bulk.wait_group 5 {read}
    nvvm.cp.async.bulk.wait_group 0 {read}
    return
  }
}

// -----
module {
  llvm.func @llvm_nvvm_barrier_arrive(%arg0: i32, %arg1: i32) {
    nvvm.barrier.arrive number_of_threads = %arg1
    nvvm.barrier.arrive id = %arg0 number_of_threads = %arg1
    llvm.return
  }
}

// -----
module {
  llvm.func @init_mbarrier(%arg0: !llvm.ptr, %arg1: !llvm.ptr<3>, %arg2: i32, %arg3: i1) {
    nvvm.inline_ptx "mbarrier.init.b64 [{$r0}], {$r1};" ro(%arg0, %arg2 : !llvm.ptr, i32)
    nvvm.inline_ptx "mbarrier.init.b64 [{$r0}], {$r1};" ro(%arg0, %arg2 : !llvm.ptr, i32), predicate = %arg3
    llvm.return
  }
}

// -----
module {
  llvm.func @ex2(%arg0: f32, %arg1: i1) {
    %0 = nvvm.inline_ptx "ex2.approx.ftz.f32 {$w0}, {$r0};" ro(%arg0 : f32) -> f32
    %1 = nvvm.inline_ptx "ex2.approx.ftz.f32 {$w0}, {$r0};" ro(%arg0 : f32), predicate = %arg1 -> f32
    llvm.return
  }
  llvm.func @multi_return(%arg0: i32, %arg1: i32) -> i32 {
    %0:2 = nvvm.inline_ptx "{.reg .pred p; setp.ge.s32 p, {$r0}, {$r1}; selp.s32 {$w0}, {$r0},{$r1}, p; selp.s32 {$w1}, {$r0},{$r1}, p;}" ro(%arg0, %arg1 : i32, i32) -> i32, i32
    %1 = llvm.add %0#0, %0#1 : i32
    llvm.return %1 : i32
  }
  llvm.func @inline_ptx_multi_rw(%arg0: i32, %arg1: i32, %arg2: f32, %arg3: f32) -> f32 {
    nvvm.inline_ptx "{.reg .pred p; setp.ge.s32 p, {$r0}, {$r1}; selp.s32 {$rw0}, {$r0},{$r1}, p; selp.s32 {$rw1}, {$r0},{$r1}, p;}" ro(%arg0, %arg1 : i32, i32) rw(%arg2, %arg3 : f32, f32)
    %0 = llvm.fadd %arg2, %arg3 : f32
    llvm.return %0 : f32
  }
  llvm.func @inline_ptx_multi_rw_r(%arg0: i32, %arg1: i32, %arg2: f32, %arg3: f32) -> f32 {
    %0:2 = nvvm.inline_ptx "{.reg .pred p; setp.ge.s32 p, {$r0}, {$r1}; selp.s32 {$rw0}, {$r0},{$r1}, p; selp.s32 {$rw1}, {$r0},{$r1}, p; selp.s32 {$w0}, {$r0},{$r1}, p; selp.s32 {$w1}, {$r0},{$r1}, p;}" ro(%arg0, %arg1 : i32, i32) rw(%arg2, %arg3 : f32, f32) -> i32, i32
    %1 = llvm.add %0#0, %0#1 : i32
    %2 = llvm.sitofp %1 : i32 to f32
    %3 = llvm.fadd %arg2, %arg3 : f32
    %4 = llvm.fadd %2, %arg3 : f32
    llvm.return %4 : f32
  }
}

// -----
module {
  llvm.func @inline_ptx_pack_4i8(%arg0: vector<4xi8>, %arg1: i32, %arg2: i32) {
    %0 = nvvm.inline_ptx "dp4a.s32.s32 {$w0}, {$r0}, {$r1}, {$r2};" ro(%arg0, %arg1, %arg2 : vector<4xi8>, i32, i32) -> i32
    llvm.return
  }
  llvm.func @inline_ptx_pack_2bf16(%arg0: f32, %arg1: f32) {
    %0 = nvvm.inline_ptx "cvt.rn.satfinite.bf16x2.f32 {$w0}, {$r0}, {$r1};" ro(%arg0, %arg1 : f32, f32) -> vector<2xbf16>
    llvm.return
  }
  llvm.func @inline_ptx_cvt_rn_e4m3x2_f16x2(%arg0: i16) {
    %0 = nvvm.inline_ptx "cvt.rz.satfinite.ue8m0x2.bf16x2 {$w0}, {$r0}" ro(%arg0 : i16) -> vector<2xbf16>
    llvm.return
  }
  llvm.func @cvt_i8_bf16(%arg0: i8) {
    %0 = llvm.zext %arg0 : i8 to i16
    %1 = nvvm.inline_ptx "{\0A\09.reg .b16 r;\0A\09.reg .b8 s;\0A\09mov.b16 {s,_}, {$w0};\0A\09cvt.rn.bf16.s8 r, s;\0A\09mov.b16 {$r0}, r;\0A\09" ro(%0 : i16) -> i16
    llvm.return
  }
}

