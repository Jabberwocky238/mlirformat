"builtin.module"() ({
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (f32, f32)>, linkage = #llvm.linkage<external>, sym_name = "convert_f32x2_to_fp6x2_e2m3", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg4: f32 loc("<stdin>":3:8), %arg5: f32 loc("<stdin>":3:20)):
    %4 = "nvvm.convert.f32x2.to.f6x2"(%arg4, %arg5) <{dstTy = f6E2M3FN, relu = false}> : (f32, f32) -> i16 loc("<stdin>":4:10)
    %5 = "nvvm.convert.f32x2.to.f6x2"(%arg4, %arg5) <{dstTy = f6E2M3FN, relu = true}> : (f32, f32) -> i16 loc("<stdin>":5:10)
    "llvm.return"() : () -> () loc("<stdin>":6:5)
  }) : () -> () loc("<stdin>":2:3)
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (f32, f32)>, linkage = #llvm.linkage<external>, sym_name = "convert_f32x2_to_fp6x2_e3m2", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg2: f32 loc("<stdin>":9:8), %arg3: f32 loc("<stdin>":9:20)):
    %2 = "nvvm.convert.f32x2.to.f6x2"(%arg2, %arg3) <{dstTy = f6E3M2FN, relu = false}> : (f32, f32) -> i16 loc("<stdin>":10:10)
    %3 = "nvvm.convert.f32x2.to.f6x2"(%arg2, %arg3) <{dstTy = f6E3M2FN, relu = true}> : (f32, f32) -> i16 loc("<stdin>":11:10)
    "llvm.return"() : () -> () loc("<stdin>":12:5)
  }) : () -> () loc("<stdin>":8:3)
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (f32, f32)>, linkage = #llvm.linkage<external>, sym_name = "convert_f32x2_to_fp6x2_vector", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg0: f32 loc("<stdin>":15:8), %arg1: f32 loc("<stdin>":15:20)):
    %0 = "nvvm.convert.f32x2.to.f6x2"(%arg0, %arg1) <{dstTy = f6E2M3FN, relu = false}> : (f32, f32) -> vector<2xi8> loc("<stdin>":16:10)
    %1 = "nvvm.convert.f32x2.to.f6x2"(%arg0, %arg1) <{dstTy = f6E3M2FN, relu = false}> : (f32, f32) -> vector<2xi8> loc("<stdin>":17:10)
    "llvm.return"() : () -> () loc("<stdin>":18:5)
  }) : () -> () loc("<stdin>":14:3)
}) : () -> () loc("<stdin>":1:1)
