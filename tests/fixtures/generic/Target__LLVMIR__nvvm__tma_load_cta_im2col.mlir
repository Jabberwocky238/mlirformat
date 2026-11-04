"builtin.module"() ({
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (ptr, ptr<3>, ptr<3>, i32, i32, i32, i16, i64)>, linkage = #llvm.linkage<external>, sym_name = "tma_load_3d_im2col", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg82: !llvm.ptr, %arg83: !llvm.ptr<3>, %arg84: !llvm.ptr<3>, %arg85: i32, %arg86: i32, %arg87: i32, %arg88: i16, %arg89: i64):
    "nvvm.cp.async.bulk.tensor.shared.cluster.global"(%arg83, %arg82, %arg85, %arg86, %arg87, %arg84, %arg88) <{isCTAOnly = true, mode = #nvvm.tma_load_mode<im2col>, operandSegmentSizes = array<i32: 1, 1, 3, 1, 1, 0, 0, 0>}> : (!llvm.ptr<3>, !llvm.ptr, i32, i32, i32, !llvm.ptr<3>, i16) -> ()
    "nvvm.cp.async.bulk.tensor.shared.cluster.global"(%arg83, %arg82, %arg85, %arg86, %arg87, %arg84, %arg88, %arg89) <{isCTAOnly = true, mode = #nvvm.tma_load_mode<im2col>, operandSegmentSizes = array<i32: 1, 1, 3, 1, 1, 0, 1, 0>}> : (!llvm.ptr<3>, !llvm.ptr, i32, i32, i32, !llvm.ptr<3>, i16, i64) -> ()
    "llvm.return"() : () -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (ptr, ptr<3>, ptr<3>, i32, i32, i32, i32, i16, i16, i64)>, linkage = #llvm.linkage<external>, sym_name = "tma_load_4d_im2col", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg72: !llvm.ptr, %arg73: !llvm.ptr<3>, %arg74: !llvm.ptr<3>, %arg75: i32, %arg76: i32, %arg77: i32, %arg78: i32, %arg79: i16, %arg80: i16, %arg81: i64):
    "nvvm.cp.async.bulk.tensor.shared.cluster.global"(%arg73, %arg72, %arg75, %arg76, %arg77, %arg78, %arg74, %arg79, %arg80, %arg81) <{isCTAOnly = true, mode = #nvvm.tma_load_mode<im2col>, operandSegmentSizes = array<i32: 1, 1, 4, 1, 2, 0, 1, 0>}> : (!llvm.ptr<3>, !llvm.ptr, i32, i32, i32, i32, !llvm.ptr<3>, i16, i16, i64) -> ()
    "nvvm.cp.async.bulk.tensor.shared.cluster.global"(%arg73, %arg72, %arg75, %arg76, %arg77, %arg78, %arg74, %arg79, %arg80) <{isCTAOnly = true, mode = #nvvm.tma_load_mode<im2col>, operandSegmentSizes = array<i32: 1, 1, 4, 1, 2, 0, 0, 0>}> : (!llvm.ptr<3>, !llvm.ptr, i32, i32, i32, i32, !llvm.ptr<3>, i16, i16) -> ()
    "llvm.return"() : () -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (ptr, ptr<3>, ptr<3>, i32, i32, i32, i32, i32, i16, i16, i16, i64)>, linkage = #llvm.linkage<external>, sym_name = "tma_load_5d_im2col", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg60: !llvm.ptr, %arg61: !llvm.ptr<3>, %arg62: !llvm.ptr<3>, %arg63: i32, %arg64: i32, %arg65: i32, %arg66: i32, %arg67: i32, %arg68: i16, %arg69: i16, %arg70: i16, %arg71: i64):
    "nvvm.cp.async.bulk.tensor.shared.cluster.global"(%arg61, %arg60, %arg63, %arg64, %arg65, %arg66, %arg67, %arg62, %arg68, %arg69, %arg70, %arg71) <{isCTAOnly = true, mode = #nvvm.tma_load_mode<im2col>, operandSegmentSizes = array<i32: 1, 1, 5, 1, 3, 0, 1, 0>}> : (!llvm.ptr<3>, !llvm.ptr, i32, i32, i32, i32, i32, !llvm.ptr<3>, i16, i16, i16, i64) -> ()
    "nvvm.cp.async.bulk.tensor.shared.cluster.global"(%arg61, %arg60, %arg63, %arg64, %arg65, %arg66, %arg67, %arg62, %arg68, %arg69, %arg70) <{isCTAOnly = true, mode = #nvvm.tma_load_mode<im2col>, operandSegmentSizes = array<i32: 1, 1, 5, 1, 3, 0, 0, 0>}> : (!llvm.ptr<3>, !llvm.ptr, i32, i32, i32, i32, i32, !llvm.ptr<3>, i16, i16, i16) -> ()
    "llvm.return"() : () -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (ptr, ptr<3>, ptr<3>, i32, i32, i32, i16, i16, i64)>, linkage = #llvm.linkage<external>, sym_name = "tma_load_3d_im2col_w", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg51: !llvm.ptr, %arg52: !llvm.ptr<3>, %arg53: !llvm.ptr<3>, %arg54: i32, %arg55: i32, %arg56: i32, %arg57: i16, %arg58: i16, %arg59: i64):
    "nvvm.cp.async.bulk.tensor.shared.cluster.global"(%arg52, %arg51, %arg54, %arg55, %arg56, %arg53, %arg57, %arg58) <{isCTAOnly = true, mode = #nvvm.tma_load_mode<im2col_w>, operandSegmentSizes = array<i32: 1, 1, 3, 1, 2, 0, 0, 0>}> : (!llvm.ptr<3>, !llvm.ptr, i32, i32, i32, !llvm.ptr<3>, i16, i16) -> ()
    "nvvm.cp.async.bulk.tensor.shared.cluster.global"(%arg52, %arg51, %arg54, %arg55, %arg56, %arg53, %arg57, %arg58, %arg59) <{isCTAOnly = true, mode = #nvvm.tma_load_mode<im2col_w>, operandSegmentSizes = array<i32: 1, 1, 3, 1, 2, 0, 1, 0>}> : (!llvm.ptr<3>, !llvm.ptr, i32, i32, i32, !llvm.ptr<3>, i16, i16, i64) -> ()
    "llvm.return"() : () -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (ptr, ptr<3>, ptr<3>, i32, i32, i32, i32, i16, i16, i64)>, linkage = #llvm.linkage<external>, sym_name = "tma_load_4d_im2col_w", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg41: !llvm.ptr, %arg42: !llvm.ptr<3>, %arg43: !llvm.ptr<3>, %arg44: i32, %arg45: i32, %arg46: i32, %arg47: i32, %arg48: i16, %arg49: i16, %arg50: i64):
    "nvvm.cp.async.bulk.tensor.shared.cluster.global"(%arg42, %arg41, %arg44, %arg45, %arg46, %arg47, %arg43, %arg48, %arg49) <{isCTAOnly = true, mode = #nvvm.tma_load_mode<im2col_w>, operandSegmentSizes = array<i32: 1, 1, 4, 1, 2, 0, 0, 0>}> : (!llvm.ptr<3>, !llvm.ptr, i32, i32, i32, i32, !llvm.ptr<3>, i16, i16) -> ()
    "nvvm.cp.async.bulk.tensor.shared.cluster.global"(%arg42, %arg41, %arg44, %arg45, %arg46, %arg47, %arg43, %arg48, %arg49, %arg50) <{isCTAOnly = true, mode = #nvvm.tma_load_mode<im2col_w>, operandSegmentSizes = array<i32: 1, 1, 4, 1, 2, 0, 1, 0>}> : (!llvm.ptr<3>, !llvm.ptr, i32, i32, i32, i32, !llvm.ptr<3>, i16, i16, i64) -> ()
    "llvm.return"() : () -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (ptr, ptr<3>, ptr<3>, i32, i32, i32, i32, i32, i16, i16, i64)>, linkage = #llvm.linkage<external>, sym_name = "tma_load_5d_im2col_w", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg30: !llvm.ptr, %arg31: !llvm.ptr<3>, %arg32: !llvm.ptr<3>, %arg33: i32, %arg34: i32, %arg35: i32, %arg36: i32, %arg37: i32, %arg38: i16, %arg39: i16, %arg40: i64):
    "nvvm.cp.async.bulk.tensor.shared.cluster.global"(%arg31, %arg30, %arg33, %arg34, %arg35, %arg36, %arg37, %arg32, %arg38, %arg39) <{isCTAOnly = true, mode = #nvvm.tma_load_mode<im2col_w>, operandSegmentSizes = array<i32: 1, 1, 5, 1, 2, 0, 0, 0>}> : (!llvm.ptr<3>, !llvm.ptr, i32, i32, i32, i32, i32, !llvm.ptr<3>, i16, i16) -> ()
    "nvvm.cp.async.bulk.tensor.shared.cluster.global"(%arg31, %arg30, %arg33, %arg34, %arg35, %arg36, %arg37, %arg32, %arg38, %arg39, %arg40) <{isCTAOnly = true, mode = #nvvm.tma_load_mode<im2col_w>, operandSegmentSizes = array<i32: 1, 1, 5, 1, 2, 0, 1, 0>}> : (!llvm.ptr<3>, !llvm.ptr, i32, i32, i32, i32, i32, !llvm.ptr<3>, i16, i16, i64) -> ()
    "llvm.return"() : () -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (ptr, ptr<3>, ptr<3>, i32, i32, i32, i16, i16, i64)>, linkage = #llvm.linkage<external>, sym_name = "tma_load_3d_im2col_w_128", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg21: !llvm.ptr, %arg22: !llvm.ptr<3>, %arg23: !llvm.ptr<3>, %arg24: i32, %arg25: i32, %arg26: i32, %arg27: i16, %arg28: i16, %arg29: i64):
    "nvvm.cp.async.bulk.tensor.shared.cluster.global"(%arg22, %arg21, %arg24, %arg25, %arg26, %arg23, %arg27, %arg28) <{isCTAOnly = true, mode = #nvvm.tma_load_mode<im2col_w_128>, operandSegmentSizes = array<i32: 1, 1, 3, 1, 2, 0, 0, 0>}> : (!llvm.ptr<3>, !llvm.ptr, i32, i32, i32, !llvm.ptr<3>, i16, i16) -> ()
    "nvvm.cp.async.bulk.tensor.shared.cluster.global"(%arg22, %arg21, %arg24, %arg25, %arg26, %arg23, %arg27, %arg28, %arg29) <{isCTAOnly = true, mode = #nvvm.tma_load_mode<im2col_w_128>, operandSegmentSizes = array<i32: 1, 1, 3, 1, 2, 0, 1, 0>}> : (!llvm.ptr<3>, !llvm.ptr, i32, i32, i32, !llvm.ptr<3>, i16, i16, i64) -> ()
    "llvm.return"() : () -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (ptr, ptr<3>, ptr<3>, i32, i32, i32, i32, i16, i16, i64)>, linkage = #llvm.linkage<external>, sym_name = "tma_load_4d_im2col_w_128", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg11: !llvm.ptr, %arg12: !llvm.ptr<3>, %arg13: !llvm.ptr<3>, %arg14: i32, %arg15: i32, %arg16: i32, %arg17: i32, %arg18: i16, %arg19: i16, %arg20: i64):
    "nvvm.cp.async.bulk.tensor.shared.cluster.global"(%arg12, %arg11, %arg14, %arg15, %arg16, %arg17, %arg13, %arg18, %arg19) <{isCTAOnly = true, mode = #nvvm.tma_load_mode<im2col_w_128>, operandSegmentSizes = array<i32: 1, 1, 4, 1, 2, 0, 0, 0>}> : (!llvm.ptr<3>, !llvm.ptr, i32, i32, i32, i32, !llvm.ptr<3>, i16, i16) -> ()
    "nvvm.cp.async.bulk.tensor.shared.cluster.global"(%arg12, %arg11, %arg14, %arg15, %arg16, %arg17, %arg13, %arg18, %arg19, %arg20) <{isCTAOnly = true, mode = #nvvm.tma_load_mode<im2col_w_128>, operandSegmentSizes = array<i32: 1, 1, 4, 1, 2, 0, 1, 0>}> : (!llvm.ptr<3>, !llvm.ptr, i32, i32, i32, i32, !llvm.ptr<3>, i16, i16, i64) -> ()
    "llvm.return"() : () -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (ptr, ptr<3>, ptr<3>, i32, i32, i32, i32, i32, i16, i16, i64)>, linkage = #llvm.linkage<external>, sym_name = "tma_load_5d_im2col_w_128", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg0: !llvm.ptr, %arg1: !llvm.ptr<3>, %arg2: !llvm.ptr<3>, %arg3: i32, %arg4: i32, %arg5: i32, %arg6: i32, %arg7: i32, %arg8: i16, %arg9: i16, %arg10: i64):
    "nvvm.cp.async.bulk.tensor.shared.cluster.global"(%arg1, %arg0, %arg3, %arg4, %arg5, %arg6, %arg7, %arg2, %arg8, %arg9) <{isCTAOnly = true, mode = #nvvm.tma_load_mode<im2col_w_128>, operandSegmentSizes = array<i32: 1, 1, 5, 1, 2, 0, 0, 0>}> : (!llvm.ptr<3>, !llvm.ptr, i32, i32, i32, i32, i32, !llvm.ptr<3>, i16, i16) -> ()
    "nvvm.cp.async.bulk.tensor.shared.cluster.global"(%arg1, %arg0, %arg3, %arg4, %arg5, %arg6, %arg7, %arg2, %arg8, %arg9, %arg10) <{isCTAOnly = true, mode = #nvvm.tma_load_mode<im2col_w_128>, operandSegmentSizes = array<i32: 1, 1, 5, 1, 2, 0, 1, 0>}> : (!llvm.ptr<3>, !llvm.ptr, i32, i32, i32, i32, i32, !llvm.ptr<3>, i16, i16, i64) -> ()
    "llvm.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

