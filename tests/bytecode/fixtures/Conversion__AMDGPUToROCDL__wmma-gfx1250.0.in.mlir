"builtin.module"() ({
  "func.func"() <{function_type = (vector<2xf32>, vector<8xf32>) -> (), sym_name = "wmma_k4"}> ({
  ^bb0(%arg41: vector<2xf32> loc("<stdin>":3:8), %arg42: vector<8xf32> loc("<stdin>":3:31)):
    %31 = "amdgpu.wmma"(%arg41, %arg41, %arg42) <{k = 4 : i32, m = 16 : i32, n = 16 : i32, subwordOffset = 0 : i32}> : (vector<2xf32>, vector<2xf32>, vector<8xf32>) -> vector<8xf32> loc("<stdin>":4:11)
    "func.return"() : () -> () loc("<stdin>":5:5)
  }) : () -> () loc("<stdin>":2:3)
  "func.func"() <{function_type = (vector<16xf16>, vector<16xbf16>, vector<8xf32>, vector<8xf16>, vector<8xbf16>) -> (), sym_name = "wmma_k32"}> ({
  ^bb0(%arg36: vector<16xf16> loc("<stdin>":8:8), %arg37: vector<16xbf16> loc("<stdin>":8:32), %arg38: vector<8xf32> loc("<stdin>":8:57), %arg39: vector<8xf16> loc("<stdin>":8:80), %arg40: vector<8xbf16> loc("<stdin>":8:103)):
    %27 = "amdgpu.wmma"(%arg36, %arg36, %arg38) <{k = 32 : i32, m = 16 : i32, n = 16 : i32, subwordOffset = 0 : i32}> : (vector<16xf16>, vector<16xf16>, vector<8xf32>) -> vector<8xf32> loc("<stdin>":9:11)
    %28 = "amdgpu.wmma"(%arg36, %arg36, %arg39) <{k = 32 : i32, m = 16 : i32, n = 16 : i32, subwordOffset = 0 : i32}> : (vector<16xf16>, vector<16xf16>, vector<8xf16>) -> vector<8xf16> loc("<stdin>":10:11)
    %29 = "amdgpu.wmma"(%arg37, %arg37, %arg38) <{k = 32 : i32, m = 16 : i32, n = 16 : i32, subwordOffset = 0 : i32}> : (vector<16xbf16>, vector<16xbf16>, vector<8xf32>) -> vector<8xf32> loc("<stdin>":11:11)
    %30 = "amdgpu.wmma"(%arg37, %arg37, %arg40) <{k = 32 : i32, m = 16 : i32, n = 16 : i32, subwordOffset = 0 : i32}> : (vector<16xbf16>, vector<16xbf16>, vector<8xbf16>) -> vector<8xbf16> loc("<stdin>":12:11)
    "func.return"() : () -> () loc("<stdin>":13:5)
  }) : () -> () loc("<stdin>":7:3)
  "func.func"() <{function_type = (vector<32xi8>, vector<32xf8E4M3FN>, vector<32xf8E5M2>, vector<8xi32>, vector<8xf32>, vector<8xf16>) -> (), sym_name = "wmma_k64"}> ({
  ^bb0(%arg30: vector<32xi8> loc("<stdin>":16:8), %arg31: vector<32xf8E4M3FN> loc("<stdin>":16:31), %arg32: vector<32xf8E5M2> loc("<stdin>":16:60), %arg33: vector<8xi32> loc("<stdin>":16:87), %arg34: vector<8xf32> loc("<stdin>":16:110), %arg35: vector<8xf16> loc("<stdin>":16:133)):
    %18 = "amdgpu.wmma"(%arg30, %arg30, %arg33) <{clamp, k = 64 : i32, m = 16 : i32, n = 16 : i32, subwordOffset = 0 : i32}> : (vector<32xi8>, vector<32xi8>, vector<8xi32>) -> vector<8xi32> loc("<stdin>":17:11)
    %19 = "amdgpu.wmma"(%arg31, %arg31, %arg34) <{k = 64 : i32, m = 16 : i32, n = 16 : i32, subwordOffset = 0 : i32}> : (vector<32xf8E4M3FN>, vector<32xf8E4M3FN>, vector<8xf32>) -> vector<8xf32> loc("<stdin>":18:11)
    %20 = "amdgpu.wmma"(%arg31, %arg31, %arg35) <{k = 64 : i32, m = 16 : i32, n = 16 : i32, subwordOffset = 0 : i32}> : (vector<32xf8E4M3FN>, vector<32xf8E4M3FN>, vector<8xf16>) -> vector<8xf16> loc("<stdin>":19:11)
    %21 = "amdgpu.wmma"(%arg31, %arg32, %arg34) <{k = 64 : i32, m = 16 : i32, n = 16 : i32, subwordOffset = 0 : i32}> : (vector<32xf8E4M3FN>, vector<32xf8E5M2>, vector<8xf32>) -> vector<8xf32> loc("<stdin>":20:11)
    %22 = "amdgpu.wmma"(%arg31, %arg32, %arg35) <{k = 64 : i32, m = 16 : i32, n = 16 : i32, subwordOffset = 0 : i32}> : (vector<32xf8E4M3FN>, vector<32xf8E5M2>, vector<8xf16>) -> vector<8xf16> loc("<stdin>":21:11)
    %23 = "amdgpu.wmma"(%arg32, %arg32, %arg34) <{k = 64 : i32, m = 16 : i32, n = 16 : i32, subwordOffset = 0 : i32}> : (vector<32xf8E5M2>, vector<32xf8E5M2>, vector<8xf32>) -> vector<8xf32> loc("<stdin>":22:11)
    %24 = "amdgpu.wmma"(%arg32, %arg32, %arg35) <{k = 64 : i32, m = 16 : i32, n = 16 : i32, subwordOffset = 0 : i32}> : (vector<32xf8E5M2>, vector<32xf8E5M2>, vector<8xf16>) -> vector<8xf16> loc("<stdin>":23:11)
    %25 = "amdgpu.wmma"(%arg32, %arg31, %arg34) <{k = 64 : i32, m = 16 : i32, n = 16 : i32, subwordOffset = 0 : i32}> : (vector<32xf8E5M2>, vector<32xf8E4M3FN>, vector<8xf32>) -> vector<8xf32> loc("<stdin>":24:11)
    %26 = "amdgpu.wmma"(%arg32, %arg31, %arg35) <{k = 64 : i32, m = 16 : i32, n = 16 : i32, subwordOffset = 0 : i32}> : (vector<32xf8E5M2>, vector<32xf8E4M3FN>, vector<8xf16>) -> vector<8xf16> loc("<stdin>":25:11)
    "func.return"() : () -> () loc("<stdin>":26:5)
  }) : () -> () loc("<stdin>":15:3)
  "func.func"() <{function_type = (vector<64xf8E4M3FN>, vector<64xf8E5M2>, vector<8xf32>, vector<8xf16>) -> (), sym_name = "wmma_k128"}> ({
  ^bb0(%arg26: vector<64xf8E4M3FN> loc("<stdin>":29:8), %arg27: vector<64xf8E5M2> loc("<stdin>":29:37), %arg28: vector<8xf32> loc("<stdin>":29:64), %arg29: vector<8xf16> loc("<stdin>":29:87)):
    %10 = "amdgpu.wmma"(%arg26, %arg26, %arg28) <{k = 128 : i32, m = 16 : i32, n = 16 : i32, subwordOffset = 0 : i32}> : (vector<64xf8E4M3FN>, vector<64xf8E4M3FN>, vector<8xf32>) -> vector<8xf32> loc("<stdin>":30:11)
    %11 = "amdgpu.wmma"(%arg26, %arg26, %arg29) <{k = 128 : i32, m = 16 : i32, n = 16 : i32, subwordOffset = 0 : i32}> : (vector<64xf8E4M3FN>, vector<64xf8E4M3FN>, vector<8xf16>) -> vector<8xf16> loc("<stdin>":31:11)
    %12 = "amdgpu.wmma"(%arg26, %arg27, %arg28) <{k = 128 : i32, m = 16 : i32, n = 16 : i32, subwordOffset = 0 : i32}> : (vector<64xf8E4M3FN>, vector<64xf8E5M2>, vector<8xf32>) -> vector<8xf32> loc("<stdin>":32:11)
    %13 = "amdgpu.wmma"(%arg26, %arg27, %arg29) <{k = 128 : i32, m = 16 : i32, n = 16 : i32, subwordOffset = 0 : i32}> : (vector<64xf8E4M3FN>, vector<64xf8E5M2>, vector<8xf16>) -> vector<8xf16> loc("<stdin>":33:11)
    %14 = "amdgpu.wmma"(%arg27, %arg27, %arg28) <{k = 128 : i32, m = 16 : i32, n = 16 : i32, subwordOffset = 0 : i32}> : (vector<64xf8E5M2>, vector<64xf8E5M2>, vector<8xf32>) -> vector<8xf32> loc("<stdin>":34:11)
    %15 = "amdgpu.wmma"(%arg27, %arg27, %arg29) <{k = 128 : i32, m = 16 : i32, n = 16 : i32, subwordOffset = 0 : i32}> : (vector<64xf8E5M2>, vector<64xf8E5M2>, vector<8xf16>) -> vector<8xf16> loc("<stdin>":35:11)
    %16 = "amdgpu.wmma"(%arg27, %arg26, %arg28) <{k = 128 : i32, m = 16 : i32, n = 16 : i32, subwordOffset = 0 : i32}> : (vector<64xf8E5M2>, vector<64xf8E4M3FN>, vector<8xf32>) -> vector<8xf32> loc("<stdin>":36:11)
    %17 = "amdgpu.wmma"(%arg27, %arg26, %arg29) <{k = 128 : i32, m = 16 : i32, n = 16 : i32, subwordOffset = 0 : i32}> : (vector<64xf8E5M2>, vector<64xf8E4M3FN>, vector<8xf16>) -> vector<8xf16> loc("<stdin>":37:11)
    "func.return"() : () -> () loc("<stdin>":38:5)
  }) : () -> () loc("<stdin>":28:3)
  "func.func"() <{function_type = (vector<64xf8E4M3FN>, vector<64xf6E2M3FN>, vector<8xf32>, vector<4xf8E8M0FNU>) -> (), sym_name = "wmma_scale_16x16x128_fp8"}> ({
  ^bb0(%arg22: vector<64xf8E4M3FN> loc("<stdin>":41:8), %arg23: vector<64xf6E2M3FN> loc("<stdin>":41:37), %arg24: vector<8xf32> loc("<stdin>":41:66), %arg25: vector<4xf8E8M0FNU> loc("<stdin>":41:89)):
    %8 = "amdgpu.scaled_wmma"(%arg22, %arg22, %arg24, %arg25, %arg25) <{a_first_scale_lane = 0 : i32, b_first_scale_lane = 0 : i32, k = 128 : i32, m = 16 : i32, n = 16 : i32}> : (vector<64xf8E4M3FN>, vector<64xf8E4M3FN>, vector<8xf32>, vector<4xf8E8M0FNU>, vector<4xf8E8M0FNU>) -> vector<8xf32> loc("<stdin>":42:10)
    %9 = "amdgpu.scaled_wmma"(%arg23, %arg23, %arg24, %arg25, %arg25) <{a_first_scale_lane = 16 : i32, b_first_scale_lane = 0 : i32, k = 128 : i32, m = 16 : i32, n = 16 : i32}> : (vector<64xf6E2M3FN>, vector<64xf6E2M3FN>, vector<8xf32>, vector<4xf8E8M0FNU>, vector<4xf8E8M0FNU>) -> vector<8xf32> loc("<stdin>":43:10)
    "func.return"() : () -> () loc("<stdin>":44:5)
  }) : () -> () loc("<stdin>":40:3)
  "func.func"() <{function_type = (vector<64xf6E2M3FN>, vector<64xf6E3M2FN>, vector<8xf32>, vector<4xf8E8M0FNU>) -> (), sym_name = "wmma_scale_16x16x128_fp6"}> ({
  ^bb0(%arg18: vector<64xf6E2M3FN> loc("<stdin>":47:8), %arg19: vector<64xf6E3M2FN> loc("<stdin>":47:37), %arg20: vector<8xf32> loc("<stdin>":47:66), %arg21: vector<4xf8E8M0FNU> loc("<stdin>":47:89)):
    %6 = "amdgpu.scaled_wmma"(%arg18, %arg18, %arg20, %arg21, %arg21) <{a_first_scale_lane = 0 : i32, b_first_scale_lane = 0 : i32, k = 128 : i32, m = 16 : i32, n = 16 : i32}> : (vector<64xf6E2M3FN>, vector<64xf6E2M3FN>, vector<8xf32>, vector<4xf8E8M0FNU>, vector<4xf8E8M0FNU>) -> vector<8xf32> loc("<stdin>":48:10)
    %7 = "amdgpu.scaled_wmma"(%arg19, %arg19, %arg20, %arg21, %arg21) <{a_first_scale_lane = 0 : i32, b_first_scale_lane = 0 : i32, k = 128 : i32, m = 16 : i32, n = 16 : i32}> : (vector<64xf6E3M2FN>, vector<64xf6E3M2FN>, vector<8xf32>, vector<4xf8E8M0FNU>, vector<4xf8E8M0FNU>) -> vector<8xf32> loc("<stdin>":49:10)
    "func.return"() : () -> () loc("<stdin>":50:5)
  }) : () -> () loc("<stdin>":46:3)
  "func.func"() <{function_type = (vector<64xf8E4M3FN>, vector<64xf6E2M3FN>, vector<64xf4E2M1FN>, vector<8xf32>, vector<4xf8E8M0FNU>, vector<4xf8E4M3FN>) -> (), sym_name = "wmma_scale_16x16x128_mixed"}> ({
  ^bb0(%arg12: vector<64xf8E4M3FN> loc("<stdin>":53:8), %arg13: vector<64xf6E2M3FN> loc("<stdin>":53:37), %arg14: vector<64xf4E2M1FN> loc("<stdin>":53:66), %arg15: vector<8xf32> loc("<stdin>":53:95), %arg16: vector<4xf8E8M0FNU> loc("<stdin>":53:118), %arg17: vector<4xf8E4M3FN> loc("<stdin>":53:147)):
    %4 = "amdgpu.scaled_wmma"(%arg12, %arg14, %arg15, %arg16, %arg17) <{a_first_scale_lane = 0 : i32, b_first_scale_lane = 0 : i32, k = 128 : i32, m = 16 : i32, n = 16 : i32}> : (vector<64xf8E4M3FN>, vector<64xf4E2M1FN>, vector<8xf32>, vector<4xf8E8M0FNU>, vector<4xf8E4M3FN>) -> vector<8xf32> loc("<stdin>":54:10)
    %5 = "amdgpu.scaled_wmma"(%arg13, %arg14, %arg15, %arg16, %arg17) <{a_first_scale_lane = 0 : i32, b_first_scale_lane = 0 : i32, k = 128 : i32, m = 16 : i32, n = 16 : i32}> : (vector<64xf6E2M3FN>, vector<64xf4E2M1FN>, vector<8xf32>, vector<4xf8E8M0FNU>, vector<4xf8E4M3FN>) -> vector<8xf32> loc("<stdin>":55:10)
    "func.return"() : () -> () loc("<stdin>":56:5)
  }) : () -> () loc("<stdin>":52:3)
  "func.func"() <{function_type = (vector<64xf8E4M3FN>, vector<64xf6E3M2FN>, vector<8xf32>, vector<8xf8E8M0FNU>) -> (), sym_name = "wmma_scale16_16x16x128_fp8"}> ({
  ^bb0(%arg8: vector<64xf8E4M3FN> loc("<stdin>":59:8), %arg9: vector<64xf6E3M2FN> loc("<stdin>":59:36), %arg10: vector<8xf32> loc("<stdin>":59:64), %arg11: vector<8xf8E8M0FNU> loc("<stdin>":59:87)):
    %2 = "amdgpu.scaled_wmma"(%arg8, %arg8, %arg10, %arg11, %arg11) <{a_first_scale_lane = 0 : i32, b_first_scale_lane = 0 : i32, k = 128 : i32, m = 16 : i32, n = 16 : i32}> : (vector<64xf8E4M3FN>, vector<64xf8E4M3FN>, vector<8xf32>, vector<8xf8E8M0FNU>, vector<8xf8E8M0FNU>) -> vector<8xf32> loc("<stdin>":60:10)
    %3 = "amdgpu.scaled_wmma"(%arg9, %arg9, %arg10, %arg11, %arg11) <{a_first_scale_lane = 16 : i32, b_first_scale_lane = 0 : i32, k = 128 : i32, m = 16 : i32, n = 16 : i32}> : (vector<64xf6E3M2FN>, vector<64xf6E3M2FN>, vector<8xf32>, vector<8xf8E8M0FNU>, vector<8xf8E8M0FNU>) -> vector<8xf32> loc("<stdin>":61:10)
    "func.return"() : () -> () loc("<stdin>":62:5)
  }) : () -> () loc("<stdin>":58:3)
  "func.func"() <{function_type = (vector<128xf4E2M1FN>, vector<64xf4E2M1FN>, vector<16xf32>, vector<4xf8E4M3FN>) -> (), sym_name = "wmma_scale_32x16x128_fp4"}> ({
  ^bb0(%arg4: vector<128xf4E2M1FN> loc("<stdin>":65:8), %arg5: vector<64xf4E2M1FN> loc("<stdin>":65:37), %arg6: vector<16xf32> loc("<stdin>":65:65), %arg7: vector<4xf8E4M3FN> loc("<stdin>":65:88)):
    %1 = "amdgpu.scaled_wmma"(%arg4, %arg5, %arg6, %arg7, %arg7) <{a_first_scale_lane = 0 : i32, b_first_scale_lane = 0 : i32, k = 128 : i32, m = 32 : i32, n = 16 : i32}> : (vector<128xf4E2M1FN>, vector<64xf4E2M1FN>, vector<16xf32>, vector<4xf8E4M3FN>, vector<4xf8E4M3FN>) -> vector<16xf32> loc("<stdin>":66:10)
    "func.return"() : () -> () loc("<stdin>":67:5)
  }) : () -> () loc("<stdin>":64:3)
  "func.func"() <{function_type = (vector<128xf4E2M1FN>, vector<64xf4E2M1FN>, vector<16xf32>, vector<8xf8E4M3FN>) -> (), sym_name = "wmma_scale16_32x16x128_fp4"}> ({
  ^bb0(%arg0: vector<128xf4E2M1FN> loc("<stdin>":70:8), %arg1: vector<64xf4E2M1FN> loc("<stdin>":70:37), %arg2: vector<16xf32> loc("<stdin>":70:65), %arg3: vector<8xf8E4M3FN> loc("<stdin>":70:88)):
    %0 = "amdgpu.scaled_wmma"(%arg0, %arg1, %arg2, %arg3, %arg3) <{a_first_scale_lane = 0 : i32, b_first_scale_lane = 0 : i32, k = 128 : i32, m = 32 : i32, n = 16 : i32}> : (vector<128xf4E2M1FN>, vector<64xf4E2M1FN>, vector<16xf32>, vector<8xf8E4M3FN>, vector<8xf8E4M3FN>) -> vector<16xf32> loc("<stdin>":71:10)
    "func.return"() : () -> () loc("<stdin>":72:5)
  }) : () -> () loc("<stdin>":69:3)
}) : () -> () loc("<stdin>":1:1)
