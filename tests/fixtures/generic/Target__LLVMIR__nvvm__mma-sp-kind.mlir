"builtin.module"() ({
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<struct<(vector<2xf16>, vector<2xf16>)> (i32, i32, i32, i32, i32, i32, i32, i32, vector<2xf16>, vector<2xf16>, i32)>, linkage = #llvm.linkage<external>, sym_name = "nvvm_mma_sp_kind_m16n8k64_e4m3_f16", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg109: i32, %arg110: i32, %arg111: i32, %arg112: i32, %arg113: i32, %arg114: i32, %arg115: i32, %arg116: i32, %arg117: vector<2xf16>, %arg118: vector<2xf16>, %arg119: i32):
    %18 = "llvm.mlir.constant"() <{value = 0 : i32}> : () -> i32
    %19 = "nvvm.mma.sp.sync"(%arg109, %arg110, %arg111, %arg112, %arg113, %arg114, %arg115, %arg116, %arg117, %arg118, %arg119, %18) <{kind = #nvvm.mma_kind<f8f6f4>, multiplicandAPtxType = #nvvm.mma_type<e4m3>, multiplicandBPtxType = #nvvm.mma_type<e4m3>, operandSegmentSizes = array<i32: 4, 4, 2, 1, 1>, orderedMetadata, shape = #nvvm.shape<m = 16, n = 8, k = 64>}> : (i32, i32, i32, i32, i32, i32, i32, i32, vector<2xf16>, vector<2xf16>, i32, i32) -> !llvm.struct<(vector<2xf16>, vector<2xf16>)>
    "llvm.return"(%19) : (!llvm.struct<(vector<2xf16>, vector<2xf16>)>) -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<struct<(f32, f32, f32, f32)> (i32, i32, i32, i32, i32, i32, i32, i32, f32, f32, f32, f32, i32)>, linkage = #llvm.linkage<external>, sym_name = "nvvm_mma_sp_kind_m16n8k64_e4m3_f32", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg96: i32, %arg97: i32, %arg98: i32, %arg99: i32, %arg100: i32, %arg101: i32, %arg102: i32, %arg103: i32, %arg104: f32, %arg105: f32, %arg106: f32, %arg107: f32, %arg108: i32):
    %16 = "llvm.mlir.constant"() <{value = 0 : i32}> : () -> i32
    %17 = "nvvm.mma.sp.sync"(%arg96, %arg97, %arg98, %arg99, %arg100, %arg101, %arg102, %arg103, %arg104, %arg105, %arg106, %arg107, %arg108, %16) <{kind = #nvvm.mma_kind<f8f6f4>, multiplicandAPtxType = #nvvm.mma_type<e4m3>, multiplicandBPtxType = #nvvm.mma_type<e4m3>, operandSegmentSizes = array<i32: 4, 4, 4, 1, 1>, orderedMetadata, shape = #nvvm.shape<m = 16, n = 8, k = 64>}> : (i32, i32, i32, i32, i32, i32, i32, i32, f32, f32, f32, f32, i32, i32) -> !llvm.struct<(f32, f32, f32, f32)>
    "llvm.return"(%17) : (!llvm.struct<(f32, f32, f32, f32)>) -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<struct<(vector<2xf16>, vector<2xf16>)> (i32, i32, i32, i32, i32, i32, i32, i32, vector<2xf16>, vector<2xf16>, i32)>, linkage = #llvm.linkage<external>, sym_name = "nvvm_mma_sp_kind_m16n8k64_e5m2_f16", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg85: i32, %arg86: i32, %arg87: i32, %arg88: i32, %arg89: i32, %arg90: i32, %arg91: i32, %arg92: i32, %arg93: vector<2xf16>, %arg94: vector<2xf16>, %arg95: i32):
    %14 = "llvm.mlir.constant"() <{value = 0 : i32}> : () -> i32
    %15 = "nvvm.mma.sp.sync"(%arg85, %arg86, %arg87, %arg88, %arg89, %arg90, %arg91, %arg92, %arg93, %arg94, %arg95, %14) <{kind = #nvvm.mma_kind<f8f6f4>, multiplicandAPtxType = #nvvm.mma_type<e5m2>, multiplicandBPtxType = #nvvm.mma_type<e5m2>, operandSegmentSizes = array<i32: 4, 4, 2, 1, 1>, orderedMetadata, shape = #nvvm.shape<m = 16, n = 8, k = 64>}> : (i32, i32, i32, i32, i32, i32, i32, i32, vector<2xf16>, vector<2xf16>, i32, i32) -> !llvm.struct<(vector<2xf16>, vector<2xf16>)>
    "llvm.return"(%15) : (!llvm.struct<(vector<2xf16>, vector<2xf16>)>) -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<struct<(f32, f32, f32, f32)> (i32, i32, i32, i32, i32, i32, i32, i32, f32, f32, f32, f32, i32)>, linkage = #llvm.linkage<external>, sym_name = "nvvm_mma_sp_kind_m16n8k64_e5m2_f32", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg72: i32, %arg73: i32, %arg74: i32, %arg75: i32, %arg76: i32, %arg77: i32, %arg78: i32, %arg79: i32, %arg80: f32, %arg81: f32, %arg82: f32, %arg83: f32, %arg84: i32):
    %12 = "llvm.mlir.constant"() <{value = 0 : i32}> : () -> i32
    %13 = "nvvm.mma.sp.sync"(%arg72, %arg73, %arg74, %arg75, %arg76, %arg77, %arg78, %arg79, %arg80, %arg81, %arg82, %arg83, %arg84, %12) <{kind = #nvvm.mma_kind<f8f6f4>, multiplicandAPtxType = #nvvm.mma_type<e5m2>, multiplicandBPtxType = #nvvm.mma_type<e5m2>, operandSegmentSizes = array<i32: 4, 4, 4, 1, 1>, orderedMetadata, shape = #nvvm.shape<m = 16, n = 8, k = 64>}> : (i32, i32, i32, i32, i32, i32, i32, i32, f32, f32, f32, f32, i32, i32) -> !llvm.struct<(f32, f32, f32, f32)>
    "llvm.return"(%13) : (!llvm.struct<(f32, f32, f32, f32)>) -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<struct<(vector<2xf16>, vector<2xf16>)> (i32, i32, i32, i32, i32, i32, i32, i32, vector<2xf16>, vector<2xf16>, i32)>, linkage = #llvm.linkage<external>, sym_name = "nvvm_mma_sp_kind_m16n8k64_e3m2_f16", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg61: i32, %arg62: i32, %arg63: i32, %arg64: i32, %arg65: i32, %arg66: i32, %arg67: i32, %arg68: i32, %arg69: vector<2xf16>, %arg70: vector<2xf16>, %arg71: i32):
    %10 = "llvm.mlir.constant"() <{value = 0 : i32}> : () -> i32
    %11 = "nvvm.mma.sp.sync"(%arg61, %arg62, %arg63, %arg64, %arg65, %arg66, %arg67, %arg68, %arg69, %arg70, %arg71, %10) <{kind = #nvvm.mma_kind<f8f6f4>, multiplicandAPtxType = #nvvm.mma_type<e3m2>, multiplicandBPtxType = #nvvm.mma_type<e3m2>, operandSegmentSizes = array<i32: 4, 4, 2, 1, 1>, orderedMetadata, shape = #nvvm.shape<m = 16, n = 8, k = 64>}> : (i32, i32, i32, i32, i32, i32, i32, i32, vector<2xf16>, vector<2xf16>, i32, i32) -> !llvm.struct<(vector<2xf16>, vector<2xf16>)>
    "llvm.return"(%11) : (!llvm.struct<(vector<2xf16>, vector<2xf16>)>) -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<struct<(f32, f32, f32, f32)> (i32, i32, i32, i32, i32, i32, i32, i32, f32, f32, f32, f32, i32)>, linkage = #llvm.linkage<external>, sym_name = "nvvm_mma_sp_kind_m16n8k64_e3m2_f32", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg48: i32, %arg49: i32, %arg50: i32, %arg51: i32, %arg52: i32, %arg53: i32, %arg54: i32, %arg55: i32, %arg56: f32, %arg57: f32, %arg58: f32, %arg59: f32, %arg60: i32):
    %8 = "llvm.mlir.constant"() <{value = 0 : i32}> : () -> i32
    %9 = "nvvm.mma.sp.sync"(%arg48, %arg49, %arg50, %arg51, %arg52, %arg53, %arg54, %arg55, %arg56, %arg57, %arg58, %arg59, %arg60, %8) <{kind = #nvvm.mma_kind<f8f6f4>, multiplicandAPtxType = #nvvm.mma_type<e3m2>, multiplicandBPtxType = #nvvm.mma_type<e3m2>, operandSegmentSizes = array<i32: 4, 4, 4, 1, 1>, orderedMetadata, shape = #nvvm.shape<m = 16, n = 8, k = 64>}> : (i32, i32, i32, i32, i32, i32, i32, i32, f32, f32, f32, f32, i32, i32) -> !llvm.struct<(f32, f32, f32, f32)>
    "llvm.return"(%9) : (!llvm.struct<(f32, f32, f32, f32)>) -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<struct<(vector<2xf16>, vector<2xf16>)> (i32, i32, i32, i32, i32, i32, i32, i32, vector<2xf16>, vector<2xf16>, i32)>, linkage = #llvm.linkage<external>, sym_name = "nvvm_mma_sp_kind_m16n8k64_e2m3_f16", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg37: i32, %arg38: i32, %arg39: i32, %arg40: i32, %arg41: i32, %arg42: i32, %arg43: i32, %arg44: i32, %arg45: vector<2xf16>, %arg46: vector<2xf16>, %arg47: i32):
    %6 = "llvm.mlir.constant"() <{value = 0 : i32}> : () -> i32
    %7 = "nvvm.mma.sp.sync"(%arg37, %arg38, %arg39, %arg40, %arg41, %arg42, %arg43, %arg44, %arg45, %arg46, %arg47, %6) <{kind = #nvvm.mma_kind<f8f6f4>, multiplicandAPtxType = #nvvm.mma_type<e2m3>, multiplicandBPtxType = #nvvm.mma_type<e2m3>, operandSegmentSizes = array<i32: 4, 4, 2, 1, 1>, orderedMetadata, shape = #nvvm.shape<m = 16, n = 8, k = 64>}> : (i32, i32, i32, i32, i32, i32, i32, i32, vector<2xf16>, vector<2xf16>, i32, i32) -> !llvm.struct<(vector<2xf16>, vector<2xf16>)>
    "llvm.return"(%7) : (!llvm.struct<(vector<2xf16>, vector<2xf16>)>) -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<struct<(f32, f32, f32, f32)> (i32, i32, i32, i32, i32, i32, i32, i32, f32, f32, f32, f32, i32)>, linkage = #llvm.linkage<external>, sym_name = "nvvm_mma_sp_kind_m16n8k64_e2m3_f32", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg24: i32, %arg25: i32, %arg26: i32, %arg27: i32, %arg28: i32, %arg29: i32, %arg30: i32, %arg31: i32, %arg32: f32, %arg33: f32, %arg34: f32, %arg35: f32, %arg36: i32):
    %4 = "llvm.mlir.constant"() <{value = 0 : i32}> : () -> i32
    %5 = "nvvm.mma.sp.sync"(%arg24, %arg25, %arg26, %arg27, %arg28, %arg29, %arg30, %arg31, %arg32, %arg33, %arg34, %arg35, %arg36, %4) <{kind = #nvvm.mma_kind<f8f6f4>, multiplicandAPtxType = #nvvm.mma_type<e2m3>, multiplicandBPtxType = #nvvm.mma_type<e2m3>, operandSegmentSizes = array<i32: 4, 4, 4, 1, 1>, orderedMetadata, shape = #nvvm.shape<m = 16, n = 8, k = 64>}> : (i32, i32, i32, i32, i32, i32, i32, i32, f32, f32, f32, f32, i32, i32) -> !llvm.struct<(f32, f32, f32, f32)>
    "llvm.return"(%5) : (!llvm.struct<(f32, f32, f32, f32)>) -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<struct<(vector<2xf16>, vector<2xf16>)> (i32, i32, i32, i32, i32, i32, i32, i32, vector<2xf16>, vector<2xf16>, i32)>, linkage = #llvm.linkage<external>, sym_name = "nvvm_mma_sp_kind_m16n8k64_e2m1_f16", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg13: i32, %arg14: i32, %arg15: i32, %arg16: i32, %arg17: i32, %arg18: i32, %arg19: i32, %arg20: i32, %arg21: vector<2xf16>, %arg22: vector<2xf16>, %arg23: i32):
    %2 = "llvm.mlir.constant"() <{value = 0 : i32}> : () -> i32
    %3 = "nvvm.mma.sp.sync"(%arg13, %arg14, %arg15, %arg16, %arg17, %arg18, %arg19, %arg20, %arg21, %arg22, %arg23, %2) <{kind = #nvvm.mma_kind<f8f6f4>, multiplicandAPtxType = #nvvm.mma_type<e2m1>, multiplicandBPtxType = #nvvm.mma_type<e2m1>, operandSegmentSizes = array<i32: 4, 4, 2, 1, 1>, orderedMetadata, shape = #nvvm.shape<m = 16, n = 8, k = 64>}> : (i32, i32, i32, i32, i32, i32, i32, i32, vector<2xf16>, vector<2xf16>, i32, i32) -> !llvm.struct<(vector<2xf16>, vector<2xf16>)>
    "llvm.return"(%3) : (!llvm.struct<(vector<2xf16>, vector<2xf16>)>) -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<struct<(f32, f32, f32, f32)> (i32, i32, i32, i32, i32, i32, i32, i32, f32, f32, f32, f32, i32)>, linkage = #llvm.linkage<external>, sym_name = "nvvm_mma_sp_kind_m16n8k64_e2m1_f32", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg0: i32, %arg1: i32, %arg2: i32, %arg3: i32, %arg4: i32, %arg5: i32, %arg6: i32, %arg7: i32, %arg8: f32, %arg9: f32, %arg10: f32, %arg11: f32, %arg12: i32):
    %0 = "llvm.mlir.constant"() <{value = 0 : i32}> : () -> i32
    %1 = "nvvm.mma.sp.sync"(%arg0, %arg1, %arg2, %arg3, %arg4, %arg5, %arg6, %arg7, %arg8, %arg9, %arg10, %arg11, %arg12, %0) <{kind = #nvvm.mma_kind<f8f6f4>, multiplicandAPtxType = #nvvm.mma_type<e2m1>, multiplicandBPtxType = #nvvm.mma_type<e2m1>, operandSegmentSizes = array<i32: 4, 4, 4, 1, 1>, orderedMetadata, shape = #nvvm.shape<m = 16, n = 8, k = 64>}> : (i32, i32, i32, i32, i32, i32, i32, i32, f32, f32, f32, f32, i32, i32) -> !llvm.struct<(f32, f32, f32, f32)>
    "llvm.return"(%1) : (!llvm.struct<(f32, f32, f32, f32)>) -> ()
  }) : () -> ()
}) : () -> ()

