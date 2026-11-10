"builtin.module"() ({
  "func.func"() <{function_type = (vector<4xf8E4M3FNUZ>) -> f32, sym_name = "ext_packed_fp8_s"}> ({
  ^bb0(%arg292: vector<4xf8E4M3FNUZ>):
    %135 = "amdgpu.ext_packed_fp8"(%arg292) <{index = 0 : i32}> : (vector<4xf8E4M3FNUZ>) -> f32
    "func.return"(%135) : (f32) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<4xf8E4M3FNUZ>) -> vector<2xf32>, sym_name = "ext_packed_fp8_v"}> ({
  ^bb0(%arg291: vector<4xf8E4M3FNUZ>):
    %134 = "amdgpu.ext_packed_fp8"(%arg291) <{index = 0 : i32}> : (vector<4xf8E4M3FNUZ>) -> vector<2xf32>
    "func.return"(%134) : (vector<2xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (f32, f32, vector<4xf8E5M2FNUZ>, i32) -> vector<4xf8E5M2FNUZ>, sym_name = "packed_trunc_2xfp8"}> ({
  ^bb0(%arg287: f32, %arg288: f32, %arg289: vector<4xf8E5M2FNUZ>, %arg290: i32):
    %133 = "amdgpu.packed_trunc_2xfp8"(%arg287, %arg288, %arg289) <{operandSegmentSizes = array<i32: 1, 1, 1>, wordIndex = 1 : i32}> : (f32, f32, vector<4xf8E5M2FNUZ>) -> vector<4xf8E5M2FNUZ>
    "func.return"(%133) : (vector<4xf8E5M2FNUZ>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (f32, i32, vector<4xf8E5M2FNUZ>) -> vector<4xf8E5M2FNUZ>, sym_name = "packed_stoch_round_fp8"}> ({
  ^bb0(%arg284: f32, %arg285: i32, %arg286: vector<4xf8E5M2FNUZ>):
    %132 = "amdgpu.packed_stoch_round_fp8"(%arg284, %arg285, %arg286) <{storeIndex = 2 : i32}> : (f32, i32, vector<4xf8E5M2FNUZ>) -> vector<4xf8E5M2FNUZ>
    "func.return"(%132) : (vector<4xf8E5M2FNUZ>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<4xf8E4M3FN>, f32) -> vector<2xf32>, sym_name = "scaled_ext_full_f8e4m3_f32"}> ({
  ^bb0(%arg282: vector<4xf8E4M3FN>, %arg283: f32):
    %131 = "amdgpu.scaled_ext_packed"(%arg282, %arg283) <{index = 0 : i32}> : (vector<4xf8E4M3FN>, f32) -> vector<2xf32>
    "func.return"(%131) : (vector<2xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<4xf8E4M3FN>, f32) -> vector<2xf16>, sym_name = "scaled_ext_full_f8e4m3_f16"}> ({
  ^bb0(%arg280: vector<4xf8E4M3FN>, %arg281: f32):
    %130 = "amdgpu.scaled_ext_packed"(%arg280, %arg281) <{index = 0 : i32}> : (vector<4xf8E4M3FN>, f32) -> vector<2xf16>
    "func.return"(%130) : (vector<2xf16>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<4xf8E4M3FN>, f32) -> vector<2xbf16>, sym_name = "scaled_ext_full_f8e4m3_bf16"}> ({
  ^bb0(%arg278: vector<4xf8E4M3FN>, %arg279: f32):
    %129 = "amdgpu.scaled_ext_packed"(%arg278, %arg279) <{index = 0 : i32}> : (vector<4xf8E4M3FN>, f32) -> vector<2xbf16>
    "func.return"(%129) : (vector<2xbf16>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<2xf8E4M3FN>, f32) -> vector<2xf32>, sym_name = "scaled_ext_half_f8e4m3_f32"}> ({
  ^bb0(%arg276: vector<2xf8E4M3FN>, %arg277: f32):
    %128 = "amdgpu.scaled_ext_packed"(%arg276, %arg277) <{index = 0 : i32}> : (vector<2xf8E4M3FN>, f32) -> vector<2xf32>
    "func.return"(%128) : (vector<2xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<2xf8E4M3FN>, f32) -> vector<2xf16>, sym_name = "scaled_ext_half_f8e4m3_f16"}> ({
  ^bb0(%arg274: vector<2xf8E4M3FN>, %arg275: f32):
    %127 = "amdgpu.scaled_ext_packed"(%arg274, %arg275) <{index = 0 : i32}> : (vector<2xf8E4M3FN>, f32) -> vector<2xf16>
    "func.return"(%127) : (vector<2xf16>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<2xf8E4M3FN>, f32) -> vector<2xbf16>, sym_name = "scaled_ext_half_f8e4m3_bf16"}> ({
  ^bb0(%arg272: vector<2xf8E4M3FN>, %arg273: f32):
    %126 = "amdgpu.scaled_ext_packed"(%arg272, %arg273) <{index = 0 : i32}> : (vector<2xf8E4M3FN>, f32) -> vector<2xbf16>
    "func.return"(%126) : (vector<2xbf16>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<2xf8E4M3FN>, f32) -> vector<2xf32>, sym_name = "scaled_ext_scalar_f8e4m3_f32"}> ({
  ^bb0(%arg270: vector<2xf8E4M3FN>, %arg271: f32):
    %125 = "amdgpu.scaled_ext_packed"(%arg270, %arg271) <{index = 0 : i32}> : (vector<2xf8E4M3FN>, f32) -> vector<2xf32>
    "func.return"(%125) : (vector<2xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<2xf8E4M3FN>, f32) -> vector<2xf16>, sym_name = "scaled_ext_scalar_f8e4m3_f16"}> ({
  ^bb0(%arg268: vector<2xf8E4M3FN>, %arg269: f32):
    %124 = "amdgpu.scaled_ext_packed"(%arg268, %arg269) <{index = 0 : i32}> : (vector<2xf8E4M3FN>, f32) -> vector<2xf16>
    "func.return"(%124) : (vector<2xf16>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<2xf8E4M3FN>, f32) -> vector<2xbf16>, sym_name = "scaled_ext_scalar_f8e4m3_bf16"}> ({
  ^bb0(%arg266: vector<2xf8E4M3FN>, %arg267: f32):
    %123 = "amdgpu.scaled_ext_packed"(%arg266, %arg267) <{index = 0 : i32}> : (vector<2xf8E4M3FN>, f32) -> vector<2xbf16>
    "func.return"(%123) : (vector<2xbf16>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<4xf8E5M2>, f32) -> vector<2xf32>, sym_name = "scaled_ext_full_f8e5m2_f32"}> ({
  ^bb0(%arg264: vector<4xf8E5M2>, %arg265: f32):
    %122 = "amdgpu.scaled_ext_packed"(%arg264, %arg265) <{index = 0 : i32}> : (vector<4xf8E5M2>, f32) -> vector<2xf32>
    "func.return"(%122) : (vector<2xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<4xf8E5M2>, f32) -> vector<2xf16>, sym_name = "scaled_ext_full_f8e5m2_f16"}> ({
  ^bb0(%arg262: vector<4xf8E5M2>, %arg263: f32):
    %121 = "amdgpu.scaled_ext_packed"(%arg262, %arg263) <{index = 0 : i32}> : (vector<4xf8E5M2>, f32) -> vector<2xf16>
    "func.return"(%121) : (vector<2xf16>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<4xf8E5M2>, f32) -> vector<2xbf16>, sym_name = "scaled_ext_full_f8e5m2_bf16"}> ({
  ^bb0(%arg260: vector<4xf8E5M2>, %arg261: f32):
    %120 = "amdgpu.scaled_ext_packed"(%arg260, %arg261) <{index = 0 : i32}> : (vector<4xf8E5M2>, f32) -> vector<2xbf16>
    "func.return"(%120) : (vector<2xbf16>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<2xf8E5M2>, f32) -> vector<2xf32>, sym_name = "scaled_ext_half_f8e5m2_f32"}> ({
  ^bb0(%arg258: vector<2xf8E5M2>, %arg259: f32):
    %119 = "amdgpu.scaled_ext_packed"(%arg258, %arg259) <{index = 0 : i32}> : (vector<2xf8E5M2>, f32) -> vector<2xf32>
    "func.return"(%119) : (vector<2xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<2xf8E5M2>, f32) -> vector<2xf16>, sym_name = "scaled_ext_half_f8e5m2_f16"}> ({
  ^bb0(%arg256: vector<2xf8E5M2>, %arg257: f32):
    %118 = "amdgpu.scaled_ext_packed"(%arg256, %arg257) <{index = 0 : i32}> : (vector<2xf8E5M2>, f32) -> vector<2xf16>
    "func.return"(%118) : (vector<2xf16>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<2xf8E5M2>, f32) -> vector<2xbf16>, sym_name = "scaled_ext_half_f8e5m2_bf16"}> ({
  ^bb0(%arg254: vector<2xf8E5M2>, %arg255: f32):
    %117 = "amdgpu.scaled_ext_packed"(%arg254, %arg255) <{index = 0 : i32}> : (vector<2xf8E5M2>, f32) -> vector<2xbf16>
    "func.return"(%117) : (vector<2xbf16>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<2xf8E5M2>, f32) -> vector<2xf32>, sym_name = "scaled_ext_scalar_f8e5m2_f32"}> ({
  ^bb0(%arg252: vector<2xf8E5M2>, %arg253: f32):
    %116 = "amdgpu.scaled_ext_packed"(%arg252, %arg253) <{index = 0 : i32}> : (vector<2xf8E5M2>, f32) -> vector<2xf32>
    "func.return"(%116) : (vector<2xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<2xf8E5M2>, f32) -> vector<2xf16>, sym_name = "scaled_ext_scalar_f8e5m2_f16"}> ({
  ^bb0(%arg250: vector<2xf8E5M2>, %arg251: f32):
    %115 = "amdgpu.scaled_ext_packed"(%arg250, %arg251) <{index = 0 : i32}> : (vector<2xf8E5M2>, f32) -> vector<2xf16>
    "func.return"(%115) : (vector<2xf16>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<2xf8E5M2>, f32) -> vector<2xbf16>, sym_name = "scaled_ext_scalar_f8e5m2_bf16"}> ({
  ^bb0(%arg248: vector<2xf8E5M2>, %arg249: f32):
    %114 = "amdgpu.scaled_ext_packed"(%arg248, %arg249) <{index = 0 : i32}> : (vector<2xf8E5M2>, f32) -> vector<2xbf16>
    "func.return"(%114) : (vector<2xbf16>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<8xf4E2M1FN>, f32) -> vector<2xf32>, sym_name = "scaled_ext_full_f4e2m1_f32"}> ({
  ^bb0(%arg246: vector<8xf4E2M1FN>, %arg247: f32):
    %113 = "amdgpu.scaled_ext_packed"(%arg246, %arg247) <{index = 0 : i32}> : (vector<8xf4E2M1FN>, f32) -> vector<2xf32>
    "func.return"(%113) : (vector<2xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<8xf4E2M1FN>, f32) -> vector<2xf16>, sym_name = "scaled_ext_full_f4e2m1_f16"}> ({
  ^bb0(%arg244: vector<8xf4E2M1FN>, %arg245: f32):
    %112 = "amdgpu.scaled_ext_packed"(%arg244, %arg245) <{index = 0 : i32}> : (vector<8xf4E2M1FN>, f32) -> vector<2xf16>
    "func.return"(%112) : (vector<2xf16>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<8xf4E2M1FN>, f32) -> vector<2xbf16>, sym_name = "scaled_ext_full_f4e2m1_bf16"}> ({
  ^bb0(%arg242: vector<8xf4E2M1FN>, %arg243: f32):
    %111 = "amdgpu.scaled_ext_packed"(%arg242, %arg243) <{index = 0 : i32}> : (vector<8xf4E2M1FN>, f32) -> vector<2xbf16>
    "func.return"(%111) : (vector<2xbf16>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<8xf4E2M1FN>, f32) -> vector<2xf32>, sym_name = "scaled_ext_half_f4e2m1_f32"}> ({
  ^bb0(%arg240: vector<8xf4E2M1FN>, %arg241: f32):
    %110 = "amdgpu.scaled_ext_packed"(%arg240, %arg241) <{index = 0 : i32}> : (vector<8xf4E2M1FN>, f32) -> vector<2xf32>
    "func.return"(%110) : (vector<2xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<4xf4E2M1FN>, f32) -> vector<2xf16>, sym_name = "scaled_ext_half_f4e2m1_f16"}> ({
  ^bb0(%arg238: vector<4xf4E2M1FN>, %arg239: f32):
    %109 = "amdgpu.scaled_ext_packed"(%arg238, %arg239) <{index = 0 : i32}> : (vector<4xf4E2M1FN>, f32) -> vector<2xf16>
    "func.return"(%109) : (vector<2xf16>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<4xf4E2M1FN>, f32) -> vector<2xbf16>, sym_name = "scaled_ext_half_f4e2m1_bf16"}> ({
  ^bb0(%arg236: vector<4xf4E2M1FN>, %arg237: f32):
    %108 = "amdgpu.scaled_ext_packed"(%arg236, %arg237) <{index = 0 : i32}> : (vector<4xf4E2M1FN>, f32) -> vector<2xbf16>
    "func.return"(%108) : (vector<2xbf16>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<2xf4E2M1FN>, f32) -> vector<2xf32>, sym_name = "scaled_ext_scalar_f4e2m1_f32"}> ({
  ^bb0(%arg234: vector<2xf4E2M1FN>, %arg235: f32):
    %107 = "amdgpu.scaled_ext_packed"(%arg234, %arg235) <{index = 0 : i32}> : (vector<2xf4E2M1FN>, f32) -> vector<2xf32>
    "func.return"(%107) : (vector<2xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<2xf4E2M1FN>, f32) -> vector<2xf16>, sym_name = "scaled_ext_scalar_f4e2m1_f16"}> ({
  ^bb0(%arg232: vector<2xf4E2M1FN>, %arg233: f32):
    %106 = "amdgpu.scaled_ext_packed"(%arg232, %arg233) <{index = 0 : i32}> : (vector<2xf4E2M1FN>, f32) -> vector<2xf16>
    "func.return"(%106) : (vector<2xf16>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<2xf4E2M1FN>, f32) -> vector<2xbf16>, sym_name = "scaled_ext_scalar_f4e2m1_bf16"}> ({
  ^bb0(%arg230: vector<2xf4E2M1FN>, %arg231: f32):
    %105 = "amdgpu.scaled_ext_packed"(%arg230, %arg231) <{index = 0 : i32}> : (vector<2xf4E2M1FN>, f32) -> vector<2xbf16>
    "func.return"(%105) : (vector<2xbf16>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<8xf4E2M1FN>, vector<4xf8E8M0FNU>) -> (vector<8xf16>, vector<8xbf16>, vector<8xf32>), sym_name = "scaled_ext_packed_matrix_fp4"}> ({
  ^bb0(%arg228: vector<8xf4E2M1FN>, %arg229: vector<4xf8E8M0FNU>):
    %102 = "amdgpu.scaled_ext_packed_matrix"(%arg228, %arg229) <{blockSize = 32 : i32, firstScaleByte = 0 : i32, firstScaleLane = 0 : i32}> : (vector<8xf4E2M1FN>, vector<4xf8E8M0FNU>) -> vector<8xf16>
    %103 = "amdgpu.scaled_ext_packed_matrix"(%arg228, %arg229) <{blockSize = 32 : i32, firstScaleByte = 0 : i32, firstScaleLane = 0 : i32}> : (vector<8xf4E2M1FN>, vector<4xf8E8M0FNU>) -> vector<8xbf16>
    %104 = "amdgpu.scaled_ext_packed_matrix"(%arg228, %arg229) <{blockSize = 32 : i32, firstScaleByte = 0 : i32, firstScaleLane = 0 : i32}> : (vector<8xf4E2M1FN>, vector<4xf8E8M0FNU>) -> vector<8xf32>
    "func.return"(%102, %103, %104) : (vector<8xf16>, vector<8xbf16>, vector<8xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<8xf8E4M3FN>, vector<4xf8E8M0FNU>) -> (vector<8xf16>, vector<8xbf16>, vector<8xf32>), sym_name = "scaled_ext_packed_matrix_fp8"}> ({
  ^bb0(%arg226: vector<8xf8E4M3FN>, %arg227: vector<4xf8E8M0FNU>):
    %99 = "amdgpu.scaled_ext_packed_matrix"(%arg226, %arg227) <{blockSize = 32 : i32, firstScaleByte = 0 : i32, firstScaleLane = 0 : i32}> : (vector<8xf8E4M3FN>, vector<4xf8E8M0FNU>) -> vector<8xf16>
    %100 = "amdgpu.scaled_ext_packed_matrix"(%arg226, %arg227) <{blockSize = 32 : i32, firstScaleByte = 0 : i32, firstScaleLane = 0 : i32}> : (vector<8xf8E4M3FN>, vector<4xf8E8M0FNU>) -> vector<8xbf16>
    %101 = "amdgpu.scaled_ext_packed_matrix"(%arg226, %arg227) <{blockSize = 32 : i32, firstScaleByte = 0 : i32, firstScaleLane = 0 : i32}> : (vector<8xf8E4M3FN>, vector<4xf8E8M0FNU>) -> vector<8xf32>
    "func.return"(%99, %100, %101) : (vector<8xf16>, vector<8xbf16>, vector<8xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<8xf8E5M2>, vector<4xf8E8M0FNU>) -> (vector<8xf16>, vector<8xbf16>, vector<8xf32>), sym_name = "scaled_ext_packed_matrix_bf8"}> ({
  ^bb0(%arg224: vector<8xf8E5M2>, %arg225: vector<4xf8E8M0FNU>):
    %96 = "amdgpu.scaled_ext_packed_matrix"(%arg224, %arg225) <{blockSize = 32 : i32, firstScaleByte = 0 : i32, firstScaleLane = 0 : i32}> : (vector<8xf8E5M2>, vector<4xf8E8M0FNU>) -> vector<8xf16>
    %97 = "amdgpu.scaled_ext_packed_matrix"(%arg224, %arg225) <{blockSize = 32 : i32, firstScaleByte = 0 : i32, firstScaleLane = 0 : i32}> : (vector<8xf8E5M2>, vector<4xf8E8M0FNU>) -> vector<8xbf16>
    %98 = "amdgpu.scaled_ext_packed_matrix"(%arg224, %arg225) <{blockSize = 32 : i32, firstScaleByte = 0 : i32, firstScaleLane = 0 : i32}> : (vector<8xf8E5M2>, vector<4xf8E8M0FNU>) -> vector<8xf32>
    "func.return"(%96, %97, %98) : (vector<8xf16>, vector<8xbf16>, vector<8xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<16xf6E2M3FN>, vector<4xf8E8M0FNU>) -> (vector<16xf16>, vector<16xbf16>, vector<16xf32>), sym_name = "scaled_ext_packed_matrix_fp6"}> ({
  ^bb0(%arg222: vector<16xf6E2M3FN>, %arg223: vector<4xf8E8M0FNU>):
    %93 = "amdgpu.scaled_ext_packed_matrix"(%arg222, %arg223) <{blockSize = 32 : i32, firstScaleByte = 0 : i32, firstScaleLane = 0 : i32}> : (vector<16xf6E2M3FN>, vector<4xf8E8M0FNU>) -> vector<16xf16>
    %94 = "amdgpu.scaled_ext_packed_matrix"(%arg222, %arg223) <{blockSize = 32 : i32, firstScaleByte = 0 : i32, firstScaleLane = 0 : i32}> : (vector<16xf6E2M3FN>, vector<4xf8E8M0FNU>) -> vector<16xbf16>
    %95 = "amdgpu.scaled_ext_packed_matrix"(%arg222, %arg223) <{blockSize = 32 : i32, firstScaleByte = 0 : i32, firstScaleLane = 0 : i32}> : (vector<16xf6E2M3FN>, vector<4xf8E8M0FNU>) -> vector<16xf32>
    "func.return"(%93, %94, %95) : (vector<16xf16>, vector<16xbf16>, vector<16xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<16xf6E3M2FN>, vector<4xf8E8M0FNU>) -> (vector<16xf16>, vector<16xbf16>, vector<16xf32>), sym_name = "scaled_ext_packed_matrix_bf6"}> ({
  ^bb0(%arg220: vector<16xf6E3M2FN>, %arg221: vector<4xf8E8M0FNU>):
    %90 = "amdgpu.scaled_ext_packed_matrix"(%arg220, %arg221) <{blockSize = 32 : i32, firstScaleByte = 0 : i32, firstScaleLane = 0 : i32}> : (vector<16xf6E3M2FN>, vector<4xf8E8M0FNU>) -> vector<16xf16>
    %91 = "amdgpu.scaled_ext_packed_matrix"(%arg220, %arg221) <{blockSize = 32 : i32, firstScaleByte = 0 : i32, firstScaleLane = 0 : i32}> : (vector<16xf6E3M2FN>, vector<4xf8E8M0FNU>) -> vector<16xbf16>
    %92 = "amdgpu.scaled_ext_packed_matrix"(%arg220, %arg221) <{blockSize = 32 : i32, firstScaleByte = 0 : i32, firstScaleLane = 0 : i32}> : (vector<16xf6E3M2FN>, vector<4xf8E8M0FNU>) -> vector<16xf32>
    "func.return"(%90, %91, %92) : (vector<16xf16>, vector<16xbf16>, vector<16xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<2xf32>, f32) -> vector<4xf8E4M3FN>, sym_name = "packed_scaled_trunc_f8e4m3_f32"}> ({
  ^bb0(%arg218: vector<2xf32>, %arg219: f32):
    %89 = "amdgpu.packed_scaled_trunc"(%arg218, %arg219) <{index = 0 : i32}> : (vector<2xf32>, f32) -> vector<4xf8E4M3FN>
    "func.return"(%89) : (vector<4xf8E4M3FN>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<2xf32>, vector<4xf8E4M3FN>, f32) -> vector<4xf8E4M3FN>, sym_name = "packed_scaled_trunc_into_f8e4m3_f32"}> ({
  ^bb0(%arg215: vector<2xf32>, %arg216: vector<4xf8E4M3FN>, %arg217: f32):
    %88 = "amdgpu.packed_scaled_trunc"(%arg215, %arg217, %arg216) <{index = 0 : i32}> : (vector<2xf32>, f32, vector<4xf8E4M3FN>) -> vector<4xf8E4M3FN>
    "func.return"(%88) : (vector<4xf8E4M3FN>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<2xf16>, f32) -> vector<4xf8E4M3FN>, sym_name = "packed_scaled_trunc_f8e4m3_f16"}> ({
  ^bb0(%arg213: vector<2xf16>, %arg214: f32):
    %87 = "amdgpu.packed_scaled_trunc"(%arg213, %arg214) <{index = 0 : i32}> : (vector<2xf16>, f32) -> vector<4xf8E4M3FN>
    "func.return"(%87) : (vector<4xf8E4M3FN>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<2xf16>, vector<4xf8E4M3FN>, f32) -> vector<4xf8E4M3FN>, sym_name = "packed_scaled_trunc_into_f8e4m3_f16"}> ({
  ^bb0(%arg210: vector<2xf16>, %arg211: vector<4xf8E4M3FN>, %arg212: f32):
    %86 = "amdgpu.packed_scaled_trunc"(%arg210, %arg212, %arg211) <{index = 0 : i32}> : (vector<2xf16>, f32, vector<4xf8E4M3FN>) -> vector<4xf8E4M3FN>
    "func.return"(%86) : (vector<4xf8E4M3FN>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<2xbf16>, f32) -> vector<4xf8E4M3FN>, sym_name = "packed_scaled_trunc_f8e4m3_bf16"}> ({
  ^bb0(%arg208: vector<2xbf16>, %arg209: f32):
    %85 = "amdgpu.packed_scaled_trunc"(%arg208, %arg209) <{index = 0 : i32}> : (vector<2xbf16>, f32) -> vector<4xf8E4M3FN>
    "func.return"(%85) : (vector<4xf8E4M3FN>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<2xbf16>, vector<4xf8E4M3FN>, f32) -> vector<4xf8E4M3FN>, sym_name = "packed_scaled_trunc_into_f8e4m3_bf16"}> ({
  ^bb0(%arg205: vector<2xbf16>, %arg206: vector<4xf8E4M3FN>, %arg207: f32):
    %84 = "amdgpu.packed_scaled_trunc"(%arg205, %arg207, %arg206) <{index = 0 : i32}> : (vector<2xbf16>, f32, vector<4xf8E4M3FN>) -> vector<4xf8E4M3FN>
    "func.return"(%84) : (vector<4xf8E4M3FN>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<2xf32>, f32) -> vector<4xf8E5M2>, sym_name = "packed_scaled_trunc_f8e5m2_f32"}> ({
  ^bb0(%arg203: vector<2xf32>, %arg204: f32):
    %83 = "amdgpu.packed_scaled_trunc"(%arg203, %arg204) <{index = 0 : i32}> : (vector<2xf32>, f32) -> vector<4xf8E5M2>
    "func.return"(%83) : (vector<4xf8E5M2>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<2xf32>, vector<4xf8E5M2>, f32) -> vector<4xf8E5M2>, sym_name = "packed_scaled_trunc_into_f8e5m2_f32"}> ({
  ^bb0(%arg200: vector<2xf32>, %arg201: vector<4xf8E5M2>, %arg202: f32):
    %82 = "amdgpu.packed_scaled_trunc"(%arg200, %arg202, %arg201) <{index = 0 : i32}> : (vector<2xf32>, f32, vector<4xf8E5M2>) -> vector<4xf8E5M2>
    "func.return"(%82) : (vector<4xf8E5M2>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<2xf16>, f32) -> vector<4xf8E5M2>, sym_name = "packed_scaled_trunc_f8e5m2_f16"}> ({
  ^bb0(%arg198: vector<2xf16>, %arg199: f32):
    %81 = "amdgpu.packed_scaled_trunc"(%arg198, %arg199) <{index = 0 : i32}> : (vector<2xf16>, f32) -> vector<4xf8E5M2>
    "func.return"(%81) : (vector<4xf8E5M2>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<2xf16>, vector<4xf8E5M2>, f32) -> vector<4xf8E5M2>, sym_name = "packed_scaled_trunc_into_f8e5m2_f16"}> ({
  ^bb0(%arg195: vector<2xf16>, %arg196: vector<4xf8E5M2>, %arg197: f32):
    %80 = "amdgpu.packed_scaled_trunc"(%arg195, %arg197, %arg196) <{index = 0 : i32}> : (vector<2xf16>, f32, vector<4xf8E5M2>) -> vector<4xf8E5M2>
    "func.return"(%80) : (vector<4xf8E5M2>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<2xbf16>, f32) -> vector<4xf8E5M2>, sym_name = "packed_scaled_trunc_f8e5m2_bf16"}> ({
  ^bb0(%arg193: vector<2xbf16>, %arg194: f32):
    %79 = "amdgpu.packed_scaled_trunc"(%arg193, %arg194) <{index = 0 : i32}> : (vector<2xbf16>, f32) -> vector<4xf8E5M2>
    "func.return"(%79) : (vector<4xf8E5M2>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<2xbf16>, vector<4xf8E5M2>, f32) -> vector<4xf8E5M2>, sym_name = "packed_scaled_trunc_into_f8e5m2_bf16"}> ({
  ^bb0(%arg190: vector<2xbf16>, %arg191: vector<4xf8E5M2>, %arg192: f32):
    %78 = "amdgpu.packed_scaled_trunc"(%arg190, %arg192, %arg191) <{index = 0 : i32}> : (vector<2xbf16>, f32, vector<4xf8E5M2>) -> vector<4xf8E5M2>
    "func.return"(%78) : (vector<4xf8E5M2>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<2xf32>, f32) -> vector<8xf4E2M1FN>, sym_name = "packed_scaled_trunc_f4e2m1_f32"}> ({
  ^bb0(%arg188: vector<2xf32>, %arg189: f32):
    %77 = "amdgpu.packed_scaled_trunc"(%arg188, %arg189) <{index = 0 : i32}> : (vector<2xf32>, f32) -> vector<8xf4E2M1FN>
    "func.return"(%77) : (vector<8xf4E2M1FN>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<2xf32>, vector<8xf4E2M1FN>, f32) -> vector<8xf4E2M1FN>, sym_name = "packed_scaled_trunc_into_f4e2m1_f32"}> ({
  ^bb0(%arg185: vector<2xf32>, %arg186: vector<8xf4E2M1FN>, %arg187: f32):
    %76 = "amdgpu.packed_scaled_trunc"(%arg185, %arg187, %arg186) <{index = 0 : i32}> : (vector<2xf32>, f32, vector<8xf4E2M1FN>) -> vector<8xf4E2M1FN>
    "func.return"(%76) : (vector<8xf4E2M1FN>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<2xf16>, f32) -> vector<8xf4E2M1FN>, sym_name = "packed_scaled_trunc_f4e2m1_f16"}> ({
  ^bb0(%arg183: vector<2xf16>, %arg184: f32):
    %75 = "amdgpu.packed_scaled_trunc"(%arg183, %arg184) <{index = 0 : i32}> : (vector<2xf16>, f32) -> vector<8xf4E2M1FN>
    "func.return"(%75) : (vector<8xf4E2M1FN>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<2xf16>, vector<8xf4E2M1FN>, f32) -> vector<8xf4E2M1FN>, sym_name = "packed_scaled_trunc_into_f4e2m1_f16"}> ({
  ^bb0(%arg180: vector<2xf16>, %arg181: vector<8xf4E2M1FN>, %arg182: f32):
    %74 = "amdgpu.packed_scaled_trunc"(%arg180, %arg182, %arg181) <{index = 0 : i32}> : (vector<2xf16>, f32, vector<8xf4E2M1FN>) -> vector<8xf4E2M1FN>
    "func.return"(%74) : (vector<8xf4E2M1FN>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<2xbf16>, f32) -> vector<8xf4E2M1FN>, sym_name = "packed_scaled_trunc_f4e2m1_bf16"}> ({
  ^bb0(%arg178: vector<2xbf16>, %arg179: f32):
    %73 = "amdgpu.packed_scaled_trunc"(%arg178, %arg179) <{index = 0 : i32}> : (vector<2xbf16>, f32) -> vector<8xf4E2M1FN>
    "func.return"(%73) : (vector<8xf4E2M1FN>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<2xbf16>, vector<8xf4E2M1FN>, f32) -> vector<8xf4E2M1FN>, sym_name = "packed_scaled_trunc_into_f4e2m1_bf16"}> ({
  ^bb0(%arg175: vector<2xbf16>, %arg176: vector<8xf4E2M1FN>, %arg177: f32):
    %72 = "amdgpu.packed_scaled_trunc"(%arg175, %arg177, %arg176) <{index = 0 : i32}> : (vector<2xbf16>, f32, vector<8xf4E2M1FN>) -> vector<8xf4E2M1FN>
    "func.return"(%72) : (vector<8xf4E2M1FN>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (memref<8xi32>) -> memref<8xi32, #amdgpu.address_space<fat_raw_buffer>>, sym_name = "fat_raw_buffer_cast_easy"}> ({
  ^bb0(%arg174: memref<8xi32>):
    %71 = "amdgpu.fat_raw_buffer_cast"(%arg174) <{boundsCheck = true, operandSegmentSizes = array<i32: 1, 0, 0>}> : (memref<8xi32>) -> memref<8xi32, #amdgpu.address_space<fat_raw_buffer>>
    "func.return"(%71) : (memref<8xi32, #amdgpu.address_space<fat_raw_buffer>>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (memref<8xi32, strided<[1], offset: ?>>, i64, i14) -> memref<8xi32, #amdgpu.address_space<fat_raw_buffer>>, sym_name = "fat_raw_buffer_cast"}> ({
  ^bb0(%arg171: memref<8xi32, strided<[1], offset: ?>>, %arg172: i64, %arg173: i14):
    %70 = "amdgpu.fat_raw_buffer_cast"(%arg171, %arg172, %arg173) <{boundsCheck = false, operandSegmentSizes = array<i32: 1, 1, 1>, resetOffset}> : (memref<8xi32, strided<[1], offset: ?>>, i64, i14) -> memref<8xi32, #amdgpu.address_space<fat_raw_buffer>>
    "func.return"(%70) : (memref<8xi32, #amdgpu.address_space<fat_raw_buffer>>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (memref<?xi32, strided<[1], offset: ?>>) -> memref<?xi32, #amdgpu.address_space<fat_raw_buffer>>, sym_name = "fat_raw_buffer_cast_dynamic_1d_reset_offset"}> ({
  ^bb0(%arg170: memref<?xi32, strided<[1], offset: ?>>):
    %69 = "amdgpu.fat_raw_buffer_cast"(%arg170) <{boundsCheck = true, operandSegmentSizes = array<i32: 1, 0, 0>, resetOffset}> : (memref<?xi32, strided<[1], offset: ?>>) -> memref<?xi32, #amdgpu.address_space<fat_raw_buffer>>
    "func.return"(%69) : (memref<?xi32, #amdgpu.address_space<fat_raw_buffer>>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (memref<i32, strided<[], offset: ?>>) -> memref<i32, #amdgpu.address_space<fat_raw_buffer>>, sym_name = "fat_raw_buffer_cast_dynamic_0d_reset_offset"}> ({
  ^bb0(%arg169: memref<i32, strided<[], offset: ?>>):
    %68 = "amdgpu.fat_raw_buffer_cast"(%arg169) <{boundsCheck = true, operandSegmentSizes = array<i32: 1, 0, 0>, resetOffset}> : (memref<i32, strided<[], offset: ?>>) -> memref<i32, #amdgpu.address_space<fat_raw_buffer>>
    "func.return"(%68) : (memref<i32, #amdgpu.address_space<fat_raw_buffer>>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (memref<4x4xi32, strided<[4, 1], offset: ?>>) -> memref<4x4xi32, #amdgpu.address_space<fat_raw_buffer>>, sym_name = "fat_raw_buffer_cast_static_shape_2d_reset_offset"}> ({
  ^bb0(%arg168: memref<4x4xi32, strided<[4, 1], offset: ?>>):
    %67 = "amdgpu.fat_raw_buffer_cast"(%arg168) <{boundsCheck = true, operandSegmentSizes = array<i32: 1, 0, 0>, resetOffset}> : (memref<4x4xi32, strided<[4, 1], offset: ?>>) -> memref<4x4xi32, #amdgpu.address_space<fat_raw_buffer>>
    "func.return"(%67) : (memref<4x4xi32, #amdgpu.address_space<fat_raw_buffer>>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (memref<?x?xi32, strided<[?, 1], offset: ?>>) -> memref<?x?xi32, strided<[?, 1]>, #amdgpu.address_space<fat_raw_buffer>>, sym_name = "fat_raw_buffer_cast_dynamic_2d_reset_offset"}> ({
  ^bb0(%arg167: memref<?x?xi32, strided<[?, 1], offset: ?>>):
    %66 = "amdgpu.fat_raw_buffer_cast"(%arg167) <{boundsCheck = true, operandSegmentSizes = array<i32: 1, 0, 0>, resetOffset}> : (memref<?x?xi32, strided<[?, 1], offset: ?>>) -> memref<?x?xi32, strided<[?, 1]>, #amdgpu.address_space<fat_raw_buffer>>
    "func.return"(%66) : (memref<?x?xi32, strided<[?, 1]>, #amdgpu.address_space<fat_raw_buffer>>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (memref<4x4xi32, strided<[8, 1], offset: ?>>) -> memref<4x4xi32, strided<[8, 1]>, #amdgpu.address_space<fat_raw_buffer>>, sym_name = "fat_raw_buffer_cast_noncontiguous_2d_reset_offset"}> ({
  ^bb0(%arg166: memref<4x4xi32, strided<[8, 1], offset: ?>>):
    %65 = "amdgpu.fat_raw_buffer_cast"(%arg166) <{boundsCheck = true, operandSegmentSizes = array<i32: 1, 0, 0>, resetOffset}> : (memref<4x4xi32, strided<[8, 1], offset: ?>>) -> memref<4x4xi32, strided<[8, 1]>, #amdgpu.address_space<fat_raw_buffer>>
    "func.return"(%65) : (memref<4x4xi32, strided<[8, 1]>, #amdgpu.address_space<fat_raw_buffer>>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (memref<128xf32>, i32, i32) -> f32, sym_name = "raw_buffer_load_f32_from_rank_1"}> ({
  ^bb0(%arg163: memref<128xf32>, %arg164: i32, %arg165: i32):
    %64 = "amdgpu.raw_buffer_load"(%arg163, %arg165, %arg164) <{boundsCheck = true, indexOffset = 1 : i32, operandSegmentSizes = array<i32: 1, 1, 1>}> : (memref<128xf32>, i32, i32) -> f32
    "func.return"(%64) : (f32) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (memref<128x64x32x16xf32>, i32, i32, i32, i32, i32) -> f32, sym_name = "raw_buffer_load_f32_from_rank_4"}> ({
  ^bb0(%arg157: memref<128x64x32x16xf32>, %arg158: i32, %arg159: i32, %arg160: i32, %arg161: i32, %arg162: i32):
    %63 = "amdgpu.raw_buffer_load"(%arg157, %arg159, %arg160, %arg161, %arg162, %arg158) <{boundsCheck = true, indexOffset = 1 : i32, operandSegmentSizes = array<i32: 1, 4, 1>}> : (memref<128x64x32x16xf32>, i32, i32, i32, i32, i32) -> f32
    "func.return"(%63) : (f32) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (memref<f32>) -> f32, sym_name = "raw_buffer_load_scalar"}> ({
  ^bb0(%arg156: memref<f32>):
    %62 = "amdgpu.raw_buffer_load"(%arg156) <{boundsCheck = true, indexOffset = 1 : i32, operandSegmentSizes = array<i32: 1, 0, 0>}> : (memref<f32>) -> f32
    "func.return"(%62) : (f32) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (memref<128x64x32x16xf32>, i32, i32, i32, i32, i32) -> vector<4xf32>, sym_name = "raw_buffer_load_4xf32_from_rank_4"}> ({
  ^bb0(%arg150: memref<128x64x32x16xf32>, %arg151: i32, %arg152: i32, %arg153: i32, %arg154: i32, %arg155: i32):
    %61 = "amdgpu.raw_buffer_load"(%arg150, %arg152, %arg153, %arg154, %arg155, %arg151) <{boundsCheck = true, indexOffset = 1 : i32, operandSegmentSizes = array<i32: 1, 4, 1>}> : (memref<128x64x32x16xf32>, i32, i32, i32, i32, i32) -> vector<4xf32>
    "func.return"(%61) : (vector<4xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (f32, memref<128xf32>, i32, i32) -> (), sym_name = "raw_buffer_store_f32_to_rank_1"}> ({
  ^bb0(%arg146: f32, %arg147: memref<128xf32>, %arg148: i32, %arg149: i32):
    "amdgpu.raw_buffer_store"(%arg146, %arg147, %arg149, %arg148) <{boundsCheck = true, indexOffset = 1 : i32, operandSegmentSizes = array<i32: 1, 1, 1, 1>}> : (f32, memref<128xf32>, i32, i32) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (f32, memref<128x64x32x16xf32>, i32, i32, i32, i32, i32) -> (), sym_name = "raw_buffer_store_f32_to_rank_4"}> ({
  ^bb0(%arg139: f32, %arg140: memref<128x64x32x16xf32>, %arg141: i32, %arg142: i32, %arg143: i32, %arg144: i32, %arg145: i32):
    "amdgpu.raw_buffer_store"(%arg139, %arg140, %arg142, %arg143, %arg144, %arg145, %arg141) <{boundsCheck = true, indexOffset = 1 : i32, operandSegmentSizes = array<i32: 1, 1, 4, 1>}> : (f32, memref<128x64x32x16xf32>, i32, i32, i32, i32, i32) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<4xf32>, memref<128x64x32x16xf32>, i32, i32, i32, i32, i32) -> (), sym_name = "raw_buffer_store_4xf32_to_rank_4"}> ({
  ^bb0(%arg132: vector<4xf32>, %arg133: memref<128x64x32x16xf32>, %arg134: i32, %arg135: i32, %arg136: i32, %arg137: i32, %arg138: i32):
    "amdgpu.raw_buffer_store"(%arg132, %arg133, %arg135, %arg136, %arg137, %arg138, %arg134) <{boundsCheck = true, indexOffset = 1 : i32, operandSegmentSizes = array<i32: 1, 1, 4, 1>}> : (vector<4xf32>, memref<128x64x32x16xf32>, i32, i32, i32, i32, i32) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (f32, memref<f32>) -> (), sym_name = "raw_buffer_store_scalar"}> ({
  ^bb0(%arg130: f32, %arg131: memref<f32>):
    "amdgpu.raw_buffer_store"(%arg130, %arg131) <{boundsCheck = true, indexOffset = 1 : i32, operandSegmentSizes = array<i32: 1, 1, 0, 0>}> : (f32, memref<f32>) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (f32, memref<128xf32>, i32, i32) -> (), sym_name = "raw_buffer_atomic_fadd_f32_to_rank_1"}> ({
  ^bb0(%arg126: f32, %arg127: memref<128xf32>, %arg128: i32, %arg129: i32):
    %60 = "amdgpu.raw_buffer_atomic_fadd"(%arg126, %arg127, %arg129, %arg128) <{boundsCheck = true, indexOffset = 1 : i32, operandSegmentSizes = array<i32: 1, 1, 1, 1>}> : (f32, memref<128xf32>, i32, i32) -> f32
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (f32, memref<128x64x32x16xf32>, i32, i32, i32, i32, i32) -> (), sym_name = "raw_buffer_atomic_fadd_f32_to_rank_4"}> ({
  ^bb0(%arg119: f32, %arg120: memref<128x64x32x16xf32>, %arg121: i32, %arg122: i32, %arg123: i32, %arg124: i32, %arg125: i32):
    %59 = "amdgpu.raw_buffer_atomic_fadd"(%arg119, %arg120, %arg122, %arg123, %arg124, %arg125, %arg121) <{boundsCheck = true, indexOffset = 1 : i32, operandSegmentSizes = array<i32: 1, 1, 4, 1>}> : (f32, memref<128x64x32x16xf32>, i32, i32, i32, i32, i32) -> f32
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (f32, f32, memref<128x64x32x16xf32>, i32, i32, i32, i32, i32) -> (), sym_name = "raw_buffer_atomic_cmpswap_f32"}> ({
  ^bb0(%arg111: f32, %arg112: f32, %arg113: memref<128x64x32x16xf32>, %arg114: i32, %arg115: i32, %arg116: i32, %arg117: i32, %arg118: i32):
    %58 = "amdgpu.raw_buffer_atomic_cmpswap"(%arg111, %arg112, %arg113, %arg115, %arg116, %arg117, %arg118, %arg114) <{boundsCheck = true, indexOffset = 1 : i32, operandSegmentSizes = array<i32: 1, 1, 1, 4, 1>}> : (f32, f32, memref<128x64x32x16xf32>, i32, i32, i32, i32, i32) -> f32
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "lds_barrier"}> ({
    "amdgpu.lds_barrier"() : () -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = () -> (), sym_name = "sched_barrier"}> ({
    "amdgpu.sched_barrier"() <{opts = #rocdl<sched_group_mask none>}> : () -> ()
    "amdgpu.sched_barrier"() <{opts = #rocdl<sched_group_mask valu|all_vmem>}> : () -> ()
    "amdgpu.sched_barrier"() <{opts = #rocdl<sched_group_mask all>}> : () -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<4xf16>, vector<4xf32>) -> vector<4xf32>, sym_name = "mfma"}> ({
  ^bb0(%arg109: vector<4xf16>, %arg110: vector<4xf32>):
    %57 = "amdgpu.mfma"(%arg109, %arg109, %arg110) <{abid = 0 : i32, blgp = #rocdl<mfma_perm_b none>, blocks = 1 : i32, cbsz = 0 : i32, k = 16 : i32, m = 16 : i32, n = 16 : i32}> : (vector<4xf16>, vector<4xf16>, vector<4xf32>) -> vector<4xf32>
    "func.return"(%57) : (vector<4xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (f32, vector<32xf32>) -> vector<32xf32>, sym_name = "mfma_with_blocks"}> ({
  ^bb0(%arg107: f32, %arg108: vector<32xf32>):
    %56 = "amdgpu.mfma"(%arg107, %arg107, %arg108) <{abid = 1 : i32, blgp = #rocdl<mfma_perm_b bcast_second_32>, blocks = 2 : i32, cbsz = 1 : i32, k = 1 : i32, m = 32 : i32, n = 32 : i32}> : (f32, f32, vector<32xf32>) -> vector<32xf32>
    "func.return"(%56) : (vector<32xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<16xf16>, vector<8xf16>) -> vector<8xf16>, sym_name = "wmma_f16_16x16x16_f16"}> ({
  ^bb0(%arg105: vector<16xf16>, %arg106: vector<8xf16>):
    %55 = "amdgpu.wmma"(%arg105, %arg105, %arg106) <{k = 16 : i32, m = 16 : i32, n = 16 : i32, subwordOffset = 0 : i32}> : (vector<16xf16>, vector<16xf16>, vector<8xf16>) -> vector<8xf16>
    "func.return"(%55) : (vector<8xf16>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<16xi4>, vector<8xi32>) -> vector<8xi32>, sym_name = "wmma_i32_16x16x32_i4"}> ({
  ^bb0(%arg103: vector<16xi4>, %arg104: vector<8xi32>):
    %54 = "amdgpu.wmma"(%arg103, %arg103, %arg104) <{k = 32 : i32, m = 16 : i32, n = 16 : i32, subwordOffset = 0 : i32}> : (vector<16xi4>, vector<16xi4>, vector<8xi32>) -> vector<8xi32>
    "func.return"(%54) : (vector<8xi32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<2xf32>, vector<8xf32>) -> vector<8xf32>, sym_name = "wmma_f32_16x16x4_f32"}> ({
  ^bb0(%arg101: vector<2xf32>, %arg102: vector<8xf32>):
    %53 = "amdgpu.wmma"(%arg101, %arg101, %arg102) <{k = 4 : i32, m = 16 : i32, n = 16 : i32, subwordOffset = 0 : i32}> : (vector<2xf32>, vector<2xf32>, vector<8xf32>) -> vector<8xf32>
    "func.return"(%53) : (vector<8xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<32xf8E4M3FN>, vector<8xf32>) -> vector<8xf32>, sym_name = "wmma_f32_16x16x64_f8"}> ({
  ^bb0(%arg99: vector<32xf8E4M3FN>, %arg100: vector<8xf32>):
    %52 = "amdgpu.wmma"(%arg99, %arg99, %arg100) <{k = 64 : i32, m = 16 : i32, n = 16 : i32, subwordOffset = 0 : i32}> : (vector<32xf8E4M3FN>, vector<32xf8E4M3FN>, vector<8xf32>) -> vector<8xf32>
    "func.return"(%52) : (vector<8xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<32xf8E5M2>, vector<8xf32>) -> vector<8xf32>, sym_name = "wmma_f32_16x16x64_bf8"}> ({
  ^bb0(%arg97: vector<32xf8E5M2>, %arg98: vector<8xf32>):
    %51 = "amdgpu.wmma"(%arg97, %arg97, %arg98) <{k = 64 : i32, m = 16 : i32, n = 16 : i32, subwordOffset = 0 : i32}> : (vector<32xf8E5M2>, vector<32xf8E5M2>, vector<8xf32>) -> vector<8xf32>
    "func.return"(%51) : (vector<8xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<32xf8E5M2>, vector<8xf16>) -> vector<8xf16>, sym_name = "wmma_f16_16x16x64_bf8"}> ({
  ^bb0(%arg95: vector<32xf8E5M2>, %arg96: vector<8xf16>):
    %50 = "amdgpu.wmma"(%arg95, %arg95, %arg96) <{k = 64 : i32, m = 16 : i32, n = 16 : i32, subwordOffset = 0 : i32}> : (vector<32xf8E5M2>, vector<32xf8E5M2>, vector<8xf16>) -> vector<8xf16>
    "func.return"(%50) : (vector<8xf16>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<32xf8E4M3FN>, vector<8xf16>) -> vector<8xf16>, sym_name = "wmma_f16_16x16x64_f8"}> ({
  ^bb0(%arg93: vector<32xf8E4M3FN>, %arg94: vector<8xf16>):
    %49 = "amdgpu.wmma"(%arg93, %arg93, %arg94) <{k = 64 : i32, m = 16 : i32, n = 16 : i32, subwordOffset = 0 : i32}> : (vector<32xf8E4M3FN>, vector<32xf8E4M3FN>, vector<8xf16>) -> vector<8xf16>
    "func.return"(%49) : (vector<8xf16>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (f32) -> f32, sym_name = "swizzle_bitmode"}> ({
  ^bb0(%arg92: f32):
    %48 = "amdgpu.swizzle_bitmode"(%arg92) <{and_mask = 1 : i32, or_mask = 2 : i32, xor_mask = 4 : i32}> : (f32) -> f32
    "func.return"(%48) : (f32) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (f32) -> f32, sym_name = "permlane16_swap"}> ({
  ^bb0(%arg91: f32):
    %47 = "amdgpu.permlane_swap"(%arg91) <{bound_ctrl = false, fetch_inactive = false, row_length = 16 : i32}> : (f32) -> f32
    "func.return"(%47) : (f32) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (f32) -> f32, sym_name = "permlane32_swap"}> ({
  ^bb0(%arg90: f32):
    %46 = "amdgpu.permlane_swap"(%arg90) <{bound_ctrl = false, fetch_inactive = false, row_length = 32 : i32}> : (f32) -> f32
    "func.return"(%46) : (f32) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (f8E8M0FNU, vector<32xf6E2M3FN>, vector<16xf32>) -> vector<16xf32>, sym_name = "scaled_mfma"}> ({
  ^bb0(%arg87: f8E8M0FNU, %arg88: vector<32xf6E2M3FN>, %arg89: vector<16xf32>):
    %45 = "amdgpu.scaled_mfma"(%arg88, %arg88, %arg89, %arg87, %arg87) <{k = 64 : i32, m = 32 : i32, n = 32 : i32, scalesIdxA = 0 : i32, scalesIdxB = 1 : i32}> : (vector<32xf6E2M3FN>, vector<32xf6E2M3FN>, vector<16xf32>, f8E8M0FNU, f8E8M0FNU) -> vector<16xf32>
    "func.return"(%45) : (vector<16xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<4xf16>, vector<8xf16>, vector<8xf16>, vector<16xf16>, vector<8xi8>, vector<16xi8>, vector<16xi8>, vector<32xi8>, vector<4xf32>, vector<4xi32>, vector<4xi8>, vector<2xi16>, i32) -> (), sym_name = "sparse_mfma"}> ({
  ^bb0(%arg74: vector<4xf16>, %arg75: vector<8xf16>, %arg76: vector<8xf16>, %arg77: vector<16xf16>, %arg78: vector<8xi8>, %arg79: vector<16xi8>, %arg80: vector<16xi8>, %arg81: vector<32xi8>, %arg82: vector<4xf32>, %arg83: vector<4xi32>, %arg84: vector<4xi8>, %arg85: vector<2xi16>, %arg86: i32):
    %41 = "amdgpu.sparse_mfma"(%arg74, %arg75, %arg82, %arg84) <{abid = 3 : i32, cbsz = 0 : i32, k = 32 : i32, m = 16 : i32, n = 16 : i32}> : (vector<4xf16>, vector<8xf16>, vector<4xf32>, vector<4xi8>) -> vector<4xf32>
    %42 = "amdgpu.sparse_mfma"(%arg78, %arg79, %arg83, %arg85) <{abid = 1 : i32, cbsz = 0 : i32, k = 64 : i32, m = 16 : i32, n = 16 : i32}> : (vector<8xi8>, vector<16xi8>, vector<4xi32>, vector<2xi16>) -> vector<4xi32>
    %43 = "amdgpu.sparse_mfma"(%arg76, %arg77, %arg82, %arg85) <{abid = 1 : i32, cbsz = 0 : i32, k = 64 : i32, m = 16 : i32, n = 16 : i32}> : (vector<8xf16>, vector<16xf16>, vector<4xf32>, vector<2xi16>) -> vector<4xf32>
    %44 = "amdgpu.sparse_mfma"(%arg80, %arg81, %arg83, %arg86) <{abid = 0 : i32, cbsz = 0 : i32, k = 128 : i32, m = 16 : i32, n = 16 : i32}> : (vector<16xi8>, vector<32xi8>, vector<4xi32>, i32) -> vector<4xi32>
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (index, index, memref<128x32xf16, 3>) -> vector<4xf16>, sym_name = "transpose_load"}> ({
  ^bb0(%arg71: index, %arg72: index, %arg73: memref<128x32xf16, 3>):
    %40 = "amdgpu.transpose_load"(%arg73, %arg71, %arg72) : (memref<128x32xf16, 3>, index, index) -> vector<4xf16>
    "func.return"(%40) : (vector<4xf16>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (index, index, memref<128x256xf16, #gpu.address_space<global>>) -> vector<8xf16>, sym_name = "global_transpose_load"}> ({
  ^bb0(%arg68: index, %arg69: index, %arg70: memref<128x256xf16, #gpu.address_space<global>>):
    %39 = "amdgpu.global_transpose_load"(%arg70, %arg68, %arg69) : (memref<128x256xf16, #gpu.address_space<global>>, index, index) -> vector<8xf16>
    "func.return"(%39) : (vector<8xf16>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (index, index, memref<32xf16>, memref<32x32xf16>, memref<32xf16, #gpu.address_space<workgroup>>, memref<32x32xf16, #gpu.address_space<workgroup>>, memref<?x?xf16, strided<[?, 1]>, #gpu.address_space<workgroup>>) -> (), sym_name = "gather_to_lds"}> ({
  ^bb0(%arg61: index, %arg62: index, %arg63: memref<32xf16>, %arg64: memref<32x32xf16>, %arg65: memref<32xf16, #gpu.address_space<workgroup>>, %arg66: memref<32x32xf16, #gpu.address_space<workgroup>>, %arg67: memref<?x?xf16, strided<[?, 1]>, #gpu.address_space<workgroup>>):
    "amdgpu.gather_to_lds"(%arg64, %arg61, %arg62, %arg66, %arg61, %arg62) <{async, operandSegmentSizes = array<i32: 1, 2, 1, 2>, transferType = vector<2xf16>}> : (memref<32x32xf16>, index, index, memref<32x32xf16, #gpu.address_space<workgroup>>, index, index) -> ()
    "amdgpu.gather_to_lds"(%arg63, %arg61, %arg66, %arg61, %arg62) <{async, operandSegmentSizes = array<i32: 1, 1, 1, 2>, transferType = vector<2xf16>}> : (memref<32xf16>, index, memref<32x32xf16, #gpu.address_space<workgroup>>, index, index) -> ()
    "rocdl.asyncmark"() : () -> ()
    "amdgpu.gather_to_lds"(%arg64, %arg61, %arg62, %arg65, %arg61) <{operandSegmentSizes = array<i32: 1, 2, 1, 1>, transferType = vector<2xf16>}> : (memref<32x32xf16>, index, index, memref<32xf16, #gpu.address_space<workgroup>>, index) -> ()
    "amdgpu.gather_to_lds"(%arg63, %arg61, %arg67, %arg61, %arg62) <{operandSegmentSizes = array<i32: 1, 1, 1, 2>, transferType = vector<2xf16>}> : (memref<32xf16>, index, memref<?x?xf16, strided<[?, 1]>, #gpu.address_space<workgroup>>, index, index) -> ()
    "rocdl.wait.asyncmark"() <{count = 0 : i16}> : () -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (index, memref<32xf16, 7>, memref<32xf16, #gpu.address_space<workgroup>>) -> (), sym_name = "gather_to_lds_integer_fat_raw_buffer_address_space"}> ({
  ^bb0(%arg58: index, %arg59: memref<32xf16, 7>, %arg60: memref<32xf16, #gpu.address_space<workgroup>>):
    "amdgpu.gather_to_lds"(%arg59, %arg58, %arg60, %arg58) <{operandSegmentSizes = array<i32: 1, 1, 1, 1>, transferType = vector<2xf16>}> : (memref<32xf16, 7>, index, memref<32xf16, #gpu.address_space<workgroup>>, index) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (memref<f16>, memref<f16, #gpu.address_space<workgroup>>) -> (), sym_name = "gather_to_lds_0d"}> ({
  ^bb0(%arg56: memref<f16>, %arg57: memref<f16, #gpu.address_space<workgroup>>):
    "amdgpu.gather_to_lds"(%arg56, %arg57) <{async, operandSegmentSizes = array<i32: 1, 0, 1, 0>, transferType = vector<2xf16>}> : (memref<f16>, memref<f16, #gpu.address_space<workgroup>>) -> ()
    "rocdl.asyncmark"() : () -> ()
    "rocdl.wait.asyncmark"() <{count = 0 : i16}> : () -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (index, index, memref<32xf32, #gpu.address_space<global>>, memref<32x32xf32, #gpu.address_space<global>>, memref<32xf32, #gpu.address_space<workgroup>>, memref<32x32xf32, #gpu.address_space<workgroup>>, i1) -> (), sym_name = "global_load_async_to_lds"}> ({
  ^bb0(%arg49: index, %arg50: index, %arg51: memref<32xf32, #gpu.address_space<global>>, %arg52: memref<32x32xf32, #gpu.address_space<global>>, %arg53: memref<32xf32, #gpu.address_space<workgroup>>, %arg54: memref<32x32xf32, #gpu.address_space<workgroup>>, %arg55: i1):
    "amdgpu.global_load_async_to_lds"(%arg52, %arg49, %arg50, %arg54, %arg49, %arg50) <{operandSegmentSizes = array<i32: 1, 2, 1, 2, 0>, transferType = f32}> : (memref<32x32xf32, #gpu.address_space<global>>, index, index, memref<32x32xf32, #gpu.address_space<workgroup>>, index, index) -> ()
    "amdgpu.global_load_async_to_lds"(%arg51, %arg49, %arg54, %arg49, %arg50) <{operandSegmentSizes = array<i32: 1, 1, 1, 2, 0>, transferType = f32}> : (memref<32xf32, #gpu.address_space<global>>, index, memref<32x32xf32, #gpu.address_space<workgroup>>, index, index) -> ()
    "amdgpu.global_load_async_to_lds"(%arg52, %arg49, %arg50, %arg54, %arg49, %arg50) <{operandSegmentSizes = array<i32: 1, 2, 1, 2, 0>, transferType = vector<2xf32>}> : (memref<32x32xf32, #gpu.address_space<global>>, index, index, memref<32x32xf32, #gpu.address_space<workgroup>>, index, index) -> ()
    "amdgpu.global_load_async_to_lds"(%arg52, %arg49, %arg50, %arg54, %arg49, %arg50, %arg55) <{operandSegmentSizes = array<i32: 1, 2, 1, 2, 1>, transferType = f32}> : (memref<32x32xf32, #gpu.address_space<global>>, index, index, memref<32x32xf32, #gpu.address_space<workgroup>>, index, index, i1) -> ()
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (memref<f32, #gpu.address_space<global>>, memref<f32, #gpu.address_space<workgroup>>) -> (), sym_name = "global_load_async_to_lds_0d"}> ({
  ^bb0(%arg47: memref<f32, #gpu.address_space<global>>, %arg48: memref<f32, #gpu.address_space<workgroup>>):
    "amdgpu.global_load_async_to_lds"(%arg47, %arg48) <{operandSegmentSizes = array<i32: 1, 0, 1, 0, 0>, transferType = f32}> : (memref<f32, #gpu.address_space<global>>, memref<f32, #gpu.address_space<workgroup>>) -> ()
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
  "func.func"() <{function_type = (index, memref<8xi32, #gpu.address_space<global>>, memref<8xi32, #gpu.address_space<workgroup>>) -> (), sym_name = "make_dma_base"}> ({
  ^bb0(%arg44: index, %arg45: memref<8xi32, #gpu.address_space<global>>, %arg46: memref<8xi32, #gpu.address_space<workgroup>>):
    %38 = "amdgpu.make_dma_base"(%arg45, %arg44, %arg46, %arg44) <{operandSegmentSizes = array<i32: 1, 1, 1, 1>}> : (memref<8xi32, #gpu.address_space<global>>, index, memref<8xi32, #gpu.address_space<workgroup>>, index) -> !amdgpu.tdm_base<i32>
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (!amdgpu.tdm_base<i32>, vector<16xi1>, i1, memref<2x!amdgpu.ds_barrier_state, #gpu.address_space<workgroup>>, index, i32) -> (), sym_name = "make_dma_descriptor"}> ({
  ^bb0(%arg38: !amdgpu.tdm_base<i32>, %arg39: vector<16xi1>, %arg40: i1, %arg41: memref<2x!amdgpu.ds_barrier_state, #gpu.address_space<workgroup>>, %arg42: index, %arg43: i32):
    %32 = "amdgpu.make_dma_descriptor"(%arg38) <{global_static_sizes = array<i64: 64, 64>, global_static_strides = array<i64: 64, 1>, operandSegmentSizes = array<i32: 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0>, shared_static_sizes = array<i64: 64, 64>}> : (!amdgpu.tdm_base<i32>) -> !amdgpu.tdm_descriptor
    %33 = "amdgpu.make_dma_descriptor"(%arg38, %arg43, %arg43) <{global_static_sizes = array<i64: 64, 64>, global_static_strides = array<i64: 64, 1>, operandSegmentSizes = array<i32: 1, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0>, shared_static_sizes = array<i64: 64, 64>}> : (!amdgpu.tdm_base<i32>, i32, i32) -> !amdgpu.tdm_descriptor
    %34 = "amdgpu.make_dma_descriptor"(%arg38, %arg39) <{global_static_sizes = array<i64: 64, 64>, global_static_strides = array<i64: 64, 1>, operandSegmentSizes = array<i32: 1, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0>, shared_static_sizes = array<i64: 64, 64>}> : (!amdgpu.tdm_base<i32>, vector<16xi1>) -> !amdgpu.tdm_descriptor
    %35 = "amdgpu.make_dma_descriptor"(%arg38, %arg39, %arg40) <{global_static_sizes = array<i64: 64, 64>, global_static_strides = array<i64: 64, 1>, operandSegmentSizes = array<i32: 1, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0>, shared_static_sizes = array<i64: 64, 64>}> : (!amdgpu.tdm_base<i32>, vector<16xi1>, i1) -> !amdgpu.tdm_descriptor
    %36 = "amdgpu.make_dma_descriptor"(%arg38, %arg41, %arg42) <{global_static_sizes = array<i64: 64, 64>, global_static_strides = array<i64: 64, 1>, operandSegmentSizes = array<i32: 1, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0>, shared_static_sizes = array<i64: 64, 64>}> : (!amdgpu.tdm_base<i32>, memref<2x!amdgpu.ds_barrier_state, #gpu.address_space<workgroup>>, index) -> !amdgpu.tdm_descriptor
    %37 = "amdgpu.make_dma_descriptor"(%arg38, %arg42, %arg43, %arg42) <{global_static_sizes = array<i64: 64, 64>, global_static_strides = array<i64: 64, 1>, operandSegmentSizes = array<i32: 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1>, shared_static_sizes = array<i64: 64, 64>}> : (!amdgpu.tdm_base<i32>, index, i32, index) -> !amdgpu.tdm_descriptor
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<64xf8E4M3FN>, vector<64xf6E3M2FN>, vector<64xf6E2M3FN>, vector<128xf4E2M1FN>, vector<64xf4E2M1FN>, vector<8xf32>, vector<16xf32>, vector<4xf8E8M0FNU>, vector<8xf8E8M0FNU>, vector<4xf8E4M3FN>) -> (), sym_name = "wmma_scale"}> ({
  ^bb0(%arg28: vector<64xf8E4M3FN>, %arg29: vector<64xf6E3M2FN>, %arg30: vector<64xf6E2M3FN>, %arg31: vector<128xf4E2M1FN>, %arg32: vector<64xf4E2M1FN>, %arg33: vector<8xf32>, %arg34: vector<16xf32>, %arg35: vector<4xf8E8M0FNU>, %arg36: vector<8xf8E8M0FNU>, %arg37: vector<4xf8E4M3FN>):
    %26 = "amdgpu.scaled_wmma"(%arg28, %arg28, %arg33, %arg35, %arg35) <{a_first_scale_lane = 0 : i32, b_first_scale_lane = 0 : i32, k = 128 : i32, m = 16 : i32, n = 16 : i32}> : (vector<64xf8E4M3FN>, vector<64xf8E4M3FN>, vector<8xf32>, vector<4xf8E8M0FNU>, vector<4xf8E8M0FNU>) -> vector<8xf32>
    %27 = "amdgpu.scaled_wmma"(%arg29, %arg29, %arg33, %arg35, %arg35) <{a_first_scale_lane = 0 : i32, b_first_scale_lane = 0 : i32, k = 128 : i32, m = 16 : i32, n = 16 : i32}> : (vector<64xf6E3M2FN>, vector<64xf6E3M2FN>, vector<8xf32>, vector<4xf8E8M0FNU>, vector<4xf8E8M0FNU>) -> vector<8xf32>
    %28 = "amdgpu.scaled_wmma"(%arg30, %arg30, %arg33, %arg35, %arg35) <{a_first_scale_lane = 0 : i32, b_first_scale_lane = 0 : i32, k = 128 : i32, m = 16 : i32, n = 16 : i32}> : (vector<64xf6E2M3FN>, vector<64xf6E2M3FN>, vector<8xf32>, vector<4xf8E8M0FNU>, vector<4xf8E8M0FNU>) -> vector<8xf32>
    %29 = "amdgpu.scaled_wmma"(%arg32, %arg30, %arg33, %arg37, %arg35) <{a_first_scale_lane = 0 : i32, b_first_scale_lane = 0 : i32, k = 128 : i32, m = 16 : i32, n = 16 : i32}> : (vector<64xf4E2M1FN>, vector<64xf6E2M3FN>, vector<8xf32>, vector<4xf8E4M3FN>, vector<4xf8E8M0FNU>) -> vector<8xf32>
    %30 = "amdgpu.scaled_wmma"(%arg28, %arg28, %arg33, %arg36, %arg36) <{a_first_scale_lane = 0 : i32, b_first_scale_lane = 0 : i32, k = 128 : i32, m = 16 : i32, n = 16 : i32}> : (vector<64xf8E4M3FN>, vector<64xf8E4M3FN>, vector<8xf32>, vector<8xf8E8M0FNU>, vector<8xf8E8M0FNU>) -> vector<8xf32>
    %31 = "amdgpu.scaled_wmma"(%arg31, %arg32, %arg34, %arg37, %arg37) <{a_first_scale_lane = 0 : i32, b_first_scale_lane = 0 : i32, k = 128 : i32, m = 32 : i32, n = 16 : i32}> : (vector<128xf4E2M1FN>, vector<64xf4E2M1FN>, vector<16xf32>, vector<4xf8E4M3FN>, vector<4xf8E4M3FN>) -> vector<16xf32>
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<256xi8>, vector<256xi8>) -> (), sym_name = "dpp_vector_src_does_not_assert"}> ({
  ^bb0(%arg26: vector<256xi8>, %arg27: vector<256xi8>):
    %25 = "amdgpu.dpp"(%arg27, %arg26) <{bank_mask = 15 : i32, bound_ctrl = false, kind = #amdgpu<dpp_perm row_shl>, permArgument = 1 : i32, row_mask = 15 : i32}> : (vector<256xi8>, vector<256xi8>) -> vector<256xi8>
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (memref<!amdgpu.ds_barrier_state, #gpu.address_space<workgroup>>, i64, i32) -> (), sym_name = "ds_barrier_ops"}> ({
  ^bb0(%arg23: memref<!amdgpu.ds_barrier_state, #gpu.address_space<workgroup>>, %arg24: i64, %arg25: i32):
    "amdgpu.ds_barrier_init"(%arg23, %arg25) : (memref<!amdgpu.ds_barrier_state, #gpu.address_space<workgroup>>, i32) -> ()
    %19 = "amdgpu.ds_barrier_poll_state"(%arg23) : (memref<!amdgpu.ds_barrier_state, #gpu.address_space<workgroup>>) -> !amdgpu.ds_barrier_state
    "amdgpu.ds_async_barrier_arrive"(%arg23) : (memref<!amdgpu.ds_barrier_state, #gpu.address_space<workgroup>>) -> ()
    %20 = "amdgpu.ds_barrier_arrive"(%arg23, %arg24) : (memref<!amdgpu.ds_barrier_state, #gpu.address_space<workgroup>>, i64) -> !amdgpu.ds_barrier_state
    %21 = "amdgpu.ds_barrier_state_phase"(%19) : (!amdgpu.ds_barrier_state) -> i32
    %22 = "amdgpu.ds_barrier_state_pending_count"(%19) : (!amdgpu.ds_barrier_state) -> i32
    %23 = "amdgpu.ds_barrier_state_init_count"(%19) : (!amdgpu.ds_barrier_state) -> i32
    %24 = "amdgpu.ds_barrier_state_phase_parity"(%19) : (!amdgpu.ds_barrier_state) -> i1
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<2xf16>, vector<2xf16>, f32) -> f32, sym_name = "dot_f16_f32"}> ({
  ^bb0(%arg20: vector<2xf16>, %arg21: vector<2xf16>, %arg22: f32):
    %17 = "amdgpu.dot"(%arg20, %arg21, %arg22) : (vector<2xf16>, vector<2xf16>, f32) -> f32
    %18 = "amdgpu.dot"(%arg20, %arg21, %arg22) <{clamp}> : (vector<2xf16>, vector<2xf16>, f32) -> f32
    "func.return"(%17) : (f32) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<2xf16>, vector<2xf16>, f16) -> f16, sym_name = "dot_f16_f16"}> ({
  ^bb0(%arg17: vector<2xf16>, %arg18: vector<2xf16>, %arg19: f16):
    %16 = "amdgpu.dot"(%arg17, %arg18, %arg19) : (vector<2xf16>, vector<2xf16>, f16) -> f16
    "func.return"(%16) : (f16) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<2xbf16>, vector<2xbf16>, f32, bf16) -> (), sym_name = "dot_bf16"}> ({
  ^bb0(%arg13: vector<2xbf16>, %arg14: vector<2xbf16>, %arg15: f32, %arg16: bf16):
    %14 = "amdgpu.dot"(%arg13, %arg14, %arg15) <{clamp}> : (vector<2xbf16>, vector<2xbf16>, f32) -> f32
    %15 = "amdgpu.dot"(%arg13, %arg14, %arg16) : (vector<2xbf16>, vector<2xbf16>, bf16) -> bf16
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<2xi16>, vector<2xi16>, i32) -> i32, sym_name = "dot_i16"}> ({
  ^bb0(%arg10: vector<2xi16>, %arg11: vector<2xi16>, %arg12: i32):
    %11 = "amdgpu.dot"(%arg10, %arg11, %arg12) : (vector<2xi16>, vector<2xi16>, i32) -> i32
    %12 = "amdgpu.dot"(%arg10, %arg11, %arg12) <{clamp}> : (vector<2xi16>, vector<2xi16>, i32) -> i32
    %13 = "amdgpu.dot"(%arg10, %arg11, %arg12) <{unsignedA, unsignedB}> : (vector<2xi16>, vector<2xi16>, i32) -> i32
    "func.return"(%11) : (i32) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<4xi8>, vector<4xi8>, i32) -> i32, sym_name = "dot_i8"}> ({
  ^bb0(%arg7: vector<4xi8>, %arg8: vector<4xi8>, %arg9: i32):
    %7 = "amdgpu.dot"(%arg7, %arg8, %arg9) : (vector<4xi8>, vector<4xi8>, i32) -> i32
    %8 = "amdgpu.dot"(%arg7, %arg8, %arg9) <{clamp, unsignedA, unsignedB}> : (vector<4xi8>, vector<4xi8>, i32) -> i32
    %9 = "amdgpu.dot"(%arg7, %arg8, %arg9) <{unsignedB}> : (vector<4xi8>, vector<4xi8>, i32) -> i32
    %10 = "amdgpu.dot"(%arg7, %arg8, %arg9) <{unsignedA}> : (vector<4xi8>, vector<4xi8>, i32) -> i32
    "func.return"(%7) : (i32) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<8xi4>, vector<8xi4>, i32) -> i32, sym_name = "dot_i4"}> ({
  ^bb0(%arg4: vector<8xi4>, %arg5: vector<8xi4>, %arg6: i32):
    %4 = "amdgpu.dot"(%arg4, %arg5, %arg6) : (vector<8xi4>, vector<8xi4>, i32) -> i32
    %5 = "amdgpu.dot"(%arg4, %arg5, %arg6) <{clamp, unsignedA, unsignedB}> : (vector<8xi4>, vector<8xi4>, i32) -> i32
    %6 = "amdgpu.dot"(%arg4, %arg5, %arg6) <{unsignedA}> : (vector<8xi4>, vector<8xi4>, i32) -> i32
    "func.return"(%4) : (i32) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<4xf8E4M3FN>, vector<4xf8E4M3FN>, vector<4xf8E5M2>, f32) -> f32, sym_name = "dot_fp8"}> ({
  ^bb0(%arg0: vector<4xf8E4M3FN>, %arg1: vector<4xf8E4M3FN>, %arg2: vector<4xf8E5M2>, %arg3: f32):
    %0 = "amdgpu.dot"(%arg0, %arg0, %arg3) : (vector<4xf8E4M3FN>, vector<4xf8E4M3FN>, f32) -> f32
    %1 = "amdgpu.dot"(%arg0, %arg2, %arg3) : (vector<4xf8E4M3FN>, vector<4xf8E5M2>, f32) -> f32
    %2 = "amdgpu.dot"(%arg2, %arg0, %arg3) : (vector<4xf8E5M2>, vector<4xf8E4M3FN>, f32) -> f32
    %3 = "amdgpu.dot"(%arg2, %arg2, %arg3) : (vector<4xf8E5M2>, vector<4xf8E5M2>, f32) -> f32
    "func.return"(%0) : (f32) -> ()
  }) : () -> ()
}) : () -> ()

