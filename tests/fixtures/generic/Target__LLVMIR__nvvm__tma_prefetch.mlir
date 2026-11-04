"builtin.module"() ({
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (ptr<1>, i32, i64)>, linkage = #llvm.linkage<external>, sym_name = "tma_bulk_prefetch", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg39: !llvm.ptr<1>, %arg40: i32, %arg41: i64):
    "nvvm.cp.async.bulk.prefetch"(%arg39, %arg40) : (!llvm.ptr<1>, i32) -> ()
    "nvvm.cp.async.bulk.prefetch"(%arg39, %arg40, %arg41) : (!llvm.ptr<1>, i32, i64) -> ()
    "llvm.return"() : () -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (ptr, i32, i64)>, linkage = #llvm.linkage<external>, sym_name = "tma_prefetch_1d", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg36: !llvm.ptr, %arg37: i32, %arg38: i64):
    "nvvm.cp.async.bulk.tensor.prefetch"(%arg36, %arg37) <{mode = #nvvm.tma_load_mode<tile>, operandSegmentSizes = array<i32: 1, 1, 0, 0>}> : (!llvm.ptr, i32) -> ()
    "nvvm.cp.async.bulk.tensor.prefetch"(%arg36, %arg37, %arg38) <{mode = #nvvm.tma_load_mode<tile>, operandSegmentSizes = array<i32: 1, 1, 0, 1>}> : (!llvm.ptr, i32, i64) -> ()
    "llvm.return"() : () -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (ptr, i32, i32, i64)>, linkage = #llvm.linkage<external>, sym_name = "tma_prefetch_2d", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg32: !llvm.ptr, %arg33: i32, %arg34: i32, %arg35: i64):
    "nvvm.cp.async.bulk.tensor.prefetch"(%arg32, %arg33, %arg34) <{mode = #nvvm.tma_load_mode<tile>, operandSegmentSizes = array<i32: 1, 2, 0, 0>}> : (!llvm.ptr, i32, i32) -> ()
    "nvvm.cp.async.bulk.tensor.prefetch"(%arg32, %arg33, %arg34, %arg35) <{mode = #nvvm.tma_load_mode<tile>, operandSegmentSizes = array<i32: 1, 2, 0, 1>}> : (!llvm.ptr, i32, i32, i64) -> ()
    "llvm.return"() : () -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (ptr, i32, i32, i32, i16, i16, i64)>, linkage = #llvm.linkage<external>, sym_name = "tma_prefetch_3d", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg25: !llvm.ptr, %arg26: i32, %arg27: i32, %arg28: i32, %arg29: i16, %arg30: i16, %arg31: i64):
    "nvvm.cp.async.bulk.tensor.prefetch"(%arg25, %arg26, %arg27, %arg28) <{mode = #nvvm.tma_load_mode<tile>, operandSegmentSizes = array<i32: 1, 3, 0, 0>}> : (!llvm.ptr, i32, i32, i32) -> ()
    "nvvm.cp.async.bulk.tensor.prefetch"(%arg25, %arg26, %arg27, %arg28, %arg31) <{mode = #nvvm.tma_load_mode<tile>, operandSegmentSizes = array<i32: 1, 3, 0, 1>}> : (!llvm.ptr, i32, i32, i32, i64) -> ()
    "nvvm.cp.async.bulk.tensor.prefetch"(%arg25, %arg26, %arg27, %arg28, %arg29) <{mode = #nvvm.tma_load_mode<im2col>, operandSegmentSizes = array<i32: 1, 3, 1, 0>}> : (!llvm.ptr, i32, i32, i32, i16) -> ()
    "nvvm.cp.async.bulk.tensor.prefetch"(%arg25, %arg26, %arg27, %arg28, %arg29, %arg31) <{mode = #nvvm.tma_load_mode<im2col>, operandSegmentSizes = array<i32: 1, 3, 1, 1>}> : (!llvm.ptr, i32, i32, i32, i16, i64) -> ()
    "nvvm.cp.async.bulk.tensor.prefetch"(%arg25, %arg26, %arg27, %arg28, %arg29, %arg30) <{mode = #nvvm.tma_load_mode<im2col_w>, operandSegmentSizes = array<i32: 1, 3, 2, 0>}> : (!llvm.ptr, i32, i32, i32, i16, i16) -> ()
    "nvvm.cp.async.bulk.tensor.prefetch"(%arg25, %arg26, %arg27, %arg28, %arg29, %arg30, %arg31) <{mode = #nvvm.tma_load_mode<im2col_w>, operandSegmentSizes = array<i32: 1, 3, 2, 1>}> : (!llvm.ptr, i32, i32, i32, i16, i16, i64) -> ()
    "nvvm.cp.async.bulk.tensor.prefetch"(%arg25, %arg26, %arg27, %arg28, %arg29, %arg30) <{mode = #nvvm.tma_load_mode<im2col_w_128>, operandSegmentSizes = array<i32: 1, 3, 2, 0>}> : (!llvm.ptr, i32, i32, i32, i16, i16) -> ()
    "nvvm.cp.async.bulk.tensor.prefetch"(%arg25, %arg26, %arg27, %arg28, %arg29, %arg30, %arg31) <{mode = #nvvm.tma_load_mode<im2col_w_128>, operandSegmentSizes = array<i32: 1, 3, 2, 1>}> : (!llvm.ptr, i32, i32, i32, i16, i16, i64) -> ()
    "llvm.return"() : () -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (ptr, i32, i32, i32, i32, i16, i16, i64)>, linkage = #llvm.linkage<external>, sym_name = "tma_prefetch_4d", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg17: !llvm.ptr, %arg18: i32, %arg19: i32, %arg20: i32, %arg21: i32, %arg22: i16, %arg23: i16, %arg24: i64):
    "nvvm.cp.async.bulk.tensor.prefetch"(%arg17, %arg18, %arg19, %arg20, %arg21) <{mode = #nvvm.tma_load_mode<tile>, operandSegmentSizes = array<i32: 1, 4, 0, 0>}> : (!llvm.ptr, i32, i32, i32, i32) -> ()
    "nvvm.cp.async.bulk.tensor.prefetch"(%arg17, %arg18, %arg19, %arg20, %arg21, %arg24) <{mode = #nvvm.tma_load_mode<tile>, operandSegmentSizes = array<i32: 1, 4, 0, 1>}> : (!llvm.ptr, i32, i32, i32, i32, i64) -> ()
    "nvvm.cp.async.bulk.tensor.prefetch"(%arg17, %arg18, %arg19, %arg20, %arg21, %arg22, %arg23) <{mode = #nvvm.tma_load_mode<im2col>, operandSegmentSizes = array<i32: 1, 4, 2, 0>}> : (!llvm.ptr, i32, i32, i32, i32, i16, i16) -> ()
    "nvvm.cp.async.bulk.tensor.prefetch"(%arg17, %arg18, %arg19, %arg20, %arg21, %arg22, %arg23, %arg24) <{mode = #nvvm.tma_load_mode<im2col>, operandSegmentSizes = array<i32: 1, 4, 2, 1>}> : (!llvm.ptr, i32, i32, i32, i32, i16, i16, i64) -> ()
    "nvvm.cp.async.bulk.tensor.prefetch"(%arg17, %arg18, %arg19, %arg20, %arg21, %arg22, %arg23) <{mode = #nvvm.tma_load_mode<im2col_w>, operandSegmentSizes = array<i32: 1, 4, 2, 0>}> : (!llvm.ptr, i32, i32, i32, i32, i16, i16) -> ()
    "nvvm.cp.async.bulk.tensor.prefetch"(%arg17, %arg18, %arg19, %arg20, %arg21, %arg22, %arg23, %arg24) <{mode = #nvvm.tma_load_mode<im2col_w>, operandSegmentSizes = array<i32: 1, 4, 2, 1>}> : (!llvm.ptr, i32, i32, i32, i32, i16, i16, i64) -> ()
    "nvvm.cp.async.bulk.tensor.prefetch"(%arg17, %arg18, %arg19, %arg20, %arg21, %arg22, %arg23) <{mode = #nvvm.tma_load_mode<im2col_w_128>, operandSegmentSizes = array<i32: 1, 4, 2, 0>}> : (!llvm.ptr, i32, i32, i32, i32, i16, i16) -> ()
    "nvvm.cp.async.bulk.tensor.prefetch"(%arg17, %arg18, %arg19, %arg20, %arg21, %arg22, %arg23, %arg24) <{mode = #nvvm.tma_load_mode<im2col_w_128>, operandSegmentSizes = array<i32: 1, 4, 2, 1>}> : (!llvm.ptr, i32, i32, i32, i32, i16, i16, i64) -> ()
    "llvm.return"() : () -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (ptr, i32, i32, i32, i32, i32, i16, i16, i16, i64)>, linkage = #llvm.linkage<external>, sym_name = "tma_prefetch_5d", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg7: !llvm.ptr, %arg8: i32, %arg9: i32, %arg10: i32, %arg11: i32, %arg12: i32, %arg13: i16, %arg14: i16, %arg15: i16, %arg16: i64):
    "nvvm.cp.async.bulk.tensor.prefetch"(%arg7, %arg8, %arg9, %arg10, %arg11, %arg12) <{mode = #nvvm.tma_load_mode<tile>, operandSegmentSizes = array<i32: 1, 5, 0, 0>}> : (!llvm.ptr, i32, i32, i32, i32, i32) -> ()
    "nvvm.cp.async.bulk.tensor.prefetch"(%arg7, %arg8, %arg9, %arg10, %arg11, %arg12, %arg16) <{mode = #nvvm.tma_load_mode<tile>, operandSegmentSizes = array<i32: 1, 5, 0, 1>}> : (!llvm.ptr, i32, i32, i32, i32, i32, i64) -> ()
    "nvvm.cp.async.bulk.tensor.prefetch"(%arg7, %arg8, %arg9, %arg10, %arg11, %arg12, %arg13, %arg14, %arg15) <{mode = #nvvm.tma_load_mode<im2col>, operandSegmentSizes = array<i32: 1, 5, 3, 0>}> : (!llvm.ptr, i32, i32, i32, i32, i32, i16, i16, i16) -> ()
    "nvvm.cp.async.bulk.tensor.prefetch"(%arg7, %arg8, %arg9, %arg10, %arg11, %arg12, %arg13, %arg14, %arg15, %arg16) <{mode = #nvvm.tma_load_mode<im2col>, operandSegmentSizes = array<i32: 1, 5, 3, 1>}> : (!llvm.ptr, i32, i32, i32, i32, i32, i16, i16, i16, i64) -> ()
    "nvvm.cp.async.bulk.tensor.prefetch"(%arg7, %arg8, %arg9, %arg10, %arg11, %arg12, %arg13, %arg14) <{mode = #nvvm.tma_load_mode<im2col_w>, operandSegmentSizes = array<i32: 1, 5, 2, 0>}> : (!llvm.ptr, i32, i32, i32, i32, i32, i16, i16) -> ()
    "nvvm.cp.async.bulk.tensor.prefetch"(%arg7, %arg8, %arg9, %arg10, %arg11, %arg12, %arg13, %arg14, %arg16) <{mode = #nvvm.tma_load_mode<im2col_w>, operandSegmentSizes = array<i32: 1, 5, 2, 1>}> : (!llvm.ptr, i32, i32, i32, i32, i32, i16, i16, i64) -> ()
    "nvvm.cp.async.bulk.tensor.prefetch"(%arg7, %arg8, %arg9, %arg10, %arg11, %arg12, %arg13, %arg14) <{mode = #nvvm.tma_load_mode<im2col_w_128>, operandSegmentSizes = array<i32: 1, 5, 2, 0>}> : (!llvm.ptr, i32, i32, i32, i32, i32, i16, i16) -> ()
    "nvvm.cp.async.bulk.tensor.prefetch"(%arg7, %arg8, %arg9, %arg10, %arg11, %arg12, %arg13, %arg14, %arg16) <{mode = #nvvm.tma_load_mode<im2col_w_128>, operandSegmentSizes = array<i32: 1, 5, 2, 1>}> : (!llvm.ptr, i32, i32, i32, i32, i32, i16, i16, i64) -> ()
    "llvm.return"() : () -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (ptr, i32, i32, i32, i32, i32, i64)>, linkage = #llvm.linkage<external>, sym_name = "tma_prefetch_gather4_2d", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg0: !llvm.ptr, %arg1: i32, %arg2: i32, %arg3: i32, %arg4: i32, %arg5: i32, %arg6: i64):
    "nvvm.cp.async.bulk.tensor.prefetch"(%arg0, %arg1, %arg2, %arg3, %arg4, %arg5) <{mode = #nvvm.tma_load_mode<tile_gather4>, operandSegmentSizes = array<i32: 1, 5, 0, 0>}> : (!llvm.ptr, i32, i32, i32, i32, i32) -> ()
    "nvvm.cp.async.bulk.tensor.prefetch"(%arg0, %arg1, %arg2, %arg3, %arg4, %arg5, %arg6) <{mode = #nvvm.tma_load_mode<tile_gather4>, operandSegmentSizes = array<i32: 1, 5, 0, 1>}> : (!llvm.ptr, i32, i32, i32, i32, i32, i64) -> ()
    "llvm.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

