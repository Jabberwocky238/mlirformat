"builtin.module"() ({
  "func.func"() <{function_type = (vector<16xf32>, vector<8xf64>, i32, i16, i8) -> (vector<16xf32>, vector<8xf64>), sym_name = "avx512_mask_rndscale"}> ({
  ^bb0(%arg46: vector<16xf32> loc("<stdin>":3:8), %arg47: vector<8xf64> loc("<stdin>":3:32), %arg48: i32 loc("<stdin>":3:55), %arg49: i16 loc("<stdin>":3:68), %arg50: i8 loc("<stdin>":3:81)):
    %29 = "x86.avx512.mask.rndscale"(%arg46, %arg48, %arg46, %arg49, %arg48) : (vector<16xf32>, i32, vector<16xf32>, i16, i32) -> vector<16xf32> loc("<stdin>":4:11)
    %30 = "x86.avx512.mask.rndscale"(%arg47, %arg48, %arg47, %arg50, %arg48) : (vector<8xf64>, i32, vector<8xf64>, i8, i32) -> vector<8xf64> loc("<stdin>":5:11)
    "func.return"(%29, %30) : (vector<16xf32>, vector<8xf64>) -> () loc("<stdin>":6:5)
  }) : () -> () loc("<stdin>":2:3)
  "func.func"() <{function_type = (vector<16xf32>, vector<8xf64>, i32, i16, i8) -> (vector<16xf32>, vector<8xf64>), sym_name = "avx512_scalef"}> ({
  ^bb0(%arg41: vector<16xf32> loc("<stdin>":9:8), %arg42: vector<8xf64> loc("<stdin>":9:32), %arg43: i32 loc("<stdin>":9:55), %arg44: i16 loc("<stdin>":9:68), %arg45: i8 loc("<stdin>":9:81)):
    %27 = "x86.avx512.mask.scalef"(%arg41, %arg41, %arg41, %arg44, %arg43) : (vector<16xf32>, vector<16xf32>, vector<16xf32>, i16, i32) -> vector<16xf32> loc("<stdin>":10:11)
    %28 = "x86.avx512.mask.scalef"(%arg42, %arg42, %arg42, %arg45, %arg43) : (vector<8xf64>, vector<8xf64>, vector<8xf64>, i8, i32) -> vector<8xf64> loc("<stdin>":11:11)
    "func.return"(%27, %28) : (vector<16xf32>, vector<8xf64>) -> () loc("<stdin>":12:5)
  }) : () -> () loc("<stdin>":8:3)
  "func.func"() <{function_type = (vector<16xi32>, vector<8xi64>) -> (vector<16xi1>, vector<16xi1>, vector<8xi1>, vector<8xi1>), sym_name = "avx512_vp2intersect"}> ({
  ^bb0(%arg39: vector<16xi32> loc("<stdin>":15:8), %arg40: vector<8xi64> loc("<stdin>":15:32)):
    %25:2 = "x86.avx512.vp2intersect"(%arg39, %arg39) : (vector<16xi32>, vector<16xi32>) -> (vector<16xi1>, vector<16xi1>) loc("<stdin>":16:13)
    %26:2 = "x86.avx512.vp2intersect"(%arg40, %arg40) : (vector<8xi64>, vector<8xi64>) -> (vector<8xi1>, vector<8xi1>) loc("<stdin>":17:13)
    "func.return"(%25#0, %25#1, %26#0, %26#1) : (vector<16xi1>, vector<16xi1>, vector<8xi1>, vector<8xi1>) -> () loc("<stdin>":18:5)
  }) : () -> () loc("<stdin>":14:3)
  "func.func"() <{function_type = (vector<16xi1>, vector<16xf32>, vector<8xi1>, vector<8xi64>) -> (vector<16xf32>, vector<16xf32>, vector<8xi64>), sym_name = "avx512_mask_compress"}> ({
  ^bb0(%arg35: vector<16xi1> loc("<stdin>":21:8), %arg36: vector<16xf32> loc("<stdin>":21:31), %arg37: vector<8xi1> loc("<stdin>":21:55), %arg38: vector<8xi64> loc("<stdin>":21:77)):
    %22 = "x86.avx512.mask.compress"(%arg35, %arg36) : (vector<16xi1>, vector<16xf32>) -> vector<16xf32> loc("<stdin>":22:11)
    %23 = "x86.avx512.mask.compress"(%arg35, %arg36) <{constant_src = dense<5.000000e+00> : vector<16xf32>}> : (vector<16xi1>, vector<16xf32>) -> vector<16xf32> loc("<stdin>":23:11)
    %24 = "x86.avx512.mask.compress"(%arg37, %arg38, %arg38) : (vector<8xi1>, vector<8xi64>, vector<8xi64>) -> vector<8xi64> loc("<stdin>":24:11)
    "func.return"(%22, %23, %24) : (vector<16xf32>, vector<16xf32>, vector<8xi64>) -> () loc("<stdin>":25:5)
  }) : () -> () loc("<stdin>":20:3)
  "func.func"() <{function_type = (vector<4xf32>, vector<8xbf16>, vector<8xbf16>) -> vector<4xf32>, sym_name = "avx512bf16_dot_128"}> ({
  ^bb0(%arg32: vector<4xf32> loc("<stdin>":28:8), %arg33: vector<8xbf16> loc("<stdin>":28:31), %arg34: vector<8xbf16> loc("<stdin>":28:55)):
    %21 = "x86.avx512.dot"(%arg32, %arg33, %arg34) : (vector<4xf32>, vector<8xbf16>, vector<8xbf16>) -> vector<4xf32> loc("<stdin>":29:11)
    "func.return"(%21) : (vector<4xf32>) -> () loc("<stdin>":30:5)
  }) : () -> () loc("<stdin>":27:3)
  "func.func"() <{function_type = (vector<8xf32>, vector<16xbf16>, vector<16xbf16>) -> vector<8xf32>, sym_name = "avx512bf16_dot_256"}> ({
  ^bb0(%arg29: vector<8xf32> loc("<stdin>":33:8), %arg30: vector<16xbf16> loc("<stdin>":33:31), %arg31: vector<16xbf16> loc("<stdin>":33:56)):
    %20 = "x86.avx512.dot"(%arg29, %arg30, %arg31) : (vector<8xf32>, vector<16xbf16>, vector<16xbf16>) -> vector<8xf32> loc("<stdin>":34:11)
    "func.return"(%20) : (vector<8xf32>) -> () loc("<stdin>":35:5)
  }) : () -> () loc("<stdin>":32:3)
  "func.func"() <{function_type = (vector<16xf32>, vector<32xbf16>, vector<32xbf16>) -> vector<16xf32>, sym_name = "avx512bf16_dot_512"}> ({
  ^bb0(%arg26: vector<16xf32> loc("<stdin>":38:8), %arg27: vector<32xbf16> loc("<stdin>":38:32), %arg28: vector<32xbf16> loc("<stdin>":38:57)):
    %19 = "x86.avx512.dot"(%arg26, %arg27, %arg28) : (vector<16xf32>, vector<32xbf16>, vector<32xbf16>) -> vector<16xf32> loc("<stdin>":39:11)
    "func.return"(%19) : (vector<16xf32>) -> () loc("<stdin>":40:5)
  }) : () -> () loc("<stdin>":37:3)
  "func.func"() <{function_type = (vector<8xf32>) -> vector<8xbf16>, sym_name = "avx512bf16_cvt_packed_f32_to_bf16_256"}> ({
  ^bb0(%arg25: vector<8xf32> loc("<stdin>":43:8)):
    %18 = "x86.avx512.cvt.packed.f32_to_bf16"(%arg25) : (vector<8xf32>) -> vector<8xbf16> loc("<stdin>":44:11)
    "func.return"(%18) : (vector<8xbf16>) -> () loc("<stdin>":45:5)
  }) : () -> () loc("<stdin>":42:3)
  "func.func"() <{function_type = (vector<16xf32>) -> vector<16xbf16>, sym_name = "avx512bf16_cvt_packed_f32_to_bf16_512"}> ({
  ^bb0(%arg24: vector<16xf32> loc("<stdin>":48:8)):
    %17 = "x86.avx512.cvt.packed.f32_to_bf16"(%arg24) : (vector<16xf32>) -> vector<16xbf16> loc("<stdin>":49:11)
    "func.return"(%17) : (vector<16xbf16>) -> () loc("<stdin>":50:5)
  }) : () -> () loc("<stdin>":47:3)
  "func.func"() <{function_type = (vector<16xi32>, vector<64xi8>, vector<64xi8>) -> vector<16xi32>, sym_name = "avx10_dot_i8_512"}> ({
  ^bb0(%arg21: vector<16xi32> loc("<stdin>":53:8), %arg22: vector<64xi8> loc("<stdin>":53:32), %arg23: vector<64xi8> loc("<stdin>":53:55)):
    %16 = "x86.avx10.dot.i8"(%arg21, %arg22, %arg23) : (vector<16xi32>, vector<64xi8>, vector<64xi8>) -> vector<16xi32> loc("<stdin>":54:11)
    "func.return"(%16) : (vector<16xi32>) -> () loc("<stdin>":55:5)
  }) : () -> () loc("<stdin>":52:3)
  "func.func"() <{function_type = (memref<8xbf16>) -> vector<4xf32>, sym_name = "avxbf16_cvt_packed_even_indexed_bf16_to_f32_128"}> ({
  ^bb0(%arg20: memref<8xbf16> loc("<stdin>":58:8)):
    %15 = "x86.avx.cvt.packed.even.indexed_to_f32"(%arg20) : (memref<8xbf16>) -> vector<4xf32> loc("<stdin>":59:11)
    "func.return"(%15) : (vector<4xf32>) -> () loc("<stdin>":60:5)
  }) : () -> () loc("<stdin>":57:3)
  "func.func"() <{function_type = (memref<16xbf16>) -> vector<8xf32>, sym_name = "avxbf16_cvt_packed_even_indexed_bf16_to_f32_256"}> ({
  ^bb0(%arg19: memref<16xbf16> loc("<stdin>":63:8)):
    %14 = "x86.avx.cvt.packed.even.indexed_to_f32"(%arg19) : (memref<16xbf16>) -> vector<8xf32> loc("<stdin>":64:11)
    "func.return"(%14) : (vector<8xf32>) -> () loc("<stdin>":65:5)
  }) : () -> () loc("<stdin>":62:3)
  "func.func"() <{function_type = (memref<8xbf16>) -> vector<4xf32>, sym_name = "avxbf16_cvt_packed_odd_indexed_bf16_to_f32_128"}> ({
  ^bb0(%arg18: memref<8xbf16> loc("<stdin>":68:8)):
    %13 = "x86.avx.cvt.packed.odd.indexed_to_f32"(%arg18) : (memref<8xbf16>) -> vector<4xf32> loc("<stdin>":69:11)
    "func.return"(%13) : (vector<4xf32>) -> () loc("<stdin>":70:5)
  }) : () -> () loc("<stdin>":67:3)
  "func.func"() <{function_type = (memref<16xbf16>) -> vector<8xf32>, sym_name = "avxbf16_cvt_packed_odd_indexed_bf16_to_f32_256"}> ({
  ^bb0(%arg17: memref<16xbf16> loc("<stdin>":73:8)):
    %12 = "x86.avx.cvt.packed.odd.indexed_to_f32"(%arg17) : (memref<16xbf16>) -> vector<8xf32> loc("<stdin>":74:11)
    "func.return"(%12) : (vector<8xf32>) -> () loc("<stdin>":75:5)
  }) : () -> () loc("<stdin>":72:3)
  "func.func"() <{function_type = (memref<1xbf16>) -> vector<4xf32>, sym_name = "avxbf16_bcst_bf16_to_f32_128"}> ({
  ^bb0(%arg16: memref<1xbf16> loc("<stdin>":78:8)):
    %11 = "x86.avx.bcst_to_f32.packed"(%arg16) : (memref<1xbf16>) -> vector<4xf32> loc("<stdin>":79:11)
    "func.return"(%11) : (vector<4xf32>) -> () loc("<stdin>":80:5)
  }) : () -> () loc("<stdin>":77:3)
  "func.func"() <{function_type = (memref<1xbf16>) -> vector<8xf32>, sym_name = "avxbf16_bcst_bf16_to_f32_256"}> ({
  ^bb0(%arg15: memref<1xbf16> loc("<stdin>":83:8)):
    %10 = "x86.avx.bcst_to_f32.packed"(%arg15) : (memref<1xbf16>) -> vector<8xf32> loc("<stdin>":84:11)
    "func.return"(%10) : (vector<8xf32>) -> () loc("<stdin>":85:5)
  }) : () -> () loc("<stdin>":82:3)
  "func.func"() <{function_type = (memref<8xf16>) -> vector<4xf32>, sym_name = "avxf16_cvt_packed_even_indexed_f16_to_f32_128"}> ({
  ^bb0(%arg14: memref<8xf16> loc("<stdin>":88:8)):
    %9 = "x86.avx.cvt.packed.even.indexed_to_f32"(%arg14) : (memref<8xf16>) -> vector<4xf32> loc("<stdin>":89:10)
    "func.return"(%9) : (vector<4xf32>) -> () loc("<stdin>":90:5)
  }) : () -> () loc("<stdin>":87:3)
  "func.func"() <{function_type = (memref<16xf16>) -> vector<8xf32>, sym_name = "avxf16_cvt_packed_even_indexed_f16_to_f32_256"}> ({
  ^bb0(%arg13: memref<16xf16> loc("<stdin>":93:8)):
    %8 = "x86.avx.cvt.packed.even.indexed_to_f32"(%arg13) : (memref<16xf16>) -> vector<8xf32> loc("<stdin>":94:10)
    "func.return"(%8) : (vector<8xf32>) -> () loc("<stdin>":95:5)
  }) : () -> () loc("<stdin>":92:3)
  "func.func"() <{function_type = (memref<8xf16>) -> vector<4xf32>, sym_name = "avxf16_cvt_packed_odd_indexed_f16_to_f32_128"}> ({
  ^bb0(%arg12: memref<8xf16> loc("<stdin>":98:8)):
    %7 = "x86.avx.cvt.packed.odd.indexed_to_f32"(%arg12) : (memref<8xf16>) -> vector<4xf32> loc("<stdin>":99:10)
    "func.return"(%7) : (vector<4xf32>) -> () loc("<stdin>":100:5)
  }) : () -> () loc("<stdin>":97:3)
  "func.func"() <{function_type = (memref<16xf16>) -> vector<8xf32>, sym_name = "avxf16_cvt_packed_odd_indexed_f16_to_f32_256"}> ({
  ^bb0(%arg11: memref<16xf16> loc("<stdin>":103:8)):
    %6 = "x86.avx.cvt.packed.odd.indexed_to_f32"(%arg11) : (memref<16xf16>) -> vector<8xf32> loc("<stdin>":104:10)
    "func.return"(%6) : (vector<8xf32>) -> () loc("<stdin>":105:5)
  }) : () -> () loc("<stdin>":102:3)
  "func.func"() <{function_type = (memref<1xf16>) -> vector<4xf32>, sym_name = "avxf16_bcst_f16_to_f32_128"}> ({
  ^bb0(%arg10: memref<1xf16> loc("<stdin>":108:8)):
    %5 = "x86.avx.bcst_to_f32.packed"(%arg10) : (memref<1xf16>) -> vector<4xf32> loc("<stdin>":109:10)
    "func.return"(%5) : (vector<4xf32>) -> () loc("<stdin>":110:5)
  }) : () -> () loc("<stdin>":107:3)
  "func.func"() <{function_type = (memref<1xf16>) -> vector<8xf32>, sym_name = "avxf16_bcst_f16_to_f32_256"}> ({
  ^bb0(%arg9: memref<1xf16> loc("<stdin>":113:8)):
    %4 = "x86.avx.bcst_to_f32.packed"(%arg9) : (memref<1xf16>) -> vector<8xf32> loc("<stdin>":114:10)
    "func.return"(%4) : (vector<8xf32>) -> () loc("<stdin>":115:5)
  }) : () -> () loc("<stdin>":112:3)
  "func.func"() <{function_type = (vector<8xf32>) -> vector<8xf32>, sym_name = "avx_rsqrt"}> ({
  ^bb0(%arg8: vector<8xf32> loc("<stdin>":118:8)):
    %3 = "x86.avx.rsqrt"(%arg8) : (vector<8xf32>) -> vector<8xf32> loc("<stdin>":119:10)
    "func.return"(%3) : (vector<8xf32>) -> () loc("<stdin>":120:5)
  }) : () -> () loc("<stdin>":117:3)
  "func.func"() <{function_type = (vector<8xf32>, vector<8xf32>) -> vector<8xf32>, sym_name = "avx_dot"}> ({
  ^bb0(%arg6: vector<8xf32> loc("<stdin>":123:8), %arg7: vector<8xf32> loc("<stdin>":123:30)):
    %2 = "x86.avx.intr.dot"(%arg6, %arg7) : (vector<8xf32>, vector<8xf32>) -> vector<8xf32> loc("<stdin>":124:10)
    "func.return"(%2) : (vector<8xf32>) -> () loc("<stdin>":125:5)
  }) : () -> () loc("<stdin>":122:3)
  "func.func"() <{function_type = (vector<4xi32>, vector<16xi8>, vector<16xi8>) -> vector<4xi32>, sym_name = "avx_dot_i8_128"}> ({
  ^bb0(%arg3: vector<4xi32> loc("<stdin>":128:8), %arg4: vector<16xi8> loc("<stdin>":128:30), %arg5: vector<16xi8> loc("<stdin>":128:52)):
    %1 = "x86.avx.dot.i8"(%arg3, %arg4, %arg5) : (vector<4xi32>, vector<16xi8>, vector<16xi8>) -> vector<4xi32> loc("<stdin>":129:10)
    "func.return"(%1) : (vector<4xi32>) -> () loc("<stdin>":130:5)
  }) : () -> () loc("<stdin>":127:3)
  "func.func"() <{function_type = (vector<8xi32>, vector<32xi8>, vector<32xi8>) -> vector<8xi32>, sym_name = "avx_dot_i8_256"}> ({
  ^bb0(%arg0: vector<8xi32> loc("<stdin>":133:8), %arg1: vector<32xi8> loc("<stdin>":133:30), %arg2: vector<32xi8> loc("<stdin>":133:52)):
    %0 = "x86.avx.dot.i8"(%arg0, %arg1, %arg2) : (vector<8xi32>, vector<32xi8>, vector<32xi8>) -> vector<8xi32> loc("<stdin>":134:10)
    "func.return"(%0) : (vector<8xi32>) -> () loc("<stdin>":135:5)
  }) : () -> () loc("<stdin>":132:3)
}) : () -> () loc("<stdin>":1:1)
