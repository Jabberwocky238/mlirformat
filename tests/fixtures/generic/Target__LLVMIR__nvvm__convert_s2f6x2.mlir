"builtin.module"() ({
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<i16 (f32, f32)>, linkage = #llvm.linkage<external>, sym_name = "convert_f32x2_to_s2f6x2", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg26: f32, %arg27: f32):
    %21 = "nvvm.convert.f32x2.to.s2f6x2"(%arg26, %arg27) <{relu = false}> : (f32, f32) -> i16
    %22 = "nvvm.convert.f32x2.to.s2f6x2"(%arg26, %arg27) <{relu = true}> : (f32, f32) -> i16
    %23 = "llvm.or"(%21, %22) : (i16, i16) -> i16
    "llvm.return"(%23) : (i16) -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<i16 (f32, f32, i16)>, linkage = #llvm.linkage<external>, sym_name = "convert_f32x2_to_s2f6x2_scale", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg23: f32, %arg24: f32, %arg25: i16):
    %18 = "nvvm.convert.f32x2.to.s2f6x2"(%arg23, %arg24, %arg25) <{relu = false}> : (f32, f32, i16) -> i16
    %19 = "nvvm.convert.f32x2.to.s2f6x2"(%arg23, %arg24, %arg25) <{relu = true}> : (f32, f32, i16) -> i16
    %20 = "llvm.or"(%18, %19) : (i16, i16) -> i16
    "llvm.return"(%20) : (i16) -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<vector<2xi8> (f32, f32)>, linkage = #llvm.linkage<external>, sym_name = "convert_f32x2_to_s2f6x2_vector", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg21: f32, %arg22: f32):
    %17 = "nvvm.convert.f32x2.to.s2f6x2"(%arg21, %arg22) <{relu = false}> : (f32, f32) -> vector<2xi8>
    "llvm.return"(%17) : (vector<2xi8>) -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<vector<2xi8> (f32, f32, i16)>, linkage = #llvm.linkage<external>, sym_name = "convert_f32x2_to_s2f6x2_vector_scale", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg18: f32, %arg19: f32, %arg20: i16):
    %16 = "nvvm.convert.f32x2.to.s2f6x2"(%arg18, %arg19, %arg20) <{relu = false}> : (f32, f32, i16) -> vector<2xi8>
    "llvm.return"(%16) : (vector<2xi8>) -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<i16 (vector<2xbf16>)>, linkage = #llvm.linkage<external>, sym_name = "convert_bf16x2_to_s2f6x2", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg17: vector<2xbf16>):
    %13 = "nvvm.convert.bf16x2.to.s2f6x2"(%arg17) <{relu = false}> : (vector<2xbf16>) -> i16
    %14 = "nvvm.convert.bf16x2.to.s2f6x2"(%arg17) <{relu = true}> : (vector<2xbf16>) -> i16
    %15 = "llvm.or"(%13, %14) : (i16, i16) -> i16
    "llvm.return"(%15) : (i16) -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<i16 (vector<2xbf16>, i16)>, linkage = #llvm.linkage<external>, sym_name = "convert_bf16x2_to_s2f6x2_scale", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg15: vector<2xbf16>, %arg16: i16):
    %10 = "nvvm.convert.bf16x2.to.s2f6x2"(%arg15, %arg16) <{relu = false}> : (vector<2xbf16>, i16) -> i16
    %11 = "nvvm.convert.bf16x2.to.s2f6x2"(%arg15, %arg16) <{relu = true}> : (vector<2xbf16>, i16) -> i16
    %12 = "llvm.or"(%10, %11) : (i16, i16) -> i16
    "llvm.return"(%12) : (i16) -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<vector<2xi8> (vector<2xbf16>)>, linkage = #llvm.linkage<external>, sym_name = "convert_bf16x2_to_s2f6x2_vector", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg14: vector<2xbf16>):
    %9 = "nvvm.convert.bf16x2.to.s2f6x2"(%arg14) <{relu = false}> : (vector<2xbf16>) -> vector<2xi8>
    "llvm.return"(%9) : (vector<2xi8>) -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<vector<2xi8> (vector<2xbf16>, i16)>, linkage = #llvm.linkage<external>, sym_name = "convert_bf16x2_to_s2f6x2_vector_scale", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg12: vector<2xbf16>, %arg13: i16):
    %8 = "nvvm.convert.bf16x2.to.s2f6x2"(%arg12, %arg13) <{relu = false}> : (vector<2xbf16>, i16) -> vector<2xi8>
    "llvm.return"(%8) : (vector<2xi8>) -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<vector<2xbf16> (vector<2xi8>)>, linkage = #llvm.linkage<external>, sym_name = "convert_s2f6x2_to_bf16x2", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg11: vector<2xi8>):
    %7 = "nvvm.convert.s2f6x2.to.bf16x2"(%arg11) <{relu = false, sat = #nvvm.sat_mode<none>}> : (vector<2xi8>) -> vector<2xbf16>
    "llvm.return"(%7) : (vector<2xbf16>) -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<vector<2xbf16> (vector<2xi8>)>, linkage = #llvm.linkage<external>, sym_name = "convert_s2f6x2_to_bf16x2_relu", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg10: vector<2xi8>):
    %6 = "nvvm.convert.s2f6x2.to.bf16x2"(%arg10) <{relu = true, sat = #nvvm.sat_mode<none>}> : (vector<2xi8>) -> vector<2xbf16>
    "llvm.return"(%6) : (vector<2xbf16>) -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<vector<2xbf16> (vector<2xi8>, i16)>, linkage = #llvm.linkage<external>, sym_name = "convert_s2f6x2_to_bf16x2_scale", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg8: vector<2xi8>, %arg9: i16):
    %5 = "nvvm.convert.s2f6x2.to.bf16x2"(%arg8, %arg9) <{relu = false, sat = #nvvm.sat_mode<none>}> : (vector<2xi8>, i16) -> vector<2xbf16>
    "llvm.return"(%5) : (vector<2xbf16>) -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<vector<2xbf16> (vector<2xi8>, i16)>, linkage = #llvm.linkage<external>, sym_name = "convert_s2f6x2_to_bf16x2_scale_relu", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg6: vector<2xi8>, %arg7: i16):
    %4 = "nvvm.convert.s2f6x2.to.bf16x2"(%arg6, %arg7) <{relu = true, sat = #nvvm.sat_mode<none>}> : (vector<2xi8>, i16) -> vector<2xbf16>
    "llvm.return"(%4) : (vector<2xbf16>) -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<vector<2xbf16> (vector<2xi8>)>, linkage = #llvm.linkage<external>, sym_name = "convert_s2f6x2_to_bf16x2_satfinite", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg5: vector<2xi8>):
    %3 = "nvvm.convert.s2f6x2.to.bf16x2"(%arg5) <{relu = false, sat = #nvvm.sat_mode<satfinite>}> : (vector<2xi8>) -> vector<2xbf16>
    "llvm.return"(%3) : (vector<2xbf16>) -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<vector<2xbf16> (vector<2xi8>)>, linkage = #llvm.linkage<external>, sym_name = "convert_s2f6x2_to_bf16x2_relu_satfinite", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg4: vector<2xi8>):
    %2 = "nvvm.convert.s2f6x2.to.bf16x2"(%arg4) <{relu = true, sat = #nvvm.sat_mode<satfinite>}> : (vector<2xi8>) -> vector<2xbf16>
    "llvm.return"(%2) : (vector<2xbf16>) -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<vector<2xbf16> (vector<2xi8>, i16)>, linkage = #llvm.linkage<external>, sym_name = "convert_s2f6x2_to_bf16x2_scale_satfinite", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg2: vector<2xi8>, %arg3: i16):
    %1 = "nvvm.convert.s2f6x2.to.bf16x2"(%arg2, %arg3) <{relu = false, sat = #nvvm.sat_mode<satfinite>}> : (vector<2xi8>, i16) -> vector<2xbf16>
    "llvm.return"(%1) : (vector<2xbf16>) -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<vector<2xbf16> (vector<2xi8>, i16)>, linkage = #llvm.linkage<external>, sym_name = "convert_s2f6x2_to_bf16x2_scale_relu_satfinite", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg0: vector<2xi8>, %arg1: i16):
    %0 = "nvvm.convert.s2f6x2.to.bf16x2"(%arg0, %arg1) <{relu = true, sat = #nvvm.sat_mode<satfinite>}> : (vector<2xi8>, i16) -> vector<2xbf16>
    "llvm.return"(%0) : (vector<2xbf16>) -> ()
  }) : () -> ()
}) : () -> ()

