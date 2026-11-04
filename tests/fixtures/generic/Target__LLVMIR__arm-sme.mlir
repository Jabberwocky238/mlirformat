"builtin.module"() ({
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void ()>, linkage = #llvm.linkage<external>, sym_name = "arm_sme_zero", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
    "arm_sme.intr.zero"() <{tile_mask = 0 : i32}> : () -> ()
    "llvm.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (vector<[2]xf64>, vector<[4]xf32>, vector<[8]xf16>, vector<[8]xbf16>, vector<[2]xi1>, vector<[4]xi1>, vector<[8]xi1>)>, linkage = #llvm.linkage<external>, sym_name = "arm_sme_fmopa", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg0: vector<[2]xf64>, %arg1: vector<[4]xf32>, %arg2: vector<[8]xf16>, %arg3: vector<[8]xbf16>, %arg4: vector<[2]xi1>, %arg5: vector<[4]xi1>, %arg6: vector<[8]xi1>):
    "arm_sme.intr.mopa"(%arg4, %arg4, %arg0, %arg0) <{tile_id = 0 : i32}> : (vector<[2]xi1>, vector<[2]xi1>, vector<[2]xf64>, vector<[2]xf64>) -> ()
    "arm_sme.intr.mopa"(%arg5, %arg5, %arg1, %arg1) <{tile_id = 0 : i32}> : (vector<[4]xi1>, vector<[4]xi1>, vector<[4]xf32>, vector<[4]xf32>) -> ()
    "arm_sme.intr.mopa.wide"(%arg6, %arg6, %arg2, %arg2) <{tile_id = 0 : i32}> : (vector<[8]xi1>, vector<[8]xi1>, vector<[8]xf16>, vector<[8]xf16>) -> ()
    "arm_sme.intr.mopa.wide"(%arg6, %arg6, %arg3, %arg3) <{tile_id = 0 : i32}> : (vector<[8]xi1>, vector<[8]xi1>, vector<[8]xbf16>, vector<[8]xbf16>) -> ()
    "llvm.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (vector<[8]xi16>, vector<[16]xi8>, vector<[8]xi1>, vector<[16]xi1>)>, linkage = #llvm.linkage<external>, sym_name = "arm_sme_imopa", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg0: vector<[8]xi16>, %arg1: vector<[16]xi8>, %arg2: vector<[8]xi1>, %arg3: vector<[16]xi1>):
    "arm_sme.intr.smopa.wide"(%arg2, %arg2, %arg0, %arg0) <{tile_id = 0 : i32}> : (vector<[8]xi1>, vector<[8]xi1>, vector<[8]xi16>, vector<[8]xi16>) -> ()
    "arm_sme.intr.umopa.wide"(%arg2, %arg2, %arg0, %arg0) <{tile_id = 0 : i32}> : (vector<[8]xi1>, vector<[8]xi1>, vector<[8]xi16>, vector<[8]xi16>) -> ()
    "arm_sme.intr.sumopa.wide"(%arg2, %arg2, %arg0, %arg0) <{tile_id = 0 : i32}> : (vector<[8]xi1>, vector<[8]xi1>, vector<[8]xi16>, vector<[8]xi16>) -> ()
    "arm_sme.intr.usmopa.wide"(%arg2, %arg2, %arg0, %arg0) <{tile_id = 0 : i32}> : (vector<[8]xi1>, vector<[8]xi1>, vector<[8]xi16>, vector<[8]xi16>) -> ()
    "arm_sme.intr.smopa.wide"(%arg3, %arg3, %arg1, %arg1) <{tile_id = 0 : i32}> : (vector<[16]xi1>, vector<[16]xi1>, vector<[16]xi8>, vector<[16]xi8>) -> ()
    "arm_sme.intr.umopa.wide"(%arg3, %arg3, %arg1, %arg1) <{tile_id = 0 : i32}> : (vector<[16]xi1>, vector<[16]xi1>, vector<[16]xi8>, vector<[16]xi8>) -> ()
    "arm_sme.intr.sumopa.wide"(%arg3, %arg3, %arg1, %arg1) <{tile_id = 0 : i32}> : (vector<[16]xi1>, vector<[16]xi1>, vector<[16]xi8>, vector<[16]xi8>) -> ()
    "arm_sme.intr.usmopa.wide"(%arg3, %arg3, %arg1, %arg1) <{tile_id = 0 : i32}> : (vector<[16]xi1>, vector<[16]xi1>, vector<[16]xi8>, vector<[16]xi8>) -> ()
    "arm_sme.intr.smopa.za32"(%arg2, %arg2, %arg0, %arg0) <{tile_id = 0 : i32}> : (vector<[8]xi1>, vector<[8]xi1>, vector<[8]xi16>, vector<[8]xi16>) -> ()
    "arm_sme.intr.umopa.za32"(%arg2, %arg2, %arg0, %arg0) <{tile_id = 0 : i32}> : (vector<[8]xi1>, vector<[8]xi1>, vector<[8]xi16>, vector<[8]xi16>) -> ()
    "llvm.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (vector<[2]xf64>, vector<[4]xf32>, vector<[8]xf16>, vector<[8]xbf16>, vector<[2]xi1>, vector<[4]xi1>, vector<[8]xi1>)>, linkage = #llvm.linkage<external>, sym_name = "arm_sme_fmops", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg0: vector<[2]xf64>, %arg1: vector<[4]xf32>, %arg2: vector<[8]xf16>, %arg3: vector<[8]xbf16>, %arg4: vector<[2]xi1>, %arg5: vector<[4]xi1>, %arg6: vector<[8]xi1>):
    "arm_sme.intr.mops"(%arg4, %arg4, %arg0, %arg0) <{tile_id = 0 : i32}> : (vector<[2]xi1>, vector<[2]xi1>, vector<[2]xf64>, vector<[2]xf64>) -> ()
    "arm_sme.intr.mops"(%arg5, %arg5, %arg1, %arg1) <{tile_id = 0 : i32}> : (vector<[4]xi1>, vector<[4]xi1>, vector<[4]xf32>, vector<[4]xf32>) -> ()
    "arm_sme.intr.mops.wide"(%arg6, %arg6, %arg2, %arg2) <{tile_id = 0 : i32}> : (vector<[8]xi1>, vector<[8]xi1>, vector<[8]xf16>, vector<[8]xf16>) -> ()
    "arm_sme.intr.mops.wide"(%arg6, %arg6, %arg3, %arg3) <{tile_id = 0 : i32}> : (vector<[8]xi1>, vector<[8]xi1>, vector<[8]xbf16>, vector<[8]xbf16>) -> ()
    "llvm.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (vector<[8]xi16>, vector<[16]xi8>, vector<[8]xi1>, vector<[16]xi1>)>, linkage = #llvm.linkage<external>, sym_name = "arm_sme_imops", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg0: vector<[8]xi16>, %arg1: vector<[16]xi8>, %arg2: vector<[8]xi1>, %arg3: vector<[16]xi1>):
    "arm_sme.intr.smops.wide"(%arg2, %arg2, %arg0, %arg0) <{tile_id = 0 : i32}> : (vector<[8]xi1>, vector<[8]xi1>, vector<[8]xi16>, vector<[8]xi16>) -> ()
    "arm_sme.intr.umops.wide"(%arg2, %arg2, %arg0, %arg0) <{tile_id = 0 : i32}> : (vector<[8]xi1>, vector<[8]xi1>, vector<[8]xi16>, vector<[8]xi16>) -> ()
    "arm_sme.intr.sumops.wide"(%arg2, %arg2, %arg0, %arg0) <{tile_id = 0 : i32}> : (vector<[8]xi1>, vector<[8]xi1>, vector<[8]xi16>, vector<[8]xi16>) -> ()
    "arm_sme.intr.usmops.wide"(%arg2, %arg2, %arg0, %arg0) <{tile_id = 0 : i32}> : (vector<[8]xi1>, vector<[8]xi1>, vector<[8]xi16>, vector<[8]xi16>) -> ()
    "arm_sme.intr.smops.wide"(%arg3, %arg3, %arg1, %arg1) <{tile_id = 0 : i32}> : (vector<[16]xi1>, vector<[16]xi1>, vector<[16]xi8>, vector<[16]xi8>) -> ()
    "arm_sme.intr.umops.wide"(%arg3, %arg3, %arg1, %arg1) <{tile_id = 0 : i32}> : (vector<[16]xi1>, vector<[16]xi1>, vector<[16]xi8>, vector<[16]xi8>) -> ()
    "arm_sme.intr.sumops.wide"(%arg3, %arg3, %arg1, %arg1) <{tile_id = 0 : i32}> : (vector<[16]xi1>, vector<[16]xi1>, vector<[16]xi8>, vector<[16]xi8>) -> ()
    "arm_sme.intr.usmops.wide"(%arg3, %arg3, %arg1, %arg1) <{tile_id = 0 : i32}> : (vector<[16]xi1>, vector<[16]xi1>, vector<[16]xi8>, vector<[16]xi8>) -> ()
    "arm_sme.intr.smops.za32"(%arg2, %arg2, %arg0, %arg0) <{tile_id = 0 : i32}> : (vector<[8]xi1>, vector<[8]xi1>, vector<[8]xi16>, vector<[8]xi16>) -> ()
    "arm_sme.intr.umops.za32"(%arg2, %arg2, %arg0, %arg0) <{tile_id = 0 : i32}> : (vector<[8]xi1>, vector<[8]xi1>, vector<[8]xi16>, vector<[8]xi16>) -> ()
    "llvm.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (vector<[1]xi1>, vector<[2]xi1>, vector<[4]xi1>, vector<[8]xi1>, vector<[16]xi1>, ptr)>, linkage = #llvm.linkage<external>, sym_name = "arm_sme_load", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg0: vector<[1]xi1>, %arg1: vector<[2]xi1>, %arg2: vector<[4]xi1>, %arg3: vector<[8]xi1>, %arg4: vector<[16]xi1>, %arg5: !llvm.ptr):
    %0 = "llvm.mlir.constant"() <{value = 0 : index}> : () -> i32
    "arm_sme.intr.ld1q.horiz"(%arg0, %arg5, %0) <{tile_id = 0 : i32}> : (vector<[1]xi1>, !llvm.ptr, i32) -> ()
    "arm_sme.intr.ld1d.horiz"(%arg1, %arg5, %0) <{tile_id = 0 : i32}> : (vector<[2]xi1>, !llvm.ptr, i32) -> ()
    "arm_sme.intr.ld1w.horiz"(%arg2, %arg5, %0) <{tile_id = 0 : i32}> : (vector<[4]xi1>, !llvm.ptr, i32) -> ()
    "arm_sme.intr.ld1h.horiz"(%arg3, %arg5, %0) <{tile_id = 0 : i32}> : (vector<[8]xi1>, !llvm.ptr, i32) -> ()
    "arm_sme.intr.ld1b.horiz"(%arg4, %arg5, %0) <{tile_id = 0 : i32}> : (vector<[16]xi1>, !llvm.ptr, i32) -> ()
    "arm_sme.intr.ld1q.vert"(%arg0, %arg5, %0) <{tile_id = 0 : i32}> : (vector<[1]xi1>, !llvm.ptr, i32) -> ()
    "arm_sme.intr.ld1d.vert"(%arg1, %arg5, %0) <{tile_id = 0 : i32}> : (vector<[2]xi1>, !llvm.ptr, i32) -> ()
    "arm_sme.intr.ld1w.vert"(%arg2, %arg5, %0) <{tile_id = 0 : i32}> : (vector<[4]xi1>, !llvm.ptr, i32) -> ()
    "arm_sme.intr.ld1h.vert"(%arg3, %arg5, %0) <{tile_id = 0 : i32}> : (vector<[8]xi1>, !llvm.ptr, i32) -> ()
    "arm_sme.intr.ld1b.vert"(%arg4, %arg5, %0) <{tile_id = 0 : i32}> : (vector<[16]xi1>, !llvm.ptr, i32) -> ()
    "llvm.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (vector<[1]xi1>, vector<[2]xi1>, vector<[4]xi1>, vector<[8]xi1>, vector<[16]xi1>, ptr)>, linkage = #llvm.linkage<external>, sym_name = "arm_sme_store", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg0: vector<[1]xi1>, %arg1: vector<[2]xi1>, %arg2: vector<[4]xi1>, %arg3: vector<[8]xi1>, %arg4: vector<[16]xi1>, %arg5: !llvm.ptr):
    %0 = "llvm.mlir.constant"() <{value = 0 : index}> : () -> i32
    "arm_sme.intr.st1q.horiz"(%arg0, %arg5, %0) <{tile_id = 0 : i32}> : (vector<[1]xi1>, !llvm.ptr, i32) -> ()
    "arm_sme.intr.st1d.horiz"(%arg1, %arg5, %0) <{tile_id = 0 : i32}> : (vector<[2]xi1>, !llvm.ptr, i32) -> ()
    "arm_sme.intr.st1w.horiz"(%arg2, %arg5, %0) <{tile_id = 0 : i32}> : (vector<[4]xi1>, !llvm.ptr, i32) -> ()
    "arm_sme.intr.st1h.horiz"(%arg3, %arg5, %0) <{tile_id = 0 : i32}> : (vector<[8]xi1>, !llvm.ptr, i32) -> ()
    "arm_sme.intr.st1b.horiz"(%arg4, %arg5, %0) <{tile_id = 0 : i32}> : (vector<[16]xi1>, !llvm.ptr, i32) -> ()
    "arm_sme.intr.st1q.vert"(%arg0, %arg5, %0) <{tile_id = 0 : i32}> : (vector<[1]xi1>, !llvm.ptr, i32) -> ()
    "arm_sme.intr.st1d.vert"(%arg1, %arg5, %0) <{tile_id = 0 : i32}> : (vector<[2]xi1>, !llvm.ptr, i32) -> ()
    "arm_sme.intr.st1w.vert"(%arg2, %arg5, %0) <{tile_id = 0 : i32}> : (vector<[4]xi1>, !llvm.ptr, i32) -> ()
    "arm_sme.intr.st1h.vert"(%arg3, %arg5, %0) <{tile_id = 0 : i32}> : (vector<[8]xi1>, !llvm.ptr, i32) -> ()
    "arm_sme.intr.st1b.vert"(%arg4, %arg5, %0) <{tile_id = 0 : i32}> : (vector<[16]xi1>, !llvm.ptr, i32) -> ()
    "arm_sme.intr.str"(%0, %arg5, %0) : (i32, !llvm.ptr, i32) -> ()
    "llvm.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (i32, vector<[16]xi1>, vector<[8]xi1>, vector<[4]xi1>, vector<[2]xi1>, vector<[1]xi1>, vector<[16]xi8>, vector<[8]xi16>, vector<[4]xi32>, vector<[2]xi64>, vector<[1]xi128>, vector<[8]xf16>, vector<[8]xbf16>, vector<[4]xf32>, vector<[2]xf64>)>, linkage = #llvm.linkage<external>, sym_name = "arm_sme_vector_to_tile_horiz", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg0: i32, %arg1: vector<[16]xi1>, %arg2: vector<[8]xi1>, %arg3: vector<[4]xi1>, %arg4: vector<[2]xi1>, %arg5: vector<[1]xi1>, %arg6: vector<[16]xi8>, %arg7: vector<[8]xi16>, %arg8: vector<[4]xi32>, %arg9: vector<[2]xi64>, %arg10: vector<[1]xi128>, %arg11: vector<[8]xf16>, %arg12: vector<[8]xbf16>, %arg13: vector<[4]xf32>, %arg14: vector<[2]xf64>):
    "arm_sme.intr.write.horiz"(%arg0, %arg1, %arg6) <{tile_id = 0 : i32}> : (i32, vector<[16]xi1>, vector<[16]xi8>) -> ()
    "arm_sme.intr.write.horiz"(%arg0, %arg2, %arg7) <{tile_id = 0 : i32}> : (i32, vector<[8]xi1>, vector<[8]xi16>) -> ()
    "arm_sme.intr.write.horiz"(%arg0, %arg3, %arg8) <{tile_id = 0 : i32}> : (i32, vector<[4]xi1>, vector<[4]xi32>) -> ()
    "arm_sme.intr.write.horiz"(%arg0, %arg4, %arg9) <{tile_id = 0 : i32}> : (i32, vector<[2]xi1>, vector<[2]xi64>) -> ()
    "arm_sme.intr.write.horiz"(%arg0, %arg5, %arg10) <{tile_id = 0 : i32}> : (i32, vector<[1]xi1>, vector<[1]xi128>) -> ()
    "arm_sme.intr.write.horiz"(%arg0, %arg2, %arg11) <{tile_id = 0 : i32}> : (i32, vector<[8]xi1>, vector<[8]xf16>) -> ()
    "arm_sme.intr.write.horiz"(%arg0, %arg2, %arg12) <{tile_id = 0 : i32}> : (i32, vector<[8]xi1>, vector<[8]xbf16>) -> ()
    "arm_sme.intr.write.horiz"(%arg0, %arg3, %arg13) <{tile_id = 0 : i32}> : (i32, vector<[4]xi1>, vector<[4]xf32>) -> ()
    "arm_sme.intr.write.horiz"(%arg0, %arg4, %arg14) <{tile_id = 0 : i32}> : (i32, vector<[2]xi1>, vector<[2]xf64>) -> ()
    "llvm.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (i32, vector<[16]xi1>, vector<[8]xi1>, vector<[4]xi1>, vector<[2]xi1>, vector<[1]xi1>, vector<[16]xi8>, vector<[8]xi16>, vector<[4]xi32>, vector<[2]xi64>, vector<[1]xi128>, vector<[8]xf16>, vector<[8]xbf16>, vector<[4]xf32>, vector<[2]xf64>)>, linkage = #llvm.linkage<external>, sym_name = "arm_sme_vector_to_tile_vert", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg0: i32, %arg1: vector<[16]xi1>, %arg2: vector<[8]xi1>, %arg3: vector<[4]xi1>, %arg4: vector<[2]xi1>, %arg5: vector<[1]xi1>, %arg6: vector<[16]xi8>, %arg7: vector<[8]xi16>, %arg8: vector<[4]xi32>, %arg9: vector<[2]xi64>, %arg10: vector<[1]xi128>, %arg11: vector<[8]xf16>, %arg12: vector<[8]xbf16>, %arg13: vector<[4]xf32>, %arg14: vector<[2]xf64>):
    "arm_sme.intr.write.vert"(%arg0, %arg1, %arg6) <{tile_id = 0 : i32}> : (i32, vector<[16]xi1>, vector<[16]xi8>) -> ()
    "arm_sme.intr.write.vert"(%arg0, %arg2, %arg7) <{tile_id = 0 : i32}> : (i32, vector<[8]xi1>, vector<[8]xi16>) -> ()
    "arm_sme.intr.write.vert"(%arg0, %arg3, %arg8) <{tile_id = 0 : i32}> : (i32, vector<[4]xi1>, vector<[4]xi32>) -> ()
    "arm_sme.intr.write.vert"(%arg0, %arg4, %arg9) <{tile_id = 0 : i32}> : (i32, vector<[2]xi1>, vector<[2]xi64>) -> ()
    "arm_sme.intr.write.vert"(%arg0, %arg5, %arg10) <{tile_id = 0 : i32}> : (i32, vector<[1]xi1>, vector<[1]xi128>) -> ()
    "arm_sme.intr.write.vert"(%arg0, %arg2, %arg11) <{tile_id = 0 : i32}> : (i32, vector<[8]xi1>, vector<[8]xf16>) -> ()
    "arm_sme.intr.write.vert"(%arg0, %arg2, %arg12) <{tile_id = 0 : i32}> : (i32, vector<[8]xi1>, vector<[8]xbf16>) -> ()
    "arm_sme.intr.write.vert"(%arg0, %arg3, %arg13) <{tile_id = 0 : i32}> : (i32, vector<[4]xi1>, vector<[4]xf32>) -> ()
    "arm_sme.intr.write.vert"(%arg0, %arg4, %arg14) <{tile_id = 0 : i32}> : (i32, vector<[2]xi1>, vector<[2]xf64>) -> ()
    "llvm.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (i32, vector<[16]xi1>, vector<[8]xi1>, vector<[4]xi1>, vector<[2]xi1>, vector<[1]xi1>, vector<[16]xi8>, vector<[8]xi16>, vector<[4]xi32>, vector<[2]xi64>, vector<[1]xi128>, vector<[8]xf16>, vector<[8]xbf16>, vector<[4]xf32>, vector<[2]xf64>)>, linkage = #llvm.linkage<external>, sym_name = "arm_sme_tile_slice_to_vector_horiz", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg0: i32, %arg1: vector<[16]xi1>, %arg2: vector<[8]xi1>, %arg3: vector<[4]xi1>, %arg4: vector<[2]xi1>, %arg5: vector<[1]xi1>, %arg6: vector<[16]xi8>, %arg7: vector<[8]xi16>, %arg8: vector<[4]xi32>, %arg9: vector<[2]xi64>, %arg10: vector<[1]xi128>, %arg11: vector<[8]xf16>, %arg12: vector<[8]xbf16>, %arg13: vector<[4]xf32>, %arg14: vector<[2]xf64>):
    %0 = "arm_sme.intr.read.horiz"(%arg6, %arg1, %arg0) <{tile_id = 0 : i32}> : (vector<[16]xi8>, vector<[16]xi1>, i32) -> vector<[16]xi8>
    %1 = "arm_sme.intr.read.horiz"(%arg7, %arg2, %arg0) <{tile_id = 0 : i32}> : (vector<[8]xi16>, vector<[8]xi1>, i32) -> vector<[8]xi16>
    %2 = "arm_sme.intr.read.horiz"(%arg8, %arg3, %arg0) <{tile_id = 0 : i32}> : (vector<[4]xi32>, vector<[4]xi1>, i32) -> vector<[4]xi32>
    %3 = "arm_sme.intr.read.horiz"(%arg9, %arg4, %arg0) <{tile_id = 0 : i32}> : (vector<[2]xi64>, vector<[2]xi1>, i32) -> vector<[2]xi64>
    %4 = "arm_sme.intr.read.horiz"(%arg10, %arg5, %arg0) <{tile_id = 0 : i32}> : (vector<[1]xi128>, vector<[1]xi1>, i32) -> vector<[1]xi128>
    %5 = "arm_sme.intr.read.horiz"(%arg11, %arg2, %arg0) <{tile_id = 0 : i32}> : (vector<[8]xf16>, vector<[8]xi1>, i32) -> vector<[8]xf16>
    %6 = "arm_sme.intr.read.horiz"(%arg12, %arg2, %arg0) <{tile_id = 0 : i32}> : (vector<[8]xbf16>, vector<[8]xi1>, i32) -> vector<[8]xbf16>
    %7 = "arm_sme.intr.read.horiz"(%arg13, %arg3, %arg0) <{tile_id = 0 : i32}> : (vector<[4]xf32>, vector<[4]xi1>, i32) -> vector<[4]xf32>
    %8 = "arm_sme.intr.read.horiz"(%arg14, %arg4, %arg0) <{tile_id = 0 : i32}> : (vector<[2]xf64>, vector<[2]xi1>, i32) -> vector<[2]xf64>
    "llvm.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (i32, vector<[16]xi1>, vector<[8]xi1>, vector<[4]xi1>, vector<[2]xi1>, vector<[1]xi1>, vector<[16]xi8>, vector<[8]xi16>, vector<[4]xi32>, vector<[2]xi64>, vector<[1]xi128>, vector<[8]xf16>, vector<[8]xbf16>, vector<[4]xf32>, vector<[2]xf64>)>, linkage = #llvm.linkage<external>, sym_name = "arm_sme_tile_slice_to_vector_vert", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg0: i32, %arg1: vector<[16]xi1>, %arg2: vector<[8]xi1>, %arg3: vector<[4]xi1>, %arg4: vector<[2]xi1>, %arg5: vector<[1]xi1>, %arg6: vector<[16]xi8>, %arg7: vector<[8]xi16>, %arg8: vector<[4]xi32>, %arg9: vector<[2]xi64>, %arg10: vector<[1]xi128>, %arg11: vector<[8]xf16>, %arg12: vector<[8]xbf16>, %arg13: vector<[4]xf32>, %arg14: vector<[2]xf64>):
    %0 = "arm_sme.intr.read.vert"(%arg6, %arg1, %arg0) <{tile_id = 0 : i32}> : (vector<[16]xi8>, vector<[16]xi1>, i32) -> vector<[16]xi8>
    %1 = "arm_sme.intr.read.vert"(%arg7, %arg2, %arg0) <{tile_id = 0 : i32}> : (vector<[8]xi16>, vector<[8]xi1>, i32) -> vector<[8]xi16>
    %2 = "arm_sme.intr.read.vert"(%arg8, %arg3, %arg0) <{tile_id = 0 : i32}> : (vector<[4]xi32>, vector<[4]xi1>, i32) -> vector<[4]xi32>
    %3 = "arm_sme.intr.read.vert"(%arg9, %arg4, %arg0) <{tile_id = 0 : i32}> : (vector<[2]xi64>, vector<[2]xi1>, i32) -> vector<[2]xi64>
    %4 = "arm_sme.intr.read.vert"(%arg10, %arg5, %arg0) <{tile_id = 0 : i32}> : (vector<[1]xi128>, vector<[1]xi1>, i32) -> vector<[1]xi128>
    %5 = "arm_sme.intr.read.vert"(%arg11, %arg2, %arg0) <{tile_id = 0 : i32}> : (vector<[8]xf16>, vector<[8]xi1>, i32) -> vector<[8]xf16>
    %6 = "arm_sme.intr.read.vert"(%arg12, %arg2, %arg0) <{tile_id = 0 : i32}> : (vector<[8]xbf16>, vector<[8]xi1>, i32) -> vector<[8]xbf16>
    %7 = "arm_sme.intr.read.vert"(%arg13, %arg3, %arg0) <{tile_id = 0 : i32}> : (vector<[4]xf32>, vector<[4]xi1>, i32) -> vector<[4]xf32>
    %8 = "arm_sme.intr.read.vert"(%arg14, %arg4, %arg0) <{tile_id = 0 : i32}> : (vector<[2]xf64>, vector<[2]xi1>, i32) -> vector<[2]xf64>
    "llvm.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void ()>, linkage = #llvm.linkage<external>, sym_name = "arm_sme_streaming_vl", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
    %0 = "arm_sme.intr.cntsd"() : () -> i64
    "llvm.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

