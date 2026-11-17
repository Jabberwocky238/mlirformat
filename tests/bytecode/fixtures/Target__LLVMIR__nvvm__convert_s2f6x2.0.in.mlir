"builtin.module"() ({
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<i16 (f32, f32)>, linkage = #llvm.linkage<external>, sym_name = "convert_f32x2_to_s2f6x2", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg26: f32 loc("<stdin>":3:8), %arg27: f32 loc("<stdin>":3:21)):
    %21 = "nvvm.convert.f32x2.to.s2f6x2"(%arg26, %arg27) <{relu = false}> : (f32, f32) -> i16 loc("<stdin>":4:11)
    %22 = "nvvm.convert.f32x2.to.s2f6x2"(%arg26, %arg27) <{relu = true}> : (f32, f32) -> i16 loc("<stdin>":5:11)
    %23 = "llvm.or"(%21, %22) : (i16, i16) -> i16 loc("<stdin>":6:11)
    "llvm.return"(%23) : (i16) -> () loc("<stdin>":7:5)
  }) : () -> () loc("<stdin>":2:3)
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<i16 (f32, f32, i16)>, linkage = #llvm.linkage<external>, sym_name = "convert_f32x2_to_s2f6x2_scale", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg23: f32 loc("<stdin>":10:8), %arg24: f32 loc("<stdin>":10:21), %arg25: i16 loc("<stdin>":10:34)):
    %18 = "nvvm.convert.f32x2.to.s2f6x2"(%arg23, %arg24, %arg25) <{relu = false}> : (f32, f32, i16) -> i16 loc("<stdin>":11:11)
    %19 = "nvvm.convert.f32x2.to.s2f6x2"(%arg23, %arg24, %arg25) <{relu = true}> : (f32, f32, i16) -> i16 loc("<stdin>":12:11)
    %20 = "llvm.or"(%18, %19) : (i16, i16) -> i16 loc("<stdin>":13:11)
    "llvm.return"(%20) : (i16) -> () loc("<stdin>":14:5)
  }) : () -> () loc("<stdin>":9:3)
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<vector<2xi8> (f32, f32)>, linkage = #llvm.linkage<external>, sym_name = "convert_f32x2_to_s2f6x2_vector", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg21: f32 loc("<stdin>":17:8), %arg22: f32 loc("<stdin>":17:21)):
    %17 = "nvvm.convert.f32x2.to.s2f6x2"(%arg21, %arg22) <{relu = false}> : (f32, f32) -> vector<2xi8> loc("<stdin>":18:11)
    "llvm.return"(%17) : (vector<2xi8>) -> () loc("<stdin>":19:5)
  }) : () -> () loc("<stdin>":16:3)
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<vector<2xi8> (f32, f32, i16)>, linkage = #llvm.linkage<external>, sym_name = "convert_f32x2_to_s2f6x2_vector_scale", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg18: f32 loc("<stdin>":22:8), %arg19: f32 loc("<stdin>":22:21), %arg20: i16 loc("<stdin>":22:34)):
    %16 = "nvvm.convert.f32x2.to.s2f6x2"(%arg18, %arg19, %arg20) <{relu = false}> : (f32, f32, i16) -> vector<2xi8> loc("<stdin>":23:11)
    "llvm.return"(%16) : (vector<2xi8>) -> () loc("<stdin>":24:5)
  }) : () -> () loc("<stdin>":21:3)
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<i16 (vector<2xbf16>)>, linkage = #llvm.linkage<external>, sym_name = "convert_bf16x2_to_s2f6x2", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg17: vector<2xbf16> loc("<stdin>":27:8)):
    %13 = "nvvm.convert.bf16x2.to.s2f6x2"(%arg17) <{relu = false}> : (vector<2xbf16>) -> i16 loc("<stdin>":28:11)
    %14 = "nvvm.convert.bf16x2.to.s2f6x2"(%arg17) <{relu = true}> : (vector<2xbf16>) -> i16 loc("<stdin>":29:11)
    %15 = "llvm.or"(%13, %14) : (i16, i16) -> i16 loc("<stdin>":30:11)
    "llvm.return"(%15) : (i16) -> () loc("<stdin>":31:5)
  }) : () -> () loc("<stdin>":26:3)
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<i16 (vector<2xbf16>, i16)>, linkage = #llvm.linkage<external>, sym_name = "convert_bf16x2_to_s2f6x2_scale", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg15: vector<2xbf16> loc("<stdin>":34:8), %arg16: i16 loc("<stdin>":34:32)):
    %10 = "nvvm.convert.bf16x2.to.s2f6x2"(%arg15, %arg16) <{relu = false}> : (vector<2xbf16>, i16) -> i16 loc("<stdin>":35:11)
    %11 = "nvvm.convert.bf16x2.to.s2f6x2"(%arg15, %arg16) <{relu = true}> : (vector<2xbf16>, i16) -> i16 loc("<stdin>":36:11)
    %12 = "llvm.or"(%10, %11) : (i16, i16) -> i16 loc("<stdin>":37:11)
    "llvm.return"(%12) : (i16) -> () loc("<stdin>":38:5)
  }) : () -> () loc("<stdin>":33:3)
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<vector<2xi8> (vector<2xbf16>)>, linkage = #llvm.linkage<external>, sym_name = "convert_bf16x2_to_s2f6x2_vector", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg14: vector<2xbf16> loc("<stdin>":41:8)):
    %9 = "nvvm.convert.bf16x2.to.s2f6x2"(%arg14) <{relu = false}> : (vector<2xbf16>) -> vector<2xi8> loc("<stdin>":42:10)
    "llvm.return"(%9) : (vector<2xi8>) -> () loc("<stdin>":43:5)
  }) : () -> () loc("<stdin>":40:3)
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<vector<2xi8> (vector<2xbf16>, i16)>, linkage = #llvm.linkage<external>, sym_name = "convert_bf16x2_to_s2f6x2_vector_scale", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg12: vector<2xbf16> loc("<stdin>":46:8), %arg13: i16 loc("<stdin>":46:32)):
    %8 = "nvvm.convert.bf16x2.to.s2f6x2"(%arg12, %arg13) <{relu = false}> : (vector<2xbf16>, i16) -> vector<2xi8> loc("<stdin>":47:10)
    "llvm.return"(%8) : (vector<2xi8>) -> () loc("<stdin>":48:5)
  }) : () -> () loc("<stdin>":45:3)
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<vector<2xbf16> (vector<2xi8>)>, linkage = #llvm.linkage<external>, sym_name = "convert_s2f6x2_to_bf16x2", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg11: vector<2xi8> loc("<stdin>":51:8)):
    %7 = "nvvm.convert.s2f6x2.to.bf16x2"(%arg11) <{relu = false, sat = #nvvm.sat_mode<none>}> : (vector<2xi8>) -> vector<2xbf16> loc("<stdin>":52:10)
    "llvm.return"(%7) : (vector<2xbf16>) -> () loc("<stdin>":53:5)
  }) : () -> () loc("<stdin>":50:3)
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<vector<2xbf16> (vector<2xi8>)>, linkage = #llvm.linkage<external>, sym_name = "convert_s2f6x2_to_bf16x2_relu", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg10: vector<2xi8> loc("<stdin>":56:8)):
    %6 = "nvvm.convert.s2f6x2.to.bf16x2"(%arg10) <{relu = true, sat = #nvvm.sat_mode<none>}> : (vector<2xi8>) -> vector<2xbf16> loc("<stdin>":57:10)
    "llvm.return"(%6) : (vector<2xbf16>) -> () loc("<stdin>":58:5)
  }) : () -> () loc("<stdin>":55:3)
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<vector<2xbf16> (vector<2xi8>, i16)>, linkage = #llvm.linkage<external>, sym_name = "convert_s2f6x2_to_bf16x2_scale", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg8: vector<2xi8> loc("<stdin>":61:8), %arg9: i16 loc("<stdin>":61:29)):
    %5 = "nvvm.convert.s2f6x2.to.bf16x2"(%arg8, %arg9) <{relu = false, sat = #nvvm.sat_mode<none>}> : (vector<2xi8>, i16) -> vector<2xbf16> loc("<stdin>":62:10)
    "llvm.return"(%5) : (vector<2xbf16>) -> () loc("<stdin>":63:5)
  }) : () -> () loc("<stdin>":60:3)
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<vector<2xbf16> (vector<2xi8>, i16)>, linkage = #llvm.linkage<external>, sym_name = "convert_s2f6x2_to_bf16x2_scale_relu", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg6: vector<2xi8> loc("<stdin>":66:8), %arg7: i16 loc("<stdin>":66:29)):
    %4 = "nvvm.convert.s2f6x2.to.bf16x2"(%arg6, %arg7) <{relu = true, sat = #nvvm.sat_mode<none>}> : (vector<2xi8>, i16) -> vector<2xbf16> loc("<stdin>":67:10)
    "llvm.return"(%4) : (vector<2xbf16>) -> () loc("<stdin>":68:5)
  }) : () -> () loc("<stdin>":65:3)
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<vector<2xbf16> (vector<2xi8>)>, linkage = #llvm.linkage<external>, sym_name = "convert_s2f6x2_to_bf16x2_satfinite", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg5: vector<2xi8> loc("<stdin>":71:8)):
    %3 = "nvvm.convert.s2f6x2.to.bf16x2"(%arg5) <{relu = false, sat = #nvvm.sat_mode<satfinite>}> : (vector<2xi8>) -> vector<2xbf16> loc("<stdin>":72:10)
    "llvm.return"(%3) : (vector<2xbf16>) -> () loc("<stdin>":73:5)
  }) : () -> () loc("<stdin>":70:3)
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<vector<2xbf16> (vector<2xi8>)>, linkage = #llvm.linkage<external>, sym_name = "convert_s2f6x2_to_bf16x2_relu_satfinite", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg4: vector<2xi8> loc("<stdin>":76:8)):
    %2 = "nvvm.convert.s2f6x2.to.bf16x2"(%arg4) <{relu = true, sat = #nvvm.sat_mode<satfinite>}> : (vector<2xi8>) -> vector<2xbf16> loc("<stdin>":77:10)
    "llvm.return"(%2) : (vector<2xbf16>) -> () loc("<stdin>":78:5)
  }) : () -> () loc("<stdin>":75:3)
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<vector<2xbf16> (vector<2xi8>, i16)>, linkage = #llvm.linkage<external>, sym_name = "convert_s2f6x2_to_bf16x2_scale_satfinite", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg2: vector<2xi8> loc("<stdin>":81:8), %arg3: i16 loc("<stdin>":81:29)):
    %1 = "nvvm.convert.s2f6x2.to.bf16x2"(%arg2, %arg3) <{relu = false, sat = #nvvm.sat_mode<satfinite>}> : (vector<2xi8>, i16) -> vector<2xbf16> loc("<stdin>":82:10)
    "llvm.return"(%1) : (vector<2xbf16>) -> () loc("<stdin>":83:5)
  }) : () -> () loc("<stdin>":80:3)
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<vector<2xbf16> (vector<2xi8>, i16)>, linkage = #llvm.linkage<external>, sym_name = "convert_s2f6x2_to_bf16x2_scale_relu_satfinite", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg0: vector<2xi8> loc("<stdin>":86:8), %arg1: i16 loc("<stdin>":86:29)):
    %0 = "nvvm.convert.s2f6x2.to.bf16x2"(%arg0, %arg1) <{relu = true, sat = #nvvm.sat_mode<satfinite>}> : (vector<2xi8>, i16) -> vector<2xbf16> loc("<stdin>":87:10)
    "llvm.return"(%0) : (vector<2xbf16>) -> () loc("<stdin>":88:5)
  }) : () -> () loc("<stdin>":85:3)
}) : () -> () loc("<stdin>":1:1)
