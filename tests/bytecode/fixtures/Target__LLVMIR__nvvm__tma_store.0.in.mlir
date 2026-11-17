"builtin.module"() ({
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (ptr, ptr<3>, i32, i64)>, linkage = #llvm.linkage<external>, sym_name = "tma_store_1d", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg34: !llvm.ptr loc("<stdin>":3:8), %arg35: !llvm.ptr<3> loc("<stdin>":3:27), %arg36: i32 loc("<stdin>":3:49), %arg37: i64 loc("<stdin>":3:62)):
    "nvvm.cp.async.bulk.tensor.global.shared.cta"(%arg34, %arg35, %arg36) <{mode = #nvvm.tma_store_mode<tile>, operandSegmentSizes = array<i32: 1, 1, 1, 0, 0>}> : (!llvm.ptr, !llvm.ptr<3>, i32) -> () loc("<stdin>":4:5)
    "nvvm.cp.async.bulk.tensor.global.shared.cta"(%arg34, %arg35, %arg36, %arg37) <{mode = #nvvm.tma_store_mode<tile>, operandSegmentSizes = array<i32: 1, 1, 1, 1, 0>}> : (!llvm.ptr, !llvm.ptr<3>, i32, i64) -> () loc("<stdin>":5:5)
    "llvm.return"() : () -> () loc("<stdin>":6:5)
  }) : () -> () loc("<stdin>":2:3)
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (ptr, ptr<3>, i32, i32, i64)>, linkage = #llvm.linkage<external>, sym_name = "tma_store_2d", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg29: !llvm.ptr loc("<stdin>":9:8), %arg30: !llvm.ptr<3> loc("<stdin>":9:27), %arg31: i32 loc("<stdin>":9:49), %arg32: i32 loc("<stdin>":9:62), %arg33: i64 loc("<stdin>":9:75)):
    "nvvm.cp.async.bulk.tensor.global.shared.cta"(%arg29, %arg30, %arg31, %arg32) <{mode = #nvvm.tma_store_mode<tile>, operandSegmentSizes = array<i32: 1, 1, 2, 0, 0>}> : (!llvm.ptr, !llvm.ptr<3>, i32, i32) -> () loc("<stdin>":10:5)
    "nvvm.cp.async.bulk.tensor.global.shared.cta"(%arg29, %arg30, %arg31, %arg32, %arg33) <{mode = #nvvm.tma_store_mode<tile>, operandSegmentSizes = array<i32: 1, 1, 2, 1, 0>}> : (!llvm.ptr, !llvm.ptr<3>, i32, i32, i64) -> () loc("<stdin>":11:5)
    "llvm.return"() : () -> () loc("<stdin>":12:5)
  }) : () -> () loc("<stdin>":8:3)
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (ptr, ptr<3>, i32, i32, i32, i64)>, linkage = #llvm.linkage<external>, sym_name = "tma_store_3d", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg23: !llvm.ptr loc("<stdin>":15:8), %arg24: !llvm.ptr<3> loc("<stdin>":15:27), %arg25: i32 loc("<stdin>":15:49), %arg26: i32 loc("<stdin>":15:62), %arg27: i32 loc("<stdin>":15:75), %arg28: i64 loc("<stdin>":15:88)):
    "nvvm.cp.async.bulk.tensor.global.shared.cta"(%arg23, %arg24, %arg25, %arg26, %arg27) <{mode = #nvvm.tma_store_mode<tile>, operandSegmentSizes = array<i32: 1, 1, 3, 0, 0>}> : (!llvm.ptr, !llvm.ptr<3>, i32, i32, i32) -> () loc("<stdin>":16:5)
    "nvvm.cp.async.bulk.tensor.global.shared.cta"(%arg23, %arg24, %arg25, %arg26, %arg27, %arg28) <{mode = #nvvm.tma_store_mode<tile>, operandSegmentSizes = array<i32: 1, 1, 3, 1, 0>}> : (!llvm.ptr, !llvm.ptr<3>, i32, i32, i32, i64) -> () loc("<stdin>":17:5)
    "nvvm.cp.async.bulk.tensor.global.shared.cta"(%arg23, %arg24, %arg25, %arg26, %arg27) <{mode = #nvvm.tma_store_mode<im2col>, operandSegmentSizes = array<i32: 1, 1, 3, 0, 0>}> : (!llvm.ptr, !llvm.ptr<3>, i32, i32, i32) -> () loc("<stdin>":18:5)
    "nvvm.cp.async.bulk.tensor.global.shared.cta"(%arg23, %arg24, %arg25, %arg26, %arg27, %arg28) <{mode = #nvvm.tma_store_mode<im2col>, operandSegmentSizes = array<i32: 1, 1, 3, 1, 0>}> : (!llvm.ptr, !llvm.ptr<3>, i32, i32, i32, i64) -> () loc("<stdin>":19:5)
    "llvm.return"() : () -> () loc("<stdin>":20:5)
  }) : () -> () loc("<stdin>":14:3)
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (ptr, ptr<3>, i32, i32, i32, i32, i64)>, linkage = #llvm.linkage<external>, sym_name = "tma_store_4d", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg16: !llvm.ptr loc("<stdin>":23:8), %arg17: !llvm.ptr<3> loc("<stdin>":23:27), %arg18: i32 loc("<stdin>":23:49), %arg19: i32 loc("<stdin>":23:62), %arg20: i32 loc("<stdin>":23:75), %arg21: i32 loc("<stdin>":23:88), %arg22: i64 loc("<stdin>":23:101)):
    "nvvm.cp.async.bulk.tensor.global.shared.cta"(%arg16, %arg17, %arg18, %arg19, %arg20, %arg21) <{mode = #nvvm.tma_store_mode<tile>, operandSegmentSizes = array<i32: 1, 1, 4, 0, 0>}> : (!llvm.ptr, !llvm.ptr<3>, i32, i32, i32, i32) -> () loc("<stdin>":24:5)
    "nvvm.cp.async.bulk.tensor.global.shared.cta"(%arg16, %arg17, %arg18, %arg19, %arg20, %arg21, %arg22) <{mode = #nvvm.tma_store_mode<tile>, operandSegmentSizes = array<i32: 1, 1, 4, 1, 0>}> : (!llvm.ptr, !llvm.ptr<3>, i32, i32, i32, i32, i64) -> () loc("<stdin>":25:5)
    "nvvm.cp.async.bulk.tensor.global.shared.cta"(%arg16, %arg17, %arg18, %arg19, %arg20, %arg21) <{mode = #nvvm.tma_store_mode<im2col>, operandSegmentSizes = array<i32: 1, 1, 4, 0, 0>}> : (!llvm.ptr, !llvm.ptr<3>, i32, i32, i32, i32) -> () loc("<stdin>":26:5)
    "nvvm.cp.async.bulk.tensor.global.shared.cta"(%arg16, %arg17, %arg18, %arg19, %arg20, %arg21, %arg22) <{mode = #nvvm.tma_store_mode<im2col>, operandSegmentSizes = array<i32: 1, 1, 4, 1, 0>}> : (!llvm.ptr, !llvm.ptr<3>, i32, i32, i32, i32, i64) -> () loc("<stdin>":27:5)
    "llvm.return"() : () -> () loc("<stdin>":28:5)
  }) : () -> () loc("<stdin>":22:3)
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (ptr, ptr<3>, i32, i32, i32, i32, i32, i64)>, linkage = #llvm.linkage<external>, sym_name = "tma_store_5d", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg8: !llvm.ptr loc("<stdin>":31:8), %arg9: !llvm.ptr<3> loc("<stdin>":31:26), %arg10: i32 loc("<stdin>":31:47), %arg11: i32 loc("<stdin>":31:60), %arg12: i32 loc("<stdin>":31:73), %arg13: i32 loc("<stdin>":31:86), %arg14: i32 loc("<stdin>":31:99), %arg15: i64 loc("<stdin>":31:112)):
    "nvvm.cp.async.bulk.tensor.global.shared.cta"(%arg8, %arg9, %arg10, %arg11, %arg12, %arg13, %arg14) <{mode = #nvvm.tma_store_mode<tile>, operandSegmentSizes = array<i32: 1, 1, 5, 0, 0>}> : (!llvm.ptr, !llvm.ptr<3>, i32, i32, i32, i32, i32) -> () loc("<stdin>":32:5)
    "nvvm.cp.async.bulk.tensor.global.shared.cta"(%arg8, %arg9, %arg10, %arg11, %arg12, %arg13, %arg14, %arg15) <{mode = #nvvm.tma_store_mode<tile>, operandSegmentSizes = array<i32: 1, 1, 5, 1, 0>}> : (!llvm.ptr, !llvm.ptr<3>, i32, i32, i32, i32, i32, i64) -> () loc("<stdin>":33:5)
    "nvvm.cp.async.bulk.tensor.global.shared.cta"(%arg8, %arg9, %arg10, %arg11, %arg12, %arg13, %arg14) <{mode = #nvvm.tma_store_mode<im2col>, operandSegmentSizes = array<i32: 1, 1, 5, 0, 0>}> : (!llvm.ptr, !llvm.ptr<3>, i32, i32, i32, i32, i32) -> () loc("<stdin>":34:5)
    "nvvm.cp.async.bulk.tensor.global.shared.cta"(%arg8, %arg9, %arg10, %arg11, %arg12, %arg13, %arg14, %arg15) <{mode = #nvvm.tma_store_mode<im2col>, operandSegmentSizes = array<i32: 1, 1, 5, 1, 0>}> : (!llvm.ptr, !llvm.ptr<3>, i32, i32, i32, i32, i32, i64) -> () loc("<stdin>":35:5)
    "llvm.return"() : () -> () loc("<stdin>":36:5)
  }) : () -> () loc("<stdin>":30:3)
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (ptr, ptr<3>, i32, i32, i32, i32, i32, i64)>, linkage = #llvm.linkage<external>, sym_name = "tma_store_scatter", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg0: !llvm.ptr loc("<stdin>":39:8), %arg1: !llvm.ptr<3> loc("<stdin>":39:26), %arg2: i32 loc("<stdin>":39:47), %arg3: i32 loc("<stdin>":39:59), %arg4: i32 loc("<stdin>":39:71), %arg5: i32 loc("<stdin>":39:83), %arg6: i32 loc("<stdin>":39:95), %arg7: i64 loc("<stdin>":39:107)):
    "nvvm.cp.async.bulk.tensor.global.shared.cta"(%arg0, %arg1, %arg2, %arg3, %arg4, %arg5, %arg6) <{mode = #nvvm.tma_store_mode<tile_scatter4>, operandSegmentSizes = array<i32: 1, 1, 5, 0, 0>}> : (!llvm.ptr, !llvm.ptr<3>, i32, i32, i32, i32, i32) -> () loc("<stdin>":40:5)
    "nvvm.cp.async.bulk.tensor.global.shared.cta"(%arg0, %arg1, %arg2, %arg3, %arg4, %arg5, %arg6, %arg7) <{mode = #nvvm.tma_store_mode<tile_scatter4>, operandSegmentSizes = array<i32: 1, 1, 5, 1, 0>}> : (!llvm.ptr, !llvm.ptr<3>, i32, i32, i32, i32, i32, i64) -> () loc("<stdin>":41:5)
    "llvm.return"() : () -> () loc("<stdin>":42:5)
  }) : () -> () loc("<stdin>":38:3)
}) : () -> () loc("<stdin>":1:1)
