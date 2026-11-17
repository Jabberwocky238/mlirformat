"builtin.module"() ({
  "func.func"() <{function_type = (vector<2xf16>, vector<2xf16>, f16) -> f16, sym_name = "dot_fdot2_f16_f16"}> ({
  ^bb0(%arg18: vector<2xf16> loc("<stdin>":3:8), %arg19: vector<2xf16> loc("<stdin>":3:31), %arg20: f16 loc("<stdin>":3:54)):
    %6 = "amdgpu.dot"(%arg18, %arg19, %arg20) : (vector<2xf16>, vector<2xf16>, f16) -> f16 loc("<stdin>":4:10)
    "func.return"(%6) : (f16) -> () loc("<stdin>":5:5)
  }) : () -> () loc("<stdin>":2:3)
  "func.func"() <{function_type = (vector<2xbf16>, vector<2xbf16>, bf16) -> bf16, sym_name = "dot_fdot2_bf16_bf16"}> ({
  ^bb0(%arg15: vector<2xbf16> loc("<stdin>":8:8), %arg16: vector<2xbf16> loc("<stdin>":8:32), %arg17: bf16 loc("<stdin>":8:56)):
    %5 = "amdgpu.dot"(%arg15, %arg16, %arg17) : (vector<2xbf16>, vector<2xbf16>, bf16) -> bf16 loc("<stdin>":9:10)
    "func.return"(%5) : (bf16) -> () loc("<stdin>":10:5)
  }) : () -> () loc("<stdin>":7:3)
  "func.func"() <{function_type = (vector<2xbf16>, vector<2xbf16>, f32) -> f32, sym_name = "dot_fdot2_f32_bf16"}> ({
  ^bb0(%arg12: vector<2xbf16> loc("<stdin>":13:8), %arg13: vector<2xbf16> loc("<stdin>":13:32), %arg14: f32 loc("<stdin>":13:56)):
    %4 = "amdgpu.dot"(%arg12, %arg13, %arg14) : (vector<2xbf16>, vector<2xbf16>, f32) -> f32 loc("<stdin>":14:10)
    "func.return"(%4) : (f32) -> () loc("<stdin>":15:5)
  }) : () -> () loc("<stdin>":12:3)
  "func.func"() <{function_type = (vector<4xi8>, vector<4xi8>, i32) -> i32, sym_name = "dot_sdot4_gfx11_uniform_sign"}> ({
  ^bb0(%arg9: vector<4xi8> loc("<stdin>":18:8), %arg10: vector<4xi8> loc("<stdin>":18:29), %arg11: i32 loc("<stdin>":18:51)):
    %3 = "amdgpu.dot"(%arg9, %arg10, %arg11) : (vector<4xi8>, vector<4xi8>, i32) -> i32 loc("<stdin>":19:10)
    "func.return"(%3) : (i32) -> () loc("<stdin>":20:5)
  }) : () -> () loc("<stdin>":17:3)
  "func.func"() <{function_type = (vector<4xi8>, vector<4xi8>, i32) -> i32, sym_name = "dot_sudot4_signA_unsignedB"}> ({
  ^bb0(%arg6: vector<4xi8> loc("<stdin>":23:8), %arg7: vector<4xi8> loc("<stdin>":23:29), %arg8: i32 loc("<stdin>":23:50)):
    %2 = "amdgpu.dot"(%arg6, %arg7, %arg8) <{unsignedB}> : (vector<4xi8>, vector<4xi8>, i32) -> i32 loc("<stdin>":24:10)
    "func.return"(%2) : (i32) -> () loc("<stdin>":25:5)
  }) : () -> () loc("<stdin>":22:3)
  "func.func"() <{function_type = (vector<4xi8>, vector<4xi8>, i32) -> i32, sym_name = "dot_sudot4_unsignedA_signB_clamp"}> ({
  ^bb0(%arg3: vector<4xi8> loc("<stdin>":28:8), %arg4: vector<4xi8> loc("<stdin>":28:29), %arg5: i32 loc("<stdin>":28:50)):
    %1 = "amdgpu.dot"(%arg3, %arg4, %arg5) <{clamp, unsignedA}> : (vector<4xi8>, vector<4xi8>, i32) -> i32 loc("<stdin>":29:10)
    "func.return"(%1) : (i32) -> () loc("<stdin>":30:5)
  }) : () -> () loc("<stdin>":27:3)
  "func.func"() <{function_type = (vector<8xi4>, vector<8xi4>, i32) -> i32, sym_name = "dot_sudot8"}> ({
  ^bb0(%arg0: vector<8xi4> loc("<stdin>":33:8), %arg1: vector<8xi4> loc("<stdin>":33:29), %arg2: i32 loc("<stdin>":33:50)):
    %0 = "amdgpu.dot"(%arg0, %arg1, %arg2) <{unsignedB}> : (vector<8xi4>, vector<8xi4>, i32) -> i32 loc("<stdin>":34:10)
    "func.return"(%0) : (i32) -> () loc("<stdin>":35:5)
  }) : () -> () loc("<stdin>":32:3)
}) : () -> () loc("<stdin>":1:1)
