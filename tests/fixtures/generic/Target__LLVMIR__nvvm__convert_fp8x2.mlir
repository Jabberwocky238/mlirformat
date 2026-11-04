"builtin.module"() ({
^bb0:
}) : () -> ()

// -----
"builtin.module"() ({
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (f32, f32)>, linkage = #llvm.linkage<external>, sym_name = "convert_f32x2_to_f8x2_e4m3", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg6: f32, %arg7: f32):
    %8 = "nvvm.convert.f32x2.to.f8x2"(%arg6, %arg7) <{dstTy = f8E4M3FN, relu = false, rnd = #nvvm.fp_rnd_mode<rn>, sat = #nvvm.sat_mode<satfinite>}> : (f32, f32) -> i16
    %9 = "nvvm.convert.f32x2.to.f8x2"(%arg6, %arg7) <{dstTy = f8E4M3FN, relu = true, rnd = #nvvm.fp_rnd_mode<rn>, sat = #nvvm.sat_mode<satfinite>}> : (f32, f32) -> i16
    "llvm.return"() : () -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (f32, f32)>, linkage = #llvm.linkage<external>, sym_name = "convert_f32x2_to_f8x2_e5m2", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg4: f32, %arg5: f32):
    %6 = "nvvm.convert.f32x2.to.f8x2"(%arg4, %arg5) <{dstTy = f8E5M2, relu = false, rnd = #nvvm.fp_rnd_mode<rn>, sat = #nvvm.sat_mode<satfinite>}> : (f32, f32) -> i16
    %7 = "nvvm.convert.f32x2.to.f8x2"(%arg4, %arg5) <{dstTy = f8E5M2, relu = true, rnd = #nvvm.fp_rnd_mode<rn>, sat = #nvvm.sat_mode<satfinite>}> : (f32, f32) -> i16
    "llvm.return"() : () -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (f32, f32)>, linkage = #llvm.linkage<external>, sym_name = "convert_f32x2_to_f8x2_ue8m0", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg2: f32, %arg3: f32):
    %2 = "nvvm.convert.f32x2.to.f8x2"(%arg2, %arg3) <{dstTy = f8E8M0FNU, relu = false, rnd = #nvvm.fp_rnd_mode<rz>, sat = #nvvm.sat_mode<none>}> : (f32, f32) -> i16
    %3 = "nvvm.convert.f32x2.to.f8x2"(%arg2, %arg3) <{dstTy = f8E8M0FNU, relu = false, rnd = #nvvm.fp_rnd_mode<rp>, sat = #nvvm.sat_mode<none>}> : (f32, f32) -> i16
    %4 = "nvvm.convert.f32x2.to.f8x2"(%arg2, %arg3) <{dstTy = f8E8M0FNU, relu = false, rnd = #nvvm.fp_rnd_mode<rz>, sat = #nvvm.sat_mode<satfinite>}> : (f32, f32) -> i16
    %5 = "nvvm.convert.f32x2.to.f8x2"(%arg2, %arg3) <{dstTy = f8E8M0FNU, relu = false, rnd = #nvvm.fp_rnd_mode<rp>, sat = #nvvm.sat_mode<satfinite>}> : (f32, f32) -> i16
    "llvm.return"() : () -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (f32, f32)>, linkage = #llvm.linkage<external>, sym_name = "convert_f32x2_to_f8x2_vector_return", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg0: f32, %arg1: f32):
    %0 = "nvvm.convert.f32x2.to.f8x2"(%arg0, %arg1) <{dstTy = f8E4M3FN, relu = false, rnd = #nvvm.fp_rnd_mode<rn>, sat = #nvvm.sat_mode<satfinite>}> : (f32, f32) -> vector<2xi8>
    %1 = "nvvm.convert.f32x2.to.f8x2"(%arg0, %arg1) <{dstTy = f8E4M3FN, relu = true, rnd = #nvvm.fp_rnd_mode<rn>, sat = #nvvm.sat_mode<satfinite>}> : (f32, f32) -> vector<2xi8>
    "llvm.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (vector<2xf16>)>, linkage = #llvm.linkage<external>, sym_name = "convert_f16x2_to_f8x2_e4m3", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg2: vector<2xf16>):
    %4 = "nvvm.convert.f16x2.to.f8x2"(%arg2) <{dstTy = f8E4M3FN, relu = false}> : (vector<2xf16>) -> i16
    %5 = "nvvm.convert.f16x2.to.f8x2"(%arg2) <{dstTy = f8E4M3FN, relu = true}> : (vector<2xf16>) -> i16
    "llvm.return"() : () -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (vector<2xf16>)>, linkage = #llvm.linkage<external>, sym_name = "convert_f16x2_to_f8x2_e5m2", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg1: vector<2xf16>):
    %2 = "nvvm.convert.f16x2.to.f8x2"(%arg1) <{dstTy = f8E5M2, relu = false}> : (vector<2xf16>) -> i16
    %3 = "nvvm.convert.f16x2.to.f8x2"(%arg1) <{dstTy = f8E5M2, relu = true}> : (vector<2xf16>) -> i16
    "llvm.return"() : () -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (vector<2xf16>)>, linkage = #llvm.linkage<external>, sym_name = "convert_f16x2_to_f8x2_vector_return", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg0: vector<2xf16>):
    %0 = "nvvm.convert.f16x2.to.f8x2"(%arg0) <{dstTy = f8E4M3FN, relu = false}> : (vector<2xf16>) -> vector<2xi8>
    %1 = "nvvm.convert.f16x2.to.f8x2"(%arg0) <{dstTy = f8E5M2, relu = false}> : (vector<2xf16>) -> vector<2xi8>
    "llvm.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (vector<2xbf16>)>, linkage = #llvm.linkage<external>, sym_name = "convert_bf16x2_to_f8x2_ue8m0", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg1: vector<2xbf16>):
    %2 = "nvvm.convert.bf16x2.to.f8x2"(%arg1) <{dstTy = f8E8M0FNU, rnd = #nvvm.fp_rnd_mode<rz>, sat = #nvvm.sat_mode<none>}> : (vector<2xbf16>) -> i16
    %3 = "nvvm.convert.bf16x2.to.f8x2"(%arg1) <{dstTy = f8E8M0FNU, rnd = #nvvm.fp_rnd_mode<rp>, sat = #nvvm.sat_mode<none>}> : (vector<2xbf16>) -> i16
    %4 = "nvvm.convert.bf16x2.to.f8x2"(%arg1) <{dstTy = f8E8M0FNU, rnd = #nvvm.fp_rnd_mode<rz>, sat = #nvvm.sat_mode<satfinite>}> : (vector<2xbf16>) -> i16
    %5 = "nvvm.convert.bf16x2.to.f8x2"(%arg1) <{dstTy = f8E8M0FNU, rnd = #nvvm.fp_rnd_mode<rp>, sat = #nvvm.sat_mode<satfinite>}> : (vector<2xbf16>) -> i16
    "llvm.return"() : () -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (vector<2xbf16>)>, linkage = #llvm.linkage<external>, sym_name = "convert_bf16x2_to_f8x2_vector_return", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg0: vector<2xbf16>):
    %0 = "nvvm.convert.bf16x2.to.f8x2"(%arg0) <{dstTy = f8E8M0FNU, rnd = #nvvm.fp_rnd_mode<rz>, sat = #nvvm.sat_mode<none>}> : (vector<2xbf16>) -> vector<2xi8>
    %1 = "nvvm.convert.bf16x2.to.f8x2"(%arg0) <{dstTy = f8E8M0FNU, rnd = #nvvm.fp_rnd_mode<rp>, sat = #nvvm.sat_mode<satfinite>}> : (vector<2xbf16>) -> vector<2xi8>
    "llvm.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (vector<2xi8>)>, linkage = #llvm.linkage<external>, sym_name = "convert_f8x2_to_f16x2_e4m3", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg1: vector<2xi8>):
    %2 = "nvvm.convert.f8x2.to.f16x2"(%arg1) <{relu = false, srcType = f8E4M3FN}> : (vector<2xi8>) -> vector<2xf16>
    %3 = "nvvm.convert.f8x2.to.f16x2"(%arg1) <{relu = true, srcType = f8E4M3FN}> : (vector<2xi8>) -> vector<2xf16>
    "llvm.return"() : () -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (vector<2xi8>)>, linkage = #llvm.linkage<external>, sym_name = "convert_f8x2_to_f16x2_e5m2", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg0: vector<2xi8>):
    %0 = "nvvm.convert.f8x2.to.f16x2"(%arg0) <{relu = false, srcType = f8E5M2}> : (vector<2xi8>) -> vector<2xf16>
    %1 = "nvvm.convert.f8x2.to.f16x2"(%arg0) <{relu = true, srcType = f8E5M2}> : (vector<2xi8>) -> vector<2xf16>
    "llvm.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (vector<2xi8>)>, linkage = #llvm.linkage<external>, sym_name = "convert_f8x2_to_bf16x2_ue8m0", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg0: vector<2xi8>):
    %0 = "nvvm.convert.f8x2.to.bf16x2"(%arg0) <{srcType = f8E8M0FNU}> : (vector<2xi8>) -> vector<2xbf16>
    "llvm.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

