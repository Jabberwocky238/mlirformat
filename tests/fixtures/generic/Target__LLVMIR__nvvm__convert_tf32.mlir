"builtin.module"() ({
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<i32 (f32)>, linkage = #llvm.linkage<external>, sym_name = "convert_float_to_tf32_rna", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg9: f32):
    %9 = "nvvm.convert.float.to.tf32"(%arg9) <{relu = false, rnd = #nvvm.fp_rnd_mode<rna>, sat = #nvvm.sat_mode<none>}> : (f32) -> i32
    "llvm.return"(%9) : (i32) -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<i32 (f32)>, linkage = #llvm.linkage<external>, sym_name = "convert_float_to_tf32_rna_sf", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg8: f32):
    %8 = "nvvm.convert.float.to.tf32"(%arg8) <{relu = false, rnd = #nvvm.fp_rnd_mode<rna>, sat = #nvvm.sat_mode<satfinite>}> : (f32) -> i32
    "llvm.return"(%8) : (i32) -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<i32 (f32)>, linkage = #llvm.linkage<external>, sym_name = "convert_float_to_tf32_rn", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg7: f32):
    %7 = "nvvm.convert.float.to.tf32"(%arg7) <{relu = false, rnd = #nvvm.fp_rnd_mode<rn>, sat = #nvvm.sat_mode<none>}> : (f32) -> i32
    "llvm.return"(%7) : (i32) -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<i32 (f32)>, linkage = #llvm.linkage<external>, sym_name = "convert_float_to_tf32_rn_relu", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg6: f32):
    %6 = "nvvm.convert.float.to.tf32"(%arg6) <{relu = true, rnd = #nvvm.fp_rnd_mode<rn>, sat = #nvvm.sat_mode<none>}> : (f32) -> i32
    "llvm.return"(%6) : (i32) -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<i32 (f32)>, linkage = #llvm.linkage<external>, sym_name = "convert_float_to_tf32_rn_sf", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg5: f32):
    %5 = "nvvm.convert.float.to.tf32"(%arg5) <{relu = false, rnd = #nvvm.fp_rnd_mode<rn>, sat = #nvvm.sat_mode<satfinite>}> : (f32) -> i32
    "llvm.return"(%5) : (i32) -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<i32 (f32)>, linkage = #llvm.linkage<external>, sym_name = "convert_float_to_tf32_rn_relu_sf", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg4: f32):
    %4 = "nvvm.convert.float.to.tf32"(%arg4) <{relu = true, rnd = #nvvm.fp_rnd_mode<rn>, sat = #nvvm.sat_mode<satfinite>}> : (f32) -> i32
    "llvm.return"(%4) : (i32) -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<i32 (f32)>, linkage = #llvm.linkage<external>, sym_name = "convert_float_to_tf32_rz", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg3: f32):
    %3 = "nvvm.convert.float.to.tf32"(%arg3) <{relu = false, rnd = #nvvm.fp_rnd_mode<rz>, sat = #nvvm.sat_mode<none>}> : (f32) -> i32
    "llvm.return"(%3) : (i32) -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<i32 (f32)>, linkage = #llvm.linkage<external>, sym_name = "convert_float_to_tf32_rz_relu", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg2: f32):
    %2 = "nvvm.convert.float.to.tf32"(%arg2) <{relu = true, rnd = #nvvm.fp_rnd_mode<rz>, sat = #nvvm.sat_mode<none>}> : (f32) -> i32
    "llvm.return"(%2) : (i32) -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<i32 (f32)>, linkage = #llvm.linkage<external>, sym_name = "convert_float_to_tf32_rz_sf", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg1: f32):
    %1 = "nvvm.convert.float.to.tf32"(%arg1) <{relu = false, rnd = #nvvm.fp_rnd_mode<rz>, sat = #nvvm.sat_mode<satfinite>}> : (f32) -> i32
    "llvm.return"(%1) : (i32) -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<i32 (f32)>, linkage = #llvm.linkage<external>, sym_name = "convert_float_to_tf32_rz_relu_sf", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg0: f32):
    %0 = "nvvm.convert.float.to.tf32"(%arg0) <{relu = true, rnd = #nvvm.fp_rnd_mode<rz>, sat = #nvvm.sat_mode<satfinite>}> : (f32) -> i32
    "llvm.return"(%0) : (i32) -> ()
  }) : () -> ()
}) : () -> ()

