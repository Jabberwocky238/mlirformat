"builtin.module"() ({
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (ptr<7>, ptr<1>, ptr<3>, i32, i16, i64)>, linkage = #llvm.linkage<external>, sym_name = "llvm_nvvm_cp_async_bulk_global_to_shared_cluster", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg18: !llvm.ptr<7>, %arg19: !llvm.ptr<1>, %arg20: !llvm.ptr<3>, %arg21: i32, %arg22: i16, %arg23: i64):
    "nvvm.cp.async.bulk.shared.cluster.global"(%arg18, %arg19, %arg20, %arg21) <{operandSegmentSizes = array<i32: 1, 1, 1, 1, 0, 0>}> : (!llvm.ptr<7>, !llvm.ptr<1>, !llvm.ptr<3>, i32) -> ()
    "nvvm.cp.async.bulk.shared.cluster.global"(%arg18, %arg19, %arg20, %arg21, %arg23) <{operandSegmentSizes = array<i32: 1, 1, 1, 1, 0, 1>}> : (!llvm.ptr<7>, !llvm.ptr<1>, !llvm.ptr<3>, i32, i64) -> ()
    "nvvm.cp.async.bulk.shared.cluster.global"(%arg18, %arg19, %arg20, %arg21, %arg22) <{operandSegmentSizes = array<i32: 1, 1, 1, 1, 1, 0>}> : (!llvm.ptr<7>, !llvm.ptr<1>, !llvm.ptr<3>, i32, i16) -> ()
    "nvvm.cp.async.bulk.shared.cluster.global"(%arg18, %arg19, %arg20, %arg21, %arg22, %arg23) <{operandSegmentSizes = array<i32: 1, 1, 1, 1, 1, 1>}> : (!llvm.ptr<7>, !llvm.ptr<1>, !llvm.ptr<3>, i32, i16, i64) -> ()
    "llvm.return"() : () -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (ptr<3>, ptr<1>, ptr<3>, i32, i64)>, linkage = #llvm.linkage<external>, sym_name = "llvm_nvvm_cp_async_bulk_global_to_shared_cta", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg13: !llvm.ptr<3>, %arg14: !llvm.ptr<1>, %arg15: !llvm.ptr<3>, %arg16: i32, %arg17: i64):
    "nvvm.cp.async.bulk.shared.cluster.global"(%arg13, %arg14, %arg15, %arg16) <{operandSegmentSizes = array<i32: 1, 1, 1, 1, 0, 0>}> : (!llvm.ptr<3>, !llvm.ptr<1>, !llvm.ptr<3>, i32) -> ()
    "nvvm.cp.async.bulk.shared.cluster.global"(%arg13, %arg14, %arg15, %arg16, %arg17) <{operandSegmentSizes = array<i32: 1, 1, 1, 1, 0, 1>}> : (!llvm.ptr<3>, !llvm.ptr<1>, !llvm.ptr<3>, i32, i64) -> ()
    "llvm.return"() : () -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (ptr<7>, ptr<3>, ptr<3>, i32)>, linkage = #llvm.linkage<external>, sym_name = "llvm_nvvm_cp_async_bulk_shared_cta_to_shared_cluster", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg9: !llvm.ptr<7>, %arg10: !llvm.ptr<3>, %arg11: !llvm.ptr<3>, %arg12: i32):
    "nvvm.cp.async.bulk.shared.cluster.shared.cta"(%arg9, %arg10, %arg11, %arg12) : (!llvm.ptr<7>, !llvm.ptr<3>, !llvm.ptr<3>, i32) -> ()
    "llvm.return"() : () -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (ptr<1>, ptr<3>, i32, i64)>, linkage = #llvm.linkage<external>, sym_name = "llvm_nvvm_cp_async_bulk_shared_cta_to_global", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg5: !llvm.ptr<1>, %arg6: !llvm.ptr<3>, %arg7: i32, %arg8: i64):
    "nvvm.cp.async.bulk.global.shared.cta"(%arg5, %arg6, %arg7) <{operandSegmentSizes = array<i32: 1, 1, 1, 0, 0>}> : (!llvm.ptr<1>, !llvm.ptr<3>, i32) -> ()
    "nvvm.cp.async.bulk.global.shared.cta"(%arg5, %arg6, %arg7, %arg8) <{operandSegmentSizes = array<i32: 1, 1, 1, 1, 0>}> : (!llvm.ptr<1>, !llvm.ptr<3>, i32, i64) -> ()
    "llvm.return"() : () -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (ptr<1>, ptr<3>, i32, i64, i16)>, linkage = #llvm.linkage<external>, sym_name = "llvm_nvvm_cp_async_bulk_shared_cta_to_global_bytemask", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg0: !llvm.ptr<1>, %arg1: !llvm.ptr<3>, %arg2: i32, %arg3: i64, %arg4: i16):
    "nvvm.cp.async.bulk.global.shared.cta"(%arg0, %arg1, %arg2, %arg4) <{operandSegmentSizes = array<i32: 1, 1, 1, 0, 1>}> : (!llvm.ptr<1>, !llvm.ptr<3>, i32, i16) -> ()
    "nvvm.cp.async.bulk.global.shared.cta"(%arg0, %arg1, %arg2, %arg3, %arg4) <{operandSegmentSizes = array<i32: 1, 1, 1, 1, 1>}> : (!llvm.ptr<1>, !llvm.ptr<3>, i32, i64, i16) -> ()
    "llvm.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

