module {
  func.func @nvvm_mxf8f6f4_sp_blockscale_mma_e2m1_e2m1(%arg0: vector<4xi32>, %arg1: vector<4xi32>, %arg2: vector<4xf32>, %arg3: i32, %arg4: i32, %arg5: i32, %arg6: i16, %arg7: i16, %arg8: i32, %arg9: i16, %arg10: i16) {
    %0 = nvvm.mma.sp.block_scale A[%arg0] B[%arg1] C[%arg2] sparseMetadata[%arg3] selector[%arg4] scaleA[%arg5, %arg6, %arg7] scaleB[%arg8, %arg9, %arg10] {blockScaleFormat = #nvvm.block_scale_format<ue8m0>, kind = #nvvm.block_scale_kind<mxf8f6f4>, multiplicandAPtxType = #nvvm.mma_type<e2m1>, multiplicandBPtxType = #nvvm.mma_type<e2m1>, orderedMetadata, scaleVecSize = #nvvm.scale_vec_size<x1>, shape = #nvvm.shape<m = 16, n = 8, k = 64>} : (vector<4xi32>, vector<4xi32>, vector<4xf32>) -> !llvm.struct<(vector<4xf32>)>
    return
  }
  func.func @nvvm_mxf8f6f4_sp_blockscale_mma_e2m1_e2m3(%arg0: vector<4xi32>, %arg1: vector<4xi32>, %arg2: vector<4xf32>, %arg3: i32, %arg4: i32, %arg5: i32, %arg6: i16, %arg7: i16, %arg8: i32, %arg9: i16, %arg10: i16) {
    %0 = nvvm.mma.sp.block_scale A[%arg0] B[%arg1] C[%arg2] sparseMetadata[%arg3] selector[%arg4] scaleA[%arg5, %arg6, %arg7] scaleB[%arg8, %arg9, %arg10] {blockScaleFormat = #nvvm.block_scale_format<ue8m0>, kind = #nvvm.block_scale_kind<mxf8f6f4>, multiplicandAPtxType = #nvvm.mma_type<e2m1>, multiplicandBPtxType = #nvvm.mma_type<e2m3>, orderedMetadata, scaleVecSize = #nvvm.scale_vec_size<x1>, shape = #nvvm.shape<m = 16, n = 8, k = 64>} : (vector<4xi32>, vector<4xi32>, vector<4xf32>) -> !llvm.struct<(vector<4xf32>)>
    return
  }
  func.func @nvvm_mxf8f6f4_sp_blockscale_mma_e2m1_e3m2(%arg0: vector<4xi32>, %arg1: vector<4xi32>, %arg2: vector<4xf32>, %arg3: i32, %arg4: i32, %arg5: i32, %arg6: i16, %arg7: i16, %arg8: i32, %arg9: i16, %arg10: i16) {
    %0 = nvvm.mma.sp.block_scale A[%arg0] B[%arg1] C[%arg2] sparseMetadata[%arg3] selector[%arg4] scaleA[%arg5, %arg6, %arg7] scaleB[%arg8, %arg9, %arg10] {blockScaleFormat = #nvvm.block_scale_format<ue8m0>, kind = #nvvm.block_scale_kind<mxf8f6f4>, multiplicandAPtxType = #nvvm.mma_type<e2m1>, multiplicandBPtxType = #nvvm.mma_type<e3m2>, orderedMetadata, scaleVecSize = #nvvm.scale_vec_size<x1>, shape = #nvvm.shape<m = 16, n = 8, k = 64>} : (vector<4xi32>, vector<4xi32>, vector<4xf32>) -> !llvm.struct<(vector<4xf32>)>
    return
  }
  func.func @nvvm_mxf8f6f4_sp_blockscale_mma_e2m1_e4m3(%arg0: vector<4xi32>, %arg1: vector<4xi32>, %arg2: vector<4xf32>, %arg3: i32, %arg4: i32, %arg5: i32, %arg6: i16, %arg7: i16, %arg8: i32, %arg9: i16, %arg10: i16) {
    %0 = nvvm.mma.sp.block_scale A[%arg0] B[%arg1] C[%arg2] sparseMetadata[%arg3] selector[%arg4] scaleA[%arg5, %arg6, %arg7] scaleB[%arg8, %arg9, %arg10] {blockScaleFormat = #nvvm.block_scale_format<ue8m0>, kind = #nvvm.block_scale_kind<mxf8f6f4>, multiplicandAPtxType = #nvvm.mma_type<e2m1>, multiplicandBPtxType = #nvvm.mma_type<e4m3>, orderedMetadata, scaleVecSize = #nvvm.scale_vec_size<x1>, shape = #nvvm.shape<m = 16, n = 8, k = 64>} : (vector<4xi32>, vector<4xi32>, vector<4xf32>) -> !llvm.struct<(vector<4xf32>)>
    return
  }
  func.func @nvvm_mxf8f6f4_sp_blockscale_mma_e2m1_e5m2(%arg0: vector<4xi32>, %arg1: vector<4xi32>, %arg2: vector<4xf32>, %arg3: i32, %arg4: i32, %arg5: i32, %arg6: i16, %arg7: i16, %arg8: i32, %arg9: i16, %arg10: i16) {
    %0 = nvvm.mma.sp.block_scale A[%arg0] B[%arg1] C[%arg2] sparseMetadata[%arg3] selector[%arg4] scaleA[%arg5, %arg6, %arg7] scaleB[%arg8, %arg9, %arg10] {blockScaleFormat = #nvvm.block_scale_format<ue8m0>, kind = #nvvm.block_scale_kind<mxf8f6f4>, multiplicandAPtxType = #nvvm.mma_type<e2m1>, multiplicandBPtxType = #nvvm.mma_type<e5m2>, orderedMetadata, scaleVecSize = #nvvm.scale_vec_size<x1>, shape = #nvvm.shape<m = 16, n = 8, k = 64>} : (vector<4xi32>, vector<4xi32>, vector<4xf32>) -> !llvm.struct<(vector<4xf32>)>
    return
  }
  func.func @nvvm_mxf8f6f4_sp_blockscale_mma_e2m3_e2m1(%arg0: vector<4xi32>, %arg1: vector<4xi32>, %arg2: vector<4xf32>, %arg3: i32, %arg4: i32, %arg5: i32, %arg6: i16, %arg7: i16, %arg8: i32, %arg9: i16, %arg10: i16) {
    %0 = nvvm.mma.sp.block_scale A[%arg0] B[%arg1] C[%arg2] sparseMetadata[%arg3] selector[%arg4] scaleA[%arg5, %arg6, %arg7] scaleB[%arg8, %arg9, %arg10] {blockScaleFormat = #nvvm.block_scale_format<ue8m0>, kind = #nvvm.block_scale_kind<mxf8f6f4>, multiplicandAPtxType = #nvvm.mma_type<e2m3>, multiplicandBPtxType = #nvvm.mma_type<e2m1>, orderedMetadata, scaleVecSize = #nvvm.scale_vec_size<x1>, shape = #nvvm.shape<m = 16, n = 8, k = 64>} : (vector<4xi32>, vector<4xi32>, vector<4xf32>) -> !llvm.struct<(vector<4xf32>)>
    return
  }
  func.func @nvvm_mxf8f6f4_sp_blockscale_mma_e2m3_e2m3(%arg0: vector<4xi32>, %arg1: vector<4xi32>, %arg2: vector<4xf32>, %arg3: i32, %arg4: i32, %arg5: i32, %arg6: i16, %arg7: i16, %arg8: i32, %arg9: i16, %arg10: i16) {
    %0 = nvvm.mma.sp.block_scale A[%arg0] B[%arg1] C[%arg2] sparseMetadata[%arg3] selector[%arg4] scaleA[%arg5, %arg6, %arg7] scaleB[%arg8, %arg9, %arg10] {blockScaleFormat = #nvvm.block_scale_format<ue8m0>, kind = #nvvm.block_scale_kind<mxf8f6f4>, multiplicandAPtxType = #nvvm.mma_type<e2m3>, multiplicandBPtxType = #nvvm.mma_type<e2m3>, orderedMetadata, scaleVecSize = #nvvm.scale_vec_size<x1>, shape = #nvvm.shape<m = 16, n = 8, k = 64>} : (vector<4xi32>, vector<4xi32>, vector<4xf32>) -> !llvm.struct<(vector<4xf32>)>
    return
  }
  func.func @nvvm_mxf8f6f4_sp_blockscale_mma_e2m3_e3m2(%arg0: vector<4xi32>, %arg1: vector<4xi32>, %arg2: vector<4xf32>, %arg3: i32, %arg4: i32, %arg5: i32, %arg6: i16, %arg7: i16, %arg8: i32, %arg9: i16, %arg10: i16) {
    %0 = nvvm.mma.sp.block_scale A[%arg0] B[%arg1] C[%arg2] sparseMetadata[%arg3] selector[%arg4] scaleA[%arg5, %arg6, %arg7] scaleB[%arg8, %arg9, %arg10] {blockScaleFormat = #nvvm.block_scale_format<ue8m0>, kind = #nvvm.block_scale_kind<mxf8f6f4>, multiplicandAPtxType = #nvvm.mma_type<e2m3>, multiplicandBPtxType = #nvvm.mma_type<e3m2>, orderedMetadata, scaleVecSize = #nvvm.scale_vec_size<x1>, shape = #nvvm.shape<m = 16, n = 8, k = 64>} : (vector<4xi32>, vector<4xi32>, vector<4xf32>) -> !llvm.struct<(vector<4xf32>)>
    return
  }
  func.func @nvvm_mxf8f6f4_sp_blockscale_mma_e2m3_e4m3(%arg0: vector<4xi32>, %arg1: vector<4xi32>, %arg2: vector<4xf32>, %arg3: i32, %arg4: i32, %arg5: i32, %arg6: i16, %arg7: i16, %arg8: i32, %arg9: i16, %arg10: i16) {
    %0 = nvvm.mma.sp.block_scale A[%arg0] B[%arg1] C[%arg2] sparseMetadata[%arg3] selector[%arg4] scaleA[%arg5, %arg6, %arg7] scaleB[%arg8, %arg9, %arg10] {blockScaleFormat = #nvvm.block_scale_format<ue8m0>, kind = #nvvm.block_scale_kind<mxf8f6f4>, multiplicandAPtxType = #nvvm.mma_type<e2m3>, multiplicandBPtxType = #nvvm.mma_type<e4m3>, orderedMetadata, scaleVecSize = #nvvm.scale_vec_size<x1>, shape = #nvvm.shape<m = 16, n = 8, k = 64>} : (vector<4xi32>, vector<4xi32>, vector<4xf32>) -> !llvm.struct<(vector<4xf32>)>
    return
  }
  func.func @nvvm_mxf8f6f4_sp_blockscale_mma_e2m3_e5m2(%arg0: vector<4xi32>, %arg1: vector<4xi32>, %arg2: vector<4xf32>, %arg3: i32, %arg4: i32, %arg5: i32, %arg6: i16, %arg7: i16, %arg8: i32, %arg9: i16, %arg10: i16) {
    %0 = nvvm.mma.sp.block_scale A[%arg0] B[%arg1] C[%arg2] sparseMetadata[%arg3] selector[%arg4] scaleA[%arg5, %arg6, %arg7] scaleB[%arg8, %arg9, %arg10] {blockScaleFormat = #nvvm.block_scale_format<ue8m0>, kind = #nvvm.block_scale_kind<mxf8f6f4>, multiplicandAPtxType = #nvvm.mma_type<e2m3>, multiplicandBPtxType = #nvvm.mma_type<e5m2>, orderedMetadata, scaleVecSize = #nvvm.scale_vec_size<x1>, shape = #nvvm.shape<m = 16, n = 8, k = 64>} : (vector<4xi32>, vector<4xi32>, vector<4xf32>) -> !llvm.struct<(vector<4xf32>)>
    return
  }
  func.func @nvvm_mxf8f6f4_sp_blockscale_mma_e3m2_e2m1(%arg0: vector<4xi32>, %arg1: vector<4xi32>, %arg2: vector<4xf32>, %arg3: i32, %arg4: i32, %arg5: i32, %arg6: i16, %arg7: i16, %arg8: i32, %arg9: i16, %arg10: i16) {
    %0 = nvvm.mma.sp.block_scale A[%arg0] B[%arg1] C[%arg2] sparseMetadata[%arg3] selector[%arg4] scaleA[%arg5, %arg6, %arg7] scaleB[%arg8, %arg9, %arg10] {blockScaleFormat = #nvvm.block_scale_format<ue8m0>, kind = #nvvm.block_scale_kind<mxf8f6f4>, multiplicandAPtxType = #nvvm.mma_type<e3m2>, multiplicandBPtxType = #nvvm.mma_type<e2m1>, orderedMetadata, scaleVecSize = #nvvm.scale_vec_size<x1>, shape = #nvvm.shape<m = 16, n = 8, k = 64>} : (vector<4xi32>, vector<4xi32>, vector<4xf32>) -> !llvm.struct<(vector<4xf32>)>
    return
  }
  func.func @nvvm_mxf8f6f4_sp_blockscale_mma_e3m2_e2m3(%arg0: vector<4xi32>, %arg1: vector<4xi32>, %arg2: vector<4xf32>, %arg3: i32, %arg4: i32, %arg5: i32, %arg6: i16, %arg7: i16, %arg8: i32, %arg9: i16, %arg10: i16) {
    %0 = nvvm.mma.sp.block_scale A[%arg0] B[%arg1] C[%arg2] sparseMetadata[%arg3] selector[%arg4] scaleA[%arg5, %arg6, %arg7] scaleB[%arg8, %arg9, %arg10] {blockScaleFormat = #nvvm.block_scale_format<ue8m0>, kind = #nvvm.block_scale_kind<mxf8f6f4>, multiplicandAPtxType = #nvvm.mma_type<e3m2>, multiplicandBPtxType = #nvvm.mma_type<e2m3>, orderedMetadata, scaleVecSize = #nvvm.scale_vec_size<x1>, shape = #nvvm.shape<m = 16, n = 8, k = 64>} : (vector<4xi32>, vector<4xi32>, vector<4xf32>) -> !llvm.struct<(vector<4xf32>)>
    return
  }
  func.func @nvvm_mxf8f6f4_sp_blockscale_mma_e3m2_e3m2(%arg0: vector<4xi32>, %arg1: vector<4xi32>, %arg2: vector<4xf32>, %arg3: i32, %arg4: i32, %arg5: i32, %arg6: i16, %arg7: i16, %arg8: i32, %arg9: i16, %arg10: i16) {
    %0 = nvvm.mma.sp.block_scale A[%arg0] B[%arg1] C[%arg2] sparseMetadata[%arg3] selector[%arg4] scaleA[%arg5, %arg6, %arg7] scaleB[%arg8, %arg9, %arg10] {blockScaleFormat = #nvvm.block_scale_format<ue8m0>, kind = #nvvm.block_scale_kind<mxf8f6f4>, multiplicandAPtxType = #nvvm.mma_type<e3m2>, multiplicandBPtxType = #nvvm.mma_type<e3m2>, orderedMetadata, scaleVecSize = #nvvm.scale_vec_size<x1>, shape = #nvvm.shape<m = 16, n = 8, k = 64>} : (vector<4xi32>, vector<4xi32>, vector<4xf32>) -> !llvm.struct<(vector<4xf32>)>
    return
  }
  func.func @nvvm_mxf8f6f4_sp_blockscale_mma_e3m2_e4m3(%arg0: vector<4xi32>, %arg1: vector<4xi32>, %arg2: vector<4xf32>, %arg3: i32, %arg4: i32, %arg5: i32, %arg6: i16, %arg7: i16, %arg8: i32, %arg9: i16, %arg10: i16) {
    %0 = nvvm.mma.sp.block_scale A[%arg0] B[%arg1] C[%arg2] sparseMetadata[%arg3] selector[%arg4] scaleA[%arg5, %arg6, %arg7] scaleB[%arg8, %arg9, %arg10] {blockScaleFormat = #nvvm.block_scale_format<ue8m0>, kind = #nvvm.block_scale_kind<mxf8f6f4>, multiplicandAPtxType = #nvvm.mma_type<e3m2>, multiplicandBPtxType = #nvvm.mma_type<e4m3>, orderedMetadata, scaleVecSize = #nvvm.scale_vec_size<x1>, shape = #nvvm.shape<m = 16, n = 8, k = 64>} : (vector<4xi32>, vector<4xi32>, vector<4xf32>) -> !llvm.struct<(vector<4xf32>)>
    return
  }
  func.func @nvvm_mxf8f6f4_sp_blockscale_mma_e3m2_e5m2(%arg0: vector<4xi32>, %arg1: vector<4xi32>, %arg2: vector<4xf32>, %arg3: i32, %arg4: i32, %arg5: i32, %arg6: i16, %arg7: i16, %arg8: i32, %arg9: i16, %arg10: i16) {
    %0 = nvvm.mma.sp.block_scale A[%arg0] B[%arg1] C[%arg2] sparseMetadata[%arg3] selector[%arg4] scaleA[%arg5, %arg6, %arg7] scaleB[%arg8, %arg9, %arg10] {blockScaleFormat = #nvvm.block_scale_format<ue8m0>, kind = #nvvm.block_scale_kind<mxf8f6f4>, multiplicandAPtxType = #nvvm.mma_type<e3m2>, multiplicandBPtxType = #nvvm.mma_type<e5m2>, orderedMetadata, scaleVecSize = #nvvm.scale_vec_size<x1>, shape = #nvvm.shape<m = 16, n = 8, k = 64>} : (vector<4xi32>, vector<4xi32>, vector<4xf32>) -> !llvm.struct<(vector<4xf32>)>
    return
  }
  func.func @nvvm_mxf8f6f4_sp_blockscale_mma_e4m3_e2m1(%arg0: vector<4xi32>, %arg1: vector<4xi32>, %arg2: vector<4xf32>, %arg3: i32, %arg4: i32, %arg5: i32, %arg6: i16, %arg7: i16, %arg8: i32, %arg9: i16, %arg10: i16) {
    %0 = nvvm.mma.sp.block_scale A[%arg0] B[%arg1] C[%arg2] sparseMetadata[%arg3] selector[%arg4] scaleA[%arg5, %arg6, %arg7] scaleB[%arg8, %arg9, %arg10] {blockScaleFormat = #nvvm.block_scale_format<ue8m0>, kind = #nvvm.block_scale_kind<mxf8f6f4>, multiplicandAPtxType = #nvvm.mma_type<e4m3>, multiplicandBPtxType = #nvvm.mma_type<e2m1>, orderedMetadata, scaleVecSize = #nvvm.scale_vec_size<x1>, shape = #nvvm.shape<m = 16, n = 8, k = 64>} : (vector<4xi32>, vector<4xi32>, vector<4xf32>) -> !llvm.struct<(vector<4xf32>)>
    return
  }
  func.func @nvvm_mxf8f6f4_sp_blockscale_mma_e4m3_e2m3(%arg0: vector<4xi32>, %arg1: vector<4xi32>, %arg2: vector<4xf32>, %arg3: i32, %arg4: i32, %arg5: i32, %arg6: i16, %arg7: i16, %arg8: i32, %arg9: i16, %arg10: i16) {
    %0 = nvvm.mma.sp.block_scale A[%arg0] B[%arg1] C[%arg2] sparseMetadata[%arg3] selector[%arg4] scaleA[%arg5, %arg6, %arg7] scaleB[%arg8, %arg9, %arg10] {blockScaleFormat = #nvvm.block_scale_format<ue8m0>, kind = #nvvm.block_scale_kind<mxf8f6f4>, multiplicandAPtxType = #nvvm.mma_type<e4m3>, multiplicandBPtxType = #nvvm.mma_type<e2m3>, orderedMetadata, scaleVecSize = #nvvm.scale_vec_size<x1>, shape = #nvvm.shape<m = 16, n = 8, k = 64>} : (vector<4xi32>, vector<4xi32>, vector<4xf32>) -> !llvm.struct<(vector<4xf32>)>
    return
  }
  func.func @nvvm_mxf8f6f4_sp_blockscale_mma_e4m3_e3m2(%arg0: vector<4xi32>, %arg1: vector<4xi32>, %arg2: vector<4xf32>, %arg3: i32, %arg4: i32, %arg5: i32, %arg6: i16, %arg7: i16, %arg8: i32, %arg9: i16, %arg10: i16) {
    %0 = nvvm.mma.sp.block_scale A[%arg0] B[%arg1] C[%arg2] sparseMetadata[%arg3] selector[%arg4] scaleA[%arg5, %arg6, %arg7] scaleB[%arg8, %arg9, %arg10] {blockScaleFormat = #nvvm.block_scale_format<ue8m0>, kind = #nvvm.block_scale_kind<mxf8f6f4>, multiplicandAPtxType = #nvvm.mma_type<e4m3>, multiplicandBPtxType = #nvvm.mma_type<e3m2>, orderedMetadata, scaleVecSize = #nvvm.scale_vec_size<x1>, shape = #nvvm.shape<m = 16, n = 8, k = 64>} : (vector<4xi32>, vector<4xi32>, vector<4xf32>) -> !llvm.struct<(vector<4xf32>)>
    return
  }
  func.func @nvvm_mxf8f6f4_sp_blockscale_mma_e4m3_e4m3(%arg0: vector<4xi32>, %arg1: vector<4xi32>, %arg2: vector<4xf32>, %arg3: i32, %arg4: i32, %arg5: i32, %arg6: i16, %arg7: i16, %arg8: i32, %arg9: i16, %arg10: i16) {
    %0 = nvvm.mma.sp.block_scale A[%arg0] B[%arg1] C[%arg2] sparseMetadata[%arg3] selector[%arg4] scaleA[%arg5, %arg6, %arg7] scaleB[%arg8, %arg9, %arg10] {blockScaleFormat = #nvvm.block_scale_format<ue8m0>, kind = #nvvm.block_scale_kind<mxf8f6f4>, multiplicandAPtxType = #nvvm.mma_type<e4m3>, multiplicandBPtxType = #nvvm.mma_type<e4m3>, orderedMetadata, scaleVecSize = #nvvm.scale_vec_size<x1>, shape = #nvvm.shape<m = 16, n = 8, k = 64>} : (vector<4xi32>, vector<4xi32>, vector<4xf32>) -> !llvm.struct<(vector<4xf32>)>
    return
  }
  func.func @nvvm_mxf8f6f4_sp_blockscale_mma_e4m3_e5m2(%arg0: vector<4xi32>, %arg1: vector<4xi32>, %arg2: vector<4xf32>, %arg3: i32, %arg4: i32, %arg5: i32, %arg6: i16, %arg7: i16, %arg8: i32, %arg9: i16, %arg10: i16) {
    %0 = nvvm.mma.sp.block_scale A[%arg0] B[%arg1] C[%arg2] sparseMetadata[%arg3] selector[%arg4] scaleA[%arg5, %arg6, %arg7] scaleB[%arg8, %arg9, %arg10] {blockScaleFormat = #nvvm.block_scale_format<ue8m0>, kind = #nvvm.block_scale_kind<mxf8f6f4>, multiplicandAPtxType = #nvvm.mma_type<e4m3>, multiplicandBPtxType = #nvvm.mma_type<e5m2>, orderedMetadata, scaleVecSize = #nvvm.scale_vec_size<x1>, shape = #nvvm.shape<m = 16, n = 8, k = 64>} : (vector<4xi32>, vector<4xi32>, vector<4xf32>) -> !llvm.struct<(vector<4xf32>)>
    return
  }
  func.func @nvvm_mxf8f6f4_sp_blockscale_mma_e5m2_e2m1(%arg0: vector<4xi32>, %arg1: vector<4xi32>, %arg2: vector<4xf32>, %arg3: i32, %arg4: i32, %arg5: i32, %arg6: i16, %arg7: i16, %arg8: i32, %arg9: i16, %arg10: i16) {
    %0 = nvvm.mma.sp.block_scale A[%arg0] B[%arg1] C[%arg2] sparseMetadata[%arg3] selector[%arg4] scaleA[%arg5, %arg6, %arg7] scaleB[%arg8, %arg9, %arg10] {blockScaleFormat = #nvvm.block_scale_format<ue8m0>, kind = #nvvm.block_scale_kind<mxf8f6f4>, multiplicandAPtxType = #nvvm.mma_type<e5m2>, multiplicandBPtxType = #nvvm.mma_type<e2m1>, orderedMetadata, scaleVecSize = #nvvm.scale_vec_size<x1>, shape = #nvvm.shape<m = 16, n = 8, k = 64>} : (vector<4xi32>, vector<4xi32>, vector<4xf32>) -> !llvm.struct<(vector<4xf32>)>
    return
  }
  func.func @nvvm_mxf8f6f4_sp_blockscale_mma_e5m2_e2m3(%arg0: vector<4xi32>, %arg1: vector<4xi32>, %arg2: vector<4xf32>, %arg3: i32, %arg4: i32, %arg5: i32, %arg6: i16, %arg7: i16, %arg8: i32, %arg9: i16, %arg10: i16) {
    %0 = nvvm.mma.sp.block_scale A[%arg0] B[%arg1] C[%arg2] sparseMetadata[%arg3] selector[%arg4] scaleA[%arg5, %arg6, %arg7] scaleB[%arg8, %arg9, %arg10] {blockScaleFormat = #nvvm.block_scale_format<ue8m0>, kind = #nvvm.block_scale_kind<mxf8f6f4>, multiplicandAPtxType = #nvvm.mma_type<e5m2>, multiplicandBPtxType = #nvvm.mma_type<e2m3>, orderedMetadata, scaleVecSize = #nvvm.scale_vec_size<x1>, shape = #nvvm.shape<m = 16, n = 8, k = 64>} : (vector<4xi32>, vector<4xi32>, vector<4xf32>) -> !llvm.struct<(vector<4xf32>)>
    return
  }
  func.func @nvvm_mxf8f6f4_sp_blockscale_mma_e5m2_e3m2(%arg0: vector<4xi32>, %arg1: vector<4xi32>, %arg2: vector<4xf32>, %arg3: i32, %arg4: i32, %arg5: i32, %arg6: i16, %arg7: i16, %arg8: i32, %arg9: i16, %arg10: i16) {
    %0 = nvvm.mma.sp.block_scale A[%arg0] B[%arg1] C[%arg2] sparseMetadata[%arg3] selector[%arg4] scaleA[%arg5, %arg6, %arg7] scaleB[%arg8, %arg9, %arg10] {blockScaleFormat = #nvvm.block_scale_format<ue8m0>, kind = #nvvm.block_scale_kind<mxf8f6f4>, multiplicandAPtxType = #nvvm.mma_type<e5m2>, multiplicandBPtxType = #nvvm.mma_type<e3m2>, orderedMetadata, scaleVecSize = #nvvm.scale_vec_size<x1>, shape = #nvvm.shape<m = 16, n = 8, k = 64>} : (vector<4xi32>, vector<4xi32>, vector<4xf32>) -> !llvm.struct<(vector<4xf32>)>
    return
  }
  func.func @nvvm_mxf8f6f4_sp_blockscale_mma_e5m2_e4m3(%arg0: vector<4xi32>, %arg1: vector<4xi32>, %arg2: vector<4xf32>, %arg3: i32, %arg4: i32, %arg5: i32, %arg6: i16, %arg7: i16, %arg8: i32, %arg9: i16, %arg10: i16) {
    %0 = nvvm.mma.sp.block_scale A[%arg0] B[%arg1] C[%arg2] sparseMetadata[%arg3] selector[%arg4] scaleA[%arg5, %arg6, %arg7] scaleB[%arg8, %arg9, %arg10] {blockScaleFormat = #nvvm.block_scale_format<ue8m0>, kind = #nvvm.block_scale_kind<mxf8f6f4>, multiplicandAPtxType = #nvvm.mma_type<e5m2>, multiplicandBPtxType = #nvvm.mma_type<e4m3>, orderedMetadata, scaleVecSize = #nvvm.scale_vec_size<x1>, shape = #nvvm.shape<m = 16, n = 8, k = 64>} : (vector<4xi32>, vector<4xi32>, vector<4xf32>) -> !llvm.struct<(vector<4xf32>)>
    return
  }
  func.func @nvvm_mxf8f6f4_sp_blockscale_mma_e5m2_e5m2(%arg0: vector<4xi32>, %arg1: vector<4xi32>, %arg2: vector<4xf32>, %arg3: i32, %arg4: i32, %arg5: i32, %arg6: i16, %arg7: i16, %arg8: i32, %arg9: i16, %arg10: i16) {
    %0 = nvvm.mma.sp.block_scale A[%arg0] B[%arg1] C[%arg2] sparseMetadata[%arg3] selector[%arg4] scaleA[%arg5, %arg6, %arg7] scaleB[%arg8, %arg9, %arg10] {blockScaleFormat = #nvvm.block_scale_format<ue8m0>, kind = #nvvm.block_scale_kind<mxf8f6f4>, multiplicandAPtxType = #nvvm.mma_type<e5m2>, multiplicandBPtxType = #nvvm.mma_type<e5m2>, orderedMetadata, scaleVecSize = #nvvm.scale_vec_size<x1>, shape = #nvvm.shape<m = 16, n = 8, k = 64>} : (vector<4xi32>, vector<4xi32>, vector<4xf32>) -> !llvm.struct<(vector<4xf32>)>
    return
  }
  func.func @nvvm_mxf4_sp_blockscale_mma(%arg0: vector<4xi32>, %arg1: vector<4xi32>, %arg2: vector<4xf32>, %arg3: i32, %arg4: i32, %arg5: i32, %arg6: i16, %arg7: i16, %arg8: i32, %arg9: i16, %arg10: i16) {
    %0 = nvvm.mma.sp.block_scale A[%arg0] B[%arg1] C[%arg2] sparseMetadata[%arg3] selector[%arg4] scaleA[%arg5, %arg6, %arg7] scaleB[%arg8, %arg9, %arg10] {blockScaleFormat = #nvvm.block_scale_format<ue8m0>, kind = #nvvm.block_scale_kind<mxf4>, multiplicandAPtxType = #nvvm.mma_type<e2m1>, multiplicandBPtxType = #nvvm.mma_type<e2m1>, orderedMetadata, scaleVecSize = #nvvm.scale_vec_size<x2>, shape = #nvvm.shape<m = 16, n = 8, k = 128>} : (vector<4xi32>, vector<4xi32>, vector<4xf32>) -> !llvm.struct<(vector<4xf32>)>
    return
  }
  func.func @nvvm_mxf4nvf4_sp_blockscale_mma_ue8m0(%arg0: vector<4xi32>, %arg1: vector<4xi32>, %arg2: vector<4xf32>, %arg3: i32, %arg4: i32, %arg5: i32, %arg6: i16, %arg7: i16, %arg8: i32, %arg9: i16, %arg10: i16) {
    %0 = nvvm.mma.sp.block_scale A[%arg0] B[%arg1] C[%arg2] sparseMetadata[%arg3] selector[%arg4] scaleA[%arg5, %arg6, %arg7] scaleB[%arg8, %arg9, %arg10] {blockScaleFormat = #nvvm.block_scale_format<ue8m0>, kind = #nvvm.block_scale_kind<mxf4nvf4>, multiplicandAPtxType = #nvvm.mma_type<e2m1>, multiplicandBPtxType = #nvvm.mma_type<e2m1>, orderedMetadata, scaleVecSize = #nvvm.scale_vec_size<x2>, shape = #nvvm.shape<m = 16, n = 8, k = 128>} : (vector<4xi32>, vector<4xi32>, vector<4xf32>) -> !llvm.struct<(vector<4xf32>)>
    return
  }
  func.func @nvvm_mxf4nvf4_sp_blockscale_mma_ue4m3(%arg0: vector<4xi32>, %arg1: vector<4xi32>, %arg2: vector<4xf32>, %arg3: i32, %arg4: i32, %arg5: i32, %arg6: i16, %arg7: i16, %arg8: i32, %arg9: i16, %arg10: i16) {
    %0 = nvvm.mma.sp.block_scale A[%arg0] B[%arg1] C[%arg2] sparseMetadata[%arg3] selector[%arg4] scaleA[%arg5, %arg6, %arg7] scaleB[%arg8, %arg9, %arg10] {blockScaleFormat = #nvvm.block_scale_format<ue4m3>, kind = #nvvm.block_scale_kind<mxf4nvf4>, multiplicandAPtxType = #nvvm.mma_type<e2m1>, multiplicandBPtxType = #nvvm.mma_type<e2m1>, orderedMetadata, scaleVecSize = #nvvm.scale_vec_size<x4>, shape = #nvvm.shape<m = 16, n = 8, k = 128>} : (vector<4xi32>, vector<4xi32>, vector<4xf32>) -> !llvm.struct<(vector<4xf32>)>
    return
  }
}

