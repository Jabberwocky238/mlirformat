"builtin.module"() ({
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (ptr, ptr<3>, ptr<3>, i32, i64)>, linkage = #llvm.linkage<external>, sym_name = "tma_load_1d_all_tile", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg39: !llvm.ptr, %arg40: !llvm.ptr<3>, %arg41: !llvm.ptr<3>, %arg42: i32, %arg43: i64):
    "nvvm.cp.async.bulk.tensor.shared.cluster.global"(%arg40, %arg39, %arg42, %arg41) <{isCTAOnly = true, mode = #nvvm.tma_load_mode<tile>, operandSegmentSizes = array<i32: 1, 1, 1, 1, 0, 0, 0, 0>}> : (!llvm.ptr<3>, !llvm.ptr, i32, !llvm.ptr<3>) -> ()
    "nvvm.cp.async.bulk.tensor.shared.cluster.global"(%arg40, %arg39, %arg42, %arg41, %arg43) <{isCTAOnly = true, mode = #nvvm.tma_load_mode<tile>, operandSegmentSizes = array<i32: 1, 1, 1, 1, 0, 0, 1, 0>}> : (!llvm.ptr<3>, !llvm.ptr, i32, !llvm.ptr<3>, i64) -> ()
    "llvm.return"() : () -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (ptr, ptr<3>, ptr<3>, i32, i32, i64)>, linkage = #llvm.linkage<external>, sym_name = "tma_load_2d_all_tile", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg33: !llvm.ptr, %arg34: !llvm.ptr<3>, %arg35: !llvm.ptr<3>, %arg36: i32, %arg37: i32, %arg38: i64):
    "nvvm.cp.async.bulk.tensor.shared.cluster.global"(%arg34, %arg33, %arg36, %arg37, %arg35) <{isCTAOnly = true, mode = #nvvm.tma_load_mode<tile>, operandSegmentSizes = array<i32: 1, 1, 2, 1, 0, 0, 0, 0>}> : (!llvm.ptr<3>, !llvm.ptr, i32, i32, !llvm.ptr<3>) -> ()
    "nvvm.cp.async.bulk.tensor.shared.cluster.global"(%arg34, %arg33, %arg36, %arg37, %arg35, %arg38) <{isCTAOnly = true, mode = #nvvm.tma_load_mode<tile>, operandSegmentSizes = array<i32: 1, 1, 2, 1, 0, 0, 1, 0>}> : (!llvm.ptr<3>, !llvm.ptr, i32, i32, !llvm.ptr<3>, i64) -> ()
    "llvm.return"() : () -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (ptr, ptr<3>, ptr<3>, i32, i32, i32, i64)>, linkage = #llvm.linkage<external>, sym_name = "tma_load_3d_all_tile", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg26: !llvm.ptr, %arg27: !llvm.ptr<3>, %arg28: !llvm.ptr<3>, %arg29: i32, %arg30: i32, %arg31: i32, %arg32: i64):
    "nvvm.cp.async.bulk.tensor.shared.cluster.global"(%arg27, %arg26, %arg29, %arg30, %arg31, %arg28) <{isCTAOnly = true, mode = #nvvm.tma_load_mode<tile>, operandSegmentSizes = array<i32: 1, 1, 3, 1, 0, 0, 0, 0>}> : (!llvm.ptr<3>, !llvm.ptr, i32, i32, i32, !llvm.ptr<3>) -> ()
    "nvvm.cp.async.bulk.tensor.shared.cluster.global"(%arg27, %arg26, %arg29, %arg30, %arg31, %arg28, %arg32) <{isCTAOnly = true, mode = #nvvm.tma_load_mode<tile>, operandSegmentSizes = array<i32: 1, 1, 3, 1, 0, 0, 1, 0>}> : (!llvm.ptr<3>, !llvm.ptr, i32, i32, i32, !llvm.ptr<3>, i64) -> ()
    "llvm.return"() : () -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (ptr, ptr<3>, ptr<3>, i32, i32, i32, i32, i64)>, linkage = #llvm.linkage<external>, sym_name = "tma_load_4d_all_tile", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg18: !llvm.ptr, %arg19: !llvm.ptr<3>, %arg20: !llvm.ptr<3>, %arg21: i32, %arg22: i32, %arg23: i32, %arg24: i32, %arg25: i64):
    "nvvm.cp.async.bulk.tensor.shared.cluster.global"(%arg19, %arg18, %arg21, %arg22, %arg23, %arg24, %arg20) <{isCTAOnly = true, mode = #nvvm.tma_load_mode<tile>, operandSegmentSizes = array<i32: 1, 1, 4, 1, 0, 0, 0, 0>}> : (!llvm.ptr<3>, !llvm.ptr, i32, i32, i32, i32, !llvm.ptr<3>) -> ()
    "nvvm.cp.async.bulk.tensor.shared.cluster.global"(%arg19, %arg18, %arg21, %arg22, %arg23, %arg24, %arg20, %arg25) <{isCTAOnly = true, mode = #nvvm.tma_load_mode<tile>, operandSegmentSizes = array<i32: 1, 1, 4, 1, 0, 0, 1, 0>}> : (!llvm.ptr<3>, !llvm.ptr, i32, i32, i32, i32, !llvm.ptr<3>, i64) -> ()
    "llvm.return"() : () -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (ptr, ptr<3>, ptr<3>, i32, i32, i32, i32, i32, i64)>, linkage = #llvm.linkage<external>, sym_name = "tma_load_5d_all", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg9: !llvm.ptr, %arg10: !llvm.ptr<3>, %arg11: !llvm.ptr<3>, %arg12: i32, %arg13: i32, %arg14: i32, %arg15: i32, %arg16: i32, %arg17: i64):
    "nvvm.cp.async.bulk.tensor.shared.cluster.global"(%arg10, %arg9, %arg12, %arg13, %arg14, %arg15, %arg16, %arg11) <{isCTAOnly = true, mode = #nvvm.tma_load_mode<tile>, operandSegmentSizes = array<i32: 1, 1, 5, 1, 0, 0, 0, 0>}> : (!llvm.ptr<3>, !llvm.ptr, i32, i32, i32, i32, i32, !llvm.ptr<3>) -> ()
    "nvvm.cp.async.bulk.tensor.shared.cluster.global"(%arg10, %arg9, %arg12, %arg13, %arg14, %arg15, %arg16, %arg11, %arg17) <{isCTAOnly = true, mode = #nvvm.tma_load_mode<tile>, operandSegmentSizes = array<i32: 1, 1, 5, 1, 0, 0, 1, 0>}> : (!llvm.ptr<3>, !llvm.ptr, i32, i32, i32, i32, i32, !llvm.ptr<3>, i64) -> ()
    "llvm.return"() : () -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (ptr, ptr<3>, ptr<3>, i32, i32, i32, i32, i32, i64)>, linkage = #llvm.linkage<external>, sym_name = "tma_load_2d_tile_gather4", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg0: !llvm.ptr, %arg1: !llvm.ptr<3>, %arg2: !llvm.ptr<3>, %arg3: i32, %arg4: i32, %arg5: i32, %arg6: i32, %arg7: i32, %arg8: i64):
    "nvvm.cp.async.bulk.tensor.shared.cluster.global"(%arg1, %arg0, %arg3, %arg4, %arg5, %arg6, %arg7, %arg2) <{isCTAOnly = true, mode = #nvvm.tma_load_mode<tile_gather4>, operandSegmentSizes = array<i32: 1, 1, 5, 1, 0, 0, 0, 0>}> : (!llvm.ptr<3>, !llvm.ptr, i32, i32, i32, i32, i32, !llvm.ptr<3>) -> ()
    "nvvm.cp.async.bulk.tensor.shared.cluster.global"(%arg1, %arg0, %arg3, %arg4, %arg5, %arg6, %arg7, %arg2, %arg8) <{isCTAOnly = true, mode = #nvvm.tma_load_mode<tile_gather4>, operandSegmentSizes = array<i32: 1, 1, 5, 1, 0, 0, 1, 0>}> : (!llvm.ptr<3>, !llvm.ptr, i32, i32, i32, i32, i32, !llvm.ptr<3>, i64) -> ()
    "llvm.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

