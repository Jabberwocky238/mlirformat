"builtin.module"() ({
  "func.func"() <{function_type = (i32, i32, i32, i32, vector<2xf16>, vector<2xf16>, i32, i32) -> (), sym_name = "nvvm_mma_sp_kind_m16n8k64_e4m3_f16"}> ({
  ^bb0(%arg82: i32, %arg83: i32, %arg84: i32, %arg85: i32, %arg86: vector<2xf16>, %arg87: vector<2xf16>, %arg88: i32, %arg89: i32):
    %9 = "nvvm.mma.sp.sync"(%arg82, %arg83, %arg84, %arg85, %arg86, %arg87, %arg88, %arg89) <{kind = #nvvm.mma_kind<f8f6f4>, multiplicandAPtxType = #nvvm.mma_type<e4m3>, multiplicandBPtxType = #nvvm.mma_type<e4m3>, operandSegmentSizes = array<i32: 2, 2, 2, 1, 1>, orderedMetadata, shape = #nvvm.shape<m = 16, n = 8, k = 64>}> : (i32, i32, i32, i32, vector<2xf16>, vector<2xf16>, i32, i32) -> !llvm.struct<(vector<2xf16>, vector<2xf16>)>
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (i32, i32, i32, i32, f32, f32, f32, f32, i32, i32) -> (), sym_name = "nvvm_mma_sp_kind_m16n8k64_e4m3_f32"}> ({
  ^bb0(%arg72: i32, %arg73: i32, %arg74: i32, %arg75: i32, %arg76: f32, %arg77: f32, %arg78: f32, %arg79: f32, %arg80: i32, %arg81: i32):
    %8 = "nvvm.mma.sp.sync"(%arg72, %arg73, %arg74, %arg75, %arg76, %arg77, %arg78, %arg79, %arg80, %arg81) <{kind = #nvvm.mma_kind<f8f6f4>, multiplicandAPtxType = #nvvm.mma_type<e4m3>, multiplicandBPtxType = #nvvm.mma_type<e4m3>, operandSegmentSizes = array<i32: 2, 2, 4, 1, 1>, orderedMetadata, shape = #nvvm.shape<m = 16, n = 8, k = 64>}> : (i32, i32, i32, i32, f32, f32, f32, f32, i32, i32) -> !llvm.struct<(f32, f32, f32, f32)>
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (i32, i32, i32, i32, vector<2xf16>, vector<2xf16>, i32, i32) -> (), sym_name = "nvvm_mma_sp_kind_m16n8k64_e5m2_f16"}> ({
  ^bb0(%arg64: i32, %arg65: i32, %arg66: i32, %arg67: i32, %arg68: vector<2xf16>, %arg69: vector<2xf16>, %arg70: i32, %arg71: i32):
    %7 = "nvvm.mma.sp.sync"(%arg64, %arg65, %arg66, %arg67, %arg68, %arg69, %arg70, %arg71) <{kind = #nvvm.mma_kind<f8f6f4>, multiplicandAPtxType = #nvvm.mma_type<e5m2>, multiplicandBPtxType = #nvvm.mma_type<e5m2>, operandSegmentSizes = array<i32: 2, 2, 2, 1, 1>, orderedMetadata, shape = #nvvm.shape<m = 16, n = 8, k = 64>}> : (i32, i32, i32, i32, vector<2xf16>, vector<2xf16>, i32, i32) -> !llvm.struct<(vector<2xf16>, vector<2xf16>)>
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (i32, i32, i32, i32, f32, f32, f32, f32, i32, i32) -> (), sym_name = "nvvm_mma_sp_kind_m16n8k64_e5m2_f32"}> ({
  ^bb0(%arg54: i32, %arg55: i32, %arg56: i32, %arg57: i32, %arg58: f32, %arg59: f32, %arg60: f32, %arg61: f32, %arg62: i32, %arg63: i32):
    %6 = "nvvm.mma.sp.sync"(%arg54, %arg55, %arg56, %arg57, %arg58, %arg59, %arg60, %arg61, %arg62, %arg63) <{kind = #nvvm.mma_kind<f8f6f4>, multiplicandAPtxType = #nvvm.mma_type<e5m2>, multiplicandBPtxType = #nvvm.mma_type<e5m2>, operandSegmentSizes = array<i32: 2, 2, 4, 1, 1>, orderedMetadata, shape = #nvvm.shape<m = 16, n = 8, k = 64>}> : (i32, i32, i32, i32, f32, f32, f32, f32, i32, i32) -> !llvm.struct<(f32, f32, f32, f32)>
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (i32, i32, i32, i32, vector<2xf16>, vector<2xf16>, i32, i32) -> (), sym_name = "nvvm_mma_sp_kind_m16n8k64_e3m2_f16"}> ({
  ^bb0(%arg46: i32, %arg47: i32, %arg48: i32, %arg49: i32, %arg50: vector<2xf16>, %arg51: vector<2xf16>, %arg52: i32, %arg53: i32):
    %5 = "nvvm.mma.sp.sync"(%arg46, %arg47, %arg48, %arg49, %arg50, %arg51, %arg52, %arg53) <{kind = #nvvm.mma_kind<f8f6f4>, multiplicandAPtxType = #nvvm.mma_type<e3m2>, multiplicandBPtxType = #nvvm.mma_type<e3m2>, operandSegmentSizes = array<i32: 2, 2, 2, 1, 1>, orderedMetadata, shape = #nvvm.shape<m = 16, n = 8, k = 64>}> : (i32, i32, i32, i32, vector<2xf16>, vector<2xf16>, i32, i32) -> !llvm.struct<(vector<2xf16>, vector<2xf16>)>
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (i32, i32, i32, i32, f32, f32, f32, f32, i32, i32) -> (), sym_name = "nvvm_mma_sp_kind_m16n8k64_e3m2_f32"}> ({
  ^bb0(%arg36: i32, %arg37: i32, %arg38: i32, %arg39: i32, %arg40: f32, %arg41: f32, %arg42: f32, %arg43: f32, %arg44: i32, %arg45: i32):
    %4 = "nvvm.mma.sp.sync"(%arg36, %arg37, %arg38, %arg39, %arg40, %arg41, %arg42, %arg43, %arg44, %arg45) <{kind = #nvvm.mma_kind<f8f6f4>, multiplicandAPtxType = #nvvm.mma_type<e3m2>, multiplicandBPtxType = #nvvm.mma_type<e3m2>, operandSegmentSizes = array<i32: 2, 2, 4, 1, 1>, orderedMetadata, shape = #nvvm.shape<m = 16, n = 8, k = 64>}> : (i32, i32, i32, i32, f32, f32, f32, f32, i32, i32) -> !llvm.struct<(f32, f32, f32, f32)>
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (i32, i32, i32, i32, vector<2xf16>, vector<2xf16>, i32, i32) -> (), sym_name = "nvvm_mma_sp_kind_m16n8k64_e2m3_f16"}> ({
  ^bb0(%arg28: i32, %arg29: i32, %arg30: i32, %arg31: i32, %arg32: vector<2xf16>, %arg33: vector<2xf16>, %arg34: i32, %arg35: i32):
    %3 = "nvvm.mma.sp.sync"(%arg28, %arg29, %arg30, %arg31, %arg32, %arg33, %arg34, %arg35) <{kind = #nvvm.mma_kind<f8f6f4>, multiplicandAPtxType = #nvvm.mma_type<e2m3>, multiplicandBPtxType = #nvvm.mma_type<e2m3>, operandSegmentSizes = array<i32: 2, 2, 2, 1, 1>, orderedMetadata, shape = #nvvm.shape<m = 16, n = 8, k = 64>}> : (i32, i32, i32, i32, vector<2xf16>, vector<2xf16>, i32, i32) -> !llvm.struct<(vector<2xf16>, vector<2xf16>)>
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (i32, i32, i32, i32, f32, f32, f32, f32, i32, i32) -> (), sym_name = "nvvm_mma_sp_kind_m16n8k64_e2m3_f32"}> ({
  ^bb0(%arg18: i32, %arg19: i32, %arg20: i32, %arg21: i32, %arg22: f32, %arg23: f32, %arg24: f32, %arg25: f32, %arg26: i32, %arg27: i32):
    %2 = "nvvm.mma.sp.sync"(%arg18, %arg19, %arg20, %arg21, %arg22, %arg23, %arg24, %arg25, %arg26, %arg27) <{kind = #nvvm.mma_kind<f8f6f4>, multiplicandAPtxType = #nvvm.mma_type<e2m3>, multiplicandBPtxType = #nvvm.mma_type<e2m3>, operandSegmentSizes = array<i32: 2, 2, 4, 1, 1>, orderedMetadata, shape = #nvvm.shape<m = 16, n = 8, k = 64>}> : (i32, i32, i32, i32, f32, f32, f32, f32, i32, i32) -> !llvm.struct<(f32, f32, f32, f32)>
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (i32, i32, i32, i32, vector<2xf16>, vector<2xf16>, i32, i32) -> (), sym_name = "nvvm_mma_sp_kind_m16n8k64_e2m1_f16"}> ({
  ^bb0(%arg10: i32, %arg11: i32, %arg12: i32, %arg13: i32, %arg14: vector<2xf16>, %arg15: vector<2xf16>, %arg16: i32, %arg17: i32):
    %1 = "nvvm.mma.sp.sync"(%arg10, %arg11, %arg12, %arg13, %arg14, %arg15, %arg16, %arg17) <{kind = #nvvm.mma_kind<f8f6f4>, multiplicandAPtxType = #nvvm.mma_type<e2m1>, multiplicandBPtxType = #nvvm.mma_type<e2m1>, operandSegmentSizes = array<i32: 2, 2, 2, 1, 1>, orderedMetadata, shape = #nvvm.shape<m = 16, n = 8, k = 64>}> : (i32, i32, i32, i32, vector<2xf16>, vector<2xf16>, i32, i32) -> !llvm.struct<(vector<2xf16>, vector<2xf16>)>
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (i32, i32, i32, i32, f32, f32, f32, f32, i32, i32) -> (), sym_name = "nvvm_mma_sp_kind_m16n8k64_e2m1_f32"}> ({
  ^bb0(%arg0: i32, %arg1: i32, %arg2: i32, %arg3: i32, %arg4: f32, %arg5: f32, %arg6: f32, %arg7: f32, %arg8: i32, %arg9: i32):
    %0 = "nvvm.mma.sp.sync"(%arg0, %arg1, %arg2, %arg3, %arg4, %arg5, %arg6, %arg7, %arg8, %arg9) <{kind = #nvvm.mma_kind<f8f6f4>, multiplicandAPtxType = #nvvm.mma_type<e2m1>, multiplicandBPtxType = #nvvm.mma_type<e2m1>, operandSegmentSizes = array<i32: 2, 2, 4, 1, 1>, orderedMetadata, shape = #nvvm.shape<m = 16, n = 8, k = 64>}> : (i32, i32, i32, i32, f32, f32, f32, f32, i32, i32) -> !llvm.struct<(f32, f32, f32, f32)>
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

