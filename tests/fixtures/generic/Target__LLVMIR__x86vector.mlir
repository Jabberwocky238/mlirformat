"builtin.module"() ({
  "func.func"() <{function_type = (vector<16xf32>, vector<16xf32>, vector<16xf32>, i16, i16) -> vector<16xf32>, sym_name = "LLVM_x86_avx512_mask_ps_512"}> ({
  ^bb0(%arg43: vector<16xf32>, %arg44: vector<16xf32>, %arg45: vector<16xf32>, %arg46: i16, %arg47: i16):
    %28 = "arith.constant"() <{value = 15 : i32}> : () -> i32
    %29 = "arith.constant"() <{value = 42 : i32}> : () -> i32
    %30 = "x86vector.avx512.mask.rndscale"(%arg43, %28, %arg44, %arg46, %29) : (vector<16xf32>, i32, vector<16xf32>, i16, i32) -> vector<16xf32>
    %31 = "x86vector.avx512.mask.scalef"(%30, %arg44, %arg45, %arg47, %29) : (vector<16xf32>, vector<16xf32>, vector<16xf32>, i16, i32) -> vector<16xf32>
    "func.return"(%31) : (vector<16xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<8xf64>, vector<8xf64>, vector<8xf64>, i8, i8) -> vector<8xf64>, sym_name = "LLVM_x86_avx512_mask_pd_512"}> ({
  ^bb0(%arg38: vector<8xf64>, %arg39: vector<8xf64>, %arg40: vector<8xf64>, %arg41: i8, %arg42: i8):
    %24 = "arith.constant"() <{value = 15 : i32}> : () -> i32
    %25 = "arith.constant"() <{value = 42 : i32}> : () -> i32
    %26 = "x86vector.avx512.mask.rndscale"(%arg38, %24, %arg39, %arg41, %25) : (vector<8xf64>, i32, vector<8xf64>, i8, i32) -> vector<8xf64>
    %27 = "x86vector.avx512.mask.scalef"(%26, %arg39, %arg40, %arg42, %25) : (vector<8xf64>, vector<8xf64>, vector<8xf64>, i8, i32) -> vector<8xf64>
    "func.return"(%27) : (vector<8xf64>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<16xi1>, vector<16xf32>) -> vector<16xf32>, sym_name = "LLVM_x86_mask_compress"}> ({
  ^bb0(%arg36: vector<16xi1>, %arg37: vector<16xf32>):
    %23 = "x86vector.avx512.mask.compress"(%arg36, %arg37, %arg37) : (vector<16xi1>, vector<16xf32>, vector<16xf32>) -> vector<16xf32>
    "func.return"(%23) : (vector<16xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<16xi32>, vector<16xi32>) -> (vector<16xi1>, vector<16xi1>), sym_name = "LLVM_x86_vp2intersect_d_512"}> ({
  ^bb0(%arg34: vector<16xi32>, %arg35: vector<16xi32>):
    %22:2 = "x86vector.avx512.vp2intersect"(%arg34, %arg35) : (vector<16xi32>, vector<16xi32>) -> (vector<16xi1>, vector<16xi1>)
    "func.return"(%22#0, %22#1) : (vector<16xi1>, vector<16xi1>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<8xi64>, vector<8xi64>) -> (vector<8xi1>, vector<8xi1>), sym_name = "LLVM_x86_vp2intersect_q_512"}> ({
  ^bb0(%arg32: vector<8xi64>, %arg33: vector<8xi64>):
    %21:2 = "x86vector.avx512.vp2intersect"(%arg32, %arg33) : (vector<8xi64>, vector<8xi64>) -> (vector<8xi1>, vector<8xi1>)
    "func.return"(%21#0, %21#1) : (vector<8xi1>, vector<8xi1>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<4xf32>, vector<8xbf16>, vector<8xbf16>) -> vector<4xf32>, sym_name = "LLVM_x86_avx512bf16_dpbf16ps_128"}> ({
  ^bb0(%arg29: vector<4xf32>, %arg30: vector<8xbf16>, %arg31: vector<8xbf16>):
    %20 = "x86vector.avx512.dot"(%arg29, %arg30, %arg31) : (vector<4xf32>, vector<8xbf16>, vector<8xbf16>) -> vector<4xf32>
    "func.return"(%20) : (vector<4xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<8xf32>, vector<16xbf16>, vector<16xbf16>) -> vector<8xf32>, sym_name = "LLVM_x86_avx512bf16_dpbf16ps_256"}> ({
  ^bb0(%arg26: vector<8xf32>, %arg27: vector<16xbf16>, %arg28: vector<16xbf16>):
    %19 = "x86vector.avx512.dot"(%arg26, %arg27, %arg28) : (vector<8xf32>, vector<16xbf16>, vector<16xbf16>) -> vector<8xf32>
    "func.return"(%19) : (vector<8xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<16xf32>, vector<32xbf16>, vector<32xbf16>) -> vector<16xf32>, sym_name = "LLVM_x86_avx512bf16_dpbf16ps_512"}> ({
  ^bb0(%arg23: vector<16xf32>, %arg24: vector<32xbf16>, %arg25: vector<32xbf16>):
    %18 = "x86vector.avx512.dot"(%arg23, %arg24, %arg25) : (vector<16xf32>, vector<32xbf16>, vector<32xbf16>) -> vector<16xf32>
    "func.return"(%18) : (vector<16xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<8xf32>) -> vector<8xbf16>, sym_name = "LLVM_x86_avx512bf16_cvtneps2bf16_256"}> ({
  ^bb0(%arg22: vector<8xf32>):
    %17 = "x86vector.avx512.cvt.packed.f32_to_bf16"(%arg22) : (vector<8xf32>) -> vector<8xbf16>
    "func.return"(%17) : (vector<8xbf16>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<16xf32>) -> vector<16xbf16>, sym_name = "LLVM_x86_avx512bf16_cvtneps2bf16_512"}> ({
  ^bb0(%arg21: vector<16xf32>):
    %16 = "x86vector.avx512.cvt.packed.f32_to_bf16"(%arg21) : (vector<16xf32>) -> vector<16xbf16>
    "func.return"(%16) : (vector<16xbf16>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (memref<8xbf16>) -> vector<4xf32>, sym_name = "LLVM_x86_avxbf16_vcvtneebf162ps128"}> ({
  ^bb0(%arg20: memref<8xbf16>):
    %15 = "x86vector.avx.cvt.packed.even.indexed_to_f32"(%arg20) : (memref<8xbf16>) -> vector<4xf32>
    "func.return"(%15) : (vector<4xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (memref<16xbf16>) -> vector<8xf32>, sym_name = "LLVM_x86_avxbf16_vcvtneebf162ps256"}> ({
  ^bb0(%arg19: memref<16xbf16>):
    %14 = "x86vector.avx.cvt.packed.even.indexed_to_f32"(%arg19) : (memref<16xbf16>) -> vector<8xf32>
    "func.return"(%14) : (vector<8xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (memref<8xbf16>) -> vector<4xf32>, sym_name = "LLVM_x86_avxbf16_vcvtneobf162ps128"}> ({
  ^bb0(%arg18: memref<8xbf16>):
    %13 = "x86vector.avx.cvt.packed.odd.indexed_to_f32"(%arg18) : (memref<8xbf16>) -> vector<4xf32>
    "func.return"(%13) : (vector<4xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (memref<16xbf16>) -> vector<8xf32>, sym_name = "LLVM_x86_avxbf16_vcvtneobf162ps256"}> ({
  ^bb0(%arg17: memref<16xbf16>):
    %12 = "x86vector.avx.cvt.packed.odd.indexed_to_f32"(%arg17) : (memref<16xbf16>) -> vector<8xf32>
    "func.return"(%12) : (vector<8xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (memref<1xbf16>) -> vector<4xf32>, sym_name = "LLVM_x86_avxbf16_vbcstnebf162ps128"}> ({
  ^bb0(%arg16: memref<1xbf16>):
    %11 = "x86vector.avx.bcst_to_f32.packed"(%arg16) : (memref<1xbf16>) -> vector<4xf32>
    "func.return"(%11) : (vector<4xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (memref<1xbf16>) -> vector<8xf32>, sym_name = "LLVM_x86_avxbf16_vbcstnebf162ps256"}> ({
  ^bb0(%arg15: memref<1xbf16>):
    %10 = "x86vector.avx.bcst_to_f32.packed"(%arg15) : (memref<1xbf16>) -> vector<8xf32>
    "func.return"(%10) : (vector<8xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (memref<8xf16>) -> vector<4xf32>, sym_name = "LLVM_x86_avxf16_vcvtneeph2ps128"}> ({
  ^bb0(%arg14: memref<8xf16>):
    %9 = "x86vector.avx.cvt.packed.even.indexed_to_f32"(%arg14) : (memref<8xf16>) -> vector<4xf32>
    "func.return"(%9) : (vector<4xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (memref<16xf16>) -> vector<8xf32>, sym_name = "LLVM_x86_avxf16_vcvtneeph2ps256"}> ({
  ^bb0(%arg13: memref<16xf16>):
    %8 = "x86vector.avx.cvt.packed.even.indexed_to_f32"(%arg13) : (memref<16xf16>) -> vector<8xf32>
    "func.return"(%8) : (vector<8xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (memref<8xf16>) -> vector<4xf32>, sym_name = "LLVM_x86_avxf16_vcvtneoph2ps128"}> ({
  ^bb0(%arg12: memref<8xf16>):
    %7 = "x86vector.avx.cvt.packed.odd.indexed_to_f32"(%arg12) : (memref<8xf16>) -> vector<4xf32>
    "func.return"(%7) : (vector<4xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (memref<16xf16>) -> vector<8xf32>, sym_name = "LLVM_x86_avxf16_vcvtneoph2ps256"}> ({
  ^bb0(%arg11: memref<16xf16>):
    %6 = "x86vector.avx.cvt.packed.odd.indexed_to_f32"(%arg11) : (memref<16xf16>) -> vector<8xf32>
    "func.return"(%6) : (vector<8xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (memref<1xf16>) -> vector<4xf32>, sym_name = "LLVM_x86_avxf16_vbcstnesh2ps128"}> ({
  ^bb0(%arg10: memref<1xf16>):
    %5 = "x86vector.avx.bcst_to_f32.packed"(%arg10) : (memref<1xf16>) -> vector<4xf32>
    "func.return"(%5) : (vector<4xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (memref<1xf16>) -> vector<8xf32>, sym_name = "LLVM_x86_avxf16_vbcstnesh2ps256"}> ({
  ^bb0(%arg9: memref<1xf16>):
    %4 = "x86vector.avx.bcst_to_f32.packed"(%arg9) : (memref<1xf16>) -> vector<8xf32>
    "func.return"(%4) : (vector<8xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<8xf32>) -> vector<8xf32>, sym_name = "LLVM_x86_avx_rsqrt_ps_256"}> ({
  ^bb0(%arg8: vector<8xf32>):
    %3 = "x86vector.avx.rsqrt"(%arg8) : (vector<8xf32>) -> vector<8xf32>
    "func.return"(%3) : (vector<8xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<8xf32>, vector<8xf32>) -> vector<8xf32>, sym_name = "LLVM_x86_avx_dp_ps_256"}> ({
  ^bb0(%arg6: vector<8xf32>, %arg7: vector<8xf32>):
    %2 = "x86vector.avx.intr.dot"(%arg6, %arg7) : (vector<8xf32>, vector<8xf32>) -> vector<8xf32>
    "func.return"(%2) : (vector<8xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<4xi32>, vector<16xi8>, vector<16xi8>) -> vector<4xi32>, sym_name = "LLVM_x86_avx2_vpdpbssd_128"}> ({
  ^bb0(%arg3: vector<4xi32>, %arg4: vector<16xi8>, %arg5: vector<16xi8>):
    %1 = "x86vector.avx.dot.i8"(%arg3, %arg4, %arg5) : (vector<4xi32>, vector<16xi8>, vector<16xi8>) -> vector<4xi32>
    "func.return"(%1) : (vector<4xi32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<8xi32>, vector<32xi8>, vector<32xi8>) -> vector<8xi32>, sym_name = "LLVM_x86_avx2_vpdpbssd_256"}> ({
  ^bb0(%arg0: vector<8xi32>, %arg1: vector<32xi8>, %arg2: vector<32xi8>):
    %0 = "x86vector.avx.dot.i8"(%arg0, %arg1, %arg2) : (vector<8xi32>, vector<32xi8>, vector<32xi8>) -> vector<8xi32>
    "func.return"(%0) : (vector<8xi32>) -> ()
  }) : () -> ()
}) : () -> ()

