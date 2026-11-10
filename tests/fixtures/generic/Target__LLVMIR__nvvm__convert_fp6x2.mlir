"builtin.module"() ({
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (f32, f32)>, linkage = #llvm.linkage<external>, sym_name = "convert_f32x2_to_fp6x2_e2m3", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg4: f32, %arg5: f32):
    %4 = "nvvm.convert.f32x2.to.f6x2"(%arg4, %arg5) <{dstTy = f6E2M3FN, relu = false}> : (f32, f32) -> i16
    %5 = "nvvm.convert.f32x2.to.f6x2"(%arg4, %arg5) <{dstTy = f6E2M3FN, relu = true}> : (f32, f32) -> i16
    "llvm.return"() : () -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (f32, f32)>, linkage = #llvm.linkage<external>, sym_name = "convert_f32x2_to_fp6x2_e3m2", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg2: f32, %arg3: f32):
    %2 = "nvvm.convert.f32x2.to.f6x2"(%arg2, %arg3) <{dstTy = f6E3M2FN, relu = false}> : (f32, f32) -> i16
    %3 = "nvvm.convert.f32x2.to.f6x2"(%arg2, %arg3) <{dstTy = f6E3M2FN, relu = true}> : (f32, f32) -> i16
    "llvm.return"() : () -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (f32, f32)>, linkage = #llvm.linkage<external>, sym_name = "convert_f32x2_to_fp6x2_vector", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg0: f32, %arg1: f32):
    %0 = "nvvm.convert.f32x2.to.f6x2"(%arg0, %arg1) <{dstTy = f6E2M3FN, relu = false}> : (f32, f32) -> vector<2xi8>
    %1 = "nvvm.convert.f32x2.to.f6x2"(%arg0, %arg1) <{dstTy = f6E3M2FN, relu = false}> : (f32, f32) -> vector<2xi8>
    "llvm.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (vector<2xf16>)>, linkage = #llvm.linkage<external>, sym_name = "convert_f16x2_to_fp6x2_e2m3", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg2: vector<2xf16>):
    %4 = "nvvm.convert.f16x2.to.f6x2"(%arg2) <{dstTy = f6E2M3FN, relu = false}> : (vector<2xf16>) -> i16
    %5 = "nvvm.convert.f16x2.to.f6x2"(%arg2) <{dstTy = f6E2M3FN, relu = true}> : (vector<2xf16>) -> i16
    "llvm.return"() : () -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (vector<2xf16>)>, linkage = #llvm.linkage<external>, sym_name = "convert_f16x2_to_fp6x2_e3m2", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg1: vector<2xf16>):
    %2 = "nvvm.convert.f16x2.to.f6x2"(%arg1) <{dstTy = f6E3M2FN, relu = false}> : (vector<2xf16>) -> i16
    %3 = "nvvm.convert.f16x2.to.f6x2"(%arg1) <{dstTy = f6E3M2FN, relu = true}> : (vector<2xf16>) -> i16
    "llvm.return"() : () -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (vector<2xf16>)>, linkage = #llvm.linkage<external>, sym_name = "convert_f16x2_to_fp6x2_vector", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg0: vector<2xf16>):
    %0 = "nvvm.convert.f16x2.to.f6x2"(%arg0) <{dstTy = f6E2M3FN, relu = false}> : (vector<2xf16>) -> vector<2xi8>
    %1 = "nvvm.convert.f16x2.to.f6x2"(%arg0) <{dstTy = f6E3M2FN, relu = false}> : (vector<2xf16>) -> vector<2xi8>
    "llvm.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (vector<2xbf16>, i16)>, linkage = #llvm.linkage<external>, sym_name = "convert_bf16x2_to_fp6x2_e2m3", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg4: vector<2xbf16>, %arg5: i16):
    %4 = "nvvm.convert.bf16x2.to.f6x2"(%arg4) <{dstTy = f6E2M3FN, relu = false}> : (vector<2xbf16>) -> i16
    %5 = "nvvm.convert.bf16x2.to.f6x2"(%arg4) <{dstTy = f6E2M3FN, relu = true}> : (vector<2xbf16>) -> i16
    "llvm.return"() : () -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (vector<2xbf16>, i16)>, linkage = #llvm.linkage<external>, sym_name = "convert_bf16x2_to_fp6x2_e3m2", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg2: vector<2xbf16>, %arg3: i16):
    %2 = "nvvm.convert.bf16x2.to.f6x2"(%arg2) <{dstTy = f6E3M2FN, relu = false}> : (vector<2xbf16>) -> i16
    %3 = "nvvm.convert.bf16x2.to.f6x2"(%arg2) <{dstTy = f6E3M2FN, relu = true}> : (vector<2xbf16>) -> i16
    "llvm.return"() : () -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (vector<2xbf16>, i16)>, linkage = #llvm.linkage<external>, sym_name = "convert_bf16x2_to_fp6x2_vector", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg0: vector<2xbf16>, %arg1: i16):
    %0 = "nvvm.convert.bf16x2.to.f6x2"(%arg0) <{dstTy = f6E2M3FN, relu = false}> : (vector<2xbf16>) -> vector<2xi8>
    %1 = "nvvm.convert.bf16x2.to.f6x2"(%arg0) <{dstTy = f6E3M2FN, relu = false}> : (vector<2xbf16>) -> vector<2xi8>
    "llvm.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (vector<2xi8>)>, linkage = #llvm.linkage<external>, sym_name = "convert_f6x2_to_f16x2_e2m3", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg1: vector<2xi8>):
    %2 = "nvvm.convert.f6x2.to.f16x2"(%arg1) <{relu = false, srcType = f6E2M3FN}> : (vector<2xi8>) -> vector<2xf16>
    %3 = "nvvm.convert.f6x2.to.f16x2"(%arg1) <{relu = true, srcType = f6E2M3FN}> : (vector<2xi8>) -> vector<2xf16>
    "llvm.return"() : () -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (vector<2xi8>)>, linkage = #llvm.linkage<external>, sym_name = "convert_f6x2_to_f16x2_e3m2", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg0: vector<2xi8>):
    %0 = "nvvm.convert.f6x2.to.f16x2"(%arg0) <{relu = false, srcType = f6E3M2FN}> : (vector<2xi8>) -> vector<2xf16>
    %1 = "nvvm.convert.f6x2.to.f16x2"(%arg0) <{relu = true, srcType = f6E3M2FN}> : (vector<2xi8>) -> vector<2xf16>
    "llvm.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (vector<2xi8>, i16)>, linkage = #llvm.linkage<external>, sym_name = "convert_f6x2_to_bf16x2_e2m3", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg2: vector<2xi8>, %arg3: i16):
    %5 = "nvvm.convert.f6x2.to.bf16x2"(%arg2) <{relu = false, sat = #nvvm.sat_mode<none>, srcType = f6E2M3FN}> : (vector<2xi8>) -> vector<2xbf16>
    %6 = "nvvm.convert.f6x2.to.bf16x2"(%arg2) <{relu = true, sat = #nvvm.sat_mode<none>, srcType = f6E2M3FN}> : (vector<2xi8>) -> vector<2xbf16>
    %7 = "nvvm.convert.f6x2.to.bf16x2"(%arg2) <{relu = false, sat = #nvvm.sat_mode<satfinite>, srcType = f6E2M3FN}> : (vector<2xi8>) -> vector<2xbf16>
    %8 = "nvvm.convert.f6x2.to.bf16x2"(%arg2) <{relu = true, sat = #nvvm.sat_mode<satfinite>, srcType = f6E2M3FN}> : (vector<2xi8>) -> vector<2xbf16>
    %9 = "nvvm.convert.f6x2.to.bf16x2"(%arg2, %arg3) <{relu = false, sat = #nvvm.sat_mode<none>, srcType = f6E2M3FN}> : (vector<2xi8>, i16) -> vector<2xbf16>
    "llvm.return"() : () -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (vector<2xi8>, i16)>, linkage = #llvm.linkage<external>, sym_name = "convert_f6x2_to_bf16x2_e3m2", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg0: vector<2xi8>, %arg1: i16):
    %0 = "nvvm.convert.f6x2.to.bf16x2"(%arg0) <{relu = false, sat = #nvvm.sat_mode<none>, srcType = f6E3M2FN}> : (vector<2xi8>) -> vector<2xbf16>
    %1 = "nvvm.convert.f6x2.to.bf16x2"(%arg0) <{relu = true, sat = #nvvm.sat_mode<none>, srcType = f6E3M2FN}> : (vector<2xi8>) -> vector<2xbf16>
    %2 = "nvvm.convert.f6x2.to.bf16x2"(%arg0) <{relu = false, sat = #nvvm.sat_mode<satfinite>, srcType = f6E3M2FN}> : (vector<2xi8>) -> vector<2xbf16>
    %3 = "nvvm.convert.f6x2.to.bf16x2"(%arg0) <{relu = true, sat = #nvvm.sat_mode<satfinite>, srcType = f6E3M2FN}> : (vector<2xi8>) -> vector<2xbf16>
    %4 = "nvvm.convert.f6x2.to.bf16x2"(%arg0, %arg1) <{relu = false, sat = #nvvm.sat_mode<none>, srcType = f6E3M2FN}> : (vector<2xi8>, i16) -> vector<2xbf16>
    "llvm.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

