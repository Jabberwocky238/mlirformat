"builtin.module"() ({
  "func.func"() <{function_type = (vector<8xf8E4M3FN>) -> (), sym_name = "cvt_float_e4m3fn_to_f16"}> ({
  ^bb0(%arg0: vector<8xf8E4M3FN>):
    %0 = "nvgpu.extf"(%arg0) <{relu = false, rnd = #nvvm.fp_rnd_mode<rn>}> : (vector<8xf8E4M3FN>) -> vector<8xf16>
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (vector<8xf8E5M2>) -> (), sym_name = "cvt_float_e5m2_to_f16"}> ({
  ^bb0(%arg0: vector<8xf8E5M2>):
    %0 = "nvgpu.extf"(%arg0) <{relu = false, rnd = #nvvm.fp_rnd_mode<rn>}> : (vector<8xf8E5M2>) -> vector<8xf16>
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (vector<8xf8E8M0FNU>) -> (), sym_name = "cvt_float_e8m0_to_bf16"}> ({
  ^bb0(%arg0: vector<8xf8E8M0FNU>):
    %0 = "nvgpu.extf"(%arg0) <{relu = false, rnd = #nvvm.fp_rnd_mode<rn>}> : (vector<8xf8E8M0FNU>) -> vector<8xbf16>
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (vector<8xf6E2M3FN>) -> (), sym_name = "cvt_float_e2m3_to_f16"}> ({
  ^bb0(%arg0: vector<8xf6E2M3FN>):
    %0 = "nvgpu.extf"(%arg0) <{relu = false, rnd = #nvvm.fp_rnd_mode<rn>}> : (vector<8xf6E2M3FN>) -> vector<8xf16>
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (vector<8xf6E3M2FN>) -> (), sym_name = "cvt_float_e3m2_to_f16"}> ({
  ^bb0(%arg0: vector<8xf6E3M2FN>):
    %0 = "nvgpu.extf"(%arg0) <{relu = false, rnd = #nvvm.fp_rnd_mode<rn>}> : (vector<8xf6E3M2FN>) -> vector<8xf16>
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (vector<16xf4E2M1FN>) -> (), sym_name = "cvt_float_e2m1_to_f16"}> ({
  ^bb0(%arg0: vector<16xf4E2M1FN>):
    %0 = "nvgpu.extf"(%arg0) <{relu = false, rnd = #nvvm.fp_rnd_mode<rn>}> : (vector<16xf4E2M1FN>) -> vector<16xf16>
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (vector<8xf6E2M3FN>) -> (), sym_name = "cvt_float_e2m3_to_bf16"}> ({
  ^bb0(%arg0: vector<8xf6E2M3FN>):
    %0 = "nvgpu.extf"(%arg0) <{relu = false, rnd = #nvvm.fp_rnd_mode<rn>}> : (vector<8xf6E2M3FN>) -> vector<8xbf16>
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (vector<16xf4E2M1FN>) -> (), sym_name = "cvt_float_e2m1_to_bf16"}> ({
  ^bb0(%arg0: vector<16xf4E2M1FN>):
    %0 = "nvgpu.extf"(%arg0) <{relu = false, rnd = #nvvm.fp_rnd_mode<rn>}> : (vector<16xf4E2M1FN>) -> vector<16xbf16>
    "func.return"() : () -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (vector<4xf8E4M3FN>) -> vector<4xf32>, sym_name = "fpext_e4m3fn_to_f32"}> ({
  ^bb0(%arg0: vector<4xf8E4M3FN>):
    %0 = "nvgpu.extf"(%arg0) <{relu = false, rnd = #nvvm.fp_rnd_mode<rn>}> : (vector<4xf8E4M3FN>) -> vector<4xf32>
    "func.return"(%0) : (vector<4xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (vector<4xf8E5M2>) -> vector<4xf32>, sym_name = "fpext_e5m2_to_f32"}> ({
  ^bb0(%arg0: vector<4xf8E5M2>):
    %0 = "nvgpu.extf"(%arg0) <{relu = false, rnd = #nvvm.fp_rnd_mode<rn>}> : (vector<4xf8E5M2>) -> vector<4xf32>
    "func.return"(%0) : (vector<4xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (vector<4xf8E8M0FNU>) -> vector<4xf32>, sym_name = "fpext_e8m0_to_f32"}> ({
  ^bb0(%arg0: vector<4xf8E8M0FNU>):
    %0 = "nvgpu.extf"(%arg0) <{relu = false, rnd = #nvvm.fp_rnd_mode<rn>}> : (vector<4xf8E8M0FNU>) -> vector<4xf32>
    "func.return"(%0) : (vector<4xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (vector<4xf6E2M3FN>) -> vector<4xf32>, sym_name = "fpext_e2m3_to_f32"}> ({
  ^bb0(%arg0: vector<4xf6E2M3FN>):
    %0 = "nvgpu.extf"(%arg0) <{relu = false, rnd = #nvvm.fp_rnd_mode<rn>}> : (vector<4xf6E2M3FN>) -> vector<4xf32>
    "func.return"(%0) : (vector<4xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (vector<8xf4E2M1FN>) -> vector<8xf32>, sym_name = "fpext_e2m1_to_f32"}> ({
  ^bb0(%arg0: vector<8xf4E2M1FN>):
    %0 = "nvgpu.extf"(%arg0) <{relu = false, rnd = #nvvm.fp_rnd_mode<rn>}> : (vector<8xf4E2M1FN>) -> vector<8xf32>
    "func.return"(%0) : (vector<8xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (vector<4xf16>) -> vector<4xf32>, sym_name = "fpext_f16_to_f32"}> ({
  ^bb0(%arg0: vector<4xf16>):
    %0 = "nvgpu.extf"(%arg0) <{relu = false, rnd = #nvvm.fp_rnd_mode<rn>}> : (vector<4xf16>) -> vector<4xf32>
    "func.return"(%0) : (vector<4xf32>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (vector<4xbf16>) -> vector<4xf32>, sym_name = "fpext_bf16_to_f32"}> ({
  ^bb0(%arg7: vector<4xbf16>):
    %7 = "nvgpu.extf"(%arg7) <{relu = false, rnd = #nvvm.fp_rnd_mode<rn>}> : (vector<4xbf16>) -> vector<4xf32>
    "func.return"(%7) : (vector<4xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<4xf16>) -> vector<4xf64>, sym_name = "fpext_f16_to_f64"}> ({
  ^bb0(%arg6: vector<4xf16>):
    %6 = "nvgpu.extf"(%arg6) <{relu = false, rnd = #nvvm.fp_rnd_mode<rn>}> : (vector<4xf16>) -> vector<4xf64>
    "func.return"(%6) : (vector<4xf64>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<4xbf16>) -> vector<4xf64>, sym_name = "fpext_bf16_to_f64"}> ({
  ^bb0(%arg5: vector<4xbf16>):
    %5 = "nvgpu.extf"(%arg5) <{relu = false, rnd = #nvvm.fp_rnd_mode<rn>}> : (vector<4xbf16>) -> vector<4xf64>
    "func.return"(%5) : (vector<4xf64>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<4xf32>) -> vector<4xf64>, sym_name = "fpext_f32_to_f64"}> ({
  ^bb0(%arg4: vector<4xf32>):
    %4 = "nvgpu.extf"(%arg4) <{relu = false, rnd = #nvvm.fp_rnd_mode<rn>}> : (vector<4xf32>) -> vector<4xf64>
    "func.return"(%4) : (vector<4xf64>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<4xf8E4M3FN>) -> vector<4xf64>, sym_name = "fpext_f8_to_f64"}> ({
  ^bb0(%arg3: vector<4xf8E4M3FN>):
    %3 = "nvgpu.extf"(%arg3) <{relu = false, rnd = #nvvm.fp_rnd_mode<rn>}> : (vector<4xf8E4M3FN>) -> vector<4xf64>
    "func.return"(%3) : (vector<4xf64>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<8xf4E2M1FN>) -> vector<8xf64>, sym_name = "fpext_f4_to_f64"}> ({
  ^bb0(%arg2: vector<8xf4E2M1FN>):
    %2 = "nvgpu.extf"(%arg2) <{relu = false, rnd = #nvvm.fp_rnd_mode<rn>}> : (vector<8xf4E2M1FN>) -> vector<8xf64>
    "func.return"(%2) : (vector<8xf64>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<4xf6E2M3FN>) -> vector<4xf64>, sym_name = "fpext_e2m3_to_f64"}> ({
  ^bb0(%arg1: vector<4xf6E2M3FN>):
    %1 = "nvgpu.extf"(%arg1) <{relu = false, rnd = #nvvm.fp_rnd_mode<rn>}> : (vector<4xf6E2M3FN>) -> vector<4xf64>
    "func.return"(%1) : (vector<4xf64>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (f8E4M3FN) -> f16, sym_name = "fpext_scalar_f8_to_f16"}> ({
  ^bb0(%arg0: f8E4M3FN):
    %0 = "nvgpu.extf"(%arg0) <{relu = false, rnd = #nvvm.fp_rnd_mode<rn>}> : (f8E4M3FN) -> f16
    "func.return"(%0) : (f16) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (f8E4M3FN) -> f32, sym_name = "fpext_scalar_f8_to_f32"}> ({
  ^bb0(%arg1: f8E4M3FN):
    %1 = "nvgpu.extf"(%arg1) <{relu = false, rnd = #nvvm.fp_rnd_mode<rn>}> : (f8E4M3FN) -> f32
    "func.return"(%1) : (f32) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<2x4xf8E4M3FN>) -> vector<2x4xf16>, sym_name = "fpext_v2x4_f8_to_f16"}> ({
  ^bb0(%arg0: vector<2x4xf8E4M3FN>):
    %0 = "nvgpu.extf"(%arg0) <{relu = false, rnd = #nvvm.fp_rnd_mode<rn>}> : (vector<2x4xf8E4M3FN>) -> vector<2x4xf16>
    "func.return"(%0) : (vector<2x4xf16>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (vector<2x4xf8E4M3FN>) -> vector<2x4xf32>, sym_name = "fpext_v2x4_f8_to_f32"}> ({
  ^bb0(%arg1: vector<2x4xf8E4M3FN>):
    %1 = "nvgpu.extf"(%arg1) <{relu = false, rnd = #nvvm.fp_rnd_mode<rn>}> : (vector<2x4xf8E4M3FN>) -> vector<2x4xf32>
    "func.return"(%1) : (vector<2x4xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<3xf8E5M2>) -> vector<3xf16>, sym_name = "fpext_v3f8_to_v3f16"}> ({
  ^bb0(%arg0: vector<3xf8E5M2>):
    %0 = "nvgpu.extf"(%arg0) <{relu = false, rnd = #nvvm.fp_rnd_mode<rn>}> : (vector<3xf8E5M2>) -> vector<3xf16>
    "func.return"(%0) : (vector<3xf16>) -> ()
  }) : () -> ()
}) : () -> ()

// -----
"builtin.module"() ({
  "func.func"() <{function_type = (vector<3xf8E5M2>) -> vector<3xf32>, sym_name = "fpext_v3_f8_to_f32"}> ({
  ^bb0(%arg8: vector<3xf8E5M2>):
    %8 = "nvgpu.extf"(%arg8) <{relu = false, rnd = #nvvm.fp_rnd_mode<rn>}> : (vector<3xf8E5M2>) -> vector<3xf32>
    "func.return"(%8) : (vector<3xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<3x1xf8E4M3FN>) -> vector<3x1xf16>, sym_name = "fpext_v3x1_f8_to_f16"}> ({
  ^bb0(%arg7: vector<3x1xf8E4M3FN>):
    %7 = "nvgpu.extf"(%arg7) <{relu = false, rnd = #nvvm.fp_rnd_mode<rn>}> : (vector<3x1xf8E4M3FN>) -> vector<3x1xf16>
    "func.return"(%7) : (vector<3x1xf16>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<8xf8E4M3FN>) -> (), sym_name = "fpext_f8_to_f16_relu"}> ({
  ^bb0(%arg6: vector<8xf8E4M3FN>):
    %6 = "nvgpu.extf"(%arg6) <{relu = true, rnd = #nvvm.fp_rnd_mode<rn>}> : (vector<8xf8E4M3FN>) -> vector<8xf16>
    "func.return"() : () -> ()
  }) : () -> ()
  "func.func"() <{function_type = (f8E4M3FN) -> f16, sym_name = "e2e_scalar_f8_to_f16"}> ({
  ^bb0(%arg5: f8E4M3FN):
    %5 = "nvgpu.extf"(%arg5) <{relu = false, rnd = #nvvm.fp_rnd_mode<rn>}> : (f8E4M3FN) -> f16
    "func.return"(%5) : (f16) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<2x4xf8E4M3FN>) -> vector<2x4xf16>, sym_name = "e2e_v2x4_f8_to_f16"}> ({
  ^bb0(%arg4: vector<2x4xf8E4M3FN>):
    %4 = "nvgpu.extf"(%arg4) <{relu = false, rnd = #nvvm.fp_rnd_mode<rn>}> : (vector<2x4xf8E4M3FN>) -> vector<2x4xf16>
    "func.return"(%4) : (vector<2x4xf16>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<3xf8E5M2>) -> vector<3xf16>, sym_name = "e2e_v3f8_to_v3f16"}> ({
  ^bb0(%arg3: vector<3xf8E5M2>):
    %3 = "nvgpu.extf"(%arg3) <{relu = false, rnd = #nvvm.fp_rnd_mode<rn>}> : (vector<3xf8E5M2>) -> vector<3xf16>
    "func.return"(%3) : (vector<3xf16>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (f8E4M3FN) -> f32, sym_name = "e2e_scalar_f8_to_f32"}> ({
  ^bb0(%arg2: f8E4M3FN):
    %2 = "nvgpu.extf"(%arg2) <{relu = false, rnd = #nvvm.fp_rnd_mode<rn>}> : (f8E4M3FN) -> f32
    "func.return"(%2) : (f32) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<2x4xf8E4M3FN>) -> vector<2x4xf32>, sym_name = "e2e_v2x4_f8_to_f32"}> ({
  ^bb0(%arg1: vector<2x4xf8E4M3FN>):
    %1 = "nvgpu.extf"(%arg1) <{relu = false, rnd = #nvvm.fp_rnd_mode<rn>}> : (vector<2x4xf8E4M3FN>) -> vector<2x4xf32>
    "func.return"(%1) : (vector<2x4xf32>) -> ()
  }) : () -> ()
  "func.func"() <{function_type = (vector<3xf8E5M2>) -> vector<3xf32>, sym_name = "e2e_v3f8_to_v3f32"}> ({
  ^bb0(%arg0: vector<3xf8E5M2>):
    %0 = "nvgpu.extf"(%arg0) <{relu = false, rnd = #nvvm.fp_rnd_mode<rn>}> : (vector<3xf8E5M2>) -> vector<3xf32>
    "func.return"(%0) : (vector<3xf32>) -> ()
  }) : () -> ()
}) : () -> ()

