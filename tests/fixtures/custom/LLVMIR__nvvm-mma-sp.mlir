module {
  func.func @nvvm_mma_sp_m16n8k16_f16_f16(%arg0: vector<2xf16>, %arg1: vector<2xf16>, %arg2: vector<2xf16>, %arg3: vector<2xf16>, %arg4: vector<2xf16>, %arg5: vector<2xf16>, %arg6: i32, %arg7: i32) {
    %0 = nvvm.mma.sp.sync A[%arg0, %arg1] B[%arg2, %arg3] C[%arg4, %arg5] sparseMetadata[%arg6] selector[%arg7] {shape = #nvvm.shape<m = 16, n = 8, k = 16>} : (vector<2xf16>, vector<2xf16>, vector<2xf16>) -> !llvm.struct<(vector<2xf16>, vector<2xf16>)>
    return
  }
  func.func @nvvm_mma_sp_m16n8k16_f16_f32(%arg0: vector<2xf16>, %arg1: vector<2xf16>, %arg2: vector<2xf16>, %arg3: vector<2xf16>, %arg4: f32, %arg5: f32, %arg6: f32, %arg7: f32, %arg8: i32, %arg9: i32) {
    %0 = nvvm.mma.sp.sync A[%arg0, %arg1] B[%arg2, %arg3] C[%arg4, %arg5, %arg6, %arg7] sparseMetadata[%arg8] selector[%arg9] {shape = #nvvm.shape<m = 16, n = 8, k = 16>} : (vector<2xf16>, vector<2xf16>, f32) -> !llvm.struct<(f32, f32, f32, f32)>
    return
  }
  func.func @nvvm_mma_sp_m16n8k32_f16_f16(%arg0: vector<2xf16>, %arg1: vector<2xf16>, %arg2: vector<2xf16>, %arg3: vector<2xf16>, %arg4: vector<2xf16>, %arg5: vector<2xf16>, %arg6: vector<2xf16>, %arg7: vector<2xf16>, %arg8: vector<2xf16>, %arg9: vector<2xf16>, %arg10: i32, %arg11: i32) {
    %0 = nvvm.mma.sp.sync A[%arg0, %arg1, %arg2, %arg3] B[%arg4, %arg5, %arg6, %arg7] C[%arg8, %arg9] sparseMetadata[%arg10] selector[%arg11] {shape = #nvvm.shape<m = 16, n = 8, k = 32>} : (vector<2xf16>, vector<2xf16>, vector<2xf16>) -> !llvm.struct<(vector<2xf16>, vector<2xf16>)>
    return
  }
  func.func @nvvm_mma_sp_m16n8k32_f16_f32(%arg0: vector<2xf16>, %arg1: vector<2xf16>, %arg2: vector<2xf16>, %arg3: vector<2xf16>, %arg4: vector<2xf16>, %arg5: vector<2xf16>, %arg6: vector<2xf16>, %arg7: vector<2xf16>, %arg8: f32, %arg9: f32, %arg10: f32, %arg11: f32, %arg12: i32, %arg13: i32) {
    %0 = nvvm.mma.sp.sync A[%arg0, %arg1, %arg2, %arg3] B[%arg4, %arg5, %arg6, %arg7] C[%arg8, %arg9, %arg10, %arg11] sparseMetadata[%arg12] selector[%arg13] {shape = #nvvm.shape<m = 16, n = 8, k = 32>} : (vector<2xf16>, vector<2xf16>, f32) -> !llvm.struct<(f32, f32, f32, f32)>
    return
  }
  func.func @nvvm_mma_sp_m16n8k16_bf16_f32(%arg0: i32, %arg1: i32, %arg2: i32, %arg3: i32, %arg4: f32, %arg5: f32, %arg6: f32, %arg7: f32, %arg8: i32, %arg9: i32) {
    %0 = nvvm.mma.sp.sync A[%arg0, %arg1] B[%arg2, %arg3] C[%arg4, %arg5, %arg6, %arg7] sparseMetadata[%arg8] selector[%arg9] {multiplicandAPtxType = #nvvm.mma_type<bf16>, multiplicandBPtxType = #nvvm.mma_type<bf16>, shape = #nvvm.shape<m = 16, n = 8, k = 16>} : (i32, i32, f32) -> !llvm.struct<(f32, f32, f32, f32)>
    return
  }
  func.func @nvvm_mma_sp_m16n8k32_bf16_f32(%arg0: i32, %arg1: i32, %arg2: i32, %arg3: i32, %arg4: i32, %arg5: i32, %arg6: i32, %arg7: i32, %arg8: f32, %arg9: f32, %arg10: f32, %arg11: f32, %arg12: i32, %arg13: i32) {
    %0 = nvvm.mma.sp.sync A[%arg0, %arg1, %arg2, %arg3] B[%arg4, %arg5, %arg6, %arg7] C[%arg8, %arg9, %arg10, %arg11] sparseMetadata[%arg12] selector[%arg13] {multiplicandAPtxType = #nvvm.mma_type<bf16>, multiplicandBPtxType = #nvvm.mma_type<bf16>, shape = #nvvm.shape<m = 16, n = 8, k = 32>} : (i32, i32, f32) -> !llvm.struct<(f32, f32, f32, f32)>
    return
  }
  func.func @nvvm_mma_sp_m16n8k8_tf32_f32(%arg0: i32, %arg1: i32, %arg2: i32, %arg3: i32, %arg4: f32, %arg5: f32, %arg6: f32, %arg7: f32, %arg8: i32, %arg9: i32) {
    %0 = nvvm.mma.sp.sync A[%arg0, %arg1] B[%arg2, %arg3] C[%arg4, %arg5, %arg6, %arg7] sparseMetadata[%arg8] selector[%arg9] {multiplicandAPtxType = #nvvm.mma_type<tf32>, multiplicandBPtxType = #nvvm.mma_type<tf32>, shape = #nvvm.shape<m = 16, n = 8, k = 8>} : (i32, i32, f32) -> !llvm.struct<(f32, f32, f32, f32)>
    return
  }
  func.func @nvvm_mma_sp_m16n8k16_tf32_f32(%arg0: i32, %arg1: i32, %arg2: i32, %arg3: i32, %arg4: i32, %arg5: i32, %arg6: i32, %arg7: i32, %arg8: f32, %arg9: f32, %arg10: f32, %arg11: f32, %arg12: i32, %arg13: i32) {
    %0 = nvvm.mma.sp.sync A[%arg0, %arg1, %arg2, %arg3] B[%arg4, %arg5, %arg6, %arg7] C[%arg8, %arg9, %arg10, %arg11] sparseMetadata[%arg12] selector[%arg13] {multiplicandAPtxType = #nvvm.mma_type<tf32>, multiplicandBPtxType = #nvvm.mma_type<tf32>, shape = #nvvm.shape<m = 16, n = 8, k = 16>} : (i32, i32, f32) -> !llvm.struct<(f32, f32, f32, f32)>
    return
  }
  func.func @nvvm_mma_sp_m16n8k32_s8_s32(%arg0: i32, %arg1: i32, %arg2: i32, %arg3: i32, %arg4: i32, %arg5: i32, %arg6: i32, %arg7: i32, %arg8: i32, %arg9: i32) {
    %0 = nvvm.mma.sp.sync A[%arg0, %arg1] B[%arg2, %arg3] C[%arg4, %arg5, %arg6, %arg7] sparseMetadata[%arg8] selector[%arg9] {intOverflowBehavior = #nvvm.mma_int_overflow<wrapped>, multiplicandAPtxType = #nvvm.mma_type<s8>, multiplicandBPtxType = #nvvm.mma_type<s8>, shape = #nvvm.shape<m = 16, n = 8, k = 32>} : (i32, i32, i32) -> !llvm.struct<(i32, i32, i32, i32)>
    return
  }
  func.func @nvvm_mma_sp_m16n8k32_s8_s32_satfinite(%arg0: i32, %arg1: i32, %arg2: i32, %arg3: i32, %arg4: i32, %arg5: i32, %arg6: i32, %arg7: i32, %arg8: i32, %arg9: i32) {
    %0 = nvvm.mma.sp.sync A[%arg0, %arg1] B[%arg2, %arg3] C[%arg4, %arg5, %arg6, %arg7] sparseMetadata[%arg8] selector[%arg9] {intOverflowBehavior = #nvvm.mma_int_overflow<satfinite>, multiplicandAPtxType = #nvvm.mma_type<s8>, multiplicandBPtxType = #nvvm.mma_type<s8>, shape = #nvvm.shape<m = 16, n = 8, k = 32>} : (i32, i32, i32) -> !llvm.struct<(i32, i32, i32, i32)>
    return
  }
  func.func @nvvm_mma_sp_m16n8k64_s8_s32(%arg0: i32, %arg1: i32, %arg2: i32, %arg3: i32, %arg4: i32, %arg5: i32, %arg6: i32, %arg7: i32, %arg8: i32, %arg9: i32, %arg10: i32, %arg11: i32, %arg12: i32, %arg13: i32) {
    %0 = nvvm.mma.sp.sync A[%arg0, %arg1, %arg2, %arg3] B[%arg4, %arg5, %arg6, %arg7] C[%arg8, %arg9, %arg10, %arg11] sparseMetadata[%arg12] selector[%arg13] {intOverflowBehavior = #nvvm.mma_int_overflow<wrapped>, multiplicandAPtxType = #nvvm.mma_type<s8>, multiplicandBPtxType = #nvvm.mma_type<s8>, shape = #nvvm.shape<m = 16, n = 8, k = 64>} : (i32, i32, i32) -> !llvm.struct<(i32, i32, i32, i32)>
    return
  }
  func.func @nvvm_mma_sp_m16n8k32_u8_s32(%arg0: i32, %arg1: i32, %arg2: i32, %arg3: i32, %arg4: i32, %arg5: i32, %arg6: i32, %arg7: i32, %arg8: i32, %arg9: i32) {
    %0 = nvvm.mma.sp.sync A[%arg0, %arg1] B[%arg2, %arg3] C[%arg4, %arg5, %arg6, %arg7] sparseMetadata[%arg8] selector[%arg9] {intOverflowBehavior = #nvvm.mma_int_overflow<wrapped>, multiplicandAPtxType = #nvvm.mma_type<u8>, multiplicandBPtxType = #nvvm.mma_type<u8>, shape = #nvvm.shape<m = 16, n = 8, k = 32>} : (i32, i32, i32) -> !llvm.struct<(i32, i32, i32, i32)>
    return
  }
  func.func @nvvm_mma_sp_m16n8k64_u8_s32(%arg0: i32, %arg1: i32, %arg2: i32, %arg3: i32, %arg4: i32, %arg5: i32, %arg6: i32, %arg7: i32, %arg8: i32, %arg9: i32, %arg10: i32, %arg11: i32, %arg12: i32, %arg13: i32) {
    %0 = nvvm.mma.sp.sync A[%arg0, %arg1, %arg2, %arg3] B[%arg4, %arg5, %arg6, %arg7] C[%arg8, %arg9, %arg10, %arg11] sparseMetadata[%arg12] selector[%arg13] {intOverflowBehavior = #nvvm.mma_int_overflow<wrapped>, multiplicandAPtxType = #nvvm.mma_type<u8>, multiplicandBPtxType = #nvvm.mma_type<u8>, shape = #nvvm.shape<m = 16, n = 8, k = 64>} : (i32, i32, i32) -> !llvm.struct<(i32, i32, i32, i32)>
    return
  }
  func.func @nvvm_mma_sp_m16n8k64_s4_s32(%arg0: i32, %arg1: i32, %arg2: i32, %arg3: i32, %arg4: i32, %arg5: i32, %arg6: i32, %arg7: i32, %arg8: i32, %arg9: i32) {
    %0 = nvvm.mma.sp.sync A[%arg0, %arg1] B[%arg2, %arg3] C[%arg4, %arg5, %arg6, %arg7] sparseMetadata[%arg8] selector[%arg9] {intOverflowBehavior = #nvvm.mma_int_overflow<wrapped>, multiplicandAPtxType = #nvvm.mma_type<s4>, multiplicandBPtxType = #nvvm.mma_type<s4>, shape = #nvvm.shape<m = 16, n = 8, k = 64>} : (i32, i32, i32) -> !llvm.struct<(i32, i32, i32, i32)>
    return
  }
  func.func @nvvm_mma_sp_m16n8k128_s4_s32(%arg0: i32, %arg1: i32, %arg2: i32, %arg3: i32, %arg4: i32, %arg5: i32, %arg6: i32, %arg7: i32, %arg8: i32, %arg9: i32, %arg10: i32, %arg11: i32, %arg12: i32, %arg13: i32) {
    %0 = nvvm.mma.sp.sync A[%arg0, %arg1, %arg2, %arg3] B[%arg4, %arg5, %arg6, %arg7] C[%arg8, %arg9, %arg10, %arg11] sparseMetadata[%arg12] selector[%arg13] {intOverflowBehavior = #nvvm.mma_int_overflow<wrapped>, multiplicandAPtxType = #nvvm.mma_type<s4>, multiplicandBPtxType = #nvvm.mma_type<s4>, shape = #nvvm.shape<m = 16, n = 8, k = 128>} : (i32, i32, i32) -> !llvm.struct<(i32, i32, i32, i32)>
    return
  }
  func.func @nvvm_mma_sp_m16n8k64_u4_s32(%arg0: i32, %arg1: i32, %arg2: i32, %arg3: i32, %arg4: i32, %arg5: i32, %arg6: i32, %arg7: i32, %arg8: i32, %arg9: i32) {
    %0 = nvvm.mma.sp.sync A[%arg0, %arg1] B[%arg2, %arg3] C[%arg4, %arg5, %arg6, %arg7] sparseMetadata[%arg8] selector[%arg9] {intOverflowBehavior = #nvvm.mma_int_overflow<wrapped>, multiplicandAPtxType = #nvvm.mma_type<u4>, multiplicandBPtxType = #nvvm.mma_type<u4>, shape = #nvvm.shape<m = 16, n = 8, k = 64>} : (i32, i32, i32) -> !llvm.struct<(i32, i32, i32, i32)>
    return
  }
  func.func @nvvm_mma_sp_m16n8k128_u4_s32(%arg0: i32, %arg1: i32, %arg2: i32, %arg3: i32, %arg4: i32, %arg5: i32, %arg6: i32, %arg7: i32, %arg8: i32, %arg9: i32, %arg10: i32, %arg11: i32, %arg12: i32, %arg13: i32) {
    %0 = nvvm.mma.sp.sync A[%arg0, %arg1, %arg2, %arg3] B[%arg4, %arg5, %arg6, %arg7] C[%arg8, %arg9, %arg10, %arg11] sparseMetadata[%arg12] selector[%arg13] {intOverflowBehavior = #nvvm.mma_int_overflow<wrapped>, multiplicandAPtxType = #nvvm.mma_type<u4>, multiplicandBPtxType = #nvvm.mma_type<u4>, shape = #nvvm.shape<m = 16, n = 8, k = 128>} : (i32, i32, i32) -> !llvm.struct<(i32, i32, i32, i32)>
    return
  }
  func.func @nvvm_mma_sp_m16n8k64_e4m3_f16(%arg0: i32, %arg1: i32, %arg2: i32, %arg3: i32, %arg4: vector<2xf16>, %arg5: vector<2xf16>, %arg6: i32, %arg7: i32) {
    %0 = nvvm.mma.sp.sync A[%arg0, %arg1] B[%arg2, %arg3] C[%arg4, %arg5] sparseMetadata[%arg6] selector[%arg7] {multiplicandAPtxType = #nvvm.mma_type<e4m3>, multiplicandBPtxType = #nvvm.mma_type<e4m3>, shape = #nvvm.shape<m = 16, n = 8, k = 64>} : (i32, i32, vector<2xf16>) -> !llvm.struct<(vector<2xf16>, vector<2xf16>)>
    return
  }
  func.func @nvvm_mma_sp_m16n8k64_e4m3_f32(%arg0: i32, %arg1: i32, %arg2: i32, %arg3: i32, %arg4: f32, %arg5: f32, %arg6: f32, %arg7: f32, %arg8: i32, %arg9: i32) {
    %0 = nvvm.mma.sp.sync A[%arg0, %arg1] B[%arg2, %arg3] C[%arg4, %arg5, %arg6, %arg7] sparseMetadata[%arg8] selector[%arg9] {multiplicandAPtxType = #nvvm.mma_type<e4m3>, multiplicandBPtxType = #nvvm.mma_type<e4m3>, shape = #nvvm.shape<m = 16, n = 8, k = 64>} : (i32, i32, f32) -> !llvm.struct<(f32, f32, f32, f32)>
    return
  }
  func.func @nvvm_mma_sp_m16n8k64_e5m2_f16(%arg0: i32, %arg1: i32, %arg2: i32, %arg3: i32, %arg4: vector<2xf16>, %arg5: vector<2xf16>, %arg6: i32, %arg7: i32) {
    %0 = nvvm.mma.sp.sync A[%arg0, %arg1] B[%arg2, %arg3] C[%arg4, %arg5] sparseMetadata[%arg6] selector[%arg7] {multiplicandAPtxType = #nvvm.mma_type<e5m2>, multiplicandBPtxType = #nvvm.mma_type<e5m2>, shape = #nvvm.shape<m = 16, n = 8, k = 64>} : (i32, i32, vector<2xf16>) -> !llvm.struct<(vector<2xf16>, vector<2xf16>)>
    return
  }
  func.func @nvvm_mma_sp_m16n8k64_e5m2_f32(%arg0: i32, %arg1: i32, %arg2: i32, %arg3: i32, %arg4: f32, %arg5: f32, %arg6: f32, %arg7: f32, %arg8: i32, %arg9: i32) {
    %0 = nvvm.mma.sp.sync A[%arg0, %arg1] B[%arg2, %arg3] C[%arg4, %arg5, %arg6, %arg7] sparseMetadata[%arg8] selector[%arg9] {multiplicandAPtxType = #nvvm.mma_type<e5m2>, multiplicandBPtxType = #nvvm.mma_type<e5m2>, shape = #nvvm.shape<m = 16, n = 8, k = 64>} : (i32, i32, f32) -> !llvm.struct<(f32, f32, f32, f32)>
    return
  }
}

