"builtin.module"() ({
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (ptr, ptr<3>, i32, i64)>, linkage = #llvm.linkage<external>, sym_name = "tma_store_1d", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg34: !llvm.ptr, %arg35: !llvm.ptr<3>, %arg36: i32, %arg37: i64):
    "nvvm.cp.async.bulk.tensor.global.shared.cta"(%arg34, %arg35, %arg36) <{mode = #nvvm.tma_store_mode<tile>, operandSegmentSizes = array<i32: 1, 1, 1, 0, 0>}> : (!llvm.ptr, !llvm.ptr<3>, i32) -> ()
    "nvvm.cp.async.bulk.tensor.global.shared.cta"(%arg34, %arg35, %arg36, %arg37) <{mode = #nvvm.tma_store_mode<tile>, operandSegmentSizes = array<i32: 1, 1, 1, 1, 0>}> : (!llvm.ptr, !llvm.ptr<3>, i32, i64) -> ()
    "llvm.return"() : () -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (ptr, ptr<3>, i32, i32, i64)>, linkage = #llvm.linkage<external>, sym_name = "tma_store_2d", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg29: !llvm.ptr, %arg30: !llvm.ptr<3>, %arg31: i32, %arg32: i32, %arg33: i64):
    "nvvm.cp.async.bulk.tensor.global.shared.cta"(%arg29, %arg30, %arg31, %arg32) <{mode = #nvvm.tma_store_mode<tile>, operandSegmentSizes = array<i32: 1, 1, 2, 0, 0>}> : (!llvm.ptr, !llvm.ptr<3>, i32, i32) -> ()
    "nvvm.cp.async.bulk.tensor.global.shared.cta"(%arg29, %arg30, %arg31, %arg32, %arg33) <{mode = #nvvm.tma_store_mode<tile>, operandSegmentSizes = array<i32: 1, 1, 2, 1, 0>}> : (!llvm.ptr, !llvm.ptr<3>, i32, i32, i64) -> ()
    "llvm.return"() : () -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (ptr, ptr<3>, i32, i32, i32, i64)>, linkage = #llvm.linkage<external>, sym_name = "tma_store_3d", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg23: !llvm.ptr, %arg24: !llvm.ptr<3>, %arg25: i32, %arg26: i32, %arg27: i32, %arg28: i64):
    "nvvm.cp.async.bulk.tensor.global.shared.cta"(%arg23, %arg24, %arg25, %arg26, %arg27) <{mode = #nvvm.tma_store_mode<tile>, operandSegmentSizes = array<i32: 1, 1, 3, 0, 0>}> : (!llvm.ptr, !llvm.ptr<3>, i32, i32, i32) -> ()
    "nvvm.cp.async.bulk.tensor.global.shared.cta"(%arg23, %arg24, %arg25, %arg26, %arg27, %arg28) <{mode = #nvvm.tma_store_mode<tile>, operandSegmentSizes = array<i32: 1, 1, 3, 1, 0>}> : (!llvm.ptr, !llvm.ptr<3>, i32, i32, i32, i64) -> ()
    "nvvm.cp.async.bulk.tensor.global.shared.cta"(%arg23, %arg24, %arg25, %arg26, %arg27) <{mode = #nvvm.tma_store_mode<im2col>, operandSegmentSizes = array<i32: 1, 1, 3, 0, 0>}> : (!llvm.ptr, !llvm.ptr<3>, i32, i32, i32) -> ()
    "nvvm.cp.async.bulk.tensor.global.shared.cta"(%arg23, %arg24, %arg25, %arg26, %arg27, %arg28) <{mode = #nvvm.tma_store_mode<im2col>, operandSegmentSizes = array<i32: 1, 1, 3, 1, 0>}> : (!llvm.ptr, !llvm.ptr<3>, i32, i32, i32, i64) -> ()
    "llvm.return"() : () -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (ptr, ptr<3>, i32, i32, i32, i32, i64)>, linkage = #llvm.linkage<external>, sym_name = "tma_store_4d", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg16: !llvm.ptr, %arg17: !llvm.ptr<3>, %arg18: i32, %arg19: i32, %arg20: i32, %arg21: i32, %arg22: i64):
    "nvvm.cp.async.bulk.tensor.global.shared.cta"(%arg16, %arg17, %arg18, %arg19, %arg20, %arg21) <{mode = #nvvm.tma_store_mode<tile>, operandSegmentSizes = array<i32: 1, 1, 4, 0, 0>}> : (!llvm.ptr, !llvm.ptr<3>, i32, i32, i32, i32) -> ()
    "nvvm.cp.async.bulk.tensor.global.shared.cta"(%arg16, %arg17, %arg18, %arg19, %arg20, %arg21, %arg22) <{mode = #nvvm.tma_store_mode<tile>, operandSegmentSizes = array<i32: 1, 1, 4, 1, 0>}> : (!llvm.ptr, !llvm.ptr<3>, i32, i32, i32, i32, i64) -> ()
    "nvvm.cp.async.bulk.tensor.global.shared.cta"(%arg16, %arg17, %arg18, %arg19, %arg20, %arg21) <{mode = #nvvm.tma_store_mode<im2col>, operandSegmentSizes = array<i32: 1, 1, 4, 0, 0>}> : (!llvm.ptr, !llvm.ptr<3>, i32, i32, i32, i32) -> ()
    "nvvm.cp.async.bulk.tensor.global.shared.cta"(%arg16, %arg17, %arg18, %arg19, %arg20, %arg21, %arg22) <{mode = #nvvm.tma_store_mode<im2col>, operandSegmentSizes = array<i32: 1, 1, 4, 1, 0>}> : (!llvm.ptr, !llvm.ptr<3>, i32, i32, i32, i32, i64) -> ()
    "llvm.return"() : () -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (ptr, ptr<3>, i32, i32, i32, i32, i32, i64)>, linkage = #llvm.linkage<external>, sym_name = "tma_store_5d", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg8: !llvm.ptr, %arg9: !llvm.ptr<3>, %arg10: i32, %arg11: i32, %arg12: i32, %arg13: i32, %arg14: i32, %arg15: i64):
    "nvvm.cp.async.bulk.tensor.global.shared.cta"(%arg8, %arg9, %arg10, %arg11, %arg12, %arg13, %arg14) <{mode = #nvvm.tma_store_mode<tile>, operandSegmentSizes = array<i32: 1, 1, 5, 0, 0>}> : (!llvm.ptr, !llvm.ptr<3>, i32, i32, i32, i32, i32) -> ()
    "nvvm.cp.async.bulk.tensor.global.shared.cta"(%arg8, %arg9, %arg10, %arg11, %arg12, %arg13, %arg14, %arg15) <{mode = #nvvm.tma_store_mode<tile>, operandSegmentSizes = array<i32: 1, 1, 5, 1, 0>}> : (!llvm.ptr, !llvm.ptr<3>, i32, i32, i32, i32, i32, i64) -> ()
    "nvvm.cp.async.bulk.tensor.global.shared.cta"(%arg8, %arg9, %arg10, %arg11, %arg12, %arg13, %arg14) <{mode = #nvvm.tma_store_mode<im2col>, operandSegmentSizes = array<i32: 1, 1, 5, 0, 0>}> : (!llvm.ptr, !llvm.ptr<3>, i32, i32, i32, i32, i32) -> ()
    "nvvm.cp.async.bulk.tensor.global.shared.cta"(%arg8, %arg9, %arg10, %arg11, %arg12, %arg13, %arg14, %arg15) <{mode = #nvvm.tma_store_mode<im2col>, operandSegmentSizes = array<i32: 1, 1, 5, 1, 0>}> : (!llvm.ptr, !llvm.ptr<3>, i32, i32, i32, i32, i32, i64) -> ()
    "llvm.return"() : () -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (ptr, ptr<3>, i32, i32, i32, i32, i32, i64)>, linkage = #llvm.linkage<external>, sym_name = "tma_store_scatter", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg0: !llvm.ptr, %arg1: !llvm.ptr<3>, %arg2: i32, %arg3: i32, %arg4: i32, %arg5: i32, %arg6: i32, %arg7: i64):
    "nvvm.cp.async.bulk.tensor.global.shared.cta"(%arg0, %arg1, %arg2, %arg3, %arg4, %arg5, %arg6) <{mode = #nvvm.tma_store_mode<tile_scatter4>, operandSegmentSizes = array<i32: 1, 1, 5, 0, 0>}> : (!llvm.ptr, !llvm.ptr<3>, i32, i32, i32, i32, i32) -> ()
    "nvvm.cp.async.bulk.tensor.global.shared.cta"(%arg0, %arg1, %arg2, %arg3, %arg4, %arg5, %arg6, %arg7) <{mode = #nvvm.tma_store_mode<tile_scatter4>, operandSegmentSizes = array<i32: 1, 1, 5, 1, 0>}> : (!llvm.ptr, !llvm.ptr<3>, i32, i32, i32, i32, i32, i64) -> ()
    "llvm.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

