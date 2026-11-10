"builtin.module"() ({
  "func.func"() <{function_type = (vector<2xf32>, vector<8xf32>) -> (), sym_name = "wmma_k4"}> ({
  ^bb0(%arg41: vector<2xf32>, %arg42: vector<8xf32>):
    %31 = "amdgpu.wmma"(%arg41, %arg41, %arg42) <{k = 4 : i32, m = 16 : i32, n = 16 : i32, subwordOffset = 0 : i32}> : (vector<2xf32>, vector<2xf32>, vector<8xf32>) -> vector<8xf32>
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<16xf16>, vector<16xbf16>, vector<8xf32>, vector<8xf16>, vector<8xbf16>) -> (), sym_name = "wmma_k32"}> ({
  ^bb0(%arg36: vector<16xf16>, %arg37: vector<16xbf16>, %arg38: vector<8xf32>, %arg39: vector<8xf16>, %arg40: vector<8xbf16>):
    %27 = "amdgpu.wmma"(%arg36, %arg36, %arg38) <{k = 32 : i32, m = 16 : i32, n = 16 : i32, subwordOffset = 0 : i32}> : (vector<16xf16>, vector<16xf16>, vector<8xf32>) -> vector<8xf32>
    %28 = "amdgpu.wmma"(%arg36, %arg36, %arg39) <{k = 32 : i32, m = 16 : i32, n = 16 : i32, subwordOffset = 0 : i32}> : (vector<16xf16>, vector<16xf16>, vector<8xf16>) -> vector<8xf16>
    %29 = "amdgpu.wmma"(%arg37, %arg37, %arg38) <{k = 32 : i32, m = 16 : i32, n = 16 : i32, subwordOffset = 0 : i32}> : (vector<16xbf16>, vector<16xbf16>, vector<8xf32>) -> vector<8xf32>
    %30 = "amdgpu.wmma"(%arg37, %arg37, %arg40) <{k = 32 : i32, m = 16 : i32, n = 16 : i32, subwordOffset = 0 : i32}> : (vector<16xbf16>, vector<16xbf16>, vector<8xbf16>) -> vector<8xbf16>
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<32xi8>, vector<32xf8E4M3FN>, vector<32xf8E5M2>, vector<8xi32>, vector<8xf32>, vector<8xf16>) -> (), sym_name = "wmma_k64"}> ({
  ^bb0(%arg30: vector<32xi8>, %arg31: vector<32xf8E4M3FN>, %arg32: vector<32xf8E5M2>, %arg33: vector<8xi32>, %arg34: vector<8xf32>, %arg35: vector<8xf16>):
    %18 = "amdgpu.wmma"(%arg30, %arg30, %arg33) <{clamp, k = 64 : i32, m = 16 : i32, n = 16 : i32, subwordOffset = 0 : i32}> : (vector<32xi8>, vector<32xi8>, vector<8xi32>) -> vector<8xi32>
    %19 = "amdgpu.wmma"(%arg31, %arg31, %arg34) <{k = 64 : i32, m = 16 : i32, n = 16 : i32, subwordOffset = 0 : i32}> : (vector<32xf8E4M3FN>, vector<32xf8E4M3FN>, vector<8xf32>) -> vector<8xf32>
    %20 = "amdgpu.wmma"(%arg31, %arg31, %arg35) <{k = 64 : i32, m = 16 : i32, n = 16 : i32, subwordOffset = 0 : i32}> : (vector<32xf8E4M3FN>, vector<32xf8E4M3FN>, vector<8xf16>) -> vector<8xf16>
    %21 = "amdgpu.wmma"(%arg31, %arg32, %arg34) <{k = 64 : i32, m = 16 : i32, n = 16 : i32, subwordOffset = 0 : i32}> : (vector<32xf8E4M3FN>, vector<32xf8E5M2>, vector<8xf32>) -> vector<8xf32>
    %22 = "amdgpu.wmma"(%arg31, %arg32, %arg35) <{k = 64 : i32, m = 16 : i32, n = 16 : i32, subwordOffset = 0 : i32}> : (vector<32xf8E4M3FN>, vector<32xf8E5M2>, vector<8xf16>) -> vector<8xf16>
    %23 = "amdgpu.wmma"(%arg32, %arg32, %arg34) <{k = 64 : i32, m = 16 : i32, n = 16 : i32, subwordOffset = 0 : i32}> : (vector<32xf8E5M2>, vector<32xf8E5M2>, vector<8xf32>) -> vector<8xf32>
    %24 = "amdgpu.wmma"(%arg32, %arg32, %arg35) <{k = 64 : i32, m = 16 : i32, n = 16 : i32, subwordOffset = 0 : i32}> : (vector<32xf8E5M2>, vector<32xf8E5M2>, vector<8xf16>) -> vector<8xf16>
    %25 = "amdgpu.wmma"(%arg32, %arg31, %arg34) <{k = 64 : i32, m = 16 : i32, n = 16 : i32, subwordOffset = 0 : i32}> : (vector<32xf8E5M2>, vector<32xf8E4M3FN>, vector<8xf32>) -> vector<8xf32>
    %26 = "amdgpu.wmma"(%arg32, %arg31, %arg35) <{k = 64 : i32, m = 16 : i32, n = 16 : i32, subwordOffset = 0 : i32}> : (vector<32xf8E5M2>, vector<32xf8E4M3FN>, vector<8xf16>) -> vector<8xf16>
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<64xf8E4M3FN>, vector<64xf8E5M2>, vector<8xf32>, vector<8xf16>) -> (), sym_name = "wmma_k128"}> ({
  ^bb0(%arg26: vector<64xf8E4M3FN>, %arg27: vector<64xf8E5M2>, %arg28: vector<8xf32>, %arg29: vector<8xf16>):
    %10 = "amdgpu.wmma"(%arg26, %arg26, %arg28) <{k = 128 : i32, m = 16 : i32, n = 16 : i32, subwordOffset = 0 : i32}> : (vector<64xf8E4M3FN>, vector<64xf8E4M3FN>, vector<8xf32>) -> vector<8xf32>
    %11 = "amdgpu.wmma"(%arg26, %arg26, %arg29) <{k = 128 : i32, m = 16 : i32, n = 16 : i32, subwordOffset = 0 : i32}> : (vector<64xf8E4M3FN>, vector<64xf8E4M3FN>, vector<8xf16>) -> vector<8xf16>
    %12 = "amdgpu.wmma"(%arg26, %arg27, %arg28) <{k = 128 : i32, m = 16 : i32, n = 16 : i32, subwordOffset = 0 : i32}> : (vector<64xf8E4M3FN>, vector<64xf8E5M2>, vector<8xf32>) -> vector<8xf32>
    %13 = "amdgpu.wmma"(%arg26, %arg27, %arg29) <{k = 128 : i32, m = 16 : i32, n = 16 : i32, subwordOffset = 0 : i32}> : (vector<64xf8E4M3FN>, vector<64xf8E5M2>, vector<8xf16>) -> vector<8xf16>
    %14 = "amdgpu.wmma"(%arg27, %arg27, %arg28) <{k = 128 : i32, m = 16 : i32, n = 16 : i32, subwordOffset = 0 : i32}> : (vector<64xf8E5M2>, vector<64xf8E5M2>, vector<8xf32>) -> vector<8xf32>
    %15 = "amdgpu.wmma"(%arg27, %arg27, %arg29) <{k = 128 : i32, m = 16 : i32, n = 16 : i32, subwordOffset = 0 : i32}> : (vector<64xf8E5M2>, vector<64xf8E5M2>, vector<8xf16>) -> vector<8xf16>
    %16 = "amdgpu.wmma"(%arg27, %arg26, %arg28) <{k = 128 : i32, m = 16 : i32, n = 16 : i32, subwordOffset = 0 : i32}> : (vector<64xf8E5M2>, vector<64xf8E4M3FN>, vector<8xf32>) -> vector<8xf32>
    %17 = "amdgpu.wmma"(%arg27, %arg26, %arg29) <{k = 128 : i32, m = 16 : i32, n = 16 : i32, subwordOffset = 0 : i32}> : (vector<64xf8E5M2>, vector<64xf8E4M3FN>, vector<8xf16>) -> vector<8xf16>
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<64xf8E4M3FN>, vector<64xf6E2M3FN>, vector<8xf32>, vector<4xf8E8M0FNU>) -> (), sym_name = "wmma_scale_16x16x128_fp8"}> ({
  ^bb0(%arg22: vector<64xf8E4M3FN>, %arg23: vector<64xf6E2M3FN>, %arg24: vector<8xf32>, %arg25: vector<4xf8E8M0FNU>):
    %8 = "amdgpu.scaled_wmma"(%arg22, %arg22, %arg24, %arg25, %arg25) <{a_first_scale_lane = 0 : i32, b_first_scale_lane = 0 : i32, k = 128 : i32, m = 16 : i32, n = 16 : i32}> : (vector<64xf8E4M3FN>, vector<64xf8E4M3FN>, vector<8xf32>, vector<4xf8E8M0FNU>, vector<4xf8E8M0FNU>) -> vector<8xf32>
    %9 = "amdgpu.scaled_wmma"(%arg23, %arg23, %arg24, %arg25, %arg25) <{a_first_scale_lane = 16 : i32, b_first_scale_lane = 0 : i32, k = 128 : i32, m = 16 : i32, n = 16 : i32}> : (vector<64xf6E2M3FN>, vector<64xf6E2M3FN>, vector<8xf32>, vector<4xf8E8M0FNU>, vector<4xf8E8M0FNU>) -> vector<8xf32>
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<64xf6E2M3FN>, vector<64xf6E3M2FN>, vector<8xf32>, vector<4xf8E8M0FNU>) -> (), sym_name = "wmma_scale_16x16x128_fp6"}> ({
  ^bb0(%arg18: vector<64xf6E2M3FN>, %arg19: vector<64xf6E3M2FN>, %arg20: vector<8xf32>, %arg21: vector<4xf8E8M0FNU>):
    %6 = "amdgpu.scaled_wmma"(%arg18, %arg18, %arg20, %arg21, %arg21) <{a_first_scale_lane = 0 : i32, b_first_scale_lane = 0 : i32, k = 128 : i32, m = 16 : i32, n = 16 : i32}> : (vector<64xf6E2M3FN>, vector<64xf6E2M3FN>, vector<8xf32>, vector<4xf8E8M0FNU>, vector<4xf8E8M0FNU>) -> vector<8xf32>
    %7 = "amdgpu.scaled_wmma"(%arg19, %arg19, %arg20, %arg21, %arg21) <{a_first_scale_lane = 0 : i32, b_first_scale_lane = 0 : i32, k = 128 : i32, m = 16 : i32, n = 16 : i32}> : (vector<64xf6E3M2FN>, vector<64xf6E3M2FN>, vector<8xf32>, vector<4xf8E8M0FNU>, vector<4xf8E8M0FNU>) -> vector<8xf32>
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<64xf8E4M3FN>, vector<64xf6E2M3FN>, vector<64xf4E2M1FN>, vector<8xf32>, vector<4xf8E8M0FNU>, vector<4xf8E4M3FN>) -> (), sym_name = "wmma_scale_16x16x128_mixed"}> ({
  ^bb0(%arg12: vector<64xf8E4M3FN>, %arg13: vector<64xf6E2M3FN>, %arg14: vector<64xf4E2M1FN>, %arg15: vector<8xf32>, %arg16: vector<4xf8E8M0FNU>, %arg17: vector<4xf8E4M3FN>):
    %4 = "amdgpu.scaled_wmma"(%arg12, %arg14, %arg15, %arg16, %arg17) <{a_first_scale_lane = 0 : i32, b_first_scale_lane = 0 : i32, k = 128 : i32, m = 16 : i32, n = 16 : i32}> : (vector<64xf8E4M3FN>, vector<64xf4E2M1FN>, vector<8xf32>, vector<4xf8E8M0FNU>, vector<4xf8E4M3FN>) -> vector<8xf32>
    %5 = "amdgpu.scaled_wmma"(%arg13, %arg14, %arg15, %arg16, %arg17) <{a_first_scale_lane = 0 : i32, b_first_scale_lane = 0 : i32, k = 128 : i32, m = 16 : i32, n = 16 : i32}> : (vector<64xf6E2M3FN>, vector<64xf4E2M1FN>, vector<8xf32>, vector<4xf8E8M0FNU>, vector<4xf8E4M3FN>) -> vector<8xf32>
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<64xf8E4M3FN>, vector<64xf6E3M2FN>, vector<8xf32>, vector<8xf8E8M0FNU>) -> (), sym_name = "wmma_scale16_16x16x128_fp8"}> ({
  ^bb0(%arg8: vector<64xf8E4M3FN>, %arg9: vector<64xf6E3M2FN>, %arg10: vector<8xf32>, %arg11: vector<8xf8E8M0FNU>):
    %2 = "amdgpu.scaled_wmma"(%arg8, %arg8, %arg10, %arg11, %arg11) <{a_first_scale_lane = 0 : i32, b_first_scale_lane = 0 : i32, k = 128 : i32, m = 16 : i32, n = 16 : i32}> : (vector<64xf8E4M3FN>, vector<64xf8E4M3FN>, vector<8xf32>, vector<8xf8E8M0FNU>, vector<8xf8E8M0FNU>) -> vector<8xf32>
    %3 = "amdgpu.scaled_wmma"(%arg9, %arg9, %arg10, %arg11, %arg11) <{a_first_scale_lane = 16 : i32, b_first_scale_lane = 0 : i32, k = 128 : i32, m = 16 : i32, n = 16 : i32}> : (vector<64xf6E3M2FN>, vector<64xf6E3M2FN>, vector<8xf32>, vector<8xf8E8M0FNU>, vector<8xf8E8M0FNU>) -> vector<8xf32>
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<128xf4E2M1FN>, vector<64xf4E2M1FN>, vector<16xf32>, vector<4xf8E4M3FN>) -> (), sym_name = "wmma_scale_32x16x128_fp4"}> ({
  ^bb0(%arg4: vector<128xf4E2M1FN>, %arg5: vector<64xf4E2M1FN>, %arg6: vector<16xf32>, %arg7: vector<4xf8E4M3FN>):
    %1 = "amdgpu.scaled_wmma"(%arg4, %arg5, %arg6, %arg7, %arg7) <{a_first_scale_lane = 0 : i32, b_first_scale_lane = 0 : i32, k = 128 : i32, m = 32 : i32, n = 16 : i32}> : (vector<128xf4E2M1FN>, vector<64xf4E2M1FN>, vector<16xf32>, vector<4xf8E4M3FN>, vector<4xf8E4M3FN>) -> vector<16xf32>
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<128xf4E2M1FN>, vector<64xf4E2M1FN>, vector<16xf32>, vector<8xf8E4M3FN>) -> (), sym_name = "wmma_scale16_32x16x128_fp4"}> ({
  ^bb0(%arg0: vector<128xf4E2M1FN>, %arg1: vector<64xf4E2M1FN>, %arg2: vector<16xf32>, %arg3: vector<8xf8E4M3FN>):
    %0 = "amdgpu.scaled_wmma"(%arg0, %arg1, %arg2, %arg3, %arg3) <{a_first_scale_lane = 0 : i32, b_first_scale_lane = 0 : i32, k = 128 : i32, m = 32 : i32, n = 16 : i32}> : (vector<128xf4E2M1FN>, vector<64xf4E2M1FN>, vector<16xf32>, vector<8xf8E4M3FN>, vector<8xf8E4M3FN>) -> vector<16xf32>
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

