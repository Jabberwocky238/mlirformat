"builtin.module"() ({
  "func.func"() <{function_type = (vector<16xf32>, vector<16xf32>, vector<16xf32>, i16, i16) -> vector<16xf32>, sym_name = "LLVM_x86_avx512_mask_ps_512"}> ({
  ^bb0(%arg46: vector<16xf32>, %arg47: vector<16xf32>, %arg48: vector<16xf32>, %arg49: i16, %arg50: i16):
    %29 = "arith.constant"() <{value = 15 : i32}> : () -> i32
    %30 = "arith.constant"() <{value = 42 : i32}> : () -> i32
    %31 = "x86.avx512.mask.rndscale"(%arg46, %29, %arg47, %arg49, %30) : (vector<16xf32>, i32, vector<16xf32>, i16, i32) -> vector<16xf32>
    %32 = "x86.avx512.mask.scalef"(%31, %arg47, %arg48, %arg50, %30) : (vector<16xf32>, vector<16xf32>, vector<16xf32>, i16, i32) -> vector<16xf32>
    "func.return"(%32) : (vector<16xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<8xf64>, vector<8xf64>, vector<8xf64>, i8, i8) -> vector<8xf64>, sym_name = "LLVM_x86_avx512_mask_pd_512"}> ({
  ^bb0(%arg41: vector<8xf64>, %arg42: vector<8xf64>, %arg43: vector<8xf64>, %arg44: i8, %arg45: i8):
    %25 = "arith.constant"() <{value = 15 : i32}> : () -> i32
    %26 = "arith.constant"() <{value = 42 : i32}> : () -> i32
    %27 = "x86.avx512.mask.rndscale"(%arg41, %25, %arg42, %arg44, %26) : (vector<8xf64>, i32, vector<8xf64>, i8, i32) -> vector<8xf64>
    %28 = "x86.avx512.mask.scalef"(%27, %arg42, %arg43, %arg45, %26) : (vector<8xf64>, vector<8xf64>, vector<8xf64>, i8, i32) -> vector<8xf64>
    "func.return"(%28) : (vector<8xf64>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<16xi1>, vector<16xf32>) -> vector<16xf32>, sym_name = "LLVM_x86_mask_compress"}> ({
  ^bb0(%arg39: vector<16xi1>, %arg40: vector<16xf32>):
    %24 = "x86.avx512.mask.compress"(%arg39, %arg40, %arg40) : (vector<16xi1>, vector<16xf32>, vector<16xf32>) -> vector<16xf32>
    "func.return"(%24) : (vector<16xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<16xi32>, vector<16xi32>) -> (vector<16xi1>, vector<16xi1>), sym_name = "LLVM_x86_vp2intersect_d_512"}> ({
  ^bb0(%arg37: vector<16xi32>, %arg38: vector<16xi32>):
    %23:2 = "x86.avx512.vp2intersect"(%arg37, %arg38) : (vector<16xi32>, vector<16xi32>) -> (vector<16xi1>, vector<16xi1>)
    "func.return"(%23#0, %23#1) : (vector<16xi1>, vector<16xi1>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<8xi64>, vector<8xi64>) -> (vector<8xi1>, vector<8xi1>), sym_name = "LLVM_x86_vp2intersect_q_512"}> ({
  ^bb0(%arg35: vector<8xi64>, %arg36: vector<8xi64>):
    %22:2 = "x86.avx512.vp2intersect"(%arg35, %arg36) : (vector<8xi64>, vector<8xi64>) -> (vector<8xi1>, vector<8xi1>)
    "func.return"(%22#0, %22#1) : (vector<8xi1>, vector<8xi1>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<4xf32>, vector<8xbf16>, vector<8xbf16>) -> vector<4xf32>, sym_name = "LLVM_x86_avx512bf16_dpbf16ps_128"}> ({
  ^bb0(%arg32: vector<4xf32>, %arg33: vector<8xbf16>, %arg34: vector<8xbf16>):
    %21 = "x86.avx512.dot"(%arg32, %arg33, %arg34) : (vector<4xf32>, vector<8xbf16>, vector<8xbf16>) -> vector<4xf32>
    "func.return"(%21) : (vector<4xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<8xf32>, vector<16xbf16>, vector<16xbf16>) -> vector<8xf32>, sym_name = "LLVM_x86_avx512bf16_dpbf16ps_256"}> ({
  ^bb0(%arg29: vector<8xf32>, %arg30: vector<16xbf16>, %arg31: vector<16xbf16>):
    %20 = "x86.avx512.dot"(%arg29, %arg30, %arg31) : (vector<8xf32>, vector<16xbf16>, vector<16xbf16>) -> vector<8xf32>
    "func.return"(%20) : (vector<8xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<16xf32>, vector<32xbf16>, vector<32xbf16>) -> vector<16xf32>, sym_name = "LLVM_x86_avx512bf16_dpbf16ps_512"}> ({
  ^bb0(%arg26: vector<16xf32>, %arg27: vector<32xbf16>, %arg28: vector<32xbf16>):
    %19 = "x86.avx512.dot"(%arg26, %arg27, %arg28) : (vector<16xf32>, vector<32xbf16>, vector<32xbf16>) -> vector<16xf32>
    "func.return"(%19) : (vector<16xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<8xf32>) -> vector<8xbf16>, sym_name = "LLVM_x86_avx512bf16_cvtneps2bf16_256"}> ({
  ^bb0(%arg25: vector<8xf32>):
    %18 = "x86.avx512.cvt.packed.f32_to_bf16"(%arg25) : (vector<8xf32>) -> vector<8xbf16>
    "func.return"(%18) : (vector<8xbf16>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<16xf32>) -> vector<16xbf16>, sym_name = "LLVM_x86_avx512bf16_cvtneps2bf16_512"}> ({
  ^bb0(%arg24: vector<16xf32>):
    %17 = "x86.avx512.cvt.packed.f32_to_bf16"(%arg24) : (vector<16xf32>) -> vector<16xbf16>
    "func.return"(%17) : (vector<16xbf16>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<16xi32>, vector<64xi8>, vector<64xi8>) -> vector<16xi32>, sym_name = "LLVM_x86_avx10_vpdpbssd_512"}> ({
  ^bb0(%arg21: vector<16xi32>, %arg22: vector<64xi8>, %arg23: vector<64xi8>):
    %16 = "x86.avx10.dot.i8"(%arg21, %arg22, %arg23) : (vector<16xi32>, vector<64xi8>, vector<64xi8>) -> vector<16xi32>
    "func.return"(%16) : (vector<16xi32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (memref<8xbf16>) -> vector<4xf32>, sym_name = "LLVM_x86_avxbf16_vcvtneebf162ps128"}> ({
  ^bb0(%arg20: memref<8xbf16>):
    %15 = "x86.avx.cvt.packed.even.indexed_to_f32"(%arg20) : (memref<8xbf16>) -> vector<4xf32>
    "func.return"(%15) : (vector<4xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (memref<16xbf16>) -> vector<8xf32>, sym_name = "LLVM_x86_avxbf16_vcvtneebf162ps256"}> ({
  ^bb0(%arg19: memref<16xbf16>):
    %14 = "x86.avx.cvt.packed.even.indexed_to_f32"(%arg19) : (memref<16xbf16>) -> vector<8xf32>
    "func.return"(%14) : (vector<8xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (memref<8xbf16>) -> vector<4xf32>, sym_name = "LLVM_x86_avxbf16_vcvtneobf162ps128"}> ({
  ^bb0(%arg18: memref<8xbf16>):
    %13 = "x86.avx.cvt.packed.odd.indexed_to_f32"(%arg18) : (memref<8xbf16>) -> vector<4xf32>
    "func.return"(%13) : (vector<4xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (memref<16xbf16>) -> vector<8xf32>, sym_name = "LLVM_x86_avxbf16_vcvtneobf162ps256"}> ({
  ^bb0(%arg17: memref<16xbf16>):
    %12 = "x86.avx.cvt.packed.odd.indexed_to_f32"(%arg17) : (memref<16xbf16>) -> vector<8xf32>
    "func.return"(%12) : (vector<8xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (memref<1xbf16>) -> vector<4xf32>, sym_name = "LLVM_x86_avxbf16_vbcstnebf162ps128"}> ({
  ^bb0(%arg16: memref<1xbf16>):
    %11 = "x86.avx.bcst_to_f32.packed"(%arg16) : (memref<1xbf16>) -> vector<4xf32>
    "func.return"(%11) : (vector<4xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (memref<1xbf16>) -> vector<8xf32>, sym_name = "LLVM_x86_avxbf16_vbcstnebf162ps256"}> ({
  ^bb0(%arg15: memref<1xbf16>):
    %10 = "x86.avx.bcst_to_f32.packed"(%arg15) : (memref<1xbf16>) -> vector<8xf32>
    "func.return"(%10) : (vector<8xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (memref<8xf16>) -> vector<4xf32>, sym_name = "LLVM_x86_avxf16_vcvtneeph2ps128"}> ({
  ^bb0(%arg14: memref<8xf16>):
    %9 = "x86.avx.cvt.packed.even.indexed_to_f32"(%arg14) : (memref<8xf16>) -> vector<4xf32>
    "func.return"(%9) : (vector<4xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (memref<16xf16>) -> vector<8xf32>, sym_name = "LLVM_x86_avxf16_vcvtneeph2ps256"}> ({
  ^bb0(%arg13: memref<16xf16>):
    %8 = "x86.avx.cvt.packed.even.indexed_to_f32"(%arg13) : (memref<16xf16>) -> vector<8xf32>
    "func.return"(%8) : (vector<8xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (memref<8xf16>) -> vector<4xf32>, sym_name = "LLVM_x86_avxf16_vcvtneoph2ps128"}> ({
  ^bb0(%arg12: memref<8xf16>):
    %7 = "x86.avx.cvt.packed.odd.indexed_to_f32"(%arg12) : (memref<8xf16>) -> vector<4xf32>
    "func.return"(%7) : (vector<4xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (memref<16xf16>) -> vector<8xf32>, sym_name = "LLVM_x86_avxf16_vcvtneoph2ps256"}> ({
  ^bb0(%arg11: memref<16xf16>):
    %6 = "x86.avx.cvt.packed.odd.indexed_to_f32"(%arg11) : (memref<16xf16>) -> vector<8xf32>
    "func.return"(%6) : (vector<8xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (memref<1xf16>) -> vector<4xf32>, sym_name = "LLVM_x86_avxf16_vbcstnesh2ps128"}> ({
  ^bb0(%arg10: memref<1xf16>):
    %5 = "x86.avx.bcst_to_f32.packed"(%arg10) : (memref<1xf16>) -> vector<4xf32>
    "func.return"(%5) : (vector<4xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (memref<1xf16>) -> vector<8xf32>, sym_name = "LLVM_x86_avxf16_vbcstnesh2ps256"}> ({
  ^bb0(%arg9: memref<1xf16>):
    %4 = "x86.avx.bcst_to_f32.packed"(%arg9) : (memref<1xf16>) -> vector<8xf32>
    "func.return"(%4) : (vector<8xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<8xf32>) -> vector<8xf32>, sym_name = "LLVM_x86_avx_rsqrt_ps_256"}> ({
  ^bb0(%arg8: vector<8xf32>):
    %3 = "x86.avx.rsqrt"(%arg8) : (vector<8xf32>) -> vector<8xf32>
    "func.return"(%3) : (vector<8xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<8xf32>, vector<8xf32>) -> vector<8xf32>, sym_name = "LLVM_x86_avx_dp_ps_256"}> ({
  ^bb0(%arg6: vector<8xf32>, %arg7: vector<8xf32>):
    %2 = "x86.avx.intr.dot"(%arg6, %arg7) : (vector<8xf32>, vector<8xf32>) -> vector<8xf32>
    "func.return"(%2) : (vector<8xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<4xi32>, vector<16xi8>, vector<16xi8>) -> vector<4xi32>, sym_name = "LLVM_x86_avx2_vpdpbssd_128"}> ({
  ^bb0(%arg3: vector<4xi32>, %arg4: vector<16xi8>, %arg5: vector<16xi8>):
    %1 = "x86.avx.dot.i8"(%arg3, %arg4, %arg5) : (vector<4xi32>, vector<16xi8>, vector<16xi8>) -> vector<4xi32>
    "func.return"(%1) : (vector<4xi32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<8xi32>, vector<32xi8>, vector<32xi8>) -> vector<8xi32>, sym_name = "LLVM_x86_avx2_vpdpbssd_256"}> ({
  ^bb0(%arg0: vector<8xi32>, %arg1: vector<32xi8>, %arg2: vector<32xi8>):
    %0 = "x86.avx.dot.i8"(%arg0, %arg1, %arg2) : (vector<8xi32>, vector<32xi8>, vector<32xi8>) -> vector<8xi32>
    "func.return"(%0) : (vector<8xi32>) -> ()
  }) : () -> ()
}) : () -> ()

