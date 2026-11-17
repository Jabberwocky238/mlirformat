"builtin.module"() ({
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (ptr, ptr<3>, ptr<3>, i32, i64)>, linkage = #llvm.linkage<external>, sym_name = "tma_load_1d_all_tile", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg39: !llvm.ptr loc("<stdin>":3:8), %arg40: !llvm.ptr<3> loc("<stdin>":3:27), %arg41: !llvm.ptr<3> loc("<stdin>":3:49), %arg42: i32 loc("<stdin>":3:71), %arg43: i64 loc("<stdin>":3:84)):
    "nvvm.cp.async.bulk.tensor.shared.cluster.global"(%arg40, %arg39, %arg42, %arg41) <{isCTAOnly = true, mode = #nvvm.tma_load_mode<tile>, operandSegmentSizes = array<i32: 1, 1, 1, 1, 0, 0, 0, 0>}> : (!llvm.ptr<3>, !llvm.ptr, i32, !llvm.ptr<3>) -> () loc("<stdin>":4:5)
    "nvvm.cp.async.bulk.tensor.shared.cluster.global"(%arg40, %arg39, %arg42, %arg41, %arg43) <{isCTAOnly = true, mode = #nvvm.tma_load_mode<tile>, operandSegmentSizes = array<i32: 1, 1, 1, 1, 0, 0, 1, 0>}> : (!llvm.ptr<3>, !llvm.ptr, i32, !llvm.ptr<3>, i64) -> () loc("<stdin>":5:5)
    "llvm.return"() : () -> () loc("<stdin>":6:5)
  }) : () -> () loc("<stdin>":2:3)
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (ptr, ptr<3>, ptr<3>, i32, i32, i64)>, linkage = #llvm.linkage<external>, sym_name = "tma_load_2d_all_tile", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg33: !llvm.ptr loc("<stdin>":9:8), %arg34: !llvm.ptr<3> loc("<stdin>":9:27), %arg35: !llvm.ptr<3> loc("<stdin>":9:49), %arg36: i32 loc("<stdin>":9:71), %arg37: i32 loc("<stdin>":9:84), %arg38: i64 loc("<stdin>":9:97)):
    "nvvm.cp.async.bulk.tensor.shared.cluster.global"(%arg34, %arg33, %arg36, %arg37, %arg35) <{isCTAOnly = true, mode = #nvvm.tma_load_mode<tile>, operandSegmentSizes = array<i32: 1, 1, 2, 1, 0, 0, 0, 0>}> : (!llvm.ptr<3>, !llvm.ptr, i32, i32, !llvm.ptr<3>) -> () loc("<stdin>":10:5)
    "nvvm.cp.async.bulk.tensor.shared.cluster.global"(%arg34, %arg33, %arg36, %arg37, %arg35, %arg38) <{isCTAOnly = true, mode = #nvvm.tma_load_mode<tile>, operandSegmentSizes = array<i32: 1, 1, 2, 1, 0, 0, 1, 0>}> : (!llvm.ptr<3>, !llvm.ptr, i32, i32, !llvm.ptr<3>, i64) -> () loc("<stdin>":11:5)
    "llvm.return"() : () -> () loc("<stdin>":12:5)
  }) : () -> () loc("<stdin>":8:3)
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (ptr, ptr<3>, ptr<3>, i32, i32, i32, i64)>, linkage = #llvm.linkage<external>, sym_name = "tma_load_3d_all_tile", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg26: !llvm.ptr loc("<stdin>":15:8), %arg27: !llvm.ptr<3> loc("<stdin>":15:27), %arg28: !llvm.ptr<3> loc("<stdin>":15:49), %arg29: i32 loc("<stdin>":15:71), %arg30: i32 loc("<stdin>":15:84), %arg31: i32 loc("<stdin>":15:97), %arg32: i64 loc("<stdin>":15:110)):
    "nvvm.cp.async.bulk.tensor.shared.cluster.global"(%arg27, %arg26, %arg29, %arg30, %arg31, %arg28) <{isCTAOnly = true, mode = #nvvm.tma_load_mode<tile>, operandSegmentSizes = array<i32: 1, 1, 3, 1, 0, 0, 0, 0>}> : (!llvm.ptr<3>, !llvm.ptr, i32, i32, i32, !llvm.ptr<3>) -> () loc("<stdin>":16:5)
    "nvvm.cp.async.bulk.tensor.shared.cluster.global"(%arg27, %arg26, %arg29, %arg30, %arg31, %arg28, %arg32) <{isCTAOnly = true, mode = #nvvm.tma_load_mode<tile>, operandSegmentSizes = array<i32: 1, 1, 3, 1, 0, 0, 1, 0>}> : (!llvm.ptr<3>, !llvm.ptr, i32, i32, i32, !llvm.ptr<3>, i64) -> () loc("<stdin>":17:5)
    "llvm.return"() : () -> () loc("<stdin>":18:5)
  }) : () -> () loc("<stdin>":14:3)
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (ptr, ptr<3>, ptr<3>, i32, i32, i32, i32, i64)>, linkage = #llvm.linkage<external>, sym_name = "tma_load_4d_all_tile", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg18: !llvm.ptr loc("<stdin>":21:8), %arg19: !llvm.ptr<3> loc("<stdin>":21:27), %arg20: !llvm.ptr<3> loc("<stdin>":21:49), %arg21: i32 loc("<stdin>":21:71), %arg22: i32 loc("<stdin>":21:84), %arg23: i32 loc("<stdin>":21:97), %arg24: i32 loc("<stdin>":21:110), %arg25: i64 loc("<stdin>":21:123)):
    "nvvm.cp.async.bulk.tensor.shared.cluster.global"(%arg19, %arg18, %arg21, %arg22, %arg23, %arg24, %arg20) <{isCTAOnly = true, mode = #nvvm.tma_load_mode<tile>, operandSegmentSizes = array<i32: 1, 1, 4, 1, 0, 0, 0, 0>}> : (!llvm.ptr<3>, !llvm.ptr, i32, i32, i32, i32, !llvm.ptr<3>) -> () loc("<stdin>":22:5)
    "nvvm.cp.async.bulk.tensor.shared.cluster.global"(%arg19, %arg18, %arg21, %arg22, %arg23, %arg24, %arg20, %arg25) <{isCTAOnly = true, mode = #nvvm.tma_load_mode<tile>, operandSegmentSizes = array<i32: 1, 1, 4, 1, 0, 0, 1, 0>}> : (!llvm.ptr<3>, !llvm.ptr, i32, i32, i32, i32, !llvm.ptr<3>, i64) -> () loc("<stdin>":23:5)
    "llvm.return"() : () -> () loc("<stdin>":24:5)
  }) : () -> () loc("<stdin>":20:3)
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (ptr, ptr<3>, ptr<3>, i32, i32, i32, i32, i32, i64)>, linkage = #llvm.linkage<external>, sym_name = "tma_load_5d_all", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg9: !llvm.ptr loc("<stdin>":27:8), %arg10: !llvm.ptr<3> loc("<stdin>":27:26), %arg11: !llvm.ptr<3> loc("<stdin>":27:48), %arg12: i32 loc("<stdin>":27:70), %arg13: i32 loc("<stdin>":27:83), %arg14: i32 loc("<stdin>":27:96), %arg15: i32 loc("<stdin>":27:109), %arg16: i32 loc("<stdin>":27:122), %arg17: i64 loc("<stdin>":27:135)):
    "nvvm.cp.async.bulk.tensor.shared.cluster.global"(%arg10, %arg9, %arg12, %arg13, %arg14, %arg15, %arg16, %arg11) <{isCTAOnly = true, mode = #nvvm.tma_load_mode<tile>, operandSegmentSizes = array<i32: 1, 1, 5, 1, 0, 0, 0, 0>}> : (!llvm.ptr<3>, !llvm.ptr, i32, i32, i32, i32, i32, !llvm.ptr<3>) -> () loc("<stdin>":28:5)
    "nvvm.cp.async.bulk.tensor.shared.cluster.global"(%arg10, %arg9, %arg12, %arg13, %arg14, %arg15, %arg16, %arg11, %arg17) <{isCTAOnly = true, mode = #nvvm.tma_load_mode<tile>, operandSegmentSizes = array<i32: 1, 1, 5, 1, 0, 0, 1, 0>}> : (!llvm.ptr<3>, !llvm.ptr, i32, i32, i32, i32, i32, !llvm.ptr<3>, i64) -> () loc("<stdin>":29:5)
    "llvm.return"() : () -> () loc("<stdin>":30:5)
  }) : () -> () loc("<stdin>":26:3)
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (ptr, ptr<3>, ptr<3>, i32, i32, i32, i32, i32, i64)>, linkage = #llvm.linkage<external>, sym_name = "tma_load_2d_tile_gather4", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg0: !llvm.ptr loc("<stdin>":33:8), %arg1: !llvm.ptr<3> loc("<stdin>":33:26), %arg2: !llvm.ptr<3> loc("<stdin>":33:47), %arg3: i32 loc("<stdin>":33:68), %arg4: i32 loc("<stdin>":33:80), %arg5: i32 loc("<stdin>":33:92), %arg6: i32 loc("<stdin>":33:104), %arg7: i32 loc("<stdin>":33:116), %arg8: i64 loc("<stdin>":33:128)):
    "nvvm.cp.async.bulk.tensor.shared.cluster.global"(%arg1, %arg0, %arg3, %arg4, %arg5, %arg6, %arg7, %arg2) <{isCTAOnly = true, mode = #nvvm.tma_load_mode<tile_gather4>, operandSegmentSizes = array<i32: 1, 1, 5, 1, 0, 0, 0, 0>}> : (!llvm.ptr<3>, !llvm.ptr, i32, i32, i32, i32, i32, !llvm.ptr<3>) -> () loc("<stdin>":34:5)
    "nvvm.cp.async.bulk.tensor.shared.cluster.global"(%arg1, %arg0, %arg3, %arg4, %arg5, %arg6, %arg7, %arg2, %arg8) <{isCTAOnly = true, mode = #nvvm.tma_load_mode<tile_gather4>, operandSegmentSizes = array<i32: 1, 1, 5, 1, 0, 0, 1, 0>}> : (!llvm.ptr<3>, !llvm.ptr, i32, i32, i32, i32, i32, !llvm.ptr<3>, i64) -> () loc("<stdin>":35:5)
    "llvm.return"() : () -> () loc("<stdin>":36:5)
  }) : () -> () loc("<stdin>":32:3)
}) : () -> () loc("<stdin>":1:1)
