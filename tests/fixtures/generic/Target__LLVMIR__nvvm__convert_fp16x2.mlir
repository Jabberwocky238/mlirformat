"builtin.module"() ({
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (f32, f32)>, linkage = #llvm.linkage<external>, sym_name = "convert_f32x2_to_f16x2_rn", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg5: f32, %arg6: f32):
    %8 = "nvvm.convert.f32x2.to.f16x2"(%arg5, %arg6) <{relu = false, rnd = #nvvm.fp_rnd_mode<rn>, sat = #nvvm.sat_mode<none>}> : (f32, f32) -> vector<2xf16>
    %9 = "nvvm.convert.f32x2.to.f16x2"(%arg5, %arg6) <{relu = false, rnd = #nvvm.fp_rnd_mode<rn>, sat = #nvvm.sat_mode<satfinite>}> : (f32, f32) -> vector<2xf16>
    %10 = "nvvm.convert.f32x2.to.f16x2"(%arg5, %arg6) <{relu = true, rnd = #nvvm.fp_rnd_mode<rn>, sat = #nvvm.sat_mode<none>}> : (f32, f32) -> vector<2xf16>
    %11 = "nvvm.convert.f32x2.to.f16x2"(%arg5, %arg6) <{relu = true, rnd = #nvvm.fp_rnd_mode<rn>, sat = #nvvm.sat_mode<satfinite>}> : (f32, f32) -> vector<2xf16>
    "llvm.return"() : () -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (f32, f32)>, linkage = #llvm.linkage<external>, sym_name = "convert_f32x2_to_f16x2_rz", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg3: f32, %arg4: f32):
    %4 = "nvvm.convert.f32x2.to.f16x2"(%arg3, %arg4) <{relu = false, rnd = #nvvm.fp_rnd_mode<rz>, sat = #nvvm.sat_mode<none>}> : (f32, f32) -> vector<2xf16>
    %5 = "nvvm.convert.f32x2.to.f16x2"(%arg3, %arg4) <{relu = false, rnd = #nvvm.fp_rnd_mode<rz>, sat = #nvvm.sat_mode<satfinite>}> : (f32, f32) -> vector<2xf16>
    %6 = "nvvm.convert.f32x2.to.f16x2"(%arg3, %arg4) <{relu = true, rnd = #nvvm.fp_rnd_mode<rz>, sat = #nvvm.sat_mode<none>}> : (f32, f32) -> vector<2xf16>
    %7 = "nvvm.convert.f32x2.to.f16x2"(%arg3, %arg4) <{relu = true, rnd = #nvvm.fp_rnd_mode<rz>, sat = #nvvm.sat_mode<satfinite>}> : (f32, f32) -> vector<2xf16>
    "llvm.return"() : () -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (f32, f32, i32)>, linkage = #llvm.linkage<external>, sym_name = "convert_f32x2_to_f16x2_rs_stochastic", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg0: f32, %arg1: f32, %arg2: i32):
    %0 = "nvvm.convert.f32x2.to.f16x2"(%arg0, %arg1, %arg2) <{relu = false, rnd = #nvvm.fp_rnd_mode<rs>, sat = #nvvm.sat_mode<none>}> : (f32, f32, i32) -> vector<2xf16>
    %1 = "nvvm.convert.f32x2.to.f16x2"(%arg0, %arg1, %arg2) <{relu = true, rnd = #nvvm.fp_rnd_mode<rs>, sat = #nvvm.sat_mode<none>}> : (f32, f32, i32) -> vector<2xf16>
    %2 = "nvvm.convert.f32x2.to.f16x2"(%arg0, %arg1, %arg2) <{relu = false, rnd = #nvvm.fp_rnd_mode<rs>, sat = #nvvm.sat_mode<satfinite>}> : (f32, f32, i32) -> vector<2xf16>
    %3 = "nvvm.convert.f32x2.to.f16x2"(%arg0, %arg1, %arg2) <{relu = true, rnd = #nvvm.fp_rnd_mode<rs>, sat = #nvvm.sat_mode<satfinite>}> : (f32, f32, i32) -> vector<2xf16>
    "llvm.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (f32, f32)>, linkage = #llvm.linkage<external>, sym_name = "convert_f32x2_to_bf16x2_rn", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg5: f32, %arg6: f32):
    %8 = "nvvm.convert.f32x2.to.bf16x2"(%arg5, %arg6) <{relu = false, rnd = #nvvm.fp_rnd_mode<rn>, sat = #nvvm.sat_mode<none>}> : (f32, f32) -> vector<2xbf16>
    %9 = "nvvm.convert.f32x2.to.bf16x2"(%arg5, %arg6) <{relu = false, rnd = #nvvm.fp_rnd_mode<rn>, sat = #nvvm.sat_mode<satfinite>}> : (f32, f32) -> vector<2xbf16>
    %10 = "nvvm.convert.f32x2.to.bf16x2"(%arg5, %arg6) <{relu = true, rnd = #nvvm.fp_rnd_mode<rn>, sat = #nvvm.sat_mode<none>}> : (f32, f32) -> vector<2xbf16>
    %11 = "nvvm.convert.f32x2.to.bf16x2"(%arg5, %arg6) <{relu = true, rnd = #nvvm.fp_rnd_mode<rn>, sat = #nvvm.sat_mode<satfinite>}> : (f32, f32) -> vector<2xbf16>
    "llvm.return"() : () -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (f32, f32)>, linkage = #llvm.linkage<external>, sym_name = "convert_f32x2_to_bf16x2_rz", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg3: f32, %arg4: f32):
    %4 = "nvvm.convert.f32x2.to.bf16x2"(%arg3, %arg4) <{relu = false, rnd = #nvvm.fp_rnd_mode<rz>, sat = #nvvm.sat_mode<none>}> : (f32, f32) -> vector<2xbf16>
    %5 = "nvvm.convert.f32x2.to.bf16x2"(%arg3, %arg4) <{relu = false, rnd = #nvvm.fp_rnd_mode<rz>, sat = #nvvm.sat_mode<satfinite>}> : (f32, f32) -> vector<2xbf16>
    %6 = "nvvm.convert.f32x2.to.bf16x2"(%arg3, %arg4) <{relu = true, rnd = #nvvm.fp_rnd_mode<rz>, sat = #nvvm.sat_mode<none>}> : (f32, f32) -> vector<2xbf16>
    %7 = "nvvm.convert.f32x2.to.bf16x2"(%arg3, %arg4) <{relu = true, rnd = #nvvm.fp_rnd_mode<rz>, sat = #nvvm.sat_mode<satfinite>}> : (f32, f32) -> vector<2xbf16>
    "llvm.return"() : () -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (f32, f32, i32)>, linkage = #llvm.linkage<external>, sym_name = "convert_f32x2_to_bf16x2_rs_stochastic", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg0: f32, %arg1: f32, %arg2: i32):
    %0 = "nvvm.convert.f32x2.to.bf16x2"(%arg0, %arg1, %arg2) <{relu = false, rnd = #nvvm.fp_rnd_mode<rs>, sat = #nvvm.sat_mode<none>}> : (f32, f32, i32) -> vector<2xbf16>
    %1 = "nvvm.convert.f32x2.to.bf16x2"(%arg0, %arg1, %arg2) <{relu = true, rnd = #nvvm.fp_rnd_mode<rs>, sat = #nvvm.sat_mode<none>}> : (f32, f32, i32) -> vector<2xbf16>
    %2 = "nvvm.convert.f32x2.to.bf16x2"(%arg0, %arg1, %arg2) <{relu = false, rnd = #nvvm.fp_rnd_mode<rs>, sat = #nvvm.sat_mode<satfinite>}> : (f32, f32, i32) -> vector<2xbf16>
    %3 = "nvvm.convert.f32x2.to.bf16x2"(%arg0, %arg1, %arg2) <{relu = true, rnd = #nvvm.fp_rnd_mode<rs>, sat = #nvvm.sat_mode<satfinite>}> : (f32, f32, i32) -> vector<2xbf16>
    "llvm.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

