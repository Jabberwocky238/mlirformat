"builtin.module"() ({
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<void (f32, f32)>, linkage = #llvm.linkage<external>, sym_name = "convert_f32x2_to_f4x2_e2m1", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg0: f32 loc("<stdin>":3:8), %arg1: f32 loc("<stdin>":3:20)):
    %0 = "nvvm.convert.f32x2.to.f4x2"(%arg0, %arg1) <{dstTy = f4E2M1FN, relu = false}> : (f32, f32) -> i8 loc("<stdin>":4:10)
    %1 = "nvvm.convert.f32x2.to.f4x2"(%arg0, %arg1) <{dstTy = f4E2M1FN, relu = true}> : (f32, f32) -> i8 loc("<stdin>":5:10)
    "llvm.return"() : () -> () loc("<stdin>":6:5)
  }) : () -> () loc("<stdin>":2:3)
}) : () -> () loc("<stdin>":1:1)
