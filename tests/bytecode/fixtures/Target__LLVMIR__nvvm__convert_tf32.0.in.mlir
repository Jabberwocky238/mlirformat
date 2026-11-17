"builtin.module"() ({
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<i32 (f32)>, linkage = #llvm.linkage<external>, sym_name = "convert_float_to_tf32_rna", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg9: f32 loc("<stdin>":3:8)):
    %9 = "nvvm.convert.float.to.tf32"(%arg9) <{relu = false, rnd = #nvvm.fp_rnd_mode<rna>, sat = #nvvm.sat_mode<none>}> : (f32) -> i32 loc("<stdin>":4:10)
    "llvm.return"(%9) : (i32) -> () loc("<stdin>":5:5)
  }) : () -> () loc("<stdin>":2:3)
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<i32 (f32)>, linkage = #llvm.linkage<external>, sym_name = "convert_float_to_tf32_rna_sf", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg8: f32 loc("<stdin>":8:8)):
    %8 = "nvvm.convert.float.to.tf32"(%arg8) <{relu = false, rnd = #nvvm.fp_rnd_mode<rna>, sat = #nvvm.sat_mode<satfinite>}> : (f32) -> i32 loc("<stdin>":9:10)
    "llvm.return"(%8) : (i32) -> () loc("<stdin>":10:5)
  }) : () -> () loc("<stdin>":7:3)
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<i32 (f32)>, linkage = #llvm.linkage<external>, sym_name = "convert_float_to_tf32_rn", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg7: f32 loc("<stdin>":13:8)):
    %7 = "nvvm.convert.float.to.tf32"(%arg7) <{relu = false, rnd = #nvvm.fp_rnd_mode<rn>, sat = #nvvm.sat_mode<none>}> : (f32) -> i32 loc("<stdin>":14:10)
    "llvm.return"(%7) : (i32) -> () loc("<stdin>":15:5)
  }) : () -> () loc("<stdin>":12:3)
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<i32 (f32)>, linkage = #llvm.linkage<external>, sym_name = "convert_float_to_tf32_rn_relu", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg6: f32 loc("<stdin>":18:8)):
    %6 = "nvvm.convert.float.to.tf32"(%arg6) <{relu = true, rnd = #nvvm.fp_rnd_mode<rn>, sat = #nvvm.sat_mode<none>}> : (f32) -> i32 loc("<stdin>":19:10)
    "llvm.return"(%6) : (i32) -> () loc("<stdin>":20:5)
  }) : () -> () loc("<stdin>":17:3)
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<i32 (f32)>, linkage = #llvm.linkage<external>, sym_name = "convert_float_to_tf32_rn_sf", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg5: f32 loc("<stdin>":23:8)):
    %5 = "nvvm.convert.float.to.tf32"(%arg5) <{relu = false, rnd = #nvvm.fp_rnd_mode<rn>, sat = #nvvm.sat_mode<satfinite>}> : (f32) -> i32 loc("<stdin>":24:10)
    "llvm.return"(%5) : (i32) -> () loc("<stdin>":25:5)
  }) : () -> () loc("<stdin>":22:3)
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<i32 (f32)>, linkage = #llvm.linkage<external>, sym_name = "convert_float_to_tf32_rn_relu_sf", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg4: f32 loc("<stdin>":28:8)):
    %4 = "nvvm.convert.float.to.tf32"(%arg4) <{relu = true, rnd = #nvvm.fp_rnd_mode<rn>, sat = #nvvm.sat_mode<satfinite>}> : (f32) -> i32 loc("<stdin>":29:10)
    "llvm.return"(%4) : (i32) -> () loc("<stdin>":30:5)
  }) : () -> () loc("<stdin>":27:3)
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<i32 (f32)>, linkage = #llvm.linkage<external>, sym_name = "convert_float_to_tf32_rz", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg3: f32 loc("<stdin>":33:8)):
    %3 = "nvvm.convert.float.to.tf32"(%arg3) <{relu = false, rnd = #nvvm.fp_rnd_mode<rz>, sat = #nvvm.sat_mode<none>}> : (f32) -> i32 loc("<stdin>":34:10)
    "llvm.return"(%3) : (i32) -> () loc("<stdin>":35:5)
  }) : () -> () loc("<stdin>":32:3)
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<i32 (f32)>, linkage = #llvm.linkage<external>, sym_name = "convert_float_to_tf32_rz_relu", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg2: f32 loc("<stdin>":38:8)):
    %2 = "nvvm.convert.float.to.tf32"(%arg2) <{relu = true, rnd = #nvvm.fp_rnd_mode<rz>, sat = #nvvm.sat_mode<none>}> : (f32) -> i32 loc("<stdin>":39:10)
    "llvm.return"(%2) : (i32) -> () loc("<stdin>":40:5)
  }) : () -> () loc("<stdin>":37:3)
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<i32 (f32)>, linkage = #llvm.linkage<external>, sym_name = "convert_float_to_tf32_rz_sf", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg1: f32 loc("<stdin>":43:8)):
    %1 = "nvvm.convert.float.to.tf32"(%arg1) <{relu = false, rnd = #nvvm.fp_rnd_mode<rz>, sat = #nvvm.sat_mode<satfinite>}> : (f32) -> i32 loc("<stdin>":44:10)
    "llvm.return"(%1) : (i32) -> () loc("<stdin>":45:5)
  }) : () -> () loc("<stdin>":42:3)
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<i32 (f32)>, linkage = #llvm.linkage<external>, sym_name = "convert_float_to_tf32_rz_relu_sf", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg0: f32 loc("<stdin>":48:8)):
    %0 = "nvvm.convert.float.to.tf32"(%arg0) <{relu = true, rnd = #nvvm.fp_rnd_mode<rz>, sat = #nvvm.sat_mode<satfinite>}> : (f32) -> i32 loc("<stdin>":49:10)
    "llvm.return"(%0) : (i32) -> () loc("<stdin>":50:5)
  }) : () -> () loc("<stdin>":47:3)
}) : () -> () loc("<stdin>":1:1)
