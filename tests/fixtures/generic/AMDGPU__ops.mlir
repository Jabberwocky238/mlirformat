"builtin.module"() ({
  "func.func"() <{function_type = (vector<4xf8E4M3FNUZ>) -> f32, sym_name = "ext_packed_fp8_s"}> ({
  ^bb0(%arg236: vector<4xf8E4M3FNUZ>):
    %102 = "amdgpu.ext_packed_fp8"(%arg236) <{index = 0 : i32}> : (vector<4xf8E4M3FNUZ>) -> f32
    "func.return"(%102) : (f32) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<4xf8E4M3FNUZ>) -> vector<2xf32>, sym_name = "ext_packed_fp8_v"}> ({
  ^bb0(%arg235: vector<4xf8E4M3FNUZ>):
    %101 = "amdgpu.ext_packed_fp8"(%arg235) <{index = 0 : i32}> : (vector<4xf8E4M3FNUZ>) -> vector<2xf32>
    "func.return"(%101) : (vector<2xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (f32, f32, vector<4xf8E5M2FNUZ>, i32) -> vector<4xf8E5M2FNUZ>, sym_name = "packed_trunc_2xfp8"}> ({
  ^bb0(%arg231: f32, %arg232: f32, %arg233: vector<4xf8E5M2FNUZ>, %arg234: i32):
    %100 = "amdgpu.packed_trunc_2xfp8"(%arg231, %arg232, %arg233) <{operandSegmentSizes = array<i32: 1, 1, 1>, wordIndex = 1 : i32}> : (f32, f32, vector<4xf8E5M2FNUZ>) -> vector<4xf8E5M2FNUZ>
    "func.return"(%100) : (vector<4xf8E5M2FNUZ>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (f32, i32, vector<4xf8E5M2FNUZ>) -> vector<4xf8E5M2FNUZ>, sym_name = "packed_stoch_round_fp8"}> ({
  ^bb0(%arg228: f32, %arg229: i32, %arg230: vector<4xf8E5M2FNUZ>):
    %99 = "amdgpu.packed_stoch_round_fp8"(%arg228, %arg229, %arg230) <{storeIndex = 2 : i32}> : (f32, i32, vector<4xf8E5M2FNUZ>) -> vector<4xf8E5M2FNUZ>
    "func.return"(%99) : (vector<4xf8E5M2FNUZ>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<4xf8E4M3FN>, f32) -> vector<2xf32>, sym_name = "scaled_ext_full_f8e4m3_f32"}> ({
  ^bb0(%arg226: vector<4xf8E4M3FN>, %arg227: f32):
    %98 = "amdgpu.scaled_ext_packed"(%arg226, %arg227) <{index = 0 : i32}> : (vector<4xf8E4M3FN>, f32) -> vector<2xf32>
    "func.return"(%98) : (vector<2xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<4xf8E4M3FN>, f32) -> vector<2xf16>, sym_name = "scaled_ext_full_f8e4m3_f16"}> ({
  ^bb0(%arg224: vector<4xf8E4M3FN>, %arg225: f32):
    %97 = "amdgpu.scaled_ext_packed"(%arg224, %arg225) <{index = 0 : i32}> : (vector<4xf8E4M3FN>, f32) -> vector<2xf16>
    "func.return"(%97) : (vector<2xf16>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<4xf8E4M3FN>, f32) -> vector<2xbf16>, sym_name = "scaled_ext_full_f8e4m3_bf16"}> ({
  ^bb0(%arg222: vector<4xf8E4M3FN>, %arg223: f32):
    %96 = "amdgpu.scaled_ext_packed"(%arg222, %arg223) <{index = 0 : i32}> : (vector<4xf8E4M3FN>, f32) -> vector<2xbf16>
    "func.return"(%96) : (vector<2xbf16>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<2xf8E4M3FN>, f32) -> vector<2xf32>, sym_name = "scaled_ext_half_f8e4m3_f32"}> ({
  ^bb0(%arg220: vector<2xf8E4M3FN>, %arg221: f32):
    %95 = "amdgpu.scaled_ext_packed"(%arg220, %arg221) <{index = 0 : i32}> : (vector<2xf8E4M3FN>, f32) -> vector<2xf32>
    "func.return"(%95) : (vector<2xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<2xf8E4M3FN>, f32) -> vector<2xf16>, sym_name = "scaled_ext_half_f8e4m3_f16"}> ({
  ^bb0(%arg218: vector<2xf8E4M3FN>, %arg219: f32):
    %94 = "amdgpu.scaled_ext_packed"(%arg218, %arg219) <{index = 0 : i32}> : (vector<2xf8E4M3FN>, f32) -> vector<2xf16>
    "func.return"(%94) : (vector<2xf16>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<2xf8E4M3FN>, f32) -> vector<2xbf16>, sym_name = "scaled_ext_half_f8e4m3_bf16"}> ({
  ^bb0(%arg216: vector<2xf8E4M3FN>, %arg217: f32):
    %93 = "amdgpu.scaled_ext_packed"(%arg216, %arg217) <{index = 0 : i32}> : (vector<2xf8E4M3FN>, f32) -> vector<2xbf16>
    "func.return"(%93) : (vector<2xbf16>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<2xf8E4M3FN>, f32) -> vector<2xf32>, sym_name = "scaled_ext_scalar_f8e4m3_f32"}> ({
  ^bb0(%arg214: vector<2xf8E4M3FN>, %arg215: f32):
    %92 = "amdgpu.scaled_ext_packed"(%arg214, %arg215) <{index = 0 : i32}> : (vector<2xf8E4M3FN>, f32) -> vector<2xf32>
    "func.return"(%92) : (vector<2xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<2xf8E4M3FN>, f32) -> vector<2xf16>, sym_name = "scaled_ext_scalar_f8e4m3_f16"}> ({
  ^bb0(%arg212: vector<2xf8E4M3FN>, %arg213: f32):
    %91 = "amdgpu.scaled_ext_packed"(%arg212, %arg213) <{index = 0 : i32}> : (vector<2xf8E4M3FN>, f32) -> vector<2xf16>
    "func.return"(%91) : (vector<2xf16>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<2xf8E4M3FN>, f32) -> vector<2xbf16>, sym_name = "scaled_ext_scalar_f8e4m3_bf16"}> ({
  ^bb0(%arg210: vector<2xf8E4M3FN>, %arg211: f32):
    %90 = "amdgpu.scaled_ext_packed"(%arg210, %arg211) <{index = 0 : i32}> : (vector<2xf8E4M3FN>, f32) -> vector<2xbf16>
    "func.return"(%90) : (vector<2xbf16>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<4xf8E5M2>, f32) -> vector<2xf32>, sym_name = "scaled_ext_full_f8e5m2_f32"}> ({
  ^bb0(%arg208: vector<4xf8E5M2>, %arg209: f32):
    %89 = "amdgpu.scaled_ext_packed"(%arg208, %arg209) <{index = 0 : i32}> : (vector<4xf8E5M2>, f32) -> vector<2xf32>
    "func.return"(%89) : (vector<2xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<4xf8E5M2>, f32) -> vector<2xf16>, sym_name = "scaled_ext_full_f8e5m2_f16"}> ({
  ^bb0(%arg206: vector<4xf8E5M2>, %arg207: f32):
    %88 = "amdgpu.scaled_ext_packed"(%arg206, %arg207) <{index = 0 : i32}> : (vector<4xf8E5M2>, f32) -> vector<2xf16>
    "func.return"(%88) : (vector<2xf16>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<4xf8E5M2>, f32) -> vector<2xbf16>, sym_name = "scaled_ext_full_f8e5m2_bf16"}> ({
  ^bb0(%arg204: vector<4xf8E5M2>, %arg205: f32):
    %87 = "amdgpu.scaled_ext_packed"(%arg204, %arg205) <{index = 0 : i32}> : (vector<4xf8E5M2>, f32) -> vector<2xbf16>
    "func.return"(%87) : (vector<2xbf16>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<2xf8E5M2>, f32) -> vector<2xf32>, sym_name = "scaled_ext_half_f8e5m2_f32"}> ({
  ^bb0(%arg202: vector<2xf8E5M2>, %arg203: f32):
    %86 = "amdgpu.scaled_ext_packed"(%arg202, %arg203) <{index = 0 : i32}> : (vector<2xf8E5M2>, f32) -> vector<2xf32>
    "func.return"(%86) : (vector<2xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<2xf8E5M2>, f32) -> vector<2xf16>, sym_name = "scaled_ext_half_f8e5m2_f16"}> ({
  ^bb0(%arg200: vector<2xf8E5M2>, %arg201: f32):
    %85 = "amdgpu.scaled_ext_packed"(%arg200, %arg201) <{index = 0 : i32}> : (vector<2xf8E5M2>, f32) -> vector<2xf16>
    "func.return"(%85) : (vector<2xf16>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<2xf8E5M2>, f32) -> vector<2xbf16>, sym_name = "scaled_ext_half_f8e5m2_bf16"}> ({
  ^bb0(%arg198: vector<2xf8E5M2>, %arg199: f32):
    %84 = "amdgpu.scaled_ext_packed"(%arg198, %arg199) <{index = 0 : i32}> : (vector<2xf8E5M2>, f32) -> vector<2xbf16>
    "func.return"(%84) : (vector<2xbf16>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<2xf8E5M2>, f32) -> vector<2xf32>, sym_name = "scaled_ext_scalar_f8e5m2_f32"}> ({
  ^bb0(%arg196: vector<2xf8E5M2>, %arg197: f32):
    %83 = "amdgpu.scaled_ext_packed"(%arg196, %arg197) <{index = 0 : i32}> : (vector<2xf8E5M2>, f32) -> vector<2xf32>
    "func.return"(%83) : (vector<2xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<2xf8E5M2>, f32) -> vector<2xf16>, sym_name = "scaled_ext_scalar_f8e5m2_f16"}> ({
  ^bb0(%arg194: vector<2xf8E5M2>, %arg195: f32):
    %82 = "amdgpu.scaled_ext_packed"(%arg194, %arg195) <{index = 0 : i32}> : (vector<2xf8E5M2>, f32) -> vector<2xf16>
    "func.return"(%82) : (vector<2xf16>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<2xf8E5M2>, f32) -> vector<2xbf16>, sym_name = "scaled_ext_scalar_f8e5m2_bf16"}> ({
  ^bb0(%arg192: vector<2xf8E5M2>, %arg193: f32):
    %81 = "amdgpu.scaled_ext_packed"(%arg192, %arg193) <{index = 0 : i32}> : (vector<2xf8E5M2>, f32) -> vector<2xbf16>
    "func.return"(%81) : (vector<2xbf16>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<8xf4E2M1FN>, f32) -> vector<2xf32>, sym_name = "scaled_ext_full_f4e2m1_f32"}> ({
  ^bb0(%arg190: vector<8xf4E2M1FN>, %arg191: f32):
    %80 = "amdgpu.scaled_ext_packed"(%arg190, %arg191) <{index = 0 : i32}> : (vector<8xf4E2M1FN>, f32) -> vector<2xf32>
    "func.return"(%80) : (vector<2xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<8xf4E2M1FN>, f32) -> vector<2xf16>, sym_name = "scaled_ext_full_f4e2m1_f16"}> ({
  ^bb0(%arg188: vector<8xf4E2M1FN>, %arg189: f32):
    %79 = "amdgpu.scaled_ext_packed"(%arg188, %arg189) <{index = 0 : i32}> : (vector<8xf4E2M1FN>, f32) -> vector<2xf16>
    "func.return"(%79) : (vector<2xf16>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<8xf4E2M1FN>, f32) -> vector<2xbf16>, sym_name = "scaled_ext_full_f4e2m1_bf16"}> ({
  ^bb0(%arg186: vector<8xf4E2M1FN>, %arg187: f32):
    %78 = "amdgpu.scaled_ext_packed"(%arg186, %arg187) <{index = 0 : i32}> : (vector<8xf4E2M1FN>, f32) -> vector<2xbf16>
    "func.return"(%78) : (vector<2xbf16>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<8xf4E2M1FN>, f32) -> vector<2xf32>, sym_name = "scaled_ext_half_f4e2m1_f32"}> ({
  ^bb0(%arg184: vector<8xf4E2M1FN>, %arg185: f32):
    %77 = "amdgpu.scaled_ext_packed"(%arg184, %arg185) <{index = 0 : i32}> : (vector<8xf4E2M1FN>, f32) -> vector<2xf32>
    "func.return"(%77) : (vector<2xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<4xf4E2M1FN>, f32) -> vector<2xf16>, sym_name = "scaled_ext_half_f4e2m1_f16"}> ({
  ^bb0(%arg182: vector<4xf4E2M1FN>, %arg183: f32):
    %76 = "amdgpu.scaled_ext_packed"(%arg182, %arg183) <{index = 0 : i32}> : (vector<4xf4E2M1FN>, f32) -> vector<2xf16>
    "func.return"(%76) : (vector<2xf16>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<4xf4E2M1FN>, f32) -> vector<2xbf16>, sym_name = "scaled_ext_half_f4e2m1_bf16"}> ({
  ^bb0(%arg180: vector<4xf4E2M1FN>, %arg181: f32):
    %75 = "amdgpu.scaled_ext_packed"(%arg180, %arg181) <{index = 0 : i32}> : (vector<4xf4E2M1FN>, f32) -> vector<2xbf16>
    "func.return"(%75) : (vector<2xbf16>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<2xf4E2M1FN>, f32) -> vector<2xf32>, sym_name = "scaled_ext_scalar_f4e2m1_f32"}> ({
  ^bb0(%arg178: vector<2xf4E2M1FN>, %arg179: f32):
    %74 = "amdgpu.scaled_ext_packed"(%arg178, %arg179) <{index = 0 : i32}> : (vector<2xf4E2M1FN>, f32) -> vector<2xf32>
    "func.return"(%74) : (vector<2xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<2xf4E2M1FN>, f32) -> vector<2xf16>, sym_name = "scaled_ext_scalar_f4e2m1_f16"}> ({
  ^bb0(%arg176: vector<2xf4E2M1FN>, %arg177: f32):
    %73 = "amdgpu.scaled_ext_packed"(%arg176, %arg177) <{index = 0 : i32}> : (vector<2xf4E2M1FN>, f32) -> vector<2xf16>
    "func.return"(%73) : (vector<2xf16>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<2xf4E2M1FN>, f32) -> vector<2xbf16>, sym_name = "scaled_ext_scalar_f4e2m1_bf16"}> ({
  ^bb0(%arg174: vector<2xf4E2M1FN>, %arg175: f32):
    %72 = "amdgpu.scaled_ext_packed"(%arg174, %arg175) <{index = 0 : i32}> : (vector<2xf4E2M1FN>, f32) -> vector<2xbf16>
    "func.return"(%72) : (vector<2xbf16>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<8xf4E2M1FN>, vector<4xf8E8M0FNU>) -> (vector<8xf16>, vector<8xbf16>, vector<8xf32>), sym_name = "scaled_ext_packed_matrix_fp4"}> ({
  ^bb0(%arg172: vector<8xf4E2M1FN>, %arg173: vector<4xf8E8M0FNU>):
    %69 = "amdgpu.scaled_ext_packed_matrix"(%arg172, %arg173) <{blockSize = 32 : i32, firstScaleByte = 0 : i32, firstScaleLane = 0 : i32}> : (vector<8xf4E2M1FN>, vector<4xf8E8M0FNU>) -> vector<8xf16>
    %70 = "amdgpu.scaled_ext_packed_matrix"(%arg172, %arg173) <{blockSize = 32 : i32, firstScaleByte = 0 : i32, firstScaleLane = 0 : i32}> : (vector<8xf4E2M1FN>, vector<4xf8E8M0FNU>) -> vector<8xbf16>
    %71 = "amdgpu.scaled_ext_packed_matrix"(%arg172, %arg173) <{blockSize = 32 : i32, firstScaleByte = 0 : i32, firstScaleLane = 0 : i32}> : (vector<8xf4E2M1FN>, vector<4xf8E8M0FNU>) -> vector<8xf32>
    "func.return"(%69, %70, %71) : (vector<8xf16>, vector<8xbf16>, vector<8xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<8xf8E4M3FN>, vector<4xf8E8M0FNU>) -> (vector<8xf16>, vector<8xbf16>, vector<8xf32>), sym_name = "scaled_ext_packed_matrix_fp8"}> ({
  ^bb0(%arg170: vector<8xf8E4M3FN>, %arg171: vector<4xf8E8M0FNU>):
    %66 = "amdgpu.scaled_ext_packed_matrix"(%arg170, %arg171) <{blockSize = 32 : i32, firstScaleByte = 0 : i32, firstScaleLane = 0 : i32}> : (vector<8xf8E4M3FN>, vector<4xf8E8M0FNU>) -> vector<8xf16>
    %67 = "amdgpu.scaled_ext_packed_matrix"(%arg170, %arg171) <{blockSize = 32 : i32, firstScaleByte = 0 : i32, firstScaleLane = 0 : i32}> : (vector<8xf8E4M3FN>, vector<4xf8E8M0FNU>) -> vector<8xbf16>
    %68 = "amdgpu.scaled_ext_packed_matrix"(%arg170, %arg171) <{blockSize = 32 : i32, firstScaleByte = 0 : i32, firstScaleLane = 0 : i32}> : (vector<8xf8E4M3FN>, vector<4xf8E8M0FNU>) -> vector<8xf32>
    "func.return"(%66, %67, %68) : (vector<8xf16>, vector<8xbf16>, vector<8xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<8xf8E5M2>, vector<4xf8E8M0FNU>) -> (vector<8xf16>, vector<8xbf16>, vector<8xf32>), sym_name = "scaled_ext_packed_matrix_bf8"}> ({
  ^bb0(%arg168: vector<8xf8E5M2>, %arg169: vector<4xf8E8M0FNU>):
    %63 = "amdgpu.scaled_ext_packed_matrix"(%arg168, %arg169) <{blockSize = 32 : i32, firstScaleByte = 0 : i32, firstScaleLane = 0 : i32}> : (vector<8xf8E5M2>, vector<4xf8E8M0FNU>) -> vector<8xf16>
    %64 = "amdgpu.scaled_ext_packed_matrix"(%arg168, %arg169) <{blockSize = 32 : i32, firstScaleByte = 0 : i32, firstScaleLane = 0 : i32}> : (vector<8xf8E5M2>, vector<4xf8E8M0FNU>) -> vector<8xbf16>
    %65 = "amdgpu.scaled_ext_packed_matrix"(%arg168, %arg169) <{blockSize = 32 : i32, firstScaleByte = 0 : i32, firstScaleLane = 0 : i32}> : (vector<8xf8E5M2>, vector<4xf8E8M0FNU>) -> vector<8xf32>
    "func.return"(%63, %64, %65) : (vector<8xf16>, vector<8xbf16>, vector<8xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<16xf6E2M3FN>, vector<4xf8E8M0FNU>) -> (vector<16xf16>, vector<16xbf16>, vector<16xf32>), sym_name = "scaled_ext_packed_matrix_fp6"}> ({
  ^bb0(%arg166: vector<16xf6E2M3FN>, %arg167: vector<4xf8E8M0FNU>):
    %60 = "amdgpu.scaled_ext_packed_matrix"(%arg166, %arg167) <{blockSize = 32 : i32, firstScaleByte = 0 : i32, firstScaleLane = 0 : i32}> : (vector<16xf6E2M3FN>, vector<4xf8E8M0FNU>) -> vector<16xf16>
    %61 = "amdgpu.scaled_ext_packed_matrix"(%arg166, %arg167) <{blockSize = 32 : i32, firstScaleByte = 0 : i32, firstScaleLane = 0 : i32}> : (vector<16xf6E2M3FN>, vector<4xf8E8M0FNU>) -> vector<16xbf16>
    %62 = "amdgpu.scaled_ext_packed_matrix"(%arg166, %arg167) <{blockSize = 32 : i32, firstScaleByte = 0 : i32, firstScaleLane = 0 : i32}> : (vector<16xf6E2M3FN>, vector<4xf8E8M0FNU>) -> vector<16xf32>
    "func.return"(%60, %61, %62) : (vector<16xf16>, vector<16xbf16>, vector<16xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<16xf6E3M2FN>, vector<4xf8E8M0FNU>) -> (vector<16xf16>, vector<16xbf16>, vector<16xf32>), sym_name = "scaled_ext_packed_matrix_bf6"}> ({
  ^bb0(%arg164: vector<16xf6E3M2FN>, %arg165: vector<4xf8E8M0FNU>):
    %57 = "amdgpu.scaled_ext_packed_matrix"(%arg164, %arg165) <{blockSize = 32 : i32, firstScaleByte = 0 : i32, firstScaleLane = 0 : i32}> : (vector<16xf6E3M2FN>, vector<4xf8E8M0FNU>) -> vector<16xf16>
    %58 = "amdgpu.scaled_ext_packed_matrix"(%arg164, %arg165) <{blockSize = 32 : i32, firstScaleByte = 0 : i32, firstScaleLane = 0 : i32}> : (vector<16xf6E3M2FN>, vector<4xf8E8M0FNU>) -> vector<16xbf16>
    %59 = "amdgpu.scaled_ext_packed_matrix"(%arg164, %arg165) <{blockSize = 32 : i32, firstScaleByte = 0 : i32, firstScaleLane = 0 : i32}> : (vector<16xf6E3M2FN>, vector<4xf8E8M0FNU>) -> vector<16xf32>
    "func.return"(%57, %58, %59) : (vector<16xf16>, vector<16xbf16>, vector<16xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<2xf32>, f32) -> vector<4xf8E4M3FN>, sym_name = "packed_scaled_trunc_f8e4m3_f32"}> ({
  ^bb0(%arg162: vector<2xf32>, %arg163: f32):
    %56 = "amdgpu.packed_scaled_trunc"(%arg162, %arg163) <{index = 0 : i32}> : (vector<2xf32>, f32) -> vector<4xf8E4M3FN>
    "func.return"(%56) : (vector<4xf8E4M3FN>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<2xf32>, vector<4xf8E4M3FN>, f32) -> vector<4xf8E4M3FN>, sym_name = "packed_scaled_trunc_into_f8e4m3_f32"}> ({
  ^bb0(%arg159: vector<2xf32>, %arg160: vector<4xf8E4M3FN>, %arg161: f32):
    %55 = "amdgpu.packed_scaled_trunc"(%arg159, %arg161, %arg160) <{index = 0 : i32}> : (vector<2xf32>, f32, vector<4xf8E4M3FN>) -> vector<4xf8E4M3FN>
    "func.return"(%55) : (vector<4xf8E4M3FN>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<2xf16>, f32) -> vector<4xf8E4M3FN>, sym_name = "packed_scaled_trunc_f8e4m3_f16"}> ({
  ^bb0(%arg157: vector<2xf16>, %arg158: f32):
    %54 = "amdgpu.packed_scaled_trunc"(%arg157, %arg158) <{index = 0 : i32}> : (vector<2xf16>, f32) -> vector<4xf8E4M3FN>
    "func.return"(%54) : (vector<4xf8E4M3FN>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<2xf16>, vector<4xf8E4M3FN>, f32) -> vector<4xf8E4M3FN>, sym_name = "packed_scaled_trunc_into_f8e4m3_f16"}> ({
  ^bb0(%arg154: vector<2xf16>, %arg155: vector<4xf8E4M3FN>, %arg156: f32):
    %53 = "amdgpu.packed_scaled_trunc"(%arg154, %arg156, %arg155) <{index = 0 : i32}> : (vector<2xf16>, f32, vector<4xf8E4M3FN>) -> vector<4xf8E4M3FN>
    "func.return"(%53) : (vector<4xf8E4M3FN>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<2xbf16>, f32) -> vector<4xf8E4M3FN>, sym_name = "packed_scaled_trunc_f8e4m3_bf16"}> ({
  ^bb0(%arg152: vector<2xbf16>, %arg153: f32):
    %52 = "amdgpu.packed_scaled_trunc"(%arg152, %arg153) <{index = 0 : i32}> : (vector<2xbf16>, f32) -> vector<4xf8E4M3FN>
    "func.return"(%52) : (vector<4xf8E4M3FN>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<2xbf16>, vector<4xf8E4M3FN>, f32) -> vector<4xf8E4M3FN>, sym_name = "packed_scaled_trunc_into_f8e4m3_bf16"}> ({
  ^bb0(%arg149: vector<2xbf16>, %arg150: vector<4xf8E4M3FN>, %arg151: f32):
    %51 = "amdgpu.packed_scaled_trunc"(%arg149, %arg151, %arg150) <{index = 0 : i32}> : (vector<2xbf16>, f32, vector<4xf8E4M3FN>) -> vector<4xf8E4M3FN>
    "func.return"(%51) : (vector<4xf8E4M3FN>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<2xf32>, f32) -> vector<4xf8E5M2>, sym_name = "packed_scaled_trunc_f8e5m2_f32"}> ({
  ^bb0(%arg147: vector<2xf32>, %arg148: f32):
    %50 = "amdgpu.packed_scaled_trunc"(%arg147, %arg148) <{index = 0 : i32}> : (vector<2xf32>, f32) -> vector<4xf8E5M2>
    "func.return"(%50) : (vector<4xf8E5M2>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<2xf32>, vector<4xf8E5M2>, f32) -> vector<4xf8E5M2>, sym_name = "packed_scaled_trunc_into_f8e5m2_f32"}> ({
  ^bb0(%arg144: vector<2xf32>, %arg145: vector<4xf8E5M2>, %arg146: f32):
    %49 = "amdgpu.packed_scaled_trunc"(%arg144, %arg146, %arg145) <{index = 0 : i32}> : (vector<2xf32>, f32, vector<4xf8E5M2>) -> vector<4xf8E5M2>
    "func.return"(%49) : (vector<4xf8E5M2>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<2xf16>, f32) -> vector<4xf8E5M2>, sym_name = "packed_scaled_trunc_f8e5m2_f16"}> ({
  ^bb0(%arg142: vector<2xf16>, %arg143: f32):
    %48 = "amdgpu.packed_scaled_trunc"(%arg142, %arg143) <{index = 0 : i32}> : (vector<2xf16>, f32) -> vector<4xf8E5M2>
    "func.return"(%48) : (vector<4xf8E5M2>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<2xf16>, vector<4xf8E5M2>, f32) -> vector<4xf8E5M2>, sym_name = "packed_scaled_trunc_into_f8e5m2_f16"}> ({
  ^bb0(%arg139: vector<2xf16>, %arg140: vector<4xf8E5M2>, %arg141: f32):
    %47 = "amdgpu.packed_scaled_trunc"(%arg139, %arg141, %arg140) <{index = 0 : i32}> : (vector<2xf16>, f32, vector<4xf8E5M2>) -> vector<4xf8E5M2>
    "func.return"(%47) : (vector<4xf8E5M2>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<2xbf16>, f32) -> vector<4xf8E5M2>, sym_name = "packed_scaled_trunc_f8e5m2_bf16"}> ({
  ^bb0(%arg137: vector<2xbf16>, %arg138: f32):
    %46 = "amdgpu.packed_scaled_trunc"(%arg137, %arg138) <{index = 0 : i32}> : (vector<2xbf16>, f32) -> vector<4xf8E5M2>
    "func.return"(%46) : (vector<4xf8E5M2>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<2xbf16>, vector<4xf8E5M2>, f32) -> vector<4xf8E5M2>, sym_name = "packed_scaled_trunc_into_f8e5m2_bf16"}> ({
  ^bb0(%arg134: vector<2xbf16>, %arg135: vector<4xf8E5M2>, %arg136: f32):
    %45 = "amdgpu.packed_scaled_trunc"(%arg134, %arg136, %arg135) <{index = 0 : i32}> : (vector<2xbf16>, f32, vector<4xf8E5M2>) -> vector<4xf8E5M2>
    "func.return"(%45) : (vector<4xf8E5M2>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<2xf32>, f32) -> vector<8xf4E2M1FN>, sym_name = "packed_scaled_trunc_f4e2m1_f32"}> ({
  ^bb0(%arg132: vector<2xf32>, %arg133: f32):
    %44 = "amdgpu.packed_scaled_trunc"(%arg132, %arg133) <{index = 0 : i32}> : (vector<2xf32>, f32) -> vector<8xf4E2M1FN>
    "func.return"(%44) : (vector<8xf4E2M1FN>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<2xf32>, vector<8xf4E2M1FN>, f32) -> vector<8xf4E2M1FN>, sym_name = "packed_scaled_trunc_into_f4e2m1_f32"}> ({
  ^bb0(%arg129: vector<2xf32>, %arg130: vector<8xf4E2M1FN>, %arg131: f32):
    %43 = "amdgpu.packed_scaled_trunc"(%arg129, %arg131, %arg130) <{index = 0 : i32}> : (vector<2xf32>, f32, vector<8xf4E2M1FN>) -> vector<8xf4E2M1FN>
    "func.return"(%43) : (vector<8xf4E2M1FN>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<2xf16>, f32) -> vector<8xf4E2M1FN>, sym_name = "packed_scaled_trunc_f4e2m1_f16"}> ({
  ^bb0(%arg127: vector<2xf16>, %arg128: f32):
    %42 = "amdgpu.packed_scaled_trunc"(%arg127, %arg128) <{index = 0 : i32}> : (vector<2xf16>, f32) -> vector<8xf4E2M1FN>
    "func.return"(%42) : (vector<8xf4E2M1FN>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<2xf16>, vector<8xf4E2M1FN>, f32) -> vector<8xf4E2M1FN>, sym_name = "packed_scaled_trunc_into_f4e2m1_f16"}> ({
  ^bb0(%arg124: vector<2xf16>, %arg125: vector<8xf4E2M1FN>, %arg126: f32):
    %41 = "amdgpu.packed_scaled_trunc"(%arg124, %arg126, %arg125) <{index = 0 : i32}> : (vector<2xf16>, f32, vector<8xf4E2M1FN>) -> vector<8xf4E2M1FN>
    "func.return"(%41) : (vector<8xf4E2M1FN>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<2xbf16>, f32) -> vector<8xf4E2M1FN>, sym_name = "packed_scaled_trunc_f4e2m1_bf16"}> ({
  ^bb0(%arg122: vector<2xbf16>, %arg123: f32):
    %40 = "amdgpu.packed_scaled_trunc"(%arg122, %arg123) <{index = 0 : i32}> : (vector<2xbf16>, f32) -> vector<8xf4E2M1FN>
    "func.return"(%40) : (vector<8xf4E2M1FN>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<2xbf16>, vector<8xf4E2M1FN>, f32) -> vector<8xf4E2M1FN>, sym_name = "packed_scaled_trunc_into_f4e2m1_bf16"}> ({
  ^bb0(%arg119: vector<2xbf16>, %arg120: vector<8xf4E2M1FN>, %arg121: f32):
    %39 = "amdgpu.packed_scaled_trunc"(%arg119, %arg121, %arg120) <{index = 0 : i32}> : (vector<2xbf16>, f32, vector<8xf4E2M1FN>) -> vector<8xf4E2M1FN>
    "func.return"(%39) : (vector<8xf4E2M1FN>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (memref<8xi32>) -> memref<8xi32, #amdgpu.address_space<fat_raw_buffer>>, sym_name = "fat_raw_buffer_cast_easy"}> ({
  ^bb0(%arg118: memref<8xi32>):
    %38 = "amdgpu.fat_raw_buffer_cast"(%arg118) <{boundsCheck = true, operandSegmentSizes = array<i32: 1, 0, 0>}> : (memref<8xi32>) -> memref<8xi32, #amdgpu.address_space<fat_raw_buffer>>
    "func.return"(%38) : (memref<8xi32, #amdgpu.address_space<fat_raw_buffer>>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (memref<8xi32, strided<[1], offset: ?>>, i64, i14) -> memref<8xi32, #amdgpu.address_space<fat_raw_buffer>>, sym_name = "fat_raw_buffer_cast"}> ({
  ^bb0(%arg115: memref<8xi32, strided<[1], offset: ?>>, %arg116: i64, %arg117: i14):
    %37 = "amdgpu.fat_raw_buffer_cast"(%arg115, %arg116, %arg117) <{boundsCheck = false, operandSegmentSizes = array<i32: 1, 1, 1>, resetOffset}> : (memref<8xi32, strided<[1], offset: ?>>, i64, i14) -> memref<8xi32, #amdgpu.address_space<fat_raw_buffer>>
    "func.return"(%37) : (memref<8xi32, #amdgpu.address_space<fat_raw_buffer>>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (memref<?xi32, strided<[1], offset: ?>>) -> memref<?xi32, #amdgpu.address_space<fat_raw_buffer>>, sym_name = "fat_raw_buffer_cast_dynamic_1d_reset_offset"}> ({
  ^bb0(%arg114: memref<?xi32, strided<[1], offset: ?>>):
    %36 = "amdgpu.fat_raw_buffer_cast"(%arg114) <{boundsCheck = true, operandSegmentSizes = array<i32: 1, 0, 0>, resetOffset}> : (memref<?xi32, strided<[1], offset: ?>>) -> memref<?xi32, #amdgpu.address_space<fat_raw_buffer>>
    "func.return"(%36) : (memref<?xi32, #amdgpu.address_space<fat_raw_buffer>>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (memref<i32, strided<[], offset: ?>>) -> memref<i32, #amdgpu.address_space<fat_raw_buffer>>, sym_name = "fat_raw_buffer_cast_dynamic_0d_reset_offset"}> ({
  ^bb0(%arg113: memref<i32, strided<[], offset: ?>>):
    %35 = "amdgpu.fat_raw_buffer_cast"(%arg113) <{boundsCheck = true, operandSegmentSizes = array<i32: 1, 0, 0>, resetOffset}> : (memref<i32, strided<[], offset: ?>>) -> memref<i32, #amdgpu.address_space<fat_raw_buffer>>
    "func.return"(%35) : (memref<i32, #amdgpu.address_space<fat_raw_buffer>>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (memref<4x4xi32, strided<[4, 1], offset: ?>>) -> memref<4x4xi32, #amdgpu.address_space<fat_raw_buffer>>, sym_name = "fat_raw_buffer_cast_static_shape_2d_reset_offset"}> ({
  ^bb0(%arg112: memref<4x4xi32, strided<[4, 1], offset: ?>>):
    %34 = "amdgpu.fat_raw_buffer_cast"(%arg112) <{boundsCheck = true, operandSegmentSizes = array<i32: 1, 0, 0>, resetOffset}> : (memref<4x4xi32, strided<[4, 1], offset: ?>>) -> memref<4x4xi32, #amdgpu.address_space<fat_raw_buffer>>
    "func.return"(%34) : (memref<4x4xi32, #amdgpu.address_space<fat_raw_buffer>>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (memref<?x?xi32, strided<[?, 1], offset: ?>>) -> memref<?x?xi32, strided<[?, 1]>, #amdgpu.address_space<fat_raw_buffer>>, sym_name = "fat_raw_buffer_cast_dynamic_2d_reset_offset"}> ({
  ^bb0(%arg111: memref<?x?xi32, strided<[?, 1], offset: ?>>):
    %33 = "amdgpu.fat_raw_buffer_cast"(%arg111) <{boundsCheck = true, operandSegmentSizes = array<i32: 1, 0, 0>, resetOffset}> : (memref<?x?xi32, strided<[?, 1], offset: ?>>) -> memref<?x?xi32, strided<[?, 1]>, #amdgpu.address_space<fat_raw_buffer>>
    "func.return"(%33) : (memref<?x?xi32, strided<[?, 1]>, #amdgpu.address_space<fat_raw_buffer>>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (memref<4x4xi32, strided<[8, 1], offset: ?>>) -> memref<4x4xi32, strided<[8, 1]>, #amdgpu.address_space<fat_raw_buffer>>, sym_name = "fat_raw_buffer_cast_noncontiguous_2d_reset_offset"}> ({
  ^bb0(%arg110: memref<4x4xi32, strided<[8, 1], offset: ?>>):
    %32 = "amdgpu.fat_raw_buffer_cast"(%arg110) <{boundsCheck = true, operandSegmentSizes = array<i32: 1, 0, 0>, resetOffset}> : (memref<4x4xi32, strided<[8, 1], offset: ?>>) -> memref<4x4xi32, strided<[8, 1]>, #amdgpu.address_space<fat_raw_buffer>>
    "func.return"(%32) : (memref<4x4xi32, strided<[8, 1]>, #amdgpu.address_space<fat_raw_buffer>>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (memref<128xf32>, i32, i32) -> f32, sym_name = "raw_buffer_load_f32_from_rank_1"}> ({
  ^bb0(%arg107: memref<128xf32>, %arg108: i32, %arg109: i32):
    %31 = "amdgpu.raw_buffer_load"(%arg107, %arg109, %arg108) <{boundsCheck = true, indexOffset = 1 : i32, operandSegmentSizes = array<i32: 1, 1, 1>}> : (memref<128xf32>, i32, i32) -> f32
    "func.return"(%31) : (f32) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (memref<128x64x32x16xf32>, i32, i32, i32, i32, i32) -> f32, sym_name = "raw_buffer_load_f32_from_rank_4"}> ({
  ^bb0(%arg101: memref<128x64x32x16xf32>, %arg102: i32, %arg103: i32, %arg104: i32, %arg105: i32, %arg106: i32):
    %30 = "amdgpu.raw_buffer_load"(%arg101, %arg103, %arg104, %arg105, %arg106, %arg102) <{boundsCheck = true, indexOffset = 1 : i32, operandSegmentSizes = array<i32: 1, 4, 1>}> : (memref<128x64x32x16xf32>, i32, i32, i32, i32, i32) -> f32
    "func.return"(%30) : (f32) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (memref<f32>) -> f32, sym_name = "raw_buffer_load_scalar"}> ({
  ^bb0(%arg100: memref<f32>):
    %29 = "amdgpu.raw_buffer_load"(%arg100) <{boundsCheck = true, indexOffset = 1 : i32, operandSegmentSizes = array<i32: 1, 0, 0>}> : (memref<f32>) -> f32
    "func.return"(%29) : (f32) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (memref<128x64x32x16xf32>, i32, i32, i32, i32, i32) -> vector<4xf32>, sym_name = "raw_buffer_load_4xf32_from_rank_4"}> ({
  ^bb0(%arg94: memref<128x64x32x16xf32>, %arg95: i32, %arg96: i32, %arg97: i32, %arg98: i32, %arg99: i32):
    %28 = "amdgpu.raw_buffer_load"(%arg94, %arg96, %arg97, %arg98, %arg99, %arg95) <{boundsCheck = true, indexOffset = 1 : i32, operandSegmentSizes = array<i32: 1, 4, 1>}> : (memref<128x64x32x16xf32>, i32, i32, i32, i32, i32) -> vector<4xf32>
    "func.return"(%28) : (vector<4xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (f32, memref<128xf32>, i32, i32) -> (), sym_name = "raw_buffer_store_f32_to_rank_1"}> ({
  ^bb0(%arg90: f32, %arg91: memref<128xf32>, %arg92: i32, %arg93: i32):
    "amdgpu.raw_buffer_store"(%arg90, %arg91, %arg93, %arg92) <{boundsCheck = true, indexOffset = 1 : i32, operandSegmentSizes = array<i32: 1, 1, 1, 1>}> : (f32, memref<128xf32>, i32, i32) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (f32, memref<128x64x32x16xf32>, i32, i32, i32, i32, i32) -> (), sym_name = "raw_buffer_store_f32_to_rank_4"}> ({
  ^bb0(%arg83: f32, %arg84: memref<128x64x32x16xf32>, %arg85: i32, %arg86: i32, %arg87: i32, %arg88: i32, %arg89: i32):
    "amdgpu.raw_buffer_store"(%arg83, %arg84, %arg86, %arg87, %arg88, %arg89, %arg85) <{boundsCheck = true, indexOffset = 1 : i32, operandSegmentSizes = array<i32: 1, 1, 4, 1>}> : (f32, memref<128x64x32x16xf32>, i32, i32, i32, i32, i32) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<4xf32>, memref<128x64x32x16xf32>, i32, i32, i32, i32, i32) -> (), sym_name = "raw_buffer_store_4xf32_to_rank_4"}> ({
  ^bb0(%arg76: vector<4xf32>, %arg77: memref<128x64x32x16xf32>, %arg78: i32, %arg79: i32, %arg80: i32, %arg81: i32, %arg82: i32):
    "amdgpu.raw_buffer_store"(%arg76, %arg77, %arg79, %arg80, %arg81, %arg82, %arg78) <{boundsCheck = true, indexOffset = 1 : i32, operandSegmentSizes = array<i32: 1, 1, 4, 1>}> : (vector<4xf32>, memref<128x64x32x16xf32>, i32, i32, i32, i32, i32) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (f32, memref<f32>) -> (), sym_name = "raw_buffer_store_scalar"}> ({
  ^bb0(%arg74: f32, %arg75: memref<f32>):
    "amdgpu.raw_buffer_store"(%arg74, %arg75) <{boundsCheck = true, indexOffset = 1 : i32, operandSegmentSizes = array<i32: 1, 1, 0, 0>}> : (f32, memref<f32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (f32, memref<128xf32>, i32, i32) -> (), sym_name = "raw_buffer_atomic_fadd_f32_to_rank_1"}> ({
  ^bb0(%arg70: f32, %arg71: memref<128xf32>, %arg72: i32, %arg73: i32):
    "amdgpu.raw_buffer_atomic_fadd"(%arg70, %arg71, %arg73, %arg72) <{boundsCheck = true, indexOffset = 1 : i32, operandSegmentSizes = array<i32: 1, 1, 1, 1>}> : (f32, memref<128xf32>, i32, i32) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (f32, memref<128x64x32x16xf32>, i32, i32, i32, i32, i32) -> (), sym_name = "raw_buffer_atomic_fadd_f32_to_rank_4"}> ({
  ^bb0(%arg63: f32, %arg64: memref<128x64x32x16xf32>, %arg65: i32, %arg66: i32, %arg67: i32, %arg68: i32, %arg69: i32):
    "amdgpu.raw_buffer_atomic_fadd"(%arg63, %arg64, %arg66, %arg67, %arg68, %arg69, %arg65) <{boundsCheck = true, indexOffset = 1 : i32, operandSegmentSizes = array<i32: 1, 1, 4, 1>}> : (f32, memref<128x64x32x16xf32>, i32, i32, i32, i32, i32) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (f32, f32, memref<128x64x32x16xf32>, i32, i32, i32, i32, i32) -> (), sym_name = "raw_buffer_atomic_cmpswap_f32"}> ({
  ^bb0(%arg55: f32, %arg56: f32, %arg57: memref<128x64x32x16xf32>, %arg58: i32, %arg59: i32, %arg60: i32, %arg61: i32, %arg62: i32):
    %27 = "amdgpu.raw_buffer_atomic_cmpswap"(%arg55, %arg56, %arg57, %arg59, %arg60, %arg61, %arg62, %arg58) <{boundsCheck = true, indexOffset = 1 : i32, operandSegmentSizes = array<i32: 1, 1, 1, 4, 1>}> : (f32, f32, memref<128x64x32x16xf32>, i32, i32, i32, i32, i32) -> f32
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "lds_barrier"}> ({
    "amdgpu.lds_barrier"() : () -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "sched_barrier"}> ({
    "amdgpu.sched_barrier"() <{opts = #amdgpu.sched_barrier_opt<none>}> : () -> ()
    "amdgpu.sched_barrier"() <{opts = #amdgpu.sched_barrier_opt<valu|all_vmem>}> : () -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<4xf16>, vector<4xf32>) -> vector<4xf32>, sym_name = "mfma"}> ({
  ^bb0(%arg53: vector<4xf16>, %arg54: vector<4xf32>):
    %26 = "amdgpu.mfma"(%arg53, %arg53, %arg54) <{abid = 0 : i32, blgp = #amdgpu<mfma_perm_b none>, blocks = 1 : i32, cbsz = 0 : i32, k = 16 : i32, m = 16 : i32, n = 16 : i32}> : (vector<4xf16>, vector<4xf16>, vector<4xf32>) -> vector<4xf32>
    "func.return"(%26) : (vector<4xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (f32, vector<32xf32>) -> vector<32xf32>, sym_name = "mfma_with_blocks"}> ({
  ^bb0(%arg51: f32, %arg52: vector<32xf32>):
    %25 = "amdgpu.mfma"(%arg51, %arg51, %arg52) <{abid = 1 : i32, blgp = #amdgpu<mfma_perm_b bcast_second_32>, blocks = 2 : i32, cbsz = 1 : i32, k = 1 : i32, m = 32 : i32, n = 32 : i32}> : (f32, f32, vector<32xf32>) -> vector<32xf32>
    "func.return"(%25) : (vector<32xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<16xf16>, vector<8xf16>) -> vector<8xf16>, sym_name = "wmma_f16_16x16x16_f16"}> ({
  ^bb0(%arg49: vector<16xf16>, %arg50: vector<8xf16>):
    %24 = "amdgpu.wmma"(%arg49, %arg49, %arg50) <{k = 16 : i32, m = 16 : i32, n = 16 : i32, subwordOffset = 0 : i32}> : (vector<16xf16>, vector<16xf16>, vector<8xf16>) -> vector<8xf16>
    "func.return"(%24) : (vector<8xf16>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<16xi4>, vector<8xi32>) -> vector<8xi32>, sym_name = "wmma_i32_16x16x32_i4"}> ({
  ^bb0(%arg47: vector<16xi4>, %arg48: vector<8xi32>):
    %23 = "amdgpu.wmma"(%arg47, %arg47, %arg48) <{k = 32 : i32, m = 16 : i32, n = 16 : i32, subwordOffset = 0 : i32}> : (vector<16xi4>, vector<16xi4>, vector<8xi32>) -> vector<8xi32>
    "func.return"(%23) : (vector<8xi32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<2xf32>, vector<8xf32>) -> vector<8xf32>, sym_name = "wmma_f32_16x16x4_f32"}> ({
  ^bb0(%arg45: vector<2xf32>, %arg46: vector<8xf32>):
    %22 = "amdgpu.wmma"(%arg45, %arg45, %arg46) <{k = 4 : i32, m = 16 : i32, n = 16 : i32, subwordOffset = 0 : i32}> : (vector<2xf32>, vector<2xf32>, vector<8xf32>) -> vector<8xf32>
    "func.return"(%22) : (vector<8xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<32xf8E4M3FN>, vector<8xf32>) -> vector<8xf32>, sym_name = "wmma_f32_16x16x64_f8"}> ({
  ^bb0(%arg43: vector<32xf8E4M3FN>, %arg44: vector<8xf32>):
    %21 = "amdgpu.wmma"(%arg43, %arg43, %arg44) <{k = 64 : i32, m = 16 : i32, n = 16 : i32, subwordOffset = 0 : i32}> : (vector<32xf8E4M3FN>, vector<32xf8E4M3FN>, vector<8xf32>) -> vector<8xf32>
    "func.return"(%21) : (vector<8xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<32xf8E5M2>, vector<8xf32>) -> vector<8xf32>, sym_name = "wmma_f32_16x16x64_bf8"}> ({
  ^bb0(%arg41: vector<32xf8E5M2>, %arg42: vector<8xf32>):
    %20 = "amdgpu.wmma"(%arg41, %arg41, %arg42) <{k = 64 : i32, m = 16 : i32, n = 16 : i32, subwordOffset = 0 : i32}> : (vector<32xf8E5M2>, vector<32xf8E5M2>, vector<8xf32>) -> vector<8xf32>
    "func.return"(%20) : (vector<8xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<32xf8E5M2>, vector<8xf16>) -> vector<8xf16>, sym_name = "wmma_f16_16x16x64_bf8"}> ({
  ^bb0(%arg39: vector<32xf8E5M2>, %arg40: vector<8xf16>):
    %19 = "amdgpu.wmma"(%arg39, %arg39, %arg40) <{k = 64 : i32, m = 16 : i32, n = 16 : i32, subwordOffset = 0 : i32}> : (vector<32xf8E5M2>, vector<32xf8E5M2>, vector<8xf16>) -> vector<8xf16>
    "func.return"(%19) : (vector<8xf16>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<32xf8E4M3FN>, vector<8xf16>) -> vector<8xf16>, sym_name = "wmma_f16_16x16x64_f8"}> ({
  ^bb0(%arg37: vector<32xf8E4M3FN>, %arg38: vector<8xf16>):
    %18 = "amdgpu.wmma"(%arg37, %arg37, %arg38) <{k = 64 : i32, m = 16 : i32, n = 16 : i32, subwordOffset = 0 : i32}> : (vector<32xf8E4M3FN>, vector<32xf8E4M3FN>, vector<8xf16>) -> vector<8xf16>
    "func.return"(%18) : (vector<8xf16>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (f32) -> f32, sym_name = "swizzle_bitmode"}> ({
  ^bb0(%arg36: f32):
    %17 = "amdgpu.swizzle_bitmode"(%arg36) <{and_mask = 1 : i32, or_mask = 2 : i32, xor_mask = 4 : i32}> : (f32) -> f32
    "func.return"(%17) : (f32) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (f32) -> f32, sym_name = "permlane16_swap"}> ({
  ^bb0(%arg35: f32):
    %16 = "amdgpu.permlane_swap"(%arg35) <{bound_ctrl = false, fetch_inactive = false, row_length = 16 : i32}> : (f32) -> f32
    "func.return"(%16) : (f32) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (f32) -> f32, sym_name = "permlane32_swap"}> ({
  ^bb0(%arg34: f32):
    %15 = "amdgpu.permlane_swap"(%arg34) <{bound_ctrl = false, fetch_inactive = false, row_length = 32 : i32}> : (f32) -> f32
    "func.return"(%15) : (f32) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (f8E8M0FNU, vector<32xf6E2M3FN>, vector<16xf32>) -> vector<16xf32>, sym_name = "scaled_mfma"}> ({
  ^bb0(%arg31: f8E8M0FNU, %arg32: vector<32xf6E2M3FN>, %arg33: vector<16xf32>):
    %14 = "amdgpu.scaled_mfma"(%arg32, %arg32, %arg33, %arg31, %arg31) <{k = 64 : i32, m = 32 : i32, n = 32 : i32, scalesIdxA = 0 : i32, scalesIdxB = 1 : i32}> : (vector<32xf6E2M3FN>, vector<32xf6E2M3FN>, vector<16xf32>, f8E8M0FNU, f8E8M0FNU) -> vector<16xf32>
    "func.return"(%14) : (vector<16xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (index, index, memref<128x32xf16, 3>) -> vector<4xf16>, sym_name = "transpose_load"}> ({
  ^bb0(%arg28: index, %arg29: index, %arg30: memref<128x32xf16, 3>):
    %13 = "amdgpu.transpose_load"(%arg30, %arg28, %arg29) : (memref<128x32xf16, 3>, index, index) -> vector<4xf16>
    "func.return"(%13) : (vector<4xf16>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (index, index, memref<32xf16>, memref<32x32xf16>, memref<32xf16, #gpu.address_space<workgroup>>, memref<32x32xf16, #gpu.address_space<workgroup>>, memref<?x?xf16, strided<[?, 1]>, #gpu.address_space<workgroup>>) -> (), sym_name = "gather_to_lds"}> ({
  ^bb0(%arg21: index, %arg22: index, %arg23: memref<32xf16>, %arg24: memref<32x32xf16>, %arg25: memref<32xf16, #gpu.address_space<workgroup>>, %arg26: memref<32x32xf16, #gpu.address_space<workgroup>>, %arg27: memref<?x?xf16, strided<[?, 1]>, #gpu.address_space<workgroup>>):
    "amdgpu.gather_to_lds"(%arg24, %arg21, %arg22, %arg26, %arg21, %arg22) <{operandSegmentSizes = array<i32: 1, 2, 1, 2>, transferType = vector<2xf16>}> : (memref<32x32xf16>, index, index, memref<32x32xf16, #gpu.address_space<workgroup>>, index, index) -> ()
    "amdgpu.gather_to_lds"(%arg24, %arg21, %arg22, %arg25, %arg21) <{operandSegmentSizes = array<i32: 1, 2, 1, 1>, transferType = vector<2xf16>}> : (memref<32x32xf16>, index, index, memref<32xf16, #gpu.address_space<workgroup>>, index) -> ()
    "amdgpu.gather_to_lds"(%arg23, %arg21, %arg26, %arg21, %arg22) <{operandSegmentSizes = array<i32: 1, 1, 1, 2>, transferType = vector<2xf16>}> : (memref<32xf16>, index, memref<32x32xf16, #gpu.address_space<workgroup>>, index, index) -> ()
    "amdgpu.gather_to_lds"(%arg23, %arg21, %arg27, %arg21, %arg22) <{operandSegmentSizes = array<i32: 1, 1, 1, 2>, transferType = vector<2xf16>}> : (memref<32xf16>, index, memref<?x?xf16, strided<[?, 1]>, #gpu.address_space<workgroup>>, index, index) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (memref<f16>, memref<f16, #gpu.address_space<workgroup>>) -> (), sym_name = "gather_to_lds_0d"}> ({
  ^bb0(%arg19: memref<f16>, %arg20: memref<f16, #gpu.address_space<workgroup>>):
    "amdgpu.gather_to_lds"(%arg19, %arg20) <{operandSegmentSizes = array<i32: 1, 0, 1, 0>, transferType = vector<2xf16>}> : (memref<f16>, memref<f16, #gpu.address_space<workgroup>>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "memory_counter_wait"}> ({
    "amdgpu.memory_counter_wait"() <{ds = 3 : i32, exp = 4 : i32, load = 1 : i32, store = 2 : i32, tensor = 5 : i32}> : () -> ()
    "amdgpu.memory_counter_wait"() <{ds = 3 : i32, exp = 1 : i32, load = 4 : i32, store = 2 : i32, tensor = 0 : i32}> : () -> ()
    "amdgpu.memory_counter_wait"() <{load = 1 : i32}> : () -> ()
    "amdgpu.memory_counter_wait"() <{store = 2 : i32}> : () -> ()
    "amdgpu.memory_counter_wait"() <{ds = 3 : i32}> : () -> ()
    "amdgpu.memory_counter_wait"() <{exp = 4 : i32}> : () -> ()
    "amdgpu.memory_counter_wait"() <{tensor = 5 : i32}> : () -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (index, memref<8xi32>, memref<8xi32, #gpu.address_space<workgroup>>) -> (), sym_name = "make_dma_base"}> ({
  ^bb0(%arg16: index, %arg17: memref<8xi32>, %arg18: memref<8xi32, #gpu.address_space<workgroup>>):
    %12 = "amdgpu.make_dma_base"(%arg17, %arg16, %arg18, %arg16) <{operandSegmentSizes = array<i32: 1, 1, 1, 1>}> : (memref<8xi32>, index, memref<8xi32, #gpu.address_space<workgroup>>, index) -> !amdgpu.tdm_base<i32>
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (!amdgpu.tdm_base<i32>, vector<16xi1>, i1, memref<8xi32, #gpu.address_space<workgroup>>, index, i32) -> (), sym_name = "make_dma_descriptor"}> ({
  ^bb0(%arg10: !amdgpu.tdm_base<i32>, %arg11: vector<16xi1>, %arg12: i1, %arg13: memref<8xi32, #gpu.address_space<workgroup>>, %arg14: index, %arg15: i32):
    %6 = "amdgpu.make_dma_descriptor"(%arg10) <{global_static_sizes = array<i64: 64, 64>, global_static_strides = array<i64: 64, 1>, operandSegmentSizes = array<i32: 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0>, shared_static_sizes = array<i64: 64, 64>}> : (!amdgpu.tdm_base<i32>) -> !amdgpu.tdm_descriptor
    %7 = "amdgpu.make_dma_descriptor"(%arg10, %arg15, %arg15) <{global_static_sizes = array<i64: 64, 64>, global_static_strides = array<i64: 64, 1>, operandSegmentSizes = array<i32: 1, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0>, shared_static_sizes = array<i64: 64, 64>}> : (!amdgpu.tdm_base<i32>, i32, i32) -> !amdgpu.tdm_descriptor
    %8 = "amdgpu.make_dma_descriptor"(%arg10, %arg11) <{global_static_sizes = array<i64: 64, 64>, global_static_strides = array<i64: 64, 1>, operandSegmentSizes = array<i32: 1, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0>, shared_static_sizes = array<i64: 64, 64>}> : (!amdgpu.tdm_base<i32>, vector<16xi1>) -> !amdgpu.tdm_descriptor
    %9 = "amdgpu.make_dma_descriptor"(%arg10, %arg11, %arg12) <{global_static_sizes = array<i64: 64, 64>, global_static_strides = array<i64: 64, 1>, operandSegmentSizes = array<i32: 1, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0>, shared_static_sizes = array<i64: 64, 64>}> : (!amdgpu.tdm_base<i32>, vector<16xi1>, i1) -> !amdgpu.tdm_descriptor
    %10 = "amdgpu.make_dma_descriptor"(%arg10, %arg13, %arg14) <{global_static_sizes = array<i64: 64, 64>, global_static_strides = array<i64: 64, 1>, operandSegmentSizes = array<i32: 1, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0>, shared_static_sizes = array<i64: 64, 64>}> : (!amdgpu.tdm_base<i32>, memref<8xi32, #gpu.address_space<workgroup>>, index) -> !amdgpu.tdm_descriptor
    %11 = "amdgpu.make_dma_descriptor"(%arg10, %arg14, %arg15, %arg14) <{global_static_sizes = array<i64: 64, 64>, global_static_strides = array<i64: 64, 1>, operandSegmentSizes = array<i32: 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1>, shared_static_sizes = array<i64: 64, 64>}> : (!amdgpu.tdm_base<i32>, index, i32, index) -> !amdgpu.tdm_descriptor
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<64xf8E4M3FN>, vector<64xf6E3M2FN>, vector<64xf6E2M3FN>, vector<128xf4E2M1FN>, vector<64xf4E2M1FN>, vector<8xf32>, vector<16xf32>, vector<4xf8E8M0FNU>, vector<8xf8E8M0FNU>, vector<4xf8E4M3FN>) -> (), sym_name = "wmma_scale"}> ({
  ^bb0(%arg0: vector<64xf8E4M3FN>, %arg1: vector<64xf6E3M2FN>, %arg2: vector<64xf6E2M3FN>, %arg3: vector<128xf4E2M1FN>, %arg4: vector<64xf4E2M1FN>, %arg5: vector<8xf32>, %arg6: vector<16xf32>, %arg7: vector<4xf8E8M0FNU>, %arg8: vector<8xf8E8M0FNU>, %arg9: vector<4xf8E4M3FN>):
    %0 = "amdgpu.scaled_wmma"(%arg0, %arg0, %arg5, %arg7, %arg7) <{a_first_scale_lane = 0 : i32, b_first_scale_lane = 0 : i32, k = 128 : i32, m = 16 : i32, n = 16 : i32}> : (vector<64xf8E4M3FN>, vector<64xf8E4M3FN>, vector<8xf32>, vector<4xf8E8M0FNU>, vector<4xf8E8M0FNU>) -> vector<8xf32>
    %1 = "amdgpu.scaled_wmma"(%arg1, %arg1, %arg5, %arg7, %arg7) <{a_first_scale_lane = 0 : i32, b_first_scale_lane = 0 : i32, k = 128 : i32, m = 16 : i32, n = 16 : i32}> : (vector<64xf6E3M2FN>, vector<64xf6E3M2FN>, vector<8xf32>, vector<4xf8E8M0FNU>, vector<4xf8E8M0FNU>) -> vector<8xf32>
    %2 = "amdgpu.scaled_wmma"(%arg2, %arg2, %arg5, %arg7, %arg7) <{a_first_scale_lane = 0 : i32, b_first_scale_lane = 0 : i32, k = 128 : i32, m = 16 : i32, n = 16 : i32}> : (vector<64xf6E2M3FN>, vector<64xf6E2M3FN>, vector<8xf32>, vector<4xf8E8M0FNU>, vector<4xf8E8M0FNU>) -> vector<8xf32>
    %3 = "amdgpu.scaled_wmma"(%arg4, %arg2, %arg5, %arg9, %arg7) <{a_first_scale_lane = 0 : i32, b_first_scale_lane = 0 : i32, k = 128 : i32, m = 16 : i32, n = 16 : i32}> : (vector<64xf4E2M1FN>, vector<64xf6E2M3FN>, vector<8xf32>, vector<4xf8E4M3FN>, vector<4xf8E8M0FNU>) -> vector<8xf32>
    %4 = "amdgpu.scaled_wmma"(%arg0, %arg0, %arg5, %arg8, %arg8) <{a_first_scale_lane = 0 : i32, b_first_scale_lane = 0 : i32, k = 128 : i32, m = 16 : i32, n = 16 : i32}> : (vector<64xf8E4M3FN>, vector<64xf8E4M3FN>, vector<8xf32>, vector<8xf8E8M0FNU>, vector<8xf8E8M0FNU>) -> vector<8xf32>
    %5 = "amdgpu.scaled_wmma"(%arg3, %arg4, %arg6, %arg9, %arg9) <{a_first_scale_lane = 0 : i32, b_first_scale_lane = 0 : i32, k = 128 : i32, m = 32 : i32, n = 16 : i32}> : (vector<128xf4E2M1FN>, vector<64xf4E2M1FN>, vector<16xf32>, vector<4xf8E4M3FN>, vector<4xf8E4M3FN>) -> vector<16xf32>
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

