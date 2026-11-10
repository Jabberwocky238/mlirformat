module {
  func.func @nvvm_mxf8f6f4_sp_blockscale_mma_e2m1_e2m1(%arg0: i32, %arg1: i32, %arg2: i32, %arg3: i32, %arg4: i32, %arg5: i32, %arg6: i32, %arg7: i32, %arg8: f32, %arg9: f32, %arg10: f32, %arg11: f32, %arg12: i32, %arg13: i32, %arg14: i16, %arg15: i16, %arg16: i32, %arg17: i16, %arg18: i16) -> !llvm.struct<(f32, f32, f32, f32)> {
    %0 = llvm.mlir.constant(0 : i32) : i32
    %1 = nvvm.mma.sp.block_scale A[%arg0, %arg1, %arg2, %arg3] B[%arg4, %arg5, %arg6, %arg7] C[%arg8, %arg9, %arg10, %arg11] sparseMetadata[%arg12] selector[%0] scaleA[%arg13, %arg14, %arg15] scaleB[%arg16, %arg17, %arg18] {blockScaleFormat = #nvvm.block_scale_format<ue8m0>, kind = #nvvm.block_scale_kind<mxf8f6f4>, multiplicandAPtxType = #nvvm.mma_type<e2m1>, multiplicandBPtxType = #nvvm.mma_type<e2m1>, orderedMetadata, scaleVecSize = #nvvm.scale_vec_size<x1>, shape = #nvvm.shape<m = 16, n = 8, k = 64>} : (i32, i32, f32) -> !llvm.struct<(f32, f32, f32, f32)>
    return %1 : !llvm.struct<(f32, f32, f32, f32)>
  }
  func.func @nvvm_mxf8f6f4_sp_blockscale_mma_e2m1_e2m3(%arg0: i32, %arg1: i32, %arg2: i32, %arg3: i32, %arg4: i32, %arg5: i32, %arg6: i32, %arg7: i32, %arg8: f32, %arg9: f32, %arg10: f32, %arg11: f32, %arg12: i32, %arg13: i32, %arg14: i16, %arg15: i16, %arg16: i32, %arg17: i16, %arg18: i16) -> !llvm.struct<(f32, f32, f32, f32)> {
    %0 = llvm.mlir.constant(0 : i32) : i32
    %1 = nvvm.mma.sp.block_scale A[%arg0, %arg1, %arg2, %arg3] B[%arg4, %arg5, %arg6, %arg7] C[%arg8, %arg9, %arg10, %arg11] sparseMetadata[%arg12] selector[%0] scaleA[%arg13, %arg14, %arg15] scaleB[%arg16, %arg17, %arg18] {blockScaleFormat = #nvvm.block_scale_format<ue8m0>, kind = #nvvm.block_scale_kind<mxf8f6f4>, multiplicandAPtxType = #nvvm.mma_type<e2m1>, multiplicandBPtxType = #nvvm.mma_type<e2m3>, orderedMetadata, scaleVecSize = #nvvm.scale_vec_size<x1>, shape = #nvvm.shape<m = 16, n = 8, k = 64>} : (i32, i32, f32) -> !llvm.struct<(f32, f32, f32, f32)>
    return %1 : !llvm.struct<(f32, f32, f32, f32)>
  }
  func.func @nvvm_mxf8f6f4_sp_blockscale_mma_e2m1_e3m2(%arg0: i32, %arg1: i32, %arg2: i32, %arg3: i32, %arg4: i32, %arg5: i32, %arg6: i32, %arg7: i32, %arg8: f32, %arg9: f32, %arg10: f32, %arg11: f32, %arg12: i32, %arg13: i32, %arg14: i16, %arg15: i16, %arg16: i32, %arg17: i16, %arg18: i16) -> !llvm.struct<(f32, f32, f32, f32)> {
    %0 = llvm.mlir.constant(0 : i32) : i32
    %1 = nvvm.mma.sp.block_scale A[%arg0, %arg1, %arg2, %arg3] B[%arg4, %arg5, %arg6, %arg7] C[%arg8, %arg9, %arg10, %arg11] sparseMetadata[%arg12] selector[%0] scaleA[%arg13, %arg14, %arg15] scaleB[%arg16, %arg17, %arg18] {blockScaleFormat = #nvvm.block_scale_format<ue8m0>, kind = #nvvm.block_scale_kind<mxf8f6f4>, multiplicandAPtxType = #nvvm.mma_type<e2m1>, multiplicandBPtxType = #nvvm.mma_type<e3m2>, orderedMetadata, scaleVecSize = #nvvm.scale_vec_size<x1>, shape = #nvvm.shape<m = 16, n = 8, k = 64>} : (i32, i32, f32) -> !llvm.struct<(f32, f32, f32, f32)>
    return %1 : !llvm.struct<(f32, f32, f32, f32)>
  }
  func.func @nvvm_mxf8f6f4_sp_blockscale_mma_e2m1_e4m3(%arg0: i32, %arg1: i32, %arg2: i32, %arg3: i32, %arg4: i32, %arg5: i32, %arg6: i32, %arg7: i32, %arg8: f32, %arg9: f32, %arg10: f32, %arg11: f32, %arg12: i32, %arg13: i32, %arg14: i16, %arg15: i16, %arg16: i32, %arg17: i16, %arg18: i16) -> !llvm.struct<(f32, f32, f32, f32)> {
    %0 = llvm.mlir.constant(0 : i32) : i32
    %1 = nvvm.mma.sp.block_scale A[%arg0, %arg1, %arg2, %arg3] B[%arg4, %arg5, %arg6, %arg7] C[%arg8, %arg9, %arg10, %arg11] sparseMetadata[%arg12] selector[%0] scaleA[%arg13, %arg14, %arg15] scaleB[%arg16, %arg17, %arg18] {blockScaleFormat = #nvvm.block_scale_format<ue8m0>, kind = #nvvm.block_scale_kind<mxf8f6f4>, multiplicandAPtxType = #nvvm.mma_type<e2m1>, multiplicandBPtxType = #nvvm.mma_type<e4m3>, orderedMetadata, scaleVecSize = #nvvm.scale_vec_size<x1>, shape = #nvvm.shape<m = 16, n = 8, k = 64>} : (i32, i32, f32) -> !llvm.struct<(f32, f32, f32, f32)>
    return %1 : !llvm.struct<(f32, f32, f32, f32)>
  }
  func.func @nvvm_mxf8f6f4_sp_blockscale_mma_e2m1_e5m2(%arg0: i32, %arg1: i32, %arg2: i32, %arg3: i32, %arg4: i32, %arg5: i32, %arg6: i32, %arg7: i32, %arg8: f32, %arg9: f32, %arg10: f32, %arg11: f32, %arg12: i32, %arg13: i32, %arg14: i16, %arg15: i16, %arg16: i32, %arg17: i16, %arg18: i16) -> !llvm.struct<(f32, f32, f32, f32)> {
    %0 = llvm.mlir.constant(0 : i32) : i32
    %1 = nvvm.mma.sp.block_scale A[%arg0, %arg1, %arg2, %arg3] B[%arg4, %arg5, %arg6, %arg7] C[%arg8, %arg9, %arg10, %arg11] sparseMetadata[%arg12] selector[%0] scaleA[%arg13, %arg14, %arg15] scaleB[%arg16, %arg17, %arg18] {blockScaleFormat = #nvvm.block_scale_format<ue8m0>, kind = #nvvm.block_scale_kind<mxf8f6f4>, multiplicandAPtxType = #nvvm.mma_type<e2m1>, multiplicandBPtxType = #nvvm.mma_type<e5m2>, orderedMetadata, scaleVecSize = #nvvm.scale_vec_size<x1>, shape = #nvvm.shape<m = 16, n = 8, k = 64>} : (i32, i32, f32) -> !llvm.struct<(f32, f32, f32, f32)>
    return %1 : !llvm.struct<(f32, f32, f32, f32)>
  }
  func.func @nvvm_mxf8f6f4_sp_blockscale_mma_e2m3_e2m1(%arg0: i32, %arg1: i32, %arg2: i32, %arg3: i32, %arg4: i32, %arg5: i32, %arg6: i32, %arg7: i32, %arg8: f32, %arg9: f32, %arg10: f32, %arg11: f32, %arg12: i32, %arg13: i32, %arg14: i16, %arg15: i16, %arg16: i32, %arg17: i16, %arg18: i16) -> !llvm.struct<(f32, f32, f32, f32)> {
    %0 = llvm.mlir.constant(0 : i32) : i32
    %1 = nvvm.mma.sp.block_scale A[%arg0, %arg1, %arg2, %arg3] B[%arg4, %arg5, %arg6, %arg7] C[%arg8, %arg9, %arg10, %arg11] sparseMetadata[%arg12] selector[%0] scaleA[%arg13, %arg14, %arg15] scaleB[%arg16, %arg17, %arg18] {blockScaleFormat = #nvvm.block_scale_format<ue8m0>, kind = #nvvm.block_scale_kind<mxf8f6f4>, multiplicandAPtxType = #nvvm.mma_type<e2m3>, multiplicandBPtxType = #nvvm.mma_type<e2m1>, orderedMetadata, scaleVecSize = #nvvm.scale_vec_size<x1>, shape = #nvvm.shape<m = 16, n = 8, k = 64>} : (i32, i32, f32) -> !llvm.struct<(f32, f32, f32, f32)>
    return %1 : !llvm.struct<(f32, f32, f32, f32)>
  }
  func.func @nvvm_mxf8f6f4_sp_blockscale_mma_e2m3_e2m3(%arg0: i32, %arg1: i32, %arg2: i32, %arg3: i32, %arg4: i32, %arg5: i32, %arg6: i32, %arg7: i32, %arg8: f32, %arg9: f32, %arg10: f32, %arg11: f32, %arg12: i32, %arg13: i32, %arg14: i16, %arg15: i16, %arg16: i32, %arg17: i16, %arg18: i16) -> !llvm.struct<(f32, f32, f32, f32)> {
    %0 = llvm.mlir.constant(0 : i32) : i32
    %1 = nvvm.mma.sp.block_scale A[%arg0, %arg1, %arg2, %arg3] B[%arg4, %arg5, %arg6, %arg7] C[%arg8, %arg9, %arg10, %arg11] sparseMetadata[%arg12] selector[%0] scaleA[%arg13, %arg14, %arg15] scaleB[%arg16, %arg17, %arg18] {blockScaleFormat = #nvvm.block_scale_format<ue8m0>, kind = #nvvm.block_scale_kind<mxf8f6f4>, multiplicandAPtxType = #nvvm.mma_type<e2m3>, multiplicandBPtxType = #nvvm.mma_type<e2m3>, orderedMetadata, scaleVecSize = #nvvm.scale_vec_size<x1>, shape = #nvvm.shape<m = 16, n = 8, k = 64>} : (i32, i32, f32) -> !llvm.struct<(f32, f32, f32, f32)>
    return %1 : !llvm.struct<(f32, f32, f32, f32)>
  }
  func.func @nvvm_mxf8f6f4_sp_blockscale_mma_e2m3_e3m2(%arg0: i32, %arg1: i32, %arg2: i32, %arg3: i32, %arg4: i32, %arg5: i32, %arg6: i32, %arg7: i32, %arg8: f32, %arg9: f32, %arg10: f32, %arg11: f32, %arg12: i32, %arg13: i32, %arg14: i16, %arg15: i16, %arg16: i32, %arg17: i16, %arg18: i16) -> !llvm.struct<(f32, f32, f32, f32)> {
    %0 = llvm.mlir.constant(0 : i32) : i32
    %1 = nvvm.mma.sp.block_scale A[%arg0, %arg1, %arg2, %arg3] B[%arg4, %arg5, %arg6, %arg7] C[%arg8, %arg9, %arg10, %arg11] sparseMetadata[%arg12] selector[%0] scaleA[%arg13, %arg14, %arg15] scaleB[%arg16, %arg17, %arg18] {blockScaleFormat = #nvvm.block_scale_format<ue8m0>, kind = #nvvm.block_scale_kind<mxf8f6f4>, multiplicandAPtxType = #nvvm.mma_type<e2m3>, multiplicandBPtxType = #nvvm.mma_type<e3m2>, orderedMetadata, scaleVecSize = #nvvm.scale_vec_size<x1>, shape = #nvvm.shape<m = 16, n = 8, k = 64>} : (i32, i32, f32) -> !llvm.struct<(f32, f32, f32, f32)>
    return %1 : !llvm.struct<(f32, f32, f32, f32)>
  }
  func.func @nvvm_mxf8f6f4_sp_blockscale_mma_e2m3_e4m3(%arg0: i32, %arg1: i32, %arg2: i32, %arg3: i32, %arg4: i32, %arg5: i32, %arg6: i32, %arg7: i32, %arg8: f32, %arg9: f32, %arg10: f32, %arg11: f32, %arg12: i32, %arg13: i32, %arg14: i16, %arg15: i16, %arg16: i32, %arg17: i16, %arg18: i16) -> !llvm.struct<(f32, f32, f32, f32)> {
    %0 = llvm.mlir.constant(0 : i32) : i32
    %1 = nvvm.mma.sp.block_scale A[%arg0, %arg1, %arg2, %arg3] B[%arg4, %arg5, %arg6, %arg7] C[%arg8, %arg9, %arg10, %arg11] sparseMetadata[%arg12] selector[%0] scaleA[%arg13, %arg14, %arg15] scaleB[%arg16, %arg17, %arg18] {blockScaleFormat = #nvvm.block_scale_format<ue8m0>, kind = #nvvm.block_scale_kind<mxf8f6f4>, multiplicandAPtxType = #nvvm.mma_type<e2m3>, multiplicandBPtxType = #nvvm.mma_type<e4m3>, orderedMetadata, scaleVecSize = #nvvm.scale_vec_size<x1>, shape = #nvvm.shape<m = 16, n = 8, k = 64>} : (i32, i32, f32) -> !llvm.struct<(f32, f32, f32, f32)>
    return %1 : !llvm.struct<(f32, f32, f32, f32)>
  }
  func.func @nvvm_mxf8f6f4_sp_blockscale_mma_e2m3_e5m2(%arg0: i32, %arg1: i32, %arg2: i32, %arg3: i32, %arg4: i32, %arg5: i32, %arg6: i32, %arg7: i32, %arg8: f32, %arg9: f32, %arg10: f32, %arg11: f32, %arg12: i32, %arg13: i32, %arg14: i16, %arg15: i16, %arg16: i32, %arg17: i16, %arg18: i16) -> !llvm.struct<(f32, f32, f32, f32)> {
    %0 = llvm.mlir.constant(0 : i32) : i32
    %1 = nvvm.mma.sp.block_scale A[%arg0, %arg1, %arg2, %arg3] B[%arg4, %arg5, %arg6, %arg7] C[%arg8, %arg9, %arg10, %arg11] sparseMetadata[%arg12] selector[%0] scaleA[%arg13, %arg14, %arg15] scaleB[%arg16, %arg17, %arg18] {blockScaleFormat = #nvvm.block_scale_format<ue8m0>, kind = #nvvm.block_scale_kind<mxf8f6f4>, multiplicandAPtxType = #nvvm.mma_type<e2m3>, multiplicandBPtxType = #nvvm.mma_type<e5m2>, orderedMetadata, scaleVecSize = #nvvm.scale_vec_size<x1>, shape = #nvvm.shape<m = 16, n = 8, k = 64>} : (i32, i32, f32) -> !llvm.struct<(f32, f32, f32, f32)>
    return %1 : !llvm.struct<(f32, f32, f32, f32)>
  }
  func.func @nvvm_mxf8f6f4_sp_blockscale_mma_e3m2_e2m1(%arg0: i32, %arg1: i32, %arg2: i32, %arg3: i32, %arg4: i32, %arg5: i32, %arg6: i32, %arg7: i32, %arg8: f32, %arg9: f32, %arg10: f32, %arg11: f32, %arg12: i32, %arg13: i32, %arg14: i16, %arg15: i16, %arg16: i32, %arg17: i16, %arg18: i16) -> !llvm.struct<(f32, f32, f32, f32)> {
    %0 = llvm.mlir.constant(0 : i32) : i32
    %1 = nvvm.mma.sp.block_scale A[%arg0, %arg1, %arg2, %arg3] B[%arg4, %arg5, %arg6, %arg7] C[%arg8, %arg9, %arg10, %arg11] sparseMetadata[%arg12] selector[%0] scaleA[%arg13, %arg14, %arg15] scaleB[%arg16, %arg17, %arg18] {blockScaleFormat = #nvvm.block_scale_format<ue8m0>, kind = #nvvm.block_scale_kind<mxf8f6f4>, multiplicandAPtxType = #nvvm.mma_type<e3m2>, multiplicandBPtxType = #nvvm.mma_type<e2m1>, orderedMetadata, scaleVecSize = #nvvm.scale_vec_size<x1>, shape = #nvvm.shape<m = 16, n = 8, k = 64>} : (i32, i32, f32) -> !llvm.struct<(f32, f32, f32, f32)>
    return %1 : !llvm.struct<(f32, f32, f32, f32)>
  }
  func.func @nvvm_mxf8f6f4_sp_blockscale_mma_e3m2_e2m3(%arg0: i32, %arg1: i32, %arg2: i32, %arg3: i32, %arg4: i32, %arg5: i32, %arg6: i32, %arg7: i32, %arg8: f32, %arg9: f32, %arg10: f32, %arg11: f32, %arg12: i32, %arg13: i32, %arg14: i16, %arg15: i16, %arg16: i32, %arg17: i16, %arg18: i16) -> !llvm.struct<(f32, f32, f32, f32)> {
    %0 = llvm.mlir.constant(0 : i32) : i32
    %1 = nvvm.mma.sp.block_scale A[%arg0, %arg1, %arg2, %arg3] B[%arg4, %arg5, %arg6, %arg7] C[%arg8, %arg9, %arg10, %arg11] sparseMetadata[%arg12] selector[%0] scaleA[%arg13, %arg14, %arg15] scaleB[%arg16, %arg17, %arg18] {blockScaleFormat = #nvvm.block_scale_format<ue8m0>, kind = #nvvm.block_scale_kind<mxf8f6f4>, multiplicandAPtxType = #nvvm.mma_type<e3m2>, multiplicandBPtxType = #nvvm.mma_type<e2m3>, orderedMetadata, scaleVecSize = #nvvm.scale_vec_size<x1>, shape = #nvvm.shape<m = 16, n = 8, k = 64>} : (i32, i32, f32) -> !llvm.struct<(f32, f32, f32, f32)>
    return %1 : !llvm.struct<(f32, f32, f32, f32)>
  }
  func.func @nvvm_mxf8f6f4_sp_blockscale_mma_e3m2_e3m2(%arg0: i32, %arg1: i32, %arg2: i32, %arg3: i32, %arg4: i32, %arg5: i32, %arg6: i32, %arg7: i32, %arg8: f32, %arg9: f32, %arg10: f32, %arg11: f32, %arg12: i32, %arg13: i32, %arg14: i16, %arg15: i16, %arg16: i32, %arg17: i16, %arg18: i16) -> !llvm.struct<(f32, f32, f32, f32)> {
    %0 = llvm.mlir.constant(0 : i32) : i32
    %1 = nvvm.mma.sp.block_scale A[%arg0, %arg1, %arg2, %arg3] B[%arg4, %arg5, %arg6, %arg7] C[%arg8, %arg9, %arg10, %arg11] sparseMetadata[%arg12] selector[%0] scaleA[%arg13, %arg14, %arg15] scaleB[%arg16, %arg17, %arg18] {blockScaleFormat = #nvvm.block_scale_format<ue8m0>, kind = #nvvm.block_scale_kind<mxf8f6f4>, multiplicandAPtxType = #nvvm.mma_type<e3m2>, multiplicandBPtxType = #nvvm.mma_type<e3m2>, orderedMetadata, scaleVecSize = #nvvm.scale_vec_size<x1>, shape = #nvvm.shape<m = 16, n = 8, k = 64>} : (i32, i32, f32) -> !llvm.struct<(f32, f32, f32, f32)>
    return %1 : !llvm.struct<(f32, f32, f32, f32)>
  }
  func.func @nvvm_mxf8f6f4_sp_blockscale_mma_e3m2_e4m3(%arg0: i32, %arg1: i32, %arg2: i32, %arg3: i32, %arg4: i32, %arg5: i32, %arg6: i32, %arg7: i32, %arg8: f32, %arg9: f32, %arg10: f32, %arg11: f32, %arg12: i32, %arg13: i32, %arg14: i16, %arg15: i16, %arg16: i32, %arg17: i16, %arg18: i16) -> !llvm.struct<(f32, f32, f32, f32)> {
    %0 = llvm.mlir.constant(0 : i32) : i32
    %1 = nvvm.mma.sp.block_scale A[%arg0, %arg1, %arg2, %arg3] B[%arg4, %arg5, %arg6, %arg7] C[%arg8, %arg9, %arg10, %arg11] sparseMetadata[%arg12] selector[%0] scaleA[%arg13, %arg14, %arg15] scaleB[%arg16, %arg17, %arg18] {blockScaleFormat = #nvvm.block_scale_format<ue8m0>, kind = #nvvm.block_scale_kind<mxf8f6f4>, multiplicandAPtxType = #nvvm.mma_type<e3m2>, multiplicandBPtxType = #nvvm.mma_type<e4m3>, orderedMetadata, scaleVecSize = #nvvm.scale_vec_size<x1>, shape = #nvvm.shape<m = 16, n = 8, k = 64>} : (i32, i32, f32) -> !llvm.struct<(f32, f32, f32, f32)>
    return %1 : !llvm.struct<(f32, f32, f32, f32)>
  }
  func.func @nvvm_mxf8f6f4_sp_blockscale_mma_e3m2_e5m2(%arg0: i32, %arg1: i32, %arg2: i32, %arg3: i32, %arg4: i32, %arg5: i32, %arg6: i32, %arg7: i32, %arg8: f32, %arg9: f32, %arg10: f32, %arg11: f32, %arg12: i32, %arg13: i32, %arg14: i16, %arg15: i16, %arg16: i32, %arg17: i16, %arg18: i16) -> !llvm.struct<(f32, f32, f32, f32)> {
    %0 = llvm.mlir.constant(0 : i32) : i32
    %1 = nvvm.mma.sp.block_scale A[%arg0, %arg1, %arg2, %arg3] B[%arg4, %arg5, %arg6, %arg7] C[%arg8, %arg9, %arg10, %arg11] sparseMetadata[%arg12] selector[%0] scaleA[%arg13, %arg14, %arg15] scaleB[%arg16, %arg17, %arg18] {blockScaleFormat = #nvvm.block_scale_format<ue8m0>, kind = #nvvm.block_scale_kind<mxf8f6f4>, multiplicandAPtxType = #nvvm.mma_type<e3m2>, multiplicandBPtxType = #nvvm.mma_type<e5m2>, orderedMetadata, scaleVecSize = #nvvm.scale_vec_size<x1>, shape = #nvvm.shape<m = 16, n = 8, k = 64>} : (i32, i32, f32) -> !llvm.struct<(f32, f32, f32, f32)>
    return %1 : !llvm.struct<(f32, f32, f32, f32)>
  }
  func.func @nvvm_mxf8f6f4_sp_blockscale_mma_e4m3_e2m1(%arg0: i32, %arg1: i32, %arg2: i32, %arg3: i32, %arg4: i32, %arg5: i32, %arg6: i32, %arg7: i32, %arg8: f32, %arg9: f32, %arg10: f32, %arg11: f32, %arg12: i32, %arg13: i32, %arg14: i16, %arg15: i16, %arg16: i32, %arg17: i16, %arg18: i16) -> !llvm.struct<(f32, f32, f32, f32)> {
    %0 = llvm.mlir.constant(0 : i32) : i32
    %1 = nvvm.mma.sp.block_scale A[%arg0, %arg1, %arg2, %arg3] B[%arg4, %arg5, %arg6, %arg7] C[%arg8, %arg9, %arg10, %arg11] sparseMetadata[%arg12] selector[%0] scaleA[%arg13, %arg14, %arg15] scaleB[%arg16, %arg17, %arg18] {blockScaleFormat = #nvvm.block_scale_format<ue8m0>, kind = #nvvm.block_scale_kind<mxf8f6f4>, multiplicandAPtxType = #nvvm.mma_type<e4m3>, multiplicandBPtxType = #nvvm.mma_type<e2m1>, orderedMetadata, scaleVecSize = #nvvm.scale_vec_size<x1>, shape = #nvvm.shape<m = 16, n = 8, k = 64>} : (i32, i32, f32) -> !llvm.struct<(f32, f32, f32, f32)>
    return %1 : !llvm.struct<(f32, f32, f32, f32)>
  }
  func.func @nvvm_mxf8f6f4_sp_blockscale_mma_e4m3_e2m3(%arg0: i32, %arg1: i32, %arg2: i32, %arg3: i32, %arg4: i32, %arg5: i32, %arg6: i32, %arg7: i32, %arg8: f32, %arg9: f32, %arg10: f32, %arg11: f32, %arg12: i32, %arg13: i32, %arg14: i16, %arg15: i16, %arg16: i32, %arg17: i16, %arg18: i16) -> !llvm.struct<(f32, f32, f32, f32)> {
    %0 = llvm.mlir.constant(0 : i32) : i32
    %1 = nvvm.mma.sp.block_scale A[%arg0, %arg1, %arg2, %arg3] B[%arg4, %arg5, %arg6, %arg7] C[%arg8, %arg9, %arg10, %arg11] sparseMetadata[%arg12] selector[%0] scaleA[%arg13, %arg14, %arg15] scaleB[%arg16, %arg17, %arg18] {blockScaleFormat = #nvvm.block_scale_format<ue8m0>, kind = #nvvm.block_scale_kind<mxf8f6f4>, multiplicandAPtxType = #nvvm.mma_type<e4m3>, multiplicandBPtxType = #nvvm.mma_type<e2m3>, orderedMetadata, scaleVecSize = #nvvm.scale_vec_size<x1>, shape = #nvvm.shape<m = 16, n = 8, k = 64>} : (i32, i32, f32) -> !llvm.struct<(f32, f32, f32, f32)>
    return %1 : !llvm.struct<(f32, f32, f32, f32)>
  }
  func.func @nvvm_mxf8f6f4_sp_blockscale_mma_e4m3_e3m2(%arg0: i32, %arg1: i32, %arg2: i32, %arg3: i32, %arg4: i32, %arg5: i32, %arg6: i32, %arg7: i32, %arg8: f32, %arg9: f32, %arg10: f32, %arg11: f32, %arg12: i32, %arg13: i32, %arg14: i16, %arg15: i16, %arg16: i32, %arg17: i16, %arg18: i16) -> !llvm.struct<(f32, f32, f32, f32)> {
    %0 = llvm.mlir.constant(0 : i32) : i32
    %1 = nvvm.mma.sp.block_scale A[%arg0, %arg1, %arg2, %arg3] B[%arg4, %arg5, %arg6, %arg7] C[%arg8, %arg9, %arg10, %arg11] sparseMetadata[%arg12] selector[%0] scaleA[%arg13, %arg14, %arg15] scaleB[%arg16, %arg17, %arg18] {blockScaleFormat = #nvvm.block_scale_format<ue8m0>, kind = #nvvm.block_scale_kind<mxf8f6f4>, multiplicandAPtxType = #nvvm.mma_type<e4m3>, multiplicandBPtxType = #nvvm.mma_type<e3m2>, orderedMetadata, scaleVecSize = #nvvm.scale_vec_size<x1>, shape = #nvvm.shape<m = 16, n = 8, k = 64>} : (i32, i32, f32) -> !llvm.struct<(f32, f32, f32, f32)>
    return %1 : !llvm.struct<(f32, f32, f32, f32)>
  }
  func.func @nvvm_mxf8f6f4_sp_blockscale_mma_e4m3_e4m3(%arg0: i32, %arg1: i32, %arg2: i32, %arg3: i32, %arg4: i32, %arg5: i32, %arg6: i32, %arg7: i32, %arg8: f32, %arg9: f32, %arg10: f32, %arg11: f32, %arg12: i32, %arg13: i32, %arg14: i16, %arg15: i16, %arg16: i32, %arg17: i16, %arg18: i16) -> !llvm.struct<(f32, f32, f32, f32)> {
    %0 = llvm.mlir.constant(0 : i32) : i32
    %1 = nvvm.mma.sp.block_scale A[%arg0, %arg1, %arg2, %arg3] B[%arg4, %arg5, %arg6, %arg7] C[%arg8, %arg9, %arg10, %arg11] sparseMetadata[%arg12] selector[%0] scaleA[%arg13, %arg14, %arg15] scaleB[%arg16, %arg17, %arg18] {blockScaleFormat = #nvvm.block_scale_format<ue8m0>, kind = #nvvm.block_scale_kind<mxf8f6f4>, multiplicandAPtxType = #nvvm.mma_type<e4m3>, multiplicandBPtxType = #nvvm.mma_type<e4m3>, orderedMetadata, scaleVecSize = #nvvm.scale_vec_size<x1>, shape = #nvvm.shape<m = 16, n = 8, k = 64>} : (i32, i32, f32) -> !llvm.struct<(f32, f32, f32, f32)>
    return %1 : !llvm.struct<(f32, f32, f32, f32)>
  }
  func.func @nvvm_mxf8f6f4_sp_blockscale_mma_e4m3_e5m2(%arg0: i32, %arg1: i32, %arg2: i32, %arg3: i32, %arg4: i32, %arg5: i32, %arg6: i32, %arg7: i32, %arg8: f32, %arg9: f32, %arg10: f32, %arg11: f32, %arg12: i32, %arg13: i32, %arg14: i16, %arg15: i16, %arg16: i32, %arg17: i16, %arg18: i16) -> !llvm.struct<(f32, f32, f32, f32)> {
    %0 = llvm.mlir.constant(0 : i32) : i32
    %1 = nvvm.mma.sp.block_scale A[%arg0, %arg1, %arg2, %arg3] B[%arg4, %arg5, %arg6, %arg7] C[%arg8, %arg9, %arg10, %arg11] sparseMetadata[%arg12] selector[%0] scaleA[%arg13, %arg14, %arg15] scaleB[%arg16, %arg17, %arg18] {blockScaleFormat = #nvvm.block_scale_format<ue8m0>, kind = #nvvm.block_scale_kind<mxf8f6f4>, multiplicandAPtxType = #nvvm.mma_type<e4m3>, multiplicandBPtxType = #nvvm.mma_type<e5m2>, orderedMetadata, scaleVecSize = #nvvm.scale_vec_size<x1>, shape = #nvvm.shape<m = 16, n = 8, k = 64>} : (i32, i32, f32) -> !llvm.struct<(f32, f32, f32, f32)>
    return %1 : !llvm.struct<(f32, f32, f32, f32)>
  }
  func.func @nvvm_mxf8f6f4_sp_blockscale_mma_e5m2_e2m1(%arg0: i32, %arg1: i32, %arg2: i32, %arg3: i32, %arg4: i32, %arg5: i32, %arg6: i32, %arg7: i32, %arg8: f32, %arg9: f32, %arg10: f32, %arg11: f32, %arg12: i32, %arg13: i32, %arg14: i16, %arg15: i16, %arg16: i32, %arg17: i16, %arg18: i16) -> !llvm.struct<(f32, f32, f32, f32)> {
    %0 = llvm.mlir.constant(0 : i32) : i32
    %1 = nvvm.mma.sp.block_scale A[%arg0, %arg1, %arg2, %arg3] B[%arg4, %arg5, %arg6, %arg7] C[%arg8, %arg9, %arg10, %arg11] sparseMetadata[%arg12] selector[%0] scaleA[%arg13, %arg14, %arg15] scaleB[%arg16, %arg17, %arg18] {blockScaleFormat = #nvvm.block_scale_format<ue8m0>, kind = #nvvm.block_scale_kind<mxf8f6f4>, multiplicandAPtxType = #nvvm.mma_type<e5m2>, multiplicandBPtxType = #nvvm.mma_type<e2m1>, orderedMetadata, scaleVecSize = #nvvm.scale_vec_size<x1>, shape = #nvvm.shape<m = 16, n = 8, k = 64>} : (i32, i32, f32) -> !llvm.struct<(f32, f32, f32, f32)>
    return %1 : !llvm.struct<(f32, f32, f32, f32)>
  }
  func.func @nvvm_mxf8f6f4_sp_blockscale_mma_e5m2_e2m3(%arg0: i32, %arg1: i32, %arg2: i32, %arg3: i32, %arg4: i32, %arg5: i32, %arg6: i32, %arg7: i32, %arg8: f32, %arg9: f32, %arg10: f32, %arg11: f32, %arg12: i32, %arg13: i32, %arg14: i16, %arg15: i16, %arg16: i32, %arg17: i16, %arg18: i16) -> !llvm.struct<(f32, f32, f32, f32)> {
    %0 = llvm.mlir.constant(0 : i32) : i32
    %1 = nvvm.mma.sp.block_scale A[%arg0, %arg1, %arg2, %arg3] B[%arg4, %arg5, %arg6, %arg7] C[%arg8, %arg9, %arg10, %arg11] sparseMetadata[%arg12] selector[%0] scaleA[%arg13, %arg14, %arg15] scaleB[%arg16, %arg17, %arg18] {blockScaleFormat = #nvvm.block_scale_format<ue8m0>, kind = #nvvm.block_scale_kind<mxf8f6f4>, multiplicandAPtxType = #nvvm.mma_type<e5m2>, multiplicandBPtxType = #nvvm.mma_type<e2m3>, orderedMetadata, scaleVecSize = #nvvm.scale_vec_size<x1>, shape = #nvvm.shape<m = 16, n = 8, k = 64>} : (i32, i32, f32) -> !llvm.struct<(f32, f32, f32, f32)>
    return %1 : !llvm.struct<(f32, f32, f32, f32)>
  }
  func.func @nvvm_mxf8f6f4_sp_blockscale_mma_e5m2_e3m2(%arg0: i32, %arg1: i32, %arg2: i32, %arg3: i32, %arg4: i32, %arg5: i32, %arg6: i32, %arg7: i32, %arg8: f32, %arg9: f32, %arg10: f32, %arg11: f32, %arg12: i32, %arg13: i32, %arg14: i16, %arg15: i16, %arg16: i32, %arg17: i16, %arg18: i16) -> !llvm.struct<(f32, f32, f32, f32)> {
    %0 = llvm.mlir.constant(0 : i32) : i32
    %1 = nvvm.mma.sp.block_scale A[%arg0, %arg1, %arg2, %arg3] B[%arg4, %arg5, %arg6, %arg7] C[%arg8, %arg9, %arg10, %arg11] sparseMetadata[%arg12] selector[%0] scaleA[%arg13, %arg14, %arg15] scaleB[%arg16, %arg17, %arg18] {blockScaleFormat = #nvvm.block_scale_format<ue8m0>, kind = #nvvm.block_scale_kind<mxf8f6f4>, multiplicandAPtxType = #nvvm.mma_type<e5m2>, multiplicandBPtxType = #nvvm.mma_type<e3m2>, orderedMetadata, scaleVecSize = #nvvm.scale_vec_size<x1>, shape = #nvvm.shape<m = 16, n = 8, k = 64>} : (i32, i32, f32) -> !llvm.struct<(f32, f32, f32, f32)>
    return %1 : !llvm.struct<(f32, f32, f32, f32)>
  }
  func.func @nvvm_mxf8f6f4_sp_blockscale_mma_e5m2_e4m3(%arg0: i32, %arg1: i32, %arg2: i32, %arg3: i32, %arg4: i32, %arg5: i32, %arg6: i32, %arg7: i32, %arg8: f32, %arg9: f32, %arg10: f32, %arg11: f32, %arg12: i32, %arg13: i32, %arg14: i16, %arg15: i16, %arg16: i32, %arg17: i16, %arg18: i16) -> !llvm.struct<(f32, f32, f32, f32)> {
    %0 = llvm.mlir.constant(0 : i32) : i32
    %1 = nvvm.mma.sp.block_scale A[%arg0, %arg1, %arg2, %arg3] B[%arg4, %arg5, %arg6, %arg7] C[%arg8, %arg9, %arg10, %arg11] sparseMetadata[%arg12] selector[%0] scaleA[%arg13, %arg14, %arg15] scaleB[%arg16, %arg17, %arg18] {blockScaleFormat = #nvvm.block_scale_format<ue8m0>, kind = #nvvm.block_scale_kind<mxf8f6f4>, multiplicandAPtxType = #nvvm.mma_type<e5m2>, multiplicandBPtxType = #nvvm.mma_type<e4m3>, orderedMetadata, scaleVecSize = #nvvm.scale_vec_size<x1>, shape = #nvvm.shape<m = 16, n = 8, k = 64>} : (i32, i32, f32) -> !llvm.struct<(f32, f32, f32, f32)>
    return %1 : !llvm.struct<(f32, f32, f32, f32)>
  }
  func.func @nvvm_mxf8f6f4_sp_blockscale_mma_e5m2_e5m2(%arg0: i32, %arg1: i32, %arg2: i32, %arg3: i32, %arg4: i32, %arg5: i32, %arg6: i32, %arg7: i32, %arg8: f32, %arg9: f32, %arg10: f32, %arg11: f32, %arg12: i32, %arg13: i32, %arg14: i16, %arg15: i16, %arg16: i32, %arg17: i16, %arg18: i16) -> !llvm.struct<(f32, f32, f32, f32)> {
    %0 = llvm.mlir.constant(0 : i32) : i32
    %1 = nvvm.mma.sp.block_scale A[%arg0, %arg1, %arg2, %arg3] B[%arg4, %arg5, %arg6, %arg7] C[%arg8, %arg9, %arg10, %arg11] sparseMetadata[%arg12] selector[%0] scaleA[%arg13, %arg14, %arg15] scaleB[%arg16, %arg17, %arg18] {blockScaleFormat = #nvvm.block_scale_format<ue8m0>, kind = #nvvm.block_scale_kind<mxf8f6f4>, multiplicandAPtxType = #nvvm.mma_type<e5m2>, multiplicandBPtxType = #nvvm.mma_type<e5m2>, orderedMetadata, scaleVecSize = #nvvm.scale_vec_size<x1>, shape = #nvvm.shape<m = 16, n = 8, k = 64>} : (i32, i32, f32) -> !llvm.struct<(f32, f32, f32, f32)>
    return %1 : !llvm.struct<(f32, f32, f32, f32)>
  }
  func.func @nvvm_mxf4_sp_blockscale_mma(%arg0: i32, %arg1: i32, %arg2: i32, %arg3: i32, %arg4: i32, %arg5: i32, %arg6: i32, %arg7: i32, %arg8: f32, %arg9: f32, %arg10: f32, %arg11: f32, %arg12: i32, %arg13: i32, %arg14: i16, %arg15: i16, %arg16: i32, %arg17: i16, %arg18: i16) -> !llvm.struct<(f32, f32, f32, f32)> {
    %0 = llvm.mlir.constant(0 : i32) : i32
    %1 = nvvm.mma.sp.block_scale A[%arg0, %arg1, %arg2, %arg3] B[%arg4, %arg5, %arg6, %arg7] C[%arg8, %arg9, %arg10, %arg11] sparseMetadata[%arg12] selector[%0] scaleA[%arg13, %arg14, %arg15] scaleB[%arg16, %arg17, %arg18] {blockScaleFormat = #nvvm.block_scale_format<ue8m0>, kind = #nvvm.block_scale_kind<mxf4>, multiplicandAPtxType = #nvvm.mma_type<e2m1>, multiplicandBPtxType = #nvvm.mma_type<e2m1>, orderedMetadata, scaleVecSize = #nvvm.scale_vec_size<x2>, shape = #nvvm.shape<m = 16, n = 8, k = 128>} : (i32, i32, f32) -> !llvm.struct<(f32, f32, f32, f32)>
    return %1 : !llvm.struct<(f32, f32, f32, f32)>
  }
  func.func @nvvm_mxf4nvf4_sp_blockscale_mma_ue8m0(%arg0: i32, %arg1: i32, %arg2: i32, %arg3: i32, %arg4: i32, %arg5: i32, %arg6: i32, %arg7: i32, %arg8: f32, %arg9: f32, %arg10: f32, %arg11: f32, %arg12: i32, %arg13: i32, %arg14: i16, %arg15: i16, %arg16: i32, %arg17: i16, %arg18: i16) -> !llvm.struct<(f32, f32, f32, f32)> {
    %0 = llvm.mlir.constant(0 : i32) : i32
    %1 = nvvm.mma.sp.block_scale A[%arg0, %arg1, %arg2, %arg3] B[%arg4, %arg5, %arg6, %arg7] C[%arg8, %arg9, %arg10, %arg11] sparseMetadata[%arg12] selector[%0] scaleA[%arg13, %arg14, %arg15] scaleB[%arg16, %arg17, %arg18] {blockScaleFormat = #nvvm.block_scale_format<ue8m0>, kind = #nvvm.block_scale_kind<mxf4nvf4>, multiplicandAPtxType = #nvvm.mma_type<e2m1>, multiplicandBPtxType = #nvvm.mma_type<e2m1>, orderedMetadata, scaleVecSize = #nvvm.scale_vec_size<x2>, shape = #nvvm.shape<m = 16, n = 8, k = 128>} : (i32, i32, f32) -> !llvm.struct<(f32, f32, f32, f32)>
    return %1 : !llvm.struct<(f32, f32, f32, f32)>
  }
  func.func @nvvm_mxf4nvf4_sp_blockscale_mma_ue4m3(%arg0: i32, %arg1: i32, %arg2: i32, %arg3: i32, %arg4: i32, %arg5: i32, %arg6: i32, %arg7: i32, %arg8: f32, %arg9: f32, %arg10: f32, %arg11: f32, %arg12: i32, %arg13: i32, %arg14: i16, %arg15: i16, %arg16: i32, %arg17: i16, %arg18: i16) -> !llvm.struct<(f32, f32, f32, f32)> {
    %0 = llvm.mlir.constant(0 : i32) : i32
    %1 = nvvm.mma.sp.block_scale A[%arg0, %arg1, %arg2, %arg3] B[%arg4, %arg5, %arg6, %arg7] C[%arg8, %arg9, %arg10, %arg11] sparseMetadata[%arg12] selector[%0] scaleA[%arg13, %arg14, %arg15] scaleB[%arg16, %arg17, %arg18] {blockScaleFormat = #nvvm.block_scale_format<ue4m3>, kind = #nvvm.block_scale_kind<mxf4nvf4>, multiplicandAPtxType = #nvvm.mma_type<e2m1>, multiplicandBPtxType = #nvvm.mma_type<e2m1>, orderedMetadata, scaleVecSize = #nvvm.scale_vec_size<x4>, shape = #nvvm.shape<m = 16, n = 8, k = 128>} : (i32, i32, f32) -> !llvm.struct<(f32, f32, f32, f32)>
    return %1 : !llvm.struct<(f32, f32, f32, f32)>
  }
  func.func @nvvm_mxf4nvf4_sp_blockscale_mma_ue8m0_x4(%arg0: i32, %arg1: i32, %arg2: i32, %arg3: i32, %arg4: i32, %arg5: i32, %arg6: i32, %arg7: i32, %arg8: f32, %arg9: f32, %arg10: f32, %arg11: f32, %arg12: i32, %arg13: i32, %arg14: i16, %arg15: i16, %arg16: i32, %arg17: i16, %arg18: i16) -> !llvm.struct<(f32, f32, f32, f32)> {
    %0 = llvm.mlir.constant(0 : i32) : i32
    %1 = nvvm.mma.sp.block_scale A[%arg0, %arg1, %arg2, %arg3] B[%arg4, %arg5, %arg6, %arg7] C[%arg8, %arg9, %arg10, %arg11] sparseMetadata[%arg12] selector[%0] scaleA[%arg13, %arg14, %arg15] scaleB[%arg16, %arg17, %arg18] {blockScaleFormat = #nvvm.block_scale_format<ue8m0>, kind = #nvvm.block_scale_kind<mxf4nvf4>, multiplicandAPtxType = #nvvm.mma_type<e2m1>, multiplicandBPtxType = #nvvm.mma_type<e2m1>, orderedMetadata, scaleVecSize = #nvvm.scale_vec_size<x4>, shape = #nvvm.shape<m = 16, n = 8, k = 128>} : (i32, i32, f32) -> !llvm.struct<(f32, f32, f32, f32)>
    return %1 : !llvm.struct<(f32, f32, f32, f32)>
  }
}

