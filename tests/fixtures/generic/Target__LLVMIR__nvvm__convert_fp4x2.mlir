"builtin.module"() ({
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (f32, f32)>, linkage = #llvm.linkage<external>, sym_name = "convert_f32x2_to_f4x2_e2m1", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg1: f32, %arg2: f32):
    %2 = "nvvm.convert.f32x2.to.f4x2"(%arg1, %arg2) <{dstTy = f4E2M1FN, relu = false}> : (f32, f32) -> i8
    %3 = "nvvm.convert.f32x2.to.f4x2"(%arg1, %arg2) <{dstTy = f4E2M1FN, relu = true}> : (f32, f32) -> i8
    "llvm.return"() : () -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (i8)>, linkage = #llvm.linkage<external>, sym_name = "convert_f4x2_to_f16x2", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg0: i8):
    %0 = "nvvm.convert.f4x2.to.f16x2"(%arg0) <{relu = false, srcType = f4E2M1FN}> : (i8) -> vector<2xf16>
    %1 = "nvvm.convert.f4x2.to.f16x2"(%arg0) <{relu = true, srcType = f4E2M1FN}> : (i8) -> vector<2xf16>
    "llvm.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

