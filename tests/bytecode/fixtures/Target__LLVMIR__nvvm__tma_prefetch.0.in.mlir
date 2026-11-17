"builtin.module"() ({
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (ptr<1>, i32, i64)>, linkage = #llvm.linkage<external>, sym_name = "tma_bulk_prefetch", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg39: !llvm.ptr<1> loc("<stdin>":3:8), %arg40: i32 loc("<stdin>":3:30), %arg41: i64 loc("<stdin>":3:43)):
    "nvvm.cp.async.bulk.prefetch"(%arg39, %arg40) : (!llvm.ptr<1>, i32) -> () loc("<stdin>":4:5)
    "nvvm.cp.async.bulk.prefetch"(%arg39, %arg40, %arg41) : (!llvm.ptr<1>, i32, i64) -> () loc("<stdin>":5:5)
    "llvm.return"() : () -> () loc("<stdin>":6:5)
  }) : () -> () loc("<stdin>":2:3)
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (ptr, i32, i64)>, linkage = #llvm.linkage<external>, sym_name = "tma_prefetch_1d", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg36: !llvm.ptr loc("<stdin>":9:8), %arg37: i32 loc("<stdin>":9:27), %arg38: i64 loc("<stdin>":9:40)):
    "nvvm.cp.async.bulk.tensor.prefetch"(%arg36, %arg37) <{mode = #nvvm.tma_load_mode<tile>, operandSegmentSizes = array<i32: 1, 1, 0, 0>}> : (!llvm.ptr, i32) -> () loc("<stdin>":10:5)
    "nvvm.cp.async.bulk.tensor.prefetch"(%arg36, %arg37, %arg38) <{mode = #nvvm.tma_load_mode<tile>, operandSegmentSizes = array<i32: 1, 1, 0, 1>}> : (!llvm.ptr, i32, i64) -> () loc("<stdin>":11:5)
    "llvm.return"() : () -> () loc("<stdin>":12:5)
  }) : () -> () loc("<stdin>":8:3)
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (ptr, i32, i32, i64)>, linkage = #llvm.linkage<external>, sym_name = "tma_prefetch_2d", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg32: !llvm.ptr loc("<stdin>":15:8), %arg33: i32 loc("<stdin>":15:27), %arg34: i32 loc("<stdin>":15:40), %arg35: i64 loc("<stdin>":15:53)):
    "nvvm.cp.async.bulk.tensor.prefetch"(%arg32, %arg33, %arg34) <{mode = #nvvm.tma_load_mode<tile>, operandSegmentSizes = array<i32: 1, 2, 0, 0>}> : (!llvm.ptr, i32, i32) -> () loc("<stdin>":16:5)
    "nvvm.cp.async.bulk.tensor.prefetch"(%arg32, %arg33, %arg34, %arg35) <{mode = #nvvm.tma_load_mode<tile>, operandSegmentSizes = array<i32: 1, 2, 0, 1>}> : (!llvm.ptr, i32, i32, i64) -> () loc("<stdin>":17:5)
    "llvm.return"() : () -> () loc("<stdin>":18:5)
  }) : () -> () loc("<stdin>":14:3)
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (ptr, i32, i32, i32, i16, i16, i64)>, linkage = #llvm.linkage<external>, sym_name = "tma_prefetch_3d", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg25: !llvm.ptr loc("<stdin>":21:8), %arg26: i32 loc("<stdin>":21:27), %arg27: i32 loc("<stdin>":21:40), %arg28: i32 loc("<stdin>":21:53), %arg29: i16 loc("<stdin>":21:66), %arg30: i16 loc("<stdin>":21:79), %arg31: i64 loc("<stdin>":21:92)):
    "nvvm.cp.async.bulk.tensor.prefetch"(%arg25, %arg26, %arg27, %arg28) <{mode = #nvvm.tma_load_mode<tile>, operandSegmentSizes = array<i32: 1, 3, 0, 0>}> : (!llvm.ptr, i32, i32, i32) -> () loc("<stdin>":22:5)
    "nvvm.cp.async.bulk.tensor.prefetch"(%arg25, %arg26, %arg27, %arg28, %arg31) <{mode = #nvvm.tma_load_mode<tile>, operandSegmentSizes = array<i32: 1, 3, 0, 1>}> : (!llvm.ptr, i32, i32, i32, i64) -> () loc("<stdin>":23:5)
    "nvvm.cp.async.bulk.tensor.prefetch"(%arg25, %arg26, %arg27, %arg28, %arg29) <{mode = #nvvm.tma_load_mode<im2col>, operandSegmentSizes = array<i32: 1, 3, 1, 0>}> : (!llvm.ptr, i32, i32, i32, i16) -> () loc("<stdin>":24:5)
    "nvvm.cp.async.bulk.tensor.prefetch"(%arg25, %arg26, %arg27, %arg28, %arg29, %arg31) <{mode = #nvvm.tma_load_mode<im2col>, operandSegmentSizes = array<i32: 1, 3, 1, 1>}> : (!llvm.ptr, i32, i32, i32, i16, i64) -> () loc("<stdin>":25:5)
    "nvvm.cp.async.bulk.tensor.prefetch"(%arg25, %arg26, %arg27, %arg28, %arg29, %arg30) <{mode = #nvvm.tma_load_mode<im2col_w>, operandSegmentSizes = array<i32: 1, 3, 2, 0>}> : (!llvm.ptr, i32, i32, i32, i16, i16) -> () loc("<stdin>":26:5)
    "nvvm.cp.async.bulk.tensor.prefetch"(%arg25, %arg26, %arg27, %arg28, %arg29, %arg30, %arg31) <{mode = #nvvm.tma_load_mode<im2col_w>, operandSegmentSizes = array<i32: 1, 3, 2, 1>}> : (!llvm.ptr, i32, i32, i32, i16, i16, i64) -> () loc("<stdin>":27:5)
    "nvvm.cp.async.bulk.tensor.prefetch"(%arg25, %arg26, %arg27, %arg28, %arg29, %arg30) <{mode = #nvvm.tma_load_mode<im2col_w_128>, operandSegmentSizes = array<i32: 1, 3, 2, 0>}> : (!llvm.ptr, i32, i32, i32, i16, i16) -> () loc("<stdin>":28:5)
    "nvvm.cp.async.bulk.tensor.prefetch"(%arg25, %arg26, %arg27, %arg28, %arg29, %arg30, %arg31) <{mode = #nvvm.tma_load_mode<im2col_w_128>, operandSegmentSizes = array<i32: 1, 3, 2, 1>}> : (!llvm.ptr, i32, i32, i32, i16, i16, i64) -> () loc("<stdin>":29:5)
    "llvm.return"() : () -> () loc("<stdin>":30:5)
  }) : () -> () loc("<stdin>":20:3)
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (ptr, i32, i32, i32, i32, i16, i16, i64)>, linkage = #llvm.linkage<external>, sym_name = "tma_prefetch_4d", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg17: !llvm.ptr loc("<stdin>":33:8), %arg18: i32 loc("<stdin>":33:27), %arg19: i32 loc("<stdin>":33:40), %arg20: i32 loc("<stdin>":33:53), %arg21: i32 loc("<stdin>":33:66), %arg22: i16 loc("<stdin>":33:79), %arg23: i16 loc("<stdin>":33:92), %arg24: i64 loc("<stdin>":33:105)):
    "nvvm.cp.async.bulk.tensor.prefetch"(%arg17, %arg18, %arg19, %arg20, %arg21) <{mode = #nvvm.tma_load_mode<tile>, operandSegmentSizes = array<i32: 1, 4, 0, 0>}> : (!llvm.ptr, i32, i32, i32, i32) -> () loc("<stdin>":34:5)
    "nvvm.cp.async.bulk.tensor.prefetch"(%arg17, %arg18, %arg19, %arg20, %arg21, %arg24) <{mode = #nvvm.tma_load_mode<tile>, operandSegmentSizes = array<i32: 1, 4, 0, 1>}> : (!llvm.ptr, i32, i32, i32, i32, i64) -> () loc("<stdin>":35:5)
    "nvvm.cp.async.bulk.tensor.prefetch"(%arg17, %arg18, %arg19, %arg20, %arg21, %arg22, %arg23) <{mode = #nvvm.tma_load_mode<im2col>, operandSegmentSizes = array<i32: 1, 4, 2, 0>}> : (!llvm.ptr, i32, i32, i32, i32, i16, i16) -> () loc("<stdin>":36:5)
    "nvvm.cp.async.bulk.tensor.prefetch"(%arg17, %arg18, %arg19, %arg20, %arg21, %arg22, %arg23, %arg24) <{mode = #nvvm.tma_load_mode<im2col>, operandSegmentSizes = array<i32: 1, 4, 2, 1>}> : (!llvm.ptr, i32, i32, i32, i32, i16, i16, i64) -> () loc("<stdin>":37:5)
    "nvvm.cp.async.bulk.tensor.prefetch"(%arg17, %arg18, %arg19, %arg20, %arg21, %arg22, %arg23) <{mode = #nvvm.tma_load_mode<im2col_w>, operandSegmentSizes = array<i32: 1, 4, 2, 0>}> : (!llvm.ptr, i32, i32, i32, i32, i16, i16) -> () loc("<stdin>":38:5)
    "nvvm.cp.async.bulk.tensor.prefetch"(%arg17, %arg18, %arg19, %arg20, %arg21, %arg22, %arg23, %arg24) <{mode = #nvvm.tma_load_mode<im2col_w>, operandSegmentSizes = array<i32: 1, 4, 2, 1>}> : (!llvm.ptr, i32, i32, i32, i32, i16, i16, i64) -> () loc("<stdin>":39:5)
    "nvvm.cp.async.bulk.tensor.prefetch"(%arg17, %arg18, %arg19, %arg20, %arg21, %arg22, %arg23) <{mode = #nvvm.tma_load_mode<im2col_w_128>, operandSegmentSizes = array<i32: 1, 4, 2, 0>}> : (!llvm.ptr, i32, i32, i32, i32, i16, i16) -> () loc("<stdin>":40:5)
    "nvvm.cp.async.bulk.tensor.prefetch"(%arg17, %arg18, %arg19, %arg20, %arg21, %arg22, %arg23, %arg24) <{mode = #nvvm.tma_load_mode<im2col_w_128>, operandSegmentSizes = array<i32: 1, 4, 2, 1>}> : (!llvm.ptr, i32, i32, i32, i32, i16, i16, i64) -> () loc("<stdin>":41:5)
    "llvm.return"() : () -> () loc("<stdin>":42:5)
  }) : () -> () loc("<stdin>":32:3)
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (ptr, i32, i32, i32, i32, i32, i16, i16, i16, i64)>, linkage = #llvm.linkage<external>, sym_name = "tma_prefetch_5d", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg7: !llvm.ptr loc("<stdin>":45:8), %arg8: i32 loc("<stdin>":45:26), %arg9: i32 loc("<stdin>":45:38), %arg10: i32 loc("<stdin>":45:50), %arg11: i32 loc("<stdin>":45:63), %arg12: i32 loc("<stdin>":45:76), %arg13: i16 loc("<stdin>":45:89), %arg14: i16 loc("<stdin>":45:102), %arg15: i16 loc("<stdin>":45:115), %arg16: i64 loc("<stdin>":45:128)):
    "nvvm.cp.async.bulk.tensor.prefetch"(%arg7, %arg8, %arg9, %arg10, %arg11, %arg12) <{mode = #nvvm.tma_load_mode<tile>, operandSegmentSizes = array<i32: 1, 5, 0, 0>}> : (!llvm.ptr, i32, i32, i32, i32, i32) -> () loc("<stdin>":46:5)
    "nvvm.cp.async.bulk.tensor.prefetch"(%arg7, %arg8, %arg9, %arg10, %arg11, %arg12, %arg16) <{mode = #nvvm.tma_load_mode<tile>, operandSegmentSizes = array<i32: 1, 5, 0, 1>}> : (!llvm.ptr, i32, i32, i32, i32, i32, i64) -> () loc("<stdin>":47:5)
    "nvvm.cp.async.bulk.tensor.prefetch"(%arg7, %arg8, %arg9, %arg10, %arg11, %arg12, %arg13, %arg14, %arg15) <{mode = #nvvm.tma_load_mode<im2col>, operandSegmentSizes = array<i32: 1, 5, 3, 0>}> : (!llvm.ptr, i32, i32, i32, i32, i32, i16, i16, i16) -> () loc("<stdin>":48:5)
    "nvvm.cp.async.bulk.tensor.prefetch"(%arg7, %arg8, %arg9, %arg10, %arg11, %arg12, %arg13, %arg14, %arg15, %arg16) <{mode = #nvvm.tma_load_mode<im2col>, operandSegmentSizes = array<i32: 1, 5, 3, 1>}> : (!llvm.ptr, i32, i32, i32, i32, i32, i16, i16, i16, i64) -> () loc("<stdin>":49:5)
    "nvvm.cp.async.bulk.tensor.prefetch"(%arg7, %arg8, %arg9, %arg10, %arg11, %arg12, %arg13, %arg14) <{mode = #nvvm.tma_load_mode<im2col_w>, operandSegmentSizes = array<i32: 1, 5, 2, 0>}> : (!llvm.ptr, i32, i32, i32, i32, i32, i16, i16) -> () loc("<stdin>":50:5)
    "nvvm.cp.async.bulk.tensor.prefetch"(%arg7, %arg8, %arg9, %arg10, %arg11, %arg12, %arg13, %arg14, %arg16) <{mode = #nvvm.tma_load_mode<im2col_w>, operandSegmentSizes = array<i32: 1, 5, 2, 1>}> : (!llvm.ptr, i32, i32, i32, i32, i32, i16, i16, i64) -> () loc("<stdin>":51:5)
    "nvvm.cp.async.bulk.tensor.prefetch"(%arg7, %arg8, %arg9, %arg10, %arg11, %arg12, %arg13, %arg14) <{mode = #nvvm.tma_load_mode<im2col_w_128>, operandSegmentSizes = array<i32: 1, 5, 2, 0>}> : (!llvm.ptr, i32, i32, i32, i32, i32, i16, i16) -> () loc("<stdin>":52:5)
    "nvvm.cp.async.bulk.tensor.prefetch"(%arg7, %arg8, %arg9, %arg10, %arg11, %arg12, %arg13, %arg14, %arg16) <{mode = #nvvm.tma_load_mode<im2col_w_128>, operandSegmentSizes = array<i32: 1, 5, 2, 1>}> : (!llvm.ptr, i32, i32, i32, i32, i32, i16, i16, i64) -> () loc("<stdin>":53:5)
    "llvm.return"() : () -> () loc("<stdin>":54:5)
  }) : () -> () loc("<stdin>":44:3)
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (ptr, i32, i32, i32, i32, i32, i64)>, linkage = #llvm.linkage<external>, sym_name = "tma_prefetch_gather4_2d", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg0: !llvm.ptr loc("<stdin>":57:8), %arg1: i32 loc("<stdin>":57:26), %arg2: i32 loc("<stdin>":57:38), %arg3: i32 loc("<stdin>":57:50), %arg4: i32 loc("<stdin>":57:62), %arg5: i32 loc("<stdin>":57:74), %arg6: i64 loc("<stdin>":57:86)):
    "nvvm.cp.async.bulk.tensor.prefetch"(%arg0, %arg1, %arg2, %arg3, %arg4, %arg5) <{mode = #nvvm.tma_load_mode<tile_gather4>, operandSegmentSizes = array<i32: 1, 5, 0, 0>}> : (!llvm.ptr, i32, i32, i32, i32, i32) -> () loc("<stdin>":58:5)
    "nvvm.cp.async.bulk.tensor.prefetch"(%arg0, %arg1, %arg2, %arg3, %arg4, %arg5, %arg6) <{mode = #nvvm.tma_load_mode<tile_gather4>, operandSegmentSizes = array<i32: 1, 5, 0, 1>}> : (!llvm.ptr, i32, i32, i32, i32, i32, i64) -> () loc("<stdin>":59:5)
    "llvm.return"() : () -> () loc("<stdin>":60:5)
  }) : () -> () loc("<stdin>":56:3)
}) : () -> () loc("<stdin>":1:1)
