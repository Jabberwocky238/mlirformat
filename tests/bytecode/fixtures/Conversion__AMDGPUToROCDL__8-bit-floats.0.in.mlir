"builtin.module"() ({
  "func.func"() <{function_type = (f8E5M2FNUZ) -> f32, sym_name = "ext_scalar"}> ({
  ^bb0(%arg15: f8E5M2FNUZ loc("<stdin>":3:8)):
    %9 = "amdgpu.ext_packed_fp8"(%arg15) <{index = 0 : i32}> : (f8E5M2FNUZ) -> f32 loc("<stdin>":4:10)
    "func.return"(%9) : (f32) -> () loc("<stdin>":5:5)
  }) : () -> () loc("<stdin>":2:3)
  "func.func"() <{function_type = (vector<2xf8E4M3FNUZ>) -> f32, sym_name = "ext_short_vec"}> ({
  ^bb0(%arg14: vector<2xf8E4M3FNUZ> loc("<stdin>":8:8)):
    %8 = "amdgpu.ext_packed_fp8"(%arg14) <{index = 1 : i32}> : (vector<2xf8E4M3FNUZ>) -> f32 loc("<stdin>":9:10)
    "func.return"(%8) : (f32) -> () loc("<stdin>":10:5)
  }) : () -> () loc("<stdin>":7:3)
  "func.func"() <{function_type = (vector<4xf8E4M3FNUZ>) -> f32, sym_name = "ext_full_vec"}> ({
  ^bb0(%arg13: vector<4xf8E4M3FNUZ> loc("<stdin>":13:8)):
    %7 = "amdgpu.ext_packed_fp8"(%arg13) <{index = 3 : i32}> : (vector<4xf8E4M3FNUZ>) -> f32 loc("<stdin>":14:10)
    "func.return"(%7) : (f32) -> () loc("<stdin>":15:5)
  }) : () -> () loc("<stdin>":12:3)
  "func.func"() <{function_type = (vector<2xf8E4M3FNUZ>) -> vector<2xf32>, sym_name = "ext_packed_2xfp8"}> ({
  ^bb0(%arg12: vector<2xf8E4M3FNUZ> loc("<stdin>":18:8)):
    %6 = "amdgpu.ext_packed_fp8"(%arg12) <{index = 0 : i32}> : (vector<2xf8E4M3FNUZ>) -> vector<2xf32> loc("<stdin>":19:10)
    "func.return"(%6) : (vector<2xf32>) -> () loc("<stdin>":20:5)
  }) : () -> () loc("<stdin>":17:3)
  "func.func"() <{function_type = (vector<4xf8E4M3FNUZ>) -> vector<2xf32>, sym_name = "ext_packed_4xfp8"}> ({
  ^bb0(%arg11: vector<4xf8E4M3FNUZ> loc("<stdin>":23:8)):
    %5 = "amdgpu.ext_packed_fp8"(%arg11) <{index = 1 : i32}> : (vector<4xf8E4M3FNUZ>) -> vector<2xf32> loc("<stdin>":24:10)
    "func.return"(%5) : (vector<2xf32>) -> () loc("<stdin>":25:5)
  }) : () -> () loc("<stdin>":22:3)
  "func.func"() <{function_type = (f32) -> vector<4xf8E4M3FNUZ>, sym_name = "packed_trunc"}> ({
  ^bb0(%arg10: f32 loc("<stdin>":28:8)):
    %4 = "amdgpu.packed_trunc_2xfp8"(%arg10) <{operandSegmentSizes = array<i32: 1, 0, 0>, wordIndex = 0 : i32}> : (f32) -> vector<4xf8E4M3FNUZ> loc("<stdin>":29:10)
    "func.return"(%4) : (vector<4xf8E4M3FNUZ>) -> () loc("<stdin>":30:5)
  }) : () -> () loc("<stdin>":27:3)
  "func.func"() <{function_type = (f32, f32) -> vector<4xf8E4M3FNUZ>, sym_name = "packed_truncx2"}> ({
  ^bb0(%arg8: f32 loc("<stdin>":33:8), %arg9: f32 loc("<stdin>":33:20)):
    %3 = "amdgpu.packed_trunc_2xfp8"(%arg8, %arg9) <{operandSegmentSizes = array<i32: 1, 1, 0>, wordIndex = 0 : i32}> : (f32, f32) -> vector<4xf8E4M3FNUZ> loc("<stdin>":34:10)
    "func.return"(%3) : (vector<4xf8E4M3FNUZ>) -> () loc("<stdin>":35:5)
  }) : () -> () loc("<stdin>":32:3)
  "func.func"() <{function_type = (f32, f32, vector<4xf8E5M2FNUZ>) -> vector<4xf8E5M2FNUZ>, sym_name = "packed_truncx2_into"}> ({
  ^bb0(%arg5: f32 loc("<stdin>":38:8), %arg6: f32 loc("<stdin>":38:20), %arg7: vector<4xf8E5M2FNUZ> loc("<stdin>":38:32)):
    %2 = "amdgpu.packed_trunc_2xfp8"(%arg5, %arg6, %arg7) <{operandSegmentSizes = array<i32: 1, 1, 1>, wordIndex = 1 : i32}> : (f32, f32, vector<4xf8E5M2FNUZ>) -> vector<4xf8E5M2FNUZ> loc("<stdin>":39:10)
    "func.return"(%2) : (vector<4xf8E5M2FNUZ>) -> () loc("<stdin>":40:5)
  }) : () -> () loc("<stdin>":37:3)
  "func.func"() <{function_type = (f32, i32) -> vector<4xf8E4M3FNUZ>, sym_name = "packed_stoch_round"}> ({
  ^bb0(%arg3: f32 loc("<stdin>":43:8), %arg4: i32 loc("<stdin>":43:20)):
    %1 = "amdgpu.packed_stoch_round_fp8"(%arg3, %arg4) <{storeIndex = 0 : i32}> : (f32, i32) -> vector<4xf8E4M3FNUZ> loc("<stdin>":44:10)
    "func.return"(%1) : (vector<4xf8E4M3FNUZ>) -> () loc("<stdin>":45:5)
  }) : () -> () loc("<stdin>":42:3)
  "func.func"() <{function_type = (f32, i32, vector<4xf8E5M2FNUZ>) -> vector<4xf8E5M2FNUZ>, sym_name = "packed_stoch_round_into"}> ({
  ^bb0(%arg0: f32 loc("<stdin>":48:8), %arg1: i32 loc("<stdin>":48:20), %arg2: vector<4xf8E5M2FNUZ> loc("<stdin>":48:32)):
    %0 = "amdgpu.packed_stoch_round_fp8"(%arg0, %arg1, %arg2) <{storeIndex = 1 : i32}> : (f32, i32, vector<4xf8E5M2FNUZ>) -> vector<4xf8E5M2FNUZ> loc("<stdin>":49:10)
    "func.return"(%0) : (vector<4xf8E5M2FNUZ>) -> () loc("<stdin>":50:5)
  }) : () -> () loc("<stdin>":47:3)
}) : () -> () loc("<stdin>":1:1)
