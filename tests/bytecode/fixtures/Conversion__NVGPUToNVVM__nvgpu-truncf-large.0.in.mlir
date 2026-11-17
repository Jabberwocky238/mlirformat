"builtin.module"() ({
  "func.func"() <{function_type = (vector<400xf32>) -> vector<400xf16>, sym_name = "cvt_large_f32_to_f16"}> ({
  ^bb0(%arg6: vector<400xf32> loc("<stdin>":3:8)):
    %6 = "nvgpu.truncf"(%arg6) <{relu = false, rnd = #nvvm.fp_rnd_mode<rn>, sat = #nvvm.sat_mode<satfinite>}> : (vector<400xf32>) -> vector<400xf16> loc("<stdin>":4:10)
    "func.return"(%6) : (vector<400xf16>) -> () loc("<stdin>":5:5)
  }) : () -> () loc("<stdin>":2:3)
  "func.func"() <{function_type = (vector<400xf32>) -> vector<400xbf16>, sym_name = "cvt_large_f32_to_bf16"}> ({
  ^bb0(%arg5: vector<400xf32> loc("<stdin>":8:8)):
    %5 = "nvgpu.truncf"(%arg5) <{relu = false, rnd = #nvvm.fp_rnd_mode<rn>, sat = #nvvm.sat_mode<satfinite>}> : (vector<400xf32>) -> vector<400xbf16> loc("<stdin>":9:10)
    "func.return"(%5) : (vector<400xbf16>) -> () loc("<stdin>":10:5)
  }) : () -> () loc("<stdin>":7:3)
  "func.func"() <{function_type = (vector<400xf32>) -> vector<400xf8E4M3FN>, sym_name = "cvt_large_f32_to_f8"}> ({
  ^bb0(%arg4: vector<400xf32> loc("<stdin>":13:8)):
    %4 = "nvgpu.truncf"(%arg4) <{relu = false, rnd = #nvvm.fp_rnd_mode<rn>, sat = #nvvm.sat_mode<satfinite>}> : (vector<400xf32>) -> vector<400xf8E4M3FN> loc("<stdin>":14:10)
    "func.return"(%4) : (vector<400xf8E4M3FN>) -> () loc("<stdin>":15:5)
  }) : () -> () loc("<stdin>":12:3)
  "func.func"() <{function_type = (vector<400xf32>) -> vector<400xf6E2M3FN>, sym_name = "cvt_large_f32_to_f6"}> ({
  ^bb0(%arg3: vector<400xf32> loc("<stdin>":18:8)):
    %3 = "nvgpu.truncf"(%arg3) <{relu = false, rnd = #nvvm.fp_rnd_mode<rn>, sat = #nvvm.sat_mode<satfinite>}> : (vector<400xf32>) -> vector<400xf6E2M3FN> loc("<stdin>":19:10)
    "func.return"(%3) : (vector<400xf6E2M3FN>) -> () loc("<stdin>":20:5)
  }) : () -> () loc("<stdin>":17:3)
  "func.func"() <{function_type = (vector<400xf32>) -> vector<400xf4E2M1FN>, sym_name = "cvt_large_f32_to_f4"}> ({
  ^bb0(%arg2: vector<400xf32> loc("<stdin>":23:8)):
    %2 = "nvgpu.truncf"(%arg2) <{relu = false, rnd = #nvvm.fp_rnd_mode<rn>, sat = #nvvm.sat_mode<satfinite>}> : (vector<400xf32>) -> vector<400xf4E2M1FN> loc("<stdin>":24:10)
    "func.return"(%2) : (vector<400xf4E2M1FN>) -> () loc("<stdin>":25:5)
  }) : () -> () loc("<stdin>":22:3)
  "func.func"() <{function_type = (vector<400xf16>) -> vector<400xf8E4M3FN>, sym_name = "cvt_large_f16_to_f8"}> ({
  ^bb0(%arg1: vector<400xf16> loc("<stdin>":28:8)):
    %1 = "nvgpu.truncf"(%arg1) <{relu = false, rnd = #nvvm.fp_rnd_mode<rn>, sat = #nvvm.sat_mode<satfinite>}> : (vector<400xf16>) -> vector<400xf8E4M3FN> loc("<stdin>":29:10)
    "func.return"(%1) : (vector<400xf8E4M3FN>) -> () loc("<stdin>":30:5)
  }) : () -> () loc("<stdin>":27:3)
  "func.func"() <{function_type = (vector<400xbf16>) -> vector<400xf6E3M2FN>, sym_name = "cvt_large_bf16_to_f6"}> ({
  ^bb0(%arg0: vector<400xbf16> loc("<stdin>":33:8)):
    %0 = "nvgpu.truncf"(%arg0) <{relu = false, rnd = #nvvm.fp_rnd_mode<rn>, sat = #nvvm.sat_mode<satfinite>}> : (vector<400xbf16>) -> vector<400xf6E3M2FN> loc("<stdin>":34:10)
    "func.return"(%0) : (vector<400xf6E3M2FN>) -> () loc("<stdin>":35:5)
  }) : () -> () loc("<stdin>":32:3)
}) : () -> () loc("<stdin>":1:1)
