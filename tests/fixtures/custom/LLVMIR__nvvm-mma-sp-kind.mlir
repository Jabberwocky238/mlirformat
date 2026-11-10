module {
  func.func @nvvm_mma_sp_kind_m16n8k64_e4m3_f16(%arg0: i32, %arg1: i32, %arg2: i32, %arg3: i32, %arg4: i32, %arg5: i32, %arg6: i32, %arg7: i32, %arg8: vector<2xf16>, %arg9: vector<2xf16>, %arg10: i32) -> !llvm.struct<(vector<2xf16>, vector<2xf16>)> {
    %0 = llvm.mlir.constant(0 : i32) : i32
    %1 = nvvm.mma.sp.sync A[%arg0, %arg1, %arg2, %arg3] B[%arg4, %arg5, %arg6, %arg7] C[%arg8, %arg9] sparseMetadata[%arg10] selector[%0] {kind = #nvvm.mma_kind<f8f6f4>, multiplicandAPtxType = #nvvm.mma_type<e4m3>, multiplicandBPtxType = #nvvm.mma_type<e4m3>, orderedMetadata, shape = #nvvm.shape<m = 16, n = 8, k = 64>} : (i32, i32, vector<2xf16>) -> !llvm.struct<(vector<2xf16>, vector<2xf16>)>
    return %1 : !llvm.struct<(vector<2xf16>, vector<2xf16>)>
  }
  func.func @nvvm_mma_sp_kind_m16n8k64_e4m3_f32(%arg0: i32, %arg1: i32, %arg2: i32, %arg3: i32, %arg4: i32, %arg5: i32, %arg6: i32, %arg7: i32, %arg8: f32, %arg9: f32, %arg10: f32, %arg11: f32, %arg12: i32) -> !llvm.struct<(f32, f32, f32, f32)> {
    %0 = llvm.mlir.constant(0 : i32) : i32
    %1 = nvvm.mma.sp.sync A[%arg0, %arg1, %arg2, %arg3] B[%arg4, %arg5, %arg6, %arg7] C[%arg8, %arg9, %arg10, %arg11] sparseMetadata[%arg12] selector[%0] {kind = #nvvm.mma_kind<f8f6f4>, multiplicandAPtxType = #nvvm.mma_type<e4m3>, multiplicandBPtxType = #nvvm.mma_type<e4m3>, orderedMetadata, shape = #nvvm.shape<m = 16, n = 8, k = 64>} : (i32, i32, f32) -> !llvm.struct<(f32, f32, f32, f32)>
    return %1 : !llvm.struct<(f32, f32, f32, f32)>
  }
  func.func @nvvm_mma_sp_kind_m16n8k64_e5m2_f16(%arg0: i32, %arg1: i32, %arg2: i32, %arg3: i32, %arg4: i32, %arg5: i32, %arg6: i32, %arg7: i32, %arg8: vector<2xf16>, %arg9: vector<2xf16>, %arg10: i32) -> !llvm.struct<(vector<2xf16>, vector<2xf16>)> {
    %0 = llvm.mlir.constant(0 : i32) : i32
    %1 = nvvm.mma.sp.sync A[%arg0, %arg1, %arg2, %arg3] B[%arg4, %arg5, %arg6, %arg7] C[%arg8, %arg9] sparseMetadata[%arg10] selector[%0] {kind = #nvvm.mma_kind<f8f6f4>, multiplicandAPtxType = #nvvm.mma_type<e5m2>, multiplicandBPtxType = #nvvm.mma_type<e5m2>, orderedMetadata, shape = #nvvm.shape<m = 16, n = 8, k = 64>} : (i32, i32, vector<2xf16>) -> !llvm.struct<(vector<2xf16>, vector<2xf16>)>
    return %1 : !llvm.struct<(vector<2xf16>, vector<2xf16>)>
  }
  func.func @nvvm_mma_sp_kind_m16n8k64_e5m2_f32(%arg0: i32, %arg1: i32, %arg2: i32, %arg3: i32, %arg4: i32, %arg5: i32, %arg6: i32, %arg7: i32, %arg8: f32, %arg9: f32, %arg10: f32, %arg11: f32, %arg12: i32) -> !llvm.struct<(f32, f32, f32, f32)> {
    %0 = llvm.mlir.constant(0 : i32) : i32
    %1 = nvvm.mma.sp.sync A[%arg0, %arg1, %arg2, %arg3] B[%arg4, %arg5, %arg6, %arg7] C[%arg8, %arg9, %arg10, %arg11] sparseMetadata[%arg12] selector[%0] {kind = #nvvm.mma_kind<f8f6f4>, multiplicandAPtxType = #nvvm.mma_type<e5m2>, multiplicandBPtxType = #nvvm.mma_type<e5m2>, orderedMetadata, shape = #nvvm.shape<m = 16, n = 8, k = 64>} : (i32, i32, f32) -> !llvm.struct<(f32, f32, f32, f32)>
    return %1 : !llvm.struct<(f32, f32, f32, f32)>
  }
  func.func @nvvm_mma_sp_kind_m16n8k64_e3m2_f16(%arg0: i32, %arg1: i32, %arg2: i32, %arg3: i32, %arg4: i32, %arg5: i32, %arg6: i32, %arg7: i32, %arg8: vector<2xf16>, %arg9: vector<2xf16>, %arg10: i32) -> !llvm.struct<(vector<2xf16>, vector<2xf16>)> {
    %0 = llvm.mlir.constant(0 : i32) : i32
    %1 = nvvm.mma.sp.sync A[%arg0, %arg1, %arg2, %arg3] B[%arg4, %arg5, %arg6, %arg7] C[%arg8, %arg9] sparseMetadata[%arg10] selector[%0] {kind = #nvvm.mma_kind<f8f6f4>, multiplicandAPtxType = #nvvm.mma_type<e3m2>, multiplicandBPtxType = #nvvm.mma_type<e3m2>, orderedMetadata, shape = #nvvm.shape<m = 16, n = 8, k = 64>} : (i32, i32, vector<2xf16>) -> !llvm.struct<(vector<2xf16>, vector<2xf16>)>
    return %1 : !llvm.struct<(vector<2xf16>, vector<2xf16>)>
  }
  func.func @nvvm_mma_sp_kind_m16n8k64_e3m2_f32(%arg0: i32, %arg1: i32, %arg2: i32, %arg3: i32, %arg4: i32, %arg5: i32, %arg6: i32, %arg7: i32, %arg8: f32, %arg9: f32, %arg10: f32, %arg11: f32, %arg12: i32) -> !llvm.struct<(f32, f32, f32, f32)> {
    %0 = llvm.mlir.constant(0 : i32) : i32
    %1 = nvvm.mma.sp.sync A[%arg0, %arg1, %arg2, %arg3] B[%arg4, %arg5, %arg6, %arg7] C[%arg8, %arg9, %arg10, %arg11] sparseMetadata[%arg12] selector[%0] {kind = #nvvm.mma_kind<f8f6f4>, multiplicandAPtxType = #nvvm.mma_type<e3m2>, multiplicandBPtxType = #nvvm.mma_type<e3m2>, orderedMetadata, shape = #nvvm.shape<m = 16, n = 8, k = 64>} : (i32, i32, f32) -> !llvm.struct<(f32, f32, f32, f32)>
    return %1 : !llvm.struct<(f32, f32, f32, f32)>
  }
  func.func @nvvm_mma_sp_kind_m16n8k64_e2m3_f16(%arg0: i32, %arg1: i32, %arg2: i32, %arg3: i32, %arg4: i32, %arg5: i32, %arg6: i32, %arg7: i32, %arg8: vector<2xf16>, %arg9: vector<2xf16>, %arg10: i32) -> !llvm.struct<(vector<2xf16>, vector<2xf16>)> {
    %0 = llvm.mlir.constant(0 : i32) : i32
    %1 = nvvm.mma.sp.sync A[%arg0, %arg1, %arg2, %arg3] B[%arg4, %arg5, %arg6, %arg7] C[%arg8, %arg9] sparseMetadata[%arg10] selector[%0] {kind = #nvvm.mma_kind<f8f6f4>, multiplicandAPtxType = #nvvm.mma_type<e2m3>, multiplicandBPtxType = #nvvm.mma_type<e2m3>, orderedMetadata, shape = #nvvm.shape<m = 16, n = 8, k = 64>} : (i32, i32, vector<2xf16>) -> !llvm.struct<(vector<2xf16>, vector<2xf16>)>
    return %1 : !llvm.struct<(vector<2xf16>, vector<2xf16>)>
  }
  func.func @nvvm_mma_sp_kind_m16n8k64_e2m3_f32(%arg0: i32, %arg1: i32, %arg2: i32, %arg3: i32, %arg4: i32, %arg5: i32, %arg6: i32, %arg7: i32, %arg8: f32, %arg9: f32, %arg10: f32, %arg11: f32, %arg12: i32) -> !llvm.struct<(f32, f32, f32, f32)> {
    %0 = llvm.mlir.constant(0 : i32) : i32
    %1 = nvvm.mma.sp.sync A[%arg0, %arg1, %arg2, %arg3] B[%arg4, %arg5, %arg6, %arg7] C[%arg8, %arg9, %arg10, %arg11] sparseMetadata[%arg12] selector[%0] {kind = #nvvm.mma_kind<f8f6f4>, multiplicandAPtxType = #nvvm.mma_type<e2m3>, multiplicandBPtxType = #nvvm.mma_type<e2m3>, orderedMetadata, shape = #nvvm.shape<m = 16, n = 8, k = 64>} : (i32, i32, f32) -> !llvm.struct<(f32, f32, f32, f32)>
    return %1 : !llvm.struct<(f32, f32, f32, f32)>
  }
  func.func @nvvm_mma_sp_kind_m16n8k64_e2m1_f16(%arg0: i32, %arg1: i32, %arg2: i32, %arg3: i32, %arg4: i32, %arg5: i32, %arg6: i32, %arg7: i32, %arg8: vector<2xf16>, %arg9: vector<2xf16>, %arg10: i32) -> !llvm.struct<(vector<2xf16>, vector<2xf16>)> {
    %0 = llvm.mlir.constant(0 : i32) : i32
    %1 = nvvm.mma.sp.sync A[%arg0, %arg1, %arg2, %arg3] B[%arg4, %arg5, %arg6, %arg7] C[%arg8, %arg9] sparseMetadata[%arg10] selector[%0] {kind = #nvvm.mma_kind<f8f6f4>, multiplicandAPtxType = #nvvm.mma_type<e2m1>, multiplicandBPtxType = #nvvm.mma_type<e2m1>, orderedMetadata, shape = #nvvm.shape<m = 16, n = 8, k = 64>} : (i32, i32, vector<2xf16>) -> !llvm.struct<(vector<2xf16>, vector<2xf16>)>
    return %1 : !llvm.struct<(vector<2xf16>, vector<2xf16>)>
  }
  func.func @nvvm_mma_sp_kind_m16n8k64_e2m1_f32(%arg0: i32, %arg1: i32, %arg2: i32, %arg3: i32, %arg4: i32, %arg5: i32, %arg6: i32, %arg7: i32, %arg8: f32, %arg9: f32, %arg10: f32, %arg11: f32, %arg12: i32) -> !llvm.struct<(f32, f32, f32, f32)> {
    %0 = llvm.mlir.constant(0 : i32) : i32
    %1 = nvvm.mma.sp.sync A[%arg0, %arg1, %arg2, %arg3] B[%arg4, %arg5, %arg6, %arg7] C[%arg8, %arg9, %arg10, %arg11] sparseMetadata[%arg12] selector[%0] {kind = #nvvm.mma_kind<f8f6f4>, multiplicandAPtxType = #nvvm.mma_type<e2m1>, multiplicandBPtxType = #nvvm.mma_type<e2m1>, orderedMetadata, shape = #nvvm.shape<m = 16, n = 8, k = 64>} : (i32, i32, f32) -> !llvm.struct<(f32, f32, f32, f32)>
    return %1 : !llvm.struct<(f32, f32, f32, f32)>
  }
}

