"builtin.module"() ({
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (f32, f32)>, linkage = #llvm.linkage<external>, sym_name = "convert_f32x2_to_f16x2_rn", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg5: f32 loc("<stdin>":3:8), %arg6: f32 loc("<stdin>":3:20)):
    %8 = "nvvm.convert.f32x2.to.f16x2"(%arg5, %arg6) <{relu = false, rnd = #nvvm.fp_rnd_mode<rn>, sat = #nvvm.sat_mode<none>}> : (f32, f32) -> vector<2xf16> loc("<stdin>":4:10)
    %9 = "nvvm.convert.f32x2.to.f16x2"(%arg5, %arg6) <{relu = false, rnd = #nvvm.fp_rnd_mode<rn>, sat = #nvvm.sat_mode<satfinite>}> : (f32, f32) -> vector<2xf16> loc("<stdin>":5:10)
    %10 = "nvvm.convert.f32x2.to.f16x2"(%arg5, %arg6) <{relu = true, rnd = #nvvm.fp_rnd_mode<rn>, sat = #nvvm.sat_mode<none>}> : (f32, f32) -> vector<2xf16> loc("<stdin>":6:11)
    %11 = "nvvm.convert.f32x2.to.f16x2"(%arg5, %arg6) <{relu = true, rnd = #nvvm.fp_rnd_mode<rn>, sat = #nvvm.sat_mode<satfinite>}> : (f32, f32) -> vector<2xf16> loc("<stdin>":7:11)
    "llvm.return"() : () -> () loc("<stdin>":8:5)
  }) : () -> () loc("<stdin>":2:3)
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (f32, f32)>, linkage = #llvm.linkage<external>, sym_name = "convert_f32x2_to_f16x2_rz", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg3: f32 loc("<stdin>":11:8), %arg4: f32 loc("<stdin>":11:20)):
    %4 = "nvvm.convert.f32x2.to.f16x2"(%arg3, %arg4) <{relu = false, rnd = #nvvm.fp_rnd_mode<rz>, sat = #nvvm.sat_mode<none>}> : (f32, f32) -> vector<2xf16> loc("<stdin>":12:10)
    %5 = "nvvm.convert.f32x2.to.f16x2"(%arg3, %arg4) <{relu = false, rnd = #nvvm.fp_rnd_mode<rz>, sat = #nvvm.sat_mode<satfinite>}> : (f32, f32) -> vector<2xf16> loc("<stdin>":13:10)
    %6 = "nvvm.convert.f32x2.to.f16x2"(%arg3, %arg4) <{relu = true, rnd = #nvvm.fp_rnd_mode<rz>, sat = #nvvm.sat_mode<none>}> : (f32, f32) -> vector<2xf16> loc("<stdin>":14:10)
    %7 = "nvvm.convert.f32x2.to.f16x2"(%arg3, %arg4) <{relu = true, rnd = #nvvm.fp_rnd_mode<rz>, sat = #nvvm.sat_mode<satfinite>}> : (f32, f32) -> vector<2xf16> loc("<stdin>":15:10)
    "llvm.return"() : () -> () loc("<stdin>":16:5)
  }) : () -> () loc("<stdin>":10:3)
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (f32, f32, i32)>, linkage = #llvm.linkage<external>, sym_name = "convert_f32x2_to_f16x2_rs_stochastic", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg0: f32 loc("<stdin>":19:8), %arg1: f32 loc("<stdin>":19:20), %arg2: i32 loc("<stdin>":19:32)):
    %0 = "nvvm.convert.f32x2.to.f16x2"(%arg0, %arg1, %arg2) <{relu = false, rnd = #nvvm.fp_rnd_mode<rs>, sat = #nvvm.sat_mode<none>}> : (f32, f32, i32) -> vector<2xf16> loc("<stdin>":20:10)
    %1 = "nvvm.convert.f32x2.to.f16x2"(%arg0, %arg1, %arg2) <{relu = true, rnd = #nvvm.fp_rnd_mode<rs>, sat = #nvvm.sat_mode<none>}> : (f32, f32, i32) -> vector<2xf16> loc("<stdin>":21:10)
    %2 = "nvvm.convert.f32x2.to.f16x2"(%arg0, %arg1, %arg2) <{relu = false, rnd = #nvvm.fp_rnd_mode<rs>, sat = #nvvm.sat_mode<satfinite>}> : (f32, f32, i32) -> vector<2xf16> loc("<stdin>":22:10)
    %3 = "nvvm.convert.f32x2.to.f16x2"(%arg0, %arg1, %arg2) <{relu = true, rnd = #nvvm.fp_rnd_mode<rs>, sat = #nvvm.sat_mode<satfinite>}> : (f32, f32, i32) -> vector<2xf16> loc("<stdin>":23:10)
    "llvm.return"() : () -> () loc("<stdin>":24:5)
  }) : () -> () loc("<stdin>":18:3)
}) : () -> () loc("<stdin>":1:1)
