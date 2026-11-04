"builtin.module"() ({
^bb0:
}) : () -> ()

// -----
"builtin.module"() ({
  "gpu.module"() <{sym_name = "valid_f16x2_rs_sm_100a", targets = [#nvvm.target<chip = "sm_100a">]}> ({
    "func.func"() <{function_type = () -> (), sym_name = "convert_rs"}> ({
      %4 = "llvm.mlir.constant"() <{value = 1.000000e+00 : f32}> : () -> f32
      %5 = "llvm.mlir.constant"() <{value = 2.000000e+00 : f32}> : () -> f32
      %6 = "llvm.mlir.constant"() <{value = 305419896 : i32}> : () -> i32
      %7 = "nvvm.convert.f32x2.to.f16x2"(%4, %5, %6) <{relu = false, rnd = #nvvm.fp_rnd_mode<rs>, sat = #nvvm.sat_mode<none>}> : (f32, f32, i32) -> vector<2xf16>
      "func.return"() : () -> ()
    }) : () -> ()
  }) : () -> ()
  "gpu.module"() <{sym_name = "valid_bf16x2_rs_sm_103a", targets = [#nvvm.target<chip = "sm_103a">]}> ({
    "func.func"() <{function_type = () -> (), sym_name = "convert_rs"}> ({
      %0 = "llvm.mlir.constant"() <{value = 1.000000e+00 : f32}> : () -> f32
      %1 = "llvm.mlir.constant"() <{value = 2.000000e+00 : f32}> : () -> f32
      %2 = "llvm.mlir.constant"() <{value = 0 : i32}> : () -> i32
      %3 = "nvvm.convert.f32x2.to.bf16x2"(%0, %1, %2) <{relu = false, rnd = #nvvm.fp_rnd_mode<rs>, sat = #nvvm.sat_mode<none>}> : (f32, f32, i32) -> vector<2xbf16>
      "func.return"() : () -> ()
    }) : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<vector<4xi8> (vector<4xf32>, i32)>, linkage = #llvm.linkage<external>, sym_name = "convert_f32x4_to_f8x4_e4m3_rs", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg2: vector<4xf32>, %arg3: i32):
    %1 = "nvvm.convert.f32x4.to.f8x4"(%arg2, %arg3) <{dstTy = f8E4M3FN, relu = false}> : (vector<4xf32>, i32) -> vector<4xi8>
    "llvm.return"(%1) : (vector<4xi8>) -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<vector<4xi8> (vector<4xf32>, i32)>, linkage = #llvm.linkage<external>, sym_name = "convert_f32x4_to_f8x4_e4m3_rs_relu", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg0: vector<4xf32>, %arg1: i32):
    %0 = "nvvm.convert.f32x4.to.f8x4"(%arg0, %arg1) <{dstTy = f8E4M3FN, relu = true}> : (vector<4xf32>, i32) -> vector<4xi8>
    "llvm.return"(%0) : (vector<4xi8>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<vector<4xi8> (vector<4xf32>, i32)>, linkage = #llvm.linkage<external>, sym_name = "convert_f32x4_to_f8x4_e5m2_rs", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg2: vector<4xf32>, %arg3: i32):
    %1 = "nvvm.convert.f32x4.to.f8x4"(%arg2, %arg3) <{dstTy = f8E5M2, relu = false}> : (vector<4xf32>, i32) -> vector<4xi8>
    "llvm.return"(%1) : (vector<4xi8>) -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<vector<4xi8> (vector<4xf32>, i32)>, linkage = #llvm.linkage<external>, sym_name = "convert_f32x4_to_f8x4_e5m2_rs_relu", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg0: vector<4xf32>, %arg1: i32):
    %0 = "nvvm.convert.f32x4.to.f8x4"(%arg0, %arg1) <{dstTy = f8E5M2, relu = true}> : (vector<4xf32>, i32) -> vector<4xi8>
    "llvm.return"(%0) : (vector<4xi8>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<vector<4xi8> (vector<4xf32>, i32)>, linkage = #llvm.linkage<external>, sym_name = "convert_f32x4_to_f6x4_e2m3_rs", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg2: vector<4xf32>, %arg3: i32):
    %1 = "nvvm.convert.f32x4.to.f6x4"(%arg2, %arg3) <{dstTy = f6E2M3FN, relu = false}> : (vector<4xf32>, i32) -> vector<4xi8>
    "llvm.return"(%1) : (vector<4xi8>) -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<vector<4xi8> (vector<4xf32>, i32)>, linkage = #llvm.linkage<external>, sym_name = "convert_f32x4_to_f6x4_e2m3_rs_relu", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg0: vector<4xf32>, %arg1: i32):
    %0 = "nvvm.convert.f32x4.to.f6x4"(%arg0, %arg1) <{dstTy = f6E2M3FN, relu = true}> : (vector<4xf32>, i32) -> vector<4xi8>
    "llvm.return"(%0) : (vector<4xi8>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<vector<4xi8> (vector<4xf32>, i32)>, linkage = #llvm.linkage<external>, sym_name = "convert_f32x4_to_f6x4_e3m2_rs", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg2: vector<4xf32>, %arg3: i32):
    %1 = "nvvm.convert.f32x4.to.f6x4"(%arg2, %arg3) <{dstTy = f6E3M2FN, relu = false}> : (vector<4xf32>, i32) -> vector<4xi8>
    "llvm.return"(%1) : (vector<4xi8>) -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<vector<4xi8> (vector<4xf32>, i32)>, linkage = #llvm.linkage<external>, sym_name = "convert_f32x4_to_f6x4_e3m2_rs_relu", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg0: vector<4xf32>, %arg1: i32):
    %0 = "nvvm.convert.f32x4.to.f6x4"(%arg0, %arg1) <{dstTy = f6E3M2FN, relu = true}> : (vector<4xf32>, i32) -> vector<4xi8>
    "llvm.return"(%0) : (vector<4xi8>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<i16 (vector<4xf32>, i32)>, linkage = #llvm.linkage<external>, sym_name = "convert_f32x4_to_f4x4_e2m1_rs", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg2: vector<4xf32>, %arg3: i32):
    %1 = "nvvm.convert.f32x4.to.f4x4"(%arg2, %arg3) <{dstTy = f4E2M1FN, relu = false}> : (vector<4xf32>, i32) -> i16
    "llvm.return"(%1) : (i16) -> ()
  }) : () -> ()
  "llvm.func"() <{CConv = #llvm.cconv<ccc>, function_type = !llvm.func<i16 (vector<4xf32>, i32)>, linkage = #llvm.linkage<external>, sym_name = "convert_f32x4_to_f4x4_e2m1_rs_relu", unnamed_addr = 0 : i64, visibility_ = 0 : i64}> ({
  ^bb0(%arg0: vector<4xf32>, %arg1: i32):
    %0 = "nvvm.convert.f32x4.to.f4x4"(%arg0, %arg1) <{dstTy = f4E2M1FN, relu = true}> : (vector<4xf32>, i32) -> i16
    "llvm.return"(%0) : (i16) -> ()
  }) : () -> ()
}) : () -> ()

